Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63513C54E76
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sK/zLAaNHCr8oVWF7QpF3G92abYJb0bIhOU1tmStiUk=; b=iooHW+nTXYmQx/
	C+uqTREgRzOXQwbkCDfmaWSIRNYqOuH57rpnt7D1NWrQwmcgqAojwS8JQR67sgKNaLinHiCx48DoY
	OjflIfiY9zg1KT6uTIUi33S8bqZ3QNdeLnnPb8t0N2RpR59gbq3Q+fyWixzAzEyUXcT7oZPS/keNV
	X5zeD9txtnkWRIbnP3A6JPrmC9b5uHtvoFJ9qdX9exkXZ9DBhNkvf/T2oFDEQd87xmr8lWzA11gAV
	51kZF6GfDp1TGAZGRHOE7LUTzUUMiXF52hzFGekSSzx3jU1tYKiTnJWKpM0bk8GJU2mobutDLRFCE
	uPikYwF6aaD/UAPtgW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r512t-00Bi4D-0A;
	Mon, 20 Nov 2023 09:58:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r512j-00Bhyz-0p;
	Mon, 20 Nov 2023 09:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RRH8ihRwgqqNWiOQXVgz2lSe5cF5QqM2TrvGcFPpVxQ=; b=eAF0KRxgbthRFbPQ6izZC3J3oy
	NoICC18OIT3Qs7cMSCHEyKdPJVEqlqYYz46JeVVogCAoBWUhXiyxhy9SzyCivvREMDfvxXZSrMpqk
	BHZ3abqeLK7FySm29lIYiV3szbHsZGZ0MEwL9YBdWcQ/tt0m9Epi+ARclf048DAo9sTRBExtXyU2Y
	OWqc0bZ0sBPg5y7tECdJwrgrcIV0utpcws+XvnYsepZe+SO7zSvE1M0Dc3TnoMMhyx+qLFfvV/gAy
	zBVN1YBhtJaSqBUjieLhtAr5Xh4FKBvt+x6MQT63nLwsYbtpT2WmNNA7nk4PLOb78D4oGUQs88/cg
	AGe8pcpA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43368)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r512Z-0005Gn-2Y;
	Mon, 20 Nov 2023 09:58:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r512Z-00034w-8Z; Mon, 20 Nov 2023 09:58:03 +0000
Date: Mon, 20 Nov 2023 09:58:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jianyong Wu <Jianyong.Wu@arm.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Justin He <Justin.He@arm.com>, James Morse <James.Morse@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 34/39] arm64: psci: Ignore DENIED CPUs
Message-ID: <ZVstq+vhQSP73Nua@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <E1qvJBQ-00AqS8-8B@rmk-PC.armlinux.org.uk>
 <DB9PR08MB7511B178CA811C412766FDBAF4B0A@DB9PR08MB7511.eurprd08.prod.outlook.com>
 <ZVsl1ZQ9JRXPf4qH@shell.armlinux.org.uk>
 <DB9PR08MB7511C8825028074748FBB967F4B4A@DB9PR08MB7511.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB9PR08MB7511C8825028074748FBB967F4B4A@DB9PR08MB7511.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_015813_294607_0572E10F 
X-CRM114-Status: GOOD (  25.77  )
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

T24gTW9uLCBOb3YgMjAsIDIwMjMgYXQgMDk6MzY6MDVBTSArMDAwMCwgSmlhbnlvbmcgV3Ugd3Jv
dGU6Cj4gCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogUnVzc2Vs
bCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gPiBTZW50OiAyMDIz5bm0MTHmnIgyMOaX
pSAxNzoyNQo+ID4gVG86IEppYW55b25nIFd1IDxKaWFueW9uZy5XdUBhcm0uY29tPgo+ID4gQ2M6
IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZzsgbG9vbmdhcmNoQGxpc3RzLmxpbnV4LmRldjsKPiA+
IGxpbnV4LWFjcGlAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcmNoQHZnZXIua2VybmVsLm9yZzsK
PiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IGt2bWFy
bUBsaXN0cy5saW51eC5kZXY7IHg4NkBrZXJuZWwub3JnOwo+ID4gbGludXgtY3NreUB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7Cj4gPiBsaW51eC1pYTY0QHZnZXIu
a2VybmVsLm9yZzsgbGludXgtcGFyaXNjQHZnZXIua2VybmVsLm9yZzsgU2FsaWwgTWVodGEKPiA+
IDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgSmVhbi1QaGlsaXBwZSBCcnVja2VyIDxqZWFuLXBo
aWxpcHBlQGxpbmFyby5vcmc+Owo+ID4gSnVzdGluIEhlIDxKdXN0aW4uSGVAYXJtLmNvbT47IEph
bWVzIE1vcnNlIDxKYW1lcy5Nb3JzZUBhcm0uY29tPjsKPiA+IENhdGFsaW4gTWFyaW5hcyA8Q2F0
YWxpbi5NYXJpbmFzQGFybS5jb20+OyBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPjsKPiA+
IE1hcmsgUnV0bGFuZCA8TWFyay5SdXRsYW5kQGFybS5jb20+OyBMb3JlbnpvIFBpZXJhbGlzaQo+
ID4gPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMzQvMzld
IGFybTY0OiBwc2NpOiBJZ25vcmUgREVOSUVEIENQVXMKPiA+IAo+ID4gT24gVGh1LCBOb3YgMTYs
IDIwMjMgYXQgMDc6NDU6NTFBTSArMDAwMCwgSmlhbnlvbmcgV3Ugd3JvdGU6Cj4gPiA+IEhpIFJ1
c3NlbGwsCj4gPiA+Cj4gPiA+IE9uZSBpbmxpbmUgY29tbWVudC4KPiA+IC4uLgo+ID4gPiA+IENo
YW5nZXMgc2luY2UgUkZDIHYyCj4gPiA+ID4gICogQWRkIHNwZWNpZmljYXRpb24gcmVmZXJlbmNl
Cj4gPiA+ID4gICogVXNlIEVQRVJNIHJhdGhlciB0aGFuIEVQUk9CRV9ERUZFUgo+ID4gLi4uCj4g
PiA+ID4gQEAgLTQwLDcgKzQwLDcgQEAgc3RhdGljIGludCBjcHVfcHNjaV9jcHVfYm9vdCh1bnNp
Z25lZCBpbnQgY3B1KSAgewo+ID4gPiA+ICAJcGh5c19hZGRyX3QgcGFfc2Vjb25kYXJ5X2VudHJ5
ID0gX19wYV9zeW1ib2woc2Vjb25kYXJ5X2VudHJ5KTsKPiA+ID4gPiAgCWludCBlcnIgPSBwc2Np
X29wcy5jcHVfb24oY3B1X2xvZ2ljYWxfbWFwKGNwdSksIHBhX3NlY29uZGFyeV9lbnRyeSk7Cj4g
PiA+ID4gLQlpZiAoZXJyKQo+ID4gPiA+ICsJaWYgKGVyciAmJiBlcnIgIT0gLUVQUk9CRV9ERUZF
UikKPiA+ID4KPiA+ID4gU2hvdWxkIHRoaXMgYmUgRVBFUk0/IEFzIHRoZSBmb2xsb3dpbmcgcHNj
aSBjcHVfb24gb3Agd2lsbCByZXR1cm4gaXQuCj4gPiA+IEkgdGhpbmsgeW91IG1pc3MgdG8gY2hh
bmdlIHRoaXMgd2hlbiBhcHBseSBKZWFuLVBoaWxpcHBlJ3MgcGF0Y2guCj4gPiAKPiA+IEl0IGxv
b2tzIGxpa2UgSmFtZXMgZGlkbid0IHByb3Blcmx5IHVwZGF0ZSBhbGwgcGxhY2VzLiBBbHNvLAo+
ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvcHNjaS9wc2NpLmMKPiA+
ID4gPiBiL2RyaXZlcnMvZmlybXdhcmUvcHNjaS9wc2NpLmMgaW5kZXggZDk2MjlmZjg3ODYxLi5l
ZTgyZTc4ODBkOGMKPiA+ID4gPiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJl
L3BzY2kvcHNjaS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9wc2NpL3BzY2kuYwo+
ID4gPiA+IEBAIC0yMTgsNiArMjE4LDggQEAgc3RhdGljIGludCBfX3BzY2lfY3B1X29uKHUzMiBm
biwgdW5zaWduZWQgbG9uZwo+ID4gPiA+IGNwdWlkLCB1bnNpZ25lZCBsb25nIGVudHJ5X3BvaW50
KQo+ID4gPiA+ICAJaW50IGVycjsKPiA+ID4gPgo+ID4gPiA+ICAJZXJyID0gaW52b2tlX3BzY2lf
Zm4oZm4sIGNwdWlkLCBlbnRyeV9wb2ludCwgMCk7Cj4gPiA+ID4gKwlpZiAoZXJyID09IFBTQ0lf
UkVUX0RFTklFRCkKPiA+ID4gPiArCQlyZXR1cm4gLUVQRVJNOwo+ID4gPiA+ICAJcmV0dXJuIHBz
Y2lfdG9fbGludXhfZXJybm8oZXJyKTsKPiA+IAo+ID4gVGhpcyBjaGFuZ2UgaXMgdW5uZWNlc3Nh
cnkgLSBwcm9iYWJseSBjb21lcyBmcm9tIHdoZW4gLUVQUk9CRV9ERUZFUiB3YXMKPiA+IGJlaW5n
IHVzZWQuIHBzY2lfdG9fbGludXhfZXJybm8oKSBhbHJlYWR5IGRvZXM6Cj4gCj4gQnV0IG1heSBw
cmludCBsb3RzIG9mIG5vaXNlIGxpa2U6Cj4gCj4gWyAgICAwLjAwODk1NV0gc21wOiBCcmluZ2lu
ZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4KPiBbICAgIDAuMDA5NjYxXSBwc2NpOiBmYWlsZWQgdG8g
Ym9vdCBDUFUxICgtMSkKPiBbICAgIDAuMDEwMzYwXSBwc2NpOiBmYWlsZWQgdG8gYm9vdCBDUFUy
ICgtMSkKPiBbICAgIDAuMDExMTY0XSBwc2NpOiBmYWlsZWQgdG8gYm9vdCBDUFUzICgtMSkKPiBb
ICAgIDAuMDExOTQ2XSBwc2NpOiBmYWlsZWQgdG8gYm9vdCBDUFU0ICgtMSkKPiBbICAgIDAuMDEy
NzY0XSBwc2NpOiBmYWlsZWQgdG8gYm9vdCBDUFU1ICgtMSkKPiBbICAgIDAuMDEzNTM0XSBwc2Np
OiBmYWlsZWQgdG8gYm9vdCBDUFU2ICgtMSkKPiBbICAgIDAuMDE0MzQ5XSBwc2NpOiBmYWlsZWQg
dG8gYm9vdCBDUFU3ICgtMSkKPiBbICAgIDAuMDE0ODIwXSBzbXA6IEJyb3VnaHQgdXAgMSBub2Rl
LCAxIENQVQo+IAo+IElzIHRoaXMgZXhwZWN0ZWQ/CgpQbGVhc2UgcmVhZCBteSBlbWFpbCBhZ2Fp
biwgYW5kIHRha2Ugbm90ZSBvZiB0aGUgX2NvbnRleHRfIGFib3ZlIHRoZQpwbGFjZXMgdGhhdCBJ
J3ZlIGNvbW1lbnRlZC4gQ29udGV4dCBtYXR0ZXJzLgoKV2hhdCBJJ20gc2F5aW5nIGlzIHRoYXQg
dGhpcyBjaGFuZ2U6CgogCWVyciA9IGludm9rZV9wc2NpX2ZuKGZuLCBjcHVpZCwgZW50cnlfcG9p
bnQsIDApOworCWlmIChlcnIgPT0gUFNDSV9SRVRfREVOSUVEKQorCQlyZXR1cm4gLUVQRVJNOwog
CXJldHVybiBwc2NpX3RvX2xpbnV4X2Vycm5vKGVycik7CgpJcyB1bm5lY2Vzc2FyeSB3aGVuIHBz
Y2lfdG9fbGludXhfZXJybm8oKSBhbHJlYWR5IGRvZXM6CgpzdGF0aWMgX19hbHdheXNfaW5saW5l
IGludCBwc2NpX3RvX2xpbnV4X2Vycm5vKGludCBlcnJubykKewoJc3dpdGNoIChlcnJubykgewoJ
Li4uCgljYXNlIFBTQ0lfUkVUX0RFTklFRDoKCQlyZXR1cm4gLUVQRVJNOwoKU28sIGEgcmV0dXJu
IG9mIFBTQ0lfUkVUX0RFTklFRCBmcm9tIGludm9rZV9wc2NpX2ZuKCkgYWJvdmUgd2lsbApfYWxy
ZWFkeV8gYmUgdHJhbnNsYXRlZCB0byAtRVBFUk0gKHdoaWNoIGlzIC0xKSBieQpwc2NpX3RvX2xp
bnV4X2Vycm5vKCkuIFRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkIHRoYXQgZXh0cmEgaWYoKQpzdGF0
ZW1lbnQgaW4gX19wc2NpX2NwdV9vbigpLgoKSSB3YXMgX25vdF8gc2F5aW5nIHRoYXQgdGhlIGVu
dGlyZSBwYXRjaCB3YXMgdW5uZWNlc3NhcnkuCgpDb250ZXh0IG1hdHRlcnMuIFRoYXQncyB3aHkg
d2UgaW5jbHVkZSBjb250ZXh0IGluIHJlcGxpZXMuCgpTdGFuZGFyZCBlbWFpbCBldGlxdWV0dGUg
KGJlZm9yZSBNaWNyb3NvZnQgbWVzc2VkIGl0IHVwKSBpcyB0byBxdW90ZSB0aGUKZW1haWwgdGhh
dCBpcyBiZWluZyByZXBsaWVkIHRvLCB0cmltbWluZyBoYXJkIGlycmVsZXZhbnQgY29udGVudCwg
YW5kIHRvCnBsYWNlIHRoZSByZXBseSBjb21tZW50cyBpbW1lZGlhdGVseSBiZWxvdyB0aGUgb3Jp
Z2luYWwgY29udGVudCB0byB3aGljaAp0aGUgY29tbWVudHMgcmVsYXRlLCB0byBnaXZlIHRoZSBy
ZXBseSBjb21tZW50cyB0aGUgY29udGV4dCBuZWNlc3NhcnkKZm9yIGNvcnJlY3QgaW50ZXJwcmV0
YXRpb24uCgpUaGFua3MuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1s
aW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24g
MTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
