Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B85C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tE9EdDAHIFlACY0+C0C6XoKSGCFo1vd0PrQwww2L4Cw=; b=tOw993XIXqkpJ8
	fwberthqaq7hXmKgFYAwmZEKcKQZewD6JlhmHOcAva83TSdqkTKCVLPLG72rN2nCYulnLVhSX9oUB
	yowdZmrjTZZDUoCKkFeNtD/zLL0fJd1PdaApKBLnPshq9KoAEuAr0fyDRsJnhF5g6zhELZkhD1k/M
	Ia/6dfyhU8Jok27Dc4Jl3uvBj2vo7WEdL7r01PZnRFvhLPV5eJJ8yMparBgvc6WRLAflocNeHSFZR
	jCu+SObI0POdgxZ/haLnhGopS+QhtirRwUPd4Ud+xO3W6IKw+Wr59VYcG2Wrl3zTSPd9nwrX/Prjb
	XbIsgu7VSRh+F3ghm7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8f9-00000003dSQ-2wsa;
	Tue, 25 Jun 2024 16:04:55 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8f6-00000003dRe-2WXS
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 16:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1719331481; bh=DFA9ATURDnDHmT+JTZbTU4zjVWWw3GnhqNiNhKiKk5E=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=M6/+Z+w1qRSvCyQ0g36NERwS3l2/FZ3cV89yeWqB9MCEFNTFnadc26X6tp6tdc5wc
	 pCUAJR1Yo/+KMuyDlyfhtc7i5YSxhtXgxCeCEy0ISdNMwljzmHmOdI3EFKV/YTfCXN
	 Mi3M96lyW+uXGMCXZMw01Mbmb6o70ON96cnk30gs=
Received: from smtpclient.apple ([2408:8207:18a1:c8b0:f5fa:3cc7:251d:184a])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id 1251260D; Wed, 26 Jun 2024 00:04:37 +0800
X-QQ-mid: xmsmtpt1719331477t7a5x97rd
Message-ID: <tencent_B61C9F718362BC42F61A8BF95A046BB44D09@qq.com>
X-QQ-XMAILINFO: NfHsM/dq2nWI8qGjggedwfiwSv+7cxrMVxIdxyxZk5tawVnqa9TJNjGTXSdokx
	 yRygcOG6PkSKP7UlCCBYRTQWZnKZdsMDCs+ppB8n2diKK2Re283eWXa+EBw8Z1JUvBVSnYZ/WHbJ
	 mOnIibbT3pBxrvC/tIWArW4jXso5Mrks3yLoMUK0jhEJlKw/HHlHtC0hyVCpTELbDz7uq4XGhXLd
	 5QM+UoXxjraNPcJi9qiMxAd/vDmm/vpjhTlFNtQ1QXFav3JfpqFqaChk/DdQgKdg/tQvYlOetAZB
	 ZxG9zY5rB5qNtZUvYzM14PCqj1VUItdSYvW74cBpI1y6ZKv4Kwkn/k/YIHb9sJnSuJ2QXbziikJE
	 JzeoM3uncUGJHBdJt7GxXROxgZofkyDh9k3KbBfLQQvy0M+4TEtxGiOaTSXJR4/8epICblISBjNP
	 2BG6OkfvAK+iQmNLOKzPWKs5z8/9Bl8S+9wxJ2xvIZL6H4C2Kazk4Hy93A+s8dgtgxkJHlgtkl66
	 3IL9MoNMLQhB4C0EQQD/yIaKzwyjW6Zi11IH7ThOrj3kbi8u+v07LDlz2Y8yAz6AayJAIB+iO6kw
	 XU/SF8Hff3X9XCnKFnYT8BccVR9RRw8WgdYRgATcbhp8H8hZxXKghscMTsYTwTH3+SnHhP3VRcs6
	 n4eUWJWMzKX5is9MPeBl2ehaMl4cWPeSvmrJWBHD330lm9rSVFg47npfOrPB4t3Pdm4Mn+YX5SWG
	 R/XZa7rGWiP20prkCrB8lLLFp9g7XOKTHHC2PCsNfIe6A1IjJHbJF7zMDLBgQ6IH8AaY87Uv76xl
	 GgIiZDI9lP/U+bh2cY/IKLlwrViEUR59GF5M2q1+Ph2ZownIi8vj6r0FMDWqyqulSaloGDx/qKLq
	 TSsQTdf8ScaWEwRJqiWZpQ8cnCW1FdSh1vCz8CIG+93x8T01gaLIa/eweYo4Wxy1Hp8+nRkmLXB2
	 JWfUHTL12RzVaTIIutEgjwTf0ERBtUX7vZkxgcvwi7tjfdJHNT4w8cRmrsZPN3XAPzXVE+taY=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: (subset) [PATCH RESEND v8 0/6] riscv: add initial support for
 Canaan Kendryte K230
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240619-hammock-drum-04bfc16a8ef6@spud>
Date: Wed, 26 Jun 2024 00:04:22 +0800
Cc: linux-riscv@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-OQ-MSGID: <FA81E124-32CF-4158-AA34-1EA0B603B027@cyyself.name>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
 <20240410-unwoven-march-299a9499f5f4@spud>
 <20240619-hammock-drum-04bfc16a8ef6@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_090453_432407_16978BE0 
X-CRM114-Status: GOOD (  23.45  )
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

Cgo+IE9uIEp1biAxOSwgMjAyNCwgYXQgMTg6NDUsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gCj4gT24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMTE6MzA6MjVBTSArMDEw
MCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+PiAKPj4gT24gTW9uLCAwOCBBcHIgMjAyNCAwMDoyNjo1OCArMDgw
MCwgWWFuZ3l1IENoZW4gd3JvdGU6Cj4+PiBLMjMwIGlzIGFuIGlkZWFsIGNoaXAgZm9yIFJJU0Mt
ViBWZWN0b3IgMS4wIGV2YWx1YXRpb24gbm93LiBBZGQgaW5pdGlhbAo+Pj4gc3VwcG9ydCBmb3Ig
aXQgdG8gYWxsb3cgbW9yZSBwZW9wbGUgdG8gcGFydGljaXBhdGUgaW4gYnVpbGRpbmcgZHJpdmVy
cwo+Pj4gdG8gbWFpbmxpbmUgZm9yIGl0Lgo+Pj4gCj4+PiBUaGlzIGtlcm5lbCBoYXMgYmVlbiB0
ZXN0ZWQgdXBvbiBmYWN0b3J5IFNESyBbMV0gd2l0aAo+Pj4gazIzMF9ldmJfb25seV9saW51eF9k
ZWZjb25maWcgYW5kIHBhdGNoZWQgbWFpbmxpbmUgb3BlbnNiaSBbMl0gdG8gc2tpcAo+Pj4gbG9j
a2VkIHBtcCBhbmQgc3VjY2Vzc2Z1bGx5IGJvb3RlZCB0byBidXN5Ym94IG9uIGluaXRyZCB3aXRo
IHRoaXMgbG9nIFszXS4KPj4+IAo+Pj4gWy4uLl0KPj4gCj4+IEFwcGxpZWQgdG8gcmlzY3YtZHQt
Zm9yLW5leHQsIHRoYW5rcyEKPj4gCj4+IFsxLzZdIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIFQt
SEVBRCBDOTA4IGNvbXBhdGlibGUKPj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nvbm9y
L2MvNjRjYmM0NmJiODU0Cj4+IFsyLzZdIGR0LWJpbmRpbmdzOiBhZGQgQ2FuYWFuIEsyMzAgYm9h
cmRzIGNvbXBhdGlibGUgc3RyaW5ncwo+PiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29u
b3IvYy9iMDY1ZGExM2VhOWMKPj4gWzMvNl0gZHQtYmluZGluZ3M6IHRpbWVyOiBBZGQgQ2FuYWFu
IEsyMzAgQ0xJTlQKPj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvYjNhZTc5
NmQwYTRmCj4+IFs0LzZdIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogQWRkIENh
bmFhbiBLMjMwIFBMSUMKPj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvZGI1
NGZkYTExYjEzCj4+IFs1LzZdIHJpc2N2OiBkdHM6IGFkZCBpbml0aWFsIGNhbm12LWsyMzAgYW5k
IGsyMzAtZXZiIGR0cwo+PiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy81ZGIy
YzRkYzQxM2UKPiAKPiBBZnRlciBzb21lIGRpc2N1c3Npb24gb24gdGhlIGsxIHRocmVhZAo+ICho
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWm5FT1U3RDAwSjhKenktMUB4aGFja2VyLywgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1puQTZwWkxrSTJTdFA4SGhAeGhhY2tlci8pCj4gSSBh
bSBnb2luZyB0byBkcm9wIHRoaXMgc2VyaWVzLiBJdCdzIG5vdCB2ZXJ5IHVzZWZ1bCBpbiB0aGUg
Y3VycmVudAo+IHN0YXRlIGFuZCB0aGVyZSdzIG5vdCByZWFsbHkgYmVlbiBhbnkgaW50ZXJlc3Qg
ZnJvbSBwZW9wbGUgaW4gZ2V0dGluZwo+IHRoZSBwbGF0Zm9ybSB0byBhIG1vcmUgY29tcGxldGUg
c3RhdGUuIEppc2hlbmcgbWFkZSBzb21lIGdvb2QgcG9pbnRzIGluCj4gdGhlIGsxIHRocmVhZCBh
Ym91dCB0aGUgbWlzc2luZyBjbG9jayBjb250cm9sbGVyIHN0dWZmLCBhbmQgSSB0aGluayBJJ20K
PiBnb2luZyB0byBtYWtlIGhhdmluZyBiYXNpYyB0aGluZ3MgbGlrZSBjbG9ja3MgYW5kIHdoZXJl
IGFwcGxpY2FibGUKPiByZXNldHMgYW5kIHBpbmN0cmwgdGhlIG1pbmltdW0gcmVxdWlyZW1lbnQg
Zm9yIHRoZSBwbGF0Zm9ybXMgSSdtIGxvb2tpbmcKPiBhZnRlci4KPiAKPiBJJ3ZlIHRocm93biB0
aGVzZSBwYXRjaGVzIGludG8gbXkgdHJlZToKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9jb25vci9saW51eC5naXQvbG9nLz9oPWsyMzAtYmFzaWMKPiAK
PiBJIGRvIGhhdmUgb25lIG9mIHRoZXNlIGJvYXJkcywgYnV0IEknbSBmYWlybHkgbGltaXRlZCBh
dCB0aGUgbW9tZW50IGJldHdlZW4KPiB0aGUgdmFyaW91cyBsaW51eC1yZWxhdGVkIGFuZCB3b3Jr
IGRlbWFuZHMgb24gbXkgdGltZSwgc28gaXQncyBwcmV0dHkKPiB1bmxpa2VseSB0aGF0IEknbGwg
ZG8gYW55dGhpbmcgd2l0aCBpdCBteXNlbGYuCj4gCgpPSy4gSSB1bmRlcnN0YW5kIGFib3V0IHRo
aXMuIEkgZG8gc29tZSBpbml0aWFsIHN1cHBvcnQgZm9yIEsyMzAKb25seSBmb3IgbXkgZXZhbHVh
dGlvbiBwdXJwb3NlIGFuZCBwcm9wb3NlIHRoaXMgdHJlZSB0byBwcm92aWRlCmluZm9ybWF0aW9u
IGZvciBvdGhlcnMgdG8gYm9vdCB1cCBhIG1pbmltYWwga2VybmVsIGFuZCBhbHNvIGhhdmUKYW5v
dGhlciBwYXRjaCBbMV0gdG8gaGF2ZSBhIFVTQiBub2RlIHNvIHdlIHdpbGwgYWJsZSB0byBydW4g
YSBkaXN0cm8KbGlrZSBEZWJpYW4gb3ZlciBORlMgcm9vdGZzIGJ5IFVTQiBldGhlcm5ldCB3aGlj
aCBpcyBvbiBjYW5tdiBrMjMwCmJvYXJkLgoKQnV0IEkgd2FudCB0byBzYXkgSSBtYXkgaGF2ZSBu
byB0aW1lIHRvIGRvIGZ1cnRoZXIgZHJpdmVyIGRldmVsb3BtZW50LgpJIGhhdmUgZG9uZSB0aGlz
IGZvciBteSBldmFsdWF0aW9uIHB1cnBvc2UgdG8gZ2V0IHNvbWUgcGVyZm9ybWFuY2UKbWV0cmlj
cyBvbiByZWFsIFJWViBjaGlwcyBmb3IgcmVzZWFyY2ggdXNhZ2Ugc2luY2UgSeKAmW0gYSBQaC5E
LgpzdHVkZW50IGZvY3VzZWQgb24gY29tcHV0ZXIgYXJjaGl0ZWN0dXJlLiBJIGhhdmUgdG8gZGV2
b3RlIG15IHRpbWUKdG8gbXkgcmVzZWFyY2ggd29yay4KCklmIGFueW9uZSB3YW50cyB0byBkbyBz
b21lIGZ1cnRoZXIgZHJpdmVyIGRldmVsb3BtZW50LCBwbGVhc2UgZG9u4oCZdApoZXNpdGF0ZSB0
byBkbyBzby4gRG9u4oCZdCBpbWFnaW5lIEkgbWF5IGJlIGRvaW5nIHRoaXMsIHNvIHlvdSBtYXkK
ZG8gZHVwbGljYXRlIHdvcmsuIEnigJltIHRvbyBidXN5IHRvIGRvIHRoYXQuCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvdGVuY2VudF9FOUI4NTMzMTZEMjE3QjhEMUU3
Q0RGODI4OERBNUU4RUQ5MDhAcXEuY29tLwoKVGhhbmtzLApZYW5neXUgQ2hlbgoKPiBUaGFua3Ms
Cj4gQ29ub3IuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
