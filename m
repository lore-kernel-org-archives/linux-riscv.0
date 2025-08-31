Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29404CA0FF2
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Aug 2025 04:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5wsX1DcHheO6EX/Vw1/NYyP7yz2UmO6QlX19d5sf0g=; b=Y+TjaCP3ZoanwB
	a4Lst2bNGECo2nxi/QifbM/l+UZGd1OhS7W2qV620VvrFRc1AfbxL4bftqCMbc3KZdXf6+Hx9Ci/7
	zciAHX1nquTwjQOVTAdhGPXrVM8awBlGTDrvZzBZpg8YhrS43taPxG0QV7OmAykr3RdGyEMQm8KNC
	t7ueeuEGwPhslkgUsKkIyu2p6SDdoR7Q56w1LiKqf+sKvsI+mWiTpN2Vi4V56p/ORezY0QgUMJj6m
	Dttb/Gt1+iUOgPnCeCQ5dXX0bUCQc0TRpKIZtRjsKQXehN+ZF1yFFqmqeATP1A3YjX49B/WEeCC2s
	d6P8IxshMw1PhYscx1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usZyY-00000009Gmc-39jR;
	Sun, 31 Aug 2025 04:47:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usZyX-00000009Gm5-3FNb
	for linux-riscv@lists.infradead.org;
	Sun, 31 Aug 2025 04:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AEB8601A7;
	Sun, 31 Aug 2025 04:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A24C4CEED;
	Sun, 31 Aug 2025 04:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756615652;
	bh=6Xi0K/W1KlUqGgnI90gdjqSztDt8V0ZroZtXizA2odk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h78myz8E/Lpqgkb404MXDyQ/h2vz9IJzk7/Lt2Znqe2z85N0/RPULaLIFOYcqv0na
	 +w7EGs1z14rGeD2aek2/SzcqxSAyeklS9eFRK3qDFVedB29fPEuRtWf0LsFJ5brZAn
	 tqn5/CesHRJOLDD5LLq20N36zjSQpUzB1Y/bmqSFHtfvBnL5GLiQLbRIUSrhzfzWvA
	 QXa2Be4BBwAiQq+ko+LdqTI/Yiv01Kf/6Uq2xORVlmjkgbOypgIf8K9x9vgRXV63pE
	 fiFyrw8smWQCVJgueeXQSiR2dOHLL9o0kQk3jBMBWzOdlTfJ3tW5snqY44yf0sXZ09
	 7cidFvqdI8GwA==
Date: Sun, 31 Aug 2025 10:17:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: kwilczynski@kernel.org, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de, bwawrzyn@cisco.com, 
	bhelgaas@google.com, unicorn_wang@outlook.com, conor+dt@kernel.org, 
	18255117159@163.com, inochiama@gmail.com, kishon@kernel.org, krzk+dt@kernel.org, 
	lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	s-vadapalli@ti.com, tglx@linutronix.de, thomas.richard@bootlin.com, 
	sycamoremoon376@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	rabenda.cn@gmail.com, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
	fengchun.li@sophgo.com
Subject: Re: [PATCH 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Message-ID: <qyr73crraruct5dgxfko75gv2mrrxxolkzqnu3bngfelcobgfa@wc4rrzfs27gp>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
 <c9362bb49e4d48647db85d85c06040de8f38cb83.1756344464.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9362bb49e4d48647db85d85c06040de8f38cb83.1756344464.git.unicorn_wang@outlook.com>
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgMTA6MTY6NTRBTSBHTVQsIENoZW4gV2FuZyB3cm90ZToK
PiBGcm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPiAKPiBBZGQgYmlu
ZGluZyBmb3IgU29waGdvIFNHMjA0MiBQQ0llIGhvc3QgY29udHJvbGxlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPiAtLS0KPiAgLi4u
L2JpbmRpbmdzL3BjaS9zb3BoZ28sc2cyMDQyLXBjaWUtaG9zdC55YW1sIHwgNjYgKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zb3BoZ28s
c2cyMDQyLXBjaWUtaG9zdC55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9wY2kvc29waGdvLHNnMjA0Mi1wY2llLWhvc3QueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvc29waGdvLHNnMjA0Mi1wY2llLWhvc3Qu
eWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yY2NhM2Qx
MTNkMTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BjaS9zb3BoZ28sc2cyMDQyLXBjaWUtaG9zdC55YW1sCj4gQEAgLTAsMCArMSw2NiBA
QAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2Up
Cj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9wY2kvc29waGdvLHNnMjA0Mi1wY2llLWhvc3QueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogU29waGdv
IFNHMjA0MiBQQ0llIEhvc3QgKENhZGVuY2UgUENJZSBXcmFwcGVyKQo+ICsKPiArZGVzY3JpcHRp
b246Cj4gKyAgU29waGdvIFNHMjA0MiBQQ0llIGhvc3QgY29udHJvbGxlciBpcyBiYXNlZCBvbiB0
aGUgQ2FkZW5jZSBQQ0llIGNvcmUuCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIENoZW4gV2Fu
ZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21w
YXRpYmxlOgo+ICsgICAgY29uc3Q6IHNvcGhnbyxzZzIwNDItcGNpZS1ob3N0Cj4gKwo+ICsgIHJl
ZzoKPiArICAgIG1heEl0ZW1zOiAyCj4gKwo+ICsgIHJlZy1uYW1lczoKPiArICAgIGl0ZW1zOgo+
ICsgICAgICAtIGNvbnN0OiByZWcKPiArICAgICAgLSBjb25zdDogY2ZnCj4gKwo+ICsgIHZlbmRv
ci1pZDoKPiArICAgIGNvbnN0OiAweDFmMWMKPiArCj4gKyAgZGV2aWNlLWlkOgo+ICsgICAgY29u
c3Q6IDB4MjA0Mgo+ICsKPiArICBtc2ktcGFyZW50OiB0cnVlCj4gKwo+ICthbGxPZjoKPiArICAt
ICRyZWY6IGNkbnMtcGNpZS1ob3N0LnlhbWwjCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBh
dGlibGUKPiArICAtIHJlZwo+ICsgIC0gcmVnLW5hbWVzCj4gKyAgLSB2ZW5kb3ItaWQKPiArICAt
IGRldmljZS1pZAoKV2h5IGFyZSB0aGVzZSBJRHMgJ3JlcXVpcmVkJz8gVGhlIGRlZmF1bHQgSURz
IGFyZSBpbnZhbGlkPwoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCu
muCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
