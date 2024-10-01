Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2306FCEACC2
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgdI/fqZnI+jOJIUAJkI86ch9C9h9Er7DIUcAqsx06s=; b=hqYUCQEN9hPwjw
	S0nIT3uzqkbsFhdL+QZALvH2ux7WBwBfaPZ1gl+TvaaneywVL6X3IWdPuJ/KwFOeYMnv38K90E5Q5
	4W5RUke7fspsDWAuoTDIjo07CV3mwQt+nD5vHY8h/IeQrZaa9xDY6SWqU19yJZp1S10OyyfFgnUrN
	9LJeVJsVejYbCfDXo5FYUaBQvCtoA2FfpiS6Lz1aUlarOFq971BGIHIuo9NIbvGl8IPlsLTkPtyGN
	a5YI/ahIsClO28Zsmrlbrf3AVVYn+RtWZt4XFJKv771c2l9noHEkyguGSMoL4hDkkbr5hwLmZb3lz
	rOP4SgG78d7jeCLaRAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svdNu-0000000329O-2POI;
	Tue, 01 Oct 2024 13:57:50 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svdHp-000000030aV-1Rp3
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 13:51:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BD2FC0003;
	Tue,  1 Oct 2024 13:51:27 +0000 (UTC)
Message-ID: <3c2ff70d-a580-4bba-b6e2-1b66b0a98c5d@ghiti.fr>
Date: Tue, 1 Oct 2024 15:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
Content-Language: en-US
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_065133_691655_529551E1 
X-CRM114-Status: GOOD (  16.02  )
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

Hi Heinrich,

On 29/09/2024 16:02, Heinrich Schuchardt wrote:
> The IMAGE_DLLCHARACTERISTICS_NX_COMPAT informs the firmware that the
> EFI binary does not rely on pages that are both executable and
> writable.
>
> The flag is used by some distro versions of GRUB to decide if the EFI
> binary may be executed.
>
> As the Linux kernel neither has RWX sections nor needs RWX pages for
> relocation we should set the flag.
>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>   arch/riscv/kernel/efi-header.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-header.S
> index 515b2dfbca75..c5f17c2710b5 100644
> --- a/arch/riscv/kernel/efi-header.S
> +++ b/arch/riscv/kernel/efi-header.S
> @@ -64,7 +64,7 @@ extra_header_fields:
>   	.long	efi_header_end - _start			// SizeOfHeaders
>   	.long	0					// CheckSum
>   	.short	IMAGE_SUBSYSTEM_EFI_APPLICATION		// Subsystem
> -	.short	0					// DllCharacteristics
> +	.short	IMAGE_DLL_CHARACTERISTICS_NX_COMPAT	// DllCharacteristics
>   	.quad	0					// SizeOfStackReserve
>   	.quad	0					// SizeOfStackCommit
>   	.quad	0					// SizeOfHeapReserve


I don't understand if this fixes something or not: what could go wrong 
if we don't do this?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
