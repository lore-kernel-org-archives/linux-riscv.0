Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373CACAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 05:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieO8AvZaSLjjJpFEOsIs5gs+Q39iH789KgfAHtC528k=; b=B1KyS2+axW4a2y
	Q8yMQdUZnMMlC1McNcZMbpUhStFkWjqPNmGgKYm/qhe54bZohjMbbJojEcdybkDfMdZWSPQFGdRzq
	Ah2c84rs7ZKg2jmQFJnYba2RLQB+RNEPAGr4eYSjnSLxInmSMtEi5G8s8UVeFGJyUzDdRGTV7OtzL
	nKPxCPRcRs0/fN0gHfJQiCVfpZ9i49aKlDZUeymCFM2VKd3YbeLIvf4Kh2CZ49h3aA92x5vSxmkBr
	iQ6DaYGbdBOQAtaImCruVi8pr7LPm9MoiZOt8bm/xpTWFHtWfeyMcs6IFM1mKGm1ObioiihMiMJhf
	3ULWBqS6A9TRqA/Ymoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2jhf-0000000DwDn-2z9Y;
	Sun, 28 Sep 2025 05:12:07 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2jhc-0000000Dw9Q-0Y9m
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 05:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759036243;
	bh=EyKXkmVhd4Wq/fftgbLmz5/5UTp8yXrHyMxbT9ejo7U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=YHyCSYQhalD7uOoETswqj63acdVa3znz41drzdSPgRp7pAZfii+cE3zXQn8c0NUsE
	 oC/hileZx8y/rBxc0sInEBW7TLAqojKGdaEv/84Gv0x3gnpxKg155W+esWkUd2b+aQ
	 JrVSdh99Xiz5OinzldLxjr0FzmoSZupviW/jvcKI=
X-QQ-mid: zesmtpgz7t1759036242t9f60582b
X-QQ-Originating-IP: vZrW/0ceR/bex1xwbBd/Y09KBS2r8jnRxCvwYU5DFsk=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 13:10:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14443702317554781717
EX-QQ-RecipientCnt: 16
Date: Sun, 28 Sep 2025 13:10:40 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: E Shattow <e@freeshell.de>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <E3B55605FD767D42+aNjDUGk1LNF2MKwE@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
 <C16FB37F0982124F+aNi46yQc_e-gCIvL@kernel.org>
 <83fc0f4d-1e7c-41e0-87b3-bfcb84a0450c@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83fc0f4d-1e7c-41e0-87b3-bfcb84a0450c@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MrL15gPbNc8szNemg3y3IxhJ+8TJTy2Eh1Uk4VCgI1xuRgyKMQPZJ/F4
	w1aWk4ennxeg7Mk47vdniS55P8vh4nEiNxruUJgsWL5cTUR8i8PD9ABN5qFFV3WETyWHlMr
	Ke3EpWjiDZ+LAXhDpYeQlmQnujme96rxVmWelPSYhjc1PNcnhFXByJE91GFFGfdx2D0P+yh
	1QBYLtFrYPMtxCq/xPCOPjNWKdBIbyHq25Pp/Pie55PCzu9zLKsQg6LbGEVr2E8mzQEwisx
	Ske74Z8KIPehUBAlZIzdvSRRryT/1PXnRFe2OXuzfflibWv30TUh0GYjK/PL7zcp/xo7wkX
	tHT/Zp3dsxo9bIdkEQzPARK93XbRZFJVAqDD6IAw990244X6rMv1tjRWH1n5Clr7zqW6/Jk
	duHcMNXebGhHraRYBJWQFDZHdVL40KtXv3u++ajkNebOXHmOPK9tPcVGu8Xb/vYCSKq+jk9
	RkC+mKTdLQMceMUHHJSiXqyMwR7SJsiRFB0FTxWTB3+Rx8hWeKgo9yQTyox85ky7HdbV+Nc
	hDX/ywKxFeuPvNpB4m+MyWasLNE9n+xaSFVThqR112Apwvyp3ZE/rrc9FXxh1296iX8umhq
	BT4j0nZsaQjzNJkDYghF9nAjqivc+PX8IR7ci90vDqi1Wv3B9gZNZ4ixd27V2vnEKIAmAsG
	yEKdbRLhSyqlCtdIKIE9SfmpJ5rUGI6suAbr9+8TJOO4FeXrKY9EsAjRNUJeI4q01ic6nY1
	3hxz6irIdLw//F2vYrjoJlcF+21Yf4vT/NwSRKTxQtcHILCUVNoFGvQfScbX3frEaxdNlnL
	4NL7Xu/7iuZCWU6G+oEhC3JPfdJT7/kwMIpD/COJtSp6P72B3RjmHr7iDOR83U0Ye/NFMRV
	jyAff1s4ayidGI5UWCPx0iXvjm/Ih97iZEnliAwpVAm41Y8OrWLVn5SGVsxtobvBJhfvaDZ
	InDi7xwHNYKwuQYrgxu0xdsgzzkRzVaxj5ZOT+1PVqs3MkNnfm91ZXVSn9WoRokKB3o72eE
	9OcxMZfMk1yUPs4Q6M10VC6ofNbvVi9UOlXE0R4ygh/0WZUVIl5mzU9JxL4Ay68zXga1/kn
	4clomUH/h0CJP4PE8nqSamDuyx4X7RBBlBGBgqx6QL0FNSZafMlIXG6RDPkNwGCAWOJ6JuM
	ucrA
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_221204_712839_C586A68B 
X-CRM114-Status: GOOD (  11.12  )
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

On Sat, Sep 27, 2025 at 09:56:39PM -0700, E Shattow wrote:
> On 9/27/25 21:26, Troy Mitchell wrote:
> > On Sun, Sep 28, 2025 at 12:16:48PM +0800, Troy Mitchell wrote:
> >> From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> >>
> > My SMTP client messed up,
> > and both 1/2 and 2/2 were sent from the wrong email address.
> > 
> >                                          - Troy
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> Confirming it is showing up now. Thanks -E Shattow
Thanks for confirming :)

           - Troy
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
