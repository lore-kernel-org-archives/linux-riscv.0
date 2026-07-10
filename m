Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E0FC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Gvo4qxfQsH2Tfni8g9xLaxAxrNKJ2Nj7Cj5JUF+BZQ=; b=If6tNGdP8XQFHl
	Z+KoSoeJKv+aeDJ68FCABBmSTrckcF4nYXrAgGW30sXshhLnBr45KJ7t6q6Z89kgo+s5tJ7IfwZ29
	VF+nquJ/UzRo4MTGqvBvVBGNZXDkdyW04dv0V+OuQaK2Y+22sIyqxuN+BeJo+IZQfDr43te6CFNnu
	1EcwCCt82QQH3QPrQdVGqRHJWghA0V2Z2HOHHdvsyfWYJ0bOWkzQNDWzAqQJAnOlxEHk0XGgW+6XD
	PirIb0cW6cGGcjGqxBsnxwBwhDpDNnprQu70hVN2QNCeTzdgawCoisFEqOBZ9X7RPUvN6icgQ8Pje
	JN1dUds2oVfx+9xKJqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62Y-00000004Nbv-105i;
	Fri, 10 Jul 2026 07:52:54 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62T-00000004NY4-1Mvy
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:50 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-ca80d708489so389672a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 00:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669968; x=1784274768; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hBmrtvJxIONdnfaPYnlm/oDBvJlVXO+AfljQowycHCs=;
        b=R0QkoXI6+PUL3AJlQ4TGd2S67FP35i+VY/hASp7lC+ISkVNKM6A54OkWkvN1QfvesU
         f9ElaIfroy2e5PXu8UVGwjhwtKwum81xYfzli96jTBjWAY2OozqUrMHXsMXms9J9kZ2Q
         G/D1peg2vJK56adcxNQysqAZlqBRn2tOCmKaY6AFQv/m5NxsyOgYeRCDxwwQ8oaiOhxS
         imACXxz7u7DR+6wqqzkdzMcgZPsPpiLSW4mOYou3FbJpbp8J0oGvPOOofv/JeGvD8BA1
         VR1fbnAgVZbxWyAzIdJ7C2FulvCFm0SPhQSEHA7/kjupniLw0w9OgNzwz4I3X+K52MTx
         5JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669968; x=1784274768;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBmrtvJxIONdnfaPYnlm/oDBvJlVXO+AfljQowycHCs=;
        b=rES/rXwGkt9YKg0Qix3go1cy28JHzKmGBh+DJMCSTUyqKH2UBa10jNhS3nHUu3GTdu
         wAIV+MBj6D+YRPqjg1LUEBG0gyfHVLkwL+7eWJKZz9F2ojhcu14kXIAyhwULtb/ZUdEm
         d2y/DNKj1uCzDlL4x+o7UnDCwIQe/qBSQ0G0L/30mYZQ/J7n/vf/bVPAIPEKL1wpEBHX
         kmabHN7b0CfN1SvO5q0o4AyCcnibMrqQ5ato+6TpVgi76k9B8oVBW+LBmMlW3+N5aNKv
         eBb8c9EN8rEAG84nzpXQ//9XJ4dB1CHq4NjDcRGmTwppjquIq7st8uQqW7sBVBjPQHzw
         pC1A==
X-Forwarded-Encrypted: i=1; AHgh+RrzbNRDmBXU++Zdsu9s2m4GnaqCq1NfPioQ6QSDlb7SuXQR/N1p9rOEHIS0Ra0bN6Pzd981bn+sBs5cEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQp/TgkqscGkddNNGxIr4bIOrqwPzCUkt/nixaZzBt9gcBCewr
	bQR/cpMiRTnrAix+UIR/A2mT1HobLQFYYk4cstXDVAbYKSH0bQ3XpbXb
X-Gm-Gg: AfdE7ckIFHXBE2jB3WPOdC2g2VFJAR7DefQkY21jA6+hgFtT12j5UvvC0yLXOhsebly
	G4mCc/l8RmoKuklT7W/JZq2IHjlkPBJqx49lMRnlUwUQ9yG0iVSdCnww6fVmB5opRFzw/2FUHuB
	wnpCkLyHPNRfdAV2lpKr9VW1msx8Nzu79iuq62m4vFiiEmQ8y5booNQvOXzAjMfm5FYXa7yvTUP
	YzHJ/YpimQbk3nDAR9BpoZMsoxrCOBEDePS7TNn8eITX+4+tamodgApjG8uGjNFEJkKPnH7Iw3l
	mWVaKwaiQvW8iTEKzUL4vb6y21PV1KdAFT4miVHjVFItNRPGeDxopacIBXfBTOrl64kmBPnw8f3
	VtWXV9VtujsYfxPxBTOYTRZa0HvbISfAI7aPZ2/BPsTURcsaryc+OcFOEjic8tX9SegI1bsZxe3
	uTWskSJZTY/WRXJJ62OUv+svUvp8zS2plASoNHGjVu
X-Received: by 2002:a05:6300:6708:b0:3b5:445c:e483 with SMTP id adf61e73a8af0-3c0f085cde5mr3063429637.3.1783669968147;
        Fri, 10 Jul 2026 00:52:48 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:47 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/8] arm64/runtime-const: Introduce
 runtime_const_mask_32()
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>
In-Reply-To: <20260630045531.3939-4-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-4-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995929.1208691.6493654690059057340.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=605;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=+O07iyphnPsMhbwdcZl/xEUDllR7WIMFNYTSmUuHDHk=;
 b=cz9XXDbkR0SqPbqmjDnlzBYAVi5QXign/r4fxPETsJQjHLuhqKNi1lidC/VVBt9XeNDUNYCm6
 hNQu7cyMBW+DNBsieROPBZ33ez+ffYUCmOSl5oGIFtaAneSomqGU4B7
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005249_372671_82894AAD 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 30 Jun 2026 04:55:26 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Futex hash computation requires a mask operation with read-only after
> init data that will be converted to a runtime constant in the subsequent
> commit.
> 
> Introduce runtime_const_mask_32 to further optimize the mask operation
> in the futex hash computation hot path. Since all the current use-cases
> are of the form GENMASK(n, 0), with n > 0, a single:
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
