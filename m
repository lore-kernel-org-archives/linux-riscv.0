Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0405CCA0EE6
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 20:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNS1UMNeYv0obfgitC1CZeUIvpffltScFSLmiT2xfCU=; b=cHQEkNbWaq2aDV
	EEkM4Y+GyrF384GJK7VRuD/MX8X9skUx4j5uab0LOcuhEvTICHY43IfyL/yKI8Qkm9/LXUU7acDev
	FAyVtBb3ThM2KBjrWhvUpnxEfevX2wPyDhSJox20pcFEOe0z1mDkikwrhr3TRbhRtFOtboFzmC4N7
	YxcaAF6BFYH+c5kkk+/U52yv3CFjdcpiYGcrkCHxJFHBCdGH7/+WbbcnUFeeY/NQbq4t3KE4J1fgY
	JnTiqwsbbk7NpOAOG9qEU8zRda47cA0qnNpJKf8gyqZ0xPqK/PwIlPTyA4DiTcUldotkVlydoSloE
	Gqriy3xXuuyi5qsxwbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAN-0000000BYoQ-4AIo;
	Tue, 19 Aug 2025 20:42:47 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR1r-0000000BI2s-2kY3
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 18:25:53 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-88432cbf3fbso419820539f.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 11:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755627951; x=1756232751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjcLjUdfx2b5kyu1zQdvPBjWREHanlpzr8pf7Mlw9+s=;
        b=LA4HELekcQbQQ68giZBHnW10qaFkVHDMCycZihSFGqV2x3k4eBC6yVWw8vhLJLv1AM
         r9kOxETQyV8oaC7lzmJ7e0kYKT+GUt1+c8gPnPOgUE8FCCtIlFJiUGNl5O2AWETMxyih
         hG2sxJUSBZrviFcWRqrSgCFrJZn8wYNflF2qlVH7MIf9kqYexy1gOdNKG+8PFlU021rE
         riBhu0v0V61zDebINoGWSiPrJPgv1gzllYArRaucaj7p3CKHa9Ly4zS/w5Fj5oFRQGM6
         u8GAn1dIhc0GC8icVAxKd4RcPsgqKfsLdHZ9F4EYOXF80hW4UmWie3/8YCggiF+5EUm/
         6xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755627951; x=1756232751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjcLjUdfx2b5kyu1zQdvPBjWREHanlpzr8pf7Mlw9+s=;
        b=oaBgp/ZII/Ek5JP7yzZ6GkuJIYAvBTIoEof17/Tinc6x81s9BoLu1IQJV916Cqv35a
         a3/1Qj7pUjo3futeKZ5mBwaoZs5BOdezUMcCo6T1e6NG2jcK/JQJcWXArH8DRXuYLihD
         bSpze8jYZbIqyqf3HHVZ7GfhZ85EX6ORSvRZJYcaW7oy6R+J9MCMV3/wjSM8fh1EHT9I
         3v/ekdaJJaCrrIi8oiyY3+TIxn0mS8ODBIFcGh2gtwm2xAgtLyY4F+O8m2f5vy1QTvCf
         d13lt5vBGqWb28LjUws5oeHc07uZ4ZkMNAqib0JRurK6csuUxbVa2TBayxAVJxgBFPCy
         I6ig==
X-Forwarded-Encrypted: i=1; AJvYcCWy4GhJLqkza6c3BDqSKyL9RQl8XqSx4dzLPoTCdPdUeG9Efbl+Y3IrD+qeLJrn0aLCwEhgvf014DXBEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw98P1qjWxMMEeSmNzhJLxlnqR7hrnxJCZcOKNdtPBZn6eV3cTG
	FbX+dq7bVVDHHBpDKauuQCoKmazwkpi55d45DgusYmS28Piv0uR8YaKigmP1WhjLIus=
X-Gm-Gg: ASbGncuMQbccet/E9M4rxOtZXrhXHdWTL1h1xkyiLdJxQhI9a/Mw9t4i3pI+VSUDpIn
	aeJy1iOphfSV1bRXX3fWaL8rxYj5VwOpEzQiT4eIEFG3vj0qSiJasU9aczKSDyhyQDfMJl4UgeK
	LISb/J4ioaRdc11KZeJuuTIZTaCyFdpMOLi4ESwBAem/lh/PK6jPCaz5KX8gbLqrYK1BnTUldsy
	olNdpnO3dXm4YGzkbKIEEWMNUNVOy1vu1sqE10NK63T3BJomSIHTqJqqjfAQP3BIMhhkD51jL32
	/hvkL7fIQH6AplfNs1RGdTcpbCZR91jCkx/DTLwh6SY8ZvvL0mj5YuVD3RsC6a6dn0q70273WRQ
	l6Y2RIgEueD8rGM3zkb1eB4Zo
X-Google-Smtp-Source: AGHT+IE6fqIEj5m/DaNqdyH4siLxHSicGC+isWwpsiSl3g9mfo/W7KkG9POZskmo3mstpG06/kTUsw==
X-Received: by 2002:a05:6e02:2506:b0:3e6:6b01:ebd with SMTP id e9e14a558f8ab-3e67ca2ba4emr1836755ab.18.1755627950635;
        Tue, 19 Aug 2025 11:25:50 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c949f8038sm3584125173.80.2025.08.19.11.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:25:50 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:25:49 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Jimmy Ho <jimmy.ho@sifive.com>, linux-riscv@lists.infradead.org, 
	ziyao@disroot.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, cyrilbur@tenstorrent.com, cleger@rivosinc.com, 
	charlie@rivosinc.com, kees@kernel.org, ben.dooks@codethink.co.uk, jszhang@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix using wrong load type
Message-ID: <20250819-aa072701b64fc0f42795e491@orel>
References: <20250819071318.21103-1-jimmy.ho@sifive.com>
 <B1669DA80470EE6A+aKQldVbfZ9rnlD9o@LT-Guozexi>
 <D49B33DEEB859CD5+aKQltEZ8Ef3v6rB9@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D49B33DEEB859CD5+aKQltEZ8Ef3v6rB9@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_112551_693880_91C30349 
X-CRM114-Status: GOOD (  26.62  )
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

On Tue, Aug 19, 2025 at 03:20:20PM +0800, Troy Mitchell wrote:
> On Tue, Aug 19, 2025 at 03:19:17PM +0800, Troy Mitchell wrote:
> > On Tue, Aug 19, 2025 at 03:13:18PM +0800, Jimmy Ho wrote:
> > > thread_info.cpu field is 32 bits wide,
> > > but is accessed using an XLEN-bit load, which might be 64bit load, fix it
> > > 
> > > Changes in v3:
> > > - replace space with tab to keep it aligned with code block
> > > - Add "Fixes" tag
> > Please add previous version link.
> > 
> > > 
> > > Changes in v2:
> > > - add a comment to explain why use lw instead of REG_L.
> > > - correct commit message
> > ditto.
> > 
> > Additionally, I see a patch here that serves the same purpose as yours,
> Sry I forgot to put link:
> https://lore.kernel.org/all/20250722160556.2216925-4-rkrcmar@ventanamicro.com/

Ah, yes. I forgot about Radim's patch. We should go with that.

Thanks,
drew

> 
>                  - Troy
> 
> > but it's more comprehensive and was submitted earlier.
> > 
> > In any case, if you'd like to proceed, here is the:
> > Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > 
> > > Fixes: 503638e0babf3 ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
> > > Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> > > ---
> > >  arch/riscv/kernel/entry.S | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > > index 3a0ec6fd5956..492ae936dccd 100644
> > > --- a/arch/riscv/kernel/entry.S
> > > +++ b/arch/riscv/kernel/entry.S
> > > @@ -45,8 +45,10 @@
> > >  	 * Computes:
> > >  	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
> > >  	 * a1 = BIT_MASK(cpu)
> > > +	 * 
> > > +	 * using lw instead of REG_L is because the thread_info.cpu field is 32 bits wide
> > >  	 */
> > > -	REG_L 	a2, TASK_TI_CPU(tp)
> > > +	lw	a2, TASK_TI_CPU(tp)
> > >  	/*
> > >  	 * Compute the new_vmalloc element position:
> > >  	 * (cpu / 64) * 8 = (cpu >> 6) << 3
> > > -- 
> > > 2.39.3
> > > 
> > > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
