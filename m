Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B352C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 02:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTJWDwWA3X936pu8VmmYv+xzBjdpHTyHu3U6KwioEKg=; b=Gh3sBUclpIPC9f
	bUtdF4XGbxBeyGWF8l3QvPHmlP1RWXdW8xLIe1mJA67e2a13TCrHtgjv+tztkFLBxb/5Z8dSsCJ47
	tmKXPbDTv1XyoVptS184OMGT+FGVZlaJz1g7oYv11YyAW4QPUtaVYnMdu/rxLaensCGS5qAiD2oev
	jSYBH/mlBO2o+/Jq9wspbwfTHtFhfMIfbmXTmRQRJlFDsHxb+kR/lzE0dXznzHruoqNZvpJ2bixVP
	qbzWqE0uwQ3NBDlWuluLPfC7RnSGz7pnykEiUVYhlFflfufHxXl1D+IDavy6ury1jehHAA2LR4RuQ
	MVGdoe4weQ+LdLRB9jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjc0-003D3r-Vz; Wed, 08 Mar 2023 02:33:04 +0000
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjc0-003D3K-0A; Wed, 08 Mar 2023 02:33:04 +0000
Message-ID: <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
Date: Tue, 7 Mar 2023 18:33:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
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

CgpPbiAzLzcvMjMgMTg6MzAsIEplc3NlIFRhdWJlIHdyb3RlOgo+IAo+IAo+IE9uIDMvNy8yMyAy
MToxNiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+PiBIaS0tCj4+Cj4+IE9uIDMvNy8yMyAxNzoyNiwg
SmVzc2UgVGF1YmUgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIvMjgvMjMgMjM6NDIsIERhbWllbiBM
ZSBNb2FsIHdyb3RlOgo+Pj4+IE9uIDMvMS8yMyAxMzowNywgUmFuZHkgRHVubGFwIHdyb3RlOgo+
Pj4+PiBIaS0tCj4+Pj4+Cj4+Pj4+IE9uIDIvMjgvMjMgMTY6MjYsIEplc3NlIFRhdWJlIHdyb3Rl
Ogo+Pj4+Pj4gVGhpcyBwYXRjaC1zZXQgYWltcyB0byBhZGQgTk9NTVUgc3VwcG9ydCB0byBSVjMy
Lgo+Pj4+Pj4gTWFueSBwZW9wbGUgd2FudCB0byBidWlsZCBzaW1wbGUgZW11bGF0b3JzIG9yIEhE
TAo+Pj4+Pj4gbW9kZWxzIG9mIFJJU0MtViB0aGlzIHBhdGNoIG1ha2VzIGl0IHBvc3NpYmxlIHRv
Cj4+Pj4+PiBydW4gbGludXggb24gdGhlbS4KPj4+Pj4+Cj4+Pj4+PiBZaW1pbiBHdSBpcyB0aGUg
b3JpZ2luYWwgYXV0aG9yIG9mIHRoaXMgc2V0Lgo+Pj4+Pj4gU3VibWl0dGVkIGhlcmU6Cj4+Pj4+
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIyLU5v
dmVtYmVyLzY1NjEzNC5odG1sCj4+Pj4+Pgo+Pj4+Pj4gVGhvdWdoIEplc3NlIFQgcmV3cm90ZSB0
aGUgRGNvbmYuCj4+Pj4+Cj4+Pj4+IERjb25mPwo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoZSBuZXcg
c2V0Ogo+Pj4+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJv
b3QvMjAyMi1EZWNlbWJlci82NTgyNTguaHRtbAo+Pj4+Pj4gLS0tCj4+Pj4+PiBWMS0+VjI6Cj4+
Pj4+PiDCoMKgIC0gQWRkIENvbm9yJ3MgY2xvY2sgcGF0Y2ggZm9yIGltcGxpY2l0IGRpdjY0Cj4+
Pj4+PiDCoMKgIC0gRml4IHR5cG8gaW4gY29tbWl0IHRpdGxlIDMvMwo+Pj4+Pj4gwqDCoCAtIEZp
eCB0eXBvIGluIGNvbW1pdCBkZXNjcmlwdGlvbiAyLzMKPj4+Pj4+IFYyLT5WMwo+Pj4+Pj4gwqDC
oCAtIENoYW5nZSBmcm9tIGRlZmNvbmZpZyBmaWxlIHRvIGEgUEhPTlkgY29uZmlnCj4+Pj4+PiAt
LS0KPj4+Pj4KPj4+Pj4gSXMgdGhpcyAncnYzMl9ub21tdV92aXJ0X2RlZmNvbmZpZycgdGFyZ2V0
IHRoZSBvbmx5IGJ1aWxkIHRhcmdldAo+Pj4+PiB0aGF0IGlzIHN1cHBvcnRlZD8KPj4+Pj4KPj4+
Pj4gSSBhc2sgYmVjYXVzZSBJIGFwcGxpZWQgdGhlIDMgcGF0Y2hlcyBhbmQgZGlkIDI1IHJhbmRj
b25maWcgYnVpbGRzLgo+Pj4+PiA1IG9mIHRoZW0gZmFpbGVkIHRoZSBzYW1lIHdheToKPj4+Pj4K
Pj4+Pj4gcmlzY3YzMi1saW51eC1sZDogZHJpdmVycy9zb2MvY2FuYWFuL2syMTAtc3lzY3RsLm86
IGluIGZ1bmN0aW9uIGBrMjEwX3NvY19lYXJseV9pbml0JzoKPj4+Pj4gazIxMC1zeXNjdGwuYzoo
LmluaXQudGV4dCsweDc4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgazIxMF9jbGtfZWFybHlf
aW5pdCcKPj4+IEkgY2FuIG5vdCByZWNyZWF0ZSB0aGlzIGVycm9yLgo+Pj4gY2FuIHlvdSBzZW5k
IG1lIHRoZSAuY29uZmlnIHlvdSB1c2VkLgo+Pj4KPj4+IFRoYW5rcywKPj4+IEplc3NlIFRhdWJl
Cj4+Cj4+IFN1cmUsIGl0J3MgYXR0YWNoZWQuCj4gCj4gSG1tbSwgaXQgbGlua3MgZmluZSBmb3Ig
bWUuCj4gCj4gb2JqZHVtcCAteCB2bWxpbnV4IHwgZ3JlcCBrMjEwX2Nsa19lYXJseV9pbml0Cj4g
ODFlNDAxMjQgZ8KgwqDCoMKgIEYgLmluaXQudGV4dMKgwqDCoMKgIDAwMDAwMDg4IGsyMTBfY2xr
X2Vhcmx5X2luaXQKPiAKPiBnY2MgdmVyc2lvbiAxMS4zLjAgKEJ1aWxkcm9vdCAyMDIyLjExLTM2
MS1nMWJlMGQ0MzhmNykKPiBHTlUgYXNzZW1ibGVyIHZlcnNpb24gMi4zOCAocmlzY3YzMi1idWls
ZHJvb3QtbGludXgtdWNsaWJjKQo+IEdOVSBsZCAoR05VIEJpbnV0aWxzKSAyLjM4Cj4gCj4gd2hh
dCBnY2MgdmVyc2lvbiBhcmUgeW91IHVzaW5nPwoKCmdjYyAoU1VTRSBMaW51eCkgMTIuMi4xIDIw
MjMwMTI0IFtyZXZpc2lvbiAxOTNmN2U2MjgxNWI0MDg5ZGZhZWQ0YzJiZDM0ZmQ0ZjEwMjA5ZTI3
XQpmcm9tIG9wZW5zdXNlIFR1bWJsZXdlZWQuCgpJJ2xsIHRyeSBpdCBvbiBhIGN1cnJlbnQgdHJl
ZS4uLgoKPj4KPj4+PiBBcmcuIEZvcmdvdCBhYm91dCB0aGF0LiBrMjEwIGlzIHJ2NjQgb25seSBh
bmQgd2hpbGUgdGhlIGNsayBkcml2ZXIgY291bGQgc3RpbGwKPj4+PiBjb21waWxlIHRlc3Qgd2l0
aCBydjMyIChvciBhbnkgYXJjaCksIHRoYXQgZHJpdmVyIHByb3ZpZGVzIHRoZQo+Pj4+IGsyMTBf
Y2xrX2Vhcmx5X2luaXQoKSBmdW5jdGlvbiB3aGljaCBpcyBjYWxsZWQgdmVyeSBlYXJseSBpbiB0
aGUgYm9vdCBwcm9jZXNzCj4+Pj4gZnJvbSBrMjEwX3NvY19lYXJseV9pbml0KCksIHdoaWNoIGlz
IGFuIFNPQ19FQVJMWV9JTklUX0RFQ0xBUkUoKSBjYWxsLiBUaGUKPj4+PiBwcm9ibGVtIG1heSBi
ZSB0aGVyZS4gUHJvYmFibHkgc2hvdWxkIGJlIGRpc2FibGVkIGZvciBydjMyIGlmIG5vIFNvQyBu
ZWVkIHRoYXQKPj4+PiBzb3J0IG9mIGVhcmx5IGluaXQgY2FsbC4KPj4+Pgo+Pj4+Pgo+Pj4+PiBi
ZWNhdXNlCj4+Pj4+ICMgQ09ORklHX0NPTU1PTl9DTEtfSzIxMCBpcyBub3Qgc2V0Cj4+Pj4+Cj4+
Pj4+Cj4+Pj4+IE1heWJlIFNPQ19DQU5BQU4gbmVlZHMgc29tZSBtb3JlIHNlbGVjdHMgZm9yIHJl
cXVpcmVkIGNvZGU/Cj4+Pj4+Cj4+Pj4+PiBDb25vciBEb29sZXkgKDEpOgo+Pj4+Pj4gwqDCoMKg
IGNsazogazIxMDogcmVtb3ZlIGFuIGltcGxpY2l0IDY0LWJpdCBkaXZpc2lvbgo+Pj4+Pj4KPj4+
Pj4+IEplc3NlIFRhdWJlICgxKToKPj4+Pj4+IMKgwqDCoCByaXNjdjogY29uZmlnczogQWRkIG5v
bW11IFBIT05ZIGRlZmNvbmZpZyBmb3IgUlYzMgo+Pj4+Pj4KPj4+Pj4+IFlpbWluIEd1ICgxKToK
Pj4+Pj4+IMKgwqDCoCByaXNjdjogS2NvbmZpZzogQWxsb3cgUlYzMiB0byBidWlsZCB3aXRoIG5v
IE1NVQo+Pj4+Pj4KPj4+Pj4+IMKgwqAgYXJjaC9yaXNjdi9LY29uZmlnwqDCoMKgwqAgfCA1ICsr
LS0tCj4+Pj4+PiDCoMKgIGFyY2gvcmlzY3YvTWFrZWZpbGXCoMKgwqAgfCA0ICsrKysKPj4+Pj4+
IMKgwqAgZHJpdmVycy9jbGsvY2xrLWsyMTAuYyB8IDIgKy0KPj4+Pj4+IMKgwqAgMyBmaWxlcyBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pgo+Pj4+
Cj4+CgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
