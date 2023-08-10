Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77CFC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 04:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u8vR54zSwR4r7NPlyuqzQbSsajJ1/QdaaFIR327s29w=; b=ELUZnhPBGDs1wI
	DGVeOS1Duv4PFPmEnfLiGrgOmF6Vhd7l+1OgJEeJiYPUAlBCgloNNLX7675VoL9LL+Id15ta/xAlH
	jKuaNwTi/YUw1b4/v7SsFPRe649PuReXkc9bmmKGC7UGpmSvCG+wCndOm1h7x6arLT423pSi6G34f
	AId/+0vDkOlt+GXJLZsVC2bWUNyKrLDEKdb+F4WiX9R7OuUq/kTCwVnzb6okNqxP63wMJ245xHVn8
	KZACDX9OY27OmTmEuQym9cuBEw3IdLAW8JufzrBp65F5DylnJV60uxERAzrpYtPkt3OnMFO89nZEL
	6TdIpEqKTSNv+NovQn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTwuE-006SfA-1Q;
	Thu, 10 Aug 2023 04:04:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTwuB-006SeL-2K
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 04:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691640249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2OLbepSphciEGJE4bJCxealOkUeL/9cWm3RUGVYxJgs=;
	b=Fx22kPfeHXtw8OoA3uK5mFBTXRLQbTfYg9F/TpKeAhP0fMIVFUF4TyDiDukM7zraX7O0it
	uBOJxpngeW6XEFXQibIB9i9PSW8DdflgYcZ0NR76iX+806k+DKuKFxHQepEGan6oYoLCPa
	B3Z+LTXItjaCxVNuVm58PRqFBidygO0=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-mFIs1DMpPbWw_fLp3yi9Ag-1; Thu, 10 Aug 2023 00:04:07 -0400
X-MC-Unique: mFIs1DMpPbWw_fLp3yi9Ag-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a3c77c9962so594030b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 21:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691640247; x=1692245047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OLbepSphciEGJE4bJCxealOkUeL/9cWm3RUGVYxJgs=;
        b=KCEnYETuG00dJgsftt5PQqKDW/BYowAdPdY4QgeZt/zyNLs/NMEzqQMHDumN6yU7ht
         EtDIxSsbKeo4p7yO41sBwag7INIr2JqaK0+Dd/AMwKM1TAc8iPbt/dFFGdrk+wrZ8XCU
         8X27xiC9s2AvBhid84iLWkDats/u6BTwZaixykMzOJVFK9cROvp4zZ9eeeXG/Q/tQVv1
         mJH61ddTruMyXuSMCYVRBjnzNkxBEXgFJcQAv6w16HxtQW+tbhYOZNLM16BMSnVlTZ3m
         0FNGRjZr9BBAQTcm+sMBoVA9nFMlXcvAmMvjvNjhre6JTpzAPoyUL6m+6aa33MwhRNj1
         0cZA==
X-Gm-Message-State: AOJu0YxqnuA7x3TfEd9MKnYkKYU4YQmia0VuRZNCco3b3b2HfW/cEnF7
	ymZetik57bqFPNoXoPEqND1McZM0MZCjwklGIaIwH3Uar/xt+NiN//3Np3+nxrqCnVJQROkU2MG
	7ih/197HBg/AACtHjsXZAqjt2EZ7y
X-Received: by 2002:a05:6808:f8f:b0:3a7:b5ea:f5e7 with SMTP id o15-20020a0568080f8f00b003a7b5eaf5e7mr1590106oiw.39.1691640247261;
        Wed, 09 Aug 2023 21:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGrVTABi9DM/7BtIXxZ1gTcVgv3KREaNdRSut6DEtFrG77Otdfw7ErMXSR9FZjkKtmYK8ufg==
X-Received: by 2002:a05:6808:f8f:b0:3a7:b5ea:f5e7 with SMTP id o15-20020a0568080f8f00b003a7b5eaf5e7mr1590084oiw.39.1691640246996;
        Wed, 09 Aug 2023 21:04:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id b12-20020aca674c000000b003a7b5193909sm310087oiy.19.2023.08.09.21.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:04:06 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v5 0/5] Rework & improve riscv cmpxchg.h and atomic.h
Date: Thu, 10 Aug 2023 01:03:42 -0300
Message-ID: <20230810040349.92279-2-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_210411_856116_709E2801 
X-CRM114-Status: GOOD (  17.50  )
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

While studying riscv's cmpxchg.h file, I got really interested in
understanding how RISCV asm implemented the different versions of
{cmp,}xchg.

When I understood the pattern, it made sense for me to remove the
duplications and create macros to make it easier to understand what exactly
changes between the versions: Instruction sufixes & barriers.

Also, did the same kind of work on atomic.c.

After that, I noted both cmpxchg and xchg only accept variables of 
size 4 and 8, compared to x86 and arm64 which do 1,2,4,8.

Now that deduplication is done, it is quite direct to implement them
for variable sizes 1 and 2, so I did it. Then Guo Ren already presented
me some possible users :)

I did compare the generated asm on a test.c that contained usage for every
changed function, and could not detect any change on patches 1 + 2 + 3 
compared with upstream.

Pathes 4 & 5 were compiled-tested, merged with guoren/qspinlock_v11 and
booted just fine with qemu -machine virt -append "qspinlock". 

(tree: https://gitlab.com/LeoBras/linux/-/commits/guo_qspinlock_v11)

Thanks!
Leo

Changes since squashed cmpxchg RFCv4:
- Added (__typeof__(*(p))) before returning from {cmp,}xchg, as done
  in current upstream, (possibly) fixing the bug from kernel test robot
https://lore.kernel.org/all/20230809021311.1390578-2-leobras@redhat.com/

Changes since squashed cmpxchg RFCv3:
- Fixed bug on cmpxchg macro for var size 1 & 2: now working
- Macros for var size 1 & 2's lr.w and sc.w now are guaranteed to receive
  input of a 32-bit aligned address
- Renamed internal macros from _mask to _masked for patches 4 & 5
- __rc variable on macros for var size 1 & 2 changed from register to ulong 
https://lore.kernel.org/all/20230804084900.1135660-2-leobras@redhat.com/

Changes since squashed cmpxchg RFCv2:
- Removed rc parameter from the new macro: it can be internal to the macro
- 2 new patches: cmpxchg size 1 and 2, xchg size 1 and 2
https://lore.kernel.org/all/20230803051401.710236-2-leobras@redhat.com/

Changes since squashed cmpxchg RFCv1:
- Unified with atomic.c patchset
- Rebased on top of torvalds/master (thanks Andrea Parri!)
- Removed helper macros that were not being used elsewhere in the kernel.
https://lore.kernel.org/all/20230419062505.257231-1-leobras@redhat.com/
https://lore.kernel.org/all/20230406082018.70367-1-leobras@redhat.com/

Changes since (cmpxchg) RFCv3:
- Squashed the 6 original patches in 2: one for cmpxchg and one for xchg
https://lore.kernel.org/all/20230404163741.2762165-1-leobras@redhat.com/

Changes since (cmpxchg) RFCv2:
- Fixed  macros that depend on having a local variable with a magic name
- Previous cast to (long) is now only applied on 4-bytes cmpxchg
https://lore.kernel.org/all/20230321074249.2221674-1-leobras@redhat.com/

Changes since (cmpxchg) RFCv1:
- Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error
https://lore.kernel.org/all/20230318080059.1109286-1-leobras@redhat.com/

Leonardo Bras (5):
  riscv/cmpxchg: Deduplicate xchg() asm functions
  riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
  riscv/atomic.h : Deduplicate arch_atomic.*
  riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
  riscv/cmpxchg: Implement xchg for variables of size 1 and 2

 arch/riscv/include/asm/atomic.h  | 164 ++++++-------
 arch/riscv/include/asm/cmpxchg.h | 404 ++++++++++---------------------
 2 files changed, 200 insertions(+), 368 deletions(-)


base-commit: cacc6e22932f373a91d7be55a9b992dc77f4c59b
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
