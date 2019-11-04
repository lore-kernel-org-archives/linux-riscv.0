Return-Path: <SRS0=KpWC=Y4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26DFCA9ED3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2019 12:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8C95218BA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2019 12:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iRLNzfEa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="eX9YNLda"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8C95218BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yrtU+sR9oEf4ESRzdpcppuSUdxMzT9Xm6Z3ppYF5g7w=; b=iRLNzfEaPUNwsqlL5a1WOkQPR
	tEQ8fx5akdLH4VlbOIEpzTM1XK2R7ljyWzJVfEkTlntOxhx+oeBeuMkQngGQ9vk/aXrt43T8LwcMo
	Ll8F2yPfK/4Ke/+inGqpqptZN3739BecuGMQAPi3vSQnppL4/dBuTw+K6Y+2fpPPqlHju0EMKug99
	7EojD1r8goJbFNllaHBXmFmdruE59IY8xjxrmdQE/e4btPaj4vqLzjaRMNmErf0D6nebPsSBCBvWe
	8KyZATkMNWwdezVVGWuaf1W7Dh+xxt2FaTclaK1OoY3UkXhAkn+EG31cgBM5ci9+ZSYYk/27SJqwK
	55fmMRYFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRblV-0002m9-Ol; Mon, 04 Nov 2019 12:47:25 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRblT-0002lf-S6
 for linux-riscv@lists.infradead.org; Mon, 04 Nov 2019 12:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nQW/bkzEewczaxT+3uYr2EI926apxCfUzfvK6W9flNM=; b=eX9YNLdaHWXApFC5WH3YUJSoz
 duye5V5aJxyEa0X2sRrWdWgQsDTo4uhgIwg2UK8SaMVGp11RGSodOlIl07eRtejb2BzATT5SOEPtv
 lq9Hkne174NX0ErvZCPnbeJU5n9yGScoQnxfQfhkJYoxb2ct+DWNG8cLD4lKkgleLNPE4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRblP-0002Yo-Ij; Mon, 04 Nov 2019 12:47:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F2AE1274301E; Mon,  4 Nov 2019 12:47:18 +0000 (GMT)
Date: Mon, 4 Nov 2019 12:47:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] spi: sifive: disable clk when probe fails and remove
Message-ID: <20191104124718.GC5238@sirena.co.uk>
References: <20191101121745.13413-1-hslester96@gmail.com>
 <mhng-3be3dc4e-15f2-4ad2-b156-ea5439e729bd@palmer-si-x1c4>
MIME-Version: 1.0
In-Reply-To: <mhng-3be3dc4e-15f2-4ad2-b156-ea5439e729bd@palmer-si-x1c4>
X-Cookie: This page intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_044723_912167_9E6ECFA1 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
 hslester96@gmail.com, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: multipart/mixed; boundary="===============8594731582315024771=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8594731582315024771==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2019 at 04:07:29PM -0700, Palmer Dabbelt wrote:
> On Fri, 01 Nov 2019 05:17:45 PDT (-0700), hslester96@gmail.com wrote:
> > The driver forgets to disable and unprepare clk when probe fails and
> > remove.
> > Add the calls to fix the problem.

> Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3AHdYACgkQJNaLcl1U
h9Bxbwf+PS/3tt1r3nRdDUeTgiw12asFTlFdosGPaCdJ0zCp0XBMPgFZBia9R16z
QBrOHOQ5BL+W7FEEOh9hfPpvdVPzgygwAip2n2uHEWrOZ7pt7PWoGj2ybu0JDXTu
rPhwWNvY36hCVKElOiixQeR43pU7yKJZzPoWVTxJgGarWaE03ngE0jEvQUqtsVMB
aI0LNK076Dt9geC7wg5FFSppQTVv6c9PvpTehaS5hKvY00hfUS3i9uFgYsXjuggz
TYsKknIrHD0gm0Q1bCfGK7u6C3YkbyPs6uj1j2xZLh5isMgVokBkrlpkbpMtKl+i
PPxqmUKox9ymgSDfmnZ1yGneuS3qVg==
=2j2y
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--


--===============8594731582315024771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8594731582315024771==--

