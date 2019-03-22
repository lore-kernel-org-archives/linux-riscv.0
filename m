Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330BAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0319621874
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6l32P0q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0319621874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKnPFlKV9ni1gXrqbIys/Lwum8qfOVQrgXNQOBioFHc=; b=c6l32P0qIh9VFv
	b7lomDYWAD5Btal0GZBQiGDwEf5turWcoWMLGb0aghsdqktNZX69F5o6OA3yAgq0x9atgSeon6MZw
	ageYfsi2TaISgFbYyvD1PlSYVW7a5ZWdmJ3FjmmT0zPIXVBZzUWwi+zNEc73c/JdWO2XNdzniB+s4
	KudFUKZH/ylPRh8pPzVyoPcQWkVjPYk7X1Jh4vfWGc2t9WthlsG21g+e/LL6rWG/uJxA0KB7z230R
	O2XGzSewvH6IqrERVOSzpok+fzfXuB8Ift4L2D486Un+2YnjVny1PlW53TfuyfDolKVOw28RS2YsG
	A5NPq4mwrXBcrvxHDuTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KJ9-0002uN-TL; Fri, 22 Mar 2019 13:34:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7KJ8-0002uD-Rk; Fri, 22 Mar 2019 13:34:02 +0000
Date: Fri, 22 Mar 2019 06:34:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alan Kao <alankao@andestech.com>
Subject: Re: [PATCH] riscv: fix accessing 8-byte variable from RV32
Message-ID: <20190322133402.GC32464@infradead.org>
References: <1553236624-31275-1-git-send-email-alankao@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1553236624-31275-1-git-send-email-alankao@andestech.com>
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
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 Vincent Chen <deanbo422@gmail.com>, linux-kernel@vger.kernel.org,
 Greentime Hu <greentime@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
