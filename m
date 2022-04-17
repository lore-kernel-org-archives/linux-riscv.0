Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457B0C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Apr 2022 02:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o953yxlxpOhPdcRI71WsFAhbUtXDWXPrLkmyKf6SGvU=; b=fGwplugpuwIuae
	/cMqihgAKals2g0wR2kJm76CftRKErCNGqk0TrpYAWcEigresCQt/dluGvaGtw2vY08As4ql4Aw3j
	itLn4eCbU+TkbIhxNJrW6OSiFkmfs+kMMjYZtIPQvRf55xW5+XhFMKTTaTxXO++mvz5KDOHxa2GlK
	zcKuJfIkIZmuvX3jCKYW1QJWiTfvouKwiXAPUUukctWJxbaXtsBKELzCC9/v83uQRZrnwMpOY/jNJ
	ingF3It6lH/ZwXzsIqEou7bB3haAuX05xLF8vNO58uWXa2hzWzZoJUMDRSOttbntMcORE/nEdGgbe
	cZwKRyanJMiUGOoniJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfuU4-00DnJW-BV; Sun, 17 Apr 2022 02:17:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfuU1-00DnJC-EW
 for linux-riscv@lists.infradead.org; Sun, 17 Apr 2022 02:17:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CFAC2B80835
 for <linux-riscv@lists.infradead.org>; Sun, 17 Apr 2022 02:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21822C385B2
 for <linux-riscv@lists.infradead.org>; Sun, 17 Apr 2022 02:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650161866;
 bh=bx2uLNy9kh6NXUmk/gZMiJhVwfpmY33EmUzJDhYYLxc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B9wu3Ycc3o7Ldj2TQeodyCsifUWXfZOzuU9T5dPbWiSCUbV2rK1OhPAKQ9tY7hkUM
 5BF1oXnwJpI1KPM5lcVdTEcVGQ/nW1hIkoaDMU+s/xS1oqz/ljgVl9g8fnA9Sl4rVT
 Q7HqOqtSDFqCTZd7fypi8qkV9nbNfA4hIY4kRfZ1bahEH9w2xQBwg6VmasQZIhrDi1
 rDhZ8nbPCu4SiaKsYgsAXusNlCo4XzPB8Uhzz8mmduqiDC4PnGiZpbf0Z9CuIyJImt
 pBYnW3q8Cld7cn46oYqGaiCpMyN0tN0PHZhQpKknDTJZtTgP/IvO5BVhllSi3OZzhv
 BsymVgZdE2y2Q==
Received: by mail-vs1-f48.google.com with SMTP id v15so8528521vsm.5
 for <linux-riscv@lists.infradead.org>; Sat, 16 Apr 2022 19:17:46 -0700 (PDT)
X-Gm-Message-State: AOAM5305hRlvnaA+kFHQy15LlU2IQP4l2rycd2ggHoUkm/ptpGYIUAdA
 tF7AN6OfvAhxjcYiUre3VibssmCjrhGqmqYpZug=
X-Google-Smtp-Source: ABdhPJwDwPGwTQMvBZ6WuWvZF9H6Zem3ZXbT8gq+nWkq6deMkmC/owhEVrj6n5M9PYzPHIfmQVFje28KIU6QWRlnLnM=
X-Received: by 2002:a05:6102:38d1:b0:325:aff9:358 with SMTP id
 k17-20020a05610238d100b00325aff90358mr1493945vst.8.1650161864963; Sat, 16 Apr
 2022 19:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220307224620.1933061-1-heiko@sntech.de> <YllWTN+15CoskNBt@Red>
 <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
 <YlpxsYREWv/LQ+HY@Red>
 <849a3728-7e84-4f26-0c73-4d68eae9ae01@sholland.org> <YlsZxVjgt3ZNQ7Ub@Red>
In-Reply-To: <YlsZxVjgt3ZNQ7Ub@Red>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 17 Apr 2022 10:17:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSNzLfon7yH3zvOJfYwQnVRvNWW7KygShLqcagRfbyAkg@mail.gmail.com>
Message-ID: <CAJF2gTSNzLfon7yH3zvOJfYwQnVRvNWW7KygShLqcagRfbyAkg@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Heiko Stuebner <heiko@sntech.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Christoph Muellner <cmuellner@linux.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_191749_835734_89C0C323 
X-CRM114-Status: GOOD (  34.74  )
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

T24gU3VuLCBBcHIgMTcsIDIwMjIgYXQgMzozMiBBTSBDb3JlbnRpbiBMYWJiZQo8Y2xhYmJlLm1v
bnRqb2llQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBMZSBTYXQsIEFwciAxNiwgMjAyMiBhdCAxMjo0
NzoyOVBNIC0wNTAwLCBTYW11ZWwgSG9sbGFuZCBhIMOpY3JpdCA6Cj4gPiBPbiA0LzE2LzIyIDI6
MzUgQU0sIENvcmVudGluIExhYmJlIHdyb3RlOgo+ID4gPiBMZSBGcmksIEFwciAxNSwgMjAyMiBh
dCAwOToxOToyM1BNIC0wNTAwLCBTYW11ZWwgSG9sbGFuZCBhIMOpY3JpdCA6Cj4gPiA+PiBPbiA0
LzE1LzIyIDY6MjYgQU0sIENvcmVudGluIExhYmJlIHdyb3RlOgo+ID4gPj4+IExlIE1vbiwgTWFy
IDA3LCAyMDIyIGF0IDExOjQ2OjE4UE0gKzAxMDAsIEhlaWtvIFN0dWVibmVyIGEgw6ljcml0IDoK
PiA+ID4+Pj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gdGhlIGFsdGVybmF0aXZlcyBjaGFuZ2Vz
IGRvbmUgaW4gbXkgc3ZwYm10IHNlcmllcwo+ID4gPj4+PiBhbmQgdGh1cyBhbHNvIGRlcGVuZHMg
b24gQXRpc2gncyBpc2EtZXh0ZW5zaW9uIHBhcnNpbmcgc2VyaWVzLgo+ID4gPj4+Pgo+ID4gPj4+
PiBJdCBpbXBsZW1lbnRzIHVzaW5nIHRoZSBjYWNoZS1tYW5hZ2VtZW50IGluc3RydWN0aW9ucyBm
cm9tIHRoZSAgWmljYm9tLQo+ID4gPj4+PiBleHRlbnNpb24gdG8gaGFuZGxlIGNhY2hlIGZsdXNo
LCBldGMgYWN0aW9ucyBvbiBwbGF0Zm9ybXMgbmVlZGluZyB0aGVtLgo+ID4gPj4+Pgo+ID4gPj4+
PiBTb0NzIHVzaW5nIGNwdSBjb3JlcyBmcm9tIFQtSGVhZCBsaWtlIHRoZSBBbGx3aW5uZSBEMSBp
bXBsZW1lbnQgYQo+ID4gPj4+PiBkaWZmZXJlbnQgc2V0IG9mIGNhY2hlIGluc3RydWN0aW9ucy4g
QnV0IHdoaWxlIHRoZXkgYXJlIGRpZmZlcmVudCwKPiA+ID4+Pj4gaW5zdHJ1Y3Rpb25zIHRoZXkg
cHJvdmlkZSB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5LCBzbyBhIHZhcmlhbnQgY2FuCj4gPiA+Pj4+
IGVhc2x5IGhvb2sgaW50byB0aGUgZXhpc3RpbmcgYWx0ZXJuYXRpdmVzIG1lY2hhbmlzbSBvbiB0
aG9zZS4KPiA+ID4+Pj4KPiA+ID4+Pj4KPiA+ID4+Pgo+ID4gPj4+IEhlbGxvCj4gPiA+Pj4KPiA+
ID4+PiBJIGFtIHRlc3RpbmcgaHR0cHM6Ly9naXRodWIuY29tL3NtYWV1bC9saW51eC5naXQgYnJh
bmNoOm9yaWdpbi9yaXNjdi9kMS13aXAgd2hpY2ggY29udGFpbiB0aGlzIHNlcmllLgo+ID4gPj4+
Cj4gPiA+Pj4gSSBhbSBoaXR0aW5nIGEgYnVmZmVyIGNvcnJ1cHRpb24gcHJvYmxlbSB3aXRoIERN
QS4KPiA+ID4+PiBUaGUgc3VuOGktY2UgY3J5cHRvIGRyaXZlciBmYWlsIHNlbGYgdGVzdHMgZHVl
IHRvICJkZXZpY2Ugb3ZlcnJhbiBkZXN0aW5hdGlvbiBidWZmZXIiLgo+ID4gPj4+IEluIGZhY3Qg
dGhlIGJ1ZmZlciBpcyBub3Qgb3ZlcnJhbiBieSBkZXZpY2UgYnV0IGJ5IGRtYV9tYXBfc2luZ2xl
KCkgb3BlcmF0aW9uLgo+ID4gPj4+Cj4gPiA+Pj4gVGhlIGZvbGxvd2luZyBzbWFsbCBjb2RlIHNo
b3cgdGhlIHByb2JsZW06Cj4gPiA+Pj4KPiA+ID4+PiBkbWFfYWRkcl90IGRtYTsKPiA+ID4+PiB1
OCAqYnVmOwo+ID4gPj4+ICNkZWZpbmUgQlNJWkUgMjA0OAo+ID4gPj4+ICNkZWZpbmUgRE1BU0la
RSAxNgo+ID4gPj4+Cj4gPiA+Pj4gYnVmID0ga21hbGxvYyhCU0laRSwgR0ZQX0tFUk5FTCB8IEdG
UF9ETUEpOwo+ID4gPj4+IGZvciAoaSA9IDA7IGkgPCBCU0laRTsgaSsrKQo+ID4gPj4+ICAgICBi
dWZbaV0gPSAweEZFOwo+ID4gPj4+IHByaW50X2hleF9kdW1wKEtFUk5fSU5GTywgIkRNQVRFU1Qx
OiIsIERVTVBfUFJFRklYX05PTkUsIDE2LCA0LCBidWYsIDI1NiwgZmFsc2UpOwo+ID4gPj4+IGRt
YSA9IGRtYV9tYXBfc2luZ2xlKGNlLT5kZXYsIGJ1ZiwgRE1BU0laRSwgRE1BX0ZST01fREVWSUNF
KTsKPiA+ID4+Cj4gPiA+PiBUaGlzIGZ1bmN0aW9uICh0aHJvdWdoIGRtYV9kaXJlY3RfbWFwX3Bh
Z2UoKSkgZW5kcyB1cCBjYWxsaW5nCj4gPiA+PiBhcmNoX3N5bmNfZG1hX2Zvcl9kZXZpY2UoLi4u
LCAuLi4sIERNQV9GUk9NX0RFVklDRSksIHdoaWNoIGludmFsaWRhdGVzIHRoZSBDUFUncwo+ID4g
Pj4gY2FjaGUuIFRoaXMgaXMgdGhlIHNhbWUgdGhpbmcgb3RoZXIgYXJjaGl0ZWN0dXJlcyBkbyAo
YXQgbGVhc3QgYXJtLCBhcm02NCwKPiA+ID4+IG9wZW5yaXNjLCBhbmQgcG93ZXJwYykuIFNvIHRo
aXMgYXBwZWFycyB0byBiZSB3b3JraW5nIGFzIGludGVuZGVkLgo+ID4gPgo+ID4gPiBUaGlzIGJl
aGF2b3VyIGlzIG5vdCBwcmVzZW50IGF0IGxlYXN0IG9uIEFSTSBhbmQgQVJNNjQuCj4gPiA+IFRo
ZSBzYW1wbGUgY29kZSBJIHByb3ZpZGVkIGRvZXMgbm90IGNvcnJ1cHQgdGhlIGJ1ZmZlciBvbiB0
aGVtLgo+ID4KPiA+IFRoYXQgY2FuIGJlIGV4cGxhaW5lZCBieSB0aGUgMHhGRSBieXRlcyBoYXZp
bmcgYmVlbiBmbHVzaGVkIHRvIERSQU0gYWxyZWFkeSBpbgo+ID4geW91ciBBUk0vQVJNNjQgdGVz
dHMsIHdoZXJlYXMgaW4geW91ciByaXNjdjY0IGNhc2UsIHRoZSAweEZFIGJ5dGVzIHdlcmUgc3Rp
bGwgaW4KPiA+IGEgZGlydHkgY2FjaGUgbGluZS4gVGhlIGNhY2hlIHRvcG9sb2d5IGFuZCBpbXBs
ZW1lbnRhdGlvbiBpcyB0b3RhbGx5IGRpZmZlcmVudAo+ID4gYWNyb3NzIHRoZSBTb0NzLCBzbyB0
aGlzIGlzIG5vdCB0b28gc3VycHJpc2luZy4KPiA+Cj4gPiBTZW1hbnRpY2FsbHksIGRtYV9tYXBf
c2luZ2xlKC4uLiwgRE1BX0ZST01fREVWSUNFKSBtZWFucyB5b3UgYXJlIGRvaW5nIGEKPiA+IHVu
aWRpcmVjdGlvbmFsIERNQSB0cmFuc2ZlciBmcm9tIHRoZSBkZXZpY2UgaW50byB0aGF0IGJ1ZmZl
ci4gU28gdGhlIGNvbnRlbnRzIG9mCj4gPiB0aGUgYnVmZmVyIGFyZSAidW5kZWZpbmVkIiB1bnRp
bCB0aGUgRE1BIHRyYW5zZmVyIGNvbXBsZXRlcy4gSWYgeW91IGFyZSBhbHNvCj4gPiB3cml0aW5n
IGRhdGEgaW50byB0aGUgYnVmZmVyIGZyb20gdGhlIENQVSBzaWRlLCB0aGVuIHlvdSBuZWVkIERN
QV9CSURJUkVDVElPTkFMLgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBTYW11ZWwKPgo+ICtDQyBjcnlw
dG8gbWFpbGluZyBsaXN0ICsgbWFpbnRhaW5lcgo+Cj4gTXkgcHJvYmxlbSBpcyB0aGF0IGNyeXB0
byBzZWxmdGVzdCwgZm9yIGVhY2ggYnVmZmVyIHdoZXJlIEkgbmVlZCB0byBkbyBhIGNpcGhlciBv
cGVyYXRpb24sCj4gY29uY2F0IGEgcG9pc29uIGJ1ZmZlciB0byBjaGVjayB0aGF0IGRldmljZSBk
b2VzIHdyaXRlIGJleW9uZCBidWZmZXIuCj4KPiBCdXQgdGhlIGRtYV9tYXBfc2coRlJPTV9ERVZJ
Q0UpIGNvcnJ1cHRzIHRoaXMgcG9pc29uIGJ1ZmZlciBhbmQgY3J5cHRvIHNlbGZ0ZXN0cyBmYWls
cyB0aGlua2luZyBteSBkZXZpY2UgZGlkIGEgYnVmZmVyIG92ZXJydW4uCj4KPiBTbyB5b3UgbWVh
biB0aGF0IG9uIFNvQyBEMSwgdGhpcyBjcnlwdG8gQVBJIGNoZWNrIHN0cmF0ZWd5IGlzIGltcG9z
c2libGUgPwoKSSB0aGluayB5b3UgY291bGQgdHJ5IHRvIHJlcGxhY2UgYWxsIENMRUFOICYgSU5W
QUwgb3BzIHdpdGggRkxVU0ggb3BzCmZvciB0aGUgdGVzdGluZy4gKEFsbCBjYWNoZSBibG9jay1h
bGlnbmVkIGRhdGEgZnJvbSB0aGUgZGV2aWNlIGZvciB0aGUKQ1BVIHNob3VsZCBiZSBpbnZhbGlk
ZWQuKQoKK3ZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHBoeXNfYWRkcl90IHBhZGRyLCBz
aXplX3Qgc2l6ZSwgZW51bQpkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQoreworIHN3aXRjaCAoZGly
KSB7CisgY2FzZSBETUFfVE9fREVWSUNFOgorIEFMVF9DTU9fT1AoQ0xFQU4sICh1bnNpZ25lZCBs
b25nKXBoeXNfdG9fdmlydChwYWRkciksIHNpemUpOworIGJyZWFrOworIGNhc2UgRE1BX0ZST01f
REVWSUNFOgorIEFMVF9DTU9fT1AoSU5WQUwsICh1bnNpZ25lZCBsb25nKXBoeXNfdG9fdmlydChw
YWRkciksIHNpemUpOworIGJyZWFrOworIGNhc2UgRE1BX0JJRElSRUNUSU9OQUw6CisgQUxUX0NN
T19PUChGTFVTSCwgKHVuc2lnbmVkIGxvbmcpcGh5c190b192aXJ0KHBhZGRyKSwgc2l6ZSk7Cisg
YnJlYWs7CisgZGVmYXVsdDoKKyBicmVhazsKKyB9Cit9CisKK3ZvaWQgYXJjaF9zeW5jX2RtYV9m
b3JfY3B1KHBoeXNfYWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSwgZW51bQpkbWFfZGF0YV9kaXJl
Y3Rpb24gZGlyKQoreworIHN3aXRjaCAoZGlyKSB7CisgY2FzZSBETUFfVE9fREVWSUNFOgorIGJy
ZWFrOworIGNhc2UgRE1BX0ZST01fREVWSUNFOgorIGNhc2UgRE1BX0JJRElSRUNUSU9OQUw6Cisg
QUxUX0NNT19PUChJTlZBTCwgKHVuc2lnbmVkIGxvbmcpcGh5c190b192aXJ0KHBhZGRyKSwgc2l6
ZSk7CisgYnJlYWs7CisgZGVmYXVsdDoKKyBicmVhazsKKyB9Cit9CgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
