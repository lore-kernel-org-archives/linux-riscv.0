Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842E3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 11:33:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 412C76008E
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 11:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 412C76008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/vK0L4pQqOrxJjIvaRAiSu8T89UuGBix9RBwRhwAyo=; b=NEyRKlkxhL7pGn
	68SDXO+IrfzwGG6uzv9XmPHnpgFKhXAJNMFd5zh3LfCAErnOFEMRzi5tE4ZwLX2JPQG6gO6G40cI2
	Xc9JiTUM6/GmOkoupUNKP2Zq85M1aG0vS7MwE+rNpwUx9DH3rNvyv3J67dPwJSwRkxCOeYlGESZMr
	vJOm46HihWlEu8e7ZjuGIcs5fjVAueJ/5q/OTgTkdOleVLox851t4ESGd8GhzzTcz8g5Toy/Y49jn
	RMYE8Lp6R5CTS1ABoHGuYwXwsL5RV+1lfvFrTiZ8hw0pjWlUocR2QbBvxZytUOsUIFD4/0kbkKhjo
	gFs1RMZymNIXU3Kx4MRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfKi3-001fi7-HL; Tue, 26 Oct 2021 11:33:39 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfKi0-001fgm-C4
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 11:33:38 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 93F0C3F173
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635248012;
 bh=p/YSQVHQ2qVFgAnoHpMJgz8Z7UR53z+rl6CiCMg8icA=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=rN0uXx2tAIuSsssBf651UUh0UYvlUROOV5XPTab3vdIWwFQ7n6whr6dn7+G9TvIXg
 bbP5DZR9F471bRWr0TF6BxJki/BUWxX6p6GSzsIAe3Kx1WAaDrQBlIh28Ss5ckLb1C
 h9eKqZcfCFNTuXrVCSsTrByi2mU5R4/JrBGmbM6P2+jEpd9tNDLJTB+1KWxFmLTcRJ
 PzBqSu26klnJC0llNOcfRbIJTJSS+Z54sDfhMgVLvbWL+vhs4DfBx8/xACdclaE0Jn
 TiDk6pfNbjVcJxyN3eLpELMCT1ykbywbMI47fYyfMxmIHCfV7gyEL59J4UnPjLdhEV
 MYrN9v9mlgdrg==
Received: by mail-ed1-f70.google.com with SMTP id
 z1-20020a05640235c100b003dcf0fbfbd8so12768042edc.6
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 04:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p/YSQVHQ2qVFgAnoHpMJgz8Z7UR53z+rl6CiCMg8icA=;
 b=KxoodIJ9tnnJezSeYyg6hKVUzIq8XdMdL3+0NeN07tAyNhgUYbm+RSsaobdBbtFgyg
 NE+xWE7upmEmJimEDR6yXdIcfCpZS8+8/6tRx6jath5D6e9EBkfJxPp70Cjy84uBsekk
 59m2hf0sL2qMsBgcGcfMb5dFlD4dQd0OczseJrPTGz79d7Mijse3nZuOAePchG5g3DNL
 RmWpa53Ri09RSgZAuGaGlO/hyTnI7H+H81YUz9rHwjNSV68t8Llg0uWifyUfoWtTpGHO
 dNgYzKILsdcsYUuG9D/1Dmjh7D+J1KASaHO8b06i849enXGdmCpWFahDMgRYZgtxnQnR
 y0tw==
X-Gm-Message-State: AOAM531lEGzkrJmk2Ixc8cWPKz8uZaswT+fCxZDKda7f5MtF0VcNE1y8
 d3Mk0CvPEzKkdpiGofrgNzGgAjOU6sYn1Wikv2gd17fsXEV2wtE8QpLwBKSBiVnALECw0aUqDMy
 wm/vV+vbe55yLeTvC9VvCl2iODv0Fujyl4atBDd30V8rdHJw4Z1izr2n7uRWgNA==
X-Received: by 2002:a17:907:3e0a:: with SMTP id
 hp10mr5178675ejc.156.1635248012163; 
 Tue, 26 Oct 2021 04:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk9yh1otC2FcE4T7DFXV6h0+OXQXCBzAm5yVnfRbJ0//wWZH92fSunNBiBY+8wfJj6PEUCHJI5uenfImglgdM=
X-Received: by 2002:a17:907:3e0a:: with SMTP id
 hp10mr5178648ejc.156.1635248011842; 
 Tue, 26 Oct 2021 04:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <YUyWYpDl2Dmegz0a@archlinux-ax161>
 <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
 <YWhg8/UzjJsB51Gd@archlinux-ax161>
 <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
 <990a894c-1806-5ab2-775e-a6f2355c2299@ghiti.fr>
 <CA+zEjCt28iYQARQa=8Nsw8+_j0PuEee==gUqjKjasMo+w2Ohwg@mail.gmail.com>
 <CACT4Y+YB8bjqxFfSrXKbfETXJAUxH=HR+kizC0T-AZLArY3A5A@mail.gmail.com>
In-Reply-To: <CACT4Y+YB8bjqxFfSrXKbfETXJAUxH=HR+kizC0T-AZLArY3A5A@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 26 Oct 2021 13:33:20 +0200
Message-ID: <CA+zEjCtVYLdg3FQnnZjv+Bb-bn2mvj9BCZF787dbNNRHPvyZug@mail.gmail.com>
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexandre ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, elver@google.com,
 akpm@linux-foundation.org, 
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
 ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>,
 kasan-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_043336_643473_EBE0B248 
X-CRM114-Status: GOOD (  58.88  )
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

T24gVHVlLCBPY3QgMjYsIDIwMjEgYXQgNjo0OCBBTSBEbWl0cnkgVnl1a292IDxkdnl1a292QGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAyNiBPY3QgMjAyMSBhdCAwNjozOSwgQWxleGFu
ZHJlIEdoaXRpCj4gPGFsZXhhbmRyZS5naGl0aUBjYW5vbmljYWwuY29tPiB3cm90ZToKPiA+Cj4g
PiBIaSwKPiA+Cj4gPiBPbiBGcmksIE9jdCAxNSwgMjAyMSBhdCAzOjA4IFBNIEFsZXhhbmRyZSBn
aGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIDEwLzE0LzIxIDg6MzEg
UE0sIEFsZXggR2hpdGkgd3JvdGU6Cj4gPiA+ID4gSGkgTmF0aGFuLAo+ID4gPiA+Cj4gPiA+ID4g
TGUgMTQvMTAvMjAyMSDDoCAxODo1NSwgTmF0aGFuIENoYW5jZWxsb3IgYSDDqWNyaXQgOgo+ID4g
PiA+PiBPbiBGcmksIE9jdCAwOCwgMjAyMSBhdCAxMTo0Njo1NUFNIC0wNzAwLCBQYWxtZXIgRGFi
YmVsdCB3cm90ZToKPiA+ID4gPj4+IE9uIFRodSwgMjMgU2VwIDIwMjEgMDc6NTk6NDYgUERUICgt
MDcwMCksIG5hdGhhbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gPiA+Pj4+IE9uIFRodSwgU2VwIDIz
LCAyMDIxIGF0IDEyOjA3OjE3UE0gKzAyMDAsIE1hcmNvIEVsdmVyIHdyb3RlOgo+ID4gPiA+Pj4+
PiBPbiBXZWQsIDIyIFNlcHQgMjAyMSBhdCAyMjo1NSwgTmF0aGFuIENoYW5jZWxsb3IKPiA+ID4g
Pj4+Pj4gPG5hdGhhbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPj4+Pj4+IEN1cnJlbnRseSwg
dGhlIGFzYW4tc3RhY2sgcGFyYW1ldGVyIGlzIG9ubHkgcGFzc2VkIGFsb25nIGlmCj4gPiA+ID4+
Pj4+PiBDRkxBR1NfS0FTQU5fU0hBRE9XIGlzIG5vdCBlbXB0eSwgd2hpY2ggcmVxdWlyZXMKPiA+
ID4gPj4+Pj4+IEtBU0FOX1NIQURPV19PRkZTRVQgdG8KPiA+ID4gPj4+Pj4+IGJlIGRlZmluZWQg
aW4gS2NvbmZpZyBzbyB0aGF0IHRoZSB2YWx1ZSBjYW4gYmUgY2hlY2tlZC4gSW4gUklTQy1WJ3MK
PiA+ID4gPj4+Pj4+IGNhc2UsIEtBU0FOX1NIQURPV19PRkZTRVQgaXMgbm90IGRlZmluZWQgaW4g
S2NvbmZpZywgd2hpY2ggbWVhbnMKPiA+ID4gPj4+Pj4+IHRoYXQKPiA+ID4gPj4+Pj4+IGFzYW4t
c3RhY2sgZG9lcyBub3QgZ2V0IGRpc2FibGVkIHdpdGggY2xhbmcgZXZlbiB3aGVuCj4gPiA+ID4+
Pj4+PiBDT05GSUdfS0FTQU5fU1RBQ0sKPiA+ID4gPj4+Pj4+IGlzIGRpc2FibGVkLCByZXN1bHRp
bmcgaW4gbGFyZ2Ugc3RhY2sgd2FybmluZ3Mgd2l0aCBhbGxtb2Rjb25maWc6Cj4gPiA+ID4+Pj4+
Pgo+ID4gPiA+Pj4+Pj4gZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMv
cGFuZWwtbGdwaGlsaXBzLWxiMDM1cTAyLmM6MTE3OjEyOgo+ID4gPiA+Pj4+Pj4KPiA+ID4gPj4+
Pj4+IGVycm9yOiBzdGFjayBmcmFtZSBzaXplICgxNDQwMCkgZXhjZWVkcyBsaW1pdCAoMjA0OCkg
aW4gZnVuY3Rpb24KPiA+ID4gPj4+Pj4+ICdsYjAzNXEwMl9jb25uZWN0JyBbLVdlcnJvciwtV2Zy
YW1lLWxhcmdlci10aGFuXQo+ID4gPiA+Pj4+Pj4gc3RhdGljIGludCBsYjAzNXEwMl9jb25uZWN0
KHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldikKPiA+ID4gPj4+Pj4+ICAgICAgICAgICAg
IF4KPiA+ID4gPj4+Pj4+IDEgZXJyb3IgZ2VuZXJhdGVkLgo+ID4gPiA+Pj4+Pj4KPiA+ID4gPj4+
Pj4+IEVuc3VyZSB0aGF0IHRoZSB2YWx1ZSBvZiBDT05GSUdfS0FTQU5fU1RBQ0sgaXMgYWx3YXlz
IHBhc3NlZAo+ID4gPiA+Pj4+Pj4gYWxvbmcgdG8KPiA+ID4gPj4+Pj4+IHRoZSBjb21waWxlciBz
byB0aGF0IHRoZXNlIHdhcm5pbmdzIGRvIG5vdCBoYXBwZW4gd2hlbgo+ID4gPiA+Pj4+Pj4gQ09O
RklHX0tBU0FOX1NUQUNLIGlzIGRpc2FibGVkLgo+ID4gPiA+Pj4+Pj4KPiA+ID4gPj4+Pj4+IExp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzE0NTMK
PiA+ID4gPj4+Pj4+IFJlZmVyZW5jZXM6IDZiYWVjODgwZDdhNSAoImthc2FuOiB0dXJuIG9mZiBh
c2FuLXN0YWNrIGZvciBjbGFuZy04Cj4gPiA+ID4+Pj4+PiBhbmQgZWFybGllciIpCj4gPiA+ID4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+
Cj4gPiA+ID4+Pj4+Cj4gPiA+ID4+Pj4+IFJldmlld2VkLWJ5OiBNYXJjbyBFbHZlciA8ZWx2ZXJA
Z29vZ2xlLmNvbT4KPiA+ID4gPj4+Pgo+ID4gPiA+Pj4+IFRoYW5rcyEKPiA+ID4gPj4+Pgo+ID4g
PiA+Pj4+PiBbIFdoaWNoIHRyZWUgYXJlIHlvdSBwbGFubmluZyB0byB0YWtlIGl0IHRocm91Z2g/
IF0KPiA+ID4gPj4+Pgo+ID4gPiA+Pj4+IEdhaCwgSSB3YXMgaW50ZW5kaW5nIGZvciBpdCB0byBn
byB0aHJvdWdoIC1tbSwgdGhlbiBJIGNjJ2QgbmVpdGhlcgo+ID4gPiA+Pj4+IEFuZHJldyBub3Ig
bGludXgtbW0uLi4gOi8gQW5kcmV3LCBkbyB5b3Ugd2FudCBtZSB0byByZXNlbmQgb3IgY2FuIHlv
dQo+ID4gPiA+Pj4+IGdyYWIgaXQgZnJvbSBMS01MPwo+ID4gPiA+Pj4KPiA+ID4gPj4+IEFja2Vk
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+ID4gPiA+Pj4K
PiA+ID4gPj4+IChhc3N1bWluZyB5b3Ugc3RpbGwgd2FudCBpdCB0aHJvdWdoIHNvbWV3aGVyZSBl
bHNlKQo+ID4gPiA+Pgo+ID4gPiA+PiBUaGFua3MsIGl0IGlzIG5vdyBpbiBtYWlubGluZSBhcyBj
b21taXQgMTk1MzI4NjlmZWI5ICgia2FzYW46IGFsd2F5cwo+ID4gPiA+PiByZXNwZWN0IENPTkZJ
R19LQVNBTl9TVEFDSyIpLgo+ID4gPiA+Pgo+ID4gPiA+Pj4+PiBOb3RlLCBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2thc2FuLmggbWVudGlvbnMgS0FTQU5fU0hBRE9XX09GRlNFVCBpbgo+ID4gPiA+
Pj4+PiBjb21tZW50IChjb3BpZWQgZnJvbSBhcm02NCkuIERpZCBSSVNDLVYganVzdCBmb3JnZXQg
dG8gY29weSBvdmVyIHRoZQo+ID4gPiA+Pj4+PiBLY29uZmlnIG9wdGlvbj8KPiA+ID4gPj4+Pgo+
ID4gPiA+Pj4+IEkgZG8gc2VlIGl0IGRlZmluZWQgaW4gdGhhdCBmaWxlIGFzIHdlbGwgYnV0IHlv
dSBhcmUgcmlnaHQgdGhhdAo+ID4gPiA+Pj4+IHRoZXkgZGlkCj4gPiA+ID4+Pj4gbm90IGNvcHkg
dGhlIEtjb25maWcgbG9naWMsIGV2ZW4gdGhvdWdoIGl0IHdhcyBwcmVzZW50IGluIHRoZSB0cmVl
Cj4gPiA+ID4+Pj4gd2hlbgo+ID4gPiA+Pj4+IFJJU0MtViBLQVNBTiB3YXMgaW1wbGVtZW50ZWQu
IFBlcmhhcHMgdGhleSBzaG91bGQgc28gdGhhdCB0aGV5IGdldAo+ID4gPiA+Pj4+IGFjY2VzcyB0
byB0aGUgb3RoZXIgZmxhZ3MgaW4gdGhlICJlbHNlIiBicmFuY2g/Cj4gPiA+ID4+Pgo+ID4gPiA+
Pj4gWWEsIGxvb2tzIGxpa2Ugd2UganVzdCBzY3Jld2VkIHRoaXMgdXAuICBJJ20gc2VlaW5nIHNv
bWUgd2FybmluZ3MgbGlrZQo+ID4gPiA+Pj4KPiA+ID4gPj4+ICAgICBjYzE6IHdhcm5pbmc6IOKA
mC1mc2FuaXRpemU9a2VybmVsLWFkZHJlc3PigJkgd2l0aCBzdGFjayBwcm90ZWN0aW9uCj4gPiA+
ID4+PiBpcyBub3Qgc3VwcG9ydGVkIHdpdGhvdXQg4oCYLWZhc2FuLXNoYWRvdy1vZmZzZXQ94oCZ
IGZvciB0aGlzIHRhcmdldAo+ID4gPiA+Pgo+ID4gPiA+PiBIbW1tLCBJIHRob3VnaHQgSSBkaWQg
YSBHQ0MgYnVpbGQgd2l0aCB0aGlzIGNoYW5nZSBidXQgSSBtdXN0IG5vdCBoYXZlCj4gPiA+ID4+
IDovCj4gPiA+ID4+Cj4gPiA+ID4+PiB3aGljaCBpcyBob3cgSSBlbmRlZCB1cCBoZXJlLCBJJ20g
YXNzdW1pbmcgdGhhdCdzIHdoYXQgeW91J3JlCj4gPiA+ID4+PiB0YWxraW5nIGFib3V0Cj4gPiA+
ID4+PiBoZXJlPyAgTE1LIGlmIHlvdSB3ZXJlIHBsYW5uaW5nIG9uIHNlbmRpbmcgYWxvbmcgYSBm
aXggb3IgaWYgeW91Cj4gPiA+ID4+PiB3YW50IG1lIHRvCj4gPiA+ID4+PiBnbyBmaWd1cmUgaXQg
b3V0Lgo+ID4gPiA+Pgo+ID4gPiA+PiBJIHRvb2sgYSBsb29rIGF0IG1vdmluZyB0aGUgbG9naWMg
aW50byBLY29uZmlnIGxpa2UgYXJtNjQgYmVmb3JlIHNlbmRpbmcKPiA+ID4gPj4gdGhpcyBjaGFu
Z2UgYW5kIEkgZGlkIG5vdCByZWFsbHkgdW5kZXJzdGFuZCBpdCB3ZWxsIGVub3VnaCB0byBkbyBz
by4gSQo+ID4gPiA+PiB0aGluayBpdCB3b3VsZCBiZSBiZXN0IGlmIHlvdSB3ZXJlIGFibGUgdG8g
ZG8gdGhhdCBzbyB0aGF0IG5vdGhpbmcgZ2V0cwo+ID4gPiA+PiBtZXNzZWQgdXAuCj4gPiA+ID4+
Cj4gPiA+ID4KPiA+ID4gPiBJJ2xsIGRvIGl0IHRvbW9ycm93LCBJJ20gdGhlIGxhc3Qgb25lIHdo
byB0b3VjaGVkIGthc2FuIG9uIHJpc2N2IDopCj4gPiA+ID4KPiA+ID4KPiA+ID4gQWRkaW5nIEtB
U0FOX1NIQURPV19PRkZTRVQgY29uZmlnIG1ha2VzIGthc2FuIGtlcm5lbCBmYWlscyB0byBib290
Lgo+ID4gPiBJdCByZWNlaXZlcyBhICp3cml0ZSogZmF1bHQgYXQgdGhlIGJlZ2lubmluZyBvZiBh
IG1lbWJsb2NrX2FsbG9jCj4gPiA+IGZ1bmN0aW9uIHdoaWxlIHBvcHVsYXRpbmcgdGhlIGtlcm5l
bCBzaGFkb3cgbWVtb3J5OiB0aGUgdHJhcCBhZGRyZXNzIGlzCj4gPiA+IGluIHRoZSBrYXNhbiBz
aGFkb3cgdmlydHVhbCBhZGRyZXNzIHJhbmdlIGFuZCB0aGlzIGNvcnJlc3BvbmRzIHRvIGEKPiA+
ID4ga2VybmVsIGFkZHJlc3MgaW4gaW5pdF9zdGFjay4gVGhlIHF1ZXN0aW9uIGlzOiBob3cgZG8g
SSBwb3B1bGF0ZSB0aGUKPiA+ID4gc3RhY2sgc2hhZG93IG1hcHBpbmcgd2l0aG91dCB1c2luZyBt
ZW1ibG9jayBBUEk/IEl0J3Mgd2VpcmQsIEkgZG9uJ3QKPiA+ID4gZmluZCBhbnl0aGluZyBvbiBv
dGhlciBhcmNoaXRlY3R1cmVzLgo+ID4KPiA+IEBrYXNhbjogQW55IGlkZWEgd2hhdCB3ZSBhcmUg
ZG9pbmcgd3JvbmcgaW4gcmlzY3YgdG8gZW5jb3VudGVyIHRoZQo+ID4gYWJvdmUgc2l0dWF0aW9u
Pwo+Cj4gSGkgQWxleCwgUGFsbWVyLAo+Cj4gVGhlIHBhdGNoIGNoYW5nZXMgdGhlIGRlZmluaXRp
b24gb2YgdGhlIEtBU0FOX1NIQURPV19PRkZTRVQgY29uc3QuCj4gRG9lcyBpdCdzIHZhbHVlIGNo
YW5nZSBhcyBhIHJlc3VsdCBvciBub3Q/IEhhdmUgeW91IHRyaWVkIHRvIHByaW50IGl0Cj4gYmVm
b3JlL2FmdGVyPwo+IElmIHZhbHVlIGRvZXMgbm90IGNoYW5nZSwgdGhlbiB0aGlzIGlzIG1vcmUg
bXlzdGVyaW91cy4gSWYgaXQgY2hhbmdlcywKPiB0aGVuIHRoZXJlIGxvdHMgb2YgcG9zc2libGUg
ZXhwbGFuYXRpb25zIChwb2ludHMgdG8gdW5tYXBwZWQgcmVnaW9uLAo+IG92ZXJsYXBzIHdpdGgg
c29tZXRoaW5nKSwgYnV0IHdlIG5lZWQgdG8ga25vdyB2YWx1ZXMgYmVmb3JlL2FmdGVyIHRvCgpT
byBJIGRlYnVnZ2VkIGEgYml0IG1vcmUgd2hhdCBoYXBwZW5lZCBoZXJlLCBhbmQgYWN0dWFsbHkg
dGhlIGN1bHByaXQKaXMgdGhlIGNhbGwgdG8ga2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93IGF0
IHRoZSBiZWdpbm5pbmcgb2YKa2FzYW5faW5pdCB3aGljaCB3cml0ZS1wcm90ZWN0cyB0aGUgYWNj
ZXNzIHRvIGthc2FuX2Vhcmx5X3NoYWRvd19wYWdlCmFuZCBoZW5jZSB0aGUgd3JpdGUgZmF1bHQg
bGF0ZXIgd2hlbiB1c2luZyBtZW1ibG9jay4gSSBkb24ndCBzZWUgdGhlCnBvaW50IG9mIHRoaXMg
Y2FsbCBhbnl3YXkgc2luY2Ugd2UgcG9wdWxhdGUgc3dhcHBlcl9wZ19kaXIgaW4Ka2FzYW5fZWFy
bHlfaW5pdCBhbmQgdGhlbiB3ZSB3cml0ZS1wcm90ZWN0IHRoZSBhY2Nlc3MgdG8Ka2FzYW5fZWFy
bHlfc2hhZG93X3BhZ2UgYXQgdGhlIGVuZCBvZiBrYXNhbl9pbml0LgoKQnV0IHRoYXQgbWF5IG5v
dCBiZSBpZGVhbCwgc28gSSdtIG9wZW4gdG8gYSBiZXR0ZXIgc3VnZ2VzdGlvbiB0aGFuCmp1c3Qg
cmVtb3ZpbmcgdGhlIGNhbGwgdG8ga2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93LgoKU29ycnkg
SSBkaWQgbm90IGRpZyBmdXJ0aGVyIGJlZm9yZSBhc2tpbmcgYW5kIHRoYW5rcyBmb3IgeW91ciB0
aW1lLAoKQWxleAoKPiBhbnN3ZXIgdGhpcy4KPgo+Cj4gPiBUaGFua3MsCj4gPgo+ID4gQWxleAo+
ID4KPiA+ID4KPiA+ID4gQW5kIGp1c3QgYSBzaG9ydCBub3RlOiBJIGhhdmUgcmVhbGl6ZWQgdGhp
cyB3aWxsIGJyZWFrIHdpdGggdGhlIHN2NDgKPiA+ID4gcGF0Y2hzZXQgYXMgd2UgZGVjaWRlIGF0
IHJ1bnRpbWUgdGhlIGFkZHJlc3Mgc3BhY2Ugd2lkdGggYW5kIHRoZSBrYXNhbgo+ID4gPiBzaGFk
b3cgc3RhcnQgYWRkcmVzcyBpcyBkaWZmZXJlbnQgYmV0d2VlbiBzdjM5IGFuZCBzdjQ4LiBJIHdp
bGwgaGF2ZSB0bwo+ID4gPiBkbyBsaWtlIHg4NiBhbmQgbW92ZSB0aGUga2FzYW4gc2hhZG93IHN0
YXJ0IGF0IHRoZSBlbmQgb2YgdGhlIGFkZHJlc3MKPiA+ID4gc3BhY2Ugc28gdGhhdCBpdCBpcyB0
aGUgc2FtZSBmb3IgYm90aCBzdjM5IGFuZCBzdjQ4Lgo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+
Cj4gPiA+IEFsZXgKPiA+ID4KPiA+ID4KPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4KPiA+ID4gPiBB
bGV4Cj4gPiA+ID4KPiA+ID4gPj4gQ2hlZXJzLAo+ID4gPiA+PiBOYXRoYW4KPiA+ID4gPj4KPiA+
ID4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
ID4gPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+ID4+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiA+ID4gPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4gPiA+Pgo+ID4gPiA+Cj4gPiA+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiA+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
PiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo+ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
