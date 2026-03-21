Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA78109446E
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 11:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qUdT2DBNLoAUSQXv7JP4SaoowkA1D4l+BpQph+1N5s=; b=bQVmJBd+RPSjDe
	N0nEnabD8uGMsS9yIJiEv5B/vo+/KWj3ulRAuACloECBh8yXYOoSRnFOYhUaiSkNz6fSrKpMy8ztl
	nuKE/FUZ8wGVV7dWWAYmawxcrV4c68ximfKUOs5iMSKmv6ENUkUwLPsnbFfZt04YNEQVN8jD/3via
	iEu2Z8QGcPZ58xyGUVach38g1yCTxSdsbnvFRC/hAABTHRke7HYclYUicFjzeD+zjIRjq7DlXRVlP
	HmwZZoijYD7dAi4Ui2UMZDxvV7JsEgoWT4VerpeA0E0v25CJa9xfdtXJGUL70/3asDQ5DUDKoCTjB
	EOhIo1UDo+Yit32c+NHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3uYZ-0000000EPjZ-3b0H;
	Sat, 21 Mar 2026 11:31:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3uYX-0000000EPip-2lF4
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 11:31:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-824c9da9928so2841388b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 21 Mar 2026 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774092709; x=1774697509; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYdBjs3g/NRwIzC77+RdwYjMCfy82DXerPQVEC+RqG4=;
        b=cRjLXekGhgKf4ylv6J8ThWU91Lig7mE4SarINT8qng1ofZ4pGpUdt147y5tW0u0dfO
         svhCDZzC4XaTkOpn2Ey2fD43nTl/WvPf4hey2hGF/Za0bH1kG3H838y0f92fWUrIdcmr
         mZELT11Xz6WxJC0XIgzs8hendFyq17s7y0/JMq9RyTrvYMFRgBOT1yP+mEKSiwXMnUbC
         PtsbB1ERy1iUkv0N0wVAKj0zRRsKc3PooSE9BM5cHb1CVkMiy/MC00aB1vMYmwNp+4fk
         NuS8a+rlZq1/hzg5odUcZljykELcxmX4Tp3+xTglO2XXTbRUIN31rwLTFzCqrXzvZnch
         xLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774092709; x=1774697509;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYdBjs3g/NRwIzC77+RdwYjMCfy82DXerPQVEC+RqG4=;
        b=VM/HsJcCfJC2GgUJCxXnCr4D8EeFUy1YPxpve3GVGdPjnpFPXdWQb9kKGJGh9NeseB
         /SkUji6LqyI/q8Ar1HaJlYQHGQAeyyXvLBLuuRyQsjO3KjM+v+KzasxQGh+pDezfVndX
         ALzx7Cwe4+9vgcFhSZusVDuDH1i+hqbGFGLYl7Da3XtXXEQ+j8rA91rbdvTsg+53/XaG
         PPGlKaPnFAZJYjQUJA0c6Q2i0HwiBtduySZv7F/9K06F6LDcgQGpq+S0T37l+fcXCwSG
         ak2J0VV9EvYUakvqbEoDQL6C1PiE00Fl54wDHZNeL/R297L2GvFJ4dw0Xez2lY6XHFwf
         qaZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYfayzN60GII8hNhpLKz0S41mbM3bWjMfYiIkh2286nhrTODvAJT5VBlwKchLkqqLcsSqRW+Zs+CAf5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGG8SkwwYPqAYE410o8fMwWShXV0rNPlDy3bQAt5q0el7HRpkF
	g+Smu94RB7G8ifDbllJZrJnlqD/Qz4Em3um4+MmwFDZjDFnlQYxh11G/
X-Gm-Gg: ATEYQzx28O0RNrWljVv3T/lhM3T8lUbvrBQVeOZ25jy/oPGQzSw9ri2go6HypuTPA/0
	U9UG55GYq4W/I2t26oXJajbFwyMpqvPJIeZaD1GzGRbxM+zf2oommTcschaOtC2OyhWB3EF94Hz
	+0T/UqqQLsuGyT8hH5GlesJg9IBFZZt68PhsH1NCZKq5VsHqGKhXmkZg1yMV4duRmMC7l7OyxlW
	Gi8JV8zICqFn7m5c734Ymf9p3TUdubSLp0NQHPVk0zr9VmI3FCmLqK4uxSy6cgXA+SlNYP+cWxD
	99J+BHq87Wloq2OwLUqLw2QuCLGsMc0nhpxP1BxHkZaPD2RCCKxXq0RViJlG0VC+37j90EX+Kmn
	3AJPnnguvAekNMVMUWoktkIsTb2ADCCizRJKojLtSZmdftrnBZaT0dxNYX21vK3OTfT4NUSMgGy
	M3nFIhVQN4dhsEDrAuIL86WA==
X-Received: by 2002:aa7:9e8b:0:b0:82c:21af:a7bf with SMTP id d2e1a72fcca58-82c21afa908mr2465482b3a.13.1774092708761;
        Sat, 21 Mar 2026 04:31:48 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm4159044b3a.60.2026.03.21.04.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 04:31:48 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] change young flag check functions to return bool
In-Reply-To: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 11:01:56 +0530
Message-ID: <bjghychf.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_043149_700406_55F15529 
X-CRM114-Status: UNSURE (   8.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> This is a cleanup patchset to change all young flag check functions to
> return bool, as discussed with David in the previous thread[1]. Since
> callers only care about whether the young flag was set, returning bool
> makes the intention clearer. No functional changes intended.
>
> Ran mm selftests on Arm64 and x86 machines, and no issues were found.
>
> Note that I only CC'd the arch mailing lists to avoid disturbing too
> many people.
>
> [1] https://lore.kernel.org/all/d172d6bf-c60c-4cf5-9da9-f30de38cdfed@kernel.org/
>
> Baolin Wang (6):
>   mm: change to return bool for ptep_test_and_clear_young()
>   mm: change to return bool for
>     ptep_clear_flush_young()/clear_flush_young_ptes()
>   mm: change to return bool for pmdp_test_and_clear_young()
>   mm: change to return bool for pmdp_clear_flush_young()
>   mm: change to return bool for pudp_test_and_clear_young()
>   mm: change to return bool for the MMU notifier's young flag check
>
>  arch/arm64/include/asm/pgtable.h             | 29 ++++----
>  arch/arm64/mm/contpte.c                      |  8 +--
>  arch/microblaze/include/asm/pgtable.h        |  2 +-
>  arch/parisc/include/asm/pgtable.h            |  8 +--
>  arch/parisc/kernel/cache.c                   |  8 +--
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  4 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 26 +++----
>  arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
>  arch/powerpc/include/asm/nohash/pgtable.h    |  4 +-
>  arch/powerpc/mm/book3s64/pgtable.c           |  8 +--

I did compile and boot test on powerpc with various configs and overall
it looks good.

-ritesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
