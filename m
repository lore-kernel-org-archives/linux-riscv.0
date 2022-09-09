Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D03ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRCpm0DxM3zuUgX4dzg8PdffCM97n7qUvKt6M6tJ/mQ=; b=nN0rZ1gsi/7BZk
	nBVblw/yjM6APn3YhHf6MnYv/2ARNyPuETq6hu5Lef+hDpSJKlgxz0o6Ms7WmkjjttC8ebG0BPC82
	RneOVVu7YYtgeYIs8GBV2j8kOwlmyiwMSoQ4/peILnFknL9m0m7xhMAIhbYfDvxaC+xe2AyQKwcwH
	OAkxr+TmG0Ndnxij2YEA1Oyaz6QjEZ2TMd4ohwWmaau9uoyTcA0yB0bylK6ZtNwZtaN7J4vSStF6r
	wqi8y3C0VZ2Lb1Vdhs62Xp1fhiVhB3JqTyav80Z6Iyo9zyahHwPAHbaoOSlmBU5hCRxgYqAdsmEzQ
	aqoZg+nWOSuYvnyi4gYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcsd-00FvN2-GC; Fri, 09 Sep 2022 12:13:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcsb-00FvM0-1v
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 12:13:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4D0F61FCF;
	Fri,  9 Sep 2022 12:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B6FC433D6;
	Fri,  9 Sep 2022 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662725583;
	bh=wyT+RSE2oHYcIwAAxN7k6rwPkCm4BMGf+S0umuD69PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBqgc3wBvCesUWYOaFSVqvPibG0TlWjXeieipY3hhTeBxSYoj4x1Ndfxzn1f+HITd
	 yN8VLlCxn+pr+ThxvZ1Fk9DT8rpqDqFcoPD/2b9Ai2KTvvIEiSrmiksGL4LAWWUfR4
	 qEmg4H+k0qGHIGGFd2Uw131KFADN81mhBgE1JvKuhGcQ6J+hUHG8Ni05+WGomVshAk
	 NlR1nW4/iXg3S/T8qQ3X0iueyhrovxA0ThwAs1PUhJBmrrR/Wz9O9pxTHzTJi+9y9A
	 RIP5Ox2cQVTZZOmCYB/xxqpnGxpNE997blqsjsOdbrxxkENe+qqZRpLbuQnGjAtLqJ
	 0foEurx1g3yVg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oWcsi-0001Ru-3k; Fri, 09 Sep 2022 14:13:12 +0200
Date: Fri, 9 Sep 2022 14:13:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tobias Klauser <tklauser@distanz.ch>,
	Richard Genoud <richard.genoud@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Kevin Cernekee <cernekee@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
Message-ID: <Yxst2PGeiQN+dL9e@hovoldconsulting.com>
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
 <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_051305_211229_978F51A8 
X-CRM114-Status: GOOD (  27.01  )
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

T24gV2VkLCBTZXAgMDcsIDIwMjIgYXQgMDk6MTk6MjVBTSArMDIwMCwgSmlyaSBTbGFieSB3cm90
ZToKPiBPbiAwNi4gMDkuIDIyLCAxMzozMCwgSm9oYW4gSG92b2xkIHdyb3RlOgo+ID4gT24gVHVl
LCBTZXAgMDYsIDIwMjIgYXQgMTI6NDg6MDFQTSArMDIwMCwgSmlyaSBTbGFieSB3cm90ZToKPiA+
PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIERFRklORV9VQVJUX1BPUlRfVFhfSEVMUEVSICsKPiA+
PiBERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBFUl9MSU1JVEVEIFRYIGhlbHBlcnMuIFNlZSBQQVRD
SCAyLzQgZm9yIHRoZQo+ID4+IGRldGFpbHMuIENvbW1lbnRzIHdlbGNvbWUuCj4gPj4KPiA+PiBU
aGVuIGl0IHN3aXRjaGVzIGRyaXZlcnMgdG8gdXNlIHRoZW0uIEZpcnN0LCB0bwo+ID4+IERFRklO
RV9VQVJUX1BPUlRfVFhfSEVMUEVSKCkgaW4gMy80IGFuZCB0aGVuCj4gPj4gREVGSU5FX1VBUlRf
UE9SVF9UWF9IRUxQRVJfTElNSVRFRCgpIGluIDQvNC4KPiA+Pgo+ID4+IFRoZSBkaWZmc3RhdCBv
ZiBwYXRjaGVzIDMrNCBpcyBhcyBmb2xsb3dzOgo+ID4+ICAgMjYgZmlsZXMgY2hhbmdlZCwgMTkx
IGluc2VydGlvbnMoKyksIDgyMyBkZWxldGlvbnMoLSkKPiA+PiB3aGljaCBhcHBlYXJzIHRvIGJl
IG5pY2UuCj4gPiAKPiA+IE5vdCByZWFsbHkuIFRoaXMgaXMgaG9ycmlkLiBRdWFsaXR5IGNhbid0
IGJlIG1lYXN1cmVkIGluIExvQyAob25seSkuCj4gPiAKPiA+IFRoZSByZXN1bHRpbmcgY29kZSBp
cyB1bnJlYWRhYmxlLiBBbmQgZm9yIG5vIGdvb2QgcmVhc29uLgo+IAo+IElNTywgaXQncyBtdWNo
IG1vcmUgcmVhZGFibGUgdGhhbiB0aGUgb3JpZ2luYWwgfiAzMCB2YXJpb3VzIChhbmQgYnVnZ3kg
Cj4gLS0gc2VlIElscG8ncyBmaXhlcykgY29waWVzIG9mIHRoaXMgY29kZS4gQXBhcnQgZnJvbSB0
aGF0LCBpdCBtYWtlcyAKPiBmdXJ0aGVyIHJld29yayBtdWNoIGVhc2llciAoSSBoYXZlIHN3aXRj
aCB0byBrZmlmbyBpbiBteSBtaW5kIGZvciBleGFtcGxlKS4KClN1cmUsIGJ1dCB5b3UgY2FuJ3Qg
aGF2ZSB0aGF0IGF0IHRoZSBjb3N0IG9mIHNvbWV0aGluZyB0aGF0IGlzCnVucmVhZGFibGUuIEFy
bmQncyBzdWdnZXN0aW9ucyBzZWVtcyB0byBpbXByb3ZlIHRoaW5ncyBzb21ld2hhdCBpbiB0aGlz
CnJlc3BlY3QsIHRob3VnaC4KIAo+ID4gWyBBbmQgbm90ZSB0aGF0IHlvdSdyZSAic2F2aW5nIiBz
b21ldGhpbmcgbGlrZSAyMCBsaW5lcyBwZXIgZHJpdmVyOgo+IAo+IEl0J3Mgbm90IGFib3V0IHNh
dmluZywgaXQncyBhYm91dCBkZWR1cGxpY2F0aW5nIGFuZCB1bmlmeWluZy4KCkl0IHdhcyB5b3Ug
d2hvIGJyb3VnaHQgdGhlIGRpZmYgc3RhdCB0aGF0IHVwIGFuZCBJIHB1dCB0aGlzIGluCnBhcmVu
dGhlc2VzIGZvciBhIHJlYXNvbi4KIAo+ID4gCSAxMiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRp
b25zKCspLCAzNDkgZGVsZXRpb25zKC0pCj4gPiBdCj4gPiAKPiA+IE5BSwo+IAo+IEknZCBsb3Zl
IHRvIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcgbmljZXIuIFRoYXQgd291bGQgYmUgYSBmdW5jdGlv
biBpbiAKPiBzZXJpYWwtY29yZSBjYWxsaW5nIGhvb2tzIGxpa2UgSSBoYWQgWzFdIGZvciBleGFt
cGxlLiBCdXQgcHJvdmlkZWQgYWxsIAo+IHRob3NlIENQVSB3b3JrYXJvdW5kcy90aHVua3MsIGl0
J2QgYmUgcXVpdGUgZXhwZW5zaXZlIHRvIGNhbGwgdHdvIAo+IGZ1bmN0aW9ucyBwZXIgY2hhcmFj
dGVyLgoKWWVhaCwgdGhhdCB3YXMgZXZlbiB3b3JzZSBzbyBubyBuZWVkIHRvIHJlaXRlcmF0ZSB0
aGF0LgoKPiBPciBjcmVhdGluZyBhIHN0YXRpYyBpbmxpbmUgKGhhdmluZyDCsSB0aGUgbWFjcm8g
Y29udGVudCkgYW5kIHRoZSBob29rcyAKPiBhcyBwYXJhbWV0ZXJzIGFuZCBob3BlIGZvciBvcHRp
bWl6YXRpb25zIHRvIGVsaW1pbmF0ZSB0aHVua3MgKGFsc28gCj4gc3VnZ2VzdGVkIGluIHRoZSBw
YXN0IFsxXSkuCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDQxMTEw
NTQwNS45NTE5LTEtanNsYWJ5QHN1c2UuY3ovCgpJZiB0aGF0IHdvcmtzIHRoZW4gdGhhdCBzaG91
bGQgaW1wcm92ZSByZWFkYWJpbGl0eSBhcyB3ZWxsLgoKSm9oYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
