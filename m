Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B50608361A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pN+HYm2/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qg+Y3OIj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4hbhC0OILDXc6kDbCIDGCjLHCOCUdxaNKrh/SWGs6+c=; b=pN+HYm2/Posu02Jv5yf2IkOeMS
	RlNkKHRAXjGQnXesiIb3BawBn+XQut9Xy+jxvpXKb4bzfzQ8JwQO/0W8elFCw4tsfQ+/gcuLd8bnx
	NfSj7CdhX45LWOEhgHUuGwE6NQLWcD41f+YFbkFl61LRof1EIpfU3b8c1fVLMFZyBfEzYZXkYLZLs
	wpXhDqamnvjVeKoXGN83nNkQJQf6gXSrGE75Pq7Gt5hgp2YHQ9ou+n+1fxeMaKvauNqEJAC+s8SBs
	ryMcVmjhlKMzipKz+nmDJg4tNSecUYKYCgX5+g/adxvfSl39ys8xZ22IB8+sqtqiR1pTEnsEtRy96
	6yTGMeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGHe-00000002v6v-0RKQ;
	Tue, 03 Nov 2026 15:18:48 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGHX-00000002uyZ-2K9E
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:18:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8a05b210703so1665024b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 07:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719118; x=1794323918; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
        b=qg+Y3OIjXtl2zyFhdTkjqBKDCrA4aEWh0X66Dj0EJ5IIQzQBd9kjHP7uZ5TK0oilAk
         gkSyrhjGnvuO8J2acbq0VpX0aaFzrJKA7oLFZetOlrhr0/gyiFRHka0FU+4s9fUkXr2q
         enCPD0h/OuLxKiV1G0N19lCQC1L2luYJhZSiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719118; x=1794323918;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
        b=EtKKo4vZSZWqyHouFU2He5OU8xVWddco25Ulgwwcp3ENoeb+WRW2fFepFL8SekVK7i
         Aj2BHBea4vJm/n/AgAwl+xUE/GZx/BEhzQTX5iLHQIkinksiOrW8s5IST0OrABUxzUBY
         4cWDhggtrtz3ue3b1jq3XkpK5+BJLt2ifCGUsv2Y4yT5BmtDhp2woQURCq64rBo9dy8D
         Fzfm6cWsF+jBkZfgd7HTl6qPWxllxXSHyUdfkyxut69tCwtN1z6JdNr/JxrDQYA+aZgq
         U3XdYTP10jYxxnWc4ppz92S+sL6i3WPXQnCo0XHiVsZHrArNO6qKWDul8r6LAujkOyrj
         grmg==
X-Forwarded-Encrypted: i=1; AKwUvBzgi60GG/13J92LXmaMs50J47KrNWSBEiYnCqjyZGdl67kLpKWyogCobS6NTKaHvK0ZY/SpH6rqVU/1tg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8KH/gsdcuBWQGLWiInx17NAvVyDy104tI0CI3puNllFO5ijRlU
	rrTcBUirx+HLd7aahOaOG2iTHkloUIsPa/hTgpiBoQeE8JByOTLv3mqvKmm7xlKSLc8=
X-Gm-Gg: AYBFou1okj2QK6jf68B5AP2MokZop29GCae2GZAYFVuc5h4O7SMR29JY9CuYw3tpivz
	IXw6syc1C27jvNo7PHTrihkd2LOWMAIOGoKOxRxNu9X1Wj+NoFI4uF0suGJsSb5xnm3gPizVJRH
	5IUGzwI/o+OUi+pW7VC8A+jkfzlLmGrncaQPCRccOTwO3+09Umd6GtdZFLTg0PtKXgiFMC7GHcs
	22qWVO4LnUWIjvIhe3DJTmcHid9B8oSCHMswuZV64alkYFD69yWzV6iv+qnotKrZl6gkICUcO1O
	jCJU4jebLxsNxt3RDWeo+rHn0yohcxaHhFPLqihTWBctlCGbd/vqmSRDwj2flo1ipmEOp7VlQ7V
	Nglf3tLpRq036xoOWz4sGZhEDqyXmk4k8QG4xfg01DoYU/1PK4lcvHQKssD6DjrGEXX+Hc7UnTj
	CKsHI6gZDaUxqB9oicjFElqRcKu1YmdOeIZhwq0+5ZPMhU2EvkvESHnyapOjf21/BdVYWH24k4I
	ljtFx9k+sWyooLUnYCEmdXFg7LcQu2RQmgMvZJ9EVeTK+2mLOtYIfW9i7xpIPiA3JouamJ89OXg
	Eo6nT/vxkJs0HeI2QxKRztQnVGnQ92kgRX+940rHY/1lmy9Rtm+CkTVGILSuNdEW6ToG0yU4VEQ
	v3rpNGF/d0Ao1Md8FNYvF2drxD5mTa7eEO+U11uKFfJXVtZ5CdNTPas2/AH5VnsZ/pWZ5LzfCa8
	xjpC3XIoiOFGrwEVOIag==
X-Received: by 2002:a05:6a20:914a:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e928e2909amr12529216637.42.1793719118513;
        Tue, 03 Nov 2026 07:18:38 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb362ab313sm1592131a12.0.2026.11.03.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:35 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:33 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 5/8] uprobes/x86: Leave sealed trampolines in place on
 optimisation failure
Message-ID: <eafd3da2cd2c3e2c4d137a46f50351dc6290c5ea.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071839_610569_5884C9F9 
X-CRM114-Status: GOOD (  15.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If swbp_optimize() fails, __arch_uprobe_optimize() unmaps the
trampoline it has just created. The next patch seals all special
mappings when CONFIG_MSEAL_SYSTEM_MAPPINGS is enabled, which includes
uprobe trampolines, and then this do_munmap() would fail with -EPERM
and warn a second time.

Nothing is really leaked if we leave the trampoline mapped in that
case, since get_uprobe_trampoline() reuses any existing trampoline
which is in reach of the probe. So let's just leave it in place when
it's sealed.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 arch/x86/kernel/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 0f60c0d076b6..fb895bfc09e0 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -1183,7 +1183,7 @@ static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct
 	if (IS_ERR(tramp))
 		return PTR_ERR(tramp);
 	ret = swbp_optimize(auprobe, vma, vaddr, tramp->vm_start);
-	if (WARN_ON_ONCE(ret) && new_mapping)
+	if (WARN_ON_ONCE(ret) && new_mapping && !vma_test(tramp, VMA_SEALED_BIT))
 		WARN_ON_ONCE(do_munmap(mm, tramp->vm_start, PAGE_SIZE, NULL));
 	return ret;
 }
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
