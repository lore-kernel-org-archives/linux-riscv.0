Return-Path: <SRS0=+XCi=PL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5155BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 21:07:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E8660D43
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 21:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64E8660D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t21u4l18LMnWpjfN7qgxE91Ksw4LVRpsF9RbswE0jBQ=; b=4dDaadHzld5M4Y
	58Op4wtEbnfsCU7KMYwhv5hlfI22Cxk8BpokwMhTxu36kb+orUWjLfGL+tytjsZ1zMz2QQQDEmk9Q
	Y1UGTf2lIzY5E8hXjciZl6kNb0YWhGLlwJWguROD71os9laGtp8Ppn9RmZr/s4gfKpkJ41529lEAf
	1kIJ8/xQJRfu9inmopHR4DJUC/NF45McaR5qaLf3fNQg3TCslNlu1mJoo9bgm+6i0DDnQRw/1JO9t
	FcY4Hj8apF77YMVfS/FPS3KGFxqThoSHceBMZTNXaqcXCylBr5LvPqrX2EfxXd+MinsmbILyU96uY
	JUcTDunHmsfWRCR+kWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meOEf-00DLeK-J9; Sat, 23 Oct 2021 21:07:25 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meOEd-00DLdd-GE
 for linux-riscv@lists.infradead.org; Sat, 23 Oct 2021 21:07:24 +0000
Received: by mail-qk1-x736.google.com with SMTP id d15so7930685qkj.10
 for <linux-riscv@lists.infradead.org>; Sat, 23 Oct 2021 14:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z5ck/UeEucZ2b2bRdxYTEyCija2HpQgnVIHtuWoPlEA=;
 b=Wp5eZvdjLKysteoESIng+SrPEwg9qMDqkaCGiBTO+bWsh9Yyhy9cNmf8GNmAGJrkLj
 zXer0lT35mQhlw2cqd88fQ5yIRTjqyXKyeYrshknwGErlcFOFEB7v4QFXiTc+VNFWtrB
 LrrZQfP+5jLFeL7Jgcw/yXI1A/C/qgRWIn0ftjOqGexTNy1oPfVlqAO3d71+g7n0DvsH
 d5b9UR2xdjVyR6kWuhR7rR7iXLvLOcaUghnurzMymIl6KP0i0BbI8AhtdOvYLJ6HEhd2
 dJkNd5PHYlnEo1hEn/fNpU6nMlcXz+5guXOf/IEZWV2nYm2HcljxMdjOFAve/DTC+LG1
 5eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z5ck/UeEucZ2b2bRdxYTEyCija2HpQgnVIHtuWoPlEA=;
 b=4Zgs6j9nXZJW/sTHP3rOmilxqXWqBLGCwoj5blDtbMBITF9kEVC32Pvpt6WtDgRA9a
 unszKeaFKMKV/eBtHLo7ZzzRv9ekX+RDIK8MHcZvzXjB47G+j45i5dKa3dm3OzEvz4p4
 28SulwPW6mo44p7wB0sqvBePW3/CEug5AuIxQhlfow+3H8sgt9tlz4vS0R8sI5z3yMmq
 5G2kerJnPKAtoEU3fjJlQMF1KDfETBSNv4YnVw/1ivwXpNAr5PSW2V8cDIWPIWKe5JQN
 B+5cCTXGt/tmTnFhqu9MFLst2Zz9MngW9+S9GA+BG1xHohWuQJZ7z+Z2FGsNM/dDGIy0
 JWmQ==
X-Gm-Message-State: AOAM530S5PnqUESqPs2shenkrf2TJw2tSRkepzR201whyqkZH9s4L8BP
 ZOX/wymLEr6OgtafcGtmw2Q=
X-Google-Smtp-Source: ABdhPJwIQmgo3/mVOU2a0uWWtY9cSrsEXQhJdt+TYqEGJAboFSjozNjAoq/jpY864wAjNwabPy5W1g==
X-Received: by 2002:a05:620a:31a2:: with SMTP id
 bi34mr6217466qkb.331.1635023239728; 
 Sat, 23 Oct 2021 14:07:19 -0700 (PDT)
Received: from dan-XPS-15-9570.lan
 (2603-6080-6a07-6dd1-9dc9-36c8-de30-e324.res6.spectrum.com.
 [2603:6080:6a07:6dd1:9dc9:36c8:de30:e324])
 by smtp.gmail.com with ESMTPSA id ay32sm6728275qkb.66.2021.10.23.14.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:07:19 -0700 (PDT)
From: hasheddan <georgedanielmangum@gmail.com>
To: 
Cc: hasheddan <georgedanielmangum@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: cacheinfo: fix typo of homogeneous
Date: Sat, 23 Oct 2021 17:07:14 -0400
Message-Id: <20211023210715.1713524-1-georgedanielmangum@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <750f6239-154d-9190-24ff-ece033add638@infread.org>
References: <750f6239-154d-9190-24ff-ece033add638@infread.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_140723_548327_5586625A 
X-CRM114-Status: GOOD (  12.14  )
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

Updates 'homonogenous' to 'homogeneous' in comment.

Signed-off-by: hasheddan <georgedanielmangum@gmail.com>
---
 arch/riscv/kernel/cacheinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 90deabfe63ea..f0c2043943bf 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -29,7 +29,7 @@ static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
 	/*
 	 * Using raw_smp_processor_id() elides a preemptability check, but this
 	 * is really indicative of a larger problem: the cacheinfo UABI assumes
-	 * that cores have a homonogenous view of the cache hierarchy.  That
+	 * that cores have a homogeneous view of the cache hierarchy.  That
 	 * happens to be the case for the current set of RISC-V systems, but
 	 * likely won't be true in general.  Since there's no way to provide
 	 * correct information for these systems via the current UABI we're
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
