Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C7AECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 21:07:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038202075D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 21:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZoKWAw86";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ye+Wau62"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038202075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T76DWKNwB2qMGPnZnheONwMhrxnwEIsMVFMxY5rmt/U=; b=ZoKWAw860Y2Pgy
	UcDNda+Fhg+PH5Aib+X7oQK7RdqwGSoxRQcmwwcf9c/d7fBwg4wGnChe01K7gIIlMW/Dq5H7G0aVE
	CXBGloCCVgjSGWXd1G9+ZypmhagjwLSGHaTrpWi17yYvJ47bG/cS1BATNo6UgXw4vyqSSceiwTEdz
	IXP0GgB5fdexwV/SX6vZxmqdXYJEUOfgI+8QUxg0h7CyTbE9pBbwpJib1Yd835e3i5KMkBgtn+oDm
	0G/j1KPMYiAei1tMCS5cg2W2Q+3ctec4r/+c4L8NoZH13vpsQiYH15wdIdIYIyDsBFOf7FmY6RO3q
	+Mt4Elt+SLKQQE1/59Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFQN7-0002z6-3X; Wed, 24 Oct 2018 21:07:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFQN2-0002xn-EH
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 21:07:19 +0000
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CBAA20833
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 21:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1540415225;
 bh=4f0Fe8Ps3oY6n7KWGpJz5aZusd6Mpr/caJHJJr3zdPs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ye+Wau624fk4ZLG5+LXiEH+FrMFtTsCT9EOMpoqeEQidVdiMDD+nzthS9nvmlASC2
 G5sDjuRORoEl4CgstaCMaF2xR/JBHM0z0+QkveP97yRR0zWKwj6r146uYwXufIb7dX
 S02Gpg0hH5KyRLIrQ/czwevjuuUV5O6VmkDSLbLU=
Received: by mail-qt1-f174.google.com with SMTP id a10-v6so7373978qtp.2
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 14:07:05 -0700 (PDT)
X-Gm-Message-State: AGRZ1gKYDNukK/UFaLpSQjFuJtTYq7NtVVP1Dcmkes/LNHVC7cRRQ6aK
 9kQV07JivSkweQaGqICBAnrolrlc+FD5DoZ21g==
X-Google-Smtp-Source: AJdET5eGdSi6U72LuJVh7YpQy4hqb5UeE5oe+Ws3STrIXfGifdZpOBGCd0Ryh50ZCOVi3G6DKMrkCqHaID7MTR0lP58=
X-Received: by 2002:ac8:2d1d:: with SMTP id
 n29-v6mr1783988qta.38.1540415224742; 
 Wed, 24 Oct 2018 14:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20181022224213.GA25145@bogus>
 <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
 <CAL_JsqKA6_saB7Ak=BZqSth6KAZ1g2srF5BsOQRGdE2+rmcR8w@mail.gmail.com>
 <8e420b9dee0f246fda8e018532737b1a@mailhost.ics.forth.gr>
In-Reply-To: <8e420b9dee0f246fda8e018532737b1a@mailhost.ics.forth.gr>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Oct 2018 16:06:52 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+CgxWbCMz_qwLbMJS3fYwKyCMBGVS501-5ShXywyDAXA@mail.gmail.com>
Message-ID:
 <CAL_Jsq+CgxWbCMz_qwLbMJS3fYwKyCMBGVS501-5ShXywyDAXA@mail.gmail.com>
Subject: Re: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
To: Nick Kossifidis <mick@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_140716_517044_00E7956D 
X-CRM114-Status: GOOD (  34.37  )
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
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024210652.Jb4NRuHxd_U9u9zuyAnoxQfcWvEvqDZEvXipRb7xnHw@z>

T24gV2VkLCBPY3QgMjQsIDIwMTggYXQgODozMyBBTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMTgtMTAtMjMgMTc6MzAsIFJvYiBIZXJy
aW5nIM6tzrPPgc6xz4jOtToKPiA+IE9uIE1vbiwgT2N0IDIyLCAyMDE4IGF0IDU6NTUgUE0gUGFs
bWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPgo+ID4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBN
b24sIDIyIE9jdCAyMDE4IDE1OjQyOjEzIFBEVCAoLTA3MDApLCByb2JoQGtlcm5lbC5vcmcgd3Jv
dGU6Cj4gPj4gPiBPbiBNb24sIE9jdCAxNSwgMjAxOCBhdCAwNToyMDoxMFBNICswMzAwLCBOaWNr
IEtvc3NpZmlkaXMgd3JvdGU6Cj4gPj4gPj4gVGhlIC9jaG9zZW4gbm9kZSBpcyBvcHRpb25hbCBz
byB3ZSBzaG91bGQgaGFuZGxlIENNRExJTkUgcmVnYXJkbGVzcwo+ID4+ID4+IHRoZSBwcmVzZW5j
ZSBvZiAvY2hvc2VuL2Jvb3RhcmdzLiBNb3ZlIGhhbmRsaW5nIG9mIENNRExJTkUgaW4KPiA+PiA+
PiBlYXJseV9pbml0X2R0X3NjYW4oKSBpbnN0ZWFkLgo+ID4+ID4KPiA+PiA+IEkgbG9va2VkIGF0
IHRoaXMgYSB3aGlsZSBiYWNrLiBJJ20gbm90IHN1cmUgdGhpcyBiZWhhdmlvciBjYW4gYmUgY2hh
bmdlZAo+ID4+ID4gd2l0aG91dCBicmVha2luZyBzb21lIE1JUFMgcGxhdGZvcm1zIHRoYXQgY291
bGQgYmUgcmVseWluZyBvbiB0aGUKPiA+PiA+IGN1cnJlbnQgYmVoYXZpb3IuIEJ1dCB0cnlpbmcg
dG8gbWFrZSBzZW5zZSBvZiB0aGUgTUlQUyBjb2RlIGlzIGEKPiA+PiA+IGNoYWxsZW5nZSBhbmQg
dGhleSBoYXZlIHNvbWUgb3RoZXIgaXNzdWVzIGluIHRoaXMgYXJlYS4KPiA+PiA+Cj4gPj4gPiBD
YW4ndCB0aGlzIGJlIGZpeGVkIGJ5IG1ha2luZyAvY2hvc2VuIG1hbmRpdG9yeT8gSSdkIGV4cGVj
dCB1bHRpbWF0ZWx5Cj4gPj4gPiB5b3UgYXJlIGFsd2F5cyBnb2luZyB0byBuZWVkIGl0Lgo+ID4+
ID4KPiA+PiA+IEknZCByYXRoZXIgbm90IHJlc29ydCB0byBtYWtpbmcgdGhpcyBwZXIgYXJjaC4g
VGhlcmUncyBhbHNvIHNvbWUgZWZmb3J0Cj4gPj4gPiB0byBjb25zb2xpZGF0ZSBjbWQgbGluZSBo
YW5kbGluZ1sxXS4KPiA+Pgo+ID4+IEknZCByYXRoZXIgbWFrZSAvY2hvc2VuIG1hbmRhdG9yeSBv
biBSSVNDLVYgdGhhbiB0byBoYXZlIHBlci1hcmNoCj4gPj4gaGFuZGxpbmcsIGFzCj4gPj4gbGlr
ZSB5b3UndmUgc2FpZCB0aGVyZSdzIGFscmVhZHkgdG9vIG11Y2ggZHVwbGljYXRpb24uICBUaGF0
IHNhaWQsIGl0Cj4gPj4gZG9lcyBzZWVtCj4gPj4gbGlrZSBhIGJ1ZyB0byBtZSBiZWNhdXNlIHRo
ZSBiZWhhdmlvciBzZWVtcyBzb21ld2hhdCBhcmJpdHJhcnkgLS0gYW4KPiA+PiBlbXB0eQo+ID4+
IC9jaG9zZW4gbm9kZSBjYXVzaW5nIHRoZSBidWlsdC1pbiBjb21tYW5kLWxpbmUgYXJndW1lbnQg
aGFuZGxpbmcgdG8gZ28KPiA+PiBvZmYgdGhlCj4gPj4gcmFpbHMganVzdCBzbWVsbHMgc28gYnVn
Z3kuCj4gPgo+ID4gWWVzLiBQcm9iYWJseSBuZWVkIHRvIGRvIHNvbWUgYXJjaGFlb2xvZ3kgb24g
dGhpcyBjb2RlIHRvIGZpZ3VyZSBvdXQKPiA+IHNvbWUgb2YgdGhlIGV4cGVjdGF0aW9ucy4KPiA+
Cj4gPj4gSWYgdGhhdCdzIHRoZSBjYXNlLCBjb3VsZCB3ZSBhdCBsZWFzdCBoYXZlIHNvbWV0aGlu
ZyBsaWtlCj4gPj4gIkNPTkZJR19PRl9DSE9TRU5fSVNfTUFOREFUT1JZIiB0aGF0IHByb3ZpZGVz
IGEgd2FybmluZyB3aGVuIHRoZXJlIGlzCj4gPj4gbm8KPiA+PiAvY2hvc2VuIG5vZGUgYW5kIGlz
IHNldCBvbiBhcmNoaXRlY3R1cmUgd2hlcmUgdGhlIHNwZWMgbWFuZGF0ZXMKPiA+PiAvY2hvc2Vu
Pwo+ID4KPiA+IEknZCBiZSBva2F5IHRvIG1ha2UgaXQgYSB3YXJuaW5nIHVuY29uZGl0aW9uYWxs
eS4gQXQgbGVhc3QgdGhlbiB3ZSBjYW4KPiA+IGZpbmQgdGhlIGNhc2VzIHRoYXQgZGV2aWF0ZSBh
bmQgZWl0aGVyIGZpeCB0aGVtIG9yIHVuZGVyc3RhbmQgdGhlaXIKPiA+IGV4cGVjdGF0aW9ucy4K
PiA+Cj4gPiBSb2IKPgo+IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIG1ha2UgL2Nob3NlbiBub2RlIG1h
bmRhdG9yeSBzaW5jZSBpdCdzIG5vdAo+IHNwZWNpZmllZCBhcyBzdWNoCj4gYnkgdGhlIHNwZWMK
PiAoaHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3JnL2RldmljZXRyZWUtc3BlY2lmaWNh
dGlvbi9yZWxlYXNlcy90YWcvdjAuMikuCgpXZSBjYW4gY2hhbmdlIHRoZSBzcGVjLiA6KSBNYXli
ZSBvbmx5IHRvIHJlY29tbWVuZGVkIGZvciB0aGUgRFQgc3BlYywKYnV0IHlvdSBzaG91bGQgYWxz
byBjbGVhcmx5IGRlZmluZSB0aGUgYm9vdCBpbnRlcmZhY2UgdG8gdGhlIGtlcm5lbCBvbgpyaXNj
LXYgb3Igc3VmZmVyIHRoZSBwYWluIGxhdGVyLiBBbmQgaW4gdGhhdCB5b3UgY2FuIG1ha2UgaXQg
cmVxdWlyZWQuCgpSZWdhcmRsZXNzLCB3aGF0IEkgd2FzIHJlYWxseSBnZXR0aW5nIGF0IGlzIGVm
ZmVjdGl2ZWx5IGl0IHdpbGwgYmVjb21lCnJlcXVpcmVkIGFueXdheXMuIFByZXR0eSBtdWNoIGV2
ZXJ5IHNldHVwIG5lZWRzIGtlcm5lbCBjbWRsaW5lLiBZZXMgaXQKY2FuIGJlIGJ1aWx0LWluLCBi
dXQgc29vbiBhcyBpdCBpcyB5b3VyIGtlcm5lbCB3b3JrcyBvbiBhIHNpbmdsZQpwbGF0Zm9ybS4g
V2FudCB0byBzdXBwb3J0IGFuIGluaXRyZD8gTmVlZCBjaG9zZW4uIGNyYXNoZHVtcD8gTmVlZApj
aG9zZW4uIFdhbnQgYSBjb25zb2xlPyBOZWVkIGNob3Nlbi4KCj4gTm8gbWF0dGVyIHdoYXQgd2Ug
c2F5IGZyb20gdGhlIGtlcm5lbCBzaWRlLCB0aGUgZGV2aWNlIHRyZWUgcHJvdmlkZXIgaXMKPiBu
b3QgZXhwZWN0ZWQKPiB0byBhbHdheXMgcHJvdmlkZSB0aGUgL2Nob3NlbiBtb2RlLiBBbHNvIGRl
dmljZSB0cmVlIGlzIG5vdCB0aGUgb25seQo+IHByb3ZpZGVyIG9mCj4gYSBjb21tYW5kIGxpbmUs
IHdlIG1pZ2h0IGdldCBhIGNvbW1hbmQgbGluZSBmcm9tIGRpZmZlcmVudCBwbGFjZXMKPiBwZXIt
YXJjaCAoZS5nLiBhdGFncwo+IG9uIGFybSkgb3IgdGhyb3VnaCBFRkkvQUNQSS9rZXhlYyBhcyB3
ZWxsLiBUaGF0J3Mgd2h5IG15IGluaXRpYWwKPiBhcHByb2FjaCBmb3IgUklTQy1WCj4gd2FzIG9u
IHRoZSBhcmNoLXNwZWNpZmljIGNvZGUuCgpBbiBhcmNoIGlzIGZyZWUgdG8gY2hvb3NlIGl0cyBv
d24gd2F5LCB5ZXMuIFlvdSdkIGJlIGNyYXp5IHRvIGludmVudApzb21ldGhpbmcgbmV3IHRob3Vn
aC4KCkFUQUdTIGlzIGxlZ2FjeS4gSWYgd2UgZG8gaGF2ZSBBVEFHUyB3aXRoIERULCB3ZSBmaXgg
aXQgdXAgaW4gb25lCnBsYWNlICh0aGUgZGVjb21wcmVzc29yKSBieSBtb3ZpbmcgYWxsIHRoZSBw
YXJhbWV0ZXJzIHRvIERULiBUaGVuIGl0CmlzIGVpdGhlciBBVEFHUyBvciBEVCBib290IGFuZCBv
bmUgY29kZSBwYXRoIGZyb20gdGhlcmUuIE1JUFMgZG9lcyBub3QKZG8gdGhhdCBhbmQgaXMgYSBt
ZXNzLiBBRkFJQ1QsIHRoZXJlIGNhbiBiZSAzIHNvdXJjZXMgb2YgcGFyYW1ldGVycwooYm9vdGxv
YWRlcihsZWdhY3kpLCBEVCwgb3Iga2VybmVsKSBhbmQgdGhvc2UgaGF2ZSBhbiB1bmRlZmluZWQg
d2F5CnRoZXkgYXJlIGNvbWJpbmVkIChvdGhlciB0aGFuIHdoYXQgdGhlIGNvZGUgaGFwcGVucyB0
byBkbykuIEFuZCBvbiB0b3AKb2YgdGhhdCB0aGUgRFQgY2FuIGJlIGJ1aWx0LWluLCBleHRlcm5h
bCwgb3IgYm90aC4KCkFDUEkgYW5kIEVGSSBkb24ndCBkZWFsIHdpdGggdGhlIGNvbW1hbmQgbGlu
ZSAoYXMgbGVhc3Qgb24gYXJtIGFuZAphcm02NCkuIFRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIGlz
IGFsd2F5cyBwYXNzZWQgdmlhIERULiBEVCBpcyB0aGUKa2VybmVsIGJvb3QgaW50ZXJmYWNlIGV2
ZW4gZm9yIGFybTY0IEFDUEkgc3lzdGVtcy4KClJvYgoKCj4KPiBXZSBzaG91bGRuJ3QgdHJ5IHRv
IGhhbmRsZSB0aGUgYnVpbHQtaW4gQ01ETElORSBvbiBlYWNoIG9mIHRoZSBwb3NzaWJsZQo+IGNv
bW1hbmQgbGluZQo+IHByb3ZpZGVycyBhbmQgaWYgd2UgZG8gd2Ugc2hvdWxkIGF0IGxlYXN0IG1h
a2Ugc3VyZSB3ZSBkb24ndCBkZXBlbmQgb24KPiB0aGUgcHJlc2VuY2UKPiBvZiBhIHByb3ZpZGVk
IGNvbW1hbmQgbGluZSAod2hpY2ggaXMgdGhlIGlzc3VlIGluIHRoaXMgY2FzZSkuCj4KPiBJIGJl
bGlldmUgdGhlIGJlc3QgYXBwcm9hY2ggaXMgdG8gY29uc29saWRhdGUgYWxsIHRoZSBkaWZmZXJl
bnQgQ01ETElORQo+IGFwcHJvYWNoZXMKPiBmb3IgdGhlIHZhcmlvdXMgYXJjaHMgLyBwcm92aWRl
cnMgYW5kIGNsZWFuIHVwIHRoZSBtZXNzIGluc3RlYWQgb2YKPiByZS1pbXBsZW1lbnRpbmcKPiB0
aGUgc2FtZSB0aGluZyBhZ2FpbiBhbmQgYWdhaW4uIEkgc2F3IHRoZSBwYXRjaCB5b3UgbWVudGlv
bmVkIGFuZCBpdCdzIGEKPiBzdGFydC4KPiBJJ2xsIGxvb2sgbW9yZSBpbnRvIGl0IGFuZCB0cnkg
dG8gY29tZSB1cCB3aXRoIGEgc2ltaWxhciBvbmUuCj4KPiBOaWNrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
