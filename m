Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F477C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 16:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ra6HQT57AIIbWp+IGp2iCGSfYKBAa5ZOJh0wn/JBGss=; b=N7qxWum6VG8Vxw
	xlVfz0H3l6HlkHbfa7kdqh96U48MMrQqWgIu3KX3Y3wCN8IfSnKJtR/QH8QvfeYRxSlBI/WPDwopF
	XS/9yUYZBVF0LiItgUYrQ5CGvd8MSyfsI0E/CRP/HAkd5oQhiusAzGTiADjJ18YhvouxJm9AXTbJF
	KIKhRgjs2vqB+4q8afeYXw3E1GdMnDdIieh1j4qvjUBDJ97yrIFelCGmsBTHgp2YwShjwU7f1//Cq
	1FhX9w8KrHUFWQR9oVNLrwYBCPNnofC1iGwuSuq5WY8+TnDxzKj3CZBQWoJmdok30DujPL2zAzfBF
	S2bqHi3msb34tpk9nOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kHt-0000000CKvt-1yhd;
	Fri, 04 Apr 2025 16:53:01 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kH9-0000000CKow-0CDw
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 16:52:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaecf50578eso356769966b.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743785533; x=1744390333; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dcaHckNUalgvuK38rDNnG2eFvol8+c/qkWl70UacdGo=;
        b=ZDkylhIhxdn9vZoyXrCzJ/1/0mCbABA1Y08pNc7de+qQvJiNVtwpvQHThdAYBAS1uO
         Y2DEz8DwQyeDRGcJiYB79jsZ/wYO/vNVy7ZIPZlH7rQzJ4s9FlKfwZxu/7U3mfSa99uA
         jntjfqk/j4XOJY0ld/FV0XaQAm3JdoWVGFEe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743785533; x=1744390333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcaHckNUalgvuK38rDNnG2eFvol8+c/qkWl70UacdGo=;
        b=NdWoXwRznchAuP11xPODLKC7x3vFu4ejNmu9p70TFzb15NYVgYFY+T1xrGacfon8O0
         A941WrMla68QC/wcEeS5YaM8L/JbncKEmTndlamcQt49MxPlyyETsdY5C/PcuUnlUAjl
         uXYtQkL+OxGe7VdbK7kYKUpoOMg71pMeRtIBkKyJzdXZA5bJ1PxODcIqyFM41OeRiAzs
         jqvMc2CHp6T9Ay2wqajI7URHgUUfQKLRFnyhPT8VgzPdmJJMfKl1hf5c1SHq2kMU7oKF
         y2dklBVrfDVbYx4OnN46DhYpqcuSzwzgb/OkTox0lRA6k6MOpr+hxYJPDze8/rEUOLXX
         NPqw==
X-Gm-Message-State: AOJu0YzIhGWUJlo95MEoB19pZPuOxfS4mqY6v7HKDwB3mEmh8Nr4QqDZ
	Lg3O7DTzbFCUM0zMiwl1rlGNSEyup5gkHJ59vfsFnhEAYcDsl8NMxhe16wqm5KM536yoG4Jdr0S
	RZEA=
X-Gm-Gg: ASbGncvKNFzgZCCs0V9Knfn1LgtKOXHpaYPz7UQBkzuWqdLjIJLJT7kT9E33oi+8K8n
	SMxtwIyJ516bxAFjGkqigYtar+yrLwunSEVJgAC2eGaBjuxOK5/Kf7Gk3Y0QkNPJqK4EASGjZis
	oIpHz0AFxSkr1UWyjkwE2SsZVRhxH+yMHBM7eeIWXwVbMuiW4rmbJiZlEYZt21Lths1UdyxQuSv
	rive10UYXP02PrZimHr/AGQndIAEYg57LPzrwy1mlFT8jINhv+l71KnpQEnLieMr044EVCnG8la
	dxhYmmhBbuluSNDXkzKGa50f93GYjtGeWlSu7dBfUaLB0DB5KNY/TkvyWQTbjFYyggF4d/f53t0
	2jPUX25AiC9S20qCtMnY=
X-Google-Smtp-Source: AGHT+IG2mRGde96zJ0+Lj2lRJHBpyUI9zUNoZSYt+ai3TjP82f2g2AiG0nXbyird8h2sYTT6B1xqJw==
X-Received: by 2002:a17:907:7f0f:b0:ac7:3323:cfdc with SMTP id a640c23a62f3a-ac7e7120321mr27208366b.10.1743785532634;
        Fri, 04 Apr 2025 09:52:12 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfea2224sm280014966b.74.2025.04.04.09.52.11
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 09:52:12 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac73723b2d5so453933766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 09:52:11 -0700 (PDT)
X-Received: by 2002:a17:907:a05:b0:ac3:8988:deda with SMTP id
 a640c23a62f3a-ac7e7626e41mr24401266b.40.1743785531540; Fri, 04 Apr 2025
 09:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
In-Reply-To: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Apr 2025 09:51:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whWHfgVaGodMi+UecXXbo2t1At-cVUMH0e8kS6Pacqwsg@mail.gmail.com>
X-Gm-Features: ATxdqUGi3Juiu86MXhM0XWazcK8DDHPfVGFinP8mcRY6eeaAhkWCP85ngtPW-Fo
Message-ID: <CAHk-=whWHfgVaGodMi+UecXXbo2t1At-cVUMH0e8kS6Pacqwsg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_095215_117725_326B1E36 
X-CRM114-Status: GOOD (  10.05  )
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

On Fri, 4 Apr 2025 at 08:58, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -192,10 +192,9 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>                 struct mm_struct *mm, unsigned long start, unsigned long end)
>  {
> -       unsigned long start = uaddr & PAGE_MASK;
> -
>         cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> -       mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
> +       mmu_notifier_arch_invalidate_secondary_tlbs(mm, start & PAGE_MASK,
> +                                                   (end & PAGE_MASK) + PAGE_SIZE);
>  }

That just seems wrong.

All the PAGE_MASK and PAGE_SIZE games look entirely wrong and pointless.

As far as I can tell, the code should just call
mmu_notifier_arch_invalidate_secondary_tlbs() with the completely
unmodified start and end values. They should already be page-aligned,
and 'end' is already the 'one past' thing, not the final byte.

And maybe I'm missing something and my resolution is wrong, but that's
what I did.

Somebody should obviously test it.

            Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
