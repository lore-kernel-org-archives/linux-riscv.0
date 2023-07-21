Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8399DC001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 17:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXfffRxxf9kdf4rWN9ehWrSjNLuhMPkWnxgySghVe/4=; b=dJU+pRrqxSXN4h
	LyHQydTfImMXYYqi9yvLqMxBeZRsqVmtN3JgTIj7DvNjHlTGKAiEJmhTcM1ZH6DOEucfbVQRLv4a1
	yF1wG5+mbvGYcF59Gft/Zlxxba5p0ent0LzIXfnoSnKZdoUH+0jTPlF3q4UWIJxARUhKeC97QSw8x
	NVoYKTcteGgTwD3jDJyvVFz02nDtjW+S22+jGEVm4n34D1joLiWMgMcM7dA26jwxaiTR+3k5Zou4v
	nCbppbtCEotXP+yz1k5uhU5wb/AYZZdQEhGRvLF1/YzrvaPImPdFSZXX6Kq/p/fatWrlgVT483buX
	dHAxsFLD3XHQFbgpnXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtXX-00Eh2r-00;
	Fri, 21 Jul 2023 17:03:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtXT-00Eh1l-1h
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 17:03:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D087261D61
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 17:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC69EC433D9
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689959013;
	bh=5JLpzCIcP8GrNwfhf6Q72RzlXws33EqGiwwug49sJZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LNfbQodAtZzeDkyOfQdMDBi50Gyas+DIpOQ7sDqTE9htpf+PdR+tg8C5psq8brz2Q
	 ZuE5TLeIX5LqqVmKYiW5E15BKgUXKzMKtGnrN1vm0dhwDIDEOzo4MskCU1OIQ1u1c6
	 pjQFiz8VBbChK6sZR+/VOjLmX9+0w0zGSwW7VhJ0iS9URHUB+ePLikv4AhAhvvMfQs
	 mtA0o2O+S2/xYsqzqk1xXSnHMuX/4/1b12Q04/g2C0DhxlNesWeEMYniTspe+4c4kU
	 epDK9hUG7br2gkaesFngSq0KFEyhuUbAFfqKcMY+dKSURwZ50Z3psEMlry4k/dVlsB
	 KvgFHNUFAACOw==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-565db4666d7so1373721eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 10:03:33 -0700 (PDT)
X-Gm-Message-State: ABy/qLbmdODaLaScCihUsZzEnZm6OOYJHpzhMea6I3mOkmi7zblKHM9l
	GF2NZZ2mOTiuvB+sKpgp8QOr/Vfr5N1nJUx563o=
X-Google-Smtp-Source: APBJJlHkxE2hRMjRtwdE1wEe7yvoUrAsmGMiIkRnfMseS4U8D4zRxUXkhZI4fB5CzBs8Cs+kWawoSCgf4omuzIkWWv4=
X-Received: by 2002:a4a:7544:0:b0:563:625b:e02e with SMTP id
 g4-20020a4a7544000000b00563625be02emr1873643oof.9.1689959013011; Fri, 21 Jul
 2023 10:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230721150147.11720-2-palmer@rivosinc.com>
In-Reply-To: <20230721150147.11720-2-palmer@rivosinc.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 22 Jul 2023 02:02:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATF9pxJc0nU3NPnX_PFJr7gF6Baras548ULkO8XE98_VQ@mail.gmail.com>
Message-ID: <CAK7LNATF9pxJc0nU3NPnX_PFJr7gF6Baras548ULkO8XE98_VQ@mail.gmail.com>
Subject: Re: [PATCH] modpost, kallsyms: Treat add '$'-prefixed symbols as
 mapping symbols
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: wangkefeng.wang@huawei.com, mcgrof@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_100335_651281_048E861C 
X-CRM114-Status: GOOD (  24.64  )
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

T24gU2F0LCBKdWwgMjIsIDIwMjMgYXQgMTI6MjDigK9BTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUcnlpbmcgdG8gcmVzdHJpY3QgdGhlICckJy1wcmVm
aXggY2hhbmdlIHRvIFJJU0MtViBjYXVzZWQgc29tZSBmYWxsb3V0LAo+IHNvIGxldCdzIGp1c3Qg
dHJlYXQgYWxsIHRob3NlIHN5bWJvbHMgYXMgc3BlY2lhbC4KPgo+IEZpeGVzOiBjMDU3ODBlZjNj
MSAoIm1vZHVsZTogSWdub3JlIFJJU0MtViBtYXBwaW5nIHN5bWJvbHMgdG9vIikKPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA3MTIwMTU3NDcuNzcyNjMtMS13YW5na2Vm
ZW5nLndhbmdAaHVhd2VpLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHJpdm9zaW5jLmNvbT4KCgpSZXZpZXdlZC1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGly
b3lAa2VybmVsLm9yZz4KCgo+IC0tLQo+IEl0IHdhc24ndCBjbGVhciBpZiB3ZSBzaG91bGQganVz
dCByZXZlcnQgdGhlIG9yaWdpbmFsIHBhdGNoIGFuZCBzcGluIGEKPiBuZXcgb25lLCBidXQgbG9v
a3MgbGlrZSB0aGlzIGlzIGluIGF0IGxlYXN0IHNvbWUgdHJlZXMgc28gSSBzZW50IGEKPiBmb2xs
b3ctb24gcGF0Y2ggLS0gYXQgbGVhc3QgdGhpcyB3YXkgSSBjYW4gbWFrZSBjb2ZmZWUgYmVmb3Jl
IGZvcmdldHRpbmcKPiB0byBzZW5kIGl0IDspCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvbW9kdWxl
X3N5bWJvbC5oIHwgMTYgKystLS0tLS0tLS0tLS0tLQo+ICBrZXJuZWwvbW9kdWxlL2thbGxzeW1z
LmMgICAgICB8ICAyICstCj4gIHNjcmlwdHMvbW9kL21vZHBvc3QuYyAgICAgICAgIHwgIDIgKy0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW9kdWxlX3N5bWJvbC5oIGIvaW5jbHVkZS9saW51
eC9tb2R1bGVfc3ltYm9sLmgKPiBpbmRleCA1Yjc5OTk0MmIyNDMuLjEyNjk1NDNkMDYzNCAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21vZHVsZV9zeW1ib2wuaAo+ICsrKyBiL2luY2x1ZGUv
bGludXgvbW9kdWxlX3N5bWJvbC5oCj4gQEAgLTMsMjUgKzMsMTMgQEAKPiAgI2RlZmluZSBfTElO
VVhfTU9EVUxFX1NZTUJPTF9ICj4KPiAgLyogVGhpcyBpZ25vcmVzIHRoZSBpbnRlbnNlbHkgYW5u
b3lpbmcgIm1hcHBpbmcgc3ltYm9scyIgZm91bmQgaW4gRUxGIGZpbGVzLiAqLwo+IC1zdGF0aWMg
aW5saW5lIGludCBpc19tYXBwaW5nX3N5bWJvbChjb25zdCBjaGFyICpzdHIsIGludCBpc19yaXNj
dikKPiArc3RhdGljIGlubGluZSBpbnQgaXNfbWFwcGluZ19zeW1ib2woY29uc3QgY2hhciAqc3Ry
KQo+ICB7Cj4gICAgICAgICBpZiAoc3RyWzBdID09ICcuJyAmJiBzdHJbMV0gPT0gJ0wnKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgICAgICAgIGlmIChzdHJbMF0gPT0gJ0wnICYm
IHN0clsxXSA9PSAnMCcpCj4gICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+IC0gICAgICAg
LyoKPiAtICAgICAgICAqIFJJU0MtViBkZWZpbmVzIHZhcmlvdXMgc3BlY2lhbCBzeW1ib2xzIHRo
YXQgc3RhcnQgd2l0aCAiJCIuICBUaGUKPiAtICAgICAgICAqIG1hcHBpbmcgc3ltYm9scywgd2hp
Y2ggZXhpc3QgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGluY29tcGF0aWJsZQo+IC0gICAgICAg
ICogaW5zdHJ1Y3Rpb24gZW5jb2RpbmdzIHdoZW4gZGlzYXNzZW1ibGluZywgc2hvdyB1cCBhbGwg
b3ZlciB0aGUgcGxhY2UKPiAtICAgICAgICAqIGFuZCBhcmUgZ2VuZXJhbGx5IG5vdCBtZWFudCB0
byBiZSB0cmVhdGVkIGxpa2Ugb3RoZXIgc3ltYm9scy4gIFNvCj4gLSAgICAgICAgKiBqdXN0IGln
bm9yZSBhbnkgb2YgdGhlIHNwZWNpYWwgc3ltYm9scy4KPiAtICAgICAgICAqLwo+IC0gICAgICAg
aWYgKGlzX3Jpc2N2KQo+IC0gICAgICAgICAgICAgICByZXR1cm4gc3RyWzBdID09ICckJzsKPiAt
Cj4gLSAgICAgICByZXR1cm4gc3RyWzBdID09ICckJyAmJgo+IC0gICAgICAgICAgICAgIChzdHJb
MV0gPT0gJ2EnIHx8IHN0clsxXSA9PSAnZCcgfHwgc3RyWzFdID09ICd0JyB8fCBzdHJbMV0gPT0g
J3gnKQo+IC0gICAgICAgICAgICAgICYmIChzdHJbMl0gPT0gJ1wwJyB8fCBzdHJbMl0gPT0gJy4n
KTsKPiArICAgICAgIHJldHVybiBzdHJbMF0gPT0gJyQnOwo+ICB9Cj4KPiAgI2VuZGlmIC8qIF9M
SU5VWF9NT0RVTEVfU1lNQk9MX0ggKi8KPiBkaWZmIC0tZ2l0IGEva2VybmVsL21vZHVsZS9rYWxs
c3ltcy5jIGIva2VybmVsL21vZHVsZS9rYWxsc3ltcy5jCj4gaW5kZXggNzhhMWZmYzM5OWQ5Li5l
ZjczYWU3Yzg5MDkgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL21vZHVsZS9rYWxsc3ltcy5jCj4gKysr
IGIva2VybmVsL21vZHVsZS9rYWxsc3ltcy5jCj4gQEAgLTI4OSw3ICsyODksNyBAQCBzdGF0aWMg
Y29uc3QgY2hhciAqZmluZF9rYWxsc3ltc19zeW1ib2woc3RydWN0IG1vZHVsZSAqbW9kLAo+ICAg
ICAgICAgICAgICAgICAgKiBhbmQgaW5zZXJ0ZWQgYXQgYSB3aGltLgo+ICAgICAgICAgICAgICAg
ICAgKi8KPiAgICAgICAgICAgICAgICAgaWYgKCprYWxsc3ltc19zeW1ib2xfbmFtZShrYWxsc3lt
cywgaSkgPT0gJ1wwJyB8fAo+IC0gICAgICAgICAgICAgICAgICAgaXNfbWFwcGluZ19zeW1ib2wo
a2FsbHN5bXNfc3ltYm9sX25hbWUoa2FsbHN5bXMsIGkpLCBJU19FTkFCTEVEKENPTkZJR19SSVND
VikpKQo+ICsgICAgICAgICAgICAgICAgICAgaXNfbWFwcGluZ19zeW1ib2woa2FsbHN5bXNfc3lt
Ym9sX25hbWUoa2FsbHN5bXMsIGkpKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPgo+ICAgICAgICAgICAgICAgICBpZiAodGhpc3ZhbCA8PSBhZGRyICYmIHRoaXN2YWwgPiBi
ZXN0dmFsKSB7Cj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYyBiL3NjcmlwdHMv
bW9kL21vZHBvc3QuYwo+IGluZGV4IDdjNzE0MjlkNjUwMi4uYjI5YjI5NzA3ZjEwIDEwMDY0NAo+
IC0tLSBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYwo+ICsrKyBiL3NjcmlwdHMvbW9kL21vZHBvc3Qu
Ywo+IEBAIC0xMDUyLDcgKzEwNTIsNyBAQCBzdGF0aWMgaW5saW5lIGludCBpc192YWxpZF9uYW1l
KHN0cnVjdCBlbGZfaW5mbyAqZWxmLCBFbGZfU3ltICpzeW0pCj4KPiAgICAgICAgIGlmICghbmFt
ZSB8fCAhc3RybGVuKG5hbWUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAtICAgICAg
IHJldHVybiAhaXNfbWFwcGluZ19zeW1ib2wobmFtZSwgZWxmLT5oZHItPmVfbWFjaGluZSA9PSBF
TV9SSVNDVik7Cj4gKyAgICAgICByZXR1cm4gIWlzX21hcHBpbmdfc3ltYm9sKG5hbWUpOwo+ICB9
Cj4KPiAgLyogTG9vayB1cCB0aGUgbmVhcmVzdCBzeW1ib2wgYmFzZWQgb24gdGhlIHNlY3Rpb24g
YW5kIHRoZSBhZGRyZXNzICovCj4gLS0KPiAyLjQxLjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFz
YWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
