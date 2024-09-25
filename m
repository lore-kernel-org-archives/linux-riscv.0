Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B6BCF9C6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pu+IZLm/uTD5bDoyOTkIFftoJM2kYrwWz/veLKu9fyQ=; b=X2eo3KO0Bvyq2j
	hM4bQ+Tyb4uKDWcaZISBRe0UobU8nErffunIilF7LyhXkzgFBFpqLK8KQCT4th1H78f++qO9wKWgq
	JbfdiWG45Sz7A06/FYPgxkyeK6qExhbFLg8rljEwc2ZWnXjGGteSZ4EtJVdgUT+XZ2VSg85kO4Gqf
	A7iBhPebzRUKTkpgz6Ss5brXu7PeL0k0jr3/ZmgFEtdNwAHaWZiqXS5OV35+nCDZA2fei89gmT5Sd
	aLo5ZE2MIj33OMX7KaG4SUIoR5w7FVIQRPONYr6tCQSTrt+z+nBhIyEaO88JNhUObGeade/XutzFp
	qX4R+hq0f5dJyGrNIwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stSyP-00000005cZG-3Ybu;
	Wed, 25 Sep 2024 14:26:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stSy4-00000005cRU-1WEI
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 14:26:15 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727274368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=py9zJhLKb6mfsbhyVeGc9zy4/v0ahaxaP57U7i4tzLk=;
	b=nWxD/yez0EBhgfgMJTePjaiFjF/SvuK6EDSugtPEnzo4ubEyw2uGIjjO6h5s4ZclQdvB9e
	WovUiQOlC1B2tDcoyRr0SK9tqRAhR/jv/xZNvnye2CQVTqJXGPYM4wzz4U7Y7J3+7F+z0y
	oYl1GN53GRmdVsr4+jqFMULsSfzibb+E90RGeyR/1HHna5144soGImnlNQMrEfayUc0t4l
	dUxmNfu2sxAkNKBIJvMm+6ljf2irnFU8d4L6R82Iv7JrjdVFoZmTZcMIQhgqxuNXRCDsGa
	4vqx/Q3BlNSNRygFwsNK2WXPXEdrrxaCXnQ0Jor4mKRAnkX9NMpY0o09bqPuzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727274368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=py9zJhLKb6mfsbhyVeGc9zy4/v0ahaxaP57U7i4tzLk=;
	b=DmMdUp7g3qZJeIzI+T2Jst17gcvXwcBOpoG9vWUjMH0+Q27U0V/M2dMRj+G5yWmknGViGC
	lbncjjJTZpWIAFDg==
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
Date: Wed, 25 Sep 2024 16:25:32 +0200
Message-Id: <20240925142532.31808-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_072612_561756_C29E13E5 
X-CRM114-Status: UNSURE (   6.54  )
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

The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').

Also, the riscv privileged specification names the register "mimpid", not
"mimplid".

Correct these typos.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
ask me how I found out..

 Documentation/arch/riscv/hwprobe.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 85b709257918..fb0affa61eb9 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -51,7 +51,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
   defined by the RISC-V privileged architecture specification.
 
-* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
+* :c:macro:`RISCV_HWPROBE_KEY_MIMPID`: Contains the value of ``mimpid``, as
   defined by the RISC-V privileged architecture specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
