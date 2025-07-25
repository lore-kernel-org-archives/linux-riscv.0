Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB76C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GG4nnkgcFzsQdHFZyZ4hR8JYfkgBP59SDm1S9qb6kw=; b=LujOz0uW1W+p1eatqdojU+gNwE
	G2BjxdM3b+smSY4ZAp8xN44oyN2tG/qBbLSSqPQnji+f3Evy8HNfCHc9tcSUaAcpkRZpCHiD0WO5R
	6Ci/i7LkfG1e+KOfnwIcrzsOidh9rFuQcC93JX3K/O/Da4QaYjVWLO+oUyLTnPdj/IFLzXQVqKxZ3
	nKboHedpRJz0XRWoARhxSJnjDSimE6364WBKee5aERScT9w0guBXFsBy9U5IqaHUY/Ii5wu1dyDQx
	3PV/O8PHHWiH7iU0QQUZ/Xt9xqUrJLxsEs3Byj9uRr+bfB/7hWFJsWmenAdfDYkYZMvUBRu8aW5mo
	a+u2AL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJHk-00000009zuu-34WV;
	Fri, 25 Jul 2025 14:20:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJHi-00000009zu1-3wZN
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:20:32 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-313a188174fso2605708a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753453230; x=1754058030; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOelqn4iY/rsR6MxnRwx481vFltvLJp6wfVOt5IOJQo=;
        b=X+msiZ6bakoqPEFoz7/YJjvJdheiXKW08rJl6VYzk5epId/pZqrVm1bHArWZbhJeuB
         yG6s2DSlpuLnArIawON5faDMFPMEabNcjFIXJQawY4tmQnzDDuekhZKYAOgmCGDyQ5gV
         tP59ZkXxC9FxjXrXM25jpyufK0uEh33I7prKF4JZ27PtlKmLh+RVGYNqN4hadhwAaNOy
         JDVZDBz2AmEij+kM7LVUkuvIeGVzKns6mVSAwXs9/AsYyIyJHZFc0ZfcKIeMcVJXUR4s
         awnZFcC6y4F3keLzohUpt/k9TTnrfyde3ta9kVef9D5NDnwxH2ip+lEPTlIBmCb08YJ9
         4mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753453230; x=1754058030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOelqn4iY/rsR6MxnRwx481vFltvLJp6wfVOt5IOJQo=;
        b=vjPi4VZBc+c1/I5hfl7/p3pqtZIXJf3B74XOqsF0H52NXqz65pune6zJtjxbGQqBKx
         kNe8lIk/glgEPpjLczbwo7lOXvTaulpX8E+HXYCJn5M8tPxo9HoYHJA48vbTVXumePx4
         gdE0hfA1QKmde9vB9hQNaU3Sxdd12bnyB9IeljGFZjkTCntcakvn9WV8ahVcmSxkzXSL
         AKjdDmx2BcANlcMAnSDgm5il9FEzAishX0KGCb3VykmTYNxuIkJe18s6/YEXZtY+wbKb
         b54sqsGDUChCibcDZTOJ95QZFJgcbfkKTgZ3RPi6B3/FhJ/ygDXj+4MNgGGjBWpp4xKK
         lFjQ==
X-Gm-Message-State: AOJu0Yw/W0ef6E2AcwFh3KtPko7RFEJt/gRBbSAyHxEioVIgzpRzobjG
	GyjV/5xKBBLiHboIybknxxdwyGRt/9exQ1mWjqd9QLhwCFmXXzeusixMz9sx/Zaae8Q=
X-Gm-Gg: ASbGncvW7mMc6ByIViPaHZbPfWhPkHFvL1baZiIE7TOfB6TuoJfXJ+A+h63PhkYVTdk
	PowEzSaCs/0Ga14JQhroMKOrv0wtmYnE9OjI4lYRpYUCU/9AI59rhD5zVADfbJLANQZJblXCCiE
	NeUasjiKjAmGYzQgxzM3z3WTrmOvzOmv+KIUHaIH5CPrtcTYDSdgSy1EUDpf1y080kxU6E7YjD0
	qdtROVa2UB3VDkVKLuNFwUtNIE/5JoxMJ0CHiEbk8RDl/iYq3I+bbzRRZgu3FvQiwNhG2x+wAws
	0j6wmMgxDMODORFAQSJomgFHUDoKBlLcvIbE7huZ8pY8Xv/WbeT2X9nML3aH9LkrkE2BM+LUFeG
	wER3ELjb/vnhtS1VHcj3lUEylY1AIuahZaegiwSAwAso=
X-Google-Smtp-Source: AGHT+IFnToE7Y9m/LQB1LHyZJTXUY15A+gO23FToLy9nHc/JxiCSxR6k0MWES+brycAIrDFP11y4GQ==
X-Received: by 2002:a17:90b:5407:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-31e662e8312mr8688402a91.10.1753453230029;
        Fri, 25 Jul 2025 07:20:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e60a61628sm2176473a91.1.2025.07.25.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:20:29 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:20:26 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, andrew@sifive.com, ved@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH 05/11] riscv: enable landing pad enforcement
Message-ID: <aIOSqskb_hBAqjIt@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
 <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_072030_978072_F3A2440A 
X-CRM114-Status: GOOD (  10.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 25, 2025 at 08:33:46AM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:36, Deepak Gupta wrote:
>>Enables landing pad enforcement by invoking a SBI FWFT call.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/kernel/asm-offsets.c |  1 +
>>  arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
>>  2 files changed, 20 insertions(+)
>>
>>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>>index e4d55126dc3e..e6a9fad86fae 100644
>>--- a/arch/riscv/kernel/asm-offsets.c
>>+++ b/arch/riscv/kernel/asm-offsets.c
>>@@ -536,6 +536,7 @@ void asm_offsets(void)
>>  	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>>  	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>>  	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
>>+	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
>>  	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
>>  #endif
>>  }
>>diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>index 9c99c5ad6fe8..59af044bf85c 100644
>>--- a/arch/riscv/kernel/head.S
>>+++ b/arch/riscv/kernel/head.S
>>@@ -185,6 +185,16 @@ secondary_start_sbi:
>>  1:
>>  #endif
>>  	scs_load_current
>>+
>>+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
>>+	li a7, SBI_EXT_FWFT
>>+	li a6, SBI_EXT_FWFT_SET
>>+	li a0, SBI_FWFT_LANDING_PAD
>>+	li a1, 1 /* enable landing pad for supervisor */
>>+	li a2, SBI_FWFT_SET_FLAG_LOCK
>>+	ecall	/* check for error condition and take appropriate action */
>>+#endif
>>+
>>  	call smp_callin
>>  #endif /* CONFIG_SMP */
>>@@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
>>  #endif
>>  	scs_load_current
>>+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
>>+	li a7, SBI_EXT_FWFT
>>+	li a6, SBI_EXT_FWFT_SET
>>+	li a0, SBI_FWFT_LANDING_PAD
>>+	li a1, 1 /* enable landing pad for supervisor */
>
>The SBI specification calls BIT(0) "LOCK".
>Shouldn't we define a constant for the lock bit instead of using a 
>magic value?

See below `li a2, SBI_FWFT_SET_FLAG_LOCK`.

"li a1, 1 /* enable landing pad for supervisor */>" --> this is enabling.
Had we done "li a1, 0 /* enable landing pad for supervisor */" --> this is
asking firmware to disable the feature (turn off the bit in menvcfg CSR)

>Best regards
>
>Heinrich
>
>>+	li a2, SBI_FWFT_SET_FLAG_LOCK
>>+	ecall	/* check for error condition and take appropriate action */
>>+#endif
>>+
>>  #ifdef CONFIG_KASAN
>>  	call kasan_early_init
>>  #endif
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
