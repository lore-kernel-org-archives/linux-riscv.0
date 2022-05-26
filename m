Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7749AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 01:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYWHMvBUMy1gQIks7jfpXvisRzVw0W9CgOuFHrZ8yRo=; b=ymmPXWUtCr+bvS
	asUj/PKsOS+oNsUofWyqFgAVBTEo8kaHM4X51jx+I+AhvRjp3KY/CRqwL37UGnayn5IrS/PDdWhtt
	iC3lvh3OFriQGe5xt8gMyvNXqRj0mSb3SxXV2elUevOfvN9o8IpuCMJlRVbOHGze5K27+YbE6mBZt
	r4LwQh/dom/zy6P4Bhxebv9hCtTiVT+JLLfNRMXII5NWcF+arqRxUP6/c3yfETAMbBYqTZUIzEofw
	mdAx/jSGfhVDyMYKiiK/H8WoGzjrlawV6Fz9sRhStF/oNeOrWVILowws13H1WSZeIyVXtHX+mrQa/
	Zvrb2QKIyxbxAozbVd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2GR-00DBJi-7K; Thu, 26 May 2022 01:26:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2GN-00DBJ5-33
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 01:26:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 70811B81ECD
	for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 01:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D54C385B8
	for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 01:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653528364;
	bh=lDpTSVw2M6hQDO6YVoSC7pj8BgxtHOakbMzZN1/oTg4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cVT6qx8eghDEbiqGn3ntsfv83va7M2f5npYS/UgcGcI7W5YAaTW9loYv8DitShO7b
	 ez9HWS9lOwtUxbFILfXhVe66N93BUJ83pQYUYgms7O8IVuGjIgqugQQlQtjELDAAVQ
	 B9D3bIoWlJUegwBx9uVPs9UMQEZytEPoK3CbAKSuUqa5H0Rergd4duutj3CzClk84c
	 YUK/WBfAR1kM7CPfqh6Ke6qkivO6ZHZ5yxGb/MIv5KrCBM/dVlN7Gya+QL69GnArMa
	 3j/kD6j6Ln9EdYFxmSU259MpzVy6nmvVFhjxU5n+21G4Ivk/08sCNaBYwa5Dt7F6lr
	 UR9fPIrJAMbMw==
Received: by mail-vs1-f52.google.com with SMTP id z6so156523vsp.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 18:26:04 -0700 (PDT)
X-Gm-Message-State: AOAM530Szb6VWyLezlQpwzJhzNPvMc9Z+hwP9gllPVadRFTHGb1l2Tsv
	tfvmHYOKTomTbJFoOVRCJiA2wvgy8h1IPV5qRRE=
X-Google-Smtp-Source: ABdhPJyVK/9aM/Bld5RLqEMJ+E/KWn7qCpsh4NevJw8t9GH6u65V4mzymKSq53MHh8kQhztxGCTG5OUjMwKAkMXlC5w=
X-Received: by 2002:a67:c89c:0:b0:335:d83b:df76 with SMTP id
 v28-20020a67c89c000000b00335d83bdf76mr13037783vsk.51.1653528362997; Wed, 25
 May 2022 18:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-7a88227d-dc64-4d87-9e1a-0ea802ddf0a1@palmer-ri-x1c9> <mhng-54a3577b-2ae9-4ca0-a27d-f75f13807a29@palmer-ri-x1c9>
In-Reply-To: <mhng-54a3577b-2ae9-4ca0-a27d-f75f13807a29@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 May 2022 09:25:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQQEYKz7EG9=bdSC6E4_ds5D9FmAK1TBZgmsB3T-nrGiw@mail.gmail.com>
Message-ID: <CAJF2gTQQEYKz7EG9=bdSC6E4_ds5D9FmAK1TBZgmsB3T-nrGiw@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for compat_vdso_info
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_182607_461102_A371B1A4 
X-CRM114-Status: GOOD (  27.52  )
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

T24gVGh1LCBNYXkgMjYsIDIwMjIgYXQgODo0MyBBTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjUgTWF5IDIwMjIgMTc6Mzk6MzkgUERUICgt
MDcwMCksIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4gT24gV2VkLCAyNSBNYXkgMjAyMiAxNTo1
NjowNyBQRFQgKC0wNzAwKSwgbGludXhAcm9lY2stdXMubmV0IHdyb3RlOgo+ID4+IE9uIDUvMjUv
MjIgMTQ6MzQsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4+PiBPbiBXZWQsIDI1IE1heSAyMDIy
IDE0OjE1OjAzIFBEVCAoLTA3MDApLCBsaW51eEByb2Vjay11cy5uZXQgd3JvdGU6Cj4gPj4+PiBP
biA1LzI1LzIyIDA5OjA0LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+Pj4+PiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPj4+Pj4KPiA+Pj4+PiBUaGlzIGlz
IGEgZml4dXAgZm9yIHZkc28gaW1wbGVtZW50YXRpb24gd2hpY2ggY2F1c2VkIG11c2wgdG8KPiA+
Pj4+PiBmYWlsLgo+ID4+Pj4+Cj4gPj4+Pj4gWyAgIDExLjYwMDA4Ml0gUnVuIC9zYmluL2luaXQg
YXMgaW5pdCBwcm9jZXNzCj4gPj4+Pj4gWyAgIDExLjYyODU2MV0gaW5pdFsxXTogdW5oYW5kbGVk
IHNpZ25hbCAxMSBjb2RlIDB4MSBhdAo+ID4+Pj4+IDB4MDAwMDAwMDAwMDAwMDAwMCBpbiBsaWJj
LnNvW2ZmZmZmZjhhZDM5MDAwK2E0MDAwXQo+ID4+Pj4+IFsgICAxMS42MjkzOThdIENQVTogMCBQ
SUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRlZAo+ID4+Pj4+IDUuMTguMC1yYzctbmV4dC0yMDIy
MDUyMCAjMQo+ID4+Pj4+IFsgICAxMS42Mjk0NjJdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRp
byxxZW11IChEVCkKPiA+Pj4+PiBbICAgMTEuNjI5NTQ2XSBlcGMgOiAwMGZmZmZmZjhhZGExMTAw
IHJhIDogMDBmZmZmZmY4YWRhMTNjOCBzcCA6Cj4gPj4+Pj4gMDBmZmZmZmZjNTgxOTlmMAo+ID4+
Pj4+IFsgICAxMS42Mjk1ODZdICBncCA6IDAwZmZmZmZmOGFkMzkwMDAgdHAgOiAwMGZmZmZmZjhh
ZGUwOTk4IHQwIDoKPiA+Pj4+PiBmZmZmZmZmZmZmZmZmZmZmCj4gPj4+Pj4gWyAgIDExLjYyOTU5
OF0gIHQxIDogMDBmZmZmZmZjNTgxOWZkMCB0MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOgo+ID4+
Pj4+IDAwZmZmZmZmOGFkZTBjYzAKPiA+Pj4+PiBbICAgMTEuNjI5NjEwXSAgczEgOiAwMGZmZmZm
ZjhhZGUwY2MwIGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6Cj4gPj4+Pj4gMDBmZmZmZmZjNTgx
OWEwMAo+ID4+Pj4+IFsgICAxMS42Mjk2MjJdICBhMiA6IDAwMDAwMDAwMDAwMDAwMDEgYTMgOiAw
MDAwMDAwMDAwMDAwMDFlIGE0IDoKPiA+Pj4+PiAwMGZmZmZmZmM1ODE5YjAwCj4gPj4+Pj4gWyAg
IDExLjYyOTYzNF0gIGE1IDogMDBmZmZmZmZjNTgxOWIwMCBhNiA6IDAwMDAwMDAwMDAwMDAwMDAg
YTcgOgo+ID4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4+PiBbICAgMTEuNjI5NjQ1XSAgczIg
OiAwMGZmZmZmZjhhZGUwYWM4IHMzIDogMDBmZmZmZmY4YWRlMGVjOCBzNCA6Cj4gPj4+Pj4gMDBm
ZmZmZmY4YWRlMDcyOAo+ID4+Pj4+IFsgICAxMS42Mjk2NTZdICBzNSA6IDAwZmZmZmZmOGFkZTBh
OTAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3IDoKPiA+Pj4+PiAwMGZmZmZmZmM1ODE5ZTQwCj4g
Pj4+Pj4gWyAgIDExLjYyOTY2N10gIHM4IDogMDBmZmZmZmY4YWRlMGNhMCBzOSA6IDAwZmZmZmZm
OGFkZGJhNTAgczEwOgo+ID4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4+PiBbICAgMTEuNjI5
Njc4XSAgczExOiAwMDAwMDAwMDAwMDAwMDAwIHQzIDogMDAwMDAwMDAwMDAwMDAwMiB0NCA6Cj4g
Pj4+Pj4gMDAwMDAwMDAwMDAwMDAwMQo+ID4+Pj4+IFsgICAxMS42Mjk2ODhdICB0NSA6IDAwMDAw
MDAwMDAwMjAwMDAgdDYgOiBmZmZmZmZmZmZmZmZmZmZmCj4gPj4+Pj4gWyAgIDExLjYyOTY5OV0g
c3RhdHVzOiAwMDAwMDAwMDAwMDA0MDIwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4+
PiBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+ID4+Pj4+Cj4gPj4+Pj4gVGhlIGxhc3QgX192ZHNv
X2luaXQoJmNvbXBhdF92ZHNvX2luZm8pIHJlcGxhY2VzIHRoZSBkYXRhIGluIG5vcm1hbAo+ID4+
Pj4+IHZkc29faW5mby4gVGhpcyBpcyBhbiBvYnZpb3VzIGJ1Zy4KPiA+Pj4+Pgo+ID4+Pj4+IFJl
cG9ydGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gPj4+Pj4gU2ln
bmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4+Pj4+IENjOiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgo+ID4+Pj4+IENjOiBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPgo+ID4+Pj4KPiA+Pj4+IFRlc3RlZC1ieTogR3VlbnRlciBSb2Vj
ayA8bGludXhAcm9lY2stdXMubmV0Pgo+ID4+Pgo+ID4+PiBTb3JyeSBJJ20gYSBiaXQgYnVyaWVk
IHJpZ2h0IG5vdywgdGhpcyBpcyBmaXhpbmcgdGhlIGlzc3VlIHlvdSBwb2ludGVkIG91dCBlYXJs
aWVyPwo+ID4+Pgo+ID4+IFllcy4KPiA+Cj4gPiBBd29zb21lLCBJIHRoaW5rIHRoYXQgd2FzIHRo
ZSBvbmx5IGJpZyBibG9ja2VyIHNvIGZhci4KPiA+Cj4gPiBJIGFkZGVkIGEgbXVzbC1iYXNlZCB1
c2Vyc3BhY2UgdG8gbXkgdGVzdCBzZXR1cCwgd2hpY2ggaXMgcnY2NC1vbmx5Cj4gPiAoYnVpbGRy
b290IGRvZXNuJ3QgaGF2ZSBydjMyIG11c2wsIEkgdGhvdWdodCB1cHN0cmVhbSBoYWQgaXQgYnV0
IG1heWJlCj4gPiBpJ20gbWlzcmVtZW1iZXJpbmcpLiAgVGhpcyBwYXRjaCBmaXhlcyB0aGUgYnVn
LCBzbyBJJ3ZlIGFkZGVkIGl0IHRvCj4gPiBmb3ItbmV4dCB3aXRoCj4KPiBKdXN0IHNhdyB0aGUg
djIsIHNvIEknbSB1c2luZyB0aGF0IGluc3RlYWQuClNvcnJ5LCB2MiBzaG91bGQgYmUgYWJhbmRv
bmVkLiBKdXN0IGFkZGluZyBUZXN0ZWQtYnkgaXMgZW5vdWdoLgoKPgo+ID4KPiA+IEZpeGVzOiAz
MDkyZWI0NTYzNzUgKCJyaXNjdjogY29tcGF0OiB2ZHNvOiBBZGQgc2V0dXAgYWRkaXRpb25hbCBw
YWdlcyBpbXBsZW1lbnRhdGlvbiIpCj4gPgo+ID4gd2hpY2ggSSB0aGluayBpcyBjb3JyZWN0LCBi
dXQgTE1LIGlmIHRoZXJlJ3MgYW4gaXNzdWUuCj4gPgo+ID4gVGhhbmtzIQo+ID4KPiA+IChhbmQg
YWxzbyBzb3JyeSBJIHBva2VkIEdlZXJ0IGluc3RlYWQgb2YgeW91IGFib3V0IHRoaXMgb25lLCBv
b3BzIDspKQo+ID4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiBHdWVudGVyCj4gPj4KPiA+Pj4+Cj4g
Pj4+Pj4gLS0tCj4gPj4+Pj4gICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgfCAxNSArKysrKysr
KysrKysrLS0KPiA+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4+Pj4+Cj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28uYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+ID4+Pj4+IGluZGV4IDUwZmU0Yzg3
NzYwMy4uNjliMDViNmMxODFiIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28uYwo+ID4+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+ID4+Pj4+IEBA
IC0yMDYsMTIgKzIwNiwyMyBAQCBzdGF0aWMgc3RydWN0IF9fdmRzb19pbmZvIHZkc29faW5mbyBf
X3JvX2FmdGVyX2luaXQgPSB7Cj4gPj4+Pj4gICB9Owo+ID4+Pj4+Cj4gPj4+Pj4gICAjaWZkZWYg
Q09ORklHX0NPTVBBVAo+ID4+Pj4+ICtzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyBy
dl9jb21wYXRfdmRzb19tYXBzW10gX19yb19hZnRlcl9pbml0ID0gewo+ID4+Pj4+ICsgICAgW1JW
X1ZEU09fTUFQX1ZWQVJdID0gewo+ID4+Pj4+ICsgICAgICAgIC5uYW1lICAgPSAiW3Z2YXJdIiwK
PiA+Pj4+PiArICAgICAgICAuZmF1bHQgPSB2dmFyX2ZhdWx0LAo+ID4+Pj4+ICsgICAgfSwKPiA+
Pj4+PiArICAgIFtSVl9WRFNPX01BUF9WRFNPXSA9IHsKPiA+Pj4+PiArICAgICAgICAubmFtZSAg
ID0gIlt2ZHNvXSIsCj4gPj4+Pj4gKyAgICAgICAgLm1yZW1hcCA9IHZkc29fbXJlbWFwLAo+ID4+
Pj4+ICsgICAgfSwKPiA+Pj4+PiArfTsKPiA+Pj4+PiArCj4gPj4+Pj4gICBzdGF0aWMgc3RydWN0
IF9fdmRzb19pbmZvIGNvbXBhdF92ZHNvX2luZm8gX19yb19hZnRlcl9pbml0ID0gewo+ID4+Pj4+
ICAgICAgIC5uYW1lID0gImNvbXBhdF92ZHNvIiwKPiA+Pj4+PiAgICAgICAudmRzb19jb2RlX3N0
YXJ0ID0gY29tcGF0X3Zkc29fc3RhcnQsCj4gPj4+Pj4gICAgICAgLnZkc29fY29kZV9lbmQgPSBj
b21wYXRfdmRzb19lbmQsCj4gPj4+Pj4gLSAgICAuZG0gPSAmcnZfdmRzb19tYXBzW1JWX1ZEU09f
TUFQX1ZWQVJdLAo+ID4+Pj4+IC0gICAgLmNtID0gJnJ2X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9W
RFNPXSwKPiA+Pj4+PiArICAgIC5kbSA9ICZydl9jb21wYXRfdmRzb19tYXBzW1JWX1ZEU09fTUFQ
X1ZWQVJdLAo+ID4+Pj4+ICsgICAgLmNtID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19N
QVBfVkRTT10sCj4gPj4+Pj4gICB9Owo+ID4+Pj4+ICAgI2VuZGlmCj4gPj4+Pj4KCgoKLS0gCkJl
c3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNz
a3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
