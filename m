Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACECE7718D
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 05:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3JoE+Nq9V6da+a2P8zkOV7l96ZbkXRl3D8t9i01w6g=; b=p5tIRCTHZ4Nj2q
	15qr7LRZUbAVN8+vvPtCIPiY49mmj+Yp6h4ftZRHrceygGllolTwR5IOd1lA1j3kBh20Q+mGYew92
	ch2Wl5dGZFPSPEa7zpcqvaf+rOsxJhVhVz4RQVBzoA6q5ZOl1cTI4pgEyiPCf5/b0IMzH2H3+03PE
	JeiFzqZpKapFk93nUc3STxG5wUVgoogIWoX27XwzIj52ecU3ma4bXKW1pAoHz48QTRNtZfGE/4ow7
	l9++2H1jIZ80RIC3zuUg1mNS4MsOCUfjw5cosOBVzDzak9f4i7y9vWAz5GZ5ilhMHLM7X88k+67Ke
	N23W9GFPxsPSYVVTF3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPxed-0000000BJCm-1lmu;
	Tue, 24 Dec 2024 05:40:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPxeW-0000000BJC3-0U2e
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 05:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49BE4A413F5
	for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 05:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1A7C4CEE1
	for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 05:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735018818;
	bh=Xky/7dsEn/as+V5o652yyeYyIbapD8+ByUkEaV+RrmI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jeVavDGuhDLArz9pRZg7b3cFHa2j8Yj2LaDJwV9o29wN8koDRwskOe0wLMXf7vCXY
	 ER20nCnuyljNkHqaiYjUrnTSrN7YdiGJy3StXqatNQDP7ODph5Epj1PbH0jy8kpExT
	 B0Jbe/EUSWKkCQFdi+s6veLchoN6eDaJ745xsEH7IGeyBrphUEVNWP4rKFwpVcm8Xo
	 kzNMt/8/IWHFg0+cISdQDJlYSZIu/ZqfV0fSz/Ofl3jhV0H6gjRPGDIHdc4eRz66Mu
	 bWJAq7MWubZkU4TFhdcDU2ciEsDN6IsoYpEh0v48gEcml9rnUElng7NnAIDVQCcli0
	 F0YrHmVTACY/g==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so8016117a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 21:40:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdrAh2Ci1ETtAsZbXe/EkI1NVL0B9Iowpx/qaQUdLtiYrO9l6LjzAouSEn+4Y+nfW/uFLC8Kws+FbdSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKFg6RB6MZlumw5bLPm/jiAOnl6PmGEIeOId6k2an1pqNNPc8g
	6dtW1q2YZqzH154QDflkzSQRcMtSLE562yzgyisrR2dVMS/g+k8LVKBPb6w8+zLpK92+kPVayTY
	JUF/Jje5QSGs69bzsD9UDnZT+UIg=
X-Google-Smtp-Source: AGHT+IHeFhvLuHi1Zg9Qc0Qgp6y4Qd+JAsM16isYkgwdmIX6RQs4MYU44UndmIn386rsAJb0PtttPBu27KTYghwenKM=
X-Received: by 2002:a05:6402:3495:b0:5d0:f830:ef5b with SMTP id
 4fb4d7f45d1cf-5d81de17f35mr11669073a12.29.1735018817104; Mon, 23 Dec 2024
 21:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20241222033917.1754495-1-guoren@kernel.org> <CAAhSdy1EXTmuCvMp4HK0Ozg42Zw2XzCjaS7kGi-aXQ__r=taPw@mail.gmail.com>
 <20241223-165e7b7ee58e2dede8bfd830@orel>
In-Reply-To: <20241223-165e7b7ee58e2dede8bfd830@orel>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Dec 2024 13:40:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSwR1OZQFJdPpq3gns=0M1vjHtL2Lpuy25dgmPsduREoA@mail.gmail.com>
Message-ID: <CAJF2gTSwR1OZQFJdPpq3gns=0M1vjHtL2Lpuy25dgmPsduREoA@mail.gmail.com>
Subject: Re: [PATCH 0/3] riscv: Add PARAVIRT_SPINLOCKS support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com, 
	peterz@infradead.org, parri.andrea@gmail.com, will@kernel.org, 
	longman@redhat.com, boqun.feng@gmail.com, arnd@arndb.de, 
	alexghiti@rivosinc.com, rkrcmar@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_214020_285108_3B914650 
X-CRM114-Status: GOOD (  19.37  )
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

T24gVHVlLCBEZWMgMjQsIDIwMjQgYXQgMTowN+KAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBEZWMgMjMsIDIwMjQgYXQgMDE6NDQ6
NTBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFN1biwgRGVjIDIyLCAyMDI0IGF0
IDk6MDnigK9BTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+Cj4gPiA+IFBhcmF2aXJ0dWFs
aXplZCBzcGlubG9ja3MgYWxsb3cgYSB1bmZhaXIgcXNwaW5sb2NrIHRvIHJlcGxhY2UgdGhlCj4g
PiA+IHRpY2tldC1sb2NrIG9yIG5hdGl2ZSBmYWlyIHFzcGlubG9jayBpbXBsZW1lbnRhdGlvbiB3
aXRoIHNvbWV0aGluZwo+ID4gPiB2aXJ0dWFsaXphdGlvbi1mcmllbmRseSwgZm9yIGV4YW1wbGUs
IGhhbHQgdGhlIHZpcnR1YWwgQ1BVIHJhdGhlcgo+ID4gPiB0aGFuIHNwaW5uaW5nLgo+ID4gPgo+
ID4gPiBZb3UgY291bGQgb2JzZXJ2ZSB0aGUgcGFyYXZpcnQgcXNwaW5sb2NrIGludGVybmFsIHdv
cmsgc2l0dWF0aW9uIHdpdGgKPiA+ID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy90cmFjZToK
PiA+ID4KPiA+ID4gbHMgL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMvcGFyYXZpcnQv
Cj4gPiA+ICBlbmFibGUgICBmaWx0ZXIgICBwdl9raWNrICBwdl93YWl0Cj4gPiA+Cj4gPiA+IGVj
aG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL3BhcmF2aXJ0L2VuYWJsZQo+
ID4gPiBjYXQgL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy90cmFjZQo+ID4gPiAgZW50cmllcy1p
bi1idWZmZXIvZW50cmllcy13cml0dGVuOiAzMzkyNy8zMzkyNyAgICNQOjEyCj4gPiA+Cj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXy0tLS0tPT4gaXJxcy1vZmYvQkgtZGlz
YWJsZWQKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8gXy0tLS09PiBuZWVk
LXJlc2NoZWQKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAvIF8tLS09PiBo
YXJkaXJxL3NvZnRpcnEKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfHwgLyBf
LS09PiBwcmVlbXB0LWRlcHRoCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx8
fCAvIF8tPT4gbWlncmF0ZS1kaXNhYmxlCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHx8fHwgLyAgICAgZGVsYXkKPiA+ID4gICAgICAgICAgICBUQVNLLVBJRCAgICAgQ1BVIyAg
fHx8fHwgIFRJTUVTVEFNUCAgRlVOQ1RJT04KPiA+ID4gICAgICAgICAgICAgICB8IHwgICAgICAg
ICB8ICAgfHx8fHwgICAgIHwgICAgICAgICB8Cj4gPiA+ICAgICAgICAgICAgICBzaC0xMDAgICAg
IFswMDFdIGQuLjIuICAgIDI4LjMxMjI5NDogcHZfd2FpdDogY3B1IDEgb3V0IG9mIHdmaQo+ID4g
PiAgICAgICAgICA8aWRsZT4tMCAgICAgICBbMDAwXSBkLmg0LiAgICAyOC4zMjIwMzA6IHB2X2tp
Y2s6IGNwdSAwIGtpY2sgdGFyZ2V0IGNwdSAxCj4gPiA+ICAgICAgICAgICAgICBzaC0xMDAgICAg
IFswMDFdIGQuLjIuICAgIDMwLjk4MjYzMTogcHZfd2FpdDogY3B1IDEgb3V0IG9mIHdmaQo+ID4g
PiAgICAgICAgICA8aWRsZT4tMCAgICAgICBbMDAwXSBkLmg0LiAgICAzMC45OTMyODk6IHB2X2tp
Y2s6IGNwdSAwIGtpY2sgdGFyZ2V0IGNwdSAxCj4gPiA+ICAgICAgICAgICAgICBzaC0xMDAgICAg
IFswMDJdIGQuLjIuICAgIDQ0Ljk4NzU3MzogcHZfd2FpdDogY3B1IDIgb3V0IG9mIHdmaQo+ID4g
PiAgICAgICAgICA8aWRsZT4tMCAgICAgICBbMDAwXSBkLmg0LiAgICA0NC45ODkwMDA6IHB2X2tp
Y2s6IGNwdSAwIGtpY2sgdGFyZ2V0IGNwdSAyCj4gPiA+ICAgICAgICAgIDxpZGxlPi0wICAgICAg
IFswMDNdIGQuczMuICAgIDUxLjU5Mzk3ODogcHZfa2ljazogY3B1IDMga2ljayB0YXJnZXQgY3B1
IDQKPiA+ID4gICAgICAgcmN1X3NjaGVkLTE1ICAgICAgWzAwNF0gZC4uMi4gICAgNTEuNTk1MTky
OiBwdl93YWl0OiBjcHUgNCBvdXQgb2Ygd2ZpCj4gPiA+IGxvY2tfdG9ydHVyZV93ci0xMTUgICAg
IFswMDRdIC4uLjIuICAgIDUyLjY1NjQ4MjogcHZfa2ljazogY3B1IDQga2ljayB0YXJnZXQgY3B1
IDIKPiA+ID4gbG9ja190b3J0dXJlX3dyLTExMyAgICAgWzAwMl0gZC4uMi4gICAgNTIuNjU5MTQ2
OiBwdl93YWl0OiBjcHUgMiBvdXQgb2Ygd2ZpCj4gPiA+IGxvY2tfdG9ydHVyZV93ci0xMTQgICAg
IFswMDhdIGQuLjIuICAgIDUyLjY1OTUwNzogcHZfd2FpdDogY3B1IDggb3V0IG9mIHdmaQo+ID4g
PiBsb2NrX3RvcnR1cmVfd3ItMTE0ICAgICBbMDA4XSBkLi4yLiAgICA1Mi42NjM1MDM6IHB2X3dh
aXQ6IGNwdSA4IG91dCBvZiB3ZmkKPiA+ID4gbG9ja190b3J0dXJlX3dyLTExMyAgICAgWzAwMl0g
Li4uMi4gICAgNTIuNjY2MTI4OiBwdl9raWNrOiBjcHUgMiBraWNrIHRhcmdldCBjcHUgOAo+ID4g
PiBsb2NrX3RvcnR1cmVfd3ItMTE0ICAgICBbMDA4XSBkLi4yLiAgICA1Mi42NjcyNjE6IHB2X3dh
aXQ6IGNwdSA4IG91dCBvZiB3ZmkKPiA+ID4gbG9ja190b3J0dXJlX3dyLTExNCAgICAgWzAwOV0g
Lm4uMi4gICAgNTMuMTQxNTE1OiBwdl9raWNrOiBjcHUgOSBraWNrIHRhcmdldCBjcHUgMTEKPiA+
ID4gbG9ja190b3J0dXJlX3dyLTExMyAgICAgWzAwMl0gZC4uMi4gICAgNTMuMTQzMzM5OiBwdl93
YWl0OiBjcHUgMiBvdXQgb2Ygd2ZpCj4gPiA+IGxvY2tfdG9ydHVyZV93ci0xMTYgICAgIFswMDdd
IGQuLjIuICAgIDUzLjE0MzQxMjogcHZfd2FpdDogY3B1IDcgb3V0IG9mIHdmaQo+ID4gPiBsb2Nr
X3RvcnR1cmVfd3ItMTE4ICAgICBbMDAwXSBkLi4yLiAgICA1My4xNDM0NTc6IHB2X3dhaXQ6IGNw
dSAwIG91dCBvZiB3ZmkKPiA+ID4gbG9ja190b3J0dXJlX3dyLTExNSAgICAgWzAwOF0gZC4uMi4g
ICAgNTMuMTQzNDgxOiBwdl93YWl0OiBjcHUgOCBvdXQgb2Ygd2ZpCj4gPiA+IGxvY2tfdG9ydHVy
ZV93ci0xMTcgICAgIFswMTFdIGQuLjIuICAgIDUzLjE0MzUyMjogcHZfd2FpdDogY3B1IDExIG91
dCBvZiB3ZmkKPiA+ID4gbG9ja190b3J0dXJlX3dyLTExNyAgICAgWzAxMV0gLi4uMi4gICAgNTMu
MTQzOTg3OiBwdl9raWNrOiBjcHUgMTEga2ljayB0YXJnZXQgY3B1IDgKPiA+ID4gbG9ja190b3J0
dXJlX3dyLTExNSAgICAgWzAwOF0gLi4uMi4gICAgNTMuMTQ0MjY5OiBwdl9raWNrOiBjcHUgOCBr
aWNrIHRhcmdldCBjcHUgNwo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyBpcyBzcGxpdCBmcm9tIFsx
XS4KPiA+ID4KPiA+ID4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDIzMTIyNTEyNTg0Ny4yNzc4NjM4LTEtZ3VvcmVuQGtlcm5lbC5vcmcvCj4gPiA+Cj4gPiA+IEd1
byBSZW4gKDMpOgo+ID4gPiAgIFJJU0MtVjogcGFyYXZpcnQ6IEFkZCBwdnFzcGlubG9jayBLVk0g
YmFja2VuZAo+ID4gPiAgIFJJU0MtVjogcGFyYXZpcnQ6IEFkZCBwdnFzcGlubG9jayBmcm9udGVu
ZAo+ID4gPiAgIFJJU0MtVjogcGFyYXZpcnQ6IHB2cXNwaW5sb2NrOiBBZGQgdHJhY2UgcG9pbnQg
Zm9yIHB2X2tpY2svd2FpdAo+ID4KPiA+IFRoaXMgc2hvdWxkIGJlIGFuIFJGQyBzZXJpZXMgdW50
aWwgdGhlIGNvcnJlc3BvbmRpbmcgU0JJIGV4dGVuc2lvbgo+ID4gaXMgZnJvemVuLiBBRkFJSywg
bm8gb25lIGhhcyBwb3N0ZWQgYW55IFNCSSBleHRlbnNpb24gaW4gdGhpcyBjb250ZXh0Cj4gPiBv
biBhbnkgb2YgdGhlIFJWSSBtYWlsaW5nIGxpc3RzLgpPaCwgSSBmb3Jnb3QgdGhlIFJGQyB0YWcu
IFRoYW5rcyBmb3IgcmVtaW5kaW5nIG1lLgoKPiA+Cj4gPiBQbGVhc2Ugd29yayB3aXRoIHRoZSBQ
UlMgVEcgYW5kIEh5cGVydmlzb3JzIFNJRyBmb3IgdGhlIHByb3Bvc2VkCj4gPiBTQkkgZXh0ZW5z
aW9uLgpZZXMsIEkgd2lsbC4KCj4gPgo+Cj4gSSBwcm9taXNlZCBHdW8gSSdkIGhlbHAgb3V0IGJ5
IHdyaXRpbmcgYSBkcmFmdCBmb3IgdGhlIFNCSSBleHRlbnNpb24uIEknbGwKPiB0cnkgdG8gZ2V0
IHNvbWV0aGluZyBwb3N0ZWQgdGhpcyB3ZWVrLgpUaGFua3MsIGRyZXcuCgotLSAKQmVzdCBSZWdh
cmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
