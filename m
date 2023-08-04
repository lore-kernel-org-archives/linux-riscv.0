Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DA4C41513
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rX33tV63+dK0iwlGzEvl2HSSZ3T4+xAF7tvqwWacI2o=; b=M6OO0HMBX4/DqM
	nXcDQ39R72Yk5iFA8jSgs5NMEfH8yPkRFyYJ5YvdqBP04r2GS6uJUrLzhnRgU4cSgIeM9MljKwIlB
	E8RhStZEjh59EglZl9OgBwNugj/SLHNClEwJXk4ur9jUhdkE/NnHxvMs78LD022HGy1PytVEjyZqA
	beNe1YJUTPymmsxgKm04WfC3HmzpRSXCTcKTwW+Z4/FZuxQ0U8K76Ia6WXWfeEEPCHHds1tkKaxmi
	dO+TzdOGokX1eeW/mDa0FX+QI/kg/5bRtEp2s8dqI+qDkTWSe1pmfZPA6Okg49TwXqlUkjhd9Yyak
	C2DW6BBukDVh2+E3LDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqV0-00BvcQ-1O;
	Fri, 04 Aug 2023 08:49:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqUx-00Bvb4-2L
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691138963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1Vur9vhFgQMc0z7IU3gYJPoDLW/uQBhNiS46lcgbsys=;
	b=QhsiyAR1CwlkAnm5JhZTIV4sMNcd10+T3M5FyoZ2DpcFRXC2gK7uyBkaaPy3Fo+W4T9cza
	ec0LUx6axI35H+NjAMyz5cZtBZTplqdEUhJsTEo1MTT6nch+n4vb5Uo9IzaLkY1fLTuY7R
	CxklQb1IdnKGKPRlobZTprw9OFcR/j4=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-RTG7kem9OV2dqChfjxHYdA-1; Fri, 04 Aug 2023 04:49:21 -0400
X-MC-Unique: RTG7kem9OV2dqChfjxHYdA-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-56c8f506f27so2607457eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 01:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691138961; x=1691743761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Vur9vhFgQMc0z7IU3gYJPoDLW/uQBhNiS46lcgbsys=;
        b=iPdp1PBEajI8ThIPEvOdKdLEew1XQHoTlm6A4ojgBMQMW749+y8fVi6/nRQwWZmY8U
         uO7u+G0X9CwxBaJjROCGwIacmCg5TkdeO6PvM1pJb3swEDJKKwvo9O7tFGgiOJ1KOv/E
         n/EAfooaK6tUcHMANax55MGgnKwzna/Q3reW5jR5FKDX+efsk065jN7RRPPZhHWEmIjT
         0Wk7ZFhWNHX77DusGEMXvqknBafIHxl4q5sZAbX9P0bGYfOuzzjbfG+oc569DX/MwyQr
         /a+RsMy5j6YmpwYUdy/dv6DVAaenKLH/rlWzkNK/GHsePfEbRmzZ8JLoPUqvuZAnLbm7
         1meg==
X-Gm-Message-State: AOJu0YzxotdDS7jiOxHI9/6XZhwtQx+7KvktckrgNtUUAyb/gvp//UP+
	XmyROUKjn7uULhvWG5UZc/0qw0DDFlQBadC9KxRCUMRvMK9QwGCneN9s+VbHnR2EPN+5/a3qTdw
	hWDL1y5Wll9Q6btUH7gYXMFzlYaHH
X-Received: by 2002:a4a:3947:0:b0:566:f763:8fb7 with SMTP id x7-20020a4a3947000000b00566f7638fb7mr1209712oog.2.1691138960725;
        Fri, 04 Aug 2023 01:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+UFfE5kIqjMnJEnmHBbkiyastZJTrRw0+4RxwlYLXQBsPZsV+LE6/4Sbj30UIpvzm+AUyKg==
X-Received: by 2002:a4a:3947:0:b0:566:f763:8fb7 with SMTP id x7-20020a4a3947000000b00566f7638fb7mr1209698oog.2.1691138960284;
        Fri, 04 Aug 2023 01:49:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:d380:694f:4f52:764c:4b7f])
        by smtp.gmail.com with ESMTPSA id f8-20020a4ab008000000b0055516447257sm685679oon.29.2023.08.04.01.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 01:49:19 -0700 (PDT)
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
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 0/5] Rework & improve riscv cmpxchg.h and atomic.h
Date: Fri,  4 Aug 2023 05:48:53 -0300
Message-ID: <20230804084900.1135660-2-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_014927_852963_16C5B26A 
X-CRM114-Status: GOOD (  16.05  )
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

Pathes 4 & 5 were compiled-tested, but I could not run-test them yet.

Thanks!
Leo


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
 arch/riscv/include/asm/cmpxchg.h | 393 ++++++++++---------------------
 2 files changed, 195 insertions(+), 362 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
