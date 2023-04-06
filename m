Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492AFC76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KTIOqrz0TSsYuYPn86raaqYSCBHsgSn97i30Sc2vWec=; b=zK4Sg08d3tZYgS
	kHgeSv74okAQeXRnHnhYJS4AgeT6B5QJ4x5KM0PeK5Ogm1aTGiZqx46cQDJxW+rMKBr8vkXxZNyNS
	nGuGtRSEy9/MwaBXPrYlfG85F4CbxFfGk09EBITbsZP7KsK2nHuEthhLxLWUu6gtBHhYCoX0ii3Fm
	0fMLpu4KAGcjsDEmvN9itG+tyo2nnByFNMXQJlkCxSQS/r6oIoDQZrMiL0cUeNP9nnAWWKB101zhd
	q+Ge7VJNHYrwkH8VzcoJ7CbyXlaxUCp91/0wqonLTPqSXH3PO+vA4jQ/Xtt8GlYgQj50wz/TvzrXY
	vs+Nql3e/jFHL9i10e/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKrK-006jTd-2J;
	Thu, 06 Apr 2023 08:20:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKrI-006jSX-1x
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 08:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680769236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BXUvMRorNZxITkqnZH1MXu0rmexe6DJRTF71KV+DIHs=;
	b=ISF0EgmLtXKA788zFMXpZx9I5k8qpNFvwMdSh5L9FtXrwuobeF9UlcO/rpR5Bs+7pvDFsu
	gXhCthTtgu91DMtIK2YDIZJRxML8fCnsRjOGhFQD3Ey3pcvLB7U0tgD0reRTbzz0L2V+dt
	llo9gACQEJxBUoUwBrAjTj9+wr+BkZ0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-hvGf_1xVNBWPYX633-yI0w-1; Thu, 06 Apr 2023 04:20:31 -0400
X-MC-Unique: hvGf_1xVNBWPYX633-yI0w-1
Received: by mail-qv1-f69.google.com with SMTP id g14-20020ad457ae000000b005aab630eb8eso17684427qvx.13
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 01:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680769231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXUvMRorNZxITkqnZH1MXu0rmexe6DJRTF71KV+DIHs=;
        b=sbVdQsosBwrRo4mTpM9pAwlaXjhfzSit9HD9hgU+WC6y4l4eByqIrgxqKnoaUuTagN
         yR3PYhFf1de5LHzPkce6TucXcnFER+xd0oM5dJdhmrrYJhW9FpF+yafNb972lnZUSt9w
         /n9pGTNoV5IZVBRNPuW27Q/0f9cUBx6/Rkrhf412jMsj7l4lwstGCRur0xa8QMPCs46A
         XTH7cmjCQqxQ7uwB2qkbiMSKsu/labr4fIOwinqK4WhKho3P/n5G9pdYE56Q3K+faItD
         qN6lehAnq0iFdpy1UoTYorSC602PTi5Fx52Y1t7bKiGRu9vWvQo3QeC94LTrsaBegFp5
         iKYQ==
X-Gm-Message-State: AAQBX9ez1yjXglg46Ub2kQd7STlyeflSYDmERwDWSdO3+BPiZxXFPisi
	J+96enLhTjGeQuiUUmHjJfpzd2w033lI0BtOudsptWKHKf9WAZd3cfKJgXYMUIg4if44icqUrhs
	Acme4D41y568CQYw9tQPtKlJhbD6Y
X-Received: by 2002:a05:622a:1310:b0:3bf:d71e:5af4 with SMTP id v16-20020a05622a131000b003bfd71e5af4mr9312456qtk.26.1680769231513;
        Thu, 06 Apr 2023 01:20:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z+DqTJW8TyaitShZCgfRRIb8x6MKj1p0XWxsmV86e0OD/haDQY/5/Vgj2Uk5oyUQapd7cQDA==
X-Received: by 2002:a05:622a:1310:b0:3bf:d71e:5af4 with SMTP id v16-20020a05622a131000b003bfd71e5af4mr9312432qtk.26.1680769231218;
        Thu, 06 Apr 2023 01:20:31 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a802:2599:3b52:5a:179c:6ae7])
        by smtp.gmail.com with ESMTPSA id 186-20020a3705c3000000b007456c75edbbsm292776qkf.129.2023.04.06.01.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:20:30 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/2] Deduplicating RISCV cmpxchg.h macros
Date: Thu,  6 Apr 2023 05:20:17 -0300
Message-Id: <20230406082018.70367-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_012040_739361_51455C37 
X-CRM114-Status: UNSURE (   8.22  )
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

Thanks!
Leo

Changes since RFCv3:
- Squashed the 6 original patches in 2: one for cmpxchg and one for xchg
https://lore.kernel.org/all/20230404163741.2762165-1-leobras@redhat.com/

Changes since RFCv2:
- Fixed  macros that depend on having a local variable with a magic name
- Previous cast to (long) is now only applied on 4-bytes cmpxchg
https://lore.kernel.org/all/20230321074249.2221674-1-leobras@redhat.com/

Changes since RFCv1:
- Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error
https://lore.kernel.org/all/20230318080059.1109286-1-leobras@redhat.com/

Leonardo Bras (2):
  riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
  riscv/cmpxchg: Deduplicate xchg() asm functions

 arch/riscv/include/asm/cmpxchg.h | 319 +++++++------------------------
 1 file changed, 67 insertions(+), 252 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
