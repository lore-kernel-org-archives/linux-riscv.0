Return-Path: <SRS0=aW5S=TO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB9AC04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 14 May 2019 13:01:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF199208CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 14 May 2019 13:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="su4PRBIH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KR2ftx3L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF199208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyLIlMGSrohMabB4FBl5S1YgEXOets/lSj++gMBgw1s=; b=su4PRBIHgO1qaS
	eDwHongxatCPW8AeqZS/DupC5DYtHj1FbJJaTvr4Yg2y57u2jhZ/SSpwK4YgvpwHtqKXQZL0+Ajbn
	vf/qBX/JWDWZITsqdy74lx7Qrw3nNBGiZ0nghB/7GUleDNboW0f0ieXvUhCbKFbEcVhwX7Aa13H4h
	Io4ZvDqhoZsFQFYQFub2JGzUPlkZANoAZxoTw7PGYHlbJh6aqWDlbniCJ93t032yy9iOkKHPCM/5a
	EeQDGF2M1KkAiiRu3NqWJh1eApUXFhpcP0GW91yFkhGCLUCMPoFQ55y3BsYKKNwnw85lHjlrZqgAG
	6zgquAixK2qWsznGTkQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQX3e-0003lR-0v; Tue, 14 May 2019 13:01:26 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQX3a-0003l2-HG
 for linux-riscv@lists.infradead.org; Tue, 14 May 2019 13:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0kFdElstit5HS2EU/3V72XmqkmzHX/hLJaDRJlo92tE=; b=KR2ftx3Legw5rt2nBzRBv3At7m
 c6sBkIA+LG5oK99YSWNQ72RddWtfX4emfxqhnEN2D+AeATdWtPL7NeWmnWFp4Sx/rAFyeXfUaVuEY
 hOikx6j5xLKLnzO48LCjDTXBNX0pbnEUqrlcCp9bwbS9gMd6kF4hwSBn2UyjZxQW3CBg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hQX3R-0002SK-P9; Tue, 14 May 2019 15:01:13 +0200
Date: Tue, 14 May 2019 15:01:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 v2 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
Message-ID: <20190514130113.GB5892@lunn.ch>
References: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
 <1557242108-13580-2-git-send-email-sagar.kadam@sifive.com>
 <20190513205615.GA5844@bogus>
 <CAARK3HkTCGWg4CAo1LmQHmf4_NFukjTwO1LAHjgSTS+R_5CRSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAARK3HkTCGWg4CAo1LmQHmf4_NFukjTwO1LAHjgSTS+R_5CRSg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_060122_725015_17233DE7 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>, peter@korsgaard.com,
 devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> > > +     */
> > > +     i2c@10030000 {
> > > +                     compatible = "sifive,i2c0","sifive,fu540-c000-i2c";
> > > +                     reg = <0x0 0x10030000 0x0 0x1000>;
> > > +                     reg-names = "i2c-control";
> >
> > Not doucmented.
> In v1, I had added a new binding file as sifive-i2c-ocores.txt for
> SiFive i2c core.
> After Andrew's suggestion,  extending the available i2c-ocores.txt
> seemed to be a better idea rather than adding a new file.
> so added an example node which is HiFive specific in the existing file.
> Please let me know if I need to handle this in a different way.

Hi Sagar

Is reg-names actually needed?

   Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
