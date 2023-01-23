Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F89FC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDHhmcV7GxjqTJBhunPRK3yWCs21ibZNTZZ26zNMg3A=; b=m/3SbAZhpHIWGt
	g7xTjuSiVtPsRlVBO+6/tK9DHE2jy69CblBnmyxepHDQFWmeeVUDZbLDxBvpckL9s83cIh7NRePUQ
	JPzuJ6MqE4zlsyxtA0PzMZqxSqXeDCHK7VLd73IgdhGYBKLFS1ICBq1z6Sgvq1+kNSjgp5LkuJ9KA
	DkN8f23VnGlPnmEn/RCQ7XVIejzyIGNaAep8OMa69UTPsd5bqB6ow/O6YZGt9COBS+wDSoH46fq4S
	uBpTMi5xeggMMqEztRxH8XRMnEAKk7KxAgcJvLBBG/1SRSlK3FgZq9+KWM5YKrCW3mTeEK8BBxcw/
	DJyoRxf4c6O1n22aAhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJx38-00HOSg-4I; Mon, 23 Jan 2023 13:39:50 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJx35-00HORq-2M
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 13:39:49 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 7B60C100011;
	Mon, 23 Jan 2023 13:39:36 +0000 (UTC)
Message-ID: <95d81c9a-11de-7f92-cb76-e4492e9faba8@ghiti.fr>
Date: Mon, 23 Jan 2023 14:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3] riscv: Allow to downgrade paging mode from the command
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
References: <20230123104841.813999-1-alexghiti@rivosinc.com>
 <Y851L2KgfIF3V6of@wendy>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Y851L2KgfIF3V6of@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_053947_283053_848D6742 
X-CRM114-Status: GOOD (  20.01  )
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

SGkgQ29ub3IsCgpPbiAxLzIzLzIzIDEyOjUzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gSGV5IEFs
ZXgsCj4KPiBPbiBNb24sIEphbiAyMywgMjAyMyBhdCAxMTo0ODo0MUFNICswMTAwLCBBbGV4YW5k
cmUgR2hpdGkgd3JvdGU6Cj4+IEFkZCAyIGVhcmx5IGNvbW1hbmQgbGluZSBwYXJhbWV0ZXJzIHRo
YXQgYWxsb3cgdG8gZG93bmdyYWRlIHNhdHAgbW9kZQo+PiAodXNpbmcgdGhlIHNhbWUgbmFtaW5n
IGFzIHg4Nik6Cj4+IC0gIm5vNWx2bCI6IHVzZSBhIDQtbGV2ZWwgcGFnZSB0YWJsZSAoZG93biBm
cm9tIHN2NTcgdG8gc3Y0OCkKPj4gLSAibm80bHZsIjogdXNlIGEgMy1sZXZlbCBwYWdlIHRhYmxl
IChkb3duIGZyb20gc3Y1Ny9zdjQ4IHRvIHN2MzkpCj4+Cj4+IE5vdGUgdGhhdCBnb2luZyB0aHJv
dWdoIHRoZSBkZXZpY2UgdHJlZSB0byBnZXQgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUKPj4gd29y
a3Mgd2l0aCBBQ1BJIHRvbyBzaW5jZSB0aGUgZWZpIHN0dWIgY3JlYXRlcyBhIGRldmljZSB0cmVl
IGFueXdheSB3aXRoCj4+IHRoZSBjb21tYW5kIGxpbmUuCj4+Cj4+IEFsc28sIGFzIHRob3NlIHBh
cmFtcyBhcmUgdHJlYXRlZCB2ZXJ5IGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MgYW5kIHdlCj4+
IHVzZSBzdGFuZGFyZCBkZXZpY2UgdHJlZSBmdW5jdGlvbnMgdGhhdCBtYXkgYmUga2FzYW4gaW5z
dHJ1bWVudGVkLCB3ZQo+PiBvbmx5IGVuYWJsZSB0aGVtIGZvciAhS0FTQU4gY29uZmlndXJhdGlv
bnMuCj4+Cj4+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgo+
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
Cj4+IC0tLQo+IEEgY2hhbmdlbG9nIHdvdWxkIGJlIG5pY2UgaGVyZSwgZXNwZWNpYWxseSBzaW5j
ZSB0aGlzIGlzIGEgcmVzZW5kLgoKCkkgdGhpbmsgeW91IG1heSBoYXZlIGNvbW1lbnRlZCB0aGUg
d3JvbmcgcGF0Y2gsIHRoaXMgb25lIGlzIHdyb25nLCBoZW5jZSAKdGhlIHJlc2VuZCEKCgo+Cj4+
ICAgLi4uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAgICAgICAgIHwgIDkgKyst
Cj4+ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNzIg
KysrKysrKysrKysrKysrKystLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9r
ZXJuZWwtcGFyYW1ldGVycy50eHQKPj4gaW5kZXggNmNmYTZlMzk5NmNmLi5mZDY0NzQxMmVjOTEg
MTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0Cj4+IEBAIC0zNTc4LDggKzM1NzgsMTUgQEAKPj4gICAJCQllbXVsYXRpb24gbGlicmFy
eSBldmVuIGlmIGEgMzg3IG1hdGhzIGNvcHJvY2Vzc29yCj4+ICAgCQkJaXMgcHJlc2VudC4KPj4g
ICAKPj4gLQlubzVsdmwJCVtYODYtNjRdIERpc2FibGUgNS1sZXZlbCBwYWdpbmcgbW9kZS4gRm9y
Y2VzCj4+ICsJbm80bHZsCQlbUklTQ1ZdIERpc2FibGUgNC1sZXZlbCBhbmQgNS1sZXZlbCBwYWdp
bmcgbW9kZXMuIEZvcmNlcwo+PiArCQkJa2VybmVsIHRvIHVzZSAzLWxldmVsIHBhZ2luZyBpbnN0
ZWFkLgo+PiArCQkJTm90ZTogT24gUklTQy1WLCB0aGlzIGNhbid0IGJlIHVzZWQgd2hlbiBLQVNB
TiBpcwo+PiArCQkJZW5hYmxlZC4KPj4gKwo+PiArCW5vNWx2bAkJW1g4Ni02NCxSSVNDVl0gRGlz
YWJsZSA1LWxldmVsIHBhZ2luZyBtb2RlLiBGb3JjZXMKPj4gICAJCQlrZXJuZWwgdG8gdXNlIDQt
bGV2ZWwgcGFnaW5nIGluc3RlYWQuCj4+ICsJCQlOb3RlOiBPbiBSSVNDLVYsIHRoaXMgY2FuJ3Qg
YmUgdXNlZCB3aGVuIEtBU0FOIGlzCj4+ICsJCQllbmFibGVkLgo+PiAgIAo+PiAgIAlub2ZzZ3Ni
YXNlCVtYODZdIERpc2FibGVzIEZTR1NCQVNFIGluc3RydWN0aW9ucy4KPj4gICAKPiBGb3IgdGhl
IGltcHJvdmVkIGRlc2NyaXB0aW9ucyAmIGNvbW1pdCBtZXNzYWdlOgo+IFJldmlld2VkLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKClRoYW5rcyBmb3IgdGhh
dCwgd291bGQgeW91IG1pbmQgYWRkaW5nIHRoYXQgdG8gdGhlIHJlc2VuZCBwYXRjaD8KClRoYW5r
cyBhZ2FpbiwKCkFsZXgKCgo+Cj4gVGhhbmtzLAo+IENvbm9yLgo+Cj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
