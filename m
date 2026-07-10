Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D88C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyiRScxKG3GAEN2SXAR94sWumMHOYYmosl4ZFuOpHAk=; b=WO53ARbm9O8udT
	uWDTFC4e2eeavnGatqg7p/hKxEPP9dUCZwb6ssxGL3hU5KXcuEBoLiEG4KrgV38Cb69IhRBtWn7L0
	UO0UeHKrOYru0f/bn6SVkbQAmuY9Erpj5gV5RkT9m0FfbunkVhjX9gsxW5QuKoxrxviQO7ZVrG86C
	XHxdV/6bslkWQD4G+JMmHqa9kZyucHncQ2VjF1XFKIDYNn/K2pLQLVT7jGEYvKSRdZOUKxOQnFkg2
	7ah3MBJqXTwA6VZEAszfs4bXp55h6Gzz8V2maFxL2WSixRgKZX1xIeCO39SjzvxjZAEA2XeexuscN
	0eQaQcDPIHAGmkFd7drg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62U-00000004NZ4-09qF;
	Fri, 10 Jul 2026 07:52:50 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62S-00000004NXS-00LT
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:49 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-381216921aaso843076a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669967; x=1784274767; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ihT/2aOY8wGTL01WDNL3ZSISpn356Jmov1yxoJ5Q2Is=;
        b=o2/OeIJwAduWZozbURAfY5sS2wMlzfFGLQfsJRzbcQ5eQX49+sr9OamSHDKlhIuHW7
         fC+QgWU8CMGFS7lET98lGV2TIegQMPohb91Y3nxVzYO/jw2CvyMV5SOGSjnYmmUVrD12
         Ut/AnrOU9w1QTdr27q/nojaT4lRm7+yJnVmvDLPEqjEwmRbzRGvq1ObX1/ZxInYiU+vd
         I9s/n9enovUverUJJCfTrU5tEGLl2En/sVlhZEsDz5+tiP3q4GjCtIAME+bqiDMICB+/
         QhnlDfjV+H3hfrfTQleVppm3tMRO34j7DtrUBfzXPe70F5YWNL1AZYr3CJtvfrsqYR8S
         3RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669967; x=1784274767;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihT/2aOY8wGTL01WDNL3ZSISpn356Jmov1yxoJ5Q2Is=;
        b=IsBjwTDQZIFRadyPx1NuLigR/ghg42NzFgalTXuq4OwM6tRyvCQQrKqerdJj17iM7h
         4a50pgexzFsYSN8Zed77Dms6dVk/l1hF2HXtFoWFHfert1Z1vjysF1R//GcJ9XI3NbRD
         UAmtTagnhHfLy+CCPilBxx4iZ44Va67B5FqFy7UUCGNwRDozFvuzSGUYgcK/xMBxIlb/
         tj7WuTXjORGR7fMy/7LdFZnZYrGVWpgkn9tgTzGomsHbc6PCkD3mFwysZnzyVJKB2FPA
         5n/gROcAGWug/JsPKpswpfiGnHKdFtBRtYBmE3ZqEO+3rbF4/jsxZ1hI3QQ7ZPGaAr8Q
         0qGw==
X-Forwarded-Encrypted: i=1; AHgh+RpjtzdBi7bn4fO8tnn0m+xIQ3lk88D5Z2T/0+81fMT70K1XFEgT0B5w/0fj0dz4JDAosT1ngQIVnP+Z1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuHKtp6Z1mi30PvvTMd9uVjaMCxRoMeyzTj/IpWbUqUHPmXEZz
	UA6vlLKoxXGv6BIN2dNVRJTJRNIgiEhZIxE9UFTWSaTBwHbg7SoxAN4KXcDc5VZ1
X-Gm-Gg: AfdE7clqej0ESBclvJuD+ml3UcuS3J6jycksYCnlY9aMInM/X/6XSIcRp0GSkwAzFke
	VlJ/R3XgFN/Tl/2fPeGqy/QCXjXGrbMvY/96GhGEDeqrO1XljS3U8JjULtI77yuBuSoZ6Ln9hWC
	sRkurcdnsakuygcmARvxBGf9rpox10XJL8Pn5GNZ5uVwovQWgrLyZFnrihf+lfEjMFu4iyNnyPM
	FTfYKbXmNaErPzmLereYJcHiRyp4/TV9jzW7VUlsW1GXI4VNzWhOq+j06DF4KgnoF2jH1DhAjvX
	3xUCm2fxA7yUOR2xtcfJfcXeIEcTXtCyqZqcZj7KL+MqxhOf/UUMOzG7fVmtP4IzvnEgotrdb6I
	1fwv+aBn7mZGkZIGVMp7hsDaNWIhdlWlJlfL+vis5T1E2J8duQSBXPYOIn/UvXlUgyto727dxKW
	OnkmNswUR4Kb5rT2nqEWJlInL7b76kg1lj2PnpK0O0
X-Received: by 2002:a17:90b:254b:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-389416e7dd1mr11435912a91.24.1783669966472;
        Fri, 10 Jul 2026 00:52:46 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:45 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/8] arm64/runtime-const: Use
 aarch64_insn_patch_text_nosync() for patching
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
In-Reply-To: <20260630045531.3939-3-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-3-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995928.1208691.248201589452077852.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=559;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=D9CFIdORg3KDPUuWXmjAR2RsP8Zpq9G9I7JzBgl41j4=;
 b=UkmRaKA4A5laoVQOHeU6g+5KHEhNh4nXv7y+97IHAPLwPizJjZc9yUiwBeTb07rPCZ5L7YjhV
 y/FrmXvAxlqDOKl91ohFaIJIf6Y3Z+PQbXebeX3Uf8dsWUwOiN5UCOq
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005248_046659_B889921E 
X-CRM114-Status: UNSURE (   9.51  )
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

On Tue, 30 Jun 2026 04:55:25 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> The current scheme to directly patch the kernel text for runtime
> constants runs into the following issue with futex adapted to using
> runtime constants on arm64:
> 
>   Unable to handle kernel write to read-only memory at virtual address ...
> 
> The pc points to the *p assignment in the following call chain:
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
