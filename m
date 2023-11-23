Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A772C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8H0f0J71XoGqi6dY4u57iRWwHMBgSrugkcG4Q1kvOqk=; b=jlk2R5r4gtinxB
	i4dJtiFM+AsP7Hm9hFT9F5oDHPIB6ejr7gsHfUft0X8YFFt1FMY2rORGuwU1PRFHvdPBZWY+10afq
	ZsgQaf9EZTgyibmN4oauc7+9wOrqNAwZn3xBe48H7G6UxR1E/qnpynEh8jN04CTAmooGFoiNNwy2X
	JuarXyBTrH4nZGtlPAcyV2irQ7Onrg5G8WuGjw63NMUbtoDq9Isvd1sTOJv4B15nrpVG3VKywuYU+
	bjbL8jaFqCSLApnP13gUYgQ5vLJj0ufWLz4IDxuQrz3hGS9dW8MECnnk21+OLCmWt/DqDS702cUMk
	mTwqYX/E/z/2yjwvaGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67MZ-004RCO-36;
	Thu, 23 Nov 2023 10:55:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67MW-004RAR-06;
	Thu, 23 Nov 2023 10:55:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6263561FB1;
	Thu, 23 Nov 2023 10:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9429DC433C8;
	Thu, 23 Nov 2023 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700736910;
	bh=NGJuny/T+fyg0bzZg8rPSHmJVa/rpExZEmSSYXneMOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DQDoVQ795iRe1AeJ0JE0DdQLKCHM4AMUcZd6QEjh2vi6f+YXd2u3WvyvdLBl0Oi0P
	 huPpFsn58tBf+keKnxM0QvYeQXJDLg1+bnXHmslVns0T5uATrg/W5BeMXPacUQksxj
	 TRX/HuQccMzyCcCuUbVBb88ETEpQCnFMJiDRMIOuwoLgjUCAmzBjr68DW2m60YNLp0
	 SO+n86vKNJ40PV39QkNDdKAoiv+iNoSgf5IBk+YP95bZL2k6SWKIK3IxGnIvxBTV8p
	 t50AMXEu4iRdmzdvehN7QV4rvKlI6Kry/UO1BFpc4qIaQJ60NQi/30PJI8dvsIMKij
	 ptAf+w0t6mdsg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20231029212738.7871-1-samuel@sholland.org>
References: <20231029212738.7871-1-samuel@sholland.org>
Subject: Re: (subset) [PATCH v8 0/5] leds: Allwinner A100 LED controller
 support
Message-Id: <170073690632.1239913.13249026950783494795.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 10:55:06 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_025512_109530_2BC18020 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev, John Watts <contact@jookia.org>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyOSBPY3QgMjAyMyAxNjoyNjo1NCAtMDUwMCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6
Cj4gVGhpcyBzZXJpZXMgYWRkcyBiaW5kaW5ncyBhbmQgYSBkcml2ZXIgZm9yIHRoZSBSR0IgTEVE
IGNvbnRyb2xsZXIgZm91bmQKPiBpbiBzb21lIEFsbHdpbm5lciBTb0NzLCBzdGFydGluZyB3aXRo
IEExMDAuIFRoZSBoYXJkd2FyZSBpbiB0aGUgUjMyOSBhbmQKPiBEMSBTb0NzIGFwcGVhcnMgdG8g
YmUgaWRlbnRpY2FsLgo+IAo+IFRoaXMgc2VyaWVzIHdhcyB0ZXN0ZWQgb24gdGhlIE5lemhhIGJv
YXJkIChvbmUgb25ib2FyZCBMRUQpIGFuZCB0aGUKPiBEb25nc2hhbiBOZXpoYSBTVFUgYm9hcmQg
KHdpdGggYW4gZXh0ZXJuYWwgc3RyaXAgb2YgMTYvMzIvNDggTEVEcywgYWxzbwo+IHdpdGggZ2Fw
cyBpbiB0aGUgTEVEIGFkZHJlc3NlcykuCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsx
LzVdIGR0LWJpbmRpbmdzOiBsZWRzOiBBZGQgQWxsd2lubmVyIEExMDAgTEVEIGNvbnRyb2xsZXIK
ICAgICAgY29tbWl0OiA1N2VmNjY2ZTE1ODY4MjNhZGMxYjc5MDllZDM0NzJkZWMxMTdkZjFmClsy
LzVdIGxlZHM6IHN1bjUwaS1hMTAwOiBOZXcgZHJpdmVyIGZvciB0aGUgQTEwMCBMRUQgY29udHJv
bGxlcgogICAgICBjb21taXQ6IDA5MGEyNWFkOTc5ODM3MjBmNTJiMTFkOWM1YThkMWE0NDYyMTdj
MWQKCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
