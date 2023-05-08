Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2894C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3z99Sh20WAU5HyQULGaLl8oWtuXBGCojfjXtaoRRIY=; b=W8x3LPFcmj4noq
	un1jceLiDThjDXxnQRwEJwafB4v6eoP0XPxnmuzeKk3BnUH1AfAQD3p1qNzXaA4+zW5nAQODtva1d
	gsSnsCNc1a9bWhTjMCqjPviZEqwWPs4O+rXBmW5cbpSI9QGsNWiAOjFBfwL1aiFzg2E3Md0i0xVpC
	tS37fhXQTpisCA+nzkx7wTbDUXLk8uBwqJ5/aDGvCnN30hyDO2M032vGLXS2281OPX8ATB0bSZkwt
	qw0u9LCE3YkOMGz4hhH9XBmA+LHgZpfek96LFN8SMCPR2SI8rCE3yBssnFdfwVWswxE72r0IWpqzJ
	sPuc4ZWWC9UdKVPXojTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3bW-000x2k-0r;
	Mon, 08 May 2023 16:20:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3bT-000x2E-0K
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 16:20:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C484C6144F;
	Mon,  8 May 2023 16:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86282C433EF;
	Mon,  8 May 2023 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683562845;
	bh=hNKbhjXj4sq7siJDAnA0CwKqmHnlz6fdow6mqG667FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vC/3ScToQKhedFLfxUFSJ3aCnIFQ0ilNTcZmOvWfnMTfly0Y9+O7vzM0QHX8Y06eC
	 c7fRRlONd+f2NO7xa8jTaXN8agDMHkEG8a4KmDON8G0osb5Jw5TwquFB8n360h6lfd
	 BpC7Hi39UPl1zzmAVZ77ZoVtKVB+17cKZLXXIjjkC+zQvGKcv4oOFR1pxeku74nVFS
	 7XkdKiTUMB59g96XuAhNv9sDvb9ckYlFLNH8M/FOw3VLSMZh8Mm/IVuasrRHULRqS9
	 /48L1lKQrFX8SbG3gt16Mv5iEMzBQsWJ+3vdWEi3JbSXSSco99OeSo8rpK0PXtNp/P
	 LVmby35lajZAw==
Date: Tue, 9 May 2023 00:09:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/5] irqchip/sifive-plic: Support T-HEAD's C910 PLIC
Message-ID: <ZFkewiBpnxCigI0G@xhacker>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-2-jszhang@kernel.org>
 <CAJF2gTTni=G5FP80rSArErXGWQatR1P8rCy9nNOggeA4vtXftQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTni=G5FP80rSArErXGWQatR1P8rCy9nNOggeA4vtXftQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_092047_251569_83EE78FC 
X-CRM114-Status: GOOD (  19.73  )
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

T24gTW9uLCBNYXkgMDgsIDIwMjMgYXQgMDI6NTI6MjlQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBNb24sIE1heSA4LCAyMDIzIGF0IDI6MzTigK9BTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBULUhFQUQncyBDOTEwIFBMSUMgc3RpbGwg
bmVlZHMgdGhlIGRlbGVnYXRpb24gYml0IHNldHRpbmd0byBhbGxvdwo+ID4gYWNjZXNzIGZyb20g
Uy1tb2RlLCBidXQgaXQgZG9lc24ndCBuZWVkIHRoZSBlZGdlIHF1aXJrLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4g
IC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1s
ICAgICAgfCA0ICsrKysKPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lm
aXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gaW5kZXggZjc1NzM2YTA2MWFmLi42NGI0M2EzYzM3NDgg
MTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGlj
LTEuMC4wLnlhbWwKPiA+IEBAIC02Miw2ICs2MiwxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAg
ICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtcGxpYwo+ID4gICAgICAgICAgICAgICAgLSBjYW5h
YW4sazIxMC1wbGljCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IHNpZml2ZSxwbGljLTEuMC4wCj4g
PiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBlbnVtOgo+ID4gKyAgICAgICAgICAg
ICAgLSB0aGVhZCxsaWdodC1wbGljCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHRoZWFkLGM5MTAt
cGxpYwo+ID4gICAgICAgIC0gaXRlbXM6Cj4gPiAgICAgICAgICAgIC0gZW51bToKPiA+ICAgICAg
ICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjIwaS1kMS1wbGljCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZp
dmUtcGxpYy5jCj4gPiBpbmRleCBlMTQ4NDkwNWI3YmQuLjcxYWZhMmE1ODRkOSAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+ID4gKysrIGIvZHJpdmVy
cy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gPiBAQCAtNTY5LDYgKzU2OSw3IEBAIHN0YXRp
YyBpbnQgX19pbml0IHBsaWNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gPiAgfQo+
ID4KPiA+ICBJUlFDSElQX0RFQ0xBUkUoc2lmaXZlX3BsaWMsICJzaWZpdmUscGxpYy0xLjAuMCIs
IHBsaWNfaW5pdCk7Cj4gPiArSVJRQ0hJUF9ERUNMQVJFKHRoZWFkX2M5MTBfcGxpYywgInRoZWFk
LGM5MTAtcGxpYyIsIHBsaWNfaW5pdCk7Cj4gPiAgSVJRQ0hJUF9ERUNMQVJFKHJpc2N2X3BsaWMw
LCAicmlzY3YscGxpYzAiLCBwbGljX2luaXQpOyAvKiBmb3IgbGVnYWN5IHN5c3RlbXMgKi8KPiA+
Cj4gPiAgc3RhdGljIGludCBfX2luaXQgcGxpY19lZGdlX2luaXQoc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlLAo+ID4gLS0KPiA+IDIuNDAuMAo+ID4KPiBvcGVuc2JpIG5lZWRzIHRoZWFkLGM5MDAt
cGxpYywgYW5kIHdlIGNvdWxkIHB1dCBtdWx0aSBjb21wYXRpYmxlIG5hbWUKPiBpbiB0aGUgZHRz
LiBTbywgaXQncyBubyBuZWVkIGhlcmUuCgpUaGFua3MsIEkgbWlzdW5kZXJzdG9vZCB0aGUgUExJ
QyBlZGdlIHF1aXJrLiBUaGlzIHBhdGNoIGlzbid0IG5lZWRlZCBhbnkKbW9yZS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
