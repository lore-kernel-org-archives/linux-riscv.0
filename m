Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B904C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 08:12:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37792086D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 08:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rc3tPQo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37792086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeClIs2fTPMkLa+phcUVhIDYgSAy3IaYvGBxl/rbN74=; b=rc3tPQo+3dtn3N
	jjfqi23MoGSLwVacAx4Y5ynq9glhDSvlgQy3SKO/LI7mKXjT99zDWoh9G/1BIC4NuJFE0ijDHgy3g
	40I/NrO04LP8AzdEvaEoYq6FcPhfpd2BpNXpAV9yiH2FEXUTlRdpYfjq6uaQdjOkxywb6smOZ4fi6
	5KJs1ocJh+Nf3D4gSv0Jv6+9qT3YXP8ZpH9ZbR0ER+r5JougAOKlMs14VNmrSZt6XBXkVX4s7Kj7B
	Lj4jpSSpoAe+6BTyhmDzV5p5eiv9LHeVUDoy4WYayoI4WHgLBMcOoUow3ktqr6sn22Uf9L5LxrsOe
	tzHbc1IxzitV69aBl19Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1habsv-0002kH-07; Tue, 11 Jun 2019 08:12:01 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1habse-0002Yx-U1; Tue, 11 Jun 2019 08:11:46 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id A40C568B02; Tue, 11 Jun 2019 10:11:17 +0200 (CEST)
Date: Tue, 11 Jun 2019 10:11:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: binfmt_flat cleanups and RISC-V support
Message-ID: <20190611081117.GA22110@lst.de>
References: <20190610212015.9157-1-hch@lst.de>
 <4f000219-4baf-b03e-9003-26482640d3de@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f000219-4baf-b03e-9003-26482640d3de@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_011145_121472_9D1969F6 
X-CRM114-Status: UNSURE (   6.65  )
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 11, 2019 at 09:05:45AM +0100, Vladimir Murzin wrote:
> I'm wondering if you have a branch with these changes so I can give
> it a try on ARM NOMMU platforms?


    git://git.infradead.org/users/hch/riscv.git riscv-flat

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
