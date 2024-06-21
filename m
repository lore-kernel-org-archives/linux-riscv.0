Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45296C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvdybwsJNWLvQRNsNpkp6oHFM9XijUcBAeTCNDz+cEE=; b=w7mpN7JHUfDnI1jdx608Rug7B9
	eR7Ai5jaLdipyNSNxAimfdOnfYgTFREJhR6ssfwO/n1Oz+xsgf4PL8dygPrf1TL+C60c0P5GNcBhU
	FDvcRCiISO9JXQipXbfSdUi+1YIEoLmZdbAygsTzbEx2mTZ7NKOdbUXxJXRJbtSL/CmEaOlqLuDcB
	+nXqyO/2Uzljlnwg22Y1gSSyFN4BMUjh5MikLaJYwP+k75lyqVzHOiticqX6rVdobLw0D2FOoSur2
	5WPsE7cMfXH3Mo58F1VPW6cL4tqGQJldKYYh0z6V4ysS4qVUCLVcz+0eqOWuHNWqTzTaHuNnzsKGK
	3dAUlIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbUu-00000008m2F-2UZO;
	Fri, 21 Jun 2024 10:28:00 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbUp-00000008m0b-3nno
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 10:27:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65CC61C000E;
	Fri, 21 Jun 2024 10:27:45 +0000 (UTC)
Message-ID: <825ab2df-c040-4454-9db6-8d08bc3df592@ghiti.fr>
Date: Fri, 21 Jun 2024 12:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] riscv: don't export va_kernel_pa_offset in
 vmcoreinfo for XIP kernel
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1717789719.git.namcao@linutronix.de>
 <8f8760d3f9a11af4ea0acbc247e4f49ff5d317e9.1717789719.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <8f8760d3f9a11af4ea0acbc247e4f49ff5d317e9.1717789719.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_032756_616949_FD7B0F36 
X-CRM114-Status: GOOD (  17.24  )
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

Hi Nam,

On 07/06/2024 22:22, Nam Cao wrote:
> The crash utility uses va_kernel_pa_offset to translate virtual addresses.
> This is incorrect in the case of XIP kernel, because va_kernel_pa_offset is
> not the virtual-physical address offset (yes, the name is misleading; this
> variable will be removed for XIP in a following commit).
>
> Stop exporting this variable for XIP kernel. The replacement is to be
> determined, note it as a TODO for now.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/kernel/vmcore_info.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/kernel/vmcore_info.c b/arch/riscv/kernel/vmcore_info.c
> index 6d7a22522d63..d5e448aa90e7 100644
> --- a/arch/riscv/kernel/vmcore_info.c
> +++ b/arch/riscv/kernel/vmcore_info.c
> @@ -19,6 +19,13 @@ void arch_crash_save_vmcoreinfo(void)
>   #endif
>   #endif
>   	vmcoreinfo_append_str("NUMBER(KERNEL_LINK_ADDR)=0x%lx\n", KERNEL_LINK_ADDR);
> +#ifdef CONFIG_XIP_KERNEL
> +	/* TODO: Communicate with crash-utility developers on the information to
> +	 * export. The XIP case is more complicated, because the virtual-physical
> +	 * address offset depends on whether the address is in ROM or in RAM.
> +	 */
> +#else
>   	vmcoreinfo_append_str("NUMBER(va_kernel_pa_offset)=0x%lx\n",
>   						kernel_map.va_kernel_pa_offset);
> +#endif
>   }


So that will regress crash on XIP kernels, but on the other hand this 
was wrong in the first place. And not sure anyone ever used crash on a 
XIP platform.

At least people will know that using va_kernel_pa_offset was wrong, so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for all your changes in v2,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
