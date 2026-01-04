Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF03C2A06C
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GtUo2RWklJbQZUR99rJojZY+d9+CwQEKu+xBaEr6Y+8=; b=Agi3AQdY9Avu7c
	pprmEWcUDC/A21xXhAfwKsM56SmwqbuBZN59xNcss3abSlQBouOQmOIKl0PKVZuPpSCWyFQ/qAxoq
	K1EGcg+Rm4MnSgtbT8uv+QHWBCbl86v+BNIboi3rZ8vqoI7ZFydzlP6GZIEz+zSrZBmZAENGd3dvo
	c52i7L2cX9kV1JIRisnGj1S8xpNvqVQZopwedytzCj5dsClzjbcrcRcMg0ndbBnQe6vxdEGi8iSO1
	Oz5ZByujUiL4wQUz6tdYErSMurU3W3tA6EYgJIHYWmVBhiSMgATZ6yflknSlvjKzyfrtpTnIKfeAd
	k4ohSjlbnr34z2yuQt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeS-0000000AH4d-37Yt;
	Sun, 04 Jan 2026 14:00:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeP-0000000AH3v-3NZB
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 14:00:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a0fe77d141so151884615ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 06:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767535208; x=1768140008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEqhNW5O+8RAp0S31dtdTiF5gzWANx1aqh14jIZncZA=;
        b=mDvZw+W91ezUlORSgUlqxF0U7yn7bnxFpSsy5Iwqdy9aGW1UqIeCTLr2mkhGzSh4ex
         kkdVP8O5r1JRGMNC6XamEPh7unNczB+46ULIT1bFLfr9GLj1azNsRVwCvuGqitE/as9q
         jxiQiZOmD6OCn8t11KJsTxqRCAA5LN99ik+dmUTeS0iZT7mOqUY41hwjcnPkbYx2Swfd
         14LvpgogSJa2W/W4wcdYKog/rgUMDSR2++X5KCOHu6SH6TQzIKzote7DXGXePwxtkYSn
         +79RMFEF5vG+xK6+xCWjhKge0Rq53UxmDE/FG2A5yrGRW5PzPA4ctO1FiN/+4TgeZcJI
         Hlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535208; x=1768140008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEqhNW5O+8RAp0S31dtdTiF5gzWANx1aqh14jIZncZA=;
        b=mTrC0H40PgQBfGdx+j7RCMrWDMCs1yZPIYK/NG1NDmo6WyiIKkQoH4UmCkpHNniMr/
         Futs6wocNKD1joGihMIzVofoVepnWShSlCA3KR5kGQAFbOAIz6r1YFcOnubs7ByZYHsu
         4qv4Q6w9N/eBIHTeoud5jQHXxVEB0dDxUQW2AFU8hP3+0IrXhhicUDl2bkbuWIfyv53M
         45/R/Uk3a1HvWotuu4IxODlqXPojbH+JdpGEdQtwpkRNW73EEEYv0YJpsjgImzsRQh9P
         ZKnYAq34FfW2hDFNYWHnqlx/cUw42Pxm7RniQ9Y63+TfjdidmIn9mcs/1eGrIsOsuULP
         GwFA==
X-Forwarded-Encrypted: i=1; AJvYcCWB3E0Z3JoIWiYMM0ceL8m/5NPYv9M+JJgs8HUyQAMsBZ90XPxaaGUs3fhAVbXiwIwFVzrsuOXOPzU88g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLj1EPocFiY1J5jQZ+vcEWevf4igk1tI2thVnM8B4mo6CeP0Uk
	d51fDNo0C73H1GcgMDNtnE/un7okwvZjU07lj3AXhWFRA+KiUWvWC6z3
X-Gm-Gg: AY/fxX6lJ1EmLwWins4O1RlnG4d1IXehaMUyv7BBGbiikZ6pc5rgDKxfRl3aTcf7ZPj
	KUjm2ALMPdw1FqCZ4sRNgoSsi4b/8kEMelWc+pMKY1Kz9G5xBz9t7So7A8Ax2dhnFT2Q5c/MHlD
	rjWfDY3zCSLaMWhVi++r2OtIFCkv/U/xqx3hyYpLKok6aguuGYjwhuCsDA8HXamytt/ItSiPPZb
	VBPkg65q2GETugs9lN21jwxYlbJniFGxaYji9UnUI0pyZqT958CnV6/Q+3XjdYfy09pH4mdp6pX
	2egG7sh41E0eSCtpFprWEmHEVOEj8Ku1tdpjhG4cXTCgDir22tDKNczCGZ7LMBr1LCRINKeaa9K
	uI/3BCn9QwNrkS4SOvLeojZVz+wOu6Lz6lWuNvz4lDkf6gZ3zKnXA5pkYyKESD1TpjU5Gk5rquJ
	GRKuhSQ7ek7A3uaGEwf16/WgwwaDZcK9Pt+gDMAfc49Wii5hkJ6WKg38zjRQhoROLY
X-Google-Smtp-Source: AGHT+IHYOHBJT78zqotwaAPeOBEa33pI9OjGBIGmbHuEBwmEYLu2IfXRLZs8IapRix35ur7Qubzuzw==
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr476919905ad.18.1767535208281;
        Sun, 04 Jan 2026 06:00:08 -0800 (PST)
Received: from localhost.localdomain (g163-131-201-140.scn-net.ne.jp. [163.131.201.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm432327535ad.56.2026.01.04.06.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 06:00:07 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v3 0/3] riscv: fix timer update hazards on RV32
Date: Sun,  4 Jan 2026 22:59:35 +0900
Message-Id: <20260104135938.524-1-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_060009_856115_95C0EDA5 
X-CRM114-Status: UNSURE (   8.66  )
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

This patch series fixes timer register update hazards on RV32 for
clocksource, KVM, and suspend/resume paths by adopting the 3-step
update sequence recommended by the RISC-V Privileged Specification.

Changes in v3:
- Dropped redundant subject line from commit descriptions.
- Added Fixes tags for all patches.
- Moved Signed-off-by tags to the end of commit messages.

Changes in v2:
- Added detailed architectural background to commit messages.
- Added KVM and suspend/resume cases.

Naohiko Shimizu (3):
  riscv: clocksource: Fix stimecmp update hazard on RV32
  riscv: kvm: Fix vstimecmp update hazard on RV32
  riscv: suspend: Fix stimecmp update hazard on RV32

 arch/riscv/kernel/suspend.c       | 3 ++-
 arch/riscv/kvm/vcpu_timer.c       | 6 ++++--
 drivers/clocksource/timer-riscv.c | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
