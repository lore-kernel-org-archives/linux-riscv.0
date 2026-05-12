Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85903CD37BE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 01:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrC4xO3e8vOmvAh/0apBuCzMlPxgcmALBgkTFHh/T8w=; b=tG0QHBfyGrDF1m
	lMknq+mXbtfMyLU8CLV59iO2QE7B48p4RziE/wgcjaWF3nsNQyJEpKEMMssdZm2bEKsd1inYOHam7
	0oUM0Zxib0fOpI1Zpu8pY2qp2p7gCHR0pxMBgZeDdf3gjfXiLUjDs7wdpkyaI/5XNKc0AzfoHG2Mf
	2DQnrCEOELwZswI/4xyA2FqLnTpALp2E41uW/4r0wtvnqs1PQZU2ZI/sTYU9iWptujlbQs1FoIQTy
	fdwaiqeqODUHvPSlqoAMpf5yuVGUAWBnm4mkMXi6DvT5OVM21H/U8UhDmjH2IBoLyQw+W7pr1aXnQ
	h5cyJu4IIEFaZUrFDgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbip-0000000F9ej-055A;
	Tue, 12 May 2026 01:15:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbin-0000000F9eF-0gsv
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 01:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9455B444C8
	for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 01:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FACC2BCFD
	for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 01:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548539;
	bh=idgOzLS1rCs7X37X7hhfN7wzOggCQdLx7Y9oI0t5SgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QsH3G1A0SXcjlW6mES+86Ow3OVus4Nbz6QVAAyjcZsaIQskZawTFzMFxHkmftEjlF
	 FmOz2orZzBvQXM+fXl1cFXcZw8F5T+TIv7X6QgcuzAWk7R8Y3EvDBDAvX32dJkvXyf
	 dQo1ExgMW6feSmb11pFSfSI6BtxU/bgpbwrsZc2Luznav9CsUF01w067EmNO14h1l7
	 i5/DfUySLFiZ/IunWVylMxXfJu2+c6gqAppUxgTd5Ix1xUN1yjDwccupoYOtU2aNv8
	 Hc0TWVBIwd04M2aLas63OaM6ne+TSTotlEYwDFIpGkyvj5uTobF5YPpjBWBfNrDo2R
	 5jcE9mryJ3Ldw==
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50e5ad864a6so50401021cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 18:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/c//cUFYfFoQD1OuvkJh2Eh/y1rT73FMaljGZJvTlvJExOD7C5hvOf6UWzNxPJSmud5Se687virlqxng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdgzm1fN93YpF+Q5nvUqtdxtk2StJaH5QTCRUCtLbjihFcTo94
	wAPUZmA7+lw96bctr+BgEHud4e2dsfOjaVITjTIW8S0FZu/EKzkv6dh5wr16azhYbfA9ifmjJ3V
	fw+duhhQPZI16Rqn0AhKvLZw46wod4Nk=
X-Received: by 2002:a05:622a:11d6:b0:50e:635b:5579 with SMTP id
 d75a77b69052e-514d1c767admr16011201cf.19.1778548538757; Mon, 11 May 2026
 18:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260508061910.3882831-1-haowenchao@xiaomi.com> <20260508061910.3882831-3-haowenchao@xiaomi.com>
In-Reply-To: <20260508061910.3882831-3-haowenchao@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 12 May 2026 09:15:27 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x+hzoHnX3ntbJh2KU5=DJt2+3d56aFT_C_GEmjB0KhMQ@mail.gmail.com>
X-Gm-Features: AVHnY4J1rXwG0D75CTqBkyPj6xJWL4HMt2mJ8dZie81UvtLNMlWzCv-e6vsUTRo
Message-ID: <CAGsJ_4x+hzoHnX3ntbJh2KU5=DJt2+3d56aFT_C_GEmjB0KhMQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] mm/zsmalloc: remove pool->lock from zs_free on
 64-bit systems
To: Wenchao Hao <haowenchao22@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Minchan Kim <minchan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Wenchao Hao <haowenchao@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_181541_286041_7CA18EE1 
X-CRM114-Status: GOOD (  22.20  )
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

T24gRnJpLCBNYXkgOCwgMjAyNiBhdCAyOjE54oCvUE0gV2VuY2hhbyBIYW8gPGhhb3dlbmNoYW8y
MkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2l0aCBjbGFzc19pZHggbm93IGVuY29kZWQgaW4gdGhl
IG9iaiB2YWx1ZSAoWlNfT0JKX0NMQVNTX0lEWCksCj4genNfZnJlZSgpIG5vIGxvbmdlciBuZWVk
cyBwb29sLT5sb2NrIHRvIGxvY2F0ZSB0aGUgc2l6ZSBjbGFzcyBvbgo+IDY0LWJpdCBzeXN0ZW1z
Lgo+Cj4gVGhlIGNsYXNzX2lkeCBpcyBpbnZhcmlhbnQgYWNyb3NzIHBhZ2UgbWlncmF0aW9uIChv
bmx5IFBGTiBjaGFuZ2VzKSwKPiBhbmQgNjQtYml0IGFsaWduZWQgcmVhZHMgYXJlIGF0b21pYywg
c28gYSBsb2NrbGVzcyByZWFkIG9mIHRoZSBoYW5kbGUKPiBhbHdheXMgeWllbGRzIGEgdmFsaWQg
Y2xhc3NfaWR4LiAgQWZ0ZXIgYWNxdWlyaW5nIGNsYXNzLT5sb2NrICh3aGljaAo+IGJsb2NrcyBj
b25jdXJyZW50IG1pZ3JhdGlvbiksIHRoZSBoYW5kbGUgaXMgcmUtcmVhZCB0byBvYnRhaW4gYSBz
dGFibGUKPiBQRk4gZm9yIHRoZSBhY3R1YWwgZnJlZSBvcGVyYXRpb24uCj4KPiBUaGlzIGVsaW1p
bmF0ZXMgcndsb2NrIHJlYWQtc2lkZSBjb250ZW50aW9uIGJldHdlZW4genNfZnJlZSgpIGFuZCBw
YWdlCj4gbWlncmF0aW9uL2NvbXBhY3Rpb24sIGltcHJvdmluZyB6c19mcmVlKCkgc2NhbGFiaWxp
dHkgb24gbXVsdGktY29yZQo+IHN5c3RlbXMuCj4KPiBPbiAzMi1iaXQgc3lzdGVtcyAoWlNfT0JK
X0NMQVNTX0lEWCBub3QgZGVmaW5lZCksIHRoZSBvcmlnaW5hbAo+IHBvb2wtPmxvY2sgcGF0aCBp
cyBwcmVzZXJ2ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZW5jaGFvIEhhbyA8aGFvd2VuY2hhb0B4
aWFvbWkuY29tPgo+IC0tLQo+ICBtbS96c21hbGxvYy5jIHwgMjMgKysrKysrKysrKysrKysrKysr
KysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvbW0venNtYWxsb2MuYyBiL21tL3pzbWFsbG9jLmMKPiBpbmRleCBi
Y2NhZGYwYTI3ZjIuLjQ3ZWMwNDE0Y2U5ZSAxMDA2NDQKPiAtLS0gYS9tbS96c21hbGxvYy5jCj4g
KysrIGIvbW0venNtYWxsb2MuYwo+IEBAIC0yMSw2ICsyMSwxMCBAQAo+ICAgKiAgICAgcG9vbC0+
bG9jawo+ICAgKiAgICAgY2xhc3MtPmxvY2sKPiAgICogICAgIHpzcGFnZS0+bG9jawo+ICsgKgo+
ICsgKiBPbiA2NC1iaXQgc3lzdGVtcyB3aXRoIFpTX09CSl9DTEFTU19JRFggZW5hYmxlZCwgenNf
ZnJlZSgpIGRvZXMgbm90Cj4gKyAqIHRha2UgcG9vbC0+bG9jazsgaXQgZXh0cmFjdHMgY2xhc3Nf
aWR4IGZyb20gdGhlIG9iaiBlbmNvZGluZyB3aXRoIGEKPiArICogbG9ja2xlc3MgcmVhZCwgdGhl
biByZS1yZWFkcyBvYmogdW5kZXIgY2xhc3MtPmxvY2suCj4gICAqLwo+Cj4gICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KPiBAQCAtMTQ2NywxMCArMTQ3MSwyNCBAQCB2b2lkIHpzX2ZyZWUoc3Ry
dWN0IHpzX3Bvb2wgKnBvb2wsIHVuc2lnbmVkIGxvbmcgaGFuZGxlKQo+ICAgICAgICAgaWYgKElT
X0VSUl9PUl9OVUxMKCh2b2lkICopaGFuZGxlKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+
Cj4gKyNpZmRlZiBaU19PQkpfQ0xBU1NfSURYCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogVGhl
IGNsYXNzX2lkeCBlbmNvZGVkIGluIG9iaiBpcyBpbnZhcmlhbnQgYWNyb3NzIG1pZ3JhdGlvbgo+
ICsgICAgICAgICogKG9ubHkgUEZOIGNoYW5nZXMpLCBhbmQgdGhlIHJlYWQgb2YgKih1bnNpZ25l
ZCBsb25nICopaGFuZGxlCj4gKyAgICAgICAgKiBpcyBhdG9taWMgb24gNjQtYml0LCBzbyB3ZSBj
YW4gZGV0ZXJtaW5lIHRoZSBjb3JyZWN0IGNsYXNzCj4gKyAgICAgICAgKiB3aXRob3V0IGhvbGRp
bmcgcG9vbC0+bG9jay4KPiArICAgICAgICAqLwo+ICsgICAgICAgb2JqID0gaGFuZGxlX3RvX29i
aihoYW5kbGUpOwo+ICsgICAgICAgY2xhc3MgPSBwb29sLT5zaXplX2NsYXNzW29ial90b19jbGFz
c19pZHgob2JqKV07Cj4gKyAgICAgICBzcGluX2xvY2soJmNsYXNzLT5sb2NrKTsKPiAgICAgICAg
IC8qCj4gLSAgICAgICAgKiBUaGUgcG9vbC0+bG9jayBwcm90ZWN0cyB0aGUgcmFjZSB3aXRoIHpw
YWdlJ3MgbWlncmF0aW9uCj4gLSAgICAgICAgKiBzbyBpdCdzIHNhZmUgdG8gZ2V0IHRoZSBwYWdl
IGZyb20gaGFuZGxlLgo+ICsgICAgICAgICogUmUtcmVhZCB1bmRlciBjbGFzcy0+bG9jazogbWln
cmF0aW9uIGFsc28gYWNxdWlyZXMgY2xhc3MtPmxvY2ssCj4gKyAgICAgICAgKiBzbyB0aGUgb2Jq
IHZhbHVlIGlzIG5vdyBzdGFibGUgYW5kIHRoZSBQRk4gaXMgdmFsaWQuCj4gICAgICAgICAgKi8K
PiArICAgICAgIG9iaiA9IGhhbmRsZV90b19vYmooaGFuZGxlKTsKPiArICAgICAgIG9ial90b196
cGRlc2Mob2JqLCAmZl96cGRlc2MpOwo+ICsgICAgICAgenNwYWdlID0gZ2V0X3pzcGFnZShmX3pw
ZGVzYyk7Cj4gKyNlbHNlCj4gICAgICAgICByZWFkX2xvY2soJnBvb2wtPmxvY2spOwo+ICAgICAg
ICAgb2JqID0gaGFuZGxlX3RvX29iaihoYW5kbGUpOwo+ICAgICAgICAgb2JqX3RvX3pwZGVzYyhv
YmosICZmX3pwZGVzYyk7Cj4gQEAgLTE0NzgsNiArMTQ5Niw3IEBAIHZvaWQgenNfZnJlZShzdHJ1
Y3QgenNfcG9vbCAqcG9vbCwgdW5zaWduZWQgbG9uZyBoYW5kbGUpCj4gICAgICAgICBjbGFzcyA9
IHpzcGFnZV9jbGFzcyhwb29sLCB6c3BhZ2UpOwo+ICAgICAgICAgc3Bpbl9sb2NrKCZjbGFzcy0+
bG9jayk7Cj4gICAgICAgICByZWFkX3VubG9jaygmcG9vbC0+bG9jayk7Cj4gKyNlbmRpZgoKVGhp
cyBsb29rcyBhIGJpdCBpbmVsZWdhbnQuIENhbiB3ZSBleHRyYWN0IGEgaGVscGVyIGxpa2UKb2Jq
X2hhbmRsZV9jbGFzc19sb2NrKCksIG9yIHNvbWV0aGluZyBzaW1pbGFyPyBJdCBjb3VsZCBoYXZl
CmRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgZm9yIDMyLWJpdCBhbmQgNjQtYml0IGJ1aWxkcy4K
Cj4KPiAgICAgICAgIGNsYXNzX3N0YXRfc3ViKGNsYXNzLCBaU19PQkpTX0lOVVNFLCAxKTsKPiAg
ICAgICAgIG9ial9mcmVlKGNsYXNzLT5zaXplLCBvYmopOwo+IC0tCj4gMi4zNC4xCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
