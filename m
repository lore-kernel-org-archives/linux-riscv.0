Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813CBC5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0dWdLXFpU9TSCGxUtBRpP/0sdXhRYEpWLiuhBKUy+E=; b=S0JYgwF1aRlyVc
	5pEt/HrTeMeoDBL8iB7cbMvAO4k8fqdfPLN1FCJQ5es2fUTiZi2a+q2n4SdKtj6S4Ng5AaPzCvAAh
	S5Z51czLsM/h5LUmXZor1NCcvLnXDpTZRU9A0Ptv9ZqDJNbbYXhqqlCkJKeMKTfjDdA5Hf2SiogdF
	Nl2v3Nm+IwpRkp2TquxOfhyOzHRrp2RRsEkFqn8Ufxu1C6oyAwwrhZ95Upjgxsc3D8xiJS0nh8iFq
	R3PfCfo1n011iRj/SEwW39sRP3OyhNRVUD3zDHG3u9rX/pq9lq6qRQrovV1oEfDHV2nrFF5YgWFH8
	lMZfZph0msvkpcjTcB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc3Z-00000000rzF-18RC;
	Mon, 11 Mar 2024 09:34:53 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc3S-00000000ruV-2dHn
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 09:34:50 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e676ea4e36so1807267b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710149683; x=1710754483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjSWV41JlB3dq7HwIpKEF4e0TQa/o2d+dOhHoSuTF7U=;
        b=Oi9/9cE0k09cbyYVZlQ8tcPoQgG9mk9x2qcGfO4AU5Mrg75W9HWJg9r7vpXfyaJ5rs
         2nlpRZlfh1UxV5vl5WS+FYGxHrTbDJ5SGJb0zCUQC1uzw/MCwT/IsRFljS3tyVFU2Meu
         0btCJGqoIEXfcKa2wAIVrVDNq3uI4hR19wFMrFc0RObtv7IhjM/TtQunol6utTUvWoEX
         eUVLCue1l0FecC44krRxwHRy4nVr8PYETmnni1xJwWgABF9uNcL52oWWGj/YXMQ+WGuk
         lGsGsYJfWqeVQx73lJmODuAwoYSdjMdOEdYvsNx9UzOgzqovxBeLOcGtk0eZX1ID3Piv
         y7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149683; x=1710754483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjSWV41JlB3dq7HwIpKEF4e0TQa/o2d+dOhHoSuTF7U=;
        b=XDMBaUfxTTtvrj75+mbOvuWfH9P7qH/OIr/uwJ5lzNTXoEp8LF1TEGLB3+wRsZt2bq
         GvLHSacWm3v3Ls8QKYbDMR+MsrVQU3q0Gu2nRSVQZe5wxWPymIlkNH/IgJglnUoqdA2Y
         FTHxErLLyPCYNUQwuxjwesHimQ+Ohoyax44Ksq5sWkg+PvFPMrrVgSRyGW+b47HUZN6f
         HRZwjbSoxk2Pcvrf9qhF241lOZolg1ZRzUUh65MDvK+HwhY9KhKsMEyn/MY/8G11tSgf
         3ZuDZ6B/i3gP1+ZwGw8P/z0qvvXo9GiRS5i3CUDhFMiw3eIRxVJNe1AjfYwkfZY5BnB5
         8WAA==
X-Forwarded-Encrypted: i=1; AJvYcCUC+VOQEbBZWHKV9N/Kb3DD2Ys2p1wPac+YaGAaxwZguNKp9BYM8ttlyOj+UwTXuGmlU5vvhnqN+8wW8XWUquiz7K4tO9Rsj5ynT1jFQCBt
X-Gm-Message-State: AOJu0YzQo8PYbSyoxtkl4vp7AKQo2VSPIUp3g20MwAzV+JYFqiKx5puO
	M0YMZL70nxNgmCI6fDUWmeVsX2Fu6cWFgCSisUPOlWIIBftM01j7s3luSPxc3W8=
X-Google-Smtp-Source: AGHT+IFbj6YfcHBYvXMM2NWizkuYpniqg3bImjqE4WhHnt6u4m7Hz7unmoAwRceekSZcHEkG6VDAnw==
X-Received: by 2002:a05:6a20:438a:b0:1a1:431c:6696 with SMTP id i10-20020a056a20438a00b001a1431c6696mr4574882pzl.49.1710149683554;
        Mon, 11 Mar 2024 02:34:43 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:34:43 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 2/9] bpf: refactor the modules_array to ptr_array
Date: Mon, 11 Mar 2024 17:35:19 +0800
Message-Id: <20240311093526.1010158-3-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_023446_793110_482550D0 
X-CRM114-Status: GOOD (  17.57  )
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

Refactor the struct modules_array to more general struct ptr_array, which
is used to store the pointers.

Meanwhiles, introduce the bpf_try_add_ptr(), which checks the existing of
the ptr before adding it to the array.

Seems it should be moved to another files in "lib", and I'm not sure where
to add it now, and let's move it to kernel/bpf/syscall.c for now.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 include/linux/bpf.h      | 10 +++++++++
 kernel/bpf/syscall.c     | 37 +++++++++++++++++++++++++++++++
 kernel/trace/bpf_trace.c | 48 ++++++----------------------------------
 3 files changed, 54 insertions(+), 41 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 0f677fdcfcc7..997765cdf474 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -304,6 +304,16 @@ struct bpf_map {
 	s64 __percpu *elem_count;
 };
 
+struct ptr_array {
+	void **ptrs;
+	int cnt;
+	int cap;
+};
+
+int bpf_add_ptr(struct ptr_array *arr, void *ptr);
+bool bpf_has_ptr(struct ptr_array *arr, struct module *mod);
+int bpf_try_add_ptr(struct ptr_array *arr, void *ptr);
+
 static inline const char *btf_field_type_name(enum btf_field_type type)
 {
 	switch (type) {
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index f63f4da4db5e..4f230fd1f8e4 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -479,6 +479,43 @@ static void bpf_map_release_memcg(struct bpf_map *map)
 }
 #endif
 
+int bpf_add_ptr(struct ptr_array *arr, void *ptr)
+{
+	void **ptrs;
+
+	if (arr->cnt == arr->cap) {
+		arr->cap = max(16, arr->cap * 3 / 2);
+		ptrs = krealloc_array(arr->ptrs, arr->cap, sizeof(*ptrs), GFP_KERNEL);
+		if (!ptrs)
+			return -ENOMEM;
+		arr->ptrs = ptrs;
+	}
+
+	arr->ptrs[arr->cnt] = ptr;
+	arr->cnt++;
+	return 0;
+}
+
+bool bpf_has_ptr(struct ptr_array *arr, struct module *mod)
+{
+	int i;
+
+	for (i = arr->cnt - 1; i >= 0; i--) {
+		if (arr->ptrs[i] == mod)
+			return true;
+	}
+	return false;
+}
+
+int bpf_try_add_ptr(struct ptr_array *arr, void *ptr)
+{
+	if (bpf_has_ptr(arr, ptr))
+		return -EEXIST;
+	if (bpf_add_ptr(arr, ptr))
+		return -ENOMEM;
+	return 0;
+}
+
 static int btf_field_cmp(const void *a, const void *b)
 {
 	const struct btf_field *f1 = a, *f2 = b;
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 241ddf5e3895..791e97a3f8e3 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -2873,43 +2873,9 @@ static void symbols_swap_r(void *a, void *b, int size, const void *priv)
 	}
 }
 
-struct modules_array {
-	struct module **mods;
-	int mods_cnt;
-	int mods_cap;
-};
-
-static int add_module(struct modules_array *arr, struct module *mod)
-{
-	struct module **mods;
-
-	if (arr->mods_cnt == arr->mods_cap) {
-		arr->mods_cap = max(16, arr->mods_cap * 3 / 2);
-		mods = krealloc_array(arr->mods, arr->mods_cap, sizeof(*mods), GFP_KERNEL);
-		if (!mods)
-			return -ENOMEM;
-		arr->mods = mods;
-	}
-
-	arr->mods[arr->mods_cnt] = mod;
-	arr->mods_cnt++;
-	return 0;
-}
-
-static bool has_module(struct modules_array *arr, struct module *mod)
-{
-	int i;
-
-	for (i = arr->mods_cnt - 1; i >= 0; i--) {
-		if (arr->mods[i] == mod)
-			return true;
-	}
-	return false;
-}
-
 static int get_modules_for_addrs(struct module ***mods, unsigned long *addrs, u32 addrs_cnt)
 {
-	struct modules_array arr = {};
+	struct ptr_array arr = {};
 	u32 i, err = 0;
 
 	for (i = 0; i < addrs_cnt; i++) {
@@ -2918,7 +2884,7 @@ static int get_modules_for_addrs(struct module ***mods, unsigned long *addrs, u3
 		preempt_disable();
 		mod = __module_address(addrs[i]);
 		/* Either no module or we it's already stored  */
-		if (!mod || has_module(&arr, mod)) {
+		if (!mod || bpf_has_ptr(&arr, mod)) {
 			preempt_enable();
 			continue;
 		}
@@ -2927,7 +2893,7 @@ static int get_modules_for_addrs(struct module ***mods, unsigned long *addrs, u3
 		preempt_enable();
 		if (err)
 			break;
-		err = add_module(&arr, mod);
+		err = bpf_add_ptr(&arr, mod);
 		if (err) {
 			module_put(mod);
 			break;
@@ -2936,14 +2902,14 @@ static int get_modules_for_addrs(struct module ***mods, unsigned long *addrs, u3
 
 	/* We return either err < 0 in case of error, ... */
 	if (err) {
-		kprobe_multi_put_modules(arr.mods, arr.mods_cnt);
-		kfree(arr.mods);
+		kprobe_multi_put_modules((struct module **)arr.ptrs, arr.cnt);
+		kfree(arr.ptrs);
 		return err;
 	}
 
 	/* or number of modules found if everything is ok. */
-	*mods = arr.mods;
-	return arr.mods_cnt;
+	*mods = (struct module **)arr.ptrs;
+	return arr.cnt;
 }
 
 static int addrs_check_error_injection_list(unsigned long *addrs, u32 cnt)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
