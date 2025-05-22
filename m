Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C18AC54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Afa/FBnahut4WJhr2JhPzan9HTIJynszdS4giowSIys=; b=OYnE+LoJrFGpJUoMTQN5Tp7fdt
	u5wPxWPH/Z4LnEWHabTO6MUVci0ojaXDal4wMEv5o0OUm3DkIUxccOfl5lCutQP4pWW+lstZL+zRb
	IxepzcPJ6bIZ8+nABsPFB0CVrGPZbhRSq3lhWTYPZ2kKz4XYWmpiNAIxuxD+pSeUJZDcMUu872paJ
	NBNs/pb6p/27wRYx3OnYhgzTul6eR4SQAQvXANTFCYCsBNGlYob8cHt1zQ9gJs++Mw8nD8/oNBtZB
	1G69Mfhit+B46apqY7CAliDYWEvlMoTJtdZWKj7O4bra6N/1osT+8Z2cKlVsabzOKjS+SCwmPxqje
	Z30q+XNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICBX-000000025kL-1BYZ;
	Thu, 22 May 2025 20:06:35 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICA2-000000025S4-0htZ
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 20:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747944264; x=1748549064; i=w_armin@gmx.de;
	bh=BfB9dL1BZc9EG3FvzEB/uXREN3ou+pmHQVviuUcsm4U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BgNGH79U55nM8zUb/q8drRAtlHqA3Lpf77U3IhV/F7VJAAEBZWDcHXccFMJgig/4
	 dS+JFg8hcRCK/j24RCNP3UqoasBYhwIcLTREaawCxxcy/oJodZJ2ME+e6Q+naDgif
	 26AUEY4IeJgHnXdxLH1BoYlnphFAYlmKq0M3aFH8DnsEtYpc1bWo8VQCrz8YX+G/J
	 YnWehMlb2YRMfhxZJOa4qtbUoWq0WpXy3NAarnAaxM1a4UQ44QMsWeMEVvTw/m4VE
	 RcoMqt4TfegbUI+uMs1xfd2k2EfvaRo6MLh28iLp/+WvxBmaTsAlPurLN4cOiq4ae
	 P4OIzMaYTGGR7NjkGA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Vi-1v2NrU2dQW-014x44; Thu, 22
 May 2025 22:04:24 +0200
Message-ID: <91458376-dfc7-46fc-8523-aa176907d703@gmx.de>
Date: Thu, 22 May 2025 22:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi
 platforms
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Arnd Bergmann <arnd@arndb.de>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250522141410.31315-1-alexghiti@rivosinc.com>
X-Provags-ID: V03:K1:NTRHH5PMFLIutW5BfrfopU/f8rUa+sK5VihkqKAXFj9HjA48cg+
 wanM72DxYHMj+d1u7zgv4yQjFNFa0RkzGLJ106jEt9z7gnHIwb8qKvn5pCemK+yrFZQpGBB
 m0jpN0pLCFlPKvNcygasmRbju2aU6ak//8ePDjggBaP7prMssLuSNIWfxh/0ZPqWyk8wo6H
 I7jHEHpYqFwOUy8J5D+yA==
UI-OutboundReport: notjunk:1;M01:P0:dKmvU3GXqqo=;z6HbBYWva0ByrtseS5PN6+K67Nw
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_130502_511429_170377B3 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am 22.05.25 um 16:13 schrieb Alexandre Ghiti:

> The platform profile driver is loaded even on platforms that do not have
> acpi enabled. The initialization of the sysfs entries was recently moved
> from platform_profile_register() to the module init call, and those
> entries need acpi_kobj to be initialized which is not the case when acpi
> is disabled.
>
> This results in the following warning:
>
>   WARNING: CPU: 5 PID: 1 at fs/sysfs/group.c:131 internal_create_group+0xa22/0xdd8
>   Modules linked in:
>   CPU: 5 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.15.0-rc7-dirty #6 PREEMPT
>   Tainted: [W]=WARN
>   Hardware name: riscv-virtio,qemu (DT)
>   epc : internal_create_group+0xa22/0xdd8
>    ra : internal_create_group+0xa22/0xdd8
>
>   Call Trace:
>
>   internal_create_group+0xa22/0xdd8
>   sysfs_create_group+0x22/0x2e
>   platform_profile_init+0x74/0xb2
>   do_one_initcall+0x198/0xa9e
>   kernel_init_freeable+0x6d8/0x780
>   kernel_init+0x28/0x24c
>   ret_from_fork+0xe/0x18
>
> Fix this by checking if acpi is enabled before trying to create sysfs
> entries.

I already submitted a patch for this problem (see https://lore.kernel.org/linux-acpi/a6d92cdd-4dc3-4080-9ed9-5b1f02f247e0@gmx.de/T/)
that only disables the legacy sysfs interface while keeping the class-based interface functional
as it does not depend on ACPI at all.

Thank,
Armin Wolf

> Fixes: 77be5cacb2c2 ("ACPI: platform_profile: Create class for ACPI platform profile")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   drivers/acpi/platform_profile.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
> index ffbfd32f4cf1..b43f4459a4f6 100644
> --- a/drivers/acpi/platform_profile.c
> +++ b/drivers/acpi/platform_profile.c
> @@ -688,6 +688,9 @@ static int __init platform_profile_init(void)
>   {
>   	int err;
>   
> +	if (acpi_disabled)
> +		return -EOPNOTSUPP;
> +
>   	err = class_register(&platform_profile_class);
>   	if (err)
>   		return err;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
