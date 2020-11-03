Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DCCC2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:46:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E35C0206C0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gpboBkxO"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Idk860tVan0WHR+GUehbDk0vxxUQkxayFfWlIWf5do=; b=gpboBkxOWCIPD5M8eV+E4Usw7
	eEaLxpSrW5suhzftilLKwVX3L+3l3QKAsyPwpDD6H/13/yh/PANO6NWwFbKdo5cEdFKWld8bWmIfy
	Kvwa410H4DJdPN6Lg89n6e3/panlsH552bMcvVdLQzT6U7CLjk9u/hom+o5lyGjqqj4zhBz87tGgd
	BUBFK1Q6cmFcJN55RkRnB8FXAqfTyPrRXd4nPwT1WN992/Df8ebwaO8ZvBGvcxY8BMJ/lXbEqxYCk
	zSEBcdDKiv9dFsbPpOJmQWnSSvbZ6fp3QlClLZUs1qZn/pK+PPopXSvIjoympc014Bh8TG2GKmARp
	2ihQiyzhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka1Jv-00013B-KV; Tue, 03 Nov 2020 18:46:15 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka1Jp-000100-2n
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:46:10 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.10])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1ka1Jn-0001Zx-HT; Tue, 03 Nov 2020 18:46:07 +0000
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Cyril.Jean@microchip.com, atishp@atishpatra.org
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <41f1248b-78c6-bac1-410b-9e222368c5f6@codethink.co.uk>
 <CAOnJCUJhQ=Zv0S4iCK4CDzQr_dfkw3J6ycdM=p6=5B2_sL1Ekg@mail.gmail.com>
 <2d7cc829-5df6-6b94-4c8f-9bae6080444e@codethink.co.uk>
 <CAOnJCULejyF9xyLk5M0TXqW_=nn0KM5aE8nhK+1h0Xayd2pKUg@mail.gmail.com>
 <fbe404b5-3bb1-dd00-e558-e4a55960b767@microchip.com>
 <fe079b4a-5410-5cc8-3f5e-8a95b573078a@codethink.co.uk>
 <21ded848-5dcb-ccbb-acd5-391bff667a53@microchip.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <0eb43b3e-e5dc-4d97-895e-b872ac1fcf05@codethink.co.uk>
Date: Tue, 3 Nov 2020 18:46:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <21ded848-5dcb-ccbb-acd5-391bff667a53@microchip.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_134609_183997_A1573234 
X-CRM114-Status: GOOD (  22.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Daire.McNamara@microchip.com, anup.patel@wdc.com, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, robh+dt@kernel.org, alistair.francis@wdc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 Padmarao.Begari@microchip.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDMvMTEvMjAyMCAxODo0MCwgQ3lyaWwuSmVhbkBtaWNyb2NoaXAuY29tIHdyb3RlOgo+IE9u
IDExLzMvMjAgNjoyOCBQTSwgQmVuIERvb2tzIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93Cj4+IHRo
ZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gT24gMDMvMTEvMjAyMCAxODoxMCwgQ3lyaWwuSmVhbkBt
aWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4gT24gMTEvMy8yMCAzOjA3IFBNLCBBdGlzaCBQYXRyYSB3
cm90ZToKPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdQo+Pj4+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+Pj4+Cj4+
Pj4gT24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMjoyMCBQTSBCZW4gRG9va3MKPj4+PiA8YmVuLmRv
b2tzQGNvZGV0aGluay5jby51az4gd3JvdGU6Cj4+Cj4+ICxzbmlwWwo+Pgo+Pj4+Pj4gQEN5cmls
IDogQ2FuIHdlIGVuYWJsZSBib3RoIGVNTUMgJiBzZGNhcmQgYXQgdGhlIHNhbWUgdGltZSA/Cj4+
Pj4+IEkgd291bGQgcHV0IC9ib3RoLyBpbiBidXQgb25seSBlbmFibGUgdGhlIG9uZSBpbiB1c2Ug
Zm9yIHRoZSBtb21lbnQuCj4+Pj4+IE91ciBib2FyZHMgYXJlIGJvb3Rpbmcgb2YgZU1NQyBhcyBz
dXBwbGllZCwgc28gdGhpcyBpc24ndCBnb2luZyB0bwo+Pj4+PiB3b3JrCj4+Pj4+IGFzIHdlbGwu
IFRoZSBlTU1DIGlzIDhiaXQgd2lkZSwgYW5kIHRodXMgaXMgb25seSBkZWxpdmVyaW5nIDExTUIv
c2VjCj4+Pj4+IGluc3RlYWQgb2YgMjJNQi9zZWMuIFRoaXMgcGVyZm9ybWFuY2UgaXMgc3RpbGwg
bm90IGdyZWF0LCBidXQgbG9zaW5nCj4+Pj4+IGhhbGYgdGhlIGRhdGEtcmF0ZSBpcyBqdXN0IG5v
dCBnb29kLgo+Pj4+Pgo+Pj4+IEkgYW0gbm90IHN1cmUgd2hhdCBzaG91bGQgYmUgZW5hYmxlZCBi
eSBkZWZhdWx0LiBVcGRhdGluZyBzZGNhcmQgaXMKPj4+PiBtdWNoCj4+Pj4gZWFzaWVyIHRoYW4g
ZU1NQyBjYXJkIGFuZCB3ZSB1c2UgdGhhdCBhcHByb2FjaC4KPj4+Pgo+Pj4+IEBDeXJpbDogSXMg
dGhlcmUgYSB3YXkgdGhhdCB3ZSBjYW4gZW5hYmxlIGJvdGggPwo+Pj4+Cj4+PiBZZXMsIHdlIGNh
biBlbmFibGUgYm90aCBidXQgdGhpcyByZXF1aXJlcyBhIG1vZGlmaWNhdGlvbiB0byB0aGUgRlBH
QQo+Pj4gZGVzaWduLiBPbmUgb2YgdGhlIGd1eXMgcHJvdG90eXBlZCB0aGlzIHdoaWxlIEkgd2Fz
IGF3YXkuIFdlIHdpbGwgbW92ZQo+Pj4gdGhpcyBhbG9uZy4gVGhpcyB3aWxsIHJlcXVpcmUgcmVw
cm9ncmFtbWluZyB0aGUgRlBHQSB3aXRoIGEgbmV3IGRlc2lnbgo+Pj4gYW5kIEhTUyB2ZXJzaW9u
Lgo+Pj4KPj4+IFJlZ2FyZHMsCj4+Pgo+Pj4gQ3lyaWwuCj4+Cj4+IEkgZWl0aGVyIG1pc3NlZCBv
ciBjb3VsZG4ndCBmaW5kIGEgd2F5IG9mIGZvcmNpbmcgdGhlIGJvb3QgbW9kZSB0byBiZQo+PiBm
cm9tIHRoZSBTRCBzbG90LiBIYXZlIEkgbWlzc2VkIHNvbWV0aGluZz8gQXQgdGhlIG1vbWVudCB3
ZSdkIGxpa2UgdG8KPj4gaGF2ZSBtb3JlIHN0b3JhZ2UgYXZhaWxhYmxlIGFzIHRoZSB+N0cgZnJl
ZSBvbiB0aGUgZU1NQyBpcyBub3QgZW5vdWdoLgo+Pgo+IEN1cnJlbnRseSwgeW91IG5lZWQgdG8g
cHJvZ3JhbSBhIGRpZmZlcmVudCBGUEdBIGJpdHN0cmVhbSBvbsKgIHRoZSBib2FyZAo+IHRvIGJv
b3QgZnJvbSBTRC1jYXJkLiBUaGUgZGlmZmVyZW50IGJpdHN0cmVhbSBjb25maWd1cmVzIG11eGVz
IG9uIHRoZQo+IGJvYXJkIHRvIGNvbm5lY3QgdGhlIFNEIHNsb3QgdG8gdGhlIEZQR0EgYW5kIHRo
ZSBIU1MgaW5jbHVkZWQgaW4gdGhlIGJpdAo+IHN0cmVhbSBjb25maWd1cmVzIHRoZSBGUEdBIElP
cyBjb3JyZWN0bHkuCj4gCj4gTGlua3MgdG8gdGhlIHByb2dyYW1taW5nIGZpbGVzIGFyZSBmb3Vu
ZCBpbiB0aGlzIGRvY3VtZW50Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9wb2xhcmZpcmUtc29jL3Bv
bGFyZmlyZS1zb2MtZG9jdW1lbnRhdGlvbi9ibG9iL21hc3Rlci9ib2FyZHMvbXBmcy1pY2ljbGUt
a2l0LWVzL3VwZGF0aW5nLWljaWNsZS1raXQvdXBkYXRpbmctaWNpY2xlLWtpdC1kZXNpZ24tYW5k
LWxpbnV4Lm1kCgpUaGFua3MsIGJ1dCBpJ3ZlIG5vIHdheSBvZiByZW1vdGVseSByZS13cml0aW5n
IHRoZSBiaXRzdHJlYW0Kb2YgdGhlIEZQR0Egc2luY2UgdGhlIHRvb2xzIGFyZSB4ODYgb25seSBh
bmQgd2UncmUgdXNpbmcgYSBQaTMKdG8gY29ubmVjdCB0aGUgYm9hcmRzIHdlIGhhdmUgdG8gdGhl
IG5ldHdvcmsuCgotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpT
ZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93
d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
