Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D1BC46462
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A84D2087E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XassKJkN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DvV8fKDW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A84D2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ic3TI38+O5LQqcSrQ4HOjTTLFGumwmO2tNnOVgmi1l8=; b=XassKJkNRXDAOg
	N26sRvEhIV7E+rR9HnmcsCaAPgWAwZljP218eoAwWkEzq5iY+47ATU0ZlsC75QgucLfgZHqS7ssfr
	O47bRN9h6dt6O9V+lmAQlOcP8opMd2NGk9DsDAzD1DjhUEICzg3xdkl9fbHKWTawlg1/Nuw5vzvn9
	CgkGNWYp0vmCmlGUCfHeEU/1PgOF93wOQmAcxb7BpYierITZb6y4DygajY7Nj9R7jCdYmFSAZtfbs
	Lp4WW971pPluZBdXwYqMxyMk88sXPs3MP86+//vlII5PJxvN4CDMKdTc3A1W/V+W5sqi9dIQFG2Ii
	ebfZbv0B6HKGybM6aYvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP8Ug-0000Di-4P; Tue, 20 Nov 2018 16:03:18 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8Fx-0003nl-QN
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 15:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zUJyvGHdrBGCdz0J/8TKRqoWLiIZjzqyLTWxLvbE4wo=; b=DvV8fKDWKkKA0EfVSvX/FtjNE
 qxlBWiw2NE9rmx9/111+sgN1zbhAh7JPdJYFtxgA0E5cyzlj/JrWeD3z5RxgCUGYLAj2oC7Rc/vxw
 IFGlttEtHN+vzDcrKX+XNMezszzxefSg9v8lRFS228TU6N20zawQiXzT64gJHITLUMzYHlimSZCiA
 gNWqThcebX+T33vqUh73z+D1IY8amdpu3zp2nKaHYGXbRvmsy/UcAdFS5YGmxMZOrc/rQxPeTDcxd
 66svHHmGlMO0NYmIb82+sInhRFZ/b4QPEVrYSo0nymYrk5HYkjGmPhWvuNA9fNmvlT62LK29zNvjH
 jFPk540Ug==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP6aw-0008Lo-LJ
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 14:01:40 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7DB52B028;
 Tue, 20 Nov 2018 14:01:27 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH] net: phy: mscc: fix locking in vsc85xx_default_config
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <mvma7m3n9l6.fsf_-_@suse.de>
 <20181120135508.paxzs63cqy2llc7d@qschulz>
X-Yow: CHUBBY CHECKER owns my BUILDING!
Date: Tue, 20 Nov 2018 15:01:25 +0100
In-Reply-To: <20181120135508.paxzs63cqy2llc7d@qschulz> (Quentin Schulz's
 message of "Tue, 20 Nov 2018 14:55:08 +0100")
Message-ID: <mvm5zwrn8zu.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_090138_828139_85A2C3F2 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 allan.nielsen@microchip.com, thomas.petazzoni@bootlin.com,
 linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120140125.Nkb3UbV0Dh7gdtSq8kTqXEl3aYR26H99_E4yMyIYZMM@z>

On Nov 20 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:

> You also need to prefix your patch with [PATCH net-next] instead of only
> [PATCH]. This is specific to the net subsystem.

Why next?  This is a bug fix that needs to go in now, not next.

> Use scripts/get_maintainer.pl on your patch to get the people to put in
> Cc and in To.

The same people as the original patch the added the bug.  Why would it
be different now?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
