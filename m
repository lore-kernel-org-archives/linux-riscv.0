Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9ECC43461
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 14:40:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E165F613C3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 14:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E165F613C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LeJp+kQj5gpltrx5/n7vgpVMS0dMhKAZJrvps3TJMR4=; b=k9vk995hNx9VNToM3eSq7IG8x
	oBLMmaQwuF88bIDru2D9fL5cr6TXySajC0gf1PTCYTt12IZljv4eAAtz5HFAEyKosY33YL9L/7BaV
	ALwpjuZn1zuhIcqJnLqzt4xZF1KJXqGYjj6+1b3wiwDYhfAiy3hLbrU/wUOFxYnnDvUQL417hdIkF
	yX22haXtPZDXpo8gjRPE5IQc+XQ1P4MJ2jTMuPhyFM6lQBd7iZpVsUJbRElU+JVunhRfAk5yMrlEL
	7qtY7B1+V7EHz/4mYxELiSIs6owrPCKeGcp2GnN7dTV1D7KlJ8l6fuXgYP+MdpEHkBROJH3kVUbEN
	wiKqXlMbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYrXJ-00CMxa-KG; Tue, 20 Apr 2021 14:39:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrX9-00CMwZ-BI
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 14:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JdFnlCKsPAkRgtWeQVKwem1FA1yZRVTt5cXvtYatp2Y=; b=gsSKE/y4OtsBGW0P+XDa6g5Ykj
 IXgIWd5IQmkJC4SIOTiLkPZ7CPRcONM+B4Ml7M+jjLVIM8/keo7CZCFoH9NpkQ8pHEM8/NMCPQKKm
 fMljFdwE/liyCFkZx/p7RYvXK9fMY4QUOlpPkg5w0HiAmeHcB3d3cPlIA1w36VQ4ZvGfRmqvNWlsZ
 5dKha4TjqnWLTmxXtvAYyQVFfiz6e7a9tzNQsEsMXuj7DXTx+QIZ5iuhT2NXNVqea2zAHusrVzMSi
 y4+s3BirRckeNm3u0ptiBAhEQibKjHoipYyOISezT4MhPGqBh7FvXS9A+5GGh+2YUbTgLmLodJfdP
 qwKllvTQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lYrWA-00FH6e-Om; Tue, 20 Apr 2021 14:38:48 +0000
Date: Tue, 20 Apr 2021 15:38:22 +0100
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 1/3] nds32: Cleanup deprecated function strlen_user
Message-ID: <20210420143822.GA3640266@infradead.org>
References: <1618925829-90071-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618925829-90071-1-git-send-email-guoren@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Can you also clean up the reference to strlen_user in the comments
in the ia64 and mips code, please?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
