Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D28C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvZkjBButlLOwM8RKfOhouTA7ofiMEfP+uarl9HnjpA=; b=adpED12DEIFPyB
	jvSvvS7d7sNDIXZrZkncZ77I9GF6ifKcxXHBFMRtqBKQyc/ey5+Kn9sTLLdb9UXKUFi6EjJBVJ5Nx
	CamhidxiMhyMNwzsIq9OJimFHEAruUS1nSysdn4rnScXc2S8G/F1sSysiCq42dp2vNSay/yQz/pZZ
	MS8AudZS6broUnsbyhVG+LIkUhstwWgBW1+TT6GNaGrDHOkSVVUMinL9VKyY3qxXxhb9nGyjT+wlp
	51XMXvpCRjOY+sB8Qh1i2ElmejWa19/EJNtaD85Vbs3SmPknOk/hRdBsYtsbf7uWkGgqES42v1eVv
	kg2an23t05fGfV0/YkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6aWH-002bOD-03;
	Tue, 06 Jun 2023 17:30:57 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6aWD-002bJF-2m
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 17:30:55 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-653436fcc1bso2720272b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686072646; x=1688664646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6vAJn3a3KISHT8UtPfE8rCcxDqLecC+K/Bswfmc3cg=;
        b=xKwNOSXAy/mAacxGKGUyv4x6SJmn0ha0YRP82RY1R/dk7rvb9rFUlavan41Fxo6E9x
         pISxCMcI4O07qu9QmhC/xBDe9/nUvb/OD2B1UaoSl+q1gjMRg4TTybzxru/yozrNZnMj
         wf3JaX3X9HntgvVq8qIisiM0gzcXir9yCUsZAwkR08oY6UgMxvhCjZBeYJhlf1Li5OQ1
         75ncKzcX2vc1gu9MnDS9c5o0L60wP1aOvtU7D9s2eZh+SXGghkVpVofUbz62xJ++CEtM
         muoz/drqTgyeHISx0UfXDAbfkc01oqqRCAZjsQLCXwU2TZVONQl8X6ZGvlpfFks80w7I
         K5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686072646; x=1688664646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6vAJn3a3KISHT8UtPfE8rCcxDqLecC+K/Bswfmc3cg=;
        b=deaAMJRwlEOANKmoN3tXB83NafVi/GF1rnCJDpGwQVjVo2VL3nWxebdsN5tc3cq3ll
         8z/+YeZZutm8Dxubz7PcQUlDei/sVhAhnRTdmuYVn0FqDTRo8E3qiuqs2qI03V56Bp3k
         K6cm8V+1vSQ3BHMrX1GGNLTEhLVugTvB3ZxVEbiP99JZ6PrJ8gO9RiTiPkn4t1Rlngw7
         B9O34VUyxwAujVY3eXwrsB0NaJ988L0SsW9r+Z2uZXkn/VPvKrHFEyjuu8wAkg4xqh75
         azgppXel27EIIDcSb4K50r2XstHSDV5OKrSIPicaoZXwqLB105HF7W4AgokBQzCvBJK4
         RUmw==
X-Gm-Message-State: AC+VfDydPaSVXf0Gx8dlGQpHg3gd2pFBciuZ5aeclnAjEErX6u51s8zi
	GtKHRejfdAsZLScTlMr31xnqQw==
X-Google-Smtp-Source: ACHHUZ7Ihf8OXprV7uWFwxEk8IAjkO4PklZxhrEJNeRyfQGSzen5mICvmPpTPx0ELjM0ALxCXZ3riA==
X-Received: by 2002:a05:6a00:2e01:b0:64a:7723:fe04 with SMTP id fc1-20020a056a002e0100b0064a7723fe04mr1618217pfb.4.1686072646318;
        Tue, 06 Jun 2023 10:30:46 -0700 (PDT)
Received: from google.com (139.11.82.34.bc.googleusercontent.com. [34.82.11.139])
        by smtp.gmail.com with ESMTPSA id a25-20020aa78659000000b00625037cf695sm7096619pfo.86.2023.06.06.10.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 10:30:45 -0700 (PDT)
Date: Tue, 6 Jun 2023 10:30:42 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	aleksandar.qemu.devel@gmail.com, tsbogend@alpha.franken.de,
	anup@brainfault.org, atishp@atishpatra.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com,
	ricarkol@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/16] KVM: arm64: Document the page table walker
 actions based on the callback's return value
Message-ID: <ZH9tQjQk7QLyhUQR@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
 <20230602160914.4011728-10-vipinsh@google.com>
 <20230605223520.00007fbd.zhi.wang.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605223520.00007fbd.zhi.wang.linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_103053_909981_03DE1847 
X-CRM114-Status: GOOD (  40.77  )
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

On Mon, Jun 05, 2023 at 10:35:20PM +0800, Zhi Wang wrote:
> On Fri,  2 Jun 2023 09:09:07 -0700
> Vipin Sharma <vipinsh@google.com> wrote:
> 
> > Document what the page table walker do when walker callback function returns
> > a value.
> > 
> > Current documentation is not correct as negative error of -EAGAIN on a
> > non-shared page table walker doesn't terminate the walker and continues
> > to the next step.
> > 
> > There might be a better place to keep this information, for now this
> > documentation will work as a reference guide until a better way is
> > found.
> >
> 
> After reading the whole patch series, I was thinking it might be a good
> time to improve the way how the visitor function and page table walker
> talk to each other. The error code is good enough before, but its meaning
> seems limited and vague when the visitor function wants to express more about
> what exactly happens inside. I am not sure if it is a good idea to continue
> that way: 1. found a new situation. 2. choosing a error code for visitor
> function. 3. walker translates the error code into the situation to
> handle. 4. document the error code and its actual meaning.
> 
> Eventually I am afraid that we are going to abuse the error code.

I agree that error numbers are not sufficient and this will become more
difficult and cumbersome for more cases in future if we need different
behavior based on different error codes for different visitor functions.

> 
> What about introducing a set of flags for the visitor function to express
> what happened and simplify the existing error code?
> 

If I understood correctly what you meant, I think this will also end up
having the same issue down the line, we are just switching errors with
flags as they might not be able to express everything.

"Flags for visitor function to express what happened"  - This is what
ret val and errors do.

"simplify existing error code" - is very dependent on visitor function
and caller of page table walker. This might not be able to cover all
cases for the future also.

But I do agree that just error code is not sufficient and it will make
it harder to handle shared vs non-shared walkers combinations with error
code from visitor functions and walk action (exit, next, retry).

One approach I can think of is:
Based on the visitor function return value, a page table walker will do
3 things:

1. Move to next SPTE
2. Retry the current SPTE
3. Exit the walk and return the exit code.

struct kvm_pgtable_walker{}  will have two more callbacks
1. kvm_pgtable_walk_ignore(int ret, enum kvm_pgtable_walk_flags):
   This will be set for each walker and walker will check with this
   function intead of kvm_pgtable_walk_continue().

2. kvm_pgtable_walk_retry(int ret, enum kvm_pgtable_walk_flags):
   This will be set for each walker and walker will use it in
   __kvm_pgtable_walk()  on the return value of __kvm_pgtable_visit() to
   retry again.

This will allow to have walker be more configurable and each type of
walker can be customized based on vistor function return and
shared/non-shared walker combo. It will avoid having visitor function
error code handling same in all walkers.

Below is a sample code (compile tested only):

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 850d65f705fa..9a96f61208af 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -243,6 +243,10 @@ struct kvm_pgtable_visit_ctx {
 
 typedef int (*kvm_pgtable_visitor_fn_t)(const struct kvm_pgtable_visit_ctx *ctx,
 					enum kvm_pgtable_walk_flags visit);
+struct kvm_pgtable_walker;
+typedef bool (*kvm_pgtable_walker_action_fn_t)(const struct kvm_pgtable_walker *walker,
+					      int ret);
+
 
 static inline bool kvm_pgtable_walk_shared(const struct kvm_pgtable_visit_ctx *ctx)
 {
@@ -258,6 +262,8 @@ static inline bool kvm_pgtable_walk_shared(const struct kvm_pgtable_visit_ctx *c
  */
 struct kvm_pgtable_walker {
 	const kvm_pgtable_visitor_fn_t		cb;
+	const kvm_pgtable_walker_action_fn_t	ignore;
+	const kvm_pgtable_walker_action_fn_t	retry;
 	void * const				arg;
 	const enum kvm_pgtable_walk_flags	flags;
 };
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 364b68013038..28891a9c463a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -180,6 +180,12 @@ static int kvm_pgtable_visitor_cb(struct kvm_pgtable_walk_data *data,
 	return walker->cb(ctx, visit);
 }
 
+static bool kvm_pgtable_walk_retry(const struct kvm_pgtable_walker *walker,
+				      int r)
+{
+	return false;
+}
+
 static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 				      int r)
 {
@@ -231,7 +237,7 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 		table = kvm_pte_table(ctx.old, level);
 	}
 
-	if (!kvm_pgtable_walk_continue(data->walker, ret))
+	if (!data->walker->ignore(data->walker, ret))
 		goto out;
 
 	if (!table) {
@@ -242,14 +248,14 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 
 	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
 	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
-	if (!kvm_pgtable_walk_continue(data->walker, ret))
+	if (!data->walker->ignore(data->walker, ret))
 		goto out;
 
 	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
 		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
 
 out:
-	if (kvm_pgtable_walk_continue(data->walker, ret))
+	if (!data->walker->ignore(data->walker, ret))
 		return 0;
 
 	return ret;
@@ -260,19 +266,25 @@ static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
 {
 	u32 idx;
 	int ret = 0;
+	kvm_pteref_t pteref;
 
 	if (WARN_ON_ONCE(level >= KVM_PGTABLE_MAX_LEVELS))
 		return -EINVAL;
 
 	for (idx = kvm_pgtable_idx(data, level); idx < PTRS_PER_PTE; ++idx) {
-		kvm_pteref_t pteref = &pgtable[idx];
+retry:
+		pteref = &pgtable[idx];
 
 		if (data->addr >= data->end)
 			break;
 
 		ret = __kvm_pgtable_visit(data, mm_ops, pteref, level);
-		if (ret)
+		if (ret) {
+			if (data->walker->retry(data->walker, ret)) {
+				goto retry;
+			}
 			break;
+		}
 	}
 
 	return ret;
@@ -343,6 +355,8 @@ int kvm_pgtable_get_leaf(struct kvm_pgtable *pgt, u64 addr,
 	struct leaf_walk_data data;
 	struct kvm_pgtable_walker walker = {
 		.cb	= leaf_walker,
+		.ignore = kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= &data,
 	};
@@ -474,6 +488,8 @@ int kvm_pgtable_hyp_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb	= hyp_map_walker,
+		.ignore = kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= &map_data,
 	};
@@ -533,6 +549,8 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	u64 unmapped = 0;
 	struct kvm_pgtable_walker walker = {
 		.cb	= hyp_unmap_walker,
+		.ignore = kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.arg	= &unmapped,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
@@ -582,6 +600,8 @@ void kvm_pgtable_hyp_destroy(struct kvm_pgtable *pgt)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= hyp_free_walker,
+		.ignore = kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
@@ -958,6 +978,8 @@ int kvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
+		.ignore		= kvm_pgtable_walk_continue,
+		.retry		= kvm_pgtable_walk_retry,
 		.flags		= flags |
 				  KVM_PGTABLE_WALK_TABLE_PRE |
 				  KVM_PGTABLE_WALK_LEAF,
@@ -989,6 +1011,8 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
+		.ignore		= kvm_pgtable_walk_continue,
+		.retry		= kvm_pgtable_walk_retry,
 		.flags		= KVM_PGTABLE_WALK_TABLE_PRE |
 				  KVM_PGTABLE_WALK_LEAF,
 		.arg		= &map_data,
@@ -1048,6 +1072,8 @@ int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.arg	= pgt,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
@@ -1070,7 +1096,7 @@ static int stage2_attr_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 
 	if (!kvm_pte_valid(ctx->old))
-		return -EAGAIN;
+		return -ENOENT;
 
 	data->level = ctx->level;
 	data->pte = pte;
@@ -1099,6 +1125,23 @@ static int stage2_attr_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
+static bool stage2_attr_walker_retry(const struct kvm_pgtable_walker *walker, int ret)
+{
+	if (ret == -EAGAIN)
+		return walker->flags & KVM_PGTABLE_WALK_SHARED
+				&& !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
+	return false;
+}
+
+static bool stage2_attr_walker_ignore(const struct kvm_pgtable_walker * walker, int ret)
+{
+	if (ret == -EAGAIN)
+		return !(walker->flags & KVM_PGTABLE_WALK_SHARED);
+	if (ret == -ENOENT)
+		return !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
+	return false;
+}
+
 static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 				    u64 size, kvm_pte_t attr_set,
 				    kvm_pte_t attr_clr, kvm_pte_t *orig_pte,
@@ -1112,6 +1155,8 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_attr_walker,
+		.ignore		= stage2_attr_walker_ignore,
+		.retry		= stage2_attr_walker_retry,
 		.arg		= &data,
 		.flags		= flags | KVM_PGTABLE_WALK_LEAF,
 	};
@@ -1217,6 +1262,8 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_flush_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= pgt,
 	};
@@ -1240,6 +1287,8 @@ kvm_pte_t *kvm_pgtable_stage2_create_unlinked(struct kvm_pgtable *pgt,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
+		.ignore		= kvm_pgtable_walk_continue,
+		.retry		= kvm_pgtable_walk_retry,
 		.flags		= KVM_PGTABLE_WALK_LEAF |
 				  KVM_PGTABLE_WALK_SKIP_BBM_TLBI |
 				  KVM_PGTABLE_WALK_SKIP_CMO,
@@ -1377,6 +1426,8 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_split_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= mc,
 	};
@@ -1442,6 +1493,8 @@ void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
 	size_t pgd_sz;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_free_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF |
 			  KVM_PGTABLE_WALK_TABLE_POST,
 	};
@@ -1457,6 +1510,8 @@ void kvm_pgtable_stage2_free_unlinked(struct kvm_pgtable_mm_ops *mm_ops, void *p
 	kvm_pteref_t ptep = (kvm_pteref_t)pgtable;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_free_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF |
 			  KVM_PGTABLE_WALK_TABLE_POST,
 	};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
