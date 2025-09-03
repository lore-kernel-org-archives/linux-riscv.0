Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83608CA1015
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xMTG4dGVUyWrI3/RjfsozzxGHYqwjD9/GDeBwt4v90s=; b=V1ha2ZZvU+Nwwi
	6hpHqdKN/5CwvtFhcbRa8o2nq9ZDrib/HBgGLRBzCd7SeEnVy1lASDfAJCO/pB0f+cFabHYAgA3w9
	luVl/c2Sx9enFw18oHIvUE7d4xSNW4XssXo1HEKA64Az40zGkkyV7kZ/a0Ck0xSAAxIFrNS4LIy7k
	9UxVzYMln3cpnGURJjh4zf0q7fcsy5VmRcg7cw+SbYzE96IydS6jg1nqibsDiCBpdQ/E8oZNGqm+E
	xceH3mIPnVI3Yqy+XQmr3+fgniDEx3BAOtrNXzp06r9Oaz75z4ZSdHmhlG7AKkf4rREZr8OhrCJn/
	D142y3Jj78y64rqnaa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQK-00000008DrW-1zYW;
	Thu, 04 Sep 2025 02:10:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttZN-00000007UwQ-0tqV
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 19:55:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so909935e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756929298; x=1757534098; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WemNBSJgvSeExxk4SwgXWO6xPmX/LP/uVncZJ5kxq9E=;
        b=ZG30pz6bNCGbtudII/w52gSa3AujmXUtEaMV3+XJY1kLYwE+o/cIwjdXRtbpbJTJ3M
         Viqi0koBL00IUh1BkCODwvdlkSS/UuhGpdH7Uh+OfjzovLeyrB6omxuJ+FPhPwiItFt4
         k8LWGus+NEMd7Z3wpc7G5FwMLsVgWt84Wa1Aw3eBFswyHy6tR4UDQED4MYLpYsdi43MD
         dwQR21Md9rVKZv0mKra7rvUzxQLucJ/yHEku1kQKQNNdegp+9GsFj9j/u0dyXMOmygHW
         et4vBsi+JrWZUrmdUuRidOvIAeeB0Y6bi1C7xJAUK0cFWtFzSJZeW1p0by+h8bCmWUGx
         VrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756929298; x=1757534098;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WemNBSJgvSeExxk4SwgXWO6xPmX/LP/uVncZJ5kxq9E=;
        b=ck/0vxFSLYip0LNYKgdOBqYcEcIJkQL/U34Z2HZmRBuUl/zBE+KwVZu0kNbHJBmmj3
         +0zOqSD1xrnFy5LMs5P6mE/iWaWE57Decycm1zTNcHsKDSx7tsijmbQwLEGvrIWXpvC5
         7bO31Jhv0mlu9JlTptmFwrsa9NQCjaNn1oZNRtIcW4oROB1TahDY2Q7UbUJseh9OF7hx
         dh/dGOlZmNXy3eERkOWx8gCwr/VGH3I2ogBsjm4ScizvLRb/jgwraR9eRnQAdMthPFvl
         1vccDC2Uc6tG0En6BOVduyi+Uifk56soeGho0cFiNGapM/+SW6442G5pHhUXWkCjHahL
         z/UA==
X-Forwarded-Encrypted: i=1; AJvYcCXErV1SMEH0HYhIwVDRtEhrz0YdAffFek8zrS1U5YTPC9uUZ3RFNcy1qqgxhIyRQ6ZQRF+ZNJ013N5vrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1HMUHyV3AQGCz7eqEmkZEZzEjMVgRbP7u/8Iq0Qc16wnNq6lg
	QXa0T3Aw6YugavdlXSEyepvFaYoTKW0qgHJYdi9LSiLTfkwb9HNXz4DEEs8gY0dfd2w=
X-Gm-Gg: ASbGncv1pu3HnHgQYqUR3gqVGXQP40UQlM43z1T1fPzOzw6ESDT7I7SclTlgaPyRoRy
	s9rbQsQ0BvxFaIQyBg8JRywTHRl/bSejVB4+CxTbuiuT6dV1HuEHqNRJDxE6pGzu2IDTvgpSs7v
	o8I6rqmv+sKGRGULUtAtRwyoEPbpDwcsMJw+iLEer+aVUDGQovpJQzM2MsNh7p9aHDyWMDVxhpM
	wFFtBCqJFWXrYFa1iSgrErzRh/cX6fz/Yif3Vb6++q/PxFOmE9wyM4WGwwMDPHVYgQEDXxoCoYS
	acgE3vGgBurVDm1rlNKv6kosmcIj7oXlSTxKCE99fc15nHN23IyeQ+YVBynDDObQ9NiqNs+sCPu
	9NX2mnUh7tGVRbTAYGyMQTeCnW/p05hS+EytoQt5H2SBJkp7fz4bYLLk7As4RvgbtwbXtBPeeE3
	KM3Tlg
X-Google-Smtp-Source: AGHT+IFJLqX9lWt48uvYEkJALLRR5ugjPDz4Bm8zdqTvK5mO3zXyFw6a/hUpgKW7TWri5+ZASWKjNQ==
X-Received: by 2002:a05:600c:3153:b0:458:bda4:43df with SMTP id 5b1f17b1804b1-45b85570996mr172993485e9.17.1756929298246;
        Wed, 03 Sep 2025 12:54:58 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d95df59e50sm9504812f8f.23.2025.09.03.12.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 12:54:57 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 03 Sep 2025 19:54:29 +0000
Subject: [PATCH RFC] riscv: Do not handle break traps from kernel as nmi
MIME-Version: 1.0
Message-Id: <20250903-dev-alex-break_nmi_v1-v1-1-4a3d81c29598@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAPScuGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNj3ZTUMt3EnNQK3aSi1MTs+LzczPgyQ11T82RTYyPDNONUCwMloN6
 CotS0zAqwudFKQW7OSrG1tQDR4C8EbAAAAA==
X-Change-ID: 20250903-dev-alex-break_nmi_v1-57c5321f3e80
To: Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Guo Ren <guoren@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=ep2ByU6Sp3PUGleU/SkPJKB1vnJZEKwUxxPzvfc2zHY=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJ2zOUQju2NeZLt/efBtlSDKNmvc3VLoqScb2v/XMt29
 an+IY39HaUsDGIcDLJiiiwK5gldLfZn62f/ufQeZg4rE8gQBi5OAZhItxPD/zq+v5/fzr6bXrSu
 ZMPx6vftCVu/bNnvsdBf8ceyozc26KUx/M99/HGOKsOcDa2nZq0prmblyUi9l8nxo1j6aJNWYvK
 bZi4A
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_125501_313106_BBD41355 
X-CRM114-Status: GOOD (  13.06  )
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

kprobe has been broken on riscv for quite some time. There is an attempt
[1] to fix that which actually works. This patch works because it enables
ARCH_HAVE_NMI_SAFE_CMPXCHG and that makes the ring buffer allocation
succeed when handling a kprobe because we handle *all* kprobes in nmi
context. We do so because Peter advised us to treat all kernel traps as
nmi [2].

But that does not seem right for kprobe handling, so instead, treat
break traps from kernel as non-nmi.

Link: https://lore.kernel.org/linux-riscv/20250711090443.1688404-1-pulehui@huaweicloud.com/ [1]
Link: https://lore.kernel.org/linux-riscv/20250422094419.GC14170@noisy.programming.kicks-ass.net/ [2]
Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
This is clearly an RFC and this is likely not the right way to go, it is
just a way to trigger a discussion about if handling kprobes in an nmi 
context is the right way or not.
---
 arch/riscv/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 80230de167def3c33db5bc190347ec5f87dbb6e3..90f36bb9b12d4ba0db0f084f87899156e3c7dc6f 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -315,11 +315,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 		local_irq_disable();
 		irqentry_exit_to_user_mode(regs);
 	} else {
-		irqentry_state_t state = irqentry_nmi_enter(regs);
+		irqentry_state_t state = irqentry_enter(regs);
 
 		handle_break(regs);
 
-		irqentry_nmi_exit(regs, state);
+		irqentry_exit(regs, state);
 	}
 }
 

---
base-commit: ae9a687664d965b13eeab276111b2f97dd02e090
change-id: 20250903-dev-alex-break_nmi_v1-57c5321f3e80

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
