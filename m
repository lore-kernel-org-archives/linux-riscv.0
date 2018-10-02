Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EDDC64EB5
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:47:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1944D2082A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:47:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cVN42Ovt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1944D2082A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKnPFlKV9ni1gXrqbIys/Lwum8qfOVQrgXNQOBioFHc=; b=cVN42OvtJAbDYS
	7UP0vipRwH3Ay5wLiSjj3e6Ytv8Djgq81d1ALwQNEndwstEwxaKqA/tkK+US2w98H1VCDScAMV4vB
	m5zLaIdul0jJAQx7zM7jjBTTklNjCxqY8WbvVky8Vvx1vWcebHi2cXvMjl36LTxUZTxjWsRBmsawD
	Qg79uyoVf2Lx02YGxOebmAyn7k52XDSZZ0XkOhSvw4UAB6KL5NhXRwXmdhaj1Xj5ylnN2CqkNFVT4
	3ebwqCI85P7YqhrjKdktwcYtuVC5oF+7rzF/GSU8HR8Si8z6dusRfM7+Zm29Oi8mEqhb3925eQwu1
	hnwbPXA5Esvk/J9K5B9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7LxK-00012b-Ts; Tue, 02 Oct 2018 14:47:22 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g7LxH-00011z-Rv; Tue, 02 Oct 2018 14:47:19 +0000
Date: Tue, 2 Oct 2018 07:47:19 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zong Li <zongbox@gmail.com>
Subject: Re: [PATCH v3 1/5] RISC-V: Build tishift only on 64-bit
Message-ID: <20181002144719.GA3889@infradead.org>
References: <cover.1538470103.git.zongbox@gmail.com>
 <40c77db9ee2d23479ff90f2658539d29d7a30896.1538470103.git.zongbox@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40c77db9ee2d23479ff90f2658539d29d7a30896.1538470103.git.zongbox@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002144719.LQxI7g1LwCU00npm9axtHAnC-yksl9tR0GKnvj6jwTc@z>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
