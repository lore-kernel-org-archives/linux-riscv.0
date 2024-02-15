Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896A9C4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqFdpm+oGGCXAutTMKBXEfe5wGOR00jaQvqTQmaH7zc=; b=LRj5YJ1rwcdVyE
	JhEPY1yh0lZyW2Wjmj0aU/4TFUDKvX7fEIKP93xxd8YTzsCPIjIxUfQ0XSfM5uWf/H1mncJb09O9n
	BGYEPwrn3/JvX/lUcSlGL0R+JGbSXjL3SNjlhDOWm/iWCObQp+aS0pQO4euv+l0r1SREzohqmdgfQ
	Iq3Cc9ruWd9Uk9zqvUl6Z/ylnU2siIq7xgc5mCx5VABEequuchJ9kmOd7P17SHj/vdtgF63+o3fbu
	BYrP2+xCJHJXU0Zq7kzW0dQkBqzleQ8DszIl+EugaLmOPKFhk/Zn6iKukopYVC7Z/GXSZDEqMEoTP
	eoJO1+bQGNH22PkjWFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rab8L-0000000GHer-1Rw4;
	Thu, 15 Feb 2024 12:46:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rab8I-0000000GHeB-26yP
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 12:46:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rab8C-0003tl-Hz; Thu, 15 Feb 2024 13:46:24 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rab8B-000t60-3w; Thu, 15 Feb 2024 13:46:23 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rab8B-0007kP-08;
	Thu, 15 Feb 2024 13:46:23 +0100
Message-ID: <4a1a0b142ca58e1c22ba246991d4ee657a4ee91f.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/4] reset: simple: add support for Sophgo SG2042
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>, 
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com,  robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com,  xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org,  inochiama@outlook.com
Date: Thu, 15 Feb 2024 13:46:22 +0100
In-Reply-To: <MA0P287MB2822E03B61DF33B4438833D9FE4D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <cover.1706577450.git.unicorn_wang@outlook.com>
	 <1cfd7b3ba447942784c4f7aa595e962399e9f617.1706577450.git.unicorn_wang@outlook.com>
	 <MA0P287MB2822E03B61DF33B4438833D9FE4D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_044630_559297_D397BABB 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ2hlbiwKCk9uIERvLCAyMDI0LTAyLTE1IGF0IDE2OjU5ICswODAwLCBDaGVuIFdhbmcgd3Jv
dGU6Cj4gcGluZyB+fn4gCj4KWy4uLl0KPgo+IGhlbGxvLMKgIFBoaWxpcHAsCj4gCj4gQ2FuIHlv
dSBwbGVhc2UgaGF2ZSBhIGxvb2sgb2YgdGhpcywgSSBoYXZlIGZpeGVkIHRoZSBpc3N1ZSB5b3Ug
cmFpc2VkIGluIAo+IGxhc3QgdmVyc2lvbiwgYW55IHF1ZXN0aW9uIHBsZWFzZSBmZWVsIGZyZWUg
bGV0IG1lIGtub3cuCj4gCj4gQlRXLCB3aWxsIHlvdSBwaWNrIHRoaXMgZm9yIHY2LjkgaWYgaXQg
aXMgb2sgdG8geW91LgoKWWVzLCBJIGludGVuZCB0byBkbyB0aGlzIHRvbW9ycm93LgoKcmVnYXJk
cwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
