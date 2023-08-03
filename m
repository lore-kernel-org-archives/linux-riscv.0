Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA79C41513
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 05:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=llabdlSOjgybfawjyHxjhKDy6kbFofaHYqpobH8Ggos=; b=yOVIeNwUuojiqJ
	kAtbSRTiTRTt4cC8s87QfFi+2lCce4yYlx6M6vGhEbm7rxzNw79k5/4gUUd9PBhx7ORJ9dA+FKuwB
	t5hSJWX6zQOGzAdAmZgR0LtYi0SCBXVFGluNovkhKnQLAKsLvU+UkugpCSnKcKgJDGZbW22JeHJ+S
	yeM+dyWJAA3E+q5eCL+7pG2kQPINa72ZbWmCaa/r+nNSpSYCklJVW2bEfiYxxP7sEeSD+NbnYSLZQ
	13y1rOacyVsrOcXTi/bghqxG+ZWfanVqnvi2yoMLaCkgXYh/nZ2nCq3pzlpGxWlUlW7JuwJLHjrug
	L1HRfG0xeoTRddyFeLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQfa-006fOe-0W;
	Thu, 03 Aug 2023 05:14:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQfW-006fNl-2v
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 05:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691039674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tVYxWTkZM5MxAXyW1tcoWD4FZJx006FyKlsgQ2S6vrI=;
	b=JAwFb136b3jr9hIQhOTJY4bA0C3ceofPuU253rMCipy0YscB87XehtMEQrNH1bCmh/fQHt
	JnfZeHst5PY6qlmFBTKMjp7Cug5Fbf0bA4wbvtVautNyjIJrdML78ToSrcInS3RDob9g6g
	NAAbQRwkM8MTJkFiTnqZZ4Rk+oXtl0w=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-6aiMRpKYOqKn8hLdo0uvrQ-1; Thu, 03 Aug 2023 01:14:31 -0400
X-MC-Unique: 6aiMRpKYOqKn8hLdo0uvrQ-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3a751d44acdso875193b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 22:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691039670; x=1691644470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVYxWTkZM5MxAXyW1tcoWD4FZJx006FyKlsgQ2S6vrI=;
        b=VTAiZEdtwktmo/oSOtKgXnQZT/O1CiW5JCI7P0DIZ/7fTwbXOYih9zCIFYHb17R35T
         BauxdC37LhTVUoU4qAd0YOXP8QM4MEhku7dUIif9CPSggVAKXN+hk8HR5BoXdtxUQ556
         TL04UTS05DLf8Y1W8vcWlIo628h6DEx+Zbc0YEaDiwyYcgPZ49T86R3wuOCz8V0BKMSE
         8ya6IWb1MIdxvXFiZfNVRdX7sA3ui8aromwMvMAIwvoWPkBW+BHefAb+Xrkm62uvBrk3
         rI6FXo0fLgr/khgQUVOQuxQ1ZnBHY4ubaVTAGxVSyrGKDEQYyj52IXVnLkfTbSPRjAIj
         TS/A==
X-Gm-Message-State: ABy/qLYJXe0+NhMTLoPIcWJ9/xD07QzmX4Hns3IwTrpMqL+zSNRd/pfF
	BVGkPySnxqLPh5qCZUzAaKFeObE+3PGimi+4wp5L9xf04JdBp472IHY68oxRN4lyiBaidwtDEZx
	ujqVY/qa6Z+HLUm9Ynwy6TwK+TkJx
X-Received: by 2002:a05:6808:1243:b0:3a4:a87:bea1 with SMTP id o3-20020a056808124300b003a40a87bea1mr22621584oiv.21.1691039670627;
        Wed, 02 Aug 2023 22:14:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGHkWZOKBl6mFHadL8uFrpU9XlCOsSVnPSp3iY1y2FAQauWvnIQlW4XqyEz3aKjpwF/O5uLEw==
X-Received: by 2002:a05:6808:1243:b0:3a4:a87:bea1 with SMTP id o3-20020a056808124300b003a40a87bea1mr22621571oiv.21.1691039670356;
        Wed, 02 Aug 2023 22:14:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:d380:694f:4f52:764c:4b7f])
        by smtp.gmail.com with ESMTPSA id g51-20020a0568080df300b003a75593746asm1675473oic.57.2023.08.02.22.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 22:14:29 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ingo Molnar <mingo@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 0/3] Deduplicate RISCV cmpxchg.h and atomic.c macros
Date: Thu,  3 Aug 2023 02:13:57 -0300
Message-ID: <20230803051401.710236-2-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_221439_038335_98E297CD 
X-CRM114-Status: GOOD (  13.01  )
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

I unified previous patchsets into a single one, since the work is related.

While studying riscv's cmpxchg.h file, I got really interested in
understanding how RISCV asm implemented the different versions of
{cmp,}xchg.

When I understood the pattern, it made sense for me to remove the
duplications and create macros to make it easier to understand what exactly
changes between the versions: Instruction sufixes & barriers.

Also, did the same kind of work on atomic.c.

Note to Guo Ren:
I did some further improvement after your previous reviews, so I ended
up afraid including your Reviewed-by before cheching if the changes are
ok for you. Please check it out again, I just removed some helper macros
that were not being used elsewhere in the kernel.

Thanks!
Leo


Changes since squashed cmpxchg:
- Unified with atomic.c patchset 
- Rebased on top of torvalds/master (thanks Andrea Parri!)
- Removed helper macros that were not being used elsewhere in the kernel.

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


Leonardo Bras (3):
  riscv/cmpxchg: Deduplicate xchg() asm functions
  riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
  riscv/atomic.h : Deduplicate arch_atomic.*

 arch/riscv/include/asm/atomic.h  | 164 ++++++++--------
 arch/riscv/include/asm/cmpxchg.h | 318 +++++--------------------------
 2 files changed, 123 insertions(+), 359 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
