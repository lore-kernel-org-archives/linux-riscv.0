Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FA8C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 20:53:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C4964E76
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 20:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C4964E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hJLOQYy23bYpStnym5Ec7EDIfOtRWZ5SL6GlmTTYxWg=; b=Rzq3QABYN1BtZyNntUmE2OkAj
	9jeDhbYas53xgXUN7vHthWdfWtm3ORHJ7unN8Dm48rRBn/D0Z7rqK+mn8azcQgYVcuIMS1DGyxS69
	4oeOV7UAA0qS+tab3hGPtbVOQmSKeCd/uEhje9unpf787f5aiNCaLXR4ASe3uzYFNmG47ac9Xen8u
	rC0+bysyznaT4c7ZpAW9JfAjxsWYMc+xzYMptCAWHfvnbmoUid4e8GHcxZDwu5m1RMQO9VOAv6GYh
	mOIxZJVCOi0WL8ToQ2sr4fxH9YbGoeVshiNRJPSxgi+u61T0NpOBvD7b/Gau9HLGm/jTTn4QsMwnz
	erczv5iDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMGg7-001qcT-40; Tue, 16 Mar 2021 20:52:35 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMGg3-001qbm-20
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 20:52:33 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 12GKqPGR057498
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 22:52:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1615927940; x=1618519940;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HhCpxIXZXCzRVroR0d59osu/si3BO1mRCgntQgAoLkY=;
 b=I7YFG+2vCUiCZTaPtNRhGQsmk4/oFMKJaLKd0lM+moMw0JAGvbtTReIL2ESd42UO
 fU/M8c24v824vUlRMQQ3vHU2GXWVDiMF6srdK+ZWo409qoN02yauB/c+3Bd4Klwd
 Ud1zSyPqsL0kREzxraupvH4/Unrvf8mN9wu7nLgNfeemwvkIl7xmHhA2Bl+KVien
 3mlbDbih8on4wKgegSrJTYo3JiwvHGUk6AnfT8EBZGfmGFmG43W2iTKgDikWfhN1
 PYw4GDiQk03bUZAe2SQIXGVX3ysxc1xiDMFffNkv1Q9QTweyRVy65/5fY3BcD4Iw
 pdKXCnYWL2r7UQYjIUgdgA==;
X-AuditID: 8b5b014d-a4c337000000209f-b1-60511a84b731
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 08.FA.08351.48A11506; Tue, 16 Mar 2021 22:52:20 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 16 Mar 2021 22:52:20 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Gary Guo <gary@garyguo.net>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: enable TIME CSR in U mode
Organization: FORTH
In-Reply-To: <LO2P265MB074925F26234B27EF0D96D0AD66B9@LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM>
References: <20210216221208.2860-1-gary@garyguo.net>
 <e50f40a65f10e40c8d601791c0856cc6@mailhost.ics.forth.gr>
 <LO2P265MB074925F26234B27EF0D96D0AD66B9@LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM>
Message-ID: <5f829b8bc5d78b8c75dbcfdb5921119a@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOLMWRmVeSWpSXmKPExsXSHT1dWbdFKjDBYNpfcYuLZ14zWmz73MJm
 0fzuHLsDs8eSzl9MHg83XWLy2LykPoA5issmJTUnsyy1SN8ugSvj6uutrAWNYhXNtyewNzDu
 EOxi5OSQEDCR+Lv4N1sXIxeHkMAxRom+qZcYIRKmErP3doLZvAKCEidnPmEBsZkFLCSmXtnP
 CGHLSzRvnc0MYrMIqEqcvLwczGYT0JSYf+kgWL0IUM2mVYuYIOo9JK4t3wFWIww0f+/d12Bx
 fgFhiU93L7KC2JwCMRI3V21ihzjoIKPEhJnPWSGOcJFYcGE7K8RxKhIffj8AKuLgEAWyN89V
 msAoOAvJqbOQnDoLyakLGJlXMQoklhnrZSYX66XlF5Vk6KUXbWIEhy2j7w7G25vf6h1iZOJg
 PMQowcGsJMJrmheQIMSbklhZlVqUH19UmpNafIhRmoNFSZyXV29CvJBAemJJanZqakFqEUyW
 iYNTqoFp4oJE3nMN3pM3yh9ftWPluinWr+Mjnlt1lP/buy6QyX9qdEHK+eMfGaLjd92OKPws
 u7R8pUHFhLRTBiIfn8a2n7rX3sR2KXyGb4Zf7/xKXRnHU6KiW2LvV/cmOBWeOv5tna5z+xfL
 M1bJ756Eh3zQrV4d7vOmZrLoS41zqrdtesxnGG069czzs2jV/9f36mXrt6u9OrT4zY6ChU9s
 Z659O6O1YoNicqaqU1boDO7HrHnnPa+fLt+rcvHqjzUsKaeuq22RmGLxQfbRw46m1vet4feF
 b88OEOLJS/gqdvwe++trR86eT9jIvPjt6Rb/glfJgjwp9aEyFy9qSd1O/zRtkt6EM7NdHLad
 nPhVZdFVZiWW4oxEQy3mouJEAH9E9H/KAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_205231_334603_CF6DA20B 
X-CRM114-Status: GOOD (  23.71  )
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

VGhlbiB3ZSBhbHNvIG5lZWQgdG8gbW9kaWZ5IHRoZSBjdXJyZW50IHBlcmYgY29kZSB0aGF0IGFz
c3VtZXMgZS5nLiB0aGF0IAppbnN0cmV0IGlzIGVuYWJsZWQuIEknZCBzdWdnZXN0IHRoYXQgdW50
aWwgd2UgaGF2ZSBhbiBTQkkgaW50ZXJmYWNlIAooc2luY2Ugd2UgYWxzbyBuZWVkIHRvIG1ha2Ug
c3VyZSB0aGF0IHRoZSBlbmFibGVkIGNvdW50ZXJzIGFyZSBhbHNvIHNldCAKb24gbWNvdW50ZXJl
bikgZm9yIGVuYWJsaW5nIC8gZGlzYWJsaW5nIGNvdW50ZXJzLCB3ZSBsZWF2ZSB0aGlzIHRvIHRo
ZSAKZmlybXdhcmUuCgpSZWdhcmRzLApOaWNrCgrOo8+EzrnPgiAyMDIxLTAzLTE2IDA4OjI0LCBH
YXJ5IEd1byDOrc6zz4HOsc+IzrU6Cj4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgbGV0IHRoZSBm
aXJtd2FyZSB0byBkZWNpZGUgd2hpY2ggcGVyZm9ybWFuY2UKPiBjb3VudGVyIENTUnMgY2FuIGJl
IHVzZWQgYnkgdGhlIHVzZXJzcGFjZS4gTm8gY291bnRlciBzaG91bGQgYmUKPiBhbGxvd2VkIHVu
bGVzcyB0aGVyZSBpcyBhIHJlYXNvbiB0byBhbGxvdyBpdCwgbGlrZSB0aGUgdGltZXIgQ1NSLgo+
IEFsc28sIE9wZW5TQkkgaXMgbm90IHRoZSBvbmx5IFNCSSBpbXBsZW1lbnRhdGlvbiw7IHRoZXJl
IGNvdWxkIGJlIG5vCj4gU0JJcyBhdCBhbGwgKGkuZS4gTSBtb2RlKSBvciBoYXZlIG90aGVyIFNC
SXMgdGhhdCBoYXZlIGRpZmZlcmVudAo+IGRlZmF1bHRzLgo+IAo+IEJlc3QsCj4gR2FyeQo+IAo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogTmljayBLb3NzaWZpZGlzIDxtaWNr
QGljcy5mb3J0aC5ncj4KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggNCwgMjAyMSA1OjM1IFBNCj4g
VG86IEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8ubmV0Pgo+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gcmlzY3Y6IGVuYWJsZSBUSU1FIENT
UiBpbiBVIG1vZGUKPiAKPiDOo8+EzrnPgiAyMDIxLTAyLTE3IDAwOjEyLCBHYXJ5IEd1byDOrc6z
z4HOsc+IzrU6Cj4+IEFmdGVyIGFkNWQxMTIgd2UgbGV0IHRoZSB1c2VyIG1vZGUgdG8gdXNlIHJk
dGltZSBkaXJlY3RseSBmb3IgdGltZQo+PiBhY2Nlc3MuIFRoaXMgd29ya3MgaWYgdGhlIGhhcmR3
YXJlIGRvZXMgbm90IGltcGxlbWVudCB0aGUgVElNRSBDU1IgYW5kCj4+IHRyYXBzIHRvIHRoZSBm
aXJtd2FyZS4gVGhlIHNwZWMgaG93ZXZlciBkb2VzIGFsbG93IGEgaGFyZHdhcmUKPj4gaW1wbGVt
ZW50YXRpb24gdG8gcmVkaXJlY3QgdGhlIENTUiBhY2Nlc3MgdG8gdGhlIG1lbW9yeS1tYXBwZWQg
TVRJTUUKPj4gQ1NSLCBhbmQgaWYgdGhpcyBpcyBwZXJmb3JtZWQgaXQgd2lsbCBjaGVjayB7TSxT
fUNPVU5URVJFTiBDU1IgdG8gc2VlCj4+IGlmIGl0IGlzIGFsbG93ZWQuCj4+IAo+PiBUbyBwcmV2
ZW50IHVuaGFuZGxlZCBpbGxlZ2FsIGluc3RydWN0aW9uIGZhdWx0IG9uIHRoZXNlIHBsYXRmb3Jt
cywgd2UKPj4gY2FuIHJlcXVlc3QgdGhlc2UgQ1NScyB0byBiZSBlbmFibGVkIGluIFUtbW9kZS4g
Rm9yIHBsYXRmb3JtcyB0aGF0Cj4+IGRvZXMgbm90IHN1cHBvcnQgdGhlIFRJTUUgQ1NSIHRvIE1U
SU1FIENTUiBjb252ZXJzaW9uLCB0aGV5IHdpbGwKPj4gaGFyZHdpcmUgY29ycmVzcG9uZGluZyBi
aXQgaW4gQ09VTlRFUkVOIHRvIHplcm8gYW5kIHRoaXMgd291bGQgYmUgYQo+PiBuby1vcC4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8ubmV0Pgo+PiAtLS0KPj4g
IGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyB8IDYgKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVh
ZC5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGluZGV4Cj4+IDBhNGU4MWI4ZGM3OS4uNWE3
YTYyMTkwMzQyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4+IEBAIC0xOTAsNiArMTkwLDkgQEAgRU5UUlko
X3N0YXJ0X2tlcm5lbCkgIC5hbGlnbiAyCj4+ICBwbXBfZG9uZToKPj4gCj4+ICsJLyogQWxsb3cg
dXNlci1tb2RlIHRvIGFjY2VzcyB0aW1lIENTUiAqLwo+PiArCWNzcncsIENTUl9NQ09VTlRFUkVO
LCAyCj4+ICsKPj4gIAkvKgo+PiAgCSAqIFRoZSBoYXJ0aWQgaW4gYTAgaXMgZXhwZWN0ZWQgbGF0
ZXIgb24sIGFuZCB3ZSBoYXZlIG5vIGZpcm13YXJlCj4+ICAJICogdG8gaGFuZCBpdCB0byB1cy4K
Pj4gQEAgLTE5Nyw2ICsyMDAsOSBAQCBwbXBfZG9uZToKPj4gIAljc3JyIGEwLCBDU1JfTUhBUlRJ
RAo+PiAgI2VuZGlmIC8qIENPTkZJR19SSVNDVl9NX01PREUgKi8KPj4gCj4+ICsJLyogQWxsb3cg
dXNlci1tb2RlIHRvIGFjY2VzcyB0aW1lIENTUiAqLwo+PiArCWNzcncgQ1NSX1NDT1VOVEVSRU4s
IDIKPj4gKwo+PiAgCS8qIExvYWQgdGhlIGdsb2JhbCBwb2ludGVyICovCj4+ICAub3B0aW9uIHB1
c2gKPj4gIC5vcHRpb24gbm9yZWxheAo+IAo+IFNob3VsZG4ndCB3ZSB1c2UgY3NycnMgaGVyZSB0
byBwcmVzZXJ2ZSBjdXJyZW50IHNldHRpbmdzIGZyb20gdGhlCj4gZmlybXdhcmUgPyBBbHNvIE9w
ZW5TQkkgYXQgdGhpcyBwb2ludCBzZXRzIGJvdGggTUNPVU5URVJFTi9TQ09VTlRFUkVOCj4gdG8g
LTEsIGRvZXMgYW55b25lIGVsc2UgbW9kaWZ5IHRoYXQgdmFsdWUgPwo+IAo+IFJlZ2FyZHMsCj4g
TmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
