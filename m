Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7950DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6XEM8cACbbM2UE7SKT2nsSObFKR7s2K54Tf/EA3kCE=; b=I6hqnRoLnsTbao
	uCklzasJNsv4h683J98S0NqBW+Tk0pX8co7t/+3YzTJr7aLig6am6+qQ+9+FGiMhZ+H/KCCjc4wZ0
	1dl7nKBzmVQVwOQPx4uGqB8v3dpSXgavSLbUW6nDt0aQcnGAknYZu2nmAbRelv22gyMMWDjpliv91
	/72GbxhOeKvB3NLgtDm50oe4jP7cs4ZpeIV9b0Pctw7nvvKIoPR8Q3KzARkiLOnsXlgCDBuJPFCCw
	otlDh/k59qavDXogbfmoEsjLYY71mr9kcrE8psXvsb8k/ny6Wvf59KXDYuIm5IR2iQ/JixipvIYUX
	OgUBDdUw58oPs8Cy4f+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Cq-00BPj1-05;
	Wed, 03 Jan 2024 16:35:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Cm-00BPhd-0r
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704299695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tH023szvNYa//ZF6grt40ifEfduA6uuUO2rklppqYOI=;
	b=IF75jy6CQtbkllC+kvHC/WvusSJFsPWVxccdBo68+GT4siOcHqUitzpgOAQeDosiR/S/x+
	oMb7FAd85YKW8X99SvfS7koEn5t9swFSuTKJMYsj/nCiCE1TIwYyKsq8QetnQN/QSvyTjx
	lz80+Z0FTUF8PPCZ/TFJYhFJ/NGy7Gc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-w64PmStRNRqXaQfiWlHWMw-1; Wed, 03 Jan 2024 11:34:53 -0500
X-MC-Unique: w64PmStRNRqXaQfiWlHWMw-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6d99506e2e7so11043527b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704299692; x=1704904492;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tH023szvNYa//ZF6grt40ifEfduA6uuUO2rklppqYOI=;
        b=EVxwM5rA5MGBTFkFAXxpPu1ESrH3+jzWlXLkGFkZB+rlpaftm7M4l0D0z3Zua/12ur
         XWB6g2n6pmwKQxG/cjcRQIw6BUja4U7Oaf3rBbVbQ1oM/WrO2ZIB5x9ssmpquHhC+i0l
         LYHjErZXsRJeLSdmRlLpJQw8GUVbW3p1yCouch1iaaFW2kRSL4YQoZ7GO3gHynMyCCZk
         Fy70ZqIrnuXlragyRc2YxIBlpYxAIwyn0LtxM7mXOFPIBEn8EL2hxuKkvdy5SK3VbGQX
         Y2h24fEf3XN0ZqVw474fPZ7l/anMvmw68vwTE/V3xM4ub1sbY8RHhxeWoB5jnRL4rHji
         tnTA==
X-Gm-Message-State: AOJu0YwKktn2qGnu9NLuqGSMyBn5RwUyqXEhW6swebF2MtGp4iL8k5GI
	9k9sz66klhICmoGGou45Y3kQyWNUVSmfcKVv33xw2RIsznHqV0xPjtvRxW+VlRmKR9J4EFdi+To
	Myw8XDaWylOcWw3W1L++zqhv02m3mDVSqrqnp
X-Received: by 2002:aa7:8dd7:0:b0:6d9:8ab2:c853 with SMTP id j23-20020aa78dd7000000b006d98ab2c853mr19059082pfr.12.1704299692604;
        Wed, 03 Jan 2024 08:34:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQx6xOcahl7NUiU4wN9Ryq88SdYIolFo1LKNQ3pa9MfnsSS6ZO05u7ru3z4/+N2V4KO+Kelw==
X-Received: by 2002:aa7:8dd7:0:b0:6d9:8ab2:c853 with SMTP id j23-20020aa78dd7000000b006d98ab2c853mr19059071pfr.12.1704299692311;
        Wed, 03 Jan 2024 08:34:52 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id fb27-20020a056a002d9b00b006d9bdc0f765sm16187447pfb.53.2024.01.03.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:34:51 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/5] Rework & improve riscv cmpxchg.h and atomic.h
Date: Wed,  3 Jan 2024 13:34:43 -0300
Message-ID: <ZZWMox3D2GHX0Tzr@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103163203.72768-2-leobras@redhat.com>
References: <20240103163203.72768-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_083456_375575_51875191 
X-CRM114-Status: GOOD (  28.54  )
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

On Wed, Jan 03, 2024 at 01:31:58PM -0300, Leonardo Bras wrote:
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
> After that, I noted both cmpxchg and xchg only accept variables of 
> size 4 and 8, compared to x86 and arm64 which do 1,2,4,8.
> 
> Now that deduplication is done, it is quite direct to implement them
> for variable sizes 1 and 2, so I did it. Then Guo Ren already presented
> me some possible users :)
> 
> I did compare the generated asm on a test.c that contained usage for every
> changed function, and could not detect any change on patches 1 + 2 + 3 
> compared with upstream.
> 
> Pathes 4 & 5 were compiled-tested, merged with guoren/qspinlock_v11 and
> booted just fine with qemu -machine virt -append "qspinlock". 
> 
> (tree: https://gitlab.com/LeoBras/linux/-/commits/guo_qspinlock_v11)
> 
> Latest tests happened based on this tree:
> https://github.com/guoren83/linux/tree/qspinlock_v12
> 
> Thanks!
> Leo
> 
> Changes since squashed cmpxchg RFCv5:
> - Resend as v1

Oh, forgot to mention:
I added some of Reviewed-by that were missing.
Thanks Guo Ren!


> https://lore.kernel.org/all/20230810040349.92279-2-leobras@redhat.com/
> 
> Changes since squashed cmpxchg RFCv4:
> - Added (__typeof__(*(p))) before returning from {cmp,}xchg, as done
>   in current upstream, (possibly) fixing the bug from kernel test robot
> https://lore.kernel.org/all/20230809021311.1390578-2-leobras@redhat.com/
> 
> Changes since squashed cmpxchg RFCv3:
> - Fixed bug on cmpxchg macro for var size 1 & 2: now working
> - Macros for var size 1 & 2's lr.w and sc.w now are guaranteed to receive
>   input of a 32-bit aligned address
> - Renamed internal macros from _mask to _masked for patches 4 & 5
> - __rc variable on macros for var size 1 & 2 changed from register to ulong 
> https://lore.kernel.org/all/20230804084900.1135660-2-leobras@redhat.com/
> 
> Changes since squashed cmpxchg RFCv2:
> - Removed rc parameter from the new macro: it can be internal to the macro
> - 2 new patches: cmpxchg size 1 and 2, xchg size 1 and 2
> https://lore.kernel.org/all/20230803051401.710236-2-leobras@redhat.com/
> 
> Changes since squashed cmpxchg RFCv1:
> - Unified with atomic.c patchset
> - Rebased on top of torvalds/master (thanks Andrea Parri!)
> - Removed helper macros that were not being used elsewhere in the kernel.
> https://lore.kernel.org/all/20230419062505.257231-1-leobras@redhat.com/
> https://lore.kernel.org/all/20230406082018.70367-1-leobras@redhat.com/
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
> Leonardo Bras (5):
>   riscv/cmpxchg: Deduplicate xchg() asm functions
>   riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
>   riscv/atomic.h : Deduplicate arch_atomic.*
>   riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
>   riscv/cmpxchg: Implement xchg for variables of size 1 and 2
> 
>  arch/riscv/include/asm/atomic.h  | 164 ++++++-------
>  arch/riscv/include/asm/cmpxchg.h | 404 ++++++++++---------------------
>  2 files changed, 200 insertions(+), 368 deletions(-)
> 
> 
> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
> -- 
> 2.43.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
