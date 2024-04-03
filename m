Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EB1C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwSQK/fUOd206SI8zvE8VH1iKF/iAcvAy3tJ3z5oloA=; b=w1U0irTOd9p/Iq
	GyYnPRcKiyj8QnLZfPDXG4IMexzWRPMK6c22oTM6LUsA/1Oxa0RzytaTjTG/afjQd7MDJhN2DI4ZH
	i2UNSpGIRx4o936v46mVWrkmsjFaE1fnex5zeLvaoUW+VbSR+sJZW22XfEemJXqfoP7D3xYKyGsWs
	PUvU7gnFbnX3e9NiMLdv7lwpPvYBxyvn9beRK8Ji0sHTjqj9aMCTQA5UgyHECwmn86my0okjlQPFD
	9IVTzybYaqyaQe5H72XpPgcCmYI+ouaLQmofYMRkFNveMjE0rTQuJk+fiJyNOudIX1DqKWCqqhX++
	RPUG5U2WQ8nh0LJFK9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw9o-0000000Ex5r-2qWK;
	Wed, 03 Apr 2024 08:39:45 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrw8y-0000000EwG8-2yJC
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712133514; bh=h38IpzYE40rRL6YUDxEuxo1A9c6P3+Tqcuhs5gHFXsQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=MhiDb4XI6q9ru9JVLloH9KFTm6K1tpJeSjjonNQDIjV7fF7Z8OlMddEgAyOYfpHY4
	 hePpWPEiOf1Auf32L430EYnJdzaphLNckTctRLBF5upobCMxUOfoDx0PwTYmxg5q4O
	 AYu7UTxXWdJRyamAQgbxcF3ApAIl+S7OyZw+t1fs=
Received: from smtpclient.apple ([219.141.235.82])
	by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
	id 99DAF6F4; Wed, 03 Apr 2024 16:38:29 +0800
X-QQ-mid: xmsmtpt1712133509t4g857ofk
Message-ID: <tencent_191962F243021BFBF9A40403B4451C757009@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8PluXiaw8tD0iRMGI5K2+7PtPdjlOWGX/KbqOaAMV25IrC6sOlm
	 SV9Un7yK/HDB8D/RzxR0RosEH4/kkIxOAEiP7tDuHcbztzshwgUhzFqF0WBPDN7c0oFHKGmXI+J+
	 h4IaLvmROghSyfOxwznQgkukISQq3Kb3gzmwa5dV1abClg0jhFLzwTsjv55pHt76D75Tsng3VYZ9
	 ur6OLYcC5wSQaciZa8iUbFadAp226G4wxTLcbKplG77h/oTZ386j5YtBtxrS83rcqSIJPj1Tfal9
	 wNB0BR2/BTEGjv6+2IXIzzvydyR6O486AwhCUhm0qJQ+1myPtvGUU6dYug/n5HYM2S6I2zDpMQVl
	 Z75NGq4WybdhcLwWZEpb35U5fZnFxmT8VKq803tDWQVyi2y0nbeREixT4d1X80KmUCCb3a+J1AJC
	 xbg0dxsivz6fiuayYEMXZ2D5r0LfMmjnJzEUfMj2XJGOYRwfv+NhECK7BZmIGTpuXCaxu8so1I3g
	 JwS/lGIilCSPOY3RfKVl5AsXvxQOy6YIGqMelt+mvlDv6gNvx5QG42nueQP+yJp8Cok+PQkUFFXW
	 1XHiZpIjXMEkcCgXZ2/FbGFcDyL2k4MZ1rzoQIPXfSjHMS/gZ1U4lvnhuTJIOXlFo5lznVgiS6DE
	 R/Jbn2VVSjsvvz6IIMzV2n5TDT2f5tiqfFlg27sCjFT5/VFCTI9noZKsjngzYJ18dCnfgj28Xhhm
	 yB0LPTO4YiNOg39vsmtRxA9cFOuh/5jB1y9nwezuX+ZXpnsEeKyAKATlL/ZCPkF7NshbFVi6FwwI
	 c9w3rQbzAXsUtDbxXo5idSHc1i0h+2d+frHV1pbj4azceJgL+WFNlu+gsIMECu85gGm0rILKadzT
	 XCQlzYIpp4wexHkZQq4DuqBAvI4Ul3HPcdRdR/Lsk7K9nN4RZ4d9M7zaiPSjafd8mXHQqHSjApEW
	 tiU43TGpDIuOcCqJvn4FF4gQrWLeLQomUM/XJiaSJPS+EfgQ4nyA==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v6 08/11] pinctrl: k210: Deprecate SOC_CANAAN and use
 SOC_CANAAN_K210
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <CACRpkdY1wpGM7M5QV5rN0M6JMN_yugQJ7CEtnQjzsheD5AT23A@mail.gmail.com>
Date: Wed, 3 Apr 2024 16:38:19 +0800
Cc: linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-OQ-MSGID: <1807DEE3-E572-44E3-997D-C7D2EADF4BB1@cyyself.name>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_6D10A9C63E3E0F412EED33477B5CDB98C207@qq.com>
 <CACRpkdY1wpGM7M5QV5rN0M6JMN_yugQJ7CEtnQjzsheD5AT23A@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_013853_680765_348454E1 
X-CRM114-Status: GOOD (  11.61  )
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

Cgo+IE9uIEFwciAyLCAyMDI0LCBhdCAyMDozMSwgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPiB3cm90ZToKPiAKPiBPbiBTYXQsIE1hciAyMywgMjAyNCBhdCAxOjEz4oCv
UE0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+IHdyb3RlOgo+IAo+PiBTaW5jZSBTT0Nf
Rk9PIHNob3VsZCBiZSBkZXByZWNhdGVkIGZyb20gcGF0Y2ggWzFdLCBhbmQgY2xlYW51cCBmb3Ig
b3RoZXIKPj4gU29DcyBpcyBhbHJlYWR5IG9uIHRoZSBtYWlsaW5nIGxpc3QgWzIsMyw0XSwgd2Ug
cmVtb3ZlIHRoZSB1c2Ugb2YKPj4gU09DX0NBTkFBTiBhbmQgaW50cm9kdWNlZCBTT0NfQ0FOQUFO
X0syMTAgZm9yIEsyMTAtc3BlY2lmaWMgZHJpdmVycywKPj4gCj4+IFRodXMsIHdlIHJlcGxhY2Ug
aXRzIGRyaXZlcnMgZGVwZW5kcyBvbiBTT0NfQ0FOQUFOX0syMTAgYW5kIGRlZmF1bHQgc2VsZWN0
Cj4+IHdoZW4gaXQgaGFzIHRoZSBzeW1ib2wgU09DX0NBTkFBTl9LMjEwLgo+PiAKPj4gWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIxMTIxMjIxNDE0LjEwOTk2NS0x
LWNvbm9yQGtlcm5lbC5vcmcvCj4+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDI0MDMwNS1wcmF5aW5nLWNsYWQtYzRmYmNhYTdlZDBhQHNwdWQvCj4+IFszXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDMwNS1mbGVkLXVuZHJpbGxlZC00
MWRjMGM0NmJiMjlAc3B1ZC8KPj4gWzRdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjQwMzA1LXN0cmVzcy1lYXJmbGFwLWQ3ZGRiODY1NWE0ZEBzcHVkLwo+PiAKPj4gU2ln
bmVkLW9mZi1ieTogWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4gCj4gQWNrZWQtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAKClBsZWFzZSBhZGQg
QWNrZWQtYnkgdG8gdGhpcyBlbWFpbCBbMV0uIEkgd2lsbCBzZXBhcmF0ZSB0aGVtIGluIHRoZSBu
ZXh0CnJldmlzaW9uLgoKWzFdCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L3Rl
bmNlbnRfREIxMTIxNEM4RDBEN0M0ODgyOUFEQTEyOEU3QkI4RjEzMTA4QHFxLmNvbS8KClRoYW5r
cy4KCj4gSXMgdGhpcyBwYXRjaCBzb21ldGhpbmcgSSBjYW4ganVzdCBhcHBseSB0byB0aGUgcGlu
Y3RybCB0cmVlPwo+IAoKSSB0aGluayBub3QuIEFzIENvbm9yIHNhaWQuCgo+IFlvdXJzLAo+IExp
bnVzIFdhbGxlaWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
