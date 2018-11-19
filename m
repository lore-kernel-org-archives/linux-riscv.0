Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026B3C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9A552086A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUHREBwe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F1/x5K6K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9A552086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isYiXHNmMSE8w0SU9XS/gDPliIOWcJ0rwn2JP6X+Ekk=; b=KUHREBweIe5ecC
	p0m5knbTu5hnrv3BYcZAPJis3ULloE4xudzTbDBuRculoQpXCoCNHbv/mLQXIOs19CFGMAThzVquK
	3pVPlH+5hihZxGuQphlUxk0o1J7DF+nKRthXDeNomj3wfrpPStdHDVhI2lmI8MuviOH2x9OPjlRIM
	Z/xsMVshOaMcNbv67ns5i4ygr6yyJ3QESBVeIeTDaS+QatzWV6slMXzmaNVGMEpo7uABb4JFJTzBd
	GbnuMIdFxm7IXa36XWszbbAN+0jaIDW4FcvoG5mRjbimWOBOso38JfU6GpoMuHGPYzrJOygTHkpGi
	fga7tufnjzhlkbZwD6lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOmTO-0006aV-OE; Mon, 19 Nov 2018 16:32:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOmTN-0006a2-LA
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 16:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZOVKmTfT75Po5jddjKvR7IazFepDEFcg0lQIsEOtYMo=; b=F1/x5K6K8LWDsd/3tCqD53CkZ
 5mwfpf6WAfPInCFnYKU5DC0QVjHmglgBH6HfS+MnbAOzGNxP2LjmIlo8rxEO5OOk8JX+qZaqysFyx
 kT3SdKc/H0F6QZJiwkb7z8qrI3PhJkSmFMDqb/N18sbXMC6SCsyoJ4EhHPGYUnZNx1qxO88KM1HMV
 wTtzW1fWEqyD9mLaZ1RWKkyt4NNgyIIAZF1Epb9LMClHa4loImrdFIemhZhipRRWeFiECwu2vV+Wm
 O9uymZfPrBGDEMlAracek43Ly0iwtFhJaZomY4GnHHTFzRpd4ibZlQ9eAmuuhKBnXcPCLiFdh0fZQ
 3s/jaeGqw==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOmTK-0000v8-PR
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 16:32:28 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 93CB1AF71;
 Mon, 19 Nov 2018 16:32:15 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
 <20181119161204.GC2393@lunn.ch> <mvmva4t9h8x.fsf@suse.de>
 <20181119162529.GA31955@lunn.ch>
X-Yow: I know how to get the hostesses released!  Give them their own
 television series!
Date: Mon, 19 Nov 2018 17:32:14 +0100
In-Reply-To: <20181119162529.GA31955@lunn.ch> (Andrew Lunn's message of "Mon, 
 19 Nov 2018 17:25:29 +0100")
Message-ID: <mvmo9al9gfl.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_163226_838385_6A471749 
X-CRM114-Status: UNSURE (   5.77  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, f.fainelli@gmail.com,
 Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, allan.nielsen@microchip.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119163214.DHoRx51hIzhO9Kkis9N6MYUTesDEhXGn0UDyl_JNWFE@z>

On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:

> Lock debugging: prove locking correctness

404

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
