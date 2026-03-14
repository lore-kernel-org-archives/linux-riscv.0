Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136C110706CE
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB41ZvE0qULkzXeluHnS+UbrohtpTLnPjqztKGcB8ak=; b=xzE9eb0ZJGCcrxHBEG5+8V4Xpm
	avlTvPqetrKQvnIDcWJY94QlSyx5V3VVfZjzgIc5dr5RcjU+Cmb8GJI+MHpWMg+eCvxx+Fi94g2Zr
	DVuIV/P5j8PLCzUBYVKk24XmCakjDKev99z+XUAODF1Dw2DPlgNu5+w0sIOwFYtWUwDT6ra1xn6td
	5Sah5xMNZPaDvNaLhsVSl0UC7MZS1kjMTamAqifmISHSn9zloo1pbQe0Hs3oGfau2D73P/XZqgxTU
	hCux7Jt79sXReTpK5Yjedi+kNSnEgJYhn/Dj5mipg50Lb2S16iiQwJSM3Jrnqm0RdHjbCkVXDkKYq
	ZI7j7jhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MsD-00000001lXn-3UG5;
	Sat, 14 Mar 2026 11:09:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MsB-00000001lXS-0WZG
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 11:09:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3B1644129;
	Sat, 14 Mar 2026 11:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072E8C116C6;
	Sat, 14 Mar 2026 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773486573;
	bh=FsIdoywK9beEGP500Y5qRV1jmRWb97tBn7YIlx7LUOQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=cwgP8Hvlsp1NLiGJ3Waw5c+mGf4ZOp059dd1X+SRUpFCs8OMZHVcw4Y/XDG8fxwP7
	 Nbq6Wwzjf4wWcr8AYL0V1rpCYv0YAuW1feiHX3eNobdrA/tQYDhBwWAPGElblCAQTn
	 XjFLKQxIsAhF4n5wYJi8T7VC3AsM5WMVeGg1W2ODJYz9554cE3CJR0+K6NW9OLUfKK
	 v4+IsP6bHZsONsEXdwWJDrwFXgM3jJ8WyXmc5hm1bLDVbkMFTzRazKU4gvxD8LhrTg
	 0cAngWpWCFC/HKS2C1dAh9YmXJQFkE8GcKRDZ8IFBSxC3DehkLMO18ZCORh0JI4AtD
	 uS1gozNea7dQA==
Content-Type: multipart/mixed; boundary="===============7202453078316456263=="
MIME-Version: 1.0
Message-Id: <dfa065670c02c16c71cac4773c62208f2b031198d9cf070d1b69a5ce0ff3d7ab@mail.kernel.org>
In-Reply-To: <20260314-bpf-kmalloc-nolock-v1-1-24abf3f75a9f@outlook.com>
References: <20260314-bpf-kmalloc-nolock-v1-1-24abf3f75a9f@outlook.com>
Subject: Re: [PATCH bpf] bpf: do not use kmalloc_nolock when !HAVE_CMPXCHG_DOUBLE
From: bot+bpf-ci@kernel.org
To: rsworktech@outlook.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,bigeasy@linutronix.de,clrkwllms@kernel.org,rostedt@goodmis.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr
Cc: ameryhung@gmail.com,linux-riscv@lists.infradead.org,stable@vger.kernel.org,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-rt-devel@lists.linux.dev,rsworktech@outlook.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Sat, 14 Mar 2026 11:09:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_040935_192850_90EB9CAB 
X-CRM114-Status: GOOD (  10.14  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7202453078316456263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_storage.c
> index 9c96a4477f81..8e4b0fe6d12a 100644
> --- a/kernel/bpf/bpf_local_storage.c
> +++ b/kernel/bpf/bpf_local_storage.c
> @@ -894,7 +894,8 @@ bpf_local_storage_map_alloc(union bpf_attr *attr,
>  	 * preemptible context. Thus, enforce all storages to use
>  	 * kmalloc_nolock() when CONFIG_PREEMPT_RT is enabled.
>  	 */
> -	smap->use_kmalloc_nolock = IS_ENABLED(CONFIG_PREEMPT_RT) ? true : use_kmalloc_nolock;
> +	smap->use_kmalloc_nolock = IS_ENABLED(CONFIG_PREEMPT_RT) &&
> +		KMALLOC_NOLOCK_SUPPORTED ? true : use_kmalloc_nolock;

Should the comment above be updated to reflect the new behavior?
It currently says "enforce all storages to use kmalloc_nolock()
when CONFIG_PREEMPT_RT is enabled", but the code now only enforces
kmalloc_nolock when both CONFIG_PREEMPT_RT and
CONFIG_HAVE_CMPXCHG_DOUBLE are enabled. On PREEMPT_RT without
HAVE_CMPXCHG_DOUBLE, the override is silently skipped and the
caller's value is used instead.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/23086356774
--===============7202453078316456263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7202453078316456263==--

