Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D21C5475B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 02:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyyIZjJkO0LoZ/FMcF+cou9rlRJ4O9xzcI3/6zKwwd4=; b=ikWN85sv4EtCaL
	Xv0EvltK25w395eX8HwdnEb+OyEbFYT4L+QVp1RYEp4mG5MDwQUpJYnyEK2Kp1hlb22w4W4H2drGi
	LH0rKBz9ePfqffzcNnX2lm6uBkUN2+Kj6KGlwnglel86nNDFJXnZegcMAez4RPzVMj8GOXF0xMmaV
	72kVxM42VoHu+NlmccdFkTn/Kqa6d3TdFRDm4HgBq17fd7BGwozuo7BEVbJfZEXdTDLaclqTy7j0Q
	AW8bu4VuyWodrZDQ3TNgo7e/jGyMY+4X/4REcNvDwaSsPRVhUVcTf2Nvp4AK8p7JDSrdNC6j5o3Rx
	Z9MQmc13p5jgijbEVqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri3nw-00000002i6U-2qCH;
	Thu, 07 Mar 2024 02:48:20 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri3nt-00000002i32-0q4n
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 02:48:18 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-364f794f237so1552605ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 18:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709779695; x=1710384495; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z5d/26bHgqiMApGVsGr3aD7SjWMpb6gdnyVYgaIBs8=;
        b=C01SVGL63BQ21mzBxDsjZ+AD68IQwlMTWMBXVakTGvh45ty4SOh9k7sSTDz+o3rsCt
         LNeWVyiUqkiBVWvWrS19eP5CKe5S2INJE35HWgBnVsRDEfIPp5bTzi9UL+eD4TIQ75+K
         BA6Yswy4nQRJJKqGYmVJFp0Irk6hrVIWICFNznsXthgOzzrRvHb2J7ycsan8lK/8VdDb
         Xxv1qQzVYYdgn/p6U0PlnBQqPlrJs9SA53TfVpRPaNmiMZOmanzKStLx9ksEKGN/Bob+
         Hb44OKZQfIOpzgLj7uxjL5Egdkm2oPFk8JZvPyoFp9n5NsScQ138E2iEp4/ntxYjFYau
         odnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709779695; x=1710384495;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z5d/26bHgqiMApGVsGr3aD7SjWMpb6gdnyVYgaIBs8=;
        b=kqKXzF+OZSqcFg55p3mY9/FYj6r/IZl5KY+XXzg4uphLqMPREdV2FduvMCHEMf9guV
         Mo9GbMKw38BT4pr16sbWTtuz1aa4C+c550AJqOkMY1vRvWowANj+H6zXhUy3qftU1+o5
         t1WosKAeo///jPipZmusK0sGTFMsF6Wr3wtQed2mUOOHO66/+1Rj4bPGACtzapPvPVWS
         +td0y7zzvZ/6piqGSRcoueqMSEywnTLkw0iFjzLwQUFRlUCTjHqXcr8ajxtljBhGB+DP
         NtPJ3yFD0ZjuugMgmKXOTLJ9iUyp6lUuPgr881UotPW4sLeMgvb3hRtFU3h0XVTb3JVT
         38Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWMpaGWbd0igUqdsY/yCv3cLGYikjDsURto2FNspgXHknSFingx71lio7fVeGmFBUlVVJNsjYi3k2s2wv7ijk6KRLvmim/2q+6SBptg1vSO
X-Gm-Message-State: AOJu0YzlmXXXBZmDJblYqOsuXYcjnlYV6TvZL1Ao5gwqLd1RKlwBSYLd
	6cZYVWrGlKjs//C+RJbyApcifiJTtjNhMyHTw3XBn+miBNHuPODiARFulvh11WQ=
X-Google-Smtp-Source: AGHT+IEyF0UCk5AncTHMUs17I2OeHhjTtTpuQHRLuE8Gkg6yydzKB2koqNVCqN1HEtdGNtMpZAviXQ==
X-Received: by 2002:a05:6e02:1a6a:b0:364:21b4:f59a with SMTP id w10-20020a056e021a6a00b0036421b4f59amr21762216ilv.14.1709779695359;
        Wed, 06 Mar 2024 18:48:15 -0800 (PST)
Received: from localhost (c-98-32-39-159.hsd1.nm.comcast.net. [98.32.39.159])
        by smtp.gmail.com with ESMTPSA id z13-20020a029f0d000000b00474fc6638eesm1392353jal.76.2024.03.06.18.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 18:48:14 -0800 (PST)
Date: Wed, 6 Mar 2024 18:48:13 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Conor Dooley <conor@kernel.org>
cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    linux-riscv@lists.infradead.org, 
    Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
    linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC] Inconsistent sifive,fu540-c000-uart binding.
In-Reply-To: <20240304-whomever-gladly-d43da7ad2fe6@spud>
Message-ID: <229b34c1-5419-93ae-0a6f-a21cf4e4a276@sifive.com>
References: <20240304105947.SJcVAdr1@linutronix.de> <20240304-whomever-gladly-d43da7ad2fe6@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_184817_315978_2DB8E4E2 
X-CRM114-Status: GOOD (  15.28  )
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

On Mon, 4 Mar 2024, Conor Dooley wrote:

> On Mon, Mar 04, 2024 at 11:59:47AM +0100, Sebastian Andrzej Siewior wrote:
> > | $ git grep fu540-c000-uart
> > | Documentation/devicetree/bindings/serial/sifive-serial.yaml:          - sifive,fu540-c000-uart
> > | Documentation/devicetree/bindings/serial/sifive-serial.yaml:        compatible = "sifive,fu540-c000-uart", "sifive,uart0";
> > | Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt:"sifive,fu540-c000-uart".  This way, if SoC-specific
> > | Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt:    compatible = "sifive,fu540-c000-uart", "sifive,uart0";
> > | arch/riscv/boot/dts/sifive/fu540-c000.dtsi:                     compatible = "sifive,fu540-c000-uart", "sifive,uart0";
> > | arch/riscv/boot/dts/sifive/fu540-c000.dtsi:                     compatible = "sifive,fu540-c000-uart", "sifive,uart0";
> > | drivers/tty/serial/sifive.c:OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c000-uart0",
> > | drivers/tty/serial/sifive.c:    { .compatible = "sifive,fu540-c000-uart0" },
> > 
> > note that the driver has a trailing 0 in the binding while the yaml
> > description and the DT part does not.
> > The 'sifive,uart' has a trailing 0 where the 0 denotes the version UART
> > IP.
> > 
> > Was this also intended for the fu540-c000-uart binding? Should the 0 be
> > added everywhere or removed from the driver?
> 
> I suspect that the driver is what's incorrect, given there's little
> value in putting the IP version in the SoC-specific compatible as it's
> a fixed implementation. I'd change the driver to match the bindings.

Agreed


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
