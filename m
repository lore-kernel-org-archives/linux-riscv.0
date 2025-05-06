Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D262C3ABAC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MT3l1LPdjZhHAWlso7DeBAQxNwQl8KN+IMD/X+mhtJA=; b=IC4wTCojUvAwPf
	tgS0Lk+HrMj89sANH/FB9Fu88TXHNDC4sQ7B+uZhIciw0JadYObsOmnuz0jedALZzNVSYvdF1qptS
	qO8EtB1OyPrJuUrNQ3TdRsdGrheIlHPr6ERM0vrs7FhXh+ffLC33DPfRCKevnVOcOvQhNhC+9SRyz
	DZkqyY0tHDh5EUj+bCTFLRgMpG2TtribEM8SaQjZfXupbqJg9iW8Z1EOGPQp6CnPg04f9oNrXXp7k
	trJ+mRaZTmFXIZ/FSJsEAUwY/2uGrht563RFHCaokCuVQU0ZawcBnA1Wx/yqvR5kVkbfcKfNn+GOl
	W5YQ+H8xM7BC2wYVq+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFvn-0000000BdMz-32wp;
	Tue, 06 May 2025 10:53:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEXU-0000000BMGJ-48mX
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 09:24:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441c0d8eb3bso2515775e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746523475; x=1747128275; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtrK30WSclX8+CsTIEESOGs2XijMelv6Z+mtcK6WgL8=;
        b=aBOABMHc5n6vbUniRIziOBj6PgRh+K56RI5HC9VgLamVNPTHW1mMa8sWPJaK9g8Lvt
         swQLGvPQTnpozdXi97jcS0NOngR4mHDr3vnYBP6HoJwe3sW1X65lqFDIG7g2nWjyfx8b
         p0uZkFPq7HhueIGQ0Vi4JvoSYzNDILU20gbKGrXEVT9wWsNTWwK3vMyswgHfnXOyrau3
         +8qQy0vFAQ9nuzM4ybfhIuKdJtbQt+35nIEqsX97DwF7jDL8x0gI84sp8SfePxPHsuHa
         nMcdeoKO95ydZIDJMulSLTY1Js9Nea2ntFOSZUyrFUZHEc6NI1lh4GX9Y68ob751e1ec
         A1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523475; x=1747128275;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mtrK30WSclX8+CsTIEESOGs2XijMelv6Z+mtcK6WgL8=;
        b=jEudfpu7YMK6E5wcVOY7ta79mbpAJDaQ2+Ilw/M4vGy3WYyjS4jIbTdgMnnVBIqfWB
         wg8UMQlHU7DGIfzgMfg5kDNGx9Lud0jrpUse4+PPxuTOVFHAYCp+r31MOTm/NtItmD55
         s/ZPkAzo/SIDPUH0y+tEslYIwFI91qyr/a62RyMmXWgWUi1Y51xKuHvQK/Rp5DkYsMKL
         /x55CyThsZknVxXxfIV4bfqLjdqKloCqSDIn7RZE3rL4LPWhJPDsoGqvFpVO1pkA8bNf
         2rUeM+Wmba5hm+AxmwLE/Y/JMD6Pmw4UxkRmRwO98cRp2pekwQyBkhBHyEFICFPQ25i8
         fMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh4cChmEQeTtDEJdjurQ9IOMRQyG8MEgnEKbN7Ai07rIpxV+RoJlRaUKLon3vlUzlKM4zkNiKCJWiBQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX4mN/HSKcDrjw0X6vO3BsiV926QLlE7CUg/wZBQi2QuR4FexW
	iGCRLo1SjkKPM9cnseLdE0bpDsuB6s1m7j3ESRiFWPzQji0kqAWai2/0mh5C33o=
X-Gm-Gg: ASbGncu7M1Cr2MXtD4dFTBv8sddsE9I/xdgTyS0hC1TBHldAI2YVVz7KGu+pxXRfues
	kB+0ammZK3EvPS6xxuthzS/lwVsZKdfv59U5mAtiHtLEN6x4NH5+EQ2eo3mCkYQG/q7hby/9CUA
	RPsUxziN8b7FD+YtEvrq80CDXTODM2opb8rIyxkW4tSuMvVuKNwy/fOmtmmyJnmnYfZ1PlIzqbj
	HjxlvnDRotcyJFOyJTBfqUO5VHSaCpsNerykuNsms2Y+97UNpmvUOBCeHhxDYxXPM3jlMiCnz8C
	8OnrlqXphx8beXwgw5zqrAo/eUP7t08yPNBfuO1GtD64SE3X
X-Google-Smtp-Source: AGHT+IHZgaRK6ml9AWyse65POBkzHsZ8Ut+BjX7oVJ10RpUOC/PC4jjz2MMApvtA5diNrjCKmwAdmg==
X-Received: by 2002:a7b:ca59:0:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-441d2441701mr2017735e9.0.1746523474923;
        Tue, 06 May 2025 02:24:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:d5f0:7802:c94b:10f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8992b4csm165890855e9.0.2025.05.06.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:24:34 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 06 May 2025 11:24:33 +0200
Message-Id: <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com>
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022437_040677_CE7AFA6A 
X-CRM114-Status: GOOD (  14.71  )
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

2025-05-05T14:39:25-07:00, Atish Patra <atishp@rivosinc.com>:
> This series adds support for enabling hstateen bits lazily at runtime
> instead of statically at bootime. The boot time enabling happens for
> all the guests if the required extensions are present in the host and/or
> guest. That may not be necessary if the guest never exercise that
> feature. We can enable the hstateen bits that controls the access lazily
> upon first access. This providers KVM more granular control of which
> feature is enabled in the guest at runtime.
>
> Currently, the following hstateen bits are supported to control the access
> from VS mode.
>
> 1. BIT(58): IMSIC     : STOPEI and IMSIC guest interrupt file
> 2. BIT(59): AIA       : SIPH/SIEH/STOPI
> 3. BIT(60): AIA_ISEL  : Indirect csr access via siselect/sireg
> 4. BIT(62): HSENVCFG  : SENVCFG access
> 5. BIT(63): SSTATEEN0 : SSTATEEN0 access
>
> KVM already support trap/enabling of BIT(58) and BIT(60) in order
> to support sw version of the guest interrupt file.

I don't think KVM toggles the hstateen bits at runtime, because that
would mean there is a bug even in current KVM.

>                                                    This series extends
> those to enable to correpsonding hstateen bits in PATCH1. The remaining
> patches adds lazy enabling support of the other bits.

The ISA has a peculiar design for hstateen/sstateen interaction:

  For every bit in an hstateen CSR that is zero (whether read-only zero
  or set to zero), the same bit appears as read-only zero in sstateen
  when accessed in VS-mode.

This means we must clear bit 63 in hstateen and trap on sstateen
accesses if any of the sstateen bits are not supposed to be read-only 0
to the guest while the hypervisor wants to have them as 0.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
