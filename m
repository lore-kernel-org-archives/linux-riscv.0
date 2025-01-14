Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFA1C02185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S/OfdNYeKMLyJnW5wUxS5bFl6l1o1EE/Kl4U6TnwUjg=; b=eVVHSAnn8cRoKB
	qifulo0i+q6Du7L4n6zQ8BumpDMy07zsIsk3qogsM9b7GkJVLatiPVn2CgwxZWF4qg4Hli4vQAjTn
	iVdZ47egbFqHO4UxzHoBPirh9zztRbMgzgkSyNx6jmUqDoX+5EkTnOiaeJgrBpmH1YvWd4CS+3ruF
	FZbzpPFYKLRS+PiW0GNvJbToOZazuSuycCOHI3vEM/zfWRyvL8s0yXa8SzcUU7uobaOXqn9w+DTd8
	ANhash8UHZ63U1fiIf21Ld++9IoIhTs/2/YAhiErEu5HjAC5qAbKsFwllxesLYU/UdJRwC8MFQ+J1
	CXDWm9NA+k1nTSMdx2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkPJ-000000098UU-2sUT;
	Tue, 14 Jan 2025 17:08:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkOG-000000098HV-1Ihs
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 17:07:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so3166768f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 09:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736874463; x=1737479263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gk8fgvjSMDx78y5lzfUT57Xiup2COiIkL+Pp/tlBbk0=;
        b=DXgehuWtpILY6KWgHo+0uSmzpzSFiLdj09taOTJ7IQpZixCM+iN10yltsKRCD0UUDw
         Tol2SAWdmK5nDLlpUbzUvS2U+zhH7s9ondpAro/f7DpJFnJM+6t7395iqx/dd4GPzVdI
         yQ7y0IMpnOuSp4DCC1OkWah8uKh9NUh/+UEeJGkrIphUlU72OZ9/QDYBD9iRF/zYToyk
         hA8I08845L9YM6swM6GplpaCMhNdkX9cdxrIBW0JIt2GKb7emz9h3HAQ/Ejv9LMdJOvg
         VHErVVGidNcKHfUTieHlyET6JwpMssV9zDWUXCvG0gP/GQWZkkyDAwzdMkxmxjGQ9/PD
         E7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736874463; x=1737479263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk8fgvjSMDx78y5lzfUT57Xiup2COiIkL+Pp/tlBbk0=;
        b=sk0399j98D/PnFh5Ri6wig2wTPvWmkSyeI9bGGX/x2hdTQsQLeEywR7zpAOMS9L+jO
         yFJMUDqfqQsc5KAFWgbyFpa/F8NJ71mIhELpTQgSqiYkLnZON7AUQxeeE462Ku9XXeCv
         MNv0E0U97EwbUYPEpUNjiRkRgF2B/1sXRxlv6jVcSQ3MmLSjg8FLBIGL6Oqapzc4mUXP
         kxMmsg2vIEnVw1ZBmjDkWWfW89n6wAPQOnx8SRyie4zvkEWn9QyPlC0VhbOtzATMoH9g
         pgcyI394goH+KaSTV7WyA50fdKA3C0qzoMMIhrJNPJFnh/Nob+VWDx0KLB/xMAPuZFLv
         765w==
X-Forwarded-Encrypted: i=1; AJvYcCXHtnlOg4y55kW12Vbq8rDJIS4JXawmHlAfXI4QcmzE4t6CA/0PXHkvT5tIy1r0lrKuTeh0fW5v3qI9nw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+3v7ERJvj3VANBZYyVEMdSkS/x/x77efKe25L12x6hDDTh/4l
	ZLWRB92EP0aJj0SLiGu0Zm0wCA4wzJlVKMk+wBK235EDjlee9XYI
X-Gm-Gg: ASbGncvENipuUktQT1M4zS7NsAuDe8OPYj6ezUtWnKm8fvzcKbj10UdwVJaPlh/z1L1
	TbB5SMGBr2BUjEw1cnYmcQImo4+kfA1Aod0XtoXpIeweCQ3m3lDR5PNYDvWp6Ldd7CF5bG8tr+g
	6VKsJEvyTDYRDX8dpZfs7uC1tDRfzz5S7XOSL9EW49RzlA4jFgWAUXPL2JzU4olxkGE3g7AZPrs
	fbgGeFh/rTzrz1MqICY2EW9K59paaUOSX0O2SYvIFrRz2mVE+cphRy8k8czBYsPdFtLdti3WCGo
	uwJmCxFOJnvy0tbJOo+B
X-Google-Smtp-Source: AGHT+IEUVNz4y01NUhG2yQ5lT5waJ8ea0XrlPzAEPVA6OkzCMOyeaUi83xVYUjfcZkDmF2IwproYcQ==
X-Received: by 2002:a05:6000:2cf:b0:385:e961:6589 with SMTP id ffacd0b85a97d-38a87303d73mr20840214f8f.20.1736874462459;
        Tue, 14 Jan 2025 09:07:42 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c6a2sm15450507f8f.54.2025.01.14.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:07:41 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stafford Horne <shorne@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] rseq/selftests: Fix riscv rseq_offset_deref_addv inline asm
Date: Tue, 14 Jan 2025 17:07:21 +0000
Message-ID: <20250114170721.3613280-1-shorne@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_090744_348860_75A451C3 
X-CRM114-Status: GOOD (  12.89  )
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

When working on OpenRISC support for restartable sequences I noticed
and fixed these two issues with the riscv support bits.

 1 The 'inc' argument to RSEQ_ASM_OP_R_DEREF_ADDV was being implicitly
   passed to the macro.  Fix this by adding 'inc' to the list of macro
   arguments.
 2 The inline asm input constraints for 'inc' and 'off' use "er",  The
   riscv gcc port does not have an "e" constraint, this looks to be
   copied from the x86 port.  Fix this by just using an "r" constraint.

I have compile tested this only for riscv.  However, the same fixes I
use in the OpenRISC rseq selftests and everything passes with no issues.

Fixes: 171586a6ab66 ("selftests/rseq: riscv: Template memory ordering and percpu access mode")
Signed-off-by: Stafford Horne <shorne@gmail.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
---
Since v1:
 - Added Fixes, Tested-by, Reviewed-by etc.

 tools/testing/selftests/rseq/rseq-riscv-bits.h | 6 +++---
 tools/testing/selftests/rseq/rseq-riscv.h      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-riscv-bits.h b/tools/testing/selftests/rseq/rseq-riscv-bits.h
index de31a0143139..f02f411d550d 100644
--- a/tools/testing/selftests/rseq/rseq-riscv-bits.h
+++ b/tools/testing/selftests/rseq/rseq-riscv-bits.h
@@ -243,7 +243,7 @@ int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, i
 #ifdef RSEQ_COMPARE_TWICE
 				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
 #endif
-				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, 3)
+				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, inc, 3)
 				  RSEQ_INJECT_ASM(4)
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
@@ -251,8 +251,8 @@ int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, i
 				    [current_cpu_id]		"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
 				    [rseq_cs]			"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [ptr]			"r" (ptr),
-				    [off]			"er" (off),
-				    [inc]			"er" (inc)
+				    [off]			"r" (off),
+				    [inc]			"r" (inc)
 				    RSEQ_INJECT_INPUT
 				  : "memory", RSEQ_ASM_TMP_REG_1
 				    RSEQ_INJECT_CLOBBER
diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
index 37e598d0a365..67d544aaa9a3 100644
--- a/tools/testing/selftests/rseq/rseq-riscv.h
+++ b/tools/testing/selftests/rseq/rseq-riscv.h
@@ -158,7 +158,7 @@ do {									\
 	"bnez	" RSEQ_ASM_TMP_REG_1 ", 222b\n"				\
 	"333:\n"
 
-#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)		\
+#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, inc, post_commit_label)	\
 	"mv	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"	\
 	RSEQ_ASM_OP_R_ADD(off)						\
 	REG_L	  RSEQ_ASM_TMP_REG_1 ", 0(" RSEQ_ASM_TMP_REG_1 ")\n"	\
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
