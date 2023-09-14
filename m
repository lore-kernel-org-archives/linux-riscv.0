Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6C5EDE9A8
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+52KzZtWoXDkmVb0n4o6UxTgyWgp/ICnY/6mbuKEimU=; b=JYghKSNJMX7qSJ
	QlPFMcjSQU2WDz0kzqKpwu5YyMfxK1JIdG+znf9igHwbAlUTnQSsCU17hB+R1GzZiETDcNHfoiBJx
	c1t3ISjAOlIBb6qzuausQD5D4PPdaNbd22ox3jWGrRQ9rv0a9C7cpwXQjM0/N+ayqb34lJ+BK6RQh
	VUk5gd/mJTLFnJEq2IWp3zGsnNXP93afzz+GGeXJJKDjcCwvUywBEvQub+68lHOH15WupMQObsL7j
	kkw4QG0jxdavaoUjKLI84qmEzo1eJVTKPTdIwsxu3kBg5jZ+jrz65KGVl8Lg93KzCJNpH+6AG4Qct
	x+bkR35jIWFh9f7kjhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkpn-008GZj-1W;
	Thu, 14 Sep 2023 11:48:35 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkpj-008GXo-1P;
	Thu, 14 Sep 2023 11:48:32 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmbBn3SgHz67SFB;
	Thu, 14 Sep 2023 19:46:41 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 12:48:26 +0100
Date: Thu, 14 Sep 2023 12:48:25 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: James Morse <james.morse@arm.com>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 10/35] riscv: Switch over to GENERIC_CPU_DEVICES
Message-ID: <20230914124825.0000209f@Huawei.com>
In-Reply-To: <ZQLaq0/qyXdJWbLq@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-11-james.morse@arm.com>
	<ZQLaq0/qyXdJWbLq@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_044831_613182_8465822C 
X-CRM114-Status: GOOD (  12.50  )
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

On Thu, 14 Sep 2023 11:04:27 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Sep 13, 2023 at 04:37:58PM +0000, James Morse wrote:
> > Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
> > overridden by the arch code, switch over to this to allow common code
> > to choose when the register_cpu() call is made.
> > 
> > This allows topology_init() to be removed.
> > 
> > This is an intermediate step to the logic being moved to drivers/acpi,
> > where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>  
> 
> ... and same concern as the previous patch.
> 

Agreed - with that note added, this one looks simple.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
