Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20956C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eu7TlpHOK7HuG4s0ivg/qq/Sd/sHvnkWXN7Sc1k/tQ=; b=ZqnlHd/7Dv9Iqd
	xmxzegKlEBEbhlpoE1O0lj2eMdmuqD0fULY6isGZt32u0+LdwW89YrdPsLhMMi92uF/cPujJrW6I2
	T/PtMu2O+mz7cPOPQi/5kx4SoPfB/XUy/eG3o8LAwipTaM5Rog0ryfNA3RGZaIXRJSXjR3Y6lbdsx
	Q0hGJ9ki+Mq1idxl59jRXK/XqU3gmBOvpIor4Kqra4vgbbOTegXFpuERUhP4GaIGi8UCSEyMl/LcO
	NSHjjWkJMxIiKPzgtmXAMYNSbTUWl49N4YAagyNJge5nPa6Qf+Trr07yB5EQH75t0evTS8p2w2wU7
	WFzwyxUCAkWG2F42WaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpf6-000we0-0n;
	Thu, 14 Dec 2023 17:38:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpf2-000wcN-24;
	Thu, 14 Dec 2023 17:38:13 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Srfdz0hkkz6K7hC;
	Fri, 15 Dec 2023 01:36:07 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EA1D140F82;
	Fri, 15 Dec 2023 01:38:04 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Dec
 2023 17:38:03 +0000
Date: Thu, 14 Dec 2023 17:38:02 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 04/21] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
Message-ID: <20231214173802.000001fb@Huawei.com>
In-Reply-To: <E1rDOg7-00Dvjq-VZ@rmk-PC.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOg7-00Dvjq-VZ@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_093812_818872_FDEF312D 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Dec 2023 12:49:31 +0000
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: James Morse <james.morse@arm.com>
> 
> To allow ACPI to skip the call to arch_register_cpu() when the _STA
> value indicates the CPU can't be brought online right now, move the
> arch_register_cpu() call into acpi_processor_get_info().
> 
> Systems can still be booted with 'acpi=off', or not include an
> ACPI description at all. For these, the CPUs continue to be
> registered by cpu_dev_register_generic().
> 
> This moves the CPU register logic back to a subsys_initcall(),
> while the memory nodes will have been registered earlier.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
LGTM as well.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
