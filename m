Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC5AC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUc/CnGM69I2CO5nhDhChWoKHuhjs2gZOxMoofHpHWk=; b=at0nY3eqeNePom
	/SBsBDXCu2snRFp5n+PaADh4cim7wJcsiAd9RqxmHMh4IaQSEj7Xn9hypCtT1t+iljUY6BWKz8oPV
	2XgLdqL/FU1EA0SG6PHKhvvm3LnD7FgzKBm3DbNCGEy7Bkb8GOcnHBOGOMaWNgUgooC049ugq+qcF
	SCtxI0HRT+0BBQ7whmQpkCSTGwmSSUhd0y4RPfTqOxwEYqeXk5naK/aH+pfbx8cO/9TUzHKhuYm/r
	Dz/C4H9A9SG8vUb4d9eEFwx9ZR5uDVRkolLF4t0R1gnU10uysQZHLL1QJbmhDE5FcdtU3SZjcVyKl
	D7O4nji0zM+IUZR8mUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1raR-00000001ghu-23cn;
	Mon, 07 Apr 2025 18:52:47 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qup-00000001Tdw-1hwU
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:09:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2255003f4c6so42077045ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049386; x=1744654186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyM5SZww3BsIxLq5imP6WPb97ECb0VvvV7XlSlZ6uaA=;
        b=iNxMPko+4rMMJzFUl3cPfQi1VOsT5CDHM7S8r3n7osgNggJ6/HRg8qYldTIv6tmgoa
         FoxAmxW0QFTa/fTIhkc+BQ1K2afrVaoYh1ghpcHj/l/L/l7DuIGCmjtSq+tLdGP5Duon
         OeCyTHybavOaZoHIonU9hikkDRoSzr60MqWvFJRFZNVVEptGt8TgPGEc0LCMH+eB+9Gj
         XQ9o3eYOCe2nPWulLIINFYJSHva3Wy7q544HGO4ByXjcGdLnuyb5UvdyiLW3pP9POYi0
         hUZh4/RJtKx6/FvQ0PFKAih86D/A0Mm9o45QF0S6rSR+og4iwrgBcKpmwCIGEdHqJxYn
         YaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049386; x=1744654186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyM5SZww3BsIxLq5imP6WPb97ECb0VvvV7XlSlZ6uaA=;
        b=p56cg38U/y0vrOIrE7EYccgquAE/ILcDOEDqN6Q81hIUJx9dQJ/RsXGhkAMlgFKHWk
         eZR6a+QQTo6vRU7TyVqnc63N1/R+V9Z4icgiKLYLRsnpvWxkOEU/ucGh8on39iLMfwUF
         eny1R05ira1kZLNAvY2apRIBtUfBHE9YYVMhLqXzVTSvgKGxEOwYhwunjLQZ52Ze/wCy
         6y9ZEdoEuvjParERcqdsvCA/6Cz7lfJOm3ePSACqux269aiKeNjJAo9iZcUWZMO3vv+Q
         /GPPbq94Y5b6/sDEgw4cHT/Z3orn3jvUHgTs1b+uVUr52VC93SEMx/Jbr/ef5MjOoir7
         Zpvg==
X-Gm-Message-State: AOJu0Yz8l4VGEwFWlp4xnVJhL/BeABz8EjTd5uU+m3elRtE83zIxfCGq
	9ujJBJJyv9ag24w5+13mxzucZF4Fj+Gjt0xQzzTuFdTmCzudiahhA4atrlDv
X-Gm-Gg: ASbGnctOyUqXvv2J417uamFnX+edLHtzFxT1/NDdIPcdDeFTlmuje3Du+gYM39rq8lg
	jmsZg700hE9Bo19SEMyo205CQXpVnU8qrmVxCy5aOWmEzVSzOS0P2bK2mZQ0dmrq2PgtYS2odNf
	TUF/CTiheF2yMPaAK98CnyyhYKnfjFwY2oRs83LOOlijVwU0RJXGacUbiDWM7etVdokGn3YHhXV
	Mpxr17WWPKpdcPBdiZAJIoqKRPnhjnmE+2CabV0B8++hiEXzxCeqTbFL1NV+0Zh60xUTg7aISId
	37+erI6mU12tzlBFw+VTFG1bsAKLKDmNFf2HhRt/z4QWvhe+jcx+pm66aT143F4ege3v46gzBOw
	uuBzKF5svfvI+cagOehDZF2Yr/xcSp1RTqA==
X-Google-Smtp-Source: AGHT+IH4QUToL7D8e8p/6On2iiP6OQv/SkBOfhg4jmTT3eYoxpzbIuK2HeFgMoBbObddEAjzAiLW1w==
X-Received: by 2002:a17:902:c40c:b0:224:c47:cbd with SMTP id d9443c01a7336-22a89ebe8e4mr191891385ad.0.1744049386163;
        Mon, 07 Apr 2025 11:09:46 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:45 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andybnac@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 12/12] riscv: Documentation: add a description about dynamic ftrace
Date: Tue,  8 Apr 2025 02:08:36 +0800
Message-Id: <20250407180838.42877-12-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110947_442945_D99666EE 
X-CRM114-Status: GOOD (  16.18  )
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

Add a section in cmodx to describe how dynamic ftrace works on riscv,
limitations, and assumptions.

Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
 Documentation/arch/riscv/cmodx.rst | 46 +++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
index 8c48bcff3df9..e009873b2d17 100644
--- a/Documentation/arch/riscv/cmodx.rst
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -10,13 +10,45 @@ modified by the program itself. Instruction storage and the instruction cache
 program must enforce its own synchronization with the unprivileged fence.i
 instruction.
 
-However, the default Linux ABI prohibits the use of fence.i in userspace
-applications. At any point the scheduler may migrate a task onto a new hart. If
-migration occurs after the userspace synchronized the icache and instruction
-storage with fence.i, the icache on the new hart will no longer be clean. This
-is due to the behavior of fence.i only affecting the hart that it is called on.
-Thus, the hart that the task has been migrated to may not have synchronized
-instruction storage and icache.
+CMODX in the Kernel Space
+---------------------
+
+Dynamic ftrace
+---------------------
+
+Essentially, dynamic ftrace directs the control flow by inserting a function
+call at each patchable function entry, and patches it dynamically at runtime to
+enable or disable the redirection. In the case of RISC-V, 2 instructions,
+AUIPC + JALR, are required to compose a function call. However, it is impossible
+to patch 2 instructions and expect that a concurrent read-side executes them
+without a race condition. This series makes atmoic code patching possible in
+RISC-V ftrace. Kernel preemption makes things even worse as it allows the old
+state to persist across the patching process with stop_machine().
+
+In order to get rid of stop_machine() and run dynamic ftrace with full kernel
+preemption, we partially initialize each patchable function entry at boot-time,
+setting the first instruction to AUIPC, and the second to NOP. Now, atmoic
+patching is possible because the kernel only has to update one instruction.
+According to Ziccif, as long as an instruction is naturally aligned, the ISA
+guarantee an  atomic update.
+
+By fixing down the first instruction, AUIPC, the range of the ftrace trampoline
+is limited to +-2K from the predetermined target, ftrace_caller, due to the lack
+of immediate encoding space in RISC-V. To address the issue, we introduce
+CALL_OPS, where an 8B naturally align metadata is added in front of each
+pacthable function. The metadata is resolved at the first trampoline, then the
+execution can be derect to another custom trampoline.
+
+CMODX in the User Space
+---------------------
+
+Though fence.i is an unprivileged instruction, the default Linux ABI prohibits
+the use of fence.i in userspace applications. At any point the scheduler may
+migrate a task onto a new hart. If migration occurs after the userspace
+synchronized the icache and instruction storage with fence.i, the icache on the
+new hart will no longer be clean. This is due to the behavior of fence.i only
+affecting the hart that it is called on. Thus, the hart that the task has been
+migrated to may not have synchronized instruction storage and icache.
 
 There are two ways to solve this problem: use the riscv_flush_icache() syscall,
 or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
