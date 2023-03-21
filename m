Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C8CC74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6QBcFaKqgNpGvXuK8jncgoBEx6nwfNtNbMxstirkru4=; b=nHueHRtkOXpivJ
	87yIXDX1/p1jWv3A4/sPUOXohQnwy3xStwP/bDIRGeBZBGivG7gMXAzzeL4EXOTZiJMyjdtbQ5SJ0
	8Y1OQLpcaOWEfTOWNuSZr7oOEFPiYjWXyMMwyKgzEuXsFB5BTRAGNW/QH/ILSRxoUbKS132k8X9Qm
	doBCByxJ+5kxWhiAf1HAMHHuTsVYbXibbvxdFeIp5DLeVeSmoLJ+o5e1tJ2d7qQK1/2DxHNZXj8dW
	YBmhrKcSElkfIbXtgFODikU78LjrPajh/x65942n/veobjmzzTnNEOjxUejSasOs1GpKkgAibjpgq
	7OaBcIPrqxfWTCBRKrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVaM-00BOHn-22;
	Tue, 21 Mar 2023 06:35:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVaH-00BOGO-27
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679380498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QE3XU3Zue9M7HDU7dSkC4z4rXd/9VbR7G9gpQxcbxKY=;
	b=P4TQmYlFi/pVEMSbJRbzxcngP3lDHtlcqvHIZE4rEm3P+tF76JbRLQSFawaz+e/ATd25NP
	ERGZ8u4nYtUbnBI3XHhAD4Hsq/fWctMuM/Aw8E/wrqfgMju/CGWSjpxjOqR0DZVvKo4uH8
	bp9u1gvmIDESExifFpOPzGstk8ZYPOw=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-KNeP1l4fNQ-VoH-f7rItVw-1; Tue, 21 Mar 2023 02:34:54 -0400
X-MC-Unique: KNeP1l4fNQ-VoH-f7rItVw-1
Received: by mail-ot1-f72.google.com with SMTP id y14-20020a056830208e00b006943ddbfb7eso6673998otq.5
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE3XU3Zue9M7HDU7dSkC4z4rXd/9VbR7G9gpQxcbxKY=;
        b=yrTCsy7oplt9kVYwExIRjQTbPs8T7KsumLhGIWfpWsORcgT9b7zriReO6KkD0tuPXY
         J/wjyDH1a+ZT4LIpexknIeGbZbCqRFouVWEPYE2c8hiWhFUwHQXZ46Ep0a2Aq7aoQCXN
         sIwKchQ5thXrsSvLbu267q6JNMyUK+fIeqtQHv1ykYO/MT13EXAV+8w2pLuiYkfyjSQu
         99LLV84doPYLjjTjUiKboGdtv0KWNyl6i4g+QEOw+LVhXpJqYHjKk15KyX08kwS89gUw
         4Hy4Zzzu4uTPKd+iX+WOZdymhLTEOrHcriMl4siLPRXmV7DFPR3R8/QAkmbKOsdk60Vu
         MZtQ==
X-Gm-Message-State: AO0yUKWjeiL1/UD4wz0eHwDbrCkD5pHVr0Ue7lhUtD+jiEkCy+J2/TiG
	F/lNLCnD0+vvnFNbZ4b2veoyclpIHQkBVSAZB9/u57vBaDD5FdvIn/msfbKYb9iurlNd6UmtXBB
	xVDdexvih4dPUD58TMvAy2U7A4Ssy
X-Received: by 2002:a9d:3e10:0:b0:69f:1577:d8e9 with SMTP id a16-20020a9d3e10000000b0069f1577d8e9mr450792otd.8.1679380493870;
        Mon, 20 Mar 2023 23:34:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set+fYUkJDXtxyGwR/4oInygBuG0trygiznXejWTs81vY/TFo47Up6YucY+xrz9N15XIYjbb2sA==
X-Received: by 2002:a9d:3e10:0:b0:69f:1577:d8e9 with SMTP id a16-20020a9d3e10000000b0069f1577d8e9mr450782otd.8.1679380493648;
        Mon, 20 Mar 2023 23:34:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id y75-20020a4a454e000000b005293e9a12f5sm4545147ooa.45.2023.03.20.23.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:34:53 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/6] Deduplicating RISCV cmpxchg.h macros
Date: Tue, 21 Mar 2023 03:34:25 -0300
Message-Id: <20230321063430.2218795-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_233501_785376_15786288 
X-CRM114-Status: UNSURE (   8.47  )
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

I split those changes in 3 levels for each cmpxchg and xchg, resulting a 
total of 6 patches. I did this so it becomes easier to review and remove 
the last levels if desired, but I have no issue squashing them if it's 
better.

Please provide comments.

Thanks!
Leo

Changes since v1:
- Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error

Leonardo Bras (6):
  riscv/cmpxchg: Deduplicate cmpxchg() asm functions
  riscv/cmpxchg: Deduplicate cmpxchg() macros
  riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
  riscv/cmpxchg: Deduplicate xchg() asm functions
  riscv/cmpxchg: Deduplicate xchg() macros
  riscv/cmpxchg: Deduplicate arch_xchg() macros

 arch/riscv/include/asm/cmpxchg.h | 316 +++++++------------------------
 1 file changed, 64 insertions(+), 252 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
