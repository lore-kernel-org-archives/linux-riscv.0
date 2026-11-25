Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FC3606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 22:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S4T66Rr+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyIJwMLB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8SdO9ydwPCOuqRpEpni0c4iDUxS3iPPtg5PCr6wF+X0=; b=S4T66Rr+ErUw28Bc1fhn5juDyj
	tgGofj+IGcn0k502bMnMFBEFwkoi3KlnQQPxcomC1r5+3+DVGVflnTJRq3QoXNaQ0cixqyunqmnw9
	BCKr03s+tX0x+chhSf+9TQTvpcptEsx5SXYuxQ80wEI9wlPSEevTy6OMnHa9L0NQlqDS9OhtfEkL7
	2xWjJwhwH8pvoPFtPD9JgtFpxVJluK4dJpFW3QFrXPx5X2moODx68D6cRdsHwvO0jlbK3IVLjbUs5
	GAvx0Bn4qzyi/77ziuIIsW7y0Dsb3GfhGUm2/McEx5Hhg3Ragy+Jt7Hhp6EaPLy3dDPa1ercDiFj5
	YqbkFftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLhV-0000000BVNv-3scu;
	Wed, 25 Nov 2026 22:42:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLhR-0000000BVMh-3yj6
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 22:42:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5859831f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 14:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795646565; x=1796251365; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIfAdkxQcsRohaTqE06fnblD43O9O+Djz5eJ6myvDxo=;
        b=FyIJwMLBK08ZqQkqL9rSZGE4V+kl+0XCMMLK0B2rrh+VFca+ejoAzmd78OslPUm/bQ
         hj4HNV4JwBQsZsEZCGFLjPoZdW77+/KtYg7wWWW0ODhP9X65pnIqJfhsoAgIoymgI9Kq
         uNUga1HLnI/wOpTvjAGCPp0d1cDM9qgmLp2G6TWtheR+roaeurgLwlX8PmyXJto3Lx2E
         nc0rFjYHFrpmNQRkfacPijDnkYDnEUq1qzO2VHkjE4gk2ZUJZwQJn4cPMiKruMXFbGAE
         xNUhpnyFarK7m4e7Qz8K/qAve4SJyKSz6sk9Qq1O+jFvK1FlNJ79sDyUcdR8bcuihMuT
         sNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646565; x=1796251365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wIfAdkxQcsRohaTqE06fnblD43O9O+Djz5eJ6myvDxo=;
        b=T2kVTlF+41ppDDx2ftB79jRiXfzLqeSI8zninrLOwfYcm+O+j+MlIETnm9H0icXbZq
         wnv7r1tsXD8fJenpk5AAYvm+vLUQUxh756xmWuse0OUW++VfSACamUx23Pm/WQVwxG05
         /+uxCM/eY2ZFi+ayucnEPkhBp2t61PkGx5kITT02bJZHUxgnnKLxuGHFyyitrREHSLZt
         h0WB3x0jEgfqheI9wu+epQRiQ12aulwFA8vMsxr2l75/bu7Nyw8aYZUv7W3VZ4mcfeDz
         N48kCkUi0U/te6VMZLLrU5EHRzwoh2zlJBkL/vxZi3kqUhxt7ZFY/TvETUI36cbllL2V
         G6iA==
X-Forwarded-Encrypted: i=1; AL+hErGIJGlgxaGQSG0yOnw5ZplvXQel6qjj6muJ2KlbqMbqtbGz7CHCoS7xXao8jSkFUFTytyOxXGpc7mpWFw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+BQUAr8gaSv73uZI+Sfv4gyFob1tV3vfAfBNmy2WwCS88gOdOa
	4u0ImtNeuRRziyz/G03pg/AOj7L1loVVGFxEfZc2K/7y+e+1+xtCf4xIFNcexWD3
X-Gm-Gg: AZFdTZcnwTTK4pZy30u8tSrNqD1IBRD+qZRccW4BbZlokunU6dzfIGae9Jg2fc6oJBP
	V69Tc7ZgEm0+CMpSGL9cmL15G6pWj2zkOHBx6UGQTQKJZ+RPbG1ayqtqfiM5sFwPDarBgwvs92g
	kMT44sVWwbqseQJFeZAYFFqPgApwTMBpOXDilM8KUF8bMFGB/09q2V7HdMdNN/6wTkp13W9h+Mc
	rJdVTOHA8EDl90jvzc+G+ZDmeyFR/SVTAkWRe1gKa/paRLmUudmIUHr8K0jJvovcCVoBtHruiZY
	EsUxCjhKnltKnShr4mG0l3T7N64sT9A5ooclCTwMw1I3fEaMHW1nuau1ThOTcKW79/rIzSfESsI
	iIbB2XOIwSM/j8AD3bjdmWmkrImiAid5Ku4oWMW7clvDOIiIktpJ6uORFYLZn29ioRe0WogBeym
	03eG8tMB/giTDK3WdIYZLGPEoRgfNLw+NyYlGoHBEURafWpMAO8niu6pfL/hKsdUl3litWVLBNS
	ju1w1lfZj/6Lth5uveoKkp9dJauBLRFR2/Is7vLhduwE42CmDk1GxkWakr46QQz6qhJ6BTP0E8+
	0FCqs9DjTM38/sK2neVjlTNmsw==
X-Received: by 2002:a05:600c:5493:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4bb8881c734mr412295055e9.7.1795646565114;
        Wed, 25 Nov 2026 14:42:45 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm544402355e9.5.2026.11.25.14.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 14:42:44 -0800 (PST)
Message-ID: <b7c6eafc-43ef-4434-8423-fc8733911571@gmail.com>
Date: Wed, 25 Nov 2026 23:42:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/rmap: avoid reusing batched TLB flush generations
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ying Huang <huang.ying.caritas@gmail.com>
Cc: linux-mm@kvack.org, linux-rt-devel@lists.linux.dev,
 linux-riscv@lists.infradead.org, stable@vger.kernel.org,
 Kirk Swidowski <swidowski@google.com>,
 Huang Ying <ying.huang@linux.alibaba.com>
References: <20261125-rmap-v2-1-0ba817662eac@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261125-rmap-v2-1-0ba817662eac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_144250_022858_763ED31A 
X-CRM114-Status: GOOD (  23.67  )
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 10:34 AM, David Hildenbrand (Arm) wrote:
> mm->tlb_flush_batched packs a 15-bit pending and a 15-bit flushed
> counter into one atomic_t, and resets both once pending gets large.
> flush_tlb_batched_pending() updates flushed with a cmpxchg() against the
> value it read before flushing.
> 
> If the counters get reset and reach that same value again while
> flush_tlb_mm() is running, the cmpxchg() succeeds and unmaps that
> happened in the meantime are considered flushed. A later zap can then
> skip the flush and leave stale writable TLB entries behind.
> 
> Use two separate counters, never reset pending, and let the flusher
> simply store the pending value it read before flushing. To keep pending
> from wrapping around to flushed, pull flushed to pending - 1 once
> pending is more than INT_MAX ahead.
> 
> Preventing the wrapping is primarily required because
> try_to_unmap_flush() as called from migration and reclaim code does
> *not* go through flush_tlb_batched_pending(), as it does not iterate
> MMs. So if nothing in the MM triggers flush_tlb_batched_pending(), there
> would be a problem.
> 
> As the separate counters are no longer read atomically together, we must
> read "flushed" before "pending" (acquire/release), so a reader can never
> pair a just moved-forward "flushed" value with an older "pending" value.
> 
> We'll leave the barrier() between clearing the PTE and incrementing
> "pending" alone for now: it should be a smp_mb__before_atomic(), but
> existing arch code (x86: inc_mm_tlb_gen(), arm64: dsb(ishst) before the
> TLBI, riscv: fully-ordered xchg() in ptep_get_and_clear()) implies a
> barrier. This should be cleaned up or documented separately.
> 
> As dup_mm() copies the counters using memcpy() while they can get
> updated concurrently, a newly forked child could end up with "flushed"
> being "pending + 1" and we could skip a later flush in the child. In
> theory, this might have been possible before (load tearing), but two
> separate counters make that easier to trigger. So let's just reset them to
> 0 during fork(). Put it into the existing init_tlb_flush_pending() and
> rename the function to make the name better match the wider scope.
> 
> Note: if a flusher stalls between reading "pending" and storing it,
> while "pending" advances by an exact multiple of 2^32, the counters
> could compare equal and we could miss a flush. The same applies to a
> writer that stalls while moving "flushed" forward.
> 
> That is irrelevant in practice: both hold the PTL, so without PREEMPT_RT
> they cannot get preempted, and wrapping within the ~20s soft lockup and
> RCU stall timeouts would require more than 200 million batched unmaps
> per second on a single mm, which is impossible in practice. Even with
> PREEMPT_RT or long vCPU preemption, we would need minutes of unmap and
> refault churn while the stalled task stays off the CPU, which is highly
> unlikely and not a realistic attack vector.
> 
> This effectively adds 4 bytes to mm_struct. However, on common 64-bit
> configs it fits into the existing padding, leaving the size unchanged.
> 
> [ david: use atomic_t instead of atomic64_t, reset counters during fork(),
>          adjust description ]
> 
> Fixes: 5ee2fa2f0636 ("mm/rmap: fix potential batched TLB flush race")
> Cc: stable@vger.kernel.org
> Reported-by: Kirk Swidowski <swidowski@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
