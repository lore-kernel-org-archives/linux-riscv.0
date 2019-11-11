Return-Path: <SRS0=SgWD=ZD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6031C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 17:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CD5214E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 17:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fraICK2z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83CD5214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xQ483ju8mEuutfJ6R2FRy2fEp0m3yxEL+4uSOBOzeQ=; b=fraICK2zv/kI90
	JXtDHqBG5WR+Euf6z1LH9RnyIn4TLPCcsRUROFo3xH1a8SlOBVq0+sTlGdM9KorOeCJog5RRaGWz6
	tCB32dsm2pL7EAnLc7yk0rz9c50ec0O08HvA9cIeqTKS+zXTYumq2SL2P7KpaOBhfcvItPVLCFwqU
	dDwjKZf9aFMWWm55u+nbvAAfH0HB2zhIcHbKzLfc8mWnPnHNTENOAT8ugXmwa68rrqnTZFQaAfZiz
	BiGjY5ZTNqQmoUFkqw3+u7Qon5JU2RvWpdSoa3w6ByDpuOKUFxbfe0e13jF2OrWcxOH5O2Rbv8C+a
	iyFXGNi8MehN5o4N5HLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUD5e-0006zm-Jo; Mon, 11 Nov 2019 17:02:58 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUD5c-0006z5-Jg
 for linux-riscv@lists.infradead.org; Mon, 11 Nov 2019 17:02:57 +0000
Received: (qmail 30818 invoked by uid 1019); 11 Nov 2019 17:02:51 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 11 Nov 2019 17:02:51 -0000
Date: Mon, 11 Nov 2019 17:02:51 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: RISC-V nommu support v6
In-Reply-To: <20191111094729.GA11878@lst.de>
Message-ID: <alpine.DEB.2.21.999.1911111702030.30304@utopia.booyaka.com>
References: <20191028121043.22934-1-hch@lst.de>
 <alpine.DEB.2.21.9999.1910301311240.6452@viisi.sifive.com>
 <20191111094729.GA11878@lst.de>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_090256_722580_44333252 
X-CRM114-Status: UNSURE (   6.40  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

On Mon, 11 Nov 2019, Christoph Hellwig wrote:

> what is the status of this series?

At the moment I'm waiting for acks from other maintainers.  Could you 
please chase those down?  It's the responsibility of the developer to do 
that.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
