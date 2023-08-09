Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86707C001DB
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 02:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rZzguMvhiVXEQTjwtjbrpBdmFsWVhZxso5LQoH6Md3o=; b=4SlNy0TPYAad9w
	Zn09nfnhd2Zy+ey76AufWfdlRoL56EXP6qx4d82ueBB91RJVMfRQdzFMjUraH+YUknoWs2mvP28jL
	d7mwWtKflZE7ulIWf6jLrY0R4Bf/C0gUyi+Qhm+Fqe0w594v9RRz6xWhfjPoxJI6NdiY+Q6uJ9Ukk
	Fm+jC4F6C+1WjPGFrV2mWkeB77DHtSPPW8+9VUDJG9obBfakwuVIYqcoVgEqrxCNowpRZT9uw3Zqd
	ZoraFOyl/SXDcah51G8+4kqcGNgCDxHymjmXByrWkclt3+5iyG0kqXKWIij0C9X0ogwehO9fkKCyN
	01Vc3xW5RU2YdT2S5vag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYi3-003sV2-0v;
	Wed, 09 Aug 2023 02:14:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYi0-003sTM-18
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 02:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691547237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rTa9TiH+Nbxa2120Ikd+iVzWMSduN4Wn5JO47t6FkLU=;
	b=OoSlD42eYb9dMARDpdlzTtVOUlsaDP9XKZx4T0aKPUNcPPqihENAPv66EfH1Ze6jJFnSwt
	l8+mT0PtaGbZSpgpbfaJ8j2nARV0u9kIbZY3Eka1FMxhZcZCH+MZwPG03GmNjx0GpgBxNY
	RikNdZRgQ1j+MOuweYehTck7EuuPe7s=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-t18F7HvVNUO_JrwIhmyQRA-1; Tue, 08 Aug 2023 22:13:53 -0400
X-MC-Unique: t18F7HvVNUO_JrwIhmyQRA-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1b728bfb372so10757967fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 19:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691547233; x=1692152033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTa9TiH+Nbxa2120Ikd+iVzWMSduN4Wn5JO47t6FkLU=;
        b=W2C3xHOoMjfwQuZTx09QCobLjm0JtvWgYG1YXdCKyCIndDeZscEfwjCdaKmtM/eIcb
         aTAjNeyS2p2W/6teKTge1fBrwE+6vAFg0HwI1Rgw4cdKqpD0Q9PPkmIuW6eIZWYeGNfE
         R2+uAnxQq6MYTlf3BjHEBYwFzLkucdw4eRufH7nem4PX6cVOmnd+538hU+633y4nRzu3
         SvUPSCB3xhzSlVEHwgVO0CE9dhG7VkbnBemDqdTllXPOJ2ckagV1wAu5986x0YVdrBbu
         MZS9R/OKK4UkOGYR9CKQuyjiH+LVH59nQO+ettR0KHsfOBVBT/i5h3oLU00nefq7/B0+
         /hEA==
X-Gm-Message-State: AOJu0YxZ76NpjCb6lDHTUgg1zv7DU61/ZIgyXWUTuwyVPQ3ptlig0hLk
	3tsoThERDXD4UTwLwD9UfqUnxKgFGVz8tZE/JeVCQxjiT9Amxi96tGBz9ENLgyd2g8MI/9Qt2/n
	9bMVrZcig9zAjkECskHOFpjsdN+Nh
X-Received: by 2002:a05:6870:7021:b0:1c0:937:455d with SMTP id u33-20020a056870702100b001c00937455dmr1416393oae.47.1691547232925;
        Tue, 08 Aug 2023 19:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqkpT1KmB1FHQPpHFcKjNk/v3gmX17a9n9hY2y6PuFc72hYlrXkYhDcUn67exIN3jxg/2rEw==
X-Received: by 2002:a05:6870:7021:b0:1c0:937:455d with SMTP id u33-20020a056870702100b001c00937455dmr1416382oae.47.1691547232692;
        Tue, 08 Aug 2023 19:13:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id v10-20020a4a8c4a000000b0054fba751207sm6475518ooj.47.2023.08.08.19.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 19:13:52 -0700 (PDT)
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
	Ingo Molnar <mingo@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v4 0/5] Rework & improve riscv cmpxchg.h and atomic.h
Date: Tue,  8 Aug 2023 23:13:05 -0300
Message-ID: <20230809021311.1390578-2-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_191400_456290_4597550E 
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

Thanks!
Leo

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
 arch/riscv/include/asm/cmpxchg.h | 394 ++++++++++---------------------
 2 files changed, 195 insertions(+), 363 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
