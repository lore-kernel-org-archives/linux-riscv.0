Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA1ACD1292
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 01:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0053pN6Lhys0cvz/cf+q4jUGZWCd/DBY6mWlkkVxRA=; b=QV0v4korddTyEV
	Jbw+tA9DnbXVVJV0RJ5KG71j4yATi3JyW5Yoz16BtQTdBQkZ/YTZ9Wxke9KbLZek8NZaHDdtgreEh
	Yddky3mQ1MBL1y6n60ijYLTDv26vxuORRGL8P6BEac8rDzFML7FXw9IOr4B9qYPmMRSHAclMaS1yy
	hJaHhdHaNYTskVc4fhRCAMNI4FNBH5zRs32kYCaD32mSrPoRZ/x4H9Jibhb2C5MSxp+a2YogzxjUR
	icx0Qf2VijoEL3OoGH5MIjMBTqosbu3uAIi9q/XmrSrsCAWKLTwaNfHBORIlqum+nqKoKwmCga1X2
	vnJb2KXDBQxrLOGSqSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rteI0-0000000Dyt4-1Dnb;
	Mon, 08 Apr 2024 01:59:16 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rteHw-0000000DyqA-1fhv
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 01:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712541540; bh=CBUFjmQH02WIVVvbnA0sbD5Cd/bzgRPVp2hhqoRa7fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E4kYq9eKOtJooxpWCcKQrJwjX6upci242NdDmA0iA28+xeRCA96Fgl2+Z9uESSUiz
	 F+TxtymgA/rMlExcB1aB2FCAVygjC1Jf9stiFaCesHVJzcK3zY/dEt/H43FxdcFlwS
	 coz52loOeMJe4iSIhxABPurPNIPM1NhCGbSyIggM=
Received: from Yangyus-MBP.lan ([2406:840:f99a:b03c:2d0c:df10:d60b:b517])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id E94B6A38; Mon, 08 Apr 2024 09:58:20 +0800
X-QQ-mid: xmsmtpt1712541500t8xhrqula
Message-ID: <tencent_CF232CDF85208DF6BFA3076E73CC4E087306@qq.com>
X-QQ-XMAILINFO: N89bjyf9tBCObQqorC6TmpG61JDRuwj2CWcRR7S5bVfN11Qe4R28wWfHwuCwqB
	 UKfETuVhFAulq5d1gWbEgv/UqCrVQD8I71NoR/8HzpHppqoEuUXdZ7i7ftgSAG0WtV+i0OlTFLf9
	 elMnuaFi/jeBIIvWair+MENdAtmXfpCzAjC9EkyewF3zh9B9HfgIk7eV3B5UUPjLRqYaiqbTR0DB
	 qwwfgkgfFHEMJA3f0M+GYsjq1GOoV0+66vfS01X2IFlDHILV0uF54i06aE0h7bZx8xw0iKkWvcus
	 1rrZAoXL7lcHTXpSShHg6OZbcnVeRrO6EMeiwUJI7IIEcKC6fpVYQcM8VmOS76kpMsKMDCNrPfQp
	 lJlHw/OHfhSw8EC+dsDavmCHlnRaJ8BWB1/dOCLx2+Ye/MPwvAzy+qTJI6UpwTKKRfqIh/tYfkLQ
	 BKwb+Lku1LX4MlP7pHbvaRg0wM5EY/HmilJjYwhbphJMuNAYQzDZUMSriZSWccjR/uIlsOC6PNM1
	 3CddQGegYlMD1sf1Y/s/2hR4JyD6ypESJ+X+l8dshg35Igw3+po2Jbnc1gwEJCKqGVw12Qc4Bor0
	 hqELX097YW30mJun5j0U6Hxw/iuIkHtyLxsFJf6b/6UJYc5hprm7A5w3IifwM3GKtwFlAMxSo6Jb
	 gmV7F7MlZoE2wlChRhHZ+JjGWWCirZEL24MbNRY/LDlnhchKY5/JQ6OwBBE0HoyCdYxaZdd129ju
	 Bn5fVHNYkwLBkIEqeq42pGM0BW7friLnl4r14KBLmKZnYD+yp5FupfjvulVaUDRXOMVJNK7eE4Dh
	 ZUBFoHJEJf8hmVCTI9wv2olGqXgajDpzZbnA6gs/eDgRGR1nBAICsdhgdYVevNCbzI95nyHEkTWb
	 tL7spMtzPLrGIwsT3ZcyhGefg/1C/0d3s3sRKgCXv8Ql6tc4OszG/UldUo8KOWmGuDEjQlgw+Xwc
	 epZ80ENHYnAGKFFDEOwnuIpKt6GVqXt9Ro1UIMtme7R1y1eWCEIT6MXdJOd8DA
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: christoph.muellner@vrull.eu
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	alistair.francis@wdc.com,
	aou@eecs.berkeley.edu,
	bjorn@kernel.org,
	conor.dooley@microchip.com,
	conor@kernel.org,
	cooper.qu@linux.alibaba.com,
	dbarboza@ventanamicro.com,
	dqfext@gmail.com,
	eric.huang@linux.alibaba.com,
	heiko@sntech.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	philipp.tomsich@vrull.eu,
	samuel.holland@sifive.com,
	zhiwei_liu@linux.alibaba.com,
	guoren@kernel.org
Subject: Re: [PATCH v3 2/2] riscv: T-Head: Test availability bit before enabling MAE errata
Date: Mon,  8 Apr 2024 09:58:17 +0800
X-OQ-MSGID: <20240408015817.19081-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240407213236.2121592-3-christoph.muellner@vrull.eu>
References: <20240407213236.2121592-3-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_185912_989794_56304607 
X-CRM114-Status: GOOD (  26.17  )
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

T24gMjAyNC80LzggMDU6MzIsIENocmlzdG9waCBNw7xsbG5lciB3cm90ZToKPiBULUhlYWQncyBt
ZW1vcnkgYXR0cmlidXRlIGV4dGVuc2lvbiAoWFRoZWFkTWFlKSAobm9uLWNvbXBhdGlibGUKPiBl
cXVpdmFsZW50IG9mIFJWSSdzIFN2cGJtdCkgaXMgY3VycmVudGx5IGFzc3VtZWQgZm9yIGFsbCBU
LUhlYWQgaGFydHMuCj4gSG93ZXZlciwgUUVNVSByZWNlbnRseSBkZWNpZGVkIHRvIGRyb3AgYWNj
ZXB0YW5jZSBvZiBndWVzdHMgdGhhdCB3cml0ZQo+IHJlc2VydmVkIGJpdHMgaW4gUFRFcy4KPiBB
cyBYVGhlYWRNYWUgdXNlcyByZXNlcnZlZCBiaXRzIGluIFBURXMgYW5kIExpbnV4IGFwcGxpZXMg
dGhlIE1BRSBlcnJhdGEKPiBmb3IgYWxsIFQtSGVhZCBoYXJ0cywgdGhpcyBicm9rZSB0aGUgTGlu
dXggc3RhcnR1cCBvbiBRRU1VIGVtdWxhdGlvbnMKPiBvZiB0aGUgQzkwNiBlbXVsYXRpb24uCj4g
Cj4gVGhpcyBwYXRjaCBhdHRlbXB0cyB0byBhZGRyZXNzIHRoaXMgaXNzdWUgYnkgdGVzdGluZyB0
aGUgTUFFLWVuYWJsZSBiaXQKPiBpbiB0aGUgdGguc3hzdGF0dXMgQ1NSLiBUaGlzIENTUiBpcyBh
dmFpbGFibGUgaW4gSFcgYW5kIGNhbiBiZQo+IGVtdWxhdGVkIGluIFFFTVUuCj4gCj4gVGhpcyBw
YXRjaCBhbHNvIG1ha2VzIHRoZSBYVGhlYWRNYWUgcHJvYmluZyBtZWNoYW5pc20gcmVsaWFibGUs
IGJlY2F1c2UKPiBhIHRlc3QgZm9yIHRoZSByaWdodCBjb21iaW5hdGlvbiBvZiBtdmVuZG9yaWQs
IG1hcmNoaWQsIGFuZCBtaW1waWQKPiBpcyBub3Qgc3VmZmljaWVudCB0byBlbmFibGUgTUFFLgo+
IAo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVy
QHZydWxsLmV1Pgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgfCAx
NCArKysrKysrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2Vy
cmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiBpbmRleCA2ZTdlZTFm
MTZiZWUuLmJmNmEwYTYzMThlZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2VycmF0YS90aGVh
ZC9lcnJhdGEuYwo+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4gQEAg
LTE5LDYgKzE5LDkgQEAKPiAgICNpbmNsdWRlIDxhc20vcGF0Y2guaD5mCj4gICAjaW5jbHVkZSA8
YXNtL3ZlbmRvcmlkX2xpc3QuaD4KPiAgIAo+ICsjZGVmaW5lIENTUl9USF9TWFNUQVRVUwkJMHg1
YzAKPiArI2RlZmluZSBTWFNUQVRVU19NQUVFCQlfQUMoMHgyMDAwMDAsIFVMKQo+ICsKPiAgIHN0
YXRpYyBib29sIGVycmF0YV9wcm9iZV9tYWUodW5zaWduZWQgaW50IHN0YWdlLAo+ICAgCQkJICAg
ICB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCj4gICB7Cj4gQEAg
LTI4LDExICszMSwxNCBAQCBzdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfbWFlKHVuc2lnbmVkIGlu
dCBzdGFnZSwKPiAgIAlpZiAoYXJjaF9pZCAhPSAwIHx8IGltcGlkICE9IDApCj4gICAJCXJldHVy
biBmYWxzZTsKPiAgIAoKSSB3b3VsZCByYWlzZSBhIGxpdHRsZSBjb25jZXJuIGFib3V0IGtlZXBp
bmcgdGhpcyAiaWYiIHN0YXRlbWVudCBmb3IKYXJjaF9pZCBhbmQgaW1wX2lkIGFmdGVyIHdlIGhh
dmUgcHJvYmVkIGl0IGluIHRoaXMgQ1NSIHdheS4gSSB3b3VsZCBsaWtlIHRvCnJlbW92ZSBpdCBh
bmQgbW92ZSB0aGUgQ1NSIHByb2JlIGVhcmxpZXIgdGhhbiBSSVNDVl9BTFRFUk5BVElWRVMuCgpJ
IGFkZGVkIENDIHRvIGd1b3JlbiBmb3IgbW9yZSBvcGluaW9ucy4KCkV2ZW4gVC1IZWFkIEM5MDgg
Y29tZXMgaW4gMjAyMywgd2hpY2ggc3VwcG9ydHMgUlZWIDEuMCBhbmQgYWxzbyBrZWVwcyBNQUVF
LgpCdXQgaXQgYWxzbyBzdXBwb3J0cyBTdnBibXQsIGFuZCB3ZSBjYW4gcGVyZm9ybSB0aGUgc3dp
dGNoIGJ5IGNsZWFyaW5nIHRoZQpNQUVFIGJpdCBpbiBDU1JfVEhfTVhTVEFUVVMgaW4gTS1Nb2Rl
IFNvZnR3YXJlLgoKTW9yZW92ZXIsIFQtSGVhZCBNQUVFIG1heSBub3QgYmUgcmVtb3ZlZCBpbiB0
aGUgZnV0dXJlIG9mIFQtSGVhZCBDUFVzLiBXZQpjYW4gc2VlIHNvbWV0aGluZyBmcm9tIHRoZSBU
LUhlYWQgQzkwOCBVc2VyIE1hbnVhbCB0aGF0IGFkZHMgYSBTZWN1cml0eSBiaXQKdG8gTUFFRS4g
U28sIGl0IG1pZ2h0IHVzZWQgaW4gdGhlaXIgb3duIFRFRSBpbXBsZW1lbnRhdGlvbiBhbmQgd2ls
bCBub3QgYmUKcmVtb3ZlZC4KCkhvd2V2ZXIsIEM5MDggaGFzIGFyY2hfaWQgYW5kIGltcGlkLCB3
aGljaCBhcmUgbm90IGVxdWFsIHRvIHplcm8uIFlvdSBjYW4Kc2VlIGl0IGZyb20gdGhlIEM5MDgg
Ym9vdCBsb2cgWzJdIGZyb20gbXkgcGF0Y2ggdG8gc3VwcG9ydCBLMjMwIFszXS4gU28sIGlmCndl
IGhhdmUgcHJvYmVkIE1BRUUgdXNpbmcgQ1NSLCB5b3UgY29uZmlybWVkIHRoYXQgdGhpcyBiaXQg
d2lsbCBhbHNvIGJlIHNldAppbiB0aGUgQzkwNiBjb3JlLiBXZSBjYW4gb25seSBwcm9iZSBpdCB0
aGlzIHdheSBhbmQgbm8gbG9uZ2VyIHVzZSBhcmNoX2lkCmFuZCBpbXBfaWQuIEFuZCBpZiB0aGUg
YXJjaF9pZCBhbmQgaW1wX2lkIHByb2JlcyBnZXQgcmVtb3ZlZCwgd2Ugc2hvdWxkCmFsc28gbW92
ZSB0aGUgY3NyIHByb2JlIGVhcmxpZXIgdGhhbiByaXNjdiBhbHRlcm5hdGl2ZXMuCgpbMV0gaHR0
cHM6Ly9vY2MtaW50bC1wcm9kLm9zcy1hcC1zb3V0aGVhc3QtMS5hbGl5dW5jcy5jb20vcmVzb3Vy
Y2UvLzE2OTkyNjgzNjkzNDcvWHVhblRpZS1DOTA4LVVzZXJNYW51YWwucGRmClsyXSBodHRwczov
L2dpc3QuZ2l0aHViLmNvbS9jeXlzZWxmL2I5NDQ1ZjM4Y2MzYmExMDk0OTI0YmQ0MWM5MDg2MTc2
ClszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi90ZW5jZW50X0QxMTgwNTQx
QjRCMzFDMDM3MURCNjM0QTQyNjgxQTVCRjgwOUBxcS5jb20vCgpUaGFua3MsCllhbmd5dSBDaGVu
Cgo+IC0JaWYgKHN0YWdlID09IFJJU0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09UIHx8Cj4gLQkg
ICAgc3RhZ2UgPT0gUklTQ1ZfQUxURVJOQVRJVkVTX01PRFVMRSkKPiAtCQlyZXR1cm4gdHJ1ZTsK
PiArCWlmIChzdGFnZSAhPSBSSVNDVl9BTFRFUk5BVElWRVNfRUFSTFlfQk9PVCAmJgo+ICsJICAg
IHN0YWdlICE9IFJJU0NWX0FMVEVSTkFUSVZFU19NT0RVTEUpCj4gKwkJcmV0dXJuIGZhbHNlOwo+
ICAgCj4gLQlyZXR1cm4gZmFsc2U7Cj4gKwlpZiAoIShjc3JfcmVhZChDU1JfVEhfU1hTVEFUVVMp
ICYgU1hTVEFUVVNfTUFFRSkpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCXJldHVybiB0cnVl
Owo+ICAgfQo+ICAgCj4gICAvKgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
