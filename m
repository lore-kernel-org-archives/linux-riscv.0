Return-Path: <SRS0=Z+hV=TZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E54C04AB0
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 25 May 2019 08:24:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 364AE2168B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 25 May 2019 08:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FS3qEm4e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 364AE2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiIx1BCRiMNiwFMC5OgZPXnnDsQcQcZtwfNZ2B+y+28=; b=FS3qEm4ediuuRY
	63NqEs0QVvWyxm96QowjEPz20EDYkqD2BTVxnr7IBRczKiSHOzlQ079fWHFz9Y39EYygJZI3EQzd9
	T2Qy1Sj8L+x48Oz0sj/vHkVpB8TZ6DAnwu1NUURVvVXbQF+4N6EjFuLTdzzRxL43KcDjz3B7VzD1L
	0rkznIa/S9ToOeLG9G/AkDIApqG3uHAcRJFrPgdRI0vvpfmQizgb9TUTg5yYxP6kL8gfvV6GEAJJX
	drHfdO/zjX4JIVZ9rpJqCCvq/BzjMvOixbhRkVK1gZdBnbCOiuU/RQQRkgzXKgitqYZQ6E/zGzKrU
	j0nnzZNOClDIv1VUiAQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hURyN-0001Ja-Fk; Sat, 25 May 2019 08:24:11 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hURyM-0001JH-PR; Sat, 25 May 2019 08:24:10 +0000
Date: Sat, 25 May 2019 01:24:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alan Mikhak <alan.mikhak@sifive.com>
Subject: Re: [PATCH v2] PCI: endpoint: Set endpoint controller pointer to null
Message-ID: <20190525082410.GC18854@infradead.org>
References: <1558647944-13816-1-git-send-email-alan.mikhak@sifive.com>
 <20190524063809.GA25866@infradead.org>
 <alpine.DEB.2.21.9999.1905241200070.31734@viisi.sifive.com>
 <CABEDWGzbg0tU8ZnEYSOrivhek82Emv3g3Y9X-jv6-svLypXbuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABEDWGzbg0tU8ZnEYSOrivhek82Emv3g3Y9X-jv6-svLypXbuw@mail.gmail.com>
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 24, 2019 at 12:05:24PM -0700, Alan Mikhak wrote:
> The get_maintainers.pl script also suggests linux-riscv mailing list.

For drivers/pci/endpoint stuff?  That kinda sounds like a bug, can you
paste the output here?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
