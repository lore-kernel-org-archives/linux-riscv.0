Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750F1E77188
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 11:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WsNr4F66Z8AuahYA3S/UaDZrWzhMAibIPqZ0BZUCyg=; b=gmN3S8Jg+D1m4S
	zmw+rwUFcUyYFlcveM6q1B5oJQOqqOgHPrx/IfZDHg3uMLcsYN/rdrR9e9D3XxzYJceA09Yx9tgaW
	uXcw5fYGrABm4datrOCLV9PBIRi2qLLbFTI4OjPTZeZR1T2Y954eQdDdRhO1Awwgyrl46efn2mcG9
	VWy3KR/4Tm9V7hCEEg55b7l8RflO0OH7+SZ0kvDJBvqNnaboI1LGbDagzNNzwcW2mDIElBXFm/9Fc
	kPHLs5RoiNYAJqxiF7wX1PPq2yalno6c3UCnnaNNJ2nfIcIzitGyiOcR3EcGVRMJtgYzULzaBZ9jj
	GKQbNP0RENCCR5RE6JTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPKId-00000008DXP-2Hm3;
	Sun, 22 Dec 2024 11:39:07 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPKIa-00000008DWq-3Z0I
	for linux-riscv@lists.infradead.org;
	Sun, 22 Dec 2024 11:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734867542;
	bh=YPw6sMaDMzAuh1Vjj/VL1FTkNY/UOx5jYTXHVNGYTts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5YmYccQ8QsUZuEHcBgt9b/0DxV/PbWZ9oM7L875luoqZl+AzzW3MKUoNf1ql8QVg
	 PtA0+b617zdYsX24vztrIdVBeDS1M3tfvsUhsIoNYcsRCEKTCo4gEFlNv67Gfg1u6V
	 LSisdAK6Z0NCFH6lLcOzofXeNC92Ab3Zv73bl2uE=
Date: Sun, 22 Dec 2024 12:39:01 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH 1/6] tools/nolibc: add support for waitid()
Message-ID: <732f202e-c0de-493e-adec-59fe069b17c9@t-8ch.de>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
 <20241221-nolibc-rv32-v1-1-d9ef6dab7c63@weissschuh.net>
 <20241221163540.GA11984@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241221163540.GA11984@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_033905_036566_04D193F3 
X-CRM114-Status: GOOD (  21.07  )
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

SGkgV2lsbHkhCgpPbiAyMDI0LTEyLTIxIDE3OjM1OjQwKzAxMDAsIFdpbGx5IFRhcnJlYXUgd3Jv
dGU6Cj4gT24gU2F0LCBEZWMgMjEsIDIwMjQgYXQgMDM6NDQ6MjhQTSArMDEwMCwgVGhvbWFzIFdl
acOfc2NodWggd3JvdGU6Cj4gPiB3YWl0aWQoKSBpcyB0aGUgbW9kZXJuIHZhcmlhbnQgb2YgdGhl
IGZhbWlseSBvZiB3YWl0LWxpa2Ugc3lzY2FsbHMuCj4gPiBTb21lIGFyY2hpdGVjdHVyZXMgaGF2
ZSBkcm9wcGVkIHN1cHBvcnQgZm9yIHdhaXQoKSwgd2FpdDQoKSBhbmQgd2FpdHBpZCgpCj4gPiBi
dXQgYWxsIG9mIHRoZW0gc3VwcG9ydCB3YWl0aWQoKS4KPiA+IEl0IGlzIG1vcmUgZmxleGlibGUg
YW5kIGVhc2llciB0byB1c2UgdGhhbiB0aGUgb2xkZXIgb25lcy4KPiAKPiBJJ20gZ2VuZXJhbGx5
IGZpbmUgd2l0aCB0aGUgc2VyaWVzLCBidXQgSSdtIHN0YXJ0aW5nIHRvIGdldCBjb25jZXJuZWQK
PiB0aGF0IHNvbWUgc2ltcGxlIGFwcGxpY2F0aW9ucyB0aGF0IHVzZWQgdG8gcmVseSBvbiB3YWl0
KCkgb3Igd2FpdHBpZCgpCj4gd2lsbCBub3Qgd29yayBvbiB0aGlzIGFyY2hpdGVjdHVyZS4gSnVz
dCBsaWtlIHdlIGRpZCBmb3Igc29tZSBlYXJseQo+IHN5c2NhbGxzIHRoYXQgZ290IHJlcGxhY2Vk
IChlLmcuIG9wZW4tPm9wZW5hdCBldGMpLCBJIHRoaW5rIHdlJ2xsIGhhdmUKPiB0byBpbXBsZW1l
bnQgYSBkZWZhdWx0IHdyYXBwZXIgcmVseWluZyBvbiB3YWl0aWQoKSBmb3IgYWxsIHRoZXNlIGNh
bGxzCj4gaW4gdGhpcyBjYXNlLCBhbmQgbWF5YmUgYXMgd2VsbCBmb3IgbHNlZWstPmxsc2Vlaygp
IGJ0dywgd2hhdCBkbyB5b3UKPiB0aGluayA/CgpJbmRlZWQsIGl0IHdvdWxkIGJlIG5pY2UgdG8g
aGF2ZSBmdWxsIGNvbXBhdGliaWxpdHkuIEhvd2V2ZXIgdGhlcmUgYXJlCm1vcmUgc3lzY2FsbHMg
bWlzc2luZyB0aGFuIHdhaXQoKSBhbmQgbHNlZWsoKS4gVGhlc2UgYXJlIGp1c3QgdGhlCm1pc3Np
bmcgb25lcyBhZmZlY3Rpbmcgbm9saWJjLXRlc3QuCkFkZGluZyB3cmFwcGVycyB3aWxsIGJlIG1v
cmUgd29yay4gVGhpcyBzZXJpZXMgaXMgb25seSBtZWFudCB0bwplbnN1cmUgdGhhdCB0aGUgZXhp
c3RpbmcgbGltaXRlZCBzdXBwb3J0IGRvZXMgbm90IHJlZ3Jlc3MuCgpXZSBjYW4gYWRkIGNvbXBh
dGliaWxpdHkgd3JhcHBlcnMgb25lIGFmdGVyIHRoZSBvdGhlciBvbiB0b3AuCkkgdGhpbmsgWmhh
bmdqaW4gaW1wbGVtZW50ZWQgYW5kIHByb3Bvc2VkIGEgZmV3IGJlZm9yZSwgYnV0IGEgZmV3IG9m
CnRoZW0gZW5kZWQgdXAgY29tcGxpY2F0ZWQuCgo+IFRoZSBzaW5nbGUgZmFjdCB0aGF0IHlvdSd2
ZSBoYWQgdG8gbW9kaWZ5IHNvbWUgb2YgdGhlIG5vbGliYy10ZXN0IGNvZGUKPiAod2hpY2ggaXMg
c3VwcG9zZWQgdG8gYmUgdGhlIGFwcGxpY2F0aW9uIGhlcmUpIGluZGljYXRlcyB0aGF0IHdlJ3Jl
Cj4gcHJvZ3Jlc3NpdmVseSBnb2luZyBhd2F5IGZyb20gd2hhdCBhcHBsaWNhdGlvbnMgbmVlZCBv
biBjZXJ0YWluIGFyY2hzLgo+IElkZWFsbHkgYW4gYXBwbGljYXRpb24gcmVseWluZyBvbiBsb25n
LWVzdGFibGlzaGVkIGNhbGxzIHNob3VsZCBjb250aW51ZQo+IHRvIHdvcmsgdW5tb2RpZmllZC4K
CkFncmVlZC4KCj4gTWF5YmUgaXQgd2lsbCBiZSB0aW1lIGZvciB1cyB0byBydW4gYW4gb3ZlcmFs
bCBhdWRpdCBvZiBhcmNoLWRlcGVuZGVudAo+IHN5c2NhbGxzIHdlIGN1cnJlbnRseSBoYXZlLCB0
byBtYWtlIHN1cmUgdGhhdCB0aGUgY29tbW9uIG9uZXMgY29udGludWUKPiB0byB3b3JrIGZpbmUg
dGhlcmUgKGFuZCB3YWl0cGlkKCkgZGVmaW5pdGVseSBpcyBhcyBjb21tb24gYSBzeXNjYWxsIGFz
Cj4gb3BlbigpIHNpbmNlIGl0J3MgdGhlIGdvb2Qgb2xkIGFuZCBwb3J0YWJsZSBvbmUpLgoKSXNu
J3QgdGhpcyB3aGF0IG5vbGliYy10ZXN0IGlzIGFscmVhZHkgZG9pbmc/Ck9yIGRvIHlvdSBhbHNv
IHdhbnQgdG8gY29tcGFyZSBpdCB0byBub24tY3VycmVudCBrZXJuZWwgdmVyc2lvbnM/CgpJbiBn
ZW5lcmFsIHRoZSBzcGVjaWFsIHJ2MzIgc3lzY2FsbHMgYXJlIG5vdCByZWFsbHkKYXJjaGl0ZWN0
dXJlLWRlcGVuZGVudCwgdGhleSBqdXN0IGRyb3BwZWQgdGhlICJsZWdhY3kiIG9uZXMsIGVzcGVj
aWFsbHkKYWxsIHVzaW5nIDMyYml0IHRpbWVzdGFtcHMuCgoKVGhvbWFzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
