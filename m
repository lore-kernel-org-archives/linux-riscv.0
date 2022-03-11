Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6324FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ex47iWCdZRELj5AiVEEAjj7zK/HB+Mkr/KIbSmrGswY=; b=URfamEGL4MGq6i4o3kVQrxCjB2
	mcuozrpmZffw5KCY9U0RJmXCkMKJSMq/xw5F9JHwbe1Gs9Z1WmRt31RdvIXK1ocdEbJfX8lkl37mS
	2t8Jm/6rJ50FdH5ag5+dOIop1M6Pr6QG0+l+54ZtnOuxIFabxKzDWVW85R/9olive7itFnMzytjcP
	J2VHGoAk7y22lNa3HpbEbV6qJaEDjCKgu5QUpDGrrwOdEDel4+8DRg/nVJQVuWecSvAGceMAbw8oh
	ma1qzT6rObyaOkqI5lCTmg7K2bEe2v/hfmLICHvNAdhprKT0iMKjx9PDK1gj4M55LcPaury5aArxI
	E98itKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSicy-00HQHJ-T3; Fri, 11 Mar 2022 17:00:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSicv-00HQFI-BF
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 17:00:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id p17so8142772plo.9
 for <linux-riscv@lists.infradead.org>; Fri, 11 Mar 2022 09:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uyogg3EITvNDbcMhB98sICz37uKoHpxrlJ00H656sok=;
 b=1QTh1VVAysYbusZtQvZnvS1uPDJ6UlW/q2rXouJaFlj2LfOlJkQJmUXDkVwN+n91WR
 fb5HQohWhJ4+39XTBP33I8eCdQChPnCjuKYkTJxqpDT9FHhMSXEUNM0LmFU9yjw3aLgy
 wSfzU4U2yPAdn4DBO1OmkU6EmoO5yyZ4wLr526/wnaJAbhrHb39Bx7gbi2GJ5C5JD1Ey
 4Ta6iD6aPT7DyE3No7DqzMX881T2uLkD+llW3FihXEFFNDH8bJwRBv481ocYkT4lf5m+
 JWDDf6umfO3t59FLm0WJXX6JfbW6lzKRZz+9VK9XoR46HPLmGt3cbWwn+IfMoQ09sxlN
 WGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uyogg3EITvNDbcMhB98sICz37uKoHpxrlJ00H656sok=;
 b=VF+kGukpjl3nZraDMOtiuiHjqwQerMzMpMGcmaZfPkFJX04MaqnZuKzbWxOXCTOkpQ
 +/fr5YI3OjBktKCnZye+ocm7DzkVu7SURLngV7mAriTtHU48wuXXR0GDyxJvHf9F7llz
 TR6QIit8bMnu6m7C8DOuz+yHviYxCX9OeMy1yt618ovyj6u2oLxJreMmOnLW4CYQU455
 OFN+NulKOHbMdjKaD7DUHOgHEgWzq6iJqdPhATUjpIU22q9IQQR3YyOMsKzoJ7zIeqtv
 /vcA5duslcXEh9JKknFa/EaifIZwRPFYBaN/Snnwe3nbsf8XjGhap0SlAjXyYlmZrDYN
 c+gg==
X-Gm-Message-State: AOAM532eBqO+N2JM15RBB3LGm48XiTHq+h4akkalkdGNFj7mjM2cQWLQ
 Qvg1suqi/USUu8IhuPqs9pX+qzM9U0gGLeIJ
X-Google-Smtp-Source: ABdhPJx9JM9P1TWOsem86I4wVFjtzG0TMU9JZaMNtnIWx4L8zMBicbk6CBIzFDaHi4fXzvW7syUBqw==
X-Received: by 2002:a17:90b:1d84:b0:1bf:674d:2db5 with SMTP id
 pf4-20020a17090b1d8400b001bf674d2db5mr11706345pjb.8.1647018026779; 
 Fri, 11 Mar 2022 09:00:26 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l4-20020a639844000000b003806f93fd57sm8988340pgo.42.2022.03.11.09.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 09:00:25 -0800 (PST)
Date: Fri, 11 Mar 2022 09:00:25 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 20:45:07 PST (-0800)
Subject: Re: [PATCH] riscv: Fix auipc+jalr relocation range checks
In-Reply-To: <20220223191257.143694-1-kernel@esmil.dk>
CC: linux-riscv@lists.infradead.org, kernel@esmil.dk,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alex@ghiti.fr,
 jszhang@kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: kernel@esmil.dk
Message-ID: <mhng-5e2f04e5-f721-4ef6-a51d-ddd4611bfa5f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_090029_484186_17956D75 
X-CRM114-Status: GOOD (  27.67  )
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

On Wed, 23 Feb 2022 11:12:57 PST (-0800), kernel@esmil.dk wrote:
> RISC-V can do PC-relative jumps with a 32bit range using the following
> two instructions:
>
> 	auipc	t0, imm20	; t0 = PC + imm20 * 2^12
> 	jalr	ra, t0, imm12	; ra = PC + 4, PC = t0 + imm12
>
> Crucially both the 20bit immediate imm20 and the 12bit immediate imm12
> are treated as two's-complement signed values. For this reason the
> immediates are usually calculated like this:
>
> 	imm20 = (offset + 0x800) >> 12
> 	imm12 = offset & 0xfff
>
> ..where offset is the signed offset from the auipc instruction. When
> the 11th bit of offset is 0 the addition of 0x800 doesn't change the top
> 20 bits and imm12 considered positive. When the 11th bit is 1 the carry
> of the addition by 0x800 means imm20 is one higher, but since imm12 is
> then considered negative the two's complement representation means it
> all cancels out nicely.
>
> However, this addition by 0x800 (2^11) means an offset greater than or
> equal to 2^31 - 2^11 would overflow so imm20 is considered negative and
> result in a backwards jump. Similarly the lower range of offset is also
> moved down by 2^11 and hence the true 32bit range is
>
> 	[-2^31 - 2^11, 2^31 - 2^11)
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  arch/riscv/kernel/module.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 68a9e3d1fe16..4a48287513c3 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -13,6 +13,19 @@
>  #include <linux/pgtable.h>
>  #include <asm/sections.h>
>
> +/*
> + * The auipc+jalr instruction pair can reach any PC-relative offset
> + * in the range [-2^31 - 2^11, 2^31 - 2^11)
> + */
> +static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
> +{
> +#ifdef CONFIG_32BIT
> +	return true;
> +#else
> +	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
> +#endif
> +}
> +
>  static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
>  {
>  	if (v != (u32)v) {
> @@ -95,7 +108,7 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
>  	ptrdiff_t offset = (void *)v - (void *)location;
>  	s32 hi20;
>
> -	if (offset != (s32)offset) {
> +	if (!riscv_insn_valid_32bit_offset(offset)) {
>  		pr_err(
>  		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
>  		  me->name, (long long)v, location);
> @@ -197,10 +210,9 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
>  				       Elf_Addr v)
>  {
>  	ptrdiff_t offset = (void *)v - (void *)location;
> -	s32 fill_v = offset;
>  	u32 hi20, lo12;
>
> -	if (offset != fill_v) {
> +	if (!riscv_insn_valid_32bit_offset(offset)) {
>  		/* Only emit the plt entry if offset over 32-bit range */
>  		if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
>  			offset = module_emit_plt_entry(me, v);
> @@ -224,10 +236,9 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
>  				   Elf_Addr v)
>  {
>  	ptrdiff_t offset = (void *)v - (void *)location;
> -	s32 fill_v = offset;
>  	u32 hi20, lo12;
>
> -	if (offset != fill_v) {
> +	if (!riscv_insn_valid_32bit_offset(offset)) {
>  		pr_err(
>  		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
>  		  me->name, (long long)v, location);

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
