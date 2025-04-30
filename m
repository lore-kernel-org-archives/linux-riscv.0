Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66880C3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I3yTOAZ8KOaPTbaOtGeLpIs+5Pv1dcDKm+XpoALoqSQ=; b=0mSK+dopGKQECGeYWPHb0pM43b
	9CQ5ddl7vurVafenzPYIXvcdE9IEbdJMyJlnqTl76FAYtfZIQWDQcSemSCE/039TeY9tmLOkRFDjI
	dj2QGcnepFpHg7PrypIeT3eK2ctxB7vqlNOZwhHy4VRlPG/jMNC7qbUU/APCdO5Jaw+XzxrzIAhl1
	bxa1IaxaCoHW51hkxeIBP+KSgo+AV/J4F6CJefKdDtklygLkNsEj3Lw9R6IrRTAk2Jngj7Wty7NOW
	w5X1HgOaLwYuL4OQZbpwfu9DdGOFHCuvoUdK94LfGxUjui7xOAtqIY7sfFyronzSWWBE2VvjW/eE4
	fh3cz4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vfJ-0000000BNjw-3vYl;
	Wed, 30 Apr 2025 00:51:09 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vfH-0000000BNit-2u5e
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:51:08 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so4933634a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974266; x=1746579066; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+l4CwmzcQV88NSApvBjyn1wiwPNcLUJiUFhfemm+Ew=;
        b=f7RT9IjkRZP/uDHxVuDKHxUV0aeQq0VrJfvl3JZ3HXXDLxMW8tqwYSjq6orbdfChaq
         HTYZF9kYDfs+AexRsIY83e3OVTff+3jryMN3hxp9iziT9Ia0/XIJQhrYQXuA6i+JRs1R
         k0Gw8vjzMNoxq6UT64pT3hiN9YJ4MeGcSVbeVgPS74fU6FrWS8Hgd08LIcbVWxTGUpEA
         ByoB6QG+26XalJe0UQPHWBGeryMsHf4XgA87RgjYNHnprO1cvUMUAPiR7DvrVGob9/Pn
         0RmnUkNDgARn3+NykpmT1McagFnrwFPHMRQ1IXBSDn6oQkhpMiAhQHrpQibk8H22LIZy
         pI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974266; x=1746579066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+l4CwmzcQV88NSApvBjyn1wiwPNcLUJiUFhfemm+Ew=;
        b=QdfGex0NHqT5nRsoeJngFkNqrVjzfpl9uHwRrTJrOA0+hEJq0UwJvfFXVo1oQoE8EL
         w1jVR97ozJVnE7yX31X2tX8Xj1+2j2t9aDVFQl7zc1gEhdxUgbl+/CzbrY7DH10QVWWM
         RT2OD2fAOFX2YT879tjcSa+j+EYnG8D0sfcLVJ3u5g2hyVUBsAp/ItogPpUWJtl4wiz6
         4tvXHiR2pISRVU61EwefnNhocsrM7tHftKjnxR7MAtAlcX2hL2zsiFb4dT7J3QAqkoSO
         WrSSMlfkDNrKKKDJRoZ47ZR9K/QGwyhVEeIcxC9omIZM3V+oLvEdOctfH2KnCaQ+Inuf
         gbUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Onsm2fTylr6Y6fXE+W/Hlgt+gbapvgdukYwvMJwAeP45FmwXnLMaIIvOWuruEhYaI/HkJEpkgDp25g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcFyPLswL9LfC699DzUPRGXp91DjT4NB/LjQGpzzZA0vxbdAzB
	YsQziQtrMqyX5NfZP83GjcDcQ0ivYA/Ccd6Q6qe99320PcfZ4DWD1eyidEmBdJra/xmsnmgtRpe
	cV6682zEOeA==
X-Google-Smtp-Source: AGHT+IFLFCeRdlc8weunDBrt8thymEXI4mbAQuV2g66tj9AakSKOPtGm7SPoDCEdewMpWYbH0BoKH8PsEUZ6Pg==
X-Received: from pjf13.prod.google.com ([2002:a17:90b:3f0d:b0:2fc:1356:bcc3])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d010:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-30a332e99b8mr1751500a91.13.1745974266681;
 Tue, 29 Apr 2025 17:51:06 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:51:02 +0000
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1745970908.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <ca441a13f5ad4a34ddb622cb5b2616b309d59694.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 5/8] selftests/bpf: Use CAN_USE_LOAD_ACQ_STORE_REL
 when appropriate
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, 
	Andrea Parri <parri.andrea@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_175107_737737_1DC594F9 
X-CRM114-Status: GOOD (  10.28  )
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

Instead of open-coding the conditions, use
'#ifdef CAN_USE_LOAD_ACQ_STORE_REL' to guard the following tests:

  verifier_precision/bpf_load_acquire
  verifier_precision/bpf_store_release
  verifier_store_release/*

Note that, for the first two tests in verifier_precision.c, switching to
'#ifdef CAN_USE_LOAD_ACQ_STORE_REL' means also checking if
'__clang_major__ >= 18', which has already been guaranteed by the outer
'#if' check.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 tools/testing/selftests/bpf/progs/verifier_precision.c     | 5 ++---
 tools/testing/selftests/bpf/progs/verifier_store_release.c | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_precision.c b/tools/testing/selftests/bpf/progs/verifier_precision.c
index 6662d4b39969..2dd0d15c2678 100644
--- a/tools/testing/selftests/bpf/progs/verifier_precision.c
+++ b/tools/testing/selftests/bpf/progs/verifier_precision.c
@@ -91,8 +91,7 @@ __naked int bpf_end_bswap(void)
 		::: __clobber_all);
 }
 
-#if defined(ENABLE_ATOMICS_TESTS) && \
-	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+#ifdef CAN_USE_LOAD_ACQ_STORE_REL
 
 SEC("?raw_tp")
 __success __log_level(2)
@@ -138,7 +137,7 @@ __naked int bpf_store_release(void)
 	: __clobber_all);
 }
 
-#endif /* load-acquire, store-release */
+#endif /* CAN_USE_LOAD_ACQ_STORE_REL */
 #endif /* v4 instruction */
 
 SEC("?raw_tp")
diff --git a/tools/testing/selftests/bpf/progs/verifier_store_release.c b/tools/testing/selftests/bpf/progs/verifier_store_release.c
index c0442d5bb049..7e456e2861b4 100644
--- a/tools/testing/selftests/bpf/progs/verifier_store_release.c
+++ b/tools/testing/selftests/bpf/progs/verifier_store_release.c
@@ -6,8 +6,7 @@
 #include "../../../include/linux/filter.h"
 #include "bpf_misc.h"
 
-#if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) && \
-	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+#ifdef CAN_USE_LOAD_ACQ_STORE_REL
 
 SEC("socket")
 __description("store-release, 8-bit")
@@ -271,7 +270,7 @@ __naked void store_release_with_invalid_reg(void)
 	: __clobber_all);
 }
 
-#else
+#else /* CAN_USE_LOAD_ACQ_STORE_REL */
 
 SEC("socket")
 __description("Clang version < 18, ENABLE_ATOMICS_TESTS not defined, and/or JIT doesn't support store-release, use a dummy test")
@@ -281,6 +280,6 @@ int dummy_test(void)
 	return 0;
 }
 
-#endif
+#endif /* CAN_USE_LOAD_ACQ_STORE_REL */
 
 char _license[] SEC("license") = "GPL";
-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
