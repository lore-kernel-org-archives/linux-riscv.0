Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF2C9830D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 02:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKS8Jt502gLSxBUtdPD4acmrLVuXUFW8CK27nyN7820=; b=hU2y/MoNumduWQ
	fWVYwRDWJ0UHnpkaCWGGKOU4GDXgPPGNYaM+Y0goyJaekAfapdRr9cSwt8P9RzU8QKJtrENiDaTbs
	uvRlfVTc2qJohFREzQn8YInPaxrv2wZe1qGVcPU7XPFG+83soFD4LMcFmxDH7OtBQg//5Vhd051tK
	srdizAookky++s1Veex1jXeZ+s7PNXfYk58GnaRM8EQ5+G51RoRJ8aIym8C1S8U696FkBsz3IeD5I
	cNGJP6HirXq5sxDu4qX/NPnaxXSDUewQuSvJRclU+c4d0D2tCDRQKbgPW8jiWBCC/1P86BFlFNGfI
	RpYo0DYEycIQDh5RIWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZNP-00000009smD-2OnF;
	Thu, 24 Sep 2026 02:39:59 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZNM-00000009sid-2FRd
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 02:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790217589; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=ntFrnbFKVOPPVdZ3Ykel3pjZPpOGPr9Y+tWrYXhQKOE=;
	b=hwr9KpMVO3P71T2+8xisG4dxtKPjm0uPh/F0xIqsoEzqGbk6lirK63YHu+qHVPFQlYNMpka+kISjJiKQU67fJ2YQ8NUx67NU5tYdGTjmUYKy0P3Wg69HIMW84SV4EAJiyJiPNakSuf9oCIxCd3GYqyMDMGD0lA2RaOGxY4TKCVQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R501e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBYFZuB_1790217578;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBYFZuB_1790217578 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Sep 2026 10:39:48 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 0/2] bpf, riscv: Add support for indirect jumps
Date: Thu, 24 Sep 2026 10:39:36 +0800
Message-ID: <20260924102938-gotox-v2-style-question-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923130856.1157-1-cp0613@linux.alibaba.com>
References: <20260923130856.1157-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_193956_742716_D8A270B4 
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

Hi all,

Thanks for the reviews. Patch 1 is a plain wording fix and will go into
v2. For patch 2 I need your input on one thing before I respin: which
form of the #endif comment you would prefer.

Patch 1, on the comment above bpf_prog_update_insn_ptrs():

> This isn't a bug, but could the comment say "shift ctx->offset[] by one"
> rather than "shift the linfo array by one"? The jited_linfo was already
> filled in by the bpf_prog_fill_jited_linfo() call above, and it is the
> JIT's own offset table that is being rewritten here.

Agreed. Fixed in v2.

Patch 2, on the #endif marker in verifier_gotox.c:

> [Severity: Low]
> This isn't a bug, but does this newly introduced multi-line comment
> follow the BPF subsystem style guide? The subsystem guidelines
> explicitly require that multi-line comments have the opening '/*' on
> its own line, rather than beginning text on the same line as the
> opening marker.

I would rather collapse it to a single line, but there is more than one
way to spell it:

  a) 89 columns, clean under scripts/checkpatch.pl --strict:

#endif /* __TARGET_ARCH_x86 || __TARGET_ARCH_arm64 || __TARGET_ARCH_powerpc || riscv64 */

  b) 101 columns, keeps every macro name verbatim, but checkpatch then
     reports "WARNING: line length of 101 exceeds 100 columns":

#endif /* __TARGET_ARCH_x86 || __TARGET_ARCH_arm64 || __TARGET_ARCH_powerpc || __TARGET_ARCH_riscv */

  c) or a short marker that does not repeat the condition at all:

#endif /* gotox-capable arch */

I lean towards (a): tools/testing/selftests/bpf/progs/ otherwise only
uses single-line #endif markers, and "riscv64" matches the guard, which
is __TARGET_ARCH_riscv && __riscv_xlen == 64.

I will send v2 with the patch 1 fix and whichever form you pick, together
with any other feedback, so please let me know if you would like anything
else changed. If nobody has a preference, I will go with (a) in a few
days.

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
