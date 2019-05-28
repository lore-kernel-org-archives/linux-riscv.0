Return-Path: <SRS0=WwmX=T4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EE5C04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 28 May 2019 15:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA9A208C3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 28 May 2019 15:36:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbL8Cz+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA9A208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwTYVFvtSD2DsnimE59PCQV0hpEMHk/qAu+iXkMvsrw=; b=DbL8Cz+1CXDqsz
	+E5T4QvIFGVb24LIvVxOc623SKycH/a6XQhyB1eP6X2My4+2IlzMvaN7ir+RBp2PY6XB7+t2GeHwU
	HSL5C56n/icfhdlcwPHruiptyoR+bZB3s4P/XdOsx2U3WZNfuo9grDsZMVqj3gM8VQQENl5ClRpgD
	d6X8BydvIFNeiYj9IGMZH9uxCI6ArusqPrLgxHivQQqmR/4AqZUG/d+7xnw9qBLZIA2yu9cZvaqJP
	HhLoqlF8gDICoy9Vwaerku0BjylLSOCzRyPymeTSypoGCKCS7/y2S0wU9467jmxh/MY0N+X1jFmaq
	7YRu772M6J4Chsg+UTyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVe8w-0002m7-NU; Tue, 28 May 2019 15:36:02 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVe8k-0002lW-G7
 for linux-riscv@lists.infradead.org; Tue, 28 May 2019 15:35:57 +0000
Received: from excalibur.cnev.de ([194.8.209.98]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mr9O4-1greUz32BS-00oJRo; Tue, 28 May 2019 17:35:43 +0200
Received: from karsten by excalibur.cnev.de with local (Exim 4.89)
 (envelope-from <merker@debian.org>)
 id 1hVe8c-0001uJ-Ri; Tue, 28 May 2019 17:35:42 +0200
Date: Tue, 28 May 2019 17:35:42 +0200
From: Karsten Merker <merker@debian.org>
To: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: Testing the recent RISC-V DT patchsets
Message-ID: <20190528153542.jfkkwycyc3vu6hld@excalibur.cnev.de>
References: <alpine.DEB.2.21.9999.1904221705170.18377@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1905280105110.20842@viisi.sifive.com>
 <86o93mpqbx.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86o93mpqbx.fsf@baylibre.com>
X-No-Archive: yes
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:q1RFbpS43fZk0cIEvnP3mp71E4gqF5+PmQXoFepr6Zzd9xwJRNx
 XZlPVk5Bwiu22vHbMzOpVPGOlsIrjuhRDwTzHdGXKQaOIM+P6XiM+enH/QqmGPecYntTJZU
 z2z9VpYwKAEn1BtqxRd0egnxVe42ZHuc8KoLlERu3/FPIyd452Mw16S7vIUwT6lVKXuXQfs
 Y2WXpbet5ildzafT72g2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MlSVCLPxWJk=:iSdZjF3rN3lUWzuNAX4hpC
 8E41MTvMzjQ7s71CIfK26w6NemSFWsZEsnJRGyurrm9IR8X34vRhgo+s8otFU3uPvmkd7N2Ia
 lcszkOZX8exczPdKO5Po9suy7YghTDfUGW6Lr5FItX1k8UClIRtz0/PUvUpaGzPMAYTh3hzWZ
 8ji5iwfDOYxx529YKvy1oultMOtBaiaqtGXdwHYkD2UPRgUD6xZwuduYxxErGAKVSuz49T2do
 a5z9wSuDHJJV9XDPBaNQolGoGHuyZrYYngQLfgMOKDqlIRfBbBJZ7FnDCu8TWP7uqK/TdgKIQ
 ASEgjt1HRnPpCuZzn6Fskp2dyKCHnHwG5m+GHfUo7L0V9v1vPSvfQ8mc0q82/YNMlHQbg3qgI
 5+Oqir23QukEHvrzwCTzaIyAffRtftp0+tQiYiokYU1T5Dm3LE5vxzN2XyzeNBF3o2++dWBxz
 bkX3jJ/tVrSK6n2tziepoMQQTKrL2eGSIIRr5LAdch82gGxF3w6OTA4h9cCd3TYRduwwcV/2W
 CWFMZg+NNYHXqbGtXy8sytP5+Y/WWsZ6ZOdpXCMc+djyY4/BRiqEnBq5xsRBqaS7ngyiknnG+
 zvfrWZvjfQv/0IumXrjQFytH2p2GP5KUXlLn0blz0/0QjrFjsH32t10+nEX9IDm0k2vzFo3rn
 H+vImuXSBqkBs5JCB1N9WSHfyLQqZpGGC8CXjTT/73qiWTWSs0EWrmkVWMnlp/6nKWn4wq12e
 T4eTtyxL15bq4VfHxXGvrHfvuW+8ClK0PzkOPg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_083551_895262_DCC06DA8 
X-CRM114-Status: GOOD (  17.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDU6MTA6NDJQTSArMDIwMCwgTG95cyBPbGxpdmllciB3
cm90ZToKPiBPbiBUdWUgMjggTWF5IDIwMTkgYXQgMDE6MzIsIFBhdWwgV2FsbXNsZXkgPHBhdWwu
d2FsbXNsZXlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gCj4gPiBBbiB1cGRhdGUgZm9yIHRob3NlIHRl
c3RpbmcgUklTQy1WIHBhdGNoZXM6IGhlcmUncyBhIG5ldyBicmFuY2ggb2YgCj4gPiByaXNjdi1w
ay9iYmwgdGhhdCBkb2Vzbid0IHRyeSB0byByZWFkIG9yIG1vZGlmeSB0aGUgRFQgZGF0YSBhdCBh
bGwsIHdoaWNoIAo+ID4gc2hvdWxkIGJlIHVzZWZ1bCB1bnRpbCBVLUJvb3Qgc2V0dGxlcyBkb3du
LgpbLi4uXQo+ID4gSGVyZSBpcyBhbiBMaW51eCBrZXJuZWwgYnJhbmNoIHdpdGggdXBkYXRlZCBE
VCBkYXRhIHRoYXQgY2FuIGJlIGJvb3RlZCAKPiA+IHdpdGggdGhlIGFib3ZlIGJvb3Rsb2FkZXI6
Cj4gPgo+ID4gICAgaHR0cHM6Ly9naXRodWIuY29tL3NpZml2ZS9yaXNjdi1saW51eC90cmVlL2Rl
di9wYXVsdy9kdHMtdjUuMi1yYzEtZXhwZXJpbWVudGFsCj4gPgo+ID4gQSBzYW1wbGUgYm9vdCBs
b2cgZm9sbG93cywgdXNpbmcgYSAnZGVmY29uZmlnJyBidWlsZCBmcm9tIHRoYXQgYnJhbmNoLiAg
Cj4gCj4gVGhhbmtzIFBhdWwsIEkgY2FuIGNvbmZpcm0gdGhhdCBpdCB3b3Jrcy4KPiAKPiBTb21l
dGhpbmcgaXMgc3RpbGwgdW5jbGVhciB0byBteXNlbGYuCj4gVXNpbmcgRlNCTCArIHJpc2N2LXBr
L2JibCB0aGUgbGludXgga2VybmVsICsgZGV2aWNlIHRyZWUgYm9vdHMuCj4gTmVpdGhlciBGU0JM
IG5vciByaXNjdi1way9iYmwgYXJlIG1vZGlmeWluZyB0aGUgRFQuCj4gCj4gVXNpbmcgRlNCTCAr
IE9wZW5TQkkgKyBVLUJvb3QgdGhlIHNhbWUga2VybmVsICsgZGV2aWNlIHRyZWUgaGFuZ3Mgb24K
PiBydW5uaW5nIC9pbml0Lgo+IAo+IFdvdWxkIHlvdSBoYXZlIGFueSBwb2ludGVyIG9uIHdoYXQg
cmlzY3YtcGsgZG9lcyB0aGF0IE9wZW5TQkkvVS1ib290IGRvZXNuJ3QgPwo+IE9yIG1heWJlIGl0
IGlzIHRoZSBvdGhlciB3YXkgYXJvdW5kIC0gT3BlblNCSS9VLWJvb3QgZG9lcyBzb21ldGhpbmcg
dGhhdAo+IGV4dHJhIHRoYXQgc2hvdWxkIG5vdCBoYXBwZW4uCgpIZWxsbywKCkkgZG9uJ3Qga25v
dyB3aGljaCB2ZXJzaW9uIG9mIE9wZW5TQkkgeW91IGFyZSB1c2luZywgYnV0IHRoZXJlIGlzCmEg
cHJvYmxlbSB3aXRoIHRoZSBjb21iaW5hdGlvbiBvZiBrZXJuZWwgNS4yLXJjMSBhbmQgT3BlblNC
SQp2ZXJzaW9ucyBiZWZvcmUgY29tbWl0CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9vcGVu
c2JpL2NvbW1pdC80ZTJjZDQ3ODIwODUzMWM0NzM0MzI5MGYxNWI1NzdkNDBjODI2NDljCgp0aGF0
IGNhbiByZXN1bHQgaW4gYSBoYW5nIG9uIGV4ZWN1dGluZyBpbml0LCBzbyBpbiBjYXNlIHlvdQpz
aG91bGQgYmUgdXNpbmcgYW4gb2xkZXIgT3BlblNCSSBidWlsZCB0aGF0IG1pZ2h0IGJlIHRoZSBz
b3VyY2UKb2YgdGhlIHByb2JsZW0gdGhhdCB5b3UgYXJlIGV4cGVyaWVuY2luZy4KClJlZ2FyZHMs
CkthcnN0ZW4KLS0gCkljaCB3aWRlcnNwcmVjaGUgaGllcm1pdCBhdXNkcsO8Y2tsaWNoIGRlciBO
dXR6dW5nIHNvd2llIGRlcgpXZWl0ZXJnYWJlIG1laW5lciBwZXJzb25lbmJlem9nZW5lbiBEYXRl
biBmw7xyIFp3ZWNrZSBkZXIgV2VyYnVuZwpzb3dpZSBkZXIgTWFya3QtIG9kZXIgTWVpbnVuZ3Nm
b3JzY2h1bmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
