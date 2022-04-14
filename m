Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587F1C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 22:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fD1nQ5SMLD6CQ+hoKhM8sLPWcOpAJNVUxZYGNsMmHDs=; b=ig0y5K4EHXFeVs
	6OEvcOPG/AdtLE9nqnLdggDAURB+43LmcJN2fo30eXqfm7IsBdWc3ufFgeKUvexjYzfvnEvY1eLZ7
	5gihVkuvpqj/jS2vRWhM2okRT2AXbrUSzR1k90FkWFaDWog0WrX+iKuIysfBIWJNPFSeT8G67qd6x
	exy8GROz1xK6Zk4O8DrMANkvIfjnKQfLcTu+5WmayXwYWnbc5aFBdx5f4rmwLplbMB203hMcAIgvd
	XB27hqVUJh+rp79oNIHoR02dIP8wpiLYpNick5L4pdDETgD7hy677iL/sSioQglE/bmsMk4J/NPQ7
	INVDRFnOQMBgKKXsZp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7ah-007RJH-UZ; Thu, 14 Apr 2022 22:05:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7ab-007RCc-GW
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 22:05:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso6630604pjj.1
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 15:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=GsO1g7Ro+rsf0io9vopg1aQfP2P2g91oLlrkEyQDXiM=;
 b=CnWghtB/dN2XPpzq+zptNtM2MAL+NMPVHYsMQgwsTW7iLpCdsO92al51pP1s30INYy
 rwF44VxtoSsNlb8TLR6+PvivGyCZ5apI54By81gsXp8b4zJytpT14My0wRS1/XqlEqjn
 9c60+wgJ448Ym18jElwrZxwugKHQ2CLL8h38oEC7pO1P/00c1v34g1qQ6JgcV2POF6XJ
 qT35OQ8QyKY5rNXOS1abuXba/eh8yrBZrITli2mG/rjIegR5xxQLu6j+6zg8d/wJOC96
 t/JZMK7hUZ/uW4d5apxoZB276EgBxBgsh8TDMlVDZJzUdBERoLCAWxBKRYX15Cr0EDe1
 B80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=GsO1g7Ro+rsf0io9vopg1aQfP2P2g91oLlrkEyQDXiM=;
 b=7Tty7VfSYFH0hr0dLFu1xjnDzSUnfvOUid+xcDCJZsgn/h/+LeQa0N274HqRhCk2tI
 aGESmmYGqzcQtIwRTSLN2/5WnabkMZLmNextUz4i6IN3CuLkY3QjjEswEeMdM7ZvL7Te
 LPFXRH5huI/ii+nihxFs0ZewksKhpNIahh9I6UmLccsXB9eBgnaEsFJjgh6i91ksIIq1
 sXf0aw3KJckXFZb/7s0NG0LmIc7O+QOzlu2bpWTqMWMxXvnVx3ZI8wGdNZdBkCs7fIX8
 xUcj+cvc4oN9RDZ2kxTkirtlPmxYZYtE1nIfP4vODIM8hZ2D3r6ueKuOMxDTvTFXp21p
 OXgw==
X-Gm-Message-State: AOAM533Z1PvY14oETYfz5b43rtZBDH/syeibGW6+TLf4nm2gqeBz61aw
 F+RWNO3r0X7onIlLIPDed1dxAw==
X-Google-Smtp-Source: ABdhPJyLfdcVDkvOFuUrfAfCBiI+o5Yu4ll2mvpNoDdi2mqGNotIaUVXICITBKPJFNtsKr9Rm/qRqw==
X-Received: by 2002:a17:902:eb82:b0:158:8feb:86d6 with SMTP id
 q2-20020a170902eb8200b001588feb86d6mr13587063plg.26.1649973918225; 
 Thu, 14 Apr 2022 15:05:18 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 e10-20020a17090a630a00b001c685cfd9d1sm2715141pjj.20.2022.04.14.15.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:17 -0700 (PDT)
Subject: [PATCH v3 3/7] asm-generic: qrwlock: Document the spinlock fairness
 requirements
Date: Thu, 14 Apr 2022 15:02:10 -0700
Message-Id: <20220414220214.24556-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220414220214.24556-1-palmer@rivosinc.com>
References: <20220414220214.24556-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: peterz@infradead.org, mingo@redhat.com, Will Deacon <will@kernel.org>,
 longman@redhat.com, boqun.feng@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk,
 Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, wangkefeng.wang@huawei.com, jszhang@kernel.org,
 linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_150521_593261_EA506F41 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

I could only find the fairness requirements documented as the C code,
this calls them out in a comment just to be a bit more explicit.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/qrwlock.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/asm-generic/qrwlock.h b/include/asm-generic/qrwlock.h
index 7ae0ece07b4e..24ae09c1db9f 100644
--- a/include/asm-generic/qrwlock.h
+++ b/include/asm-generic/qrwlock.h
@@ -2,6 +2,10 @@
 /*
  * Queue read/write lock
  *
+ * These use generic atomic and locking routines, but depend on a fair spinlock
+ * implementation in order to be fair themselves.  The implementation in
+ * asm-generic/spinlock.h meets these requirements.
+ *
  * (C) Copyright 2013-2014 Hewlett-Packard Development Company, L.P.
  *
  * Authors: Waiman Long <waiman.long@hp.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
