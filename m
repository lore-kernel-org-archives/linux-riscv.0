Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76651C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oj87StymKxXMVkI1s1+xrihK1x40J8EzpTpksLFYNwY=; b=HHwaZgvSIkdt4e
	jCSJ8b8JSLr5LQsiPlo4f5JDT8k7+zhHZ9JL4U5Txbc2jTgmsj6YMMDAasw+2tBFY+vhS99LRp2N/
	peM+ixF+5n7GCpKRFg/oGATFwT0ZTgVXyXl1JQM/o/LUZt5+h/E0AMElbh8pqhnIvHkjptML4mqaV
	WW8jxa8fYdr/2a++H0cPmtzerf3+sv2Ynu8SHob8TzHwln74cCLP4zmtakv1h9mp9pIFXl2WhzbXG
	PwlHyWegZwUdkhAjfITu40/S940/LTofOBLfEXSy4sgw6HSHkmNa9soYBm28A2CDgsUqjrOlAaYGS
	QfPIajU3YUbwyoXLsJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc47-00000000sUZ-3n7B;
	Mon, 11 Mar 2024 09:35:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc3q-00000000sCR-0RG6
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 09:35:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dd9568fc51so7333495ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710149706; x=1710754506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrO/qg8uwgz9YPMWghckYtP0xPd/PM4sF9e4mk1PfXk=;
        b=Rdw312IYdAtKnnVTSrEZYgvc041uoEsP3bainYonpj2lJnIwImtNdcnbngOrUBgAhN
         okcChRHaDn7ybKS80quB3w68Q2888Zgafp+zPKhelyYUrEv1o6fAuPLbGdqUIaHioQbQ
         2OjQTl17KsmGGNbfTBOqSm3zoxilv61mkZXWcjtgnvXrNqp/8aOggKlsySYJCU0o3naD
         4wVmppKv/anrtWHWnZiN6UZZOjE1GBQzsMIVZ5wnm+UinckHyc+mR6AXezYbpdrOeFgS
         L1pUHvKCiA0eQ3vZZLQWSuPsbIlvJoiCL02oXPG2vi5DMkP0UqriKjIwqiiUkE+C0X3x
         PHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149706; x=1710754506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrO/qg8uwgz9YPMWghckYtP0xPd/PM4sF9e4mk1PfXk=;
        b=xQXkIxFTfy1AU9asR/O5vxcBeubT4c5WJOJ9nLK8PMRgibMASuMl6TMZLcRf5t0+FE
         oJrisGK/V4LE5K02Hg28//TIbAemzfPUN3vhr8KvMazbexoHrbN1go5yl9Cdsgj7Gi2s
         pGxh7Kyo/LY3inEI2BwDeyIGvsOmgBc8/Yf6P30yuK0eVGj9OZrPcBUVw6XQwXBDejls
         B1xDIJKyFBUky7cJl2ef4ZXOWBD5aZOqrIg9MkUjQ4VhHUi0B3U31+k8q0uYloN8MxyU
         aCRFfGGtdksvHxRjm7cT2i4014Uwy7KnZInBN1ffvlhmjY2d3GCU2PkKhygg8CihiNK9
         UzHw==
X-Forwarded-Encrypted: i=1; AJvYcCUwdLVxMzipSX5qa5+cb10gNif3ZPyNkqIniaAbGOogrLJAeKKSQn9XtA/knQvwoYZ2y964721GSbZQLJW8lgKmZzClpAtSQ5mTmR2540N6
X-Gm-Message-State: AOJu0YyJJgKsrXnylwV2aGDTTCjBm/1JMxUBzXsaBJTnoxj97HIOpQLc
	1qBeq2t+UrmigX7l/HP1gzVo5Wg9NULXyPNy1le9lPgz29JCGFpl5W0eJuR0wWA=
X-Google-Smtp-Source: AGHT+IGdSAmTRkYfDKtyWphJJzXlBtH2IoijdRXhZZCIJP7eVn99sHsdiqYvOsYl4WPd5euBmexj4g==
X-Received: by 2002:a17:902:bcc6:b0:1dc:f803:85b3 with SMTP id o6-20020a170902bcc600b001dcf80385b3mr4689221pls.43.1710149706575;
        Mon, 11 Mar 2024 02:35:06 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:35:06 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	quentin@isovalent.com,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Menglong Dong <dongmenglong.8@bytedance.com>
Subject: [PATCH bpf-next v2 5/9] bpf: verifier: add btf to the function args of bpf_check_attach_target
Date: Mon, 11 Mar 2024 17:35:22 +0800
Message-Id: <20240311093526.1010158-6-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_023510_893612_89C41711 
X-CRM114-Status: GOOD (  13.23  )
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

Add target btf to the function args of bpf_check_attach_target(), then
the caller can specify the btf to check.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 include/linux/bpf_verifier.h | 1 +
 kernel/bpf/syscall.c         | 6 ++++--
 kernel/bpf/trampoline.c      | 1 +
 kernel/bpf/verifier.c        | 8 +++++---
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 4b0f6600e499..6cb20efcfac3 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -811,6 +811,7 @@ static inline void bpf_trampoline_unpack_key(u64 key, u32 *obj_id, u32 *btf_id)
 int bpf_check_attach_target(struct bpf_verifier_log *log,
 			    const struct bpf_prog *prog,
 			    const struct bpf_prog *tgt_prog,
+			    struct btf *btf,
 			    u32 btf_id,
 			    struct bpf_attach_target_info *tgt_info);
 void bpf_free_kfunc_btf_tab(struct bpf_kfunc_btf_tab *tab);
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index d1cd645ef9ac..6128c3131141 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3401,9 +3401,11 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		 * need a new trampoline and a check for compatibility
 		 */
 		struct bpf_attach_target_info tgt_info = {};
+		struct btf *btf;
 
-		err = bpf_check_attach_target(NULL, prog, tgt_prog, btf_id,
-					      &tgt_info);
+		btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
+		err = bpf_check_attach_target(NULL, prog, tgt_prog, btf,
+					      btf_id, &tgt_info);
 		if (err)
 			goto out_unlock;
 
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 2167aa3fe583..b00d53af8fcb 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -747,6 +747,7 @@ int bpf_trampoline_link_cgroup_shim(struct bpf_prog *prog,
 	int err;
 
 	err = bpf_check_attach_target(NULL, prog, NULL,
+				      prog->aux->attach_btf,
 				      prog->aux->attach_btf_id,
 				      &tgt_info);
 	if (err)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index bf084c693507..4493ecc23597 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -20613,6 +20613,7 @@ static int check_non_sleepable_error_inject(u32 btf_id)
 int bpf_check_attach_target(struct bpf_verifier_log *log,
 			    const struct bpf_prog *prog,
 			    const struct bpf_prog *tgt_prog,
+			    struct btf *btf,
 			    u32 btf_id,
 			    struct bpf_attach_target_info *tgt_info)
 {
@@ -20623,7 +20624,6 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 	const struct btf_type *t;
 	bool conservative = true;
 	const char *tname;
-	struct btf *btf;
 	long addr = 0;
 	struct module *mod = NULL;
 
@@ -20631,7 +20631,6 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 		bpf_log(log, "Tracing programs must provide btf_id\n");
 		return -EINVAL;
 	}
-	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
 	if (!btf) {
 		bpf_log(log,
 			"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
@@ -20940,6 +20939,7 @@ static int check_attach_btf_id(struct bpf_verifier_env *env)
 	struct bpf_attach_target_info tgt_info = {};
 	u32 btf_id = prog->aux->attach_btf_id;
 	struct bpf_trampoline *tr;
+	struct btf *btf;
 	int ret;
 	u64 key;
 
@@ -20964,7 +20964,9 @@ static int check_attach_btf_id(struct bpf_verifier_env *env)
 	    prog->type != BPF_PROG_TYPE_EXT)
 		return 0;
 
-	ret = bpf_check_attach_target(&env->log, prog, tgt_prog, btf_id, &tgt_info);
+	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
+	ret = bpf_check_attach_target(&env->log, prog, tgt_prog, btf,
+				      btf_id, &tgt_info);
 	if (ret)
 		return ret;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
