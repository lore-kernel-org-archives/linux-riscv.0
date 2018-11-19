Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7837C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 22:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7264820851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 22:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HHI/8/p+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Rm17qlqB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7264820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ows/w+lLbC285iY2z2d/+Fw/xDMp/2bB47HLEmTiHWw=; b=HHI/8/p+om4sKXgAHOJkbPIzL
	ugu5pnCKmhbyi9XHpkucJSAzeaolR/LpFFpcMrxQ2Sh8lA//jLikkd7J/N/algqpvfHTKZD5y8CcD
	UXMfYMfDT602DAlYqv/5SN7vAicFrKn6rv3t1a/l8KZtZi+QzgTV4JGhk0RtufDA6+3buF2Sfz71k
	E7taNeAntIH1y1FOuaKRwwko9g7W/Bc3nJKrpcscDVgXXeg3YFLVTXDNspp3uo5MkY0aiEbPdXAKR
	bJ2iukWGVSVpXA/12KwGEcvOiRw6XMDFWAJFl57g2gHzC0BDSb45xmHfJ44lqaRinwKTVVR5SFVYt
	zh9pHsbdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOsMv-00031V-C9; Mon, 19 Nov 2018 22:50:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsMo-0002AA-Kg
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 22:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uTC/mop8FCmYwr8dlh0yN+nMrvhR4ag6NhnQvZDsmGc=; b=Rm17qlqBfuHzgNhLnNj+wbkAGQ
 XMcm2auoLcoe70dWQmSqr92TVIcC/JuxEDKLfwYKUrc7B+/hP7WDSV2VB+0iZoF17GWsssZJEygtm
 6gBAvHe7DC7yjVltf4aW1ff5hPHxogBiPkT5CvGR1aJCQe7/ieyrSSobaL2NwnqA7YVAcJSbBGngi
 vSW1AXgrHSdvQ/hBrd39KTI3S+JLFHesxg7R6m9H9LKKEOkfnbRiI8eNCxNWwyWx8AXNOGRSb0C6a
 C7uPny6b2aAAPs1c5PDh+a7YE+a3NFiYQatwDQoujBRwixjJsHotcDAgy4QzkPQGvK2LPZwdoGmP+
 GoeSr6JQ==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsMl-0002uZ-7v
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 22:50:05 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAJMmQds072508; Tue, 20 Nov 2018 00:48:28 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-cd-5bf33db858a3
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 18.76.03682.8BD33FB5; Tue, 20 Nov 2018 00:48:25 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAJMmOub017089; Tue, 20 Nov 2018 00:48:24 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 20 Nov 2018 00:48:24 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v5] RISC-V: Update Kconfig to better handle CMDLINE
Organization: FORTH
In-Reply-To: <95449dce-5bca-1034-e6ed-947055a37abd@wdc.com>
References: <20181119210907.12040-1-palmer@sifive.com>
 <95449dce-5bca-1034-e6ed-947055a37abd@wdc.com>
Message-ID: <32feca21cac15e84893eb1e39a5cf684@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsXSHc2orLvT9nO0warjWhaLVnxnsVh/8hOL
 xbbPLWwWze/OsVtsnrCA1YHVY+esu+weDzddYvLYvKTe41LzdXaP9gPdTAGsUVw2Kak5mWWp
 Rfp2CVwZTfPZCt6oVTRtnMfYwHhVrouRk0NCwERi7cwDTCC2kMARRokF1y27GLmA7EOMEk+P
 b2ODKDKVmL23kxHE5hUQlDg58wkLiM0sYCEx9cp+RghbXqJ562xmEJtFQFXiyfEbYDVsApoS
 8y8dBLI5OESA4rMW8UOUV0o8vdTLDhIWFnCXWNKZBBLmFxCW+HT3IiuIzSlgLTH7Sj8jSImQ
 QLpE+600iANcJM5t+MYIcZiKxIffD9hBbFEBZYkXJ6azTmAUmoXkzllI7pyF5M4FjMyrGAUS
 y4z1MpOL9dLyi0oy9NKLNjGCw32u7w7GcwvsDzEKcDAq8fAKmH+OFmJNLCuuzAWGCgezkghv
 wLJP0UK8KYmVValF+fFFpTmpxYcYpTlYlMR5D78IDwK6N7EkNTs1tSC1CCbLxMEp1cBouNyg
 YUaGlf63uqeHpd2eJnydNGf2w8WOLzaf9ulwYfbhjFD7vLbQbcNd5d8SmzKiZqiLPb1rFBnn
 vd3pzVnVqbdMlznmnvnz5oFrrsCTXkNlz6i+zzvCc3ljNj1u5+50klu/MKVh34fweFU3SY7W
 Ny1i4a2CbOLsKh1nOXc//WLpfLX//HElluKMREMt5qLiRABAHfymcwIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_225003_472479_94229AB5 
X-CRM114-Status: GOOD (  26.97  )
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
Cc: mick@ics.forth.gr, dmaliotaki@gmail.com, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119224824.XZBo3M7hp-2cWQ0VfKbiJxbxPF7yzxy24qqimlt9k3E@z>

zqPPhM65z4IgMjAxOC0xMS0yMCAwMDozNywgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+IE9u
IDExLzE5LzE4IDE6MTAgUE0sIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+PiBGcm9tOiBOaWNrIEtv
c3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+PiAKPj4gQWRkZWQgYSBtZW51IHRvIGNob29z
ZSBob3cgdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZSB3aWxsIGJlCj4+IHVzZWQgYW5kIENNRExJ
TkVfRVhURU5EIGZvciBjb21wYXRpYmlsaXR5IHdpdGggRkRUIGNvZGUuCj4+IAo+PiB2MjogSW1w
cm92ZWQgaGVscCBtZXNzYWdlcywgcmVtb3ZlZCByZWZlcmVuY2VzIHRvIGJvb3Rsb2FkZXIKPj4g
YW5kIG1hZGUgdGhlbSBtb3JlIGRlc2NyaXB0aXZlLiBJIGFsc28gYXNrZWQgaGVscCBmcm9tIGEK
Pj4gZnJpZW5kIHdobydzIGEgbGFuZ3VhZ2UgZXhwZXJ0IGp1c3QgaW4gY2FzZS4KPj4gCj4+IHYz
OiBUaGlzIHRpbWUgdXNlZCB0aGUgY29ycmVjdGVkIHRleHQKPj4gCj4+IHY0OiBDb3B5IHRoZSBj
b25maWcgc3RyaW5ncyBmcm9tIHRoZSBhcm0zMiBwb3J0Lgo+PiAKPj4gdjU6IEFjdHVhbGx5IGNv
cHkgdGhlIGNvbmZpZyBzdHJpbmdzIGZyb20gdGhlIGFybTMyIHBvcnQuCj4gCj4gV2h5IG5vdCB1
c2UgQ01ETElORV9GUk9NX0JPT1RMT0FERVIgaW5zdGVhZCBvZiBDTURMSU5FX0ZBTExCQUNLIGlu
Cj4gdGhhdCBjYXNlPyBUbyBteSBlYXJzLCBDTURMSU5FX0ZST01fQk9PVExPQURFUiBtYWRlIG1v
cmUgc2Vuc2UgZ2l2ZW4KPiB0aGUgZGVzY3JpcHRpb24uIElmIENNRExJTkVfRkFMTEJBQ0sgaXMg
cmV0YWluZWQgaW50ZW50aW9uYWxseSwgdGhlbgo+IGl0J3Mgb2suCj4gCj4gUmVnYXJkcywKPiBB
dGlzaAoKVGhleSBhcmUgYm90aCB1c2VkIGFzIHBsYWNlaG9sZGVycyBzbyB0aGF0IHdlIGRvbid0
IHRyaWdnZXIKQ01ETElORV9FWFRFTkQgb3IgQ01ETElORV9GT1JDRSBzbyBpdCBkb2Vzbid0IHJl
YWxseSBtYXR0ZXIKaG93IHdlIGNhbGwgdGhlbS4gVG8gbWUgQ01ETElORV9GUk9NX0JPT1RMT0FE
RVIgaW1wbGllcyB0aGF0CndlIGdldCB0aGUgY29tbWFuZCBsaW5lIGZyb20gdGhlIGJvb3Rsb2Fk
ZXIgd2hlcmUgaW4gZmFjdCB3ZQpnZXQgaXQgZnJvbSB0aGUgZGV2aWNlIHRyZWUgYW5kIHdlIG1p
Z2h0IGdldCBpdCBmcm9tIG90aGVyCmNoYW5uZWxzIGluIHRoZSBmdXR1cmUgKGUuZy4ga2V4ZWMp
LiBJIHRoaW5rIGl0J3MgbWlzbGVhZGluZwp0byBoYXZlIGFueSByZWZlcmVuY2VzIG9uIGhvdyB3
ZSBnZXQgdGhlIGNvbW1hbmQgbGluZSwgdGhhdCdzCndoeSBJIHJlbW92ZWQgYW55IHJlZmVyZW5j
ZXMgdG8gdGhlIGJvb3Rsb2FkZXIgZnJvbSB0aGUgdGV4dAphcyB3ZWxsLCBDTURMSU5FX0ZBTExC
QUNLIG9uIHRoZSBvdGhlciBoYW5kIGRlc2NyaWJlcyBob3cKd2UgdXNlIHRoZSBwcm92aWRlZCBj
b21tYW5kIGxpbmUsIHdoaWNoIGlzIG1vcmUgYXBwcm9wcmlhdGUKSU1ITy4KClJlZ2FyZHMsCk5p
Y2sKCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRo
LmdyPgo+PiBTaWduZWQtb2ZmLWJ5OiBEZWJiaWUgTWFsaW90YWtpIDxkbWFsaW90YWtpQGdtYWls
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29t
Pgo+PiAtLS0KPj4gICBhcmNoL3Jpc2N2L0tjb25maWcgfCA1NyAKPj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzMyBp
bnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggNTVkYTkzZjRlODE4Li4y
M2FjNmQ2ZjlhYjIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPj4gQEAgLTIyNywzOSArMjI3LDQ4IEBAIGVuZG1lbnUKPj4gICAg
IG1lbnUgIkJvb3Qgb3B0aW9ucyIKPj4gICAtY29uZmlnIENNRExJTkVfQk9PTAo+PiAtCWJvb2wg
IkJ1aWx0LWluIGtlcm5lbCBjb21tYW5kIGxpbmUiCj4+ICtjb25maWcgQ01ETElORQo+PiArCXN0
cmluZyAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKPj4gICAJaGVscAo+PiAtCSAgRm9y
IG1vc3QgcGxhdGZvcm1zLCBpdCBpcyBmaXJtd2FyZSBvciBzZWNvbmQgc3RhZ2UgYm9vdGxvYWRl
cgo+PiAtCSAgdGhhdCBieSBkZWZhdWx0IHNwZWNpZmllcyB0aGUga2VybmVsIGNvbW1hbmQgbGlu
ZSBvcHRpb25zLgo+PiAtCSAgSG93ZXZlciwgaXQgbWlnaHQgYmUgbmVjZXNzYXJ5IG9yIGFkdmFu
dGFnZW91cyB0byBlaXRoZXIgb3ZlcnJpZGUKPj4gLQkgIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21t
YW5kIGxpbmUgb3IgYWRkIGEgZmV3IGV4dHJhIG9wdGlvbnMgdG8gaXQuCj4+IC0JICBGb3Igc3Vj
aCBjYXNlcywgdGhpcyBvcHRpb24gYWxsb3dzIGhhcmRjb2RpbmcgY29tbWFuZCBsaW5lIG9wdGlv
bnMKPj4gLQkgIGRpcmVjdGx5IGludG8gdGhlIGtlcm5lbC4KPj4gKwkgIEZvciBtb3N0IHBsYXRm
b3JtcywgdGhlIGFyZ3VtZW50cyBmb3IgdGhlIGtlcm5lbCdzIGNvbW1hbmQgbGluZQo+PiArCSAg
YXJlIHByb3ZpZGVkIGF0IHJ1bi10aW1lLCBkdXJpbmcgYm9vdC4gSG93ZXZlciwgdGhlcmUgYXJl
IGNhc2VzCj4+ICsJICB3aGVyZSBlaXRoZXIgbm8gYXJndW1lbnRzIGFyZSBiZWluZyBwcm92aWRl
ZCBvciB0aGUgcHJvdmlkZWQKPj4gKwkgIGFyZ3VtZW50cyBhcmUgaW5zdWZmaWNpZW50IG9yIGV2
ZW4gaW52YWxpZC4KPj4gICAtCSAgRm9yIHRoYXQsIGNob29zZSAnWScgaGVyZSBhbmQgZmlsbCBp
biB0aGUgZXh0cmEgYm9vdCBwYXJhbWV0ZXJzCj4+IC0JICBpbiBDT05GSUdfQ01ETElORS4KPj4g
KwkgIFdoZW4gdGhhdCBvY2N1cnMsIGl0IGlzIHBvc3NpYmxlIHRvIGRlZmluZSBhIGJ1aWx0LWlu
IGNvbW1hbmQKPj4gKwkgIGxpbmUgaGVyZSBhbmQgY2hvb3NlIGhvdyB0aGUga2VybmVsIHNob3Vs
ZCB1c2UgaXQgbGF0ZXIgb24uCj4+ICAgLQkgIFRoZSBidWlsdC1pbiBvcHRpb25zIHdpbGwgYmUg
Y29uY2F0ZW5hdGVkIHRvIHRoZSBkZWZhdWx0IGNvbW1hbmQKPj4gLQkgIGxpbmUgaWYgQ01ETElO
RV9GT1JDRSBpcyBzZXQgdG8gJ04nLiBPdGhlcndpc2UsIHRoZSBkZWZhdWx0Cj4+IC0JICBjb21t
YW5kIGxpbmUgd2lsbCBiZSBpZ25vcmVkIGFuZCByZXBsYWNlZCBieSB0aGUgYnVpbHQtaW4gc3Ry
aW5nLgo+PiArY2hvaWNlCj4+ICsJcHJvbXB0ICJCdWlsdC1pbiBjb21tYW5kIGxpbmUgdXNhZ2Ui
IGlmIENNRExJTkUgIT0gIiIKPj4gKwlkZWZhdWx0IENNRExJTkVfRkFMTEJBQ0sKPj4gKwloZWxw
Cj4+ICsJICBDaG9vc2UgaG93IHRoZSBrZXJuZWwgd2lsbCBoYW5kbGUgdGhlIHByb3ZpZGVkIGJ1
aWx0LWluIGNvbW1hbmQKPj4gKwkgIGxpbmUuCj4+ICAgLWNvbmZpZyBDTURMSU5FCj4+IC0Jc3Ry
aW5nICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBzdHJpbmciCj4+IC0JZGVwZW5kcyBvbiBDTURM
SU5FX0JPT0wKPj4gLQlkZWZhdWx0ICIiCj4+ICtjb25maWcgQ01ETElORV9GQUxMQkFDSwo+PiAr
CWJvb2wgIlVzZSBib290bG9hZGVyIGtlcm5lbCBhcmd1bWVudHMgaWYgYXZhaWxhYmxlIgo+PiAg
IAloZWxwCj4+IC0JICBTdXBwbHkgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBi
eSBlbnRlcmluZyB0aGVtIGhlcmUuCj4+ICsJICBVc2UgdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGlu
ZSBhcyBmYWxsYmFjayBpbiBjYXNlIHdlIGdldCBub3RoaW5nCj4+ICsJICBkdXJpbmcgYm9vdC4g
VGhpcyBpcyB0aGUgZGVmYXVsdCBiZWhhdmlvdXIuCj4+IAo+PiArY29uZmlnIENNRExJTkVfRVhU
RU5ECj4+ICsJYm9vbCAiRXh0ZW5kIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKPj4gKwlo
ZWxwCj4+ICsJICBUaGUgY29tbWFuZC1saW5lIGFyZ3VtZW50cyBwcm92aWRlZCBkdXJpbmcgYm9v
dCB3aWxsIGJlCj4+ICsJICBhcHBlbmRlZCB0byB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lLiBU
aGlzIGlzIHVzZWZ1bCBpbgo+PiArCSAgY2FzZXMgd2hlcmUgdGhlIHByb3ZpZGVkIGFyZ3VtZW50
cyBhcmUgaW5zdWZmaWNpZW50IGFuZAo+PiArCSAgeW91IGRvbid0IHdhbnQgdG8gb3IgY2Fubm90
IG1vZGlmeSB0aGVtLgo+PiArCj4+ICAgICBjb25maWcgQ01ETElORV9GT1JDRQo+PiAtCWJvb2wg
IkJ1aWx0LWluIGNvbW1hbmQgbGluZSBvdmVycmlkZXMgYm9vdGxvYWRlciBhcmd1bWVudHMiCj4+
IC0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wKPj4gKwlib29sICJBbHdheXMgdXNlIHRoZSBkZWZh
dWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKPj4gICAJaGVscAo+PiAtCSAgU2V0IHRoaXMgb3B0
aW9uIHRvICdZJyB0byBoYXZlIHRoZSBrZXJuZWwgaWdub3JlIHRoZSBib290bG9hZGVyCj4+IC0J
ICBvciBmaXJtd2FyZSBjb21tYW5kIGxpbmUuICBJbnN0ZWFkLCB0aGUgYnVpbHQtaW4gY29tbWFu
ZCBsaW5lCj4+IC0JICB3aWxsIGJlIHVzZWQgZXhjbHVzaXZlbHkuCj4+ICsJICBBbHdheXMgdXNl
IHRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUsIGV2ZW4gaWYgd2UgZ2V0IG9uZSBkdXJpbmcKPj4g
KwkgIGJvb3QuIFRoaXMgaXMgdXNlZnVsIGluIGNhc2UgeW91IG5lZWQgdG8gb3ZlcnJpZGUgdGhl
IHByb3ZpZGVkCj4+ICsJICBjb21tYW5kIGxpbmUgb24gc3lzdGVtcyB3aGVyZSB5b3UgZG9uJ3Qg
aGF2ZSBvciB3YW50IGNvbnRyb2wKPj4gKwkgIG92ZXIgaXQuCj4+ICAgLQkgIElmIHlvdSBkb24n
dCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IE4uCj4+ICtlbmRjaG9pY2UKPj4gICAgIGVuZG1l
bnUKPj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
