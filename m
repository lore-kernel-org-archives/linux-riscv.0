Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03A2C4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:44:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600382081B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nEAVg/EA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600382081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=JwpBEur3oZQXwK4eg62Rq0rOjUJgKY/97iE9mfrlLY0=; b=nEAVg/EA4uuxpiySx5kyqI6l1
	R2g3JSK1Eywx/N01sO8EiSFeVBlvGjiqhZhYG6TFHbabIqswMOZ9slq5wYDvrBdQfxJNzs5D5fDUS
	UtRm+ZLU33fRTyqjJoAdWqlLuVW6Iyf7LNwUbLs8hpj8Vlu/narWpcZV+JS7wpTc6uRWG5+2kNa99
	QwXTEelsxYSbziG9nyDEidYHM0MTfESWRqkXs9tIBOLEsLclnG9pfkKU/z47dniy5RLIfRZMcR6Cu
	GP8GSqANbDChL2Yjug/rHNeyBhoyGnn6pIc9mtUhOMyvZAi5qb6PZJrlN+A8qJfJjWgbQtx8+IsRd
	vj/jdGi4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8rUd-000889-R4; Fri, 13 Sep 2019 19:44:31 +0000
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8rUa-00087m-CB
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 19:44:29 +0000
Received: by mail-pg1-f195.google.com with SMTP id n190so15784547pgn.0
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 12:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JlOtIPMTes8RHM5kbah+KDXnetdqkHNr68CvxUUCQA4=;
 b=mkHDF16Ny+2tcAgVrcJN3UI2g8VRPUdGV6rgoZnzWw0Yj8QFAXUZmcsozOTQ3irFEn
 mHE8gSqPXdTG10zPFNzj89Gu85EMim7DBRgPAjyKkG+7mD+2+P/eEeb0L5LBYFpwpXhk
 wfwTwV9IlStIV46Xcu+Oab4IW4ty9ZUltnlgyFHaEmwTK95VI0id/xxaVLhbpeWpupF3
 1LehAUqBm5NiyeBbT/iXJZtyOwERsQe+iFeAtsHmsSz8dlfc3ltzRUjRwQTc3HCXg9qK
 FG5Ei859J0YyH+kkMBCkdcqomdpugzFl0AZz46Avv6H+lp+a9exOLOWTPJ9wst/3SKHd
 kPNQ==
X-Gm-Message-State: APjAAAXXSBJMHzLvpBUesMtHW1y97zK2B3swc0d5TP6LopEKBTT0AhS3
 SPLdao9Oyxde/d+wPgwuP0H8zw==
X-Google-Smtp-Source: APXvYqxXCvzJ784fr7JFesW0YMhNOcqBV4M/AdP4nKgp9CRYcnW5wApw5kXoI/vLgC/7XV1s9q/zyw==
X-Received: by 2002:a17:90b:f02:: with SMTP id
 br2mr7038777pjb.67.1568403865150; 
 Fri, 13 Sep 2019 12:44:25 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id h18sm2735383pjt.18.2019.09.13.12.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 12:44:24 -0700 (PDT)
Date: Fri, 13 Sep 2019 12:44:24 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Sep 2019 12:38:21 PDT (-0700)
Subject: Re: [PATCH 8/8] riscv: ignore the SYS_RISCV_FLUSH_ICACHE_LOCAL flag
In-Reply-To: <20190906170725.GA13047@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-649c0b2f-ca6a-4ebf-8c19-a09a2c100207@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_124428_417197_3097E6DF 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 06 Sep 2019 10:07:25 PDT (-0700), Christoph Hellwig wrote:
> On Tue, Sep 03, 2019 at 11:46:33AM -0700, Palmer Dabbelt wrote:
>> This is used by userspace as a thread-local icache barrier: there's an
>> immediate fence on the current hart, and one will be executed before that
>> thread makes it to userspace on another hart.  As far as I can tell this is
>> implemented correctly but not optimally: there's always a fence, but we
>> emit an unnecessary fence when a different thread in the same context is
>> scheduled on a different hart.
>>
>> I suppose maybe we should attach the local fence mask to a task_struct
>> instead of an mm_struct, which would trade off an extra load in the
>> scheduler (to check both places) or more fences in the global case (on
>> every thread getting scheduled) for fewer fences in the local case.  I feel
>> like it's not really worth worrying about this for now.
>>
>> The construct seems reasonable to me.
>
> I haven't been able to poke holes into that idea yet, but I'll try
> a bit more once I find a little time.

OK, well, LMK if you find anything -- it's in the user ABI, which is a bad 
place to have something fundamentally broken :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
