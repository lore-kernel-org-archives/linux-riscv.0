Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D79C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fqMFlAN2hV8LaMdvzYdwQLKkRdHba4JhnlfyEC+6svU=; b=XtLFLx4lB8Xw+JDC/1EYNxo8cC
	urtWWG7pjN/DDVl1kfdfVakBb6fiS724z64cbSAyNHyiG2E6WoH1YpYG19hEduiLnmA12Y9UN4LQB
	KUhlhS9sMTJkDKQdn0dQNNUywMw9COvZ94ptJgTKYyGs/JjJEMkFBfxxvvB8yqgdxSGvyWRTuvsPH
	T9+VZK2WZKqPlOLTbraXntJQ4rBUY/qLr4RcrCULVf+RePNgdrRR/hPMqqwEqgXL/3syLdOl5/0n0
	ralc9vcNGHOdKXb335VueQ5fJxPxy6miWKOHsjsJ/FInkXSDncvRadtEAM7/obGjhUFR2S4mL0VPI
	fRZDml1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pVw-001Lwo-Hp; Mon, 27 Jun 2022 14:14:56 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pVT-001Ljt-Oc
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 14:14:29 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 4AFD65C012B;
	Mon, 27 Jun 2022 10:14:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 27 Jun 2022 10:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656339265; x=
	1656425665; bh=MHflSRrcauCzkIXmYSgam5C/L3iBtC50UPlW/v0FWYA=; b=V
	B/PQQmw9gCv0XiwlL9s/nRC7zRmYVsSdf8Mwod/Z/HFN4J9oTwIV+rHh9YEzEKS2
	mN5z3/vWFWIJbiRhCjSn/8Dr0m0YSN6DgxErkkgF0cv1kdvLPJNgIYYZ2vTupK9+
	Ot+SkVEVkB5wJ/LrfKdQD8r8eh8t70GN0Cggd+P6c+Fl7kxEzXG46bj8msyNhIQb
	F4Dmu7DKjXyi1gdRFi8095w5WKMb0zY5zc3TZEMQbVO9uqWpDtgYjPhvdpkLkgrI
	EGD9wHDskSrmuyBya1MqJIuvPVc3Nbg7DJbI1AZ0M/YdVlYVeS7fEXAuQCvji/Fa
	r3LahnJHOJPz/bAqSzXFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656339265; x=
	1656425665; bh=MHflSRrcauCzkIXmYSgam5C/L3iBtC50UPlW/v0FWYA=; b=b
	OI4teyjgv/oKaHSoDbClKUY4+NnYAHlPcejUWzYt416mdhtZvB0blJwo82JCfzNC
	7Pigjfn2MeAf0EuSCa5V2udjJ77eADv537wGSI8CcfJe1hoKMBmxaiZo7fmH256f
	riqEWQ0Q1vxzfrU1CsC++aUAQ1GYMdvpob5lzVfj+aaO1JMMuWcDSHGv0sHKczA2
	v23xIpbQQRd7YWHwq8SZMXjct1rnCy44/EhDO32nChq2OvPDvPndCKQLYyQ37eIh
	paBRnbSMdr0JPM/UsSyMiZ0jQ/JZX6UCoDP47CwIpQTXkQjI3EijZ+yy25pP7HV6
	ZN8w++8xkieCNRM+yyhwQ==
X-ME-Sender: <xms:QLu5YmFFSHpJA4_LkECTb54itB94i4sR0xVm9fmxODUddMRKr7NqEg>
    <xme:QLu5YnXMfFoaZPkjxhSDIWLzLpUc-_aEJars6StFadJBBFmbf5yiOAu6sc2GyjanC
    BcO117bpooo2OjnRA>
X-ME-Received: <xmr:QLu5YgKEEJBy4rVNmDJfRJCWwSL6ZfGXHzeLl4Jg3G6D07hI578rRREFhwuyjs21Rtp6aBp2Dt_04bWci5jMIvPytWcRGElLydw-ELJ7v9U0Q_WCKSHCO6AWgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedtvddvudelveeuleegveduiefggeegheffgefhjeduhfeigfei
    vedthfduleegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:QLu5YgFtXeAj4IDlNxTMHiYFI7Cn_lfILYHYgJdnZHCp-pcr6wJm-A>
    <xmx:QLu5YsUT5g6PP6hQ6PV4czzMO3Hu1IseTIYIBafGHdc44zQryH6Vrw>
    <xmx:QLu5YjMFPJ7kxa5b-e1qbnuol9Kb2QEqVBU7QvNTk7sYsaR2xNAeQA>
    <xmx:Qbu5YhXXjVAXOL0m94D1DrZvqDq7wjNOF4deCYi8ckWf2tSYjUG4Mg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 10:14:24 -0400 (EDT)
Subject: Re: [PATCH v1 1/3] dt-bindings: interrupt-controller: Require trigger
 type for T-HEAD PLIC
To: Guo Ren <guoren@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20220627051257.38543-1-samuel@sholland.org>
 <20220627051257.38543-2-samuel@sholland.org>
 <CAJF2gTSq1NsBWRCg+kpTbJRwSeE30P9NVB5di6vzi7m2CFRzHw@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <ab5b4722-8219-ab1c-e9d8-2c00e52040da@sholland.org>
Date: Mon, 27 Jun 2022 09:14:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTSq1NsBWRCg+kpTbJRwSeE30P9NVB5di6vzi7m2CFRzHw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_071427_948073_449E0248 
X-CRM114-Status: GOOD (  18.31  )
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

T24gNi8yNy8yMiAyOjQwIEFNLCBHdW8gUmVuIHdyb3RlOgo+IE9uIE1vbiwgSnVuIDI3LCAyMDIy
IGF0IDE6MTMgUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+IHdyb3RlOgo+
Pgo+PiBUaGUgUklTQy1WIFBMSUMgc3BlY2lmaWNhdGlvbiB1bmZvcnR1bmF0ZWx5IGFsbG93cyBQ
TElDIGltcGxlbWVudGF0aW9ucwo+PiB0byBpZ25vcmUgZWRnZXMgc2VlbiB3aGlsZSBhbiBlZGdl
LXRyaWdnZXJlZCBpbnRlcnJ1cHQgaXMgYmVpbmcgaGFuZGxlZDoKPj4KPj4gICBEZXBlbmRpbmcg
b24gdGhlIGRlc2lnbiBvZiB0aGUgZGV2aWNlIGFuZCB0aGUgaW50ZXJydXB0IGhhbmRsZXIsCj4+
ICAgaW4gYmV0d2VlbiBzZW5kaW5nIGFuIGludGVycnVwdCByZXF1ZXN0IGFuZCByZWNlaXZpbmcg
bm90aWNlIG9mIGl0cwo+PiAgIGhhbmRsZXLigJlzIGNvbXBsZXRpb24sIHRoZSBnYXRld2F5IG1p
Z2h0IGVpdGhlciBpZ25vcmUgYWRkaXRpb25hbAo+PiAgIG1hdGNoaW5nIGVkZ2VzIG9yIGluY3Jl
bWVudCBhIGNvdW50ZXIgb2YgcGVuZGluZyBpbnRlcnJ1cHRzLgo+Pgo+PiBGb3IgUExJQ3Mgd2l0
aCB0aGF0IG1pc2ZlYXR1cmUsIHNvZnR3YXJlIG5lZWRzIHRvIGtub3cgdGhlIHRyaWdnZXIgdHlw
ZQo+PiBvZiBlYWNoIGludGVycnVwdC4gVGhpcyBhbGxvd3MgaXQgdG8gd29yayBhcm91bmQgdGhl
IGlzc3VlIGJ5IGNvbXBsZXRpbmcKPj4gZWRnZS10cmlnZ2VyZWQgaW50ZXJydXB0cyBiZWZvcmUg
aGFuZGxpbmcgdGhlbS4gU3VjaCBhIHdvcmthcm91bmQgaXMKPj4gcmVxdWlyZWQgdG8gYXZvaWQg
bWlzc2luZyBhbnkgZWRnZXMuCj4+Cj4+IFRoZSBULUhFQUQgQzl4eCBQTElDIGlzIGFuIGV4YW1w
bGUgb2YgYSBQTElDIHdpdGggdGhpcyBiZWhhdmlvci4KPiBBY3R1YWxseSwgQzl4eCBzdXBwb3J0
IHB1bHNlIHNpZ25hbHMgd2hpY2ggY29uZmlnZWQgYnkKPiBwYWRfcGxpY19pbnRfY2ZnX3ggZm9y
IFNvQyB2ZW5kb3I6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTA2
L2Jsb2IvbWFpbi9DOTA2X1JUTF9GQUNUT1JZL2dlbl9ydGwvcGxpYy9ydGwvcGxpY19pbnRfa2lk
LnYKPiAxMDQ6IGFzc2lnbiBpbnRfbmV3X3BlbmRpbmcgPSBwYWRfcGxpY19pbnRfY2ZnX3ggPyBp
bnRfcHVsc2UKPiAxMDU6Cj4gICAgICAgICA6IGxldmVsX2ludF9wZW5kaW5nOwo+IAo+IFRoZXkg
Y291bGQgcHV0IHBhZF9wbGljX2ludF9jZmdfeCBpbnRvIHRoZSBTb0Mgc29mdHdhcmUgY29uZmln
Cj4gcmVnaXN0ZXJzIHJlZ2lvbiBvciBiaW5kIHRoZW0gdG8gY29uc3RhbnQgdmFsdWVzLgoKVGhl
IGlzc3VlIGhlcmUgaXMgdGhlICIhaW50X2FjdGl2ZSIgY29uZGl0aW9uIGZvciBpbnRfbmV3X3Nl
dF9wZW5kaW5nLApyZWdhcmRsZXNzIG9mIHRoYXQgY29uZmlndXJhdGlvbiBpbnB1dC4KCkZvciBp
bnRlcnJ1cHQgc291cmNlcyB0aGF0IHNlbmQgcHVsc2VzLCB0aG9zZSBwdWxzZXMgd2lsbCBiZSBs
b3N0IGlmIHRoZXkgYXJlCnJlY2VpdmVkIHdoaWxlIGludF9hY3RpdmUgaXMgdHJ1ZS4gU28gdGhl
IGRyaXZlciBoYXMgdG8gbWFrZSBzdXJlIGludF9hY3RpdmUgaXMKZmFsc2UgX2JlZm9yZV8gc2Vy
dmljaW5nIGFuIGludGVycnVwdCwgb3IgaXQgbWF5IG1pc3MgdGhlIG5leHQgb25lLiBUaGlzIG1l
YW5zCnRoZSBkcml2ZXIgbmVlZHMgdG8ga25vdyB3aGljaCBpbnRlcnJ1cHQgX3NvdXJjZXNfIHNl
bmQgcHVsc2VzIGFuZCB3aGljaCBvbmVzCmFzc2VydCBsZXZlbHMuCgpGb3IgbGV2ZWwgaW50ZXJy
dXB0cywgcGFkX3BsaWNfaW50X2NmZ194IGhhZCBiZXR0ZXIgYmUgMCwgYnV0IHRoYXQgaXMgYQpo
YXJkd2FyZS9maXJtd2FyZSBjb25maWd1cmF0aW9uIGNvbmNlcm4uIFRoZSBkcml2ZXIgc2hvdWxk
IG5vdCBoYXZlIHRvIGNhcmUKYWJvdXQgdGhhdC4KCihPbiB0aGUgQWxsd2lubmVyIEQxLCB0aG9z
ZSBpbnB1dHMgYXJlIG1lbW9yeSBtYXBwZWQsIHdoaWNoIHdhcyB0aGUgcmVhc29uIGZvcgp0aGUg
c3RhY2tlZCBpbnRlcnJ1cHQgY29udHJvbGxlciBtZW50aW9uZWQgaW4gbXkgb3RoZXIgcmVwbHku
IEJ1dCB3aGlsZQpwYWRfcGxpY19pbnRfY2ZnX3ggPT0gMSBvbmx5IHdvcmtzIHdpdGggZWRnZSBp
bnRlcnJ1cHRzLCB0aGUgcGFkX3BsaWNfaW50X2NmZ194Cj09IDAgY2hvaWNlIHdvcmtzIHdpdGgg
ZWl0aGVyIGtpbmQgb2YgaW50ZXJydXB0IHNvdXJjZSwgc28gdGhlIHN0YWNrZWQgZHJpdmVyIGlz
Cm5vdCByZWFsbHkgbmVlZGVkLikKClJlZ2FyZHMsClNhbXVlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
