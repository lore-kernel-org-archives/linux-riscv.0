Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80624C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeisL0ADcz5yGo+r8CdYPz+dg4VHCajvI0Fc/N3z6OA=; b=r84tbQbcSKDntI
	aTN9vx4T5DhZewvBC8sDRZd/t0q0G3/6fxEiQCKDMdyqge/zXoWmuHCPnY1B1KZYsk+NDv6Cjfa+0
	+cgEiHnHRMxgI2IHPA+0lEWB4EzMee5rRLaJG6txdzPmD+JIJfyHBTXtXaE/6p+49D1Juse/hLrBi
	VpOGQkt6VwuvfrJZSUY8HCnDK3+CoqH9JlSmwE/zVRqTn0yGI11Ess/0hProho3mhE9iJPiZIgJin
	OFeNcFwYbfPj3PSdOfyAHljmy/V/eIsy+zsp2+5i777k4jfJ7shxKq6RH0eIkid526pxXn+L7cZLP
	2cA4C4HqFhZyEIyTt1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc4w-00000000t4G-19tU;
	Mon, 11 Mar 2024 09:36:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc4I-00000000sav-1RoR
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 Mar 2024 09:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XgF85BcnRi6YfuBECKn9LdNVtsda3wFJUMkfKzYPaTg=; b=CTU7HRUs67m7rIHV7ym4pm16xp
	4RWRRtqSWhC6dm+TlNzHm8UBazbh3xd42zhNaUnd1SQDys98K6UHGRLM2v6hZ6ol5EilUAgBXlf5L
	scrvhwsZfsbQyPIC7h4tNAhTBkGNZ/23fAsAmAHLbN4LcEA/1wmyHR7wFnOnX4HNh78RXqJjcAA7n
	2HOmaF2a5iN97R37HRrmc0JZf/XqocveNvIdAwFR7DGWR6EKZF4WV10WN1m7195qV3v8kmtziON34
	F1m1bMlF0sM/tDrjRkX3zLrJKWdsV9mUmxejfqx57DcFfZ/IEd+Y2E4O2CxI9DJgfVEljYOSwfHlE
	RMhmIQ9w==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc4C-00000008stc-2qFp
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 09:35:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e64647af39so3960166b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 02:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710149722; x=1710754522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgF85BcnRi6YfuBECKn9LdNVtsda3wFJUMkfKzYPaTg=;
        b=Cl0aCj4X9vNnuNEIdwdfG9Gv0+pNqPMs+FgK/8yMXMnrftFi7JLksHLuiXMVG1C0Fd
         qCpC+kvHrd7tUbmEvoD3CpW6tVxONAue5t//CdUdUM7gio7wLZPc7gZq33xatp7niInc
         9heP6hLmCmTmBcBmz/9K1AGsXAUTg8Gq7eW63Zoq0DagmAsR9tOy4zu8ok+ShcXOU30k
         3JtEQK6X8/6vXbn0uxSmHisUOP69/PCvERwwKHc5PL2VTXfJE/3aPptJj0A3H1pwlg7T
         RlBGhz0s5L46SgKfMg4UTY9/sdTPLP9KUI4UMTKBPp9DlqWPJ7zj7bKEV7VuzNCyBO+s
         0sGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149722; x=1710754522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgF85BcnRi6YfuBECKn9LdNVtsda3wFJUMkfKzYPaTg=;
        b=gs059JaY9o0QfG3jUrCkO1RXQ5tZQW3D925MgmjyPWcXjaCZYali3aC1hDO+S9PrOI
         9jHqf3z13F4VRTLZdwwPfygoB+mSsBX8eeQmQG9CgB6QFlOGh4QjESSBe1CNkSuZZmxJ
         vlcElsl/ii+BahjnmLk2uXA6gYB1FVOCrzs0uSU9fZzatCbXX3SJ3jfi9/2OIAvqhN47
         SF7a6aENeqeEgj4fxYHNxBvwEebHlNje6/VUYkmJfy29Cz6hfOhMaYXJbyAds+9e2Ux6
         Syv4cu6jofRtYSzfKcs4xxrQoLLdh0yWoKfAljCrZDmzsabCDryFqsSIjQRF2mBqUJYC
         8E+w==
X-Forwarded-Encrypted: i=1; AJvYcCUKSiCyQTxmRZoW+UKeLRso0EKc7LBU9afIqYlAp++Ip2PM1/eqDejaMJC3WrzAlCm+ngnIuHCVnmrpOEKwg676fXGHuJxVGZDHVSSFTiX2
X-Gm-Message-State: AOJu0YyppPrOv9xBjhr52iCgQV+Q1FNBTnl4CcS2M33/+E/Hme9U71UT
	G1oKjS1DbGdoEnIFer1cLi6aYLVhTOuj6IXUT/0dwMsN5o1uW6CL7eT56ciAgdw=
X-Google-Smtp-Source: AGHT+IFGOb1BTeFqqztsZqYiXrANUPvsqRtIr4BKGzv55kaAP5codanubKYDi1f1h+yfBwPdORvCXA==
X-Received: by 2002:a05:6a20:3944:b0:1a1:6c19:a175 with SMTP id r4-20020a056a20394400b001a16c19a175mr8143881pzg.8.1710149721824;
        Mon, 11 Mar 2024 02:35:21 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:35:21 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 7/9] libbpf: don't free btf if program of multi-link tracing existing
Date: Mon, 11 Mar 2024 17:35:24 +0800
Message-Id: <20240311093526.1010158-8-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_093532_888839_15CAB7F3 
X-CRM114-Status: GOOD (  15.45  )
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

By default, the kernel btf that we load during loading program will be
freed after the programs are loaded in bpf_object_load(). However, we
still need to use these btf for tracing of multi-link during attaching.
Therefore, we don't free the btfs until the bpf object is closed if any
bpf programs of the type multi-link tracing exist.

Meanwhile, introduce the new api bpf_object__free_btf() to manually free
the btfs after attaching.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 tools/lib/bpf/libbpf.c   | 47 ++++++++++++++++++++++++++++++----------
 tools/lib/bpf/libbpf.h   |  2 ++
 tools/lib/bpf/libbpf.map |  1 +
 3 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 567ad367e7aa..fd5428494a7e 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -8267,6 +8267,39 @@ static int bpf_object_prepare_struct_ops(struct bpf_object *obj)
 	return 0;
 }
 
+void bpf_object__free_btfs(struct bpf_object *obj)
+{
+	int i;
+
+	/* clean up module BTFs */
+	for (i = 0; i < obj->btf_module_cnt; i++) {
+		close(obj->btf_modules[i].fd);
+		btf__free(obj->btf_modules[i].btf);
+		free(obj->btf_modules[i].name);
+	}
+	free(obj->btf_modules);
+	obj->btf_modules = NULL;
+	obj->btf_module_cnt = 0;
+
+	/* clean up vmlinux BTF */
+	btf__free(obj->btf_vmlinux);
+	obj->btf_vmlinux = NULL;
+}
+
+static void bpf_object_early_free_btf(struct bpf_object *obj)
+{
+	struct bpf_program *prog;
+
+	bpf_object__for_each_program(prog, obj) {
+		if (prog->expected_attach_type == BPF_TRACE_FENTRY_MULTI ||
+		    prog->expected_attach_type == BPF_TRACE_FEXIT_MULTI ||
+		    prog->expected_attach_type == BPF_MODIFY_RETURN_MULTI)
+			return;
+	}
+
+	bpf_object__free_btfs(obj);
+}
+
 static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const char *target_btf_path)
 {
 	int err, i;
@@ -8307,18 +8340,7 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 	/* clean up fd_array */
 	zfree(&obj->fd_array);
 
-	/* clean up module BTFs */
-	for (i = 0; i < obj->btf_module_cnt; i++) {
-		close(obj->btf_modules[i].fd);
-		btf__free(obj->btf_modules[i].btf);
-		free(obj->btf_modules[i].name);
-	}
-	free(obj->btf_modules);
-
-	/* clean up vmlinux BTF */
-	btf__free(obj->btf_vmlinux);
-	obj->btf_vmlinux = NULL;
-
+	bpf_object_early_free_btf(obj);
 	obj->loaded = true; /* doesn't matter if successfully or not */
 
 	if (err)
@@ -8791,6 +8813,7 @@ void bpf_object__close(struct bpf_object *obj)
 	usdt_manager_free(obj->usdt_man);
 	obj->usdt_man = NULL;
 
+	bpf_object__free_btfs(obj);
 	bpf_gen__free(obj->gen_loader);
 	bpf_object__elf_finish(obj);
 	bpf_object_unload(obj);
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 5723cbbfcc41..c41a909ea4c1 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -299,6 +299,8 @@ LIBBPF_API struct bpf_program *
 bpf_object__find_program_by_name(const struct bpf_object *obj,
 				 const char *name);
 
+LIBBPF_API void bpf_object__free_btfs(struct bpf_object *obj);
+
 LIBBPF_API int
 libbpf_prog_type_by_name(const char *name, enum bpf_prog_type *prog_type,
 			 enum bpf_attach_type *expected_attach_type);
diff --git a/tools/lib/bpf/libbpf.map b/tools/lib/bpf/libbpf.map
index 86804fd90dd1..57642b78917f 100644
--- a/tools/lib/bpf/libbpf.map
+++ b/tools/lib/bpf/libbpf.map
@@ -413,4 +413,5 @@ LIBBPF_1.4.0 {
 		bpf_token_create;
 		btf__new_split;
 		btf_ext__raw_data;
+		bpf_object__free_btfs;
 } LIBBPF_1.3.0;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
