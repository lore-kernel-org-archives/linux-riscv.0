Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43518EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69BJSzQxjIAboFPoDaygo7ZbjmDlsq2fjB+RYoGOSU0=; b=fO7uQ9mBmLAyaP
	+dt824lDCevogJcG7o33Kk3TPQyH+THaOrX/g1YJ0+o5/2/cOY3wtliNj42SKzLFioigavHY6wqRH
	VwAfWE9kAhOOgrsAmNinhzn3S1N9+h2yvPh41VVhOHizKzN3ELwjaqsRMeMZTWHaQ0iLIrEnB8Dl8
	Dq0Dn2C38siEzis6aHP+ckhsddR6ZZDQ9s9FqBN/HUnWtn5IGW30uiTur1hjG5Peoq6Jq+S7RUIXq
	B2jdygFftxop3705LqinHFKT7kXT6XZy3IVAHxtoCgk6URpKF9BHiOJ9JKMA+4+YfB+MD1bWtZeJI
	HO/cjIXrjf67VkYi3yWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYlw-009HVH-1G;
	Thu, 03 Aug 2023 13:53:48 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYlt-009HSC-2D
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 13:53:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9891c73e0fbso218489666b.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691070824; x=1691675624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejd3tpdC1zaV/w7ewmBn4nRM+R1O4uRxApY6GI0ypWU=;
        b=MrSf1vv9VKN509zhlwdLejJnhpoBtnZEiwJpWn2QCVgcbHDN1t95geCJd7z/xyVvcd
         zjc3ycorHtrZUUBopYNEQy2wfxaT72wQ8vBuDiNQmGprRNcuW67Ce4c18tW2SD4u415H
         Wyu2qc4+2APAz/kXJo8c/rqU3rQ4nkUuP13P+x1ZlD4pKX1ta6a3mqOaczr1FnVdhbB4
         49GCdSsjdyZZkeQcco9vcUhgvFptGP5EbR4zPc3TATosuK1+DdWEHhfPAMjItY82lUSx
         NFpoiOE963jvsAsWTJRIw6s9C7svICTxPyR1Y+f7HLpVqqKxqfn6JLBRdho9HW5DUDt8
         ns1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070824; x=1691675624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejd3tpdC1zaV/w7ewmBn4nRM+R1O4uRxApY6GI0ypWU=;
        b=ZocNUc8l+pAwGMKpL93SzKK8tK49GY0gxPWjcKvpdo5ZuPJIrs1hT7vOJq5oU8NgZp
         f8kEmO4CrwUIg3LAq3d+yosX/pBBymw6rHXbvJoAPq+LuGjWyZ76fQGzgEzs9CGUvjBr
         8TRS+dnPIAU1kajcAnGVzGkx1rMUND66LNg/GN8MbJ9o0ZHN8c6fPSqbEAsnsBs7gaVo
         xlsrDLBlVubhTlAkPSdnnCGzlq9JoJ4VkUhv7Ecmps3C5t0G5wOBRAcUQ94IywMZEWUf
         6lvP7PfFSuuzAcxn+emngQT5DGfaualWCNOXodGqCF8DBywR7rMpTQ+x+X7cbyBS8QOo
         xD2A==
X-Gm-Message-State: ABy/qLZXJioT7elW8Uf+to0Kd3GOe8A1nQoB9KeiOeVrAnDnp7P95c0z
	GQSWG9M3hhMSFTnkkBEctzY=
X-Google-Smtp-Source: APBJJlHuIoaTBbpnUrcFFXT7fPGxu/0lXWN0OwVoj+05bI0S+IwQ8VVonMPQFmEKY5BIDHPRexQbLA==
X-Received: by 2002:a17:906:974b:b0:988:8efc:54fa with SMTP id o11-20020a170906974b00b009888efc54famr10650437ejy.37.1691070823469;
        Thu, 03 Aug 2023 06:53:43 -0700 (PDT)
Received: from andrea (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090680cb00b0099b921de301sm10561131ejx.159.2023.08.03.06.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 06:53:42 -0700 (PDT)
Date: Thu, 3 Aug 2023 15:53:37 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 0/3] Deduplicate RISCV cmpxchg.h and atomic.c
 macros
Message-ID: <ZMuxYXQgR446JwUp@andrea>
References: <20230803051401.710236-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803051401.710236-2-leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_065345_723909_19ED649A 
X-CRM114-Status: GOOD (  21.83  )
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

On Thu, Aug 03, 2023 at 02:13:57AM -0300, Leonardo Bras wrote:
> I unified previous patchsets into a single one, since the work is related.
> 
> While studying riscv's cmpxchg.h file, I got really interested in
> understanding how RISCV asm implemented the different versions of
> {cmp,}xchg.
> 
> When I understood the pattern, it made sense for me to remove the
> duplications and create macros to make it easier to understand what exactly
> changes between the versions: Instruction sufixes & barriers.
> 
> Also, did the same kind of work on atomic.c.
> 
> Note to Guo Ren:
> I did some further improvement after your previous reviews, so I ended
> up afraid including your Reviewed-by before cheching if the changes are
> ok for you. Please check it out again, I just removed some helper macros
> that were not being used elsewhere in the kernel.
> 
> Thanks!
> Leo
> 
> 
> Changes since squashed cmpxchg:
> - Unified with atomic.c patchset 
> - Rebased on top of torvalds/master (thanks Andrea Parri!)
> - Removed helper macros that were not being used elsewhere in the kernel.
> 
> Changes since (cmpxchg) RFCv3:
> - Squashed the 6 original patches in 2: one for cmpxchg and one for xchg
> https://lore.kernel.org/all/20230404163741.2762165-1-leobras@redhat.com/
> 
> Changes since (cmpxchg) RFCv2:
> - Fixed  macros that depend on having a local variable with a magic name
> - Previous cast to (long) is now only applied on 4-bytes cmpxchg
> https://lore.kernel.org/all/20230321074249.2221674-1-leobras@redhat.com/
> 
> Changes since (cmpxchg) RFCv1:
> - Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error
> https://lore.kernel.org/all/20230318080059.1109286-1-leobras@redhat.com/
> 
> 
> Leonardo Bras (3):
>   riscv/cmpxchg: Deduplicate xchg() asm functions
>   riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
>   riscv/atomic.h : Deduplicate arch_atomic.*
> 
>  arch/riscv/include/asm/atomic.h  | 164 ++++++++--------
>  arch/riscv/include/asm/cmpxchg.h | 318 +++++--------------------------
>  2 files changed, 123 insertions(+), 359 deletions(-)

LGTM.  For the series,

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
