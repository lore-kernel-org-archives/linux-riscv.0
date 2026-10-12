Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D238CA9ED2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CTl7uSy6BJMiskSty7nOiUBy1G6iu9X8vxVm+0Q8GOA=; b=h7PHpTHi1v9NzP195jq6OqFNpj
	E5/YT5nMnGZ22JcKkI42NBWoqxsIzsCM1PrBWZIXVfKiUDHp1vkCXeF+TnIQJ6ehQXzibWMVpOYoX
	wL/sye2sg7C0r1714USyS0gjHr7O6dh36//SXvaclEc9AItWuJy82L8ON4HPATqstLYQlqN7N/Zqw
	bEf1EpgorW34Z7ijWJovw2qa9cM1u03aA26CrZWsMckNNKy150qjXi5h3gJ5xXXY1bcL1XGV5/UQ2
	+fpk8w2RkK+GWvCi8GXc3FEZaZlx2s4i11BZYF6zo5Fh62F3mle1wg5IKXuEesiU0y6qAYsflJjT6
	3AViCyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB7l-00000009uET-2mgh;
	Mon, 12 Oct 2026 08:11:11 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB7g-00000009uDq-0wSM
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 08:11:08 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 65CAA1400065
	for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 04:11:02 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 12 Oct 2026 04:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791792660;
	 x=1791879060; bh=5aq75OFK0387x6ZUPnC3HDU/yaLDvZPP7XIC7MCXsFo=; b=
	Cpci7Am6aupOAC7KNHk/6U4mtd6jyTgB2RTTBKtBHVzj7t9tvaL3t3ntPPdoHR+d
	RH5Tk5JDSdbbxbst7VT4wxpHbNoTbmq42IDe3FWYfaLUkpsA9k7lH0tGS/LBEcB8
	6BqDZbs0Vq22WqB4065rzILJUEy54TDBHMh67LnVVLX+Zp09+vlPAVMZEI+mlKS2
	LRgskzdyFb5u+O17QM5U7ZqOjuOyWOEAUcAdunEyFYT6UC/VZSXzpI1WzB7x+vIP
	ld8nkdYycsDCTFckAKMLgp5XUFNrccD5cVBvqj0Pq/MJ/7lctJfkwyMJi1Q0Ui6d
	bBXf9F3cyKOObHjOi/NABg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791792660; x=
	1791879060; bh=5aq75OFK0387x6ZUPnC3HDU/yaLDvZPP7XIC7MCXsFo=; b=T
	qumM0GZ5CUgtsCAPDjZtmWdsyd4vGyJkXJPbaWcnmnqlknWEhFb7Le/hsexacHO5
	ldsxcT2vXNvvUU6rztfWOWdPCRVGKJGDxJT/eaYwDdrw/ScqsGJIasNUJzukbr2e
	V1ilT0eQUIntFP8IAapt27JJ81fcG6UOOJ3+q4WaqHhGt0EvqHxhpqKjkwsCc3/D
	JmZRKkK1r/XhSflvHYNBrpwmWYpueDpoxOfKMEM50T44SisnFZGLkM8tQN01BwSq
	XEWv3oGrXCuwfZqwV6G9ubwLdOOwzIaaJaHRhMnXslGUUKW4bAxRb1AnweJKuhjc
	ljNWXqeQvAAJYRRqHQ6hg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791792660; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm1:rsa-sha256:j+slVIzTKQXLlZXsY/f2zhE1OJoaHJUVEFOy8rKGeu8lcbZ
	tWJQCnCrkT89yVwhB+Abc4SDrS5if7QrbEhSPLE6Tlg5HqM6I70vGfSwknOwfJxv
	1QH5rtCJKtBqRmJaZ6CZu15mLOqyV1VP+pzg7X6ZiWkTyN5jDloJ/to7mpRfaOzG
	TCTDjRPs2/IZsmpLPkpEsf1ThlOzTaGTIz7IjydwX4oLmfeWJO0r5NGvwzPe+P61
	EVT5i6Cl7TNV4UhSSOuRPz8OVDB4GWXLYUS8bP4dooTP+xAGst236tTl45Qk4RsR
	mVU3y+RfVowqp3q8xDDCOdM6j1Z8jQk+0QFdD8A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:NgztxYTDSFREAbLoozt7GOiDsimSw9ll82hcXQSz/kQ=:NbQINEYg4X2aBXVzQtuxuZ5+NbLkeCPA4jqxulrmCUA=;
X-ME-Sender: <xms:EpbMatRxOgPbMhENZbzMxNObGYTIB3x5fL0JkJ_EGKZ5CkPIkyw3_w>
    <xme:EpbMahnDJYWxghF8WYk46oPXY19aVBorWnL1d865AQ6KYjLbMyk1j3mf_hZFaSHZu
    hdgMH1oY3anJQcR03FHTZ1CqFanwmOTEkG8abT5Y9PZnMWpyvccQOFx>
X-ME-Proxy-Cause: dmFkZTFZk1jxtNGkhkS/W6SrTSVR+8obP8kQjIPqf8ee8n2yaDvYNhdQP0D49cV22oby7Q
    +pzGSoVXH44kcGP/0qKwr04oVA7ITe5TuVcjBh9KDyz6go3nz11FwHSB+AVPJapyQzYTHv
    U1xRQUiUSAfccCKivEYKfX0xcHg7g6lLjJQGYzVZR3HFVvsLbOv8sGgpgVQGBjshJQzECF
    9hkAjO/IV6xqThb6lZLvWXzquFNbmMvVKKHd0Ir6K5KYtwfIashiLbOkvr0LgWXPkS1tI9
    M4rUX7/B3+T9aZ/jdsRG/AgsrakNwF1mT/dLh21ePiEbSTycEqLAvjERpq25jo+VCunZA6
    TVovKl6vUGh8dngR/Bhqs+Z/HgdGnd2Kt2rMMU6llP4zwzTTJrsCClVt5tPeqd36PIL/HK
    fbxtkDK6Ku7lilFyHL5RLDmmXHkfXR0YBYD5lW2siU8GaFb/U73myJ3sMIe2EF/wn2gpd2
    tiN+hkvH0v8mYU+zApitEDRDifMFbCuvrt7PRXMS80mxD1eM2WCukPSFo9Y5DpC+jq7aQr
    Z0dpxUThMUvjwLUPcY2oY+xXTlUPQTyodE/Dtd33f4cT/tEOjY0vG7QrjsyZhCRcUz68pa
    he/+qKiybI1tV+4kaBZde4uwXROPGugSvK/2egIlAfGE7CoAi2kyaRfxY2/Q
X-ME-Proxy: <xmx:EpbMak59f1J7JXAZ-2LKGe1Xr14Qjb8JjQJVo_b8cl0nDxPnNqmz5A>
    <xmx:EpbMahW8WiGqWIfKLtOXO6319pIiSqPUd3BlVm9Qu1MYa1E7nmlVAA>
    <xmx:EpbMam8G5Nn5K9FfsbcR0dpDiDpdDGydbkEoraIfam1jPuDziUQOVA>
    <xmx:EpbMatldX-9UeQgj3ITft2ErhgXflGyo_ZlxCr1Eon4-nZRA8iedvA>
    <xmx:FJbMagCeAYABTVIFt3un4X0CZpAN8CJPChKgjTNLZ_GMEKPlEb-Y65ps>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E5CEC32A008E; Mon, 12 Oct 2026 04:10:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArRnSDGvrQUJ
Date: Mon, 12 Oct 2026 10:10:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, soc@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <ab03d380-f49d-4eaf-9e8a-e8b09d1d0195@app.fastmail.com>
In-Reply-To: <20260925-parlor-snowfield-6ca46312a610@spud>
References: <20260925-parlor-snowfield-6ca46312a610@spud>
Subject: Re: [GIT PULL] RISC-V devicetrees fixes for v7.3-rc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_011107_223397_FC4D1A65 
X-CRM114-Status: UNSURE (   6.89  )
X-CRM114-Notice: Please train this message.
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

On Fri, Sep 25, 2026, at 18:56, Conor Dooley wrote:
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux 
> tags/riscv-dt-fixes-for-v7.3-rc
>

Hi Conor,

I replaced this with the corresponding https://git.kernel.org/ URL
in order to pull it, otherwise I get

$ b4 pr 20260925-parlor-snowfield-6ca46312a610@spud
Looking up 20260925-parlor-snowfield-6ca46312a610@spud
Looking at: [GIT PULL] RISC-V devicetrees fixes for v7.3-rc
git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux uses unsupported protocol
ERROR: Could not find pull request info in 20260925-parlor-snowfield-6ca46312a610@spud

Can you change your 'insteadOf' setting to send this as a URL accepted
by b4 in the future? I think an ssh://git@gitolite.kernel.org/ URL would
work fine, but most people use https://git.kernel.org/

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
