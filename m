Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91241C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2pfLNv0fDnUuzrJIaYZ7PF8c+CljLSoYU1Wmh1nCVE=; b=izZVsIbTA4OfRU
	HBMXQAewOhhvCoWud7JQTH8hBCnRVRrbffTP721yIc8Ox1ltg02M+lxA6pltj8zt+VNpXX702uCoG
	xvMakTL0uUMeY2e4wPV+6773Gkl1eEYjh+BtBlHPVPwzEh8QLnIQMLBsCX+slhNk3igchDgkRB41s
	P/Y/DaVyOUXj4CWZFbXB+mFYhOTrvDHqjoiogL+5q6RBcPk+NkK8pavP0AOFxlzyArYxmJaQgZtaG
	6FmzCi5OYag9sJzl8HvcXsnlhcISgLWj3ofzd9mX4DVjJT/re11gRjhKnmPXpDx4CdCAGTUM6UQO8
	wRevIJzfiO8Rw5C6CRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADPN-0000000DpfW-0yCT;
	Wed, 30 Apr 2025 19:47:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADPK-0000000DpeW-2xxQ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 19:47:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2263428c8baso12305ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746042469; x=1746647269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SNr8Kg3r4UZBA56CwG4XH/Uyr5BA6B5QBJaGOwU6Llw=;
        b=h4k+UYBIrOrHOpYkWV81Omnh6KyWwEZJK0eiBmzAnhOeINc5bR9R2P+zhxqZJ20Ils
         2m/n/Bs5jgtntgnOs32Y5Fx6LKVwgvLO6t9TK8DEDyYmCXBkyd02rMYwwWmOdSh64+nb
         xt24KOH0r0lZ86OiG0pwl8HoJlk/B/MmgX89qVhhH3ecUIUqvcU3ipQSO7lJbfiyJli3
         1nTm+IVlEapEDpcuOJkqrZ8LhET3kyEjQdV3CaOtVkW0xcyEGgmYUYNGtkeB/5n5UIB5
         AFseJImLtHFnUmfhU/yf4fJumC54nmk5VH0FbMUfp/p95xJwJLf0x0ILFMeYPeVuzjbe
         U4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746042469; x=1746647269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNr8Kg3r4UZBA56CwG4XH/Uyr5BA6B5QBJaGOwU6Llw=;
        b=nzjAK1Cr7hlUIfssu3htjds0ntmdM+09F1OSpVzUvQvA2NS62o8HlzpA+FsvX+y8ev
         NGWDJetYwuZvCEJ2zQyBf+PguZcwJzqblJ7D09Na/0ixATLxfsRvO+tELdYOrfsZPLOf
         sBa2CUcr6890mFFS5bCPqqAOjLtZTgjhxnTisbDZ8HxQFaZTwwTP/dINNscT2gv2wTRn
         jWyxQlg0hoI62EwvdSmebY3DI1WDbt8Bqr4ByJWKIcFgmywlCFbPlUD07AjsF/ztT3hm
         o/fq2JRyJdegK3X8jlu7N2hfz0KP9pH+vslgVLv7VUm7gBEnN2or6wlMtKm+8S3e08Nm
         p0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXzejlC//kql+ELqahMEyh3Tvn3ycc1psvKjztmdZW6H3vCnZ5xRR3VI6PnBORZXRGBxMU0QQKLnZsSfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFTIFS39Iz4o/5yGC8fcaP3W08jZW325o+xdt4aSZxhxrkxKl5
	KStnYW3srhJ8m5AZWdgxWzQjRuXjegX8Q4tUnIr/jHLYNDW0qk6bO8oB0siHVA==
X-Gm-Gg: ASbGncsYeLhGK/8YJSmtflQ8yYTqHbR0Rum2FZNvLCD327+PsXOxSYMxL00jUgTsxK3
	mOnSLrhj3weXdZYkL4CyllyOGY+wYwiFhFBqsWp4UZbrlQ6AnfTSO5y4t/PJyB8c/976aEDPam2
	MIOIuZyt02Phnuk8qxViJnzcX+9a71VSqJ3QnNLMgCsLtwwCKIwbWqD1TfWgTff9h3JSEsH84J4
	fZGK4WMDpJadSZ8sdzzvYS9gIe2pY0VM6QtUswpmjwrk+Pto+hvpqsiAH8hTm6st0P8AF5pAMEo
	7VHgu6o5aiTqqSlXCYzTESMcwudh0f9owL8780Vhednb0RTvWx+CcD0Epck4FNaBGQNtVXlljo2
	7xE6igQ==
X-Google-Smtp-Source: AGHT+IH2TuyKzc1Iq5glMDPOiIwnbifKoV0qMDMryB4x+Nm2jsiVHc5eh24FTz34ZDVgFDvKOsrbMA==
X-Received: by 2002:a17:903:18e:b0:215:42a3:e844 with SMTP id d9443c01a7336-22e0401a6f0mr449465ad.17.1746042468434;
        Wed, 30 Apr 2025 12:47:48 -0700 (PDT)
Received: from google.com (202.108.125.34.bc.googleusercontent.com. [34.125.108.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102548sm126503325ad.168.2025.04.30.12.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:47:47 -0700 (PDT)
Date: Wed, 30 Apr 2025 19:47:42 +0000
From: Peilin Ye <yepeilin@google.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andrea Parri <parri.andrea@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>
Subject: Re: [PATCH bpf-next 0/8] bpf, riscv64: Support load-acquire and
 store-release instructions
Message-ID: <aBJ-Xq8Aks4xHw3b@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
 <e6805e47-befa-427f-a73f-2dba92adf059@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6805e47-befa-427f-a73f-2dba92adf059@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_124750_744235_5D430E23 
X-CRM114-Status: GOOD (  13.57  )
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

Hi Lehui,

On Wed, Apr 30, 2025 at 11:56:03AM +0800, Pu Lehui wrote:
> On 2025/4/30 8:48, Peilin Ye wrote:
> > Andrea Parri (2):
> >    bpf, riscv64: Introduce emit_load_*() and emit_store_*()
> >    bpf, riscv64: Support load-acquire and store-release instructions
> > 
> > Peilin Ye (6):
> >    bpf/verifier: Handle BPF_LOAD_ACQ instructions in insn_def_regno()
> >    bpf, riscv64: Skip redundant zext instruction after load-acquire
> >    selftests/bpf: Use CAN_USE_LOAD_ACQ_STORE_REL when appropriate
> >    selftests/bpf: Avoid passing out-of-range values to __retval()
> >    selftests/bpf: Verify zero-extension behavior in load-acquire tests
> >    selftests/bpf: Enable non-arena load-acquire/store-release selftests
> >      for riscv64
> > 
> >   arch/riscv/net/bpf_jit.h                      |  15 +
> >   arch/riscv/net/bpf_jit_comp64.c               | 334 ++++++++++++------
> >   arch/riscv/net/bpf_jit_core.c                 |   3 +-
> >   kernel/bpf/verifier.c                         |  11 +-
> >   tools/testing/selftests/bpf/progs/bpf_misc.h  |   5 +-
> >   .../bpf/progs/verifier_load_acquire.c         |  48 ++-
> >   .../selftests/bpf/progs/verifier_precision.c  |   5 +-
> >   .../bpf/progs/verifier_store_release.c        |  39 +-
> >   8 files changed, 314 insertions(+), 146 deletions(-)
> 
> Hi Peilin, good to see the implementation of load-acquire and store-release
> instructions on RV64! But I'm about to start my vacation, so I'll test it
> once I'm back.

Thanks for the reviews, and have a great vacation!

Peilin Ye


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
