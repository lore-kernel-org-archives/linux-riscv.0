Return-Path: <SRS0=GtJH=V5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD73C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2019 19:57:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26636206B8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2019 19:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DPPfJxeL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26636206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=41aNySVAp/byGZgwc30GIiqBl7A5+m2o7E1PIFZ4EWw=; b=DPPfJxeLpJW0m+h/UPdWu+Umy
	kg0NkBQo56rR1xyN8CMVwY5K055SQxs7r7NRZs4P+E4cMBwCe/kV79Rae0Sfqffr3H9RAv6h88iXB
	QTgJy1XwFYYBswcWhVCYPYhCkk20vWKfXDg4I418TcJnb5Kx4Tzemfj4khZqZrDZTCjhDxPfbrnRf
	zf8ywJ3HiDUzmH8Xt2Xa7EicRxMJafMsf3RopzTcz9B01aLWRg+NoROC/6e+VKHoje9qXsoGDOGMq
	fg7425j5CfEMb8SvCAWKoU5klCLO1u5oWAIlOStR+ETIRuTKDfwZc1WAmmNNKvjOD0BJjtM5UQvP/
	K2HvFmE0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htHCF-0005C3-3E; Thu, 01 Aug 2019 19:57:07 +0000
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htHCC-0005Bh-DL
 for linux-riscv@lists.infradead.org; Thu, 01 Aug 2019 19:57:05 +0000
Received: by mail-pl1-f195.google.com with SMTP id y8so32678083plr.12
 for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2019 12:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QX0Y3IbdsXZbZXldXGgz69Ir5a45ULUwxedI7PUrckw=;
 b=f7MJNTWPGUJVYN4kbfWz1sSQQvGg4ZPCmzznpHW5ETPx10m8uLQ8n4VjFad3JKxaCu
 8t+cyXqPD8pfO/ZuUU/zx4EaKj1SLGTzSqJrajVXtu1VqSqs/p6yIZ0tDNeL6yGpdpRd
 psZ843Vns1mBucj+Z3HbJ+SZdDThkAuaCPzQEk0MaqO3/w2ztsJMIH1O3z2ZiaqWLGaD
 S4R0euy1t2BsXsKszY0auGOTD+ZdXeWYlDqNY70MynyzWkGSfmUgLbdDDJ6PW9j3AQOQ
 AbU7UDNlOAl84rMYihUwPz2SbCESfdQvOCeD/MqnPXts++J6Ke/74gnsBBfnKJMtnvSW
 emBA==
X-Gm-Message-State: APjAAAU4722LuH4v2ZEQTQSitk3Uyn7GS1gWragLfMwGvFR3PA14me0l
 ZrB+3MejYM5bF1RJdeh+yr8=
X-Google-Smtp-Source: APXvYqwOTGz2HRbXkWP1Yl/IgoCCpvR9ZUf5piLKiwWcw3Y7m/BzY2vcaZTzfLkr7Uq/VG5S1A0bWA==
X-Received: by 2002:a17:902:2983:: with SMTP id
 h3mr128745938plb.45.1564689422501; 
 Thu, 01 Aug 2019 12:57:02 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w1sm5472016pjt.30.2019.08.01.12.57.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 12:57:01 -0700 (PDT)
Date: Thu, 01 Aug 2019 12:57:01 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Aug 2019 12:56:56 PDT (-0700)
Subject: Re: Random memory corruption with v5.2
In-Reply-To: <mvmo91a8xgh.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-35379643-72bf-48a5-bd5f-be8a5becf87f@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_125704_454019_2F7E0BF3 
X-CRM114-Status: GOOD (  13.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, david.abdurachmanov@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 31 Jul 2019 00:39:10 PDT (-0700), schwab@suse.de wrote:
> On Jul 30 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>> - Commit bf587caae305ae3b4393077fb22c98478ee55755 ("riscv: mm: synchronize
>> MMU after pte change")
>
> That would be my favorite.

If that patch causes memory corruption then something scary is going on.  I
haven't been following the thread closely enough to know how easy this is to
reproduce, but do you mind trying a kernel with a reverted version of that
commit?

This is also availiable on the "for-andreas" branch of git.kernel.org/palmer/linux.git

    commit 07d45256aa8641057c141f1a661bb29dd99eb32e
    gpg: Signature made Thu 01 Aug 2019 12:46:22 PM PDT
    gpg:                using RSA key 00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
    gpg:                issuer "palmer@dabbelt.com"
    gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
    gpg:                 aka "Palmer Dabbelt <palmer@sifive.com>" [ultimate]
    Author: Palmer Dabbelt <palmer@sifive.com>
    Date:   Thu Aug 1 12:45:12 2019 -0700
    
        Revert "riscv: mm: synchronize MMU after pte change"
    
        Andreas Schwab is seeing some random memory corruption with 5.2, and he
        thinks the reverted comit is the most likely candidate.  The commit
        itself doesn't revert cleanly, but that's just because getting the
        comment right took two commits.
    
        If this does fix the issue then we're in a bit of trouble, as this TLB
        flush should be pretty safe.
    
        This reverts commit bf587caae305ae3b4393077fb22c98478ee55755.
    
        Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
    
    diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
    index f960c3f4ce47..28dccb072255 100644
    --- a/arch/riscv/mm/fault.c
    +++ b/arch/riscv/mm/fault.c
    @@ -16,7 +16,6 @@
    
     #include <asm/pgalloc.h>
     #include <asm/ptrace.h>
    -#include <asm/tlbflush.h>
    
     /*
      * This routine handles page faults.  It determines the address and the
    @@ -267,14 +266,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
                    if (!pte_present(*pte_k))
                            goto no_context;
    
    -               /*
    -                * The kernel assumes that TLBs don't cache invalid
    -                * entries, but in RISC-V, SFENCE.VMA specifies an
    -                * ordering constraint, not a cache flush; it is
    -                * necessary even after writing invalid entries.
    -                */
    -               local_flush_tlb_page(addr);
    -
                    return;
            }
     }

>> - Commit 6dd91e0eacff0a5c822ca37565d6b5740c4d2a80 ("RISC-V: defconfig:
>> Enable NO_HZ_IDLE and HIGH_RES_TIMERS")
>
> I had these enabled forever already.

IIRC that was the argument for enabling them in defconfig :)

>> - Commit 671f9a3e2e24cdeb2d2856abee7422f093e23e29 ("RISC-V: Setup initial
>> page tables in two stages")
>
> I don't think a one-time initial setup can have such a subtle effect.

As per Anup, it's not in 5.2.

>
> Andreas.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
