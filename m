Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7870FC369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wRxQLKbjl+gx3HrcPnHhQw8+798pCaGqcoHLf4jaRZ8=; b=JKlC4dyx4l1qQGj7GMqanhRNxb
	Ah61YWHCg+Gdxg5k1ve2QVngoQDz4wWS6irG9VVR5kxuOdqhG87D7mlk2nmfaUpncAG3yn3sV3pHH
	w7jg79iM9SKitDigvML0SMzZ9UQv/HdUkzIw0NNBFw4kVhJCJ61fj/He1vLtAyI5oYzqZqrmhp9FP
	7MTiIKgTLkvITb7RGpI1i/4WUCxPybM4BCKwN51ebmfGUDUeqPtolv3YBAaJltmYSArrlvoZhbQ1V
	DNIYltAvAflF9vBKcAhkJGCPPRMHYczHnniFOGlk4rv36EgtGdO7KcKFZCUrFU+/h9wdN6vFfUJKX
	IlzFtYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vfw-0000000BNzY-39t7;
	Wed, 30 Apr 2025 00:51:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vfv-0000000BNyq-1sqN
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aHnEwlLdwANwMc5RNNXk4BGzfuFS2i0ujkIzSPvzc6A=; b=i0D/YrZkjbnDGOPm5wWu6XTa0Q
	IwQSUY2UzJelhav/48gjsptK872pzY43eggHKn1n9seF3/1XfVkShEQiXqFKVFMMWUh8fcOpjT9i2
	ZZ/Cfa4ulfNnHDHTpzOKCFw+X6xFsiH/cIHZ0y6BckZEC+6LE2JzwUClNSoaq6SitKwmON3cQG5NA
	AsuaR6KVR6Dcc5ACmKmml/44VcCB34PVJfsI465WQd+KO8QguD5lIbK9/I+df2BVv0tBM6hJnvLfG
	DTJ3N8+T1C9zostXVMvm/834CXWFXZK2Vox27vwUsjVzCGmWaZDEFOwTx1mZheEX7z4FJ3gi4pK/o
	SdvxSUrA==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9vfo-0000000DbWi-2PzO
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:51:44 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7391d68617cso365684b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974297; x=1746579097; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHnEwlLdwANwMc5RNNXk4BGzfuFS2i0ujkIzSPvzc6A=;
        b=04HaPRmUhJ95aZPdrR4y/suRxh7f1uH/0LgbGmrE4mFHO4UfLz3hMdKUh2/bbNDnle
         FjpVM0pAdafjB0NlEbMf6TbYcLMdtHcJET55hAxqrNt9F9qRV5bmR/mvBEdb6sTIyeRD
         Qyzl24ROgUc1LwEr7aWYmoVdyYijiRt4NMg4HSje8A+cXtAIA0fQ4LfYtJtPUwkGAtJ9
         KVN1mDjQj3xLHTvXgA4F2eBNBCe+uiEqXCwLmTZvHk03qzv9f2aC57O1TYMuuFHfEEv+
         ddwCubC+LHW6Fq0lEk/awc5UuULVEHjTqNP7/ThumlZSiHk5t22TBmfvdV5Su+z/FX41
         7A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974297; x=1746579097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHnEwlLdwANwMc5RNNXk4BGzfuFS2i0ujkIzSPvzc6A=;
        b=ARUwWQXs9c9ObHARVTXeG4PaUe60zW4Y/XpHquxEeq86ekxp5ge8HtUUHrpMMSVFsp
         JQNd4JhugEbWzBkRzfZAZbm9K2DmCasG5+//NeTwp2RVhGWoBPC2kcUH68k46aXCSMNf
         GxaAIe3tqRAuivhnPPcFzEsSW4Gpv1ucYCrWmSRguSt8np0j3ezlAChrW/gVqRsow/Rb
         pzECYz4SQABWTcSySSiODjmIs0am4ZYV09NwWt2qQwWG3OuemNQtR4qonPo6iZGeV2yn
         IP5Mo2/PfsYDl9YMMEU9Aq2aex0TBlqqnMIcYm5ly8IARoUToJlESzk1DYJobKPQSKBg
         OK2w==
X-Forwarded-Encrypted: i=1; AJvYcCVG7YSnkthU1gvtIfAaTfH6GMBsd2doyypnYXsgYB8aE8wRuJsd7+p3CwYR1UrKseLbgVzEmw7mgKN7xA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv6TE0gg4kYPGSXsLTHDmzt1n14g0BlqCSc6Afa3BFYfEwyDbn
	UjArns5WXtA9l4YO+t4n5weuI+LaMpp/Sha2y6NVJXw2KzTT/yUxeBzwGK5bgXNkumWZyATpd/R
	AHKvox4U6oQ==
X-Google-Smtp-Source: AGHT+IFBLQbfpmhOqzUmUk8dg9Ywwh7w/7lS8KAbii0xbxkFbfBJV9+bRpxlk1oIxeWy8ycFxabmhlLQMYZxJQ==
X-Received: from pfbgu22.prod.google.com ([2002:a05:6a00:4e56:b0:739:56be:f58c])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:910c:b0:1fe:90c5:7cf4 with SMTP id adf61e73a8af0-20a90212e5amr1164249637.19.1745974296723;
 Tue, 29 Apr 2025 17:51:36 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:51:32 +0000
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1745970908.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <755e831c84af2e7a4fc65fb52bc4724a6a7c2e53.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 8/8] selftests/bpf: Enable non-arena
 load-acquire/store-release selftests for riscv64
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
X-CRM114-CacheID: sfid-20250430_015140_795029_698FB54B 
X-CRM114-Status: UNSURE (   9.58  )
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

For riscv64, enable all BPF_{LOAD_ACQ,STORE_REL} selftests except the
arena_atomics/* ones (not guarded behind CAN_USE_LOAD_ACQ_STORE_REL),
since arena access is not yet supported.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 tools/testing/selftests/bpf/progs/bpf_misc.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index 863df7c0fdd0..6e208e24ba3b 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -225,8 +225,9 @@
 #define CAN_USE_BPF_ST
 #endif
 
-#if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) && \
-	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+#if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) &&		\
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||	\
+	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 #define CAN_USE_LOAD_ACQ_STORE_REL
 #endif
 
-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
