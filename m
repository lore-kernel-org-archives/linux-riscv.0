Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780DECD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 00:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=APwq0+TN5P1AqAF05UnayGC/pv52AYzZ4/5+Nq2U4fg=; b=4Qh
	KVXVP8Mn9OI2JgdJ6vv3siUlHWrUls3e1quWv2548OEvtk/mbo2g1mcdNEEDAizPZ+ydi08B/P6bj
	OzZWalRxT0WPXjR/siKgHYX3+2dxfn2P4G52Xw9qmARG7jTWa5Vtj5vMxDnJZ2SKq5d48kd/TIA1a
	vfIDrPQB5tzrhpXcfBLPHWyJ0fRAv0O57tfsQW4n2EFKKUTyZAfq4an5t9Hy5vCqiPBInlRLJ6fjo
	1x8ebO4o+E6A1D0mn0V76HjHeq/tOKAy2fSk7Ea2rht+6kfIIZEPYB/h1Q3huhKNDxrJbAfmMx/Mz
	1P5mDqMnvRVuF6CYf7EM81foQSfvpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqu8-00000006F6K-2ByZ;
	Thu, 21 May 2026 00:04:48 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqu5-00000006F5R-33Wk
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 00:04:47 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44bf1ac8893so4241842f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779321883; x=1779926683; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UAkabFJHWBLwajif3qDHLP2pVGG9efW8qvp23UJA7Kg=;
        b=sAtrmJa0VKoGuQmWPaGh8h9gODvkzvl//OB6xr+jQWHiszl5+NWW/4mvI0JsctI4yc
         B6vq9x9CdsguGHwpCwjXpDvCyULm4O9r23nAdkWa3W8CLgoITeiBNGGkWSMEOpXmL5xR
         NhHLG8+oq2wbU1FgkN8EcPinTg5XJvUQH3uu0ixgmj58vk8XXaYNMjC0KttASw9ts+pR
         w+uCOPpxG7/qjp4gYdIDU1XkBlIGKnax+1r3UhI7WlU2i8hllVfsFxYPqBssygvm8UvK
         PMdckc6m91EmulKg6gIemmvLYaqWZeUhTNG8XMto79BiMiI193XculN08tPxoeHD1NZH
         W8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321883; x=1779926683;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UAkabFJHWBLwajif3qDHLP2pVGG9efW8qvp23UJA7Kg=;
        b=CgRdu6N8Hs7PHOQs8lH8vyib3gtW31KyHlnL34YU6JOTo1xoRjVN5cqjFvoU0cYo0a
         3ENrpFFqrlwZ5xPQefiV6tL8pDoyWTRtsXvKLQIBqeOGI5s6YgC4Yg9Woyf93ddtlCVJ
         mnGhL3PXDWqB/CLAAiPm5K3TK944pOTOGz8sZdQQdGzoI3C0u2whQ83PtP0b1ja5R1w3
         z5HSWexGUEMvHLT5DpvV1DyqsBzX/OkomC1yZd1fuLYJsPLYOa52IZ83Heq6thoGGy1u
         gsAFkQafdZ2PMOK5u70oakka/Sgi1f0UUmanu7gR57UqPj+/oi94cd/SD9B375amyoEa
         M8aA==
X-Forwarded-Encrypted: i=1; AFNElJ/yAkSz/64x7eO2hC9XQA7AVAGjf+Ip9YmEXU8HOZuM2rTpgPDKBpfEe6kleiLXNm2LFyygohDAkrd8Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzehE1QFr0vAqXpC8LA7UHdZQRzF0DJG/kibwrx8w02xz4kuHKu
	PPT8/1rMOgO0vFKmu9LDE6smp16ZIgkr5PV9fPg0XKcetn4c7MJ1geXYTPmOv1tC4uhJ3NkbPEW
	kSQ==
X-Received: from wmaj9.prod.google.com ([2002:a05:600c:6c09:b0:485:3bc4:b1d6])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c16:b0:48f:d2b5:d7
 with SMTP id 5b1f17b1804b1-49036039043mr6867595e9.12.1779321883037; Wed, 20
 May 2026 17:04:43 -0700 (PDT)
Date: Thu, 21 May 2026 02:04:33 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521000436.3931067-1-elver@google.com>
Subject: [PATCH] riscv: Implement _THIS_IP_ using inline asm
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_170445_776666_6D5E9B2E 
X-CRM114-Status: UNSURE (   9.62  )
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

Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
be broken:

        #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })

In particular, the address of a label is only expected to be used with a
computed goto.

While the generic version more or less works today, it is known to be
brittle and may break with current and future optimizations. For
example, Clang -O2 always returns 1 when this function is inlined:

        static inline unsigned long get_ip(void)
        { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }

Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
<linux/instruction_pointer.h>) using an architecture-specific inline asm
version. Additionally, avoiding taking the address of a label prevents
compilers from emitting spurious indirect branch targets (e.g. ENDBR or
BTI) under control-flow integrity schemes.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
Link: https://github.com/llvm/llvm-project/issues/138272 [2]
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/riscv/include/asm/linkage.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
index 9e88ba23cd2b..7e0210ef4eb4 100644
--- a/arch/riscv/include/asm/linkage.h
+++ b/arch/riscv/include/asm/linkage.h
@@ -9,4 +9,6 @@
 #define __ALIGN		.balign 4
 #define __ALIGN_STR	".balign 4"
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("auipc %0, 0" : "=r" (__ip)); __ip; })
+
 #endif /* _ASM_RISCV_LINKAGE_H */
-- 
2.54.0.746.g67dd491aae-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
