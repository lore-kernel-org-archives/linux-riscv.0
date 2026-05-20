Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154D8CD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 20:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cThyRl0eW1P0n3xENDXT9ZkJu/8is3rzWSIqMc1NZbE=; b=ORXOpaqWgvZcPh
	JLAte1bghITnNrI+DRF6oHJPkjCif5APNmfpdFndJU3UD3Vs2GVs/WdJxSQGM8ZXXW+KYjf73WqAD
	pu/5YqfgHkOGGC90uwiT4nNVUhe29Emf2Yjnc7QHa22/dFix9RBUIsVvhBpHD1aXk6XVel9HwG+1B
	Y7Y0sfI/xwLRK9JGuWipuXaahrU95kns++FKkxiuOFr/rffAlOG88mIsC7FjXlod2Df2IbqH1Vek+
	XkBFWkkNrMw0oWsEu7Z8EUnQ5WitD5xzk3zFcuUQi5vThumGrpdyZ19gwk9HK1D/rh8yqWXc08R5n
	s5A5eJWVTs58k3leCr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnoD-00000005kh6-1syt;
	Wed, 20 May 2026 20:46:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPno9-00000005kgE-3rZf
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 20:46:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5EAF24E42D07;
	Wed, 20 May 2026 20:46:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B26260019;
	Wed, 20 May 2026 20:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47967107EA5AE;
	Wed, 20 May 2026 22:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1779309981;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zGsSIqVq1ifCQ3rw/2r0Ry2eIkPRdWO9epBcJ1BYbFU=;
	b=UnUPtGi/wplH2xPXVwCTFbU+qLHRfpwz13xUkIEC4Bmapzaz4OLWZ2t6TbuNMXqiD/MpnM
	tMoaObuq4xPhxAPPdovjmFNT6deXqqz+oRPVgy+fJkHXZRfr4B8w3GaOwX7wEQ8Kl2Uwsu
	wZHwxBp7kZ16ajYLEGYs1nUw91K01PirpogL7bg9telBmiVZs27KKBKPtzBkPhqCv+MA++
	+GxcROYlbiYatK3NllvRgfboqpfyIjTce0xdoLcpdxhael5qayxqcYnelguyUzjmUsKuY6
	48y68QR0lTZoFAx0ycwSFgqTMQL6bFzorNtEswEfNnPDeD1dqTsfEM3S+NNWKQ==
Message-ID: <5354f909-438b-4994-808c-6d055c58c901@rootcommit.com>
Date: Wed, 20 May 2026 22:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, tglx@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
 samuel.holland@sifive.com, unicorn_wang@outlook.com, inochiama@gmail.com,
 daniel.lezcano@linaro.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com,
 rabenda.cn@gmail.com, dlan@kernel.org, chao.wei@sophgo.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, Wang Jiayue <akaieurus@gmail.com>,
 Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v5 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S
 board support
To: Gui-Dong Han <hanguidong02@gmail.com>, Joshua Milas <josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
 <20260403111516.379795-6-josh.milas@gmail.com>
 <CALbr=LYJKJREwh8KMqsgcXwd+jx0W7gFFFuBk-izNdgzkQU6Pg@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <CALbr=LYJKJREwh8KMqsgcXwd+jx0W7gFFFuBk-izNdgzkQU6Pg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_134626_095932_F5F1A915 
X-CRM114-Status: GOOD (  13.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sm9zaHVhLCBHdWktRG9uZwoKKG15IGFwb2xvZ2llcyBmb3IgbXkgcHJldmlvdXMtZW1haWwgd2l0
aCBIVE1MIGNvbnRlbnQuLi4gYmFkIGRlZmF1bHQgClRodW5kZXJiaXJkIHNldHRpbmdzIQoKT24g
NC8yMS8yNiA2OjEzIFBNLCBHdWktRG9uZyBIYW4gd3JvdGU6Cj4gT24gRnJpLCBBcHIgMywgMjAy
NiBhdCA3OjE24oCvUE0gSm9zaHVhIE1pbGFzIDxqb3NoLm1pbGFzQGdtYWlsLmNvbT4gd3JvdGU6
Cj4+IFRoaXMgYWRkcyBpbml0aWFsIHJpc2N2IHN1cHBvcnQgZm9yIHRoZSBNaWxrLVYgRHVvIFMg
Ym9hcmQKPj4gWzFdIG1ha2luZyBpdCBwb3NzaWJsZSB0byBib290IExpbnV4IHRvIHRoZSBjb21t
YW5kIGxpbmUuCj4+Cj4+IExpbms6IGh0dHBzOi8vbWlsa3YuaW8vZHVvLXMgWzFdCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEpvc2h1YSBNaWxhcyA8am9zaC5taWxhc0BnbWFpbC5jb20+Cj4gR3JlYXQg
d29yaywgdGhhbmtzIEpvc2h1YSEgSSByZWFsbHkgbGlrZSB0aGlzIGJvYXJkLgo+Cj4gSSBlbmNv
dW50ZXJlZCB0aGUgc2FtZSBpc3N1ZSBNaWNoYWVsIE9wZGVuYWNrZXIgc2F3IGluIHY0LCBidXQK
PiBlbmFibGluZyB0aGUgTURJTy1yZWxhdGVkIGNvbmZpZ3MgcmVzb2x2ZWQgaXQuCj4KPiBJJ2xs
IGtlZXAgdXNpbmcgYW5kIHRlc3RpbmcgdGhpcyBzZXJpZXMgYW5kIHByb3ZpZGUgZnVydGhlciBm
ZWVkYmFjawo+IGlmIGFueXRoaW5nIGNvbWVzIHVwLiBOZXh0LCBJIHBsYW4gdG8gdGVzdCB0aGUg
YXJtNjQgc2lkZSBhbmQgd2lsbAo+IGFsc28gdHJ5IGRldmVsb3BpbmcgYW4gZWZ1c2UgZHJpdmVy
Lgo+Cj4gVGVzdGVkLWJ5OiBHdWktRG9uZyBIYW4gPGhhbmd1aWRvbmcwMkBnbWFpbC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEd1aS1Eb25nIEhhbiA8aGFuZ3VpZG9uZzAyQGdtYWlsLmNvbT4KCldoYXQg
YWJvdXQgc3VibWl0dGluZyBhIG5ldyBpdGVyYXRpb24gb2YgeW91ciBwYXRjaHNldD8gSSBndWVz
cyB0aGUgbGFzdCAKb25lIHdhcyB0b28gY2xvc2UgdG8gdGhlIG1lcmdlIHdpbmRvdyB0byBtYWtl
IGl0LCBidXQgaWYgeW91IHN1Ym1pdCBhIApuZXcgdmVyc2lvbiBub3QgdG9vIGxhdGUgYW5kIHJl
dmlldyBpdCBxdWlja2x5IGVub3VnaCwgd2UgY291bGQgbWFrZSBpdCAKdGhpcyB0aW1lLgoKRG9u
J3QgaGVzaXRhdGUgdG8gbGV0IHVzIGtub3cgaWYgeW91IG5lZWQgaGVscCAoaGFwcHkgdG8gcG9z
dCB0aGUgbmV3IAppdGVyYXRpb24gaWYgeW91IGRvbid0IGhhdmUgdGltZSkuCgpUaGFua3MgaW4g
YWR2YW5jZQpDaGVlcnMKTWljaGFlbC4KCi0tIApSb290IENvbW1pdApFbWJlZGRlZCBMaW51eCBU
cmFpbmluZyBhbmQgQ29uc3VsdGluZwpodHRwczovL3Jvb3Rjb21taXQuY29tCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
