Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB36AC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 22:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2RX7yL1rSxwUnoeniuKJTtS54u4fBaJP7Fz2k8sa20=; b=HmYSwY8N+tb5dQ
	Qpo0gbNj8mV/mvWpr2Gdr56yWZiZfjqT6FWkaPbNyFNYg6Zph+0SrwxBzD3GDFHly2CItGPAsHsn4
	j6pyi8PkLLP3O+wV+TniJzs+ctm4+/Z6BsvIR4vqPQ1av0l1W0MrRZsRenTpgortQp7H5MUNf6uD+
	Fn0n+VhmdCIMSNNlGgOeErigiesnAt7yiHVjitFt/htr71MTi9w5KCvCof+e9DQd5hasC9TsXAS/i
	mjLKqwFk1GN3hXAmZ0kzIkT9CBfulmfismHi6DPVqCxCfkA/M1RR3ySkMIURk+X/HbGCCmCklqpbt
	M3J59I3YJZpiCAi2cmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rktKr-0000000FoqU-1W6j;
	Thu, 14 Mar 2024 22:14:01 +0000
Received: from fhigh1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rktKo-0000000Fopy-3Nt9
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 22:14:00 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 2B4B111400C4;
	Thu, 14 Mar 2024 18:13:57 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 14 Mar 2024 18:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710454437;
	 x=1710540837; bh=vivKg5+OyOJIIeNnBBdAiGprv5k8QrGtaVhN3LINHxE=; b=
	p7md9jhG/Lhvq0uLA5jDrho+nqA9Ret9hk+eGXRiSLJ91ZAhKaiWrmEncuOPSk0x
	tWVRNpx2lhSqr/nkK/RvYw8wM7MiYPg9Mh98c6mNTlWUK8pjJc5mZO2aLLGIurqZ
	Aiyw+I8fjBZu1vZuqgbk+Po2KvgbK8c6G6l/UOhe9nh/CN8E9se35oc6D8/CMGbV
	0oGHcr+5tUEoduOWPmLszvPnOPSHEZ/TBSvPcQNLtlLHpxpTn4YPNWl2QydRK3sL
	DDkuuJp3THUQoBO/1redmBg14XRIBYShbGffavgFAObFgtvBx6hxPsCn6EUaDbgG
	psn1ty22stYw/6g4bCuB2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710454437; x=
	1710540837; bh=vivKg5+OyOJIIeNnBBdAiGprv5k8QrGtaVhN3LINHxE=; b=G
	6UyvVnXg4F0QNYYuPICSKmEQiISWeg0J0z+MZZ5+gNA6MRsCFaF4OC5LxNPP/6Wq
	5q7USPgPBafDXmHERr6NNoZNp1PR/ZgzXCtgH7d5t0lS/a/zUTEpOosU0sNd8MMD
	SFmWQti+jGhaYcV063czsHoHsJDg7qZK46xKjnai5XilKGh7VCsQkY+AfZ9cJbWY
	JAVFroqIUoslVWRqnuazFd5Sdwp33iHpucDP87GQqI72izxyxSKVWN1rIcYCx20I
	/1QJqMkH4WnYLBQGRhegtNb5XITpVdHy8SvLZpa7k0sMK1szeoW2jAsJslUktDlm
	Oqbk0cNTc1EHumnl7KQoQ==
X-ME-Sender: <xms:pHbzZcs_-oIaUI4ENeohfSPgOmqIAnND3zmuthsgY9VWzC6aCpanEw>
    <xme:pHbzZZen97rv3HnNqI6r1-DPTkZHONEY4JLMKJYngXnHUNvpuvVxCIN1QP91u5t4D
    a3LHHYI81WYYomfKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeejgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpeffteehhefguedtleeufeekgfduvddufffhuddvkeevhfff
    uedttdffheelfefhgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgrug
    gvrggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepshhorhgvrghrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:pHbzZXxdmIQIHDcpnaikkZWrraLR55pnuiPkbMzqQJxZZ3v4IbccXg>
    <xmx:pHbzZfOhEFTrWvloWDMp4r3lTko9oAqLskiBevD11srFWi76sYJ-OA>
    <xmx:pHbzZc8K3f7kGXNSpSMCcIGfAHJfnUVwB0ctww_aaH3QZrh0IPp1tQ>
    <xmx:pHbzZXUwjhVWOnGEY9F__svt9aZAUbiLbnIaOl78086nx2CFh94ciQ>
    <xmx:pXbzZXVVnCHA4RKkbZxAOEtEXo150jo6Bi7gspUHGqmJtinMFKu0rA>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7F52E1700093; Thu, 14 Mar 2024 18:13:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-287-gcf6d0d8ecf-fm-20240312.001-gcf6d0d8e
MIME-Version: 1.0
Message-Id: <b3a348ca-e9c8-4561-9cbc-d2a0ebf9ad3a@app.fastmail.com>
In-Reply-To: <CABgGipX75Tg0fROPJgQea0ijmMq8dkbxEqFh4=nv-mRRpO45dw@mail.gmail.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
 <7f968290-2ca3-49c9-b76a-04849abb637e@app.fastmail.com>
 <CABgGipX75Tg0fROPJgQea0ijmMq8dkbxEqFh4=nv-mRRpO45dw@mail.gmail.com>
Date: Thu, 14 Mar 2024 18:13:35 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Andy Chiu" <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, "Palmer Dabbelt" <palmer@dabbelt.com>,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>
Subject: Re: [v1, 0/6] Support Zve32[xf] and Zve64[xfd] Vector subextensions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_151358_940599_D77FBED3 
X-CRM114-Status: GOOD (  36.17  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQsIGF0IDU6MTUgQU0sIEFuZHkgQ2hpdSB3cm90ZToKPiBPbiBU
dWUsIE1hciAxMiwgMjAyNCBhdCA5OjE34oCvUE0gU3RlZmFuIE8nUmVhciA8c29yZWFyQGZhc3Rt
YWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgTWFyIDEyLCAyMDI0LCBhdCA4OjM2IEFNLCBB
bmR5IENoaXUgd3JvdGU6Cj4+ID4gVGhlIHNlcmllcyBjb21wb3NlcyBvZiB0d28gcGFydHMuIFRo
ZSBmaXJzdCBwYXJ0IHByb3ZpZGVzIGEgcXVpY2sgZml4IGZvcgo+PiA+IHRoZSBpc3N1ZSBvbiBh
IHJlY2VudCB0aHJlYWRbMV0uIFRoZSBpc3N1ZSBoYXBwZW5zIHdoZW4gYSBwbGF0Zm9ybSBoYXMK
Pj4gPiB1bnVuaWZpZWQgdmVjdG9yIHJlZ2lzdGVyIGxlbmd0aCBhY3Jvc3MgbXVsdGlwbGUgY29y
ZXMuIFNwZWNpZmljYWxseSwKPj4gPiBwYXRjaCAxIGFkZHMgYSBjb21tZW50IGF0IGEgY2FsbHNp
dGUgb2YgcmlzY3Zfc2V0dXBfdnNpemUgdG8gY2xhcmlmeSBob3cKPj4gPiB2bGVuYiBpcyBvYnNl
cnZlZCBieSB0aGUgc3lzdGVtLiBQYXRjaCAyIGZpeGVzIHRoZSBpc3N1ZSBieSBmYWlsaW5nIHRo
ZQo+PiA+IGJvb3QgcHJvY2VzcyBvZiBhIHNlY29uZGFyeSBjb3JlIGlmIHZsZW5iIG1pc21hdGNo
ZXMuCj4+ID4KPj4gPiBUaGUgc2Vjb25kIHBhcnQgb2YgdGhlIHNlcmllcyBwcm92aWRlIGEgZmlu
ZXIgZ3JhaW4gdmlldyBvZiB0aGUgVmVjdG9yCj4+ID4gZXh0ZW5zaW9uLiBQYXRjaCAzIGdpdmUg
dGhlIG9ic29sZXRlIElTQSBwYXJzZXIgdGhlIGFiaWxpdHkgdG8gZXhwYW5kCj4+ID4gSVNBIGV4
dGVuc2lvbnMgZm9yIHNpZ2xlIGxldHRlciBleHRlbnNpb25zLiBQYXRjaCAzLCA0IGludHJvZHVj
ZXMgWnZlMzJ4LAo+PiA+IFp2ZTMyZiwgWnZlNjR4LCBadmU2NGYsIFp2ZTY0ZCBmb3IgaXNhIHBh
cnNpbmcgYW5kIGh3cHJvYmUuIFBhdGNoIDUKPj4gPiB1cGRhdGVzIGFsbCBjYWxsc2l0ZXMgc3Vj
aCB0aGF0IFZlY3RvciBzdWJleHRlbnNpb25zIGFyZSBtYXhpbXVtbHkKPj4gPiBzdXBwb3J0ZWQg
YnkgdGhlIGtlcm5lbC4KPj4KPj4gV2hhdCBpcyB0aGUgZW5kIHVzZXIgcHJvZ3JhbW1pbmcgaW50
ZXJmYWNlIGZvciB0aGlzIGludGVuZGVkIHRvIGJlPyBwcmN0bAo+PiBjYWxsIHVzaW5nIGlubGlu
ZSBhc20gZWNhbGwgaW4gdGhlIGlmdW5jIHJlc29sdmVyLCBwb3NzaWJseSBhdXRvbWF0ZWQgdXNp
bmcKPj4gZnVuY3Rpb24gbXVsdGktdmVyc2lvbmluZz8gQ2FuIHdlIGRvIGJldHRlciB3aXRoIGEg
ZGlmZmVyZW50IGludGVyZmFjZT8KPgo+IElmIGEgcGxhdGZvcm0gc3VwcG9ydHMgZnVsbCBWLCB0
aGVuIHRoZSB1c2VyIHNpbXBseSBnZXRzIGl0IGJ5IHJlYWRpbmcKPiBFTEZfSFdDQVAuIEVMRl9I
V0NBUCBoYXMgdGhlICd2JyBiaXQgc2V0IHdoZW4gYWxsIGZvbGxvd2luZyBjb25kaXRpb25zCj4g
YXJlIG1ldDoKPiAgMS4gVGhlIHNpbmdsZS1sZXR0ZXIgJ3YnIGV4dGVuc2lvbiBpcyBwcmVzZW50
ZWQgb24gcGxhdGZvcm0KPiAgMi4gVGhlIGtlcm5lbCBoYXMgQ09ORklHX1JJU0NWX0lTQV9WCj4g
IDMuIFRoZSBWZWN0b3IgZW5hYmxlbWVudCBzdGF0dXNbMV0gZm9yIHRoZSB1c2VyIHByb2Nlc3Mg
aXMgc2V0IHRvCj4gICAgICBQUl9SSVNDVl9WX1ZTVEFURV9DVFJMX09OLiBUaGlzIGlzIHRydWUg
YnkgZGVmYXVsdCBidXQgY2FuIGJlCj4gICAgICBjaGFuZ2VkIGluIEtjb25maWcgb3IgdGhlIHN5
c2N0bCBrbm9iLgo+Cj4gSWYgYSBwbGF0Zm9ybSBvbmx5IHN1cHBvcnRzIHNvbWUgb2YgWnZlKiBi
dXQgbm90IFYsIHRoZW4gRUxGX0hXQ0FQCj4gY2Fubm90IGhlbHAuIFRoZSB1c2VyIHdvdWxkIGVu
ZCB1cCBoYXZpbmcgdG8gbWFrZSBhIHByY3RsIGNhbGwgdG8gc2VlCj4gaWYgY3VycmVudCdzIFBS
X1JJU0NWX1ZfVlNUQVRFX0NUUkxfT04gaXMgdHJ1ZS4gSSBhZ3JlZSB3ZSBuZWVkIGEKPiBiZXR0
ZXIgd2F5IGZvciBadmUqIGNhc2VzLiBJIGFtIGNvbnNpZGVyaW5nIGlmIHdlIGNvdWxkIGR1cGxp
Y2F0ZSB0aGUKPiBpbmZvcm1hdGlvbiBvZiBjdXJyZW50IHZlY3RvciBlbmFibGVtZW50IHN0YXR1
cyBmcm9tIHByY3RsIHRvIGh3cHJvYmUuCj4gTm90IHZlcnkgc3VyZSBpZiB0aGlzIGR1cGxpY2F0
aW9uIGlzIGEgZ29vZCBpZGVhIHRob3VnaC4KCkkgY29uc2lkZXJlZCB0aGlzIGEgd2hpbGUgYWdv
LCBidXQgdGhlIHZkc28gaHdwcm9iZSBvbmx5IGhhcyBhY2Nlc3MgdG8KZGF0YSBhdCB0aGUgZ3Jh
bnVsYXJpdHkgb2YgdGltZSBuYW1lc3BhY2VzLCB3aGljaCBhcmVuJ3QgcmVsZXZhbnQgZm9yIHRo
ZQpwcmN0bC4gV2UgY291bGQgdXNlIGEgZmxhZyB0byByZXF1ZXN0IHByb2Nlc3MtbGV2ZWwgaW5m
b3JtYXRpb24sIHdoaWNoCndvdWxkIGZvcmNlIGEgc3lzY2FsbCwgYnV0IGl0J3MgdW5jbGVhciB0
aGF0J3MgYW55IGJldHRlciB0aGFuIHVzaW5nIGEKcmF3IHByY3RsIHN5c2NhbGwuCgpXaGF0IHdv
dWxkIHdvcmsgcGVyZmVjdGx5IGlzIHBhc3NpbmcgdGhlIExpbnV4LWRlZmluZWQgYml0cyBpbgpB
VF9IV0NBUFsyMzRdLCBidXQgdGhhdCBzZWVtcyBsaWtlIGEgZGlmZmljdWx0IHNlbGwgYXQgdGhp
cyBwb2ludC4KCi1zCgo+IFsxXTogaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9uZXh0
L3Jpc2N2L3ZlY3Rvci5odG1sCj4KPiBUaGFua3MsCj4gQW5keQo+Cj4KPgo+Cj4KPj4KPj4gLXMK
Pj4KPj4gPiBUd28gcGFydHMgb2YgdGhlIHNlcmllcyBhcmUgc2VudCB0b2dldGhlciB0byBlYXNl
IHRoZSBlZmZvcnQgb2YgcGlja2luZwo+PiA+IGRlcGVuZGVuY3kgcGF0Y2hlcy4gVGhlIGZpcnN0
IHBhcnQgY2FuIGJlIG1lcmdlZCBpbmRlcGVuZGVudCBvZiB0aGUKPj4gPiBzZWNvbmQgb25lIGlm
IG5lY2Vzc2FyeS4KPj4gPgo+PiA+IFRoZSBzZXJpZXMgaXMgdGVzdGVkIG9uIGEgUUVNVSBhbmQg
dmVyaWZpZWQgdGhhdCBib290aW5nLCBWZWN0b3IKPj4gPiBwcm9ncmFtcyBjb250ZXh0LXN3aXRj
aCwgc2lnbmFsLCBwdHJhY2UsIHByY3RsKHN5c2N0bCBrbm9iKSBpbnRlcmZhY2VzCj4+ID4gd29y
a3Mgd2hlbiB3ZSBvbmx5IHJlcG9ydCBwYXJ0aWFsIFYgZnJvbSB0aGUgSVNBLgo+PiA+Cj4+ID4g
VGhpcyBwYXRjaCBzaG91bGQgYmUgYWJsZSB0byBhcHBseSBvbiByaXNjLXYgZm9yLW5leHQgYnJh
bmNoIG9uIHRvcCBvZgo+PiA+IHRoZSBjb21taXQgODg2NTE2ZmFlMmI3ICgiUklTQy1WOiBmaXgg
Y2hlY2sgZm9yIHp2a2Igd2l0aCB0aXAtb2YtdHJlZSBjbGFuZyIpCj4+ID4KPj4gPiBbMV06Cj4+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMjI4LXZpY2luaXR5LWNvcm5zdGFs
ay00YjhlYjVmZTU3MzBAc3B1ZC9ULyN1Cj4+ID4KPj4gPiBBbmR5IENoaXUgKDYpOgo+PiA+ICAg
cmlzY3Y6IHZlY3RvcjogYWRkIGEgY29tbWVudCB3aGVuIGNhbGxpbmcgcmlzY3Zfc2V0dXBfdnNp
emUoKQo+PiA+ICAgcmlzY3Y6IHNtcDogZmFpbCBib290aW5nIHVwIHNtcCBpZiBpbmNvbnNpc3Rl
bnQgdmxlbiBpcyBkZXRlY3RlZAo+PiA+ICAgcmlzY3Y6IGNwdWZlYXR1cmU6IGNhbGwgbWF0Y2hf
aXNhX2V4dCgpIGZvciBzaW5nbGUtbGV0dGVyIGV4dGVuc2lvbnMKPj4gPiAgIHJpc2N2OiBjcHVm
ZWF0dXJlOiBhZGQgenZlMzJbeGZdIGFuZCB6dmU2NFt4ZmRdIGlzYSBkZXRlY3Rpb24KPj4gPiAg
IHJpc2N2OiBod3Byb2JlOiBhZGQgenZlIFZlY3RvciBzdWJleHRlc25pb25zIGludG8gaHdwcm9i
ZSBpbnRlcmZhY2UKPj4gPiAgIHJpc2N2OiB2ZWN0b3I6IGFkanVzdCBtaW5pbXVtIFZlY3RvciBy
ZXF1aXJlbWVudCB0byBaVkUzMlgKPj4gPgo+PiA+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QgICB8IDE1ICsrKysrKysKPj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oICAgICAgICAgfCAgNSArKysKPj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0
Y2hfdG8uaCAgICAgfCAgMiArLQo+PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5o
ICAgICAgICB8IDIxICsrKysrKy0tLS0KPj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS94b3Iu
aCAgICAgICAgICAgfCAgMiArLQo+PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oICB8ICA1ICsrKwo+PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAg
ICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tCj4+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL2hlYWQuUyAgICAgICAgICAgICAgIHwgMTQgKysrLS0tLQo+PiA+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYyB8ICA0ICstCj4+ID4gIGFyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYyAgICAgICAgICAgIHwgIDQgKy0KPj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2ln
bmFsLmMgICAgICAgICAgICAgfCAgNiArLS0KPj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9v
dC5jICAgICAgICAgICAgfCAxNCArKysrLS0tCj4+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMgICAgICAgIHwgMTIgKysrKy0tCj4+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rv
ci5jICAgICAgICAgICAgIHwgMTUgKysrKy0tLQo+PiA+ICBhcmNoL3Jpc2N2L2xpYi91YWNjZXNz
LlMgICAgICAgICAgICAgICB8ICAyICstCj4+ID4gIDE1IGZpbGVzIGNoYW5nZWQsIDEzNSBpbnNl
cnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkKPj4gPgo+PiA+IC0tCj4+ID4gMi4xNy4xCj4+ID4K
Pj4gPgo+PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
