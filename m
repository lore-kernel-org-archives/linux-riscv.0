Return-Path: <SRS0=6ibT=W7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37512C3A5A9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 21:25:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A33B2077B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 21:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmrYgfRo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fTLS4AC5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A33B2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seU5uQqqze3OYc0XFwCTmxjD3j1gyNCR28vWE+F5co0=; b=rmrYgfRoicdSjC
	vclNUUoBEQ/rAlZBqcusetjHHlweFUwW1saKo3f/8u/tHZUaznbRUBWuh9ER+tlMDXFvnRs8CgkjU
	sSuYP5s3Tr5WJfzn6wcU8+jFpfX2JPIIEx9UaEWhZVbwjqYwsSAl34h6mScpJ4M/e95zYsseCF2f/
	8qoPUz4fnI70EOpsQ/o3IKVPC3B2j343dRVY/gkEOqpDSSAkRVZrzImyZzgxLICw4/UsccQ6xhkEd
	lqgiNPvpr1TiP06X3Aeg0md2zNsvNjR/VVs9/9Zh7DIAZbik0Ytn3oz8GVwSBxpvLb0qiijtqtt7z
	PPAXQGome2Pia9q1tthw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5cm6-0002vE-SD; Wed, 04 Sep 2019 21:25:10 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5clv-0001mA-Ng
 for linux-riscv@lists.infradead.org; Wed, 04 Sep 2019 21:25:01 +0000
Received: by mail-io1-xd41.google.com with SMTP id r26so6260063ioh.8
 for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2019 14:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gpnxUOC87Hy/bQFTjChPoPUmVY9m9l5TllB0pP0NeVk=;
 b=fTLS4AC5Y3ATB96yfTaa7NNHIOTrZhvDflTG9Orv7lWVtnUCwEpcmP20IMPHHfbAo4
 8IZUu4m/TmyBzD4IkRERocaj62+YgKlCnp0UnS9rfQgWahlhEFwbtw+h7L7OoNv6+ap+
 RJudWwoFvJWcbxdoKoVd/Td0s4qFhYYQFo5RvC7qc4TKPMc3MftX/S71qdKw2PGFipAO
 nIux+yq5b0aZNpSAGSZID8kbRRvqRopQ2NLanjEh0XZx17D9feHuYXCD+G3JbySlMwSq
 wlTIM/KfezSMBzPmjTFMtfGCmlA465gjVqqLLGaudRkH6Z3C1ADjcKPc1Em1eTAFMHrl
 oBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=gpnxUOC87Hy/bQFTjChPoPUmVY9m9l5TllB0pP0NeVk=;
 b=VFLxyd+cFMBSNuwZniy2Lcn10ivmEQF8Il011fB9Kx7SMgsuTNVfQRKMoI7EOCRigZ
 ZdV6kcbZtjuwPwr50Irc+hnd9T0UJECq2u+3ap4T6fXoCuLJ1XFIdE665Ji9TR8TRoBg
 ygrfQgRjYtnMwuHdYO0F5cLeKcwiDPDfGy2lJNxS/BGpId0VruVtT0VcDMP6rbvKBaH5
 wxDtodJXDVXtx68cFvXXXcPMqjYDB2qKGvGRPE6Re6TBDaoBpZxZABCQmqrKDtqYjc3r
 cny2e4d+j7ZvSBOipRWfHHb9zZd85VrhcKSEktIMWq9ckaIcSHjxASKGt3ZQ6nwoSl3M
 qc8A==
X-Gm-Message-State: APjAAAXLoxwVYZpPtaVQOjrqLPRqGjzf8SeUiztUKX3/JzDHgdqy1fax
 gbFlq7Ofq3sm7L5fUuxIWpxtwA==
X-Google-Smtp-Source: APXvYqxjjM03c8YncfiKMgSDvfLe10vnXrh6O5z7tHl/a/2REfqzPMyznieZD1T0RCpHILA7wU/D0g==
X-Received: by 2002:a02:cad1:: with SMTP id f17mr333310jap.18.1567632299044;
 Wed, 04 Sep 2019 14:24:59 -0700 (PDT)
Received: from localhost (75-161-11-128.albq.qwest.net. [75.161.11.128])
 by smtp.gmail.com with ESMTPSA id r2sm66211ioh.61.2019.09.04.14.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 14:24:58 -0700 (PDT)
Date: Wed, 4 Sep 2019 14:24:57 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Mao Han <han_mao@c-sky.com>
Subject: Re: [PATCH V6 3/3] riscv: Add support for libdw
In-Reply-To: <4cba2dfb6b1ef0df01185c6bce78a0a2867d0a7d.1567060834.git.han_mao@c-sky.com>
Message-ID: <alpine.DEB.2.21.9999.1909041422220.13502@viisi.sifive.com>
References: <cover.1567060834.git.han_mao@c-sky.com>
 <4cba2dfb6b1ef0df01185c6bce78a0a2867d0a7d.1567060834.git.han_mao@c-sky.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_142459_788686_4720EF40 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Mao Han,

On Thu, 29 Aug 2019, Mao Han wrote:

> This patch add support for DWARF register mappings and libdw registers
> initialization, which is used by perf callchain analyzing when
> --call-graph=dwarf is given.

> diff --git a/tools/arch/riscv/include/uapi/asm/perf_regs.h b/tools/arch/riscv/include/uapi/asm/perf_regs.h
> new file mode 100644
> index 0000000..df1a581
> --- /dev/null
> +++ b/tools/arch/riscv/include/uapi/asm/perf_regs.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

As with 

https://lore.kernel.org/linux-riscv/CAJF2gTRXH_bx0rwsTZMTnX+umZfVTL_iVnewPtVM50sLaqJPTg@mail.gmail.com/T/#t

is it possible to change this license string to "GPL-2.0 WITH 
Linux-syscall-note" to match the other Linux architectures? 


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
