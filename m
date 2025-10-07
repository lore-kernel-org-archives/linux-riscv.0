Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1E1CCD18A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0cFyhIJMi/EWXxdjVClFmaFywnLVXk3sm+bShs59xE=; b=G+QleO18tEMG6O
	xWZz3UgigZxmnDmlGA63a7gBIajxiduLhS0CnFl8tixPonUgQzbRXU87Wh4/SPVCvNDLgvVE2xKmZ
	MuUU913btgNyilfnUvo6mBy6VvgKZn76RFGWD5CfBw0bAzMtZq5bnsgRc0pz5Y/vV68RtWrBikoxC
	X0K3SJLxdIMshin8OpkMEvQOthqXf/Lv0l4muisTNY+yjEh/T/UTTEj3lOB33JR+jpoCjlUy+SD7y
	di3qRfckYqk/tNHfirzLQEqVI9uk3GFRidMhiubj3jynrFk7+OwbxXi3HCwChvBLmLjbYgMszydz5
	DM54fHiKe1xII/VMV54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LE-00000001w1A-2mLB;
	Tue, 07 Oct 2025 11:58:52 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LB-00000001vzi-3fYD
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 11:58:51 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-57b35e176dbso7963854e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 04:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838328; x=1760443128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN/m6BO/PR+KoZSa3zwPl5m9cqExBgUP+sv/+YAYIuM=;
        b=g9mon4/cdUjECTlBnaaBfzVansTEtS9FeCtZNmiGcZlq7/8Stbe95LEaZ6y8kGpD/q
         FOYftETRUb+fApKQefND5dw45qYlcX1GWKOv0fTqU4zqZqnFvh0u+W+OMDAd5Pnc/w9B
         Sx+im9t5PFjH0OKqt2Hv8yLJOTMMYCdCPovU+HBWHw3aKILxChsTAmNVk6cZr80PpenN
         wbpADzIauPKizXNrdT2CX8fumpw/Q5gkCwm7DELInfdLLeDf/2CmGGJ2BNMlQqV8RapX
         pLeL3DghAzAHCp+M1iBWMMzxl9QnDqicGYk6+h0SNCCLfRwEIfRv9LA5DQp5TxCn7hAI
         N1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838328; x=1760443128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN/m6BO/PR+KoZSa3zwPl5m9cqExBgUP+sv/+YAYIuM=;
        b=uIp/sGWleEB+Bj6qXqur7a1VDT7lvLJbDXv5F0qi1SZyL6JjFnlV/k75doJNuDeKTd
         r9mV8HXjdc7GKO0+Ktqg50ZfZltimuiyBRlY1FdxEiAQeT4160h5lmqbJtJ2e1r8aPrp
         Polv9SSU4ifN0Hc8CrdyQ4cmcfMP+Vlnhw392id2/3HErZ+sfWtgWC5l629XLlrDcwdZ
         q8nmcYg3rUaLwoydn62APLyiOg0yf5n/K/mNnalkeJ5QFxDLcGHErVW8qmZQqFeb6dJD
         bh5Tr2XC+RlCpOezLOuKBAYzG698VC5gtAIZeHly8umCO+V8CYT6OKxwcBj3fdmC1hJM
         sP5Q==
X-Gm-Message-State: AOJu0Yyfn5/mKYUlSQSkjy7kj98MkG/VhgLjyYWAPBC8PZcEimkQljdJ
	5/9TjM34yPy+5CUDBQa2GxT1UM5hOrCGKUGY5m6yA/jxBL+O/sgG48TGZ98nqQa/
X-Gm-Gg: ASbGncu9zkodjXkK5vsr7VU9bFc6GKBc3XJz7H3XMAp2vyxBNqeXXoIPXzAQ1N7kYUg
	Gyhj8whRc7850o8x5UdYfHhkJdb1KgfEnRoAEPekhUvmG7QABTF7UhoDuEzIEVaFwIZY8BzZTiq
	ajJtUjKRtqgY6iAnUIG5cL/gDzK63yXLnPQeHbLnuKUrG9rmAbB2YAMtpxO5f5zVFMkX6D0co5x
	BJkqrdH4M1BlxHlXZL8yIBWTJf6Z39xTxZzyDdW7UP1ODpRxp56QuxnGei73wYcBz+ml2WeUkzT
	vsz8qRE4imivQbf8vMPTwdFrAf31I457VB/99uM3uS2WiMUTdCxuRzTcOdwMHB4jHAYQ/bLyS/m
	ypQXqVGPGEIehI1sfrhuEiox/FQE5kVLF3h5AUw==
X-Google-Smtp-Source: AGHT+IGVHCBDB2QZW+h1zkAX/sQcZXgkJGGPhYHu9ZuoYVYoNE7EgWv7rs3lrzmRXlTtUhHrJYj2Sg==
X-Received: by 2002:a05:6512:10d0:b0:57b:8675:e430 with SMTP id 2adb3069b0e04-58cb9a3907cmr4186418e87.13.1759838327224;
        Tue, 07 Oct 2025 04:58:47 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-58b011a8941sm6043339e87.114.2025.10.07.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:58:46 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nam Cao <namcao@linutronix.de>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Ilya Mamay <mmamayka01@gmail.com>
Subject: [PATCH v2 2/6] riscv: ptrace: return ENODATA for inactive vector extension
Date: Tue,  7 Oct 2025 14:58:18 +0300
Message-ID: <20251007115840.2320557-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007115840.2320557-1-geomatsi@gmail.com>
References: <20251007115840.2320557-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_045849_935207_0BC41606 
X-CRM114-Status: GOOD (  14.68  )
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

From: Ilya Mamay <mmamayka01@gmail.com>

Currently, ptrace returns EINVAL when the vector extension is supported
but not yet activated for the traced process. This error code is
inappropriate since all the ptrace arguments are valid.

Debug tools like gdbserver expect ENODATA when the requested register
set is not active, e.g. see [1]. This expectation seems to be more
appropriate, so modify the vector ptrace implementation to return:
- EINVAL when V extension is not supported
- ENODATA when V extension is supported but not active

[1] https://github.com/bminor/binutils-gdb/blob/637f25e88675fa47e47f9cc5e2cf37384836b8a2/gdbserver/linux-low.cc#L5020

Signed-off-by: Ilya Mamay <mmamayka01@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 8e86305831ea..906cf1197edc 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -95,9 +95,12 @@ static int riscv_vr_get(struct task_struct *target,
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
+	if (!has_vector())
 		return -EINVAL;
 
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -ENODATA;
+
 	/*
 	 * Ensure the vector registers have been saved to the memory before
 	 * copying them to membuf.
@@ -130,9 +133,12 @@ static int riscv_vr_set(struct task_struct *target,
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
+	if (!has_vector())
 		return -EINVAL;
 
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -ENODATA;
+
 	/* Copy rest of the vstate except datap */
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
 				 sizeof(struct __riscv_v_regset_state));
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
