Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93783C10F15
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 23:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwn5HkxLJNLWmwkBvj50x/vrcsNE3W4NQ7/eLnzo3P0=; b=g5ABMBuh++nEB4
	iheRp0tQdEZduvCrMqneLBk1zktZi7/1nn6Syn+1TtZTyPrl+3o3ZYtk06xna8df/IJfTR4EVGNyN
	p+ElIpLPDnHFqiB+nOJ3BZoTflhKNeGHA94w6HQas0GqHuJJGa6nc6UoGY8MRg45s4bomNPvYIARC
	0sy/+1IHL7fKPcp8tztKLsBn2NclSIRKJyzjWxQ19578FwuLRbCeRNE8iE3I6TH5VGkbJ+uF1nL3j
	yV/yrR+TFii6U1sXdesW6UILjBc2bnPatlDcNrrbgwMZBaQ2HV9rX6ZKINCZvI/HS7Dcl7ulM2uso
	jW5OQFhW+qrUxJpx8jLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0853-0000000AXsf-1HFD;
	Thu, 25 Apr 2024 23:00:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s084w-0000000AXpf-1nxB
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 23:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C2711CE1B36;
	Thu, 25 Apr 2024 23:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9AB5C2BD10;
	Thu, 25 Apr 2024 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714086030;
	bh=BWCTdQoP4/3RTZr8W9fHb98CWImR4UwdaKkH2m5RqW8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jjtB6vTqT3a9Zz29gTXjtQc9dFEWhS9QDTCNo677903vNbrF2txz30kOE/0m1jUyM
	 csIAlicgoFX4AgPKWzlQUiT3gU6e4/vFrvuJ7wqF/ytVAu8TpYzpGNYWZrAF1Aus4p
	 MoYhlYUhEwGAmH/ZbMUUm8lYcjYolFUwfwZEIqNiZpyW1KyHZfekIGBZN4qk3yJi1T
	 WKElBZI9BnSZ+PMCka+MbSyGcl/J22lFI6j8+D7qMiKpwr6chtsoHzAsb4BBXfYBzU
	 rtvVHBG4BFQus6/EgsiSTSGyOHB3tX2Xq0QlbTJC7tF7uiK7d9UDRw7LVdwyFTY0Nu
	 G2FaiXYezK2Xg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3BFEC43140;
	Thu, 25 Apr 2024 23:00:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] RISC-V: Test th.sxstatus.MAEE bit before enabling MAEE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171408603073.8761.4519771274981632479.git-patchwork-notify@kernel.org>
Date: Thu, 25 Apr 2024 23:00:30 +0000
References: <20240407213236.2121592-1-christoph.muellner@vrull.eu>
In-Reply-To: <20240407213236.2121592-1-christoph.muellner@vrull.eu>
To: =?utf-8?q?Christoph_M=C3=BCllner_=3Cchristoph=2Emuellner=40vrull=2Eeu=3E?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 philipp.tomsich@vrull.eu, bjorn@kernel.org, dbarboza@ventanamicro.com,
 heiko@sntech.de, cooper.qu@linux.alibaba.com, zhiwei_liu@linux.alibaba.com,
 eric.huang@linux.alibaba.com, alistair.francis@wdc.com,
 ajones@ventanamicro.com, conor@kernel.org, dqfext@gmail.com, alex@ghiti.fr,
 samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_160034_703191_85D8D0E9 
X-CRM114-Status: UNSURE (   9.64  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZpeGVz
KQpieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46CgpPbiBTdW4sICA3IEFw
ciAyMDI0IDIzOjMyOjM0ICswMjAwIHlvdSB3cm90ZToKPiBDdXJyZW50bHksIHRoZSBMaW51eCBr
ZXJuZWwgc3VmZmVycyBmcm9tIGEgYm9vdCByZWdyZXNzaW9uIHdoZW4gcnVubmluZwo+IG9uIHRo
ZSBjOTA2IFFFTVUgZW11bGF0aW9uLiBEZXRhaWxzIGhhdmUgYmVlbiByZXBvcnRlZCBoZXJlIGJ5
IEJqw7ZybiBUw7ZwZWw6Cj4gICBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3Fl
bXUtZGV2ZWwvMjAyNC0wMS9tc2cwNDc2Ni5odG1sCj4gCj4gVGhlIG1haW4gaXNzdWUgaXMsIHRo
YXQgTGludXggZW5hYmxlcyBYVGhlYWRNYWUgZm9yIENQVXMgdGhhdCBoYXZlIGEgVC1IZWFkCj4g
bXZlbmRvcmlkIGJ1dCBRRU1VIG1haW50YWluZXJzIGRvbid0IHdhbnQgdG8gZW11bGF0ZSBhIENQ
VSB0aGF0IHVzZXMKPiByZXNlcnZlZCBiaXRzIGluIFBURXMuIFNlZSBhbHNvIHRoZSBmb2xsb3dp
bmcgZGlzY3Vzc2lvbiBmb3IgbW9yZQo+IGNvbnRleHQ6Cj4gICBodHRwczovL2xpc3RzLmdudS5v
cmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyNC0wMi9tc2cwMDc3NS5odG1sCj4gCj4gWy4u
Ll0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFt2MywxLzJdIHJpc2N2OiB0
aGVhZDogUmVuYW1lIFQtSGVhZCBQQk1UIHRvIE1BRQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9yaXNjdi9jLzYxNzlkNGEyMTMwMAogIC0gW3YzLDIvMl0gcmlzY3Y6IFQtSGVhZDogVGVzdCBh
dmFpbGFiaWxpdHkgYml0IGJlZm9yZSBlbmFibGluZyBNQUUgZXJyYXRhCiAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL3Jpc2N2L2MvNjViNzFjYzM1Y2M2CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5r
IHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtl
cm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
