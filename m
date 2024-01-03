Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A971C47073
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZzEUOCctDbB3jWhYMfgTNNOd0+u048NKkuwwZJrU+PI=; b=Cq+mRBna/q5vUB
	RfNfGZrIHdxxAIGImi4RtPT1mgugNwe7OfleFe33sI51JQrxQqh0zkwJAN1hoiAA57M6kPnjHpsbn
	RTsjnOLsIWQr/vwp0UGS/S6NWDZM73xcl/NaulRZobiYnX0Wpz2eGOEEnZIYXbEWgDEsHW3gpWBUq
	anfpgq2reIiwCJA5Rj2Uf8Qqwf+aLu3/o+N0F5tKzNkd/llS3kR29QCfIdhBcLTARG8PXVu9EA1Jt
	Mk96VdOMF3ytUubzP7OCLDCe6nAiosBo1TvQyPbuYXVdJyQ+JOU6hc4kWJH9rauSmVqI9+UI+gUZ3
	ULnbjoh4WU+JStny9lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Aa-00BOwT-16;
	Wed, 03 Jan 2024 16:32:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4AX-00BOvV-2E
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704299556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KyS8wdRUQsy10KBAC5tBoeMUxtC/5Vis4uewibneY24=;
	b=bUZ41hhGHC4vtDL1CW9bT2jmHd4/4dtpG6kdDaX7R+Gzg5fKC18LqGCtog3Ck5JUGl4Bx8
	0Xu3ksro2+4rcR4pU7iLwffj7x2Jxf5AI/Lr3l/BQakaQ1kksQav99TGO23lWoaGfcS599
	mM8Mg7DmvF2HTuUTlY6MuubuOfcE84Y=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-UhslvpvHMJK_zK-CEonGIg-1; Wed, 03 Jan 2024 11:32:33 -0500
X-MC-Unique: UhslvpvHMJK_zK-CEonGIg-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d410cccfc2so40427725ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704299551; x=1704904351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyS8wdRUQsy10KBAC5tBoeMUxtC/5Vis4uewibneY24=;
        b=W+7EgVLdwOEL/WHoBJ+yC8QZNWhRRt6sil41YrwphfkNAVcSxDeHfphanjpEPQgvfT
         5miknEs6ZdIvpQbNxSTgQy6qvdfJwxM8cdEB5LJW3ewpFr2CZjLPkd992KFsrfemP5VR
         GmRSOe4jxUaxZZ5abFM1M1c14S3TsgxEne8CCNFkciFTZtecKKDNQaa8G3cNH5HixEDT
         8j1zuWtAVs8QuDfhpB5YQ3s1T1rECLNX1pqTjkYtJ9TjrAj1N7rFmnspd8ueroPjZbp5
         ugo0rB9YhxWN3IHRUsZ5BXuNq7VYgt9y64lQYJZ6bjnbuv59plHeREUeyHHGZrD4c0OY
         ygfg==
X-Gm-Message-State: AOJu0YxSdLUMzkpD2KejDKWG3AQ42dKMZahprQWyzuUhNWfdfWwT8j9c
	AQJIsy2fKMgpa1mrsaSDOfYNTT+o6O52p79o1JGs41ssyMWBlcQBXfJy7T4VPcB5PCSPPz24Dsu
	EMToNX9gtv+QGLApgTIOvXE3Ie+xC89zwGUBS
X-Received: by 2002:a17:902:db85:b0:1d3:bceb:ba88 with SMTP id m5-20020a170902db8500b001d3bcebba88mr9465692pld.11.1704299551523;
        Wed, 03 Jan 2024 08:32:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+6GSIc7+Qig8DFanxr8PlU4r2+JepKfCBXAeWKp5WEN4cGQRs5a42dQlyEupGQsh2bh8+QQ==
X-Received: by 2002:a17:902:db85:b0:1d3:bceb:ba88 with SMTP id m5-20020a170902db8500b001d3bcebba88mr9465681pld.11.1704299551251;
        Wed, 03 Jan 2024 08:32:31 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902b78c00b001cfca7b8ee7sm23930425pls.99.2024.01.03.08.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:32:30 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/5] Rework & improve riscv cmpxchg.h and atomic.h
Date: Wed,  3 Jan 2024 13:31:58 -0300
Message-ID: <20240103163203.72768-2-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_083237_811981_58C03E96 
X-CRM114-Status: GOOD (  17.96  )
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

Latest tests happened based on this tree:
https://github.com/guoren83/linux/tree/qspinlock_v12

Thanks!
Leo

Changes since squashed cmpxchg RFCv5:
- Resend as v1
https://lore.kernel.org/all/20230810040349.92279-2-leobras@redhat.com/

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


base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
