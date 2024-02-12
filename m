Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A33BC4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 15:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tuMuRJMP/xt9+bzVES8vWV3HnLVumgsIY2iaLUgibM=; b=XUF1fzNkI6TDMx
	meSArHFyMtw9EHGwD7GI6QTVyxO3LqS1dou+J+L+YSCYyBwFFDllv6VOl/yVt+V/QeGl6ZY7iDAC/
	P8eQ/PkOCmZW5c+9QG4iOKERTWdUv2EJcqrykjWiv3qMQXDvk0kQsIPUToVLQesicNYgmxqfs/Wjd
	g3v3b6Zys9xfd+ms5T2wL0ZIQqXgALQIFWUS10fjlEFOUkzWUVxIcS1F5tQYDSTMO8cFUeTFwIfzA
	6rdKXhKRFc7dJ916EGjoL/hbBC7Zx0gx9J7ktgEx/0qbffBbTWW4uzF2OlboiWFfNOAMa26BYlb0f
	Z+bgbqXn/CU9F6KRr35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZY1H-00000005vDw-3bUm;
	Mon, 12 Feb 2024 15:14:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZY1F-00000005vDH-0v6x
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 15:14:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1D9960B54;
	Mon, 12 Feb 2024 15:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34609C433C7;
	Mon, 12 Feb 2024 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707750891;
	bh=5q6JZRqfcRM8joFrd/AFSLb1fQAqV7AVpQcJ1988pP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQkfmy+VhabegvGXYGdHPXVnU/TNaW2q6GRYvxAKffYehQeYdPKGKik/HCuQ88VhG
	 juJB0HrNy/KuEymDRS460fW8Q+3mLNnW6gzkQuEANAB1OHBqYfWuoYIAN+xutNTJxR
	 oYJn6xUg+jaQNP1aO/1WQYbTQTORUYdE+cD9CAHnzywsuTvzBKFczSu58mlit3Fvfs
	 mvil+84HteuRA1x5MDRfVZD5JVcg73qqK/DtMW8d+C0q1bAieBygA+IvCvGJV+uLEl
	 WbK5BlpmL9TMKBjGsR6vqLz8rt1P43xbB85xA/ztcWebzfRXLd2kKs4ezbhpr4Ftua
	 c66lzHktm0dpg==
Date: Mon, 12 Feb 2024 09:14:49 -0600
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH v9 2/5] dt-bindings: clock: sophgo: add RP gate clocks
 for SG2042
Message-ID: <20240212151449.GA379868-robh@kernel.org>
References: <cover.1706854074.git.unicorn_wang@outlook.com>
 <fcdd83addcd9af159a0bebf2a14543168bd59a07.1706854074.git.unicorn_wang@outlook.com>
 <20240205172422.GA3643653-robh@kernel.org>
 <MA0P287MB2822C8930916B90A9C1BAA49FE462@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822C8930916B90A9C1BAA49FE462@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_071453_373959_A78A9098 
X-CRM114-Status: GOOD (  19.12  )
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

T24gVHVlLCBGZWIgMDYsIDIwMjQgYXQgMDg6NTc6MjdQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IAo+IE9uIDIwMjQvMi82IDE6MjQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gT24gRnJpLCBG
ZWIgMDIsIDIwMjQgYXQgMDI6NDI6MDJQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+ID4gPiBG
cm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPiA+ID4gCj4gPiA+IEFk
ZCBiaW5kaW5ncyBmb3IgdGhlIGdhdGUgY2xvY2tzIG9mIFJQIHN1YnN5c3RlbSBmb3IgU29waGdv
IFNHMjA0Mi4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93
YW5nQG91dGxvb2suY29tPgo+ID4gPiAtLS0KPiA+ID4gICAuLi4vYmluZGluZ3MvY2xvY2svc29w
aGdvLHNnMjA0Mi1ycGdhdGUueWFtbCAgfCAzNyArKysrKysrKysrKysKPiA+ID4gICAuLi4vZHQt
YmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1ycGdhdGUuaCAgfCA1OCArKysrKysrKysrKysr
KysrKysrCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspCj4gPiA+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9j
ay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS55YW1sCj4gPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1ycGdhdGUuaAo+ID4gPiAKPiA+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9z
b3BoZ28sc2cyMDQyLXJwZ2F0ZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItcnBnYXRlLnlhbWwKPiA+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi42OWNlM2E2NGY2NmMKPiA+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xv
Y2svc29waGdvLHNnMjA0Mi1ycGdhdGUueWFtbAo+ID4gPiBAQCAtMCwwICsxLDM3IEBACj4gPiA+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4g
PiA+ICslWUFNTCAxLjIKPiA+ID4gKy0tLQo+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS55YW1sIwo+ID4gPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ICsK
PiA+ID4gK3RpdGxlOiBTb3BoZ28gU0cyMDQyIEdhdGUgQ2xvY2sgR2VuZXJhdG9yIGZvciBSUChy
aXNjdiBwcm9jZXNzb3JzKSBzdWJzeXN0ZW0KPiA+ID4gKwo+ID4gPiArbWFpbnRhaW5lcnM6Cj4g
PiA+ICsgIC0gQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4gPiA+ICsKPiA+
ID4gK3Byb3BlcnRpZXM6Cj4gPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiA+ICsgICAgY29uc3Q6IHNv
cGhnbyxzZzIwNDItcnBnYXRlCj4gPiA+ICsKPiA+ID4gKyAgcmVnOgo+ID4gPiArICAgIG1heEl0
ZW1zOiAxCj4gPiA+ICsKPiA+ID4gKyAgJyNjbG9jay1jZWxscyc6Cj4gPiA+ICsgICAgY29uc3Q6
IDEKPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ID4gKyAgICAgIFNlZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svc29waGdvLHNnMjA0Mi1ycGdhdGUuaD4gZm9yIHZhbGlkIGluZGljZXMuCj4gPiA+ICsK
PiA+ID4gK3JlcXVpcmVkOgo+ID4gPiArICAtIGNvbXBhdGlibGUKPiA+ID4gKyAgLSByZWcKPiA+
ID4gKyAgLSAnI2Nsb2NrLWNlbGxzJwo+ID4gPiArCj4gPiA+ICthZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UKPiA+ID4gKwo+ID4gPiArZXhhbXBsZXM6Cj4gPiA+ICsgIC0gfAo+ID4gPiArICAg
IGNsb2NrLWNvbnRyb2xsZXJAMTAwMDAwMDAgewo+ID4gPiArICAgICAgY29tcGF0aWJsZSA9ICJz
b3BoZ28sc2cyMDQyLXJwZ2F0ZSI7Cj4gPiA+ICsgICAgICByZWcgPSA8MHgxMDAwMDAwMCAweDEw
MDAwPjsKPiA+ID4gKyAgICAgICNjbG9jay1jZWxscyA9IDwxPjsKPiA+IE5vIGlucHV0IGNsb2Nr
cz8KPiAKPiBJIHRoaW5rIGl0IHNob3VsZCBoYXZlIHNvbWUgaW5wdXQsIEkgd2lsbCBhZGQgaXQs
IHRoYW5rcy4KPiAKPiBCVFcswqAgY2FuIHdlIGlnbm9yZSB0aGlzIHByb3BlcnR5IGlmIGRyaXZl
ciBkb2Vzbid0IHVzZSBpdO+8nyBJbiBvdGhlciB3b3JkcywKPiBkbyB3ZSBoYXZlIHRvIGFkZCB0
aGlzIGNsb2NrcyBwcm9wZXJ0eSBqdXN0IHRvIGluZGljYXRlIHRoYXQgdGhpcyBub2RlCj4gcmVx
dWlyZXMgc29tZSBjbG9ja3MgYXMgaW5wdXQgZnJvbSBhIGhhcmR3YXJlIHBlcnNwZWN0aXZlPwoK
WWVzIGFuZCBuby4gVGhlIGtlcm5lbCB3aWxsIHNlZSB0aGUgZGVwZW5kZW5jeSBhbmQgdHJhY2sg
dGhhdC4gQnV0IHlvdXIgCmRyaXZlciBkb2Vzbid0IGhhdmUgdG8gZ2V0IHRoZSBjbG9jayBvciBh
bnl0aGluZy4gVGhvdWdoIHByZXN1bWFibHkgdGhlIApzb3VyY2UgaXMgYSBmaXhlZC1jbG9jayBh
bmQgeW91IG5lZWQgaXRzIGZyZXF1ZW5jeSB0byBjYWxjdWxhdGUgY2hpbGQgCmNsb2NrIHJhdGVz
LgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
