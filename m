Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E922F33A7B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQ/V/XkTATob/8ViuAdzImJJ8lLPJS2lkRqRzZrcYvE=; b=Br7id6ktJ6bdm5
	UaL/KdsjPH/ctaOR1sFJetWZOZxj4a4IeONTJcfRYk6QSnOYtXFJPrhnBySQV7PSY1kzdRbXCPlg5
	/n3sywNNQdmyNkC1ocSesGOIw/PeS540jK8dE1aWn2OdRAh5NmJ+eHm+LdFO3GoXzjPnNwGBntC6N
	vgsF13W+2k/Lu9kNaT7qZttmD2/HCm27QyseZFQg4zYkZzc0SKiPIpsOcKRxUVdwOkExgAilXIyLO
	wHqHQWUJ6CA33Un0pqDo9GQ/IWpdhQz34a8HXnnmCHdX7GG3ilceFNm+pE22kHzgLSHGNbtLAfuoh
	njMWjp+EgmYXgd1Mer6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyA5i-000000024XG-3NgM;
	Thu, 05 Mar 2026 14:54:18 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyA5e-000000024WX-3hnb;
	Thu, 05 Mar 2026 14:54:17 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fRXb85pd4zHnGkd;
	Thu,  5 Mar 2026 22:53:08 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id A5CEC4056B;
	Thu,  5 Mar 2026 22:54:06 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Mar
 2026 14:54:04 +0000
Date: Thu, 5 Mar 2026 14:54:03 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: fengchengwen <fengchengwen@huawei.com>
Subject: Re: [PATCH v2] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
Message-ID: <20260305145403.0000394e@huawei.com>
In-Reply-To: <795a9167-6c49-4c7c-9a36-385bf543cacf@huawei.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
	<20260305083650.54611-1-fengchengwen@huawei.com>
	<CAAhV-H4xZsyLdzswPxPGHoQNd4LKXrTOL-oPGZHyVt8dj0xu6A@mail.gmail.com>
	<795a9167-6c49-4c7c-9a36-385bf543cacf@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_065415_101424_5AEBA04A 
X-CRM114-Status: UNSURE (   8.35  )
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
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>, x86@kernel.org, liuyonglong@huawei.com, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric Van Tassell <Eric.VanTassell@amd.com>, Somnath Kotur <somnath.kotur@broadcom.com>, jeremy.linton@arm.com, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, wangliupu@loongson.cn, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, wei.huang2@amd.com, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, bhelgaas@google.com, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, sunilvl@oss.qualcomm.com, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, chenhuacai@loongson.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


> >> +       ret = acpi_get_cpu_acpi_id(cpu);  
> > Can we use get_acpi_id_for_cpu() directly? Then just x86 needs a wrapper.  
> 
> Yes, it indeed simple.
> 
> But I prefer to have the acpi_ prefix for such API names because it's a cross-subsystem API reference.

Can we just do a global rename of get_acpi_id_for_cpu() as a precursor
patch?  Then this just becomes adding x86 implementation and using
it on all architectures.

J



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
