Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69A5C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOtcksJNeZ7CxwDY36HRbbAMWv5pT+zbYC67aQ0T2VQ=; b=C3ry6I2nx94TwH
	y+EeUgTd8QKdQo2ZXXqkE47le6KwBUfwSdYrPKr54ZMTl9Y/QRZImQmkvbhpvYPWnhNm17ERkk0FF
	ijhoe1V2zp0Faycw4v96plQ2IhK7mAyo6EcW5nax5chjMWBOa8an9GI1bThOrxzf/ZXeO4lNCANr9
	DO+x9w1c59BxF+jbFUiOtWv0RXi6KDspq2Nx8JieCmJhP4r3yN2aic0DdxA4cWXwEJtaQXjjH8lJk
	glF1qT2e0pYkJmXlwjUp1Uhn5zsVamHlYzEmCEAuA/b4FT51p2TxHm0Ev2E7c+vBWXABkshRqvZQR
	O3YdvKgzFdCzL9CwcUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc43-00000000sR8-3b3A;
	Mon, 11 Mar 2024 09:35:23 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc3l-00000000s66-2h0L
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 09:35:12 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so1925016a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 02:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710149699; x=1710754499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQHWXqakG53bwp/DHGcig31BilBtYFxqqjfUWdtPR6g=;
        b=NvQBc+QqknuJzih+/np89Ob81zaYI2X8JVNypKjg4c1iuH3j9sH0FkWq0VR64tqFRY
         wZ8xtQNY6TBLn9hbothAm6rB8mpfIZL7sqbx4yK4VRFI8qMgk1vX9QMzsSxMxgdj5ziw
         KzTRIroyK3tJzPqKY5LyVSBxVM6xOslrTY3ay2b7069qzu4UrjtUnFxEDZCugzhGgBZ5
         4eOInzu8Y36Ubr2RVXDLNtQCvl1De61qn7GBPp3eff+5lTMGhYxPEXQIzvaoxr5hLuro
         ZiMJonQGvw6NkLS+OFZKJMOrc/MkfYTka1/0Fc9b9GjfsJNhAGlq2eLSCwnu0BcsEPdA
         EyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149699; x=1710754499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQHWXqakG53bwp/DHGcig31BilBtYFxqqjfUWdtPR6g=;
        b=g8WB+DYmCpUHx4JY/8d9Vwts2zE8e5foTzBCZpt264ru/8RhzsTEt1nMpu137A+rgm
         ipu1f/DTzFDqzSzzO25/PfOmsFRUTAhk98BJ58p6r6eu4XTPKzOcKDly8k70RhbMqikK
         GHydNxW8yYzpVlIEpfdF18lm3F/JTT1mhy2HlnlPR33PA+pi8ht3izzWShH3Yfm7v879
         /eyZmgYBIWLOK8ZrmBdrVqtR7FhLulLAlykeev7bSNQ9w6TrTZtr9eCMbQOmSbNeZSHk
         Txy5SUXH9an0/RUUcIW+lqIKbQajg7SxEkL5/SBSbx3ztLgaukFBPHAAJ7xpZ/sPy6D7
         L5lA==
X-Forwarded-Encrypted: i=1; AJvYcCWxjl6xQth2Bvu9HpqVe9n+AngqyCMG13hi5l+xuaNI3rDtLsYNHgBHczIgk7IlqMLHJ0pISelm6uwxBSvoGP0caxsxF7xzsJCAHdIJovdQ
X-Gm-Message-State: AOJu0Yy3tmB/OqV/WLnjEOYoDw7LvMcaZMSx1g9DKQDSJs+4A35rAEFg
	RCj5gbsqYLfHCOBRJ9ziq5m1uxIL28f7cirI2WiMqwN2jGQBOithkCc/OOmeXzg=
X-Google-Smtp-Source: AGHT+IHwrlcPzEPWwJhB9wbDVFgwEUaTXK8PIDDimv1XZruHWD6zTTqAqef2QwBY7Qc+7bmyEVvx+w==
X-Received: by 2002:a05:6a20:6f8f:b0:1a3:1d7e:342b with SMTP id gv15-20020a056a206f8f00b001a31d7e342bmr631985pzb.48.1710149698990;
        Mon, 11 Mar 2024 02:34:58 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:34:58 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 4/9] bpf: trampoline: introduce bpf_tramp_multi_link
Date: Mon, 11 Mar 2024 17:35:21 +0800
Message-Id: <20240311093526.1010158-5-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_023506_309708_E4E51E58 
X-CRM114-Status: GOOD (  12.20  )
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

Introduce the struct bpf_tramp_multi_link, which is used to attach
a bpf_link to multi trampoline. Meanwhile, introduce corresponding
function bpf_trampoline_multi_{link,unlink}_prog.

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 include/linux/bpf.h     | 14 ++++++++++++
 kernel/bpf/trampoline.c | 47 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 2b5cd6100fc4..4e8f17d9f022 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -57,6 +57,7 @@ struct user_namespace;
 struct super_block;
 struct inode;
 struct bpf_tramp_link;
+struct bpf_tramp_multi_link;
 
 extern struct idr btf_idr;
 extern spinlock_t btf_idr_lock;
@@ -1282,6 +1283,8 @@ struct bpf_trampoline *bpf_trampoline_get(u64 key,
 					  struct bpf_attach_target_info *tgt_info);
 void bpf_trampoline_put(struct bpf_trampoline *tr);
 int arch_prepare_bpf_dispatcher(void *image, void *buf, s64 *funcs, int num_funcs);
+int bpf_trampoline_multi_link_prog(struct bpf_tramp_multi_link *link);
+int bpf_trampoline_multi_unlink_prog(struct bpf_tramp_multi_link *link);
 
 /*
  * When the architecture supports STATIC_CALL replace the bpf_dispatcher_fn
@@ -1614,6 +1617,17 @@ struct bpf_shim_tramp_link {
 	struct bpf_trampoline *trampoline;
 };
 
+struct bpf_tramp_multi_link_entry {
+	struct bpf_trampoline *trampoline;
+	struct bpf_tramp_link_conn conn;
+};
+
+struct bpf_tramp_multi_link {
+	struct bpf_link link;
+	u32 cnt;
+	struct bpf_tramp_multi_link_entry *entries;
+};
+
 struct bpf_tracing_link {
 	struct bpf_tramp_link link;
 	enum bpf_attach_type attach_type;
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index cf9b84f785f3..2167aa3fe583 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -607,6 +607,53 @@ int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link, struct bpf_trampolin
 	return err;
 }
 
+static int __bpf_trampoline_multi_unlink_prog(struct bpf_tramp_multi_link *link,
+					      u32 cnt)
+{
+	struct bpf_tramp_multi_link_entry *entry;
+	struct bpf_trampoline *tr;
+	int err = 0, i;
+
+	for (i = 0; i < cnt; i++) {
+		entry = &link->entries[i];
+		tr = entry->trampoline;
+		mutex_lock(&tr->mutex);
+		err = __bpf_trampoline_unlink_prog(&entry->conn,
+						   entry->trampoline);
+		mutex_unlock(&tr->mutex);
+		if (err)
+			break;
+	}
+	return err;
+}
+
+int bpf_trampoline_multi_unlink_prog(struct bpf_tramp_multi_link *link)
+{
+	return __bpf_trampoline_multi_unlink_prog(link, link->cnt);
+}
+
+int bpf_trampoline_multi_link_prog(struct bpf_tramp_multi_link *link)
+{
+	struct bpf_tramp_multi_link_entry *entry;
+	struct bpf_trampoline *tr;
+	int err = 0, i;
+
+	for (i = 0; i < link->cnt; i++) {
+		entry = &link->entries[i];
+		tr = entry->trampoline;
+		mutex_lock(&tr->mutex);
+		err = __bpf_trampoline_link_prog(&entry->conn, tr);
+		mutex_unlock(&tr->mutex);
+		if (err)
+			goto unlink;
+	}
+
+	return 0;
+unlink:
+	__bpf_trampoline_multi_unlink_prog(link, i);
+	return err;
+}
+
 #if defined(CONFIG_CGROUP_BPF) && defined(CONFIG_BPF_LSM)
 static void bpf_shim_tramp_link_release(struct bpf_link *link)
 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
