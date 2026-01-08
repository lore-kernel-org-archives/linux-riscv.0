Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAEDD185CC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xn3n+Wj42LTUNLE6dWaKteWF9tX6c8OsxVJ+2cXDSD0=; b=kOX+RXd5YPU7ye
	CNHYrUzjWGni0+IVB/JzmfXkeVOyxB7fDBqTcjc0iHUjwgWeMRkmzOtsmbQ1a+qlFb01s8d2TRMbf
	J1LU+ILQwygE8WFwdOq7haO0EvXbfd65+mfeBOQdmio4SQKp75l6N0jUf3UqQ5wqkUN7ZIWNziPlp
	rm9meba7cTnOKxZK7jVldPdLq7k+QZkMd8atBLkCWU70y4s3dTlAjtZqkX2Q0qS/Hfww0cgW7rYLi
	/OUFB/d/Nr/0drXgx1R5sOIpvePP6KR0sEfiYpq2psKo8zeyaf7Ut+kmxFctSEMJDDjWAM26oq9gl
	S3cn0I+aWq5ePUvzpMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnro-0000000GnRA-2dar;
	Thu, 08 Jan 2026 11:07:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnrl-0000000GnQL-3An4
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 11:07:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrY-0006JF-Tu; Thu, 08 Jan 2026 12:07:32 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrY-009fT8-27;
	Thu, 08 Jan 2026 12:07:32 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrY-000000005W0-2NQQ;
	Thu, 08 Jan 2026 12:07:32 +0100
Message-ID: <00ad0d7f5eebd96717d37be19944bdd2e7d77eef.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Alex Elder <elder@riscstar.com>, Guodong Xu
 <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,  Yao Zi
 <me@ziyao.cc>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Date: Thu, 08 Jan 2026 12:07:32 +0100
In-Reply-To: <20260103220005-GYA2070627@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
	 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
	 <aUYMjAi8YIqValwb@pie> <20251220025926-GYA1962618@gentoo.org>
	 <20251224114848-GYA1993014@gentoo.org>
	 <20260103220005-GYA2070627@gentoo.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_030745_792191_DBEB8027 
X-CRM114-Status: UNSURE (   5.12  )
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

On So, 2026-01-04 at 06:00 +0800, Yixun Lan wrote:
> Hi Philipp Zabel,
> 
>  I still need your opinion in order to know which direction I should
> go..

I say merge via clock tree. I'll comment on v3.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
