Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632A1D11101
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9S/PE2Qe1LCKRodbuyOrqzBPbXk+c18GxGFxHKlOXo=; b=dSn5VFDal10b6x
	p9nuDxCwZQKZTDqzsYjGT4r8dCNjFvQ0CU42wyhj6Qtbuiuhs1Yr7WsYI9WvGk2/Ojc1OksaPQ1NY
	/wslcLNIm6bSEPROsLiPIa/aX9Ij6X8FOJBn6K3JboWaPz1c9dMobYdr+91Hbvnv7jJfk5csrHT/x
	NxFkglt8d3BNJWT6bWg7puTs2WyuwwdVvjoSvF8NADzlx+4nSlzvBRmbo3LxNNgujzc6Z1PVBOHgq
	4T2caoNvbM954ppNsdjtA54i7mquThdT21wYN9j+WXntaDVbkAyrzPytQql6oBv56DmdMRU0UThNU
	zMhnanf+K+GWcVjrCNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7bzO-0000000BZLK-1VJ0;
	Sun, 03 Nov 2024 14:54:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7bzL-0000000BZKf-349H
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 14:54:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d47eff9acso2180711f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645638; x=1731250438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nql3DD9359qdXdLLpVtxL8oa+5wIDas5DqswNkA3KmI=;
        b=sxD46vKLcOv8WbXNSOd/Ll+Ir28ZzBMxg4OW1baZn8eNq4kK4yGjFZ7lvIP3XBBAtj
         RGofedpfatF6TipRhEpoTGRdx4TQsvrJezvYpY6jvdnyq8YkED78RmorFdaquNPzE6bn
         xFeclBXV/BWnUtXpS8phbE7ZnznCOjHNn9Ji0aPJpVpyWl4JmQKYEN3Gga230UiC13AY
         PY5k6PMTINubAtlH3T4bttJhxWaC+U0c1c+YywRKoC9m+9NXA08Zwo1RE0HeXAgvhiOv
         /8W44v4WkZx/caFwKbocuBRhwESmm/Lj4dIvVJCk8yGFdKkDmDgqvXkffaaAWqQtP+PA
         uelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645638; x=1731250438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nql3DD9359qdXdLLpVtxL8oa+5wIDas5DqswNkA3KmI=;
        b=X58q1eOSU97JEgNSBL4Q1xJtmUVCb8CTuQ3Ch0nMcgCt2I40guMhT91OKT6ij+ZdPV
         wRAdrEqTPUWPqAXfKRQCoTgyUXUtyTNBBdCNYWwITWViJ6DzAhW9QumxBiIj7YNzt/WT
         htz8NBBOOuyN/TWM0kbtRaKT1QinHRsPhvAA0HPOrFWGW6vbwFPp9gRHmb6lhEc2EyTt
         UXDh1q2iYMbh3OZGXKJNX/FkMlEgU0WaPxLlyhmaotvsQnc8ELf5WUkHvP/kDD3tUmII
         AmWU1tYVETvE1lOp2Mu2QBLocUMx6SvnfQHJd52oetnRwvgTNhPX1waaK0jsN3qZ0NiA
         pYrw==
X-Forwarded-Encrypted: i=1; AJvYcCVGEtMVdSegmbzZMXT1iLy/sgrE1NGy8k0fWqF4PblrVpgfJWs9MuwSniGLmsOAFyUM0PNeVap1MB6UrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZVHktR7+conu3G31TpV+tDZc7EMy8dCn2TU2NYBco8cyu/5So
	mtf3peSbVOdWgcqvoihkHJCcjFiJTwF0DxBVNrvHk4YIVVNAwZZze30tIPsr0wQ=
X-Google-Smtp-Source: AGHT+IEzqXU+n6yFRFqvDrou02tN/4/eCcsT/sjowi0L/ehc2kcbHr+rCGMDYfv6CZMwRO5vLoFRDw==
X-Received: by 2002:a5d:47ac:0:b0:371:9360:c4a8 with SMTP id ffacd0b85a97d-381c7a472ecmr8333590f8f.6.1730645638302;
        Sun, 03 Nov 2024 06:53:58 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d7e0fsm10710932f8f.47.2024.11.03.06.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:53:57 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 02/13] riscv: Do not fail to build on byte/halfword operations with Zawrs
Date: Sun,  3 Nov 2024 15:51:42 +0100
Message-Id: <20241103145153.105097-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_065359_793805_38BD6FAE 
X-CRM114-Status: UNSURE (   9.78  )
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

riscv does not have lr instructions on byte and halfword but the
qspinlock implementation actually uses such atomics provided by the
Zabha extension, so those sizes are legitimate.

Then instead of failing to build, just fallback to the !Zawrs path.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cmpxchg.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ebbce134917c..ac1d7df898ef 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -245,6 +245,11 @@ static __always_inline void __cmpwait(volatile void *ptr,
 		 : : : : no_zawrs);
 
 	switch (size) {
+	case 1:
+		fallthrough;
+	case 2:
+		/* RISC-V doesn't have lr instructions on byte and half-word. */
+		goto no_zawrs;
 	case 4:
 		asm volatile(
 		"	lr.w	%0, %1\n"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
