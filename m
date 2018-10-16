Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33E8C5ACC6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 22:20:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0DD22148E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 22:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rx10t38Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lu+mW7bR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0DD22148E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JP/GPmDQgYErDP21OnDxMQM2J3bm9OtDYTwVwqWavCI=; b=rx10t38YNdMnmiZuD+o6L7mRy
	MOFOBSZf9PbrIhGwJ8g+u9pkk3P81Db2nZZMa1zuKyO4YYc9v5i1kkBl33dTKLFBsohOcuAazD9KX
	yRjNvNdWDk4OmdOxxx+uO1du0v/RKYZ8E732I0zME/BSYHKWEw+6/wbujt5nZdh1V/yfq2f9+pEKP
	NlYwg0zpg09aXHxLwAGWdC6bcxWZ3dPa147Bpl7fK3vpLQGoSFO69iNQrx7mgNLBI4U7AJvy8hlAx
	Xb2Rqz63UQ61LjrrSWaTxokHAH4ZNBtomfoP5HeI8uJyHLS8BV8iTb7s2djT13wd/XEnIW5BOKjGx
	r3cGQOwXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCXhr-0006um-MB; Tue, 16 Oct 2018 22:20:51 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCXhn-0006tA-O2
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 22:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539728448; x=1571264448;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=a2fG+05X3DwXT0k2mb0bZPF86aHlYDiKC30d3quRiTA=;
 b=lu+mW7bR66BFxqYA9W9+JWD+q+xq9JQFjlzGsRgb8O92X1QR51imPFwu
 z9cqewzncKuSYXC0JKl0fxFP1K6jYmN6TbaL6Pwj2IX/SUmCfZj6XakO0
 XDT22PQnehNCvuSF3+Q3iA6tHJvRRJ2Rx3tpWHJ/0TBmG3qnjvwcVDi5/
 YKis0yooE8epNdYJc+JfyS1NngirvnNTmlPhD6CKsuSljoIzd2kdCdpcq
 C3nRELqbTCKF43edHx2qxRF8/eEzO69No/a+Y3Z2VqoCIdCC8ztAYcA5K
 pEmXAKId3s/FdnIgEg4+2gtW6vjgOP6lppiFElQE/C1ee9yLa3h/OFctM A==;
X-IronPort-AV: E=Sophos;i="5.54,389,1534780800"; d="scan'208";a="93188008"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2018 06:20:36 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 16 Oct 2018 15:05:41 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.73.114])
 ([10.111.73.114])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2018 15:20:34 -0700
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
To: Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo> <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
 <20181016110142.GC8852@ulmo>
 <6e108e3c-15c1-b13b-ac3e-60c5eb209c7b@sifive.com>
 <20181016220437.GB31973@mithrandir>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <7fc1168d-a840-032a-c0a9-2a610127c484@wdc.com>
Date: Tue, 16 Oct 2018 15:20:34 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181016220437.GB31973@mithrandir>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_152047_899415_66652085 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linus.walleij@linaro.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016222034.MaZhvaPAgTEYJU1wEeZQcA-Uht4OsELlN5P_WOpXqmc@z>

T24gMTAvMTYvMTggMzowNCBQTSwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gT24gVHVlLCBPY3Qg
MTYsIDIwMTggYXQgMTA6MzE6NDJBTSAtMDcwMCwgUGF1bCBXYWxtc2xleSB3cm90ZToKPj4KPj4g
T24gMTAvMTYvMTggNDowMSBBTSwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4+PiBPbiBNb24sIE9j
dCAxNSwgMjAxOCBhdCAwMzo1NzozNVBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPj4+PiBP
biAxMC8xMC8xOCA2OjQ5IEFNLCBUaGllcnJ5IFJlZGluZyB3cm90ZToKPj4+Pj4gT24gVHVlLCBP
Y3QgMDksIDIwMTggYXQgMTE6NTE6MjJBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+Pj4+
PiArUmVxdWlyZWQgcHJvcGVydGllczoKPj4+Pj4+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZSBv
bmUgb2YKPj4+Pj4+ICsJInNpZml2ZSxmdTU0MC1jMDAwLXB3bTAiLCJzaWZpdmUscHdtMCIuCj4+
Pj4+IFdoYXQncyB0aGUgJzAnIGluIGhlcmU/IEEgdmVyc2lvbiBudW1iZXI/Cj4+Pj4+Cj4+Pj4g
SSB0aGluayB5ZXMuIFNpbmNlIGZ1NTQwIGlzIHRoZSBmaXJzdCBMaW51eCBjYXBhYmxlIFJJU0Mt
ViBjb3JlLCBTaUZpdmUgR3V5cwo+Pj4+IGRlY2lkZWQgbWFyayBpdCBhcyB2ZXJzaW9uIDAuCj4+
Pj4KPj4+PiBAV2VzbHk6IFBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcuCj4+PiBJdCBz
ZWVtcyBmYWlybHkgc3VwZXJmbHVvdXMgdG8gbWUgdG8gaGF2ZSBhIHZlcnNpb24gbnVtYmVyIGlu
IGFkZGl0b24gdG8KPj4+IHRoZSBmdTU0MC1jMDAwLCB3aGljaCBhbHJlYWR5IHNlZW1zIHRvIGJl
IHRoZSBjb3JlIHBsdXMgc29tZSBzb3J0IG9mCj4+PiBwYXJ0IG51bWJlci4gRG8geW91IHJlYWxs
eSBleHBlY3QgdGhlcmUgdG8gYmUgYW55IGNoYW5nZXMgaW4gdGhlIFNvQwo+Pj4gdGhhdCB3b3Vs
ZCByZXF1aXJlIGEgZGlmZmVyZW50IGNvbXBhdGlibGUgc3RyaW5nIGF0IHRoaXMgcG9pbnQ/IElm
IHRoZQo+Pj4gU29DIGhhcyB0YXBlZCBvdXQsIGhvdyB3aWxsIHlvdSBldmVyIGdldCBhIGRpZmZl
cmVudCB2ZXJzaW9uIG9mIHRoZSBQV00KPj4+IElQIGluIGl0Pwo+Pj4KPj4+IEkgd291bGQgZXhw
ZWN0IGFueSBpbXByb3ZlbWVudHMgb3IgY2hhbmdlcyB0byB0aGUgUFdNIElQIHRvIHNob3cgdXAg
aW4gYQo+Pj4gZGlmZmVyZW50IFNvQyBnZW5lcmF0aW9uLCBhdCB3aGljaCBwb2ludCBpdCB3b3Vs
ZCBiZSBzb21ldGhpbmcgbGlrZQo+Pj4gInNpZml2ZSxmdTY0MC1jMDAwIiBtYXliZSwgb3IgcGVy
aGFwcyAic2lmaXZlLGZ1NTQwLWQwMDAiLCBvciB3aGF0ZXZlcgo+Pj4gdGhlIG51bWJlcmluZyBp
cy4KPj4KPj4KPj4gVGhlICIwIiBzdWZmaXggcmVmZXJzIHRvIGEgcmV2aXNpb24gbnVtYmVyIGZv
ciB0aGUgdW5kZXJseWluZyBQV00gSVAgYmxvY2suCj4+Cj4+IEl0J3MgY2VydGFpbmx5IGltcG9y
dGFudCB0byBrZWVwIHRoYXQgdmVyc2lvbiBudW1iZXIgb24gdGhlICJzaWZpdmUscHdtMCIKPj4g
Y29tcGF0aWJsZSBzdHJpbmcgdGhhdCBkb2Vzbid0IGhhdmUgdGhlIGNoaXAgbmFtZSBhc3NvY2lh
dGVkIHdpdGggaXQuCj4gCj4gSXNuJ3QgdGhlIGhhcmR3YXJlIGlkZW50aWZpZWQgYnkgInNpZml2
ZSxwd20wIiBhbmQgInNpZml2ZSxmdTU0MC1jMDAwIgo+IGVmZmVjdGl2ZWx5IGlkZW50aWNhbD8g
CgpZZXMuCgpJcyB0aGVyZSBhIG5lZWQgdG8gaGF2ZSB0d28gY29tcGF0aWJsZSBzdHJpbmdzCj4g
dGhhdCByZWZlciB0byB0aGUgZXhhY3Qgc2FtZSBoYXJkd2FyZT8KPiAKClRoZSBEVCBpbiB0aGUg
aGFyZHdhcmUgaGFzIG9ubHkgc2lmaXZlLHB3bTAuIEkgaGF2ZSBhZGRlZCAKInNpZml2ZSxmdTU0
MC1jMDAwIiBhcyB0aGF0IHdhcyBjb25jbHVkZWQgYXMgdGhlIGNvcnJlY3QgY29tcGF0aWJsZSAK
c3RyaW5nIGZyb20gcGxhdGZvcm0gbGV2ZWwgaW50ZXJydXB0IGNvbnRyb2xsZXIgcGF0Y2goUExJ
QykgZGlzY3Vzc2lvbi4KCihodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGlu
dXgtcmlzY3YvMjAxOC1BdWd1c3QvMDAxMTM1Lmh0bWwpCgoic2lmaXZlLHB3bTAiIGlzIHJlcXVp
cmVkIHRvIHVudGlsIGFsbCB0aGUgVW5sZWFzaGVkIFNvQyBnZXRzIGFuIHVwZGF0ZWQgCmZpcm13
YXJlIHdpdGggY29ycmVjdCBjb21wYXRpYmxlIHN0cmluZyAic2lmaXZlLGZ1NTQwLWMwMDAiLiBJ
IGFncmVlIAp0aGlzIGlzIGEgbWVzcy4gQnV0IHdlIGhhdmUgdG8gY2FycnkgaXQgdW50aWwgYWxs
IGV2ZXJ5IERUKGNvcnJlc3BvbmRpbmcgCnRvIGVhY2ggZHJpdmVyKSBpcyBmaW5hbGl6ZWQuIEkg
Z3Vlc3MgU2lGaXZlIHdpbGwgcmVsZWFzZSBhIGZpcm13YXJlIAp1cGRhdGUgdGhhdCBjb250YWlu
cyBhbGwgdGhlIHVwZGF0ZWQgRFQgb25jZSB0aGF0IGlzIGRvbmUuIFdlIGNhbiBnZXQgCnJpZCBv
ZiBhbGwgdGhlIHJlZHVuZGFudCBjb21wYXRpYmxlIHN0cmluZ3MgYXQgdGhhdCB0aW1lLgoKUmVn
YXJkcywKQXRpc2gKPj4gQXMgdG8gd2hldGhlciB0aGVyZSBjb3VsZCBldmVyIGJlIGEgRlU1NDAt
QzAwMCBwYXJ0IHdpdGggZGlmZmVyZW50IElQIGJsb2NrCj4+IHZlcnNpb25zIG9uIGl0OiBGVTU0
MC1DMDAwIGlzIHVsdGltYXRlbHkgYSBtYXJrZXRpbmcgbmFtZS7CoCBXaGlsZQo+PiB0aGVvcmV0
aWNhbGx5IHdlIHNob3VsZG4ndCBoYXZlIGFub3RoZXIgIkZVNTQwLUMwMDAiIGNoaXAgd2l0aCBk
aWZmZXJlbnQKPj4gcGVyaXBoZXJhbCBJUCBibG9jayB2ZXJzaW9ucyBvbiBpdCwgSSBkb24ndCB0
aGluayBhbnkgZW5naW5lZXIgY2FuIGd1YXJhbnRlZQo+PiB0aGF0IGl0IHdvbid0IGhhcHBlbi4K
PiAKPiBJIHdvdWxkIGFyZ3VlIHRoYXQgaWYgYXQgc29tZSBwb2ludCB0aGVyZSB3YXMgaW5kZWVk
IGEgY2hpcCB3aXRoIHRoZQo+IHNhbWUgbmFtZSBidXQgYSBkaWZmZXJlbnQgSVAgYmxvY2sgdmVy
c2lvbiBpbiBpdCwgd2UgY2FuIGZpZ3VyZSBvdXQgd2hhdAo+IHRvIGNhbGwgaXQuIFN1cmUgdGhl
cmUgYXJlIG5vIGd1YXJhbnRlZXMsIGJ1dCBpdCdzIHN0aWxsIGZhaXJseSB1bmxpa2VseQo+IGlu
IG15IG9waW5pb24sIHNvIEkgcGVyc29uYWxseSB3b3VsZG4ndCB3b3JyeSBhYm91dCB0aGlzIHVw
IGZyb250Lgo+IAo+IEFueXdheSwgSSBkb24ndCBmZWVsIHN0cm9uZ2x5IGVpdGhlciB3YXksIEkn
bSBqdXN0IHBvaW50aW5nIG91dCB0aGF0Cj4gdGhpcyBpcyBzb21ld2hhdCB1bnVzdWFsLiBJZiB5
b3Ugd2FudCB0byBrZWVwIGl0LCBmZWVsIGZyZWUgdG8uCj4gCj4gVGhpZXJyeQo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
