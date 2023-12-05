Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53BDC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luTND+g73ZF22GQ/H9T/WJQvlNl9y42UspOXNNG3TIY=; b=twJOMjbOG9Rkzw
	2RHmi7cq7WoxijJEGCC1FV6HzuN6if2lCSm0XXjeLRKNHWp16pwab/0IqRYlNVCuPjhEs/bqYqOJl
	FN9nqiLtWzco8sudua+R4N3cn33/WBekw/otNFTlmsOzl1PA2JaILUhjC8a7MMgVW9qG3IqhoZXZS
	U2murr0rNwxaM5pBa/KmHZOvTWVZ9zAhuCiNaQVNHdJGNrgXsGmRKjs2wkQljISMCp3LojDpKnoBM
	8vsCSxeZJm4Hw0WSJpzRUGyKEDl2tALNnaw49QwaoOsrNG0pAPuBSpdH8g5NzfbWMjmXZYpaqnhgd
	NtQ/Wd8WRjWdlSZa9IHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALTD-0065HI-0m;
	Tue, 05 Dec 2023 02:47:35 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALT9-0065GS-35
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:47:33 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bf898c43cso1586020e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1701744448; x=1702349248; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+fQj890g89F04ltzGRUSukO6YmVhVfI+AmMmgyvRn4=;
        b=KFv6Xg+FqArZf1e24XAjNRtI28tkkr+1XgLdrv3lup08LlyXW70GGStqEnpC39P/Pa
         8qY2UX41/fXozO5HrZjUWeZbngyDjkIXVH+ZSxRps67bH9OjCdwcijsVI2WSK/vQhOto
         reypiFdCcrqvkPUuE8afW8OwSEk1w513cEQsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744448; x=1702349248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+fQj890g89F04ltzGRUSukO6YmVhVfI+AmMmgyvRn4=;
        b=eAQThN3PfgH9l/scpT8ESIK5XP8bRl8VrtDHs2EBg4zyPYz+HcsD+ohK/HwlTw8pIQ
         qIfCQuQyPjq6IpVkR3XFvgoBhduvhXnZ4iBf9HdiWMeKzroM4I3UtJGmirhNxOO+Xbxn
         JTg9kCkUPoYUxzPZAkV7V7e7ty1jB3Oq2t731+D+XGbk/3skSYhBlNSoLd/RpbDQgxpY
         WyHheKLxjNlSexPBnqD+ShERgr4UEbjDHwNVYL/mOJw/CXLOLmL9MKJT4zTxs4efja9E
         eQnUrMGR5QmgCHQyTITWq0etuIs+J2YFh86WkPaHhsi+N9nOqi+Jsj7Um6bWUOtrJ+qi
         m5hA==
X-Gm-Message-State: AOJu0YxXuwKPVGwjdNr3fiIhbIlgu/vaY0snOzRkqrrM7jn0W3guj0L6
	16YE/BGv4Ui1K17bfvxjMSmzHPTZCANFfxSLTLrZ0/TById2Dns=
X-Google-Smtp-Source: AGHT+IHSQqYCiJ8irH0uGR2YwRnWeQPNe4xeKVmRq48ySuyZn1NZrbBuhoJhidM1Fa+jxsixLGEbfQLNeQ1rsB4FMlI=
X-Received: by 2002:a05:6512:15a7:b0:50c:a39:ee22 with SMTP id
 bp39-20020a05651215a700b0050c0a39ee22mr44341lfb.33.1701744448469; Mon, 04 Dec
 2023 18:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20231127095403.272424-1-vadim.shakirov@syntacore.com> <CAOnJCUKjruQRbZXCHx+fNS34dvfNXDozWEm=Yr_KnLKOYc3OgQ@mail.gmail.com>
In-Reply-To: <CAOnJCUKjruQRbZXCHx+fNS34dvfNXDozWEm=Yr_KnLKOYc3OgQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 4 Dec 2023 18:47:16 -0800
Message-ID: <CAOnJCU+CRh1BAaKgvbihS5EjVnnWny-TngkgToxY1QiyaVcq4Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: perf: ctr_get_width function for legacy is not defined
To: Vadim Shakirov <vadim.shakirov@syntacore.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184732_316317_A5462910 
X-CRM114-Status: GOOD (  26.08  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgMTE6NTfigK9QTSBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0
aXNocGF0cmEub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTm92IDI3LCAyMDIzIGF0IDE6NTTigK9B
TSBWYWRpbSBTaGFraXJvdgo+IDx2YWRpbS5zaGFraXJvdkBzeW50YWNvcmUuY29tPiB3cm90ZToK
PiA+Cj4gPiBXaXRoIHBhcmFtZXRlcnMgQ09ORklHX1JJU0NWX1BNVV9MRUdBQ1k9eSBhbmQgQ09O
RklHX1JJU0NWX1BNVV9TQkk9bgo+ID4gbGludXgga2VybmVsIGNyYXNoZXMgd2hlbiB5b3UgdHJ5
IHBlcmYgcmVjb3JkOgo+ID4KPiA+ICQgcGVyZiByZWNvcmQgbHMKPiA+IFsgICA0Ni43NDkyODZd
IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0
dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgIDQ2Ljc1MDE5OV0gT29wcyBbIzFd
Cj4gPiBbICAgNDYuNzUwMzQyXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+IFsgICA0Ni43NTA2MDhd
IENQVTogMCBQSUQ6IDEwNyBDb21tOiBwZXJmLWV4ZWMgTm90IHRhaW50ZWQgNi42LjAgIzIKPiA+
IFsgICA0Ni43NTA5MDZdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiA+
IFsgICA0Ni43NTExODRdIGVwYyA6IDB4MAo+ID4gWyAgIDQ2Ljc1MTQzMF0gIHJhIDogYXJjaF9w
ZXJmX3VwZGF0ZV91c2VycGFnZSsweDU0LzB4MTNlCj4gPiBbICAgNDYuNzUxNjgwXSBlcGMgOiAw
MDAwMDAwMDAwMDAwMDAwIHJhIDogZmZmZmZmZmY4MDcyZWU1MiBzcCA6IGZmMjAwMDAwMDAyMmI4
ZjAKPiA+IFsgICA0Ni43NTE5NThdICBncCA6IGZmZmZmZmZmODE1MDU5ODggdHAgOiBmZjYwMDAw
MDAyOTBkNDAwIHQwIDogZmYyMDAwMDAwMDIyYjljMAo+ID4gWyAgIDQ2Ljc1MjIyOV0gIHQxIDog
MDAwMDAwMDAwMDAwMDAwMSB0MiA6IDAwMDAwMDAwMDAwMDAwMDMgczAgOiBmZjIwMDAwMDAwMjJi
OTMwCj4gPiBbICAgNDYuNzUyNDUxXSAgczEgOiBmZjYwMDAwMDAyOGZiMDAwIGEwIDogMDAwMDAw
MDAwMDAwMDAwMCBhMSA6IGZmNjAwMDAwMDI4ZmIwMDAKPiA+IFsgICA0Ni43NTI2NzNdICBhMiA6
IDAwMDAwMDBhZTI3NTEyNjggYTMgOiAwMDAwMDAwMDAwNGZiNzA4IGE0IDogMDAwMDAwMDAwMDAw
MDAwNAo+ID4gWyAgIDQ2Ljc1Mjg5NV0gIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAw
MDAwMDAxN2ZmZTMgYTcgOiAwMDAwMDAwMDAwMDAwMGQyCj4gPiBbICAgNDYuNzUzMTE3XSAgczIg
OiBmZjYwMDAwMDAyOGZiMDAwIHMzIDogMDAwMDAwMGFlMjc1MTI2OCBzNCA6IDAwMDAwMDAwMDAw
MDAwMDAKPiA+IFsgICA0Ni43NTMzMzhdICBzNSA6IGZmZmZmZmZmODE1M2UyOTAgczYgOiBmZjYw
MDAwMDg2M2I5MDAwIHM3IDogZmY2MDAwMDAwMjk2MTA3OAo+ID4gWyAgIDQ2Ljc1MzU2Ml0gIHM4
IDogZmY2MDAwMDAwMjk2MTA0OCBzOSA6IGZmNjAwMDAwMDI5NjEwNTggczEwOiAwMDAwMDAwMDAw
MDAwMDAxCj4gPiBbICAgNDYuNzUzNzgzXSAgczExOiAwMDAwMDAwMDAwMDAwMDE4IHQzIDogZmZm
ZmZmZmZmZmZmZmZmZiB0NCA6IGZmZmZmZmZmZmZmZmZmZmYKPiA+IFsgICA0Ni43NTQwMDVdICB0
NSA6IGZmNjAwMDAwMDI5MjI3MGMgdDYgOiBmZjIwMDAwMDAwMjJiYjMwCj4gPiBbICAgNDYuNzU0
MTc5XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBj
YXVzZTogMDAwMDAwMDAwMDAwMDAwYwo+ID4gWyAgIDQ2Ljc1NDY1M10gQ29kZTogVW5hYmxlIHRv
IGFjY2VzcyBpbnN0cnVjdGlvbiBhdCAweGZmZmZmZmZmZmZmZmZmZWMuCj4gPiBbICAgNDYuNzU0
OTM5XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiA+IFsgICA0Ni43NTUx
MzFdIG5vdGU6IHBlcmYtZXhlY1sxMDddIGV4aXRlZCB3aXRoIGlycXMgZGlzYWJsZWQKPiA+IFsg
ICA0Ni43NTU1NDZdIG5vdGU6IHBlcmYtZXhlY1sxMDddIGV4aXRlZCB3aXRoIHByZWVtcHRfY291
bnQgNAo+ID4KPiA+IFRoaXMgaGFwcGVucyBiZWNhdXNlIGluIHRoZSBsZWdhY3kgY2FzZSB0aGUg
Y3RyX2dldF93aWR0aCBmdW5jdGlvbiB3YXMgbm90Cj4gPiBkZWZpbmVkLCBidXQgaXQgaXMgdXNl
ZCBpbiBhcmNoX3BlcmZfdXBkYXRlX3VzZXJwYWdlLgo+ID4KPiA+IEZpeGVzOiBjYzRjMDdjODlh
YWQgKCJkcml2ZXJzOiBwZXJmOiBJbXBsZW1lbnQgcGVyZiBldmVudCBtbWFwIHN1cHBvcnQgaW4g
dGhlIFNCSSBiYWNrZW5kIikKPiA+IFNpZ25lZC1vZmYtYnk6IFZhZGltIFNoYWtpcm92IDx2YWRp
bS5zaGFraXJvdkBzeW50YWNvcmUuY29tPgo+Cj4gTGVnYWN5IFBNVSBzaG91bGRuJ3QgZW5hYmxl
IHBlcmYgc2FtcGxpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLiBXZSBuZWVkCj4gdG8gc2V0IHRoZSBj
YXBhYmlsaXRpZXMgYWNjb3JkaW5nbHkuCj4KPiBAQCAtMTExLDE0ICsxMTYsMTcgQEAgc3RhdGlj
IHZvaWQgcG11X2xlZ2FjeV9pbml0KHN0cnVjdCByaXNjdl9wbXUgKnBtdSkKPiAgICAgICAgIHBt
dS0+Y3RyX3N0b3AgPSBOVUxMOwo+ICAgICAgICAgcG11LT5ldmVudF9tYXAgPSBwbXVfbGVnYWN5
X2V2ZW50X21hcDsKPiAgICAgICAgIHBtdS0+Y3RyX2dldF9pZHggPSBwbXVfbGVnYWN5X2N0cl9n
ZXRfaWR4Owo+ICAgICAgICAgcG11LT5jdHJfZ2V0X3dpZHRoID0gTlVMTDsKPiAgICAgICAgIHBt
dS0+Y3RyX2NsZWFyX2lkeCA9IE5VTEw7Cj4gICAgICAgICBwbXUtPmN0cl9yZWFkID0gcG11X2xl
Z2FjeV9yZWFkX2N0cjsKPiAgICAgICAgIHBtdS0+ZXZlbnRfbWFwcGVkID0gcG11X2xlZ2FjeV9l
dmVudF9tYXBwZWQ7Cj4gICAgICAgICBwbXUtPmV2ZW50X3VubWFwcGVkID0gcG11X2xlZ2FjeV9l
dmVudF91bm1hcHBlZDsKPiAgICAgICAgIHBtdS0+Y3NyX2luZGV4ID0gcG11X2xlZ2FjeV9jc3Jf
aW5kZXg7Cj4gICsgICAgIHBtdS0+cG11LmNhcGFiaWxpdGllcyB8PSBQRVJGX1BNVV9DQVBfTk9f
SU5URVJSVVBUOwo+ICsgICAgICBwbXUtPnBtdS5jYXBhYmlsaXRpZXMgfD0gUEVSRl9QTVVfQ0FQ
X05PX0VYQ0xVREU7Cj4gICAgICAgICBwZXJmX3BtdV9yZWdpc3RlcigmcG11LT5wbXUsICJjcHUi
LCBQRVJGX1RZUEVfUkFXKTsKPiAgfQo+Cj4KPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9sZWdhY3kuYyB8IDggKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVy
Zi9yaXNjdl9wbXVfbGVnYWN5LmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4g
PiBpbmRleCA3OWZkZDY2NzkyMmUuLmExNzllZDZhYzk4MCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMKPiA+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfbGVnYWN5LmMKPiA+IEBAIC0zNyw2ICszNywxMiBAQCBzdGF0aWMgaW50IHBtdV9sZWdhY3lf
ZXZlbnRfbWFwKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwgdTY0ICpjb25maWcpCj4gPiAgICAg
ICAgIHJldHVybiBwbXVfbGVnYWN5X2N0cl9nZXRfaWR4KGV2ZW50KTsKPiA+ICB9Cj4gPgo+ID4g
Ky8qIGN5Y2xlICYgaW5zdHJldCBhcmUgYWx3YXlzIDY0IGJpdCwgb25lIGJpdCBsZXNzIGFjY29y
ZGluZyB0byBTQkkgc3BlYyAqLwo+ID4gK3N0YXRpYyBpbnQgcG11X2xlZ2FjeV9jdHJfZ2V0X3dp
ZHRoKGludCBpZHgpCj4gPiArewo+ID4gKyAgICAgICByZXR1cm4gNjM7Cj4gPiArfQo+ID4gKwo+
Cj4gSGF2aW5nIHNhaWQgdGhhdCwgdGhlcmUgaXMgbm8gaGFybSBpbiBkZWZpbmluZyB0aGUgd2lk
dGggZnVuY3Rpb24gZm9yCj4gbGVnYWN5IFBNVS4KPiBUaGUgY29tbW9uIHJpc2N2X3BtdS5jIGZp
eGVzIHRoZSBjb3VudGVyIHdpZHRoIHRvIDYzIGlmIGN0cl9nZXRfd2lkdGgKPiBpcyBub3QgZGVm
aW5lZC4gV2UgbWF5IGJlIHRvIGdldCByaWQgb2YgdGhhdAo+IGFzIGJvdGggZHJpdmVycyB3aWxs
IGhhdmUgYSB2YWxpZCBmdW5jdGlvbiBwb2ludGVyLgo+CgpJdCB3b3VsZCBiZSBncmVhdCB0byBt
ZXJnZSB0aGVzZSBjaGFuZ2VzIGluIHRoZSBuZXh0IG1lcmdlIHdpbmRvdy4KTGV0IG1lIGtub3cg
aWYgeW91IGFyZSBidXN5IGFuZCB3YW50IG1lIHRvIHJlc3BpbiB0aGUgcGF0Y2hlcyBrZWVwaW5n
CnlvdXIgYXV0aG9yc2hpcC4KCj4gPiAgc3RhdGljIHU2NCBwbXVfbGVnYWN5X3JlYWRfY3RyKHN0
cnVjdCBwZXJmX2V2ZW50ICpldmVudCkKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCBod19wZXJm
X2V2ZW50ICpod2MgPSAmZXZlbnQtPmh3Owo+ID4gQEAgLTExMSw3ICsxMTcsNyBAQCBzdGF0aWMg
dm9pZCBwbXVfbGVnYWN5X2luaXQoc3RydWN0IHJpc2N2X3BtdSAqcG11KQo+ID4gICAgICAgICBw
bXUtPmN0cl9zdG9wID0gTlVMTDsKPiA+ICAgICAgICAgcG11LT5ldmVudF9tYXAgPSBwbXVfbGVn
YWN5X2V2ZW50X21hcDsKPiA+ICAgICAgICAgcG11LT5jdHJfZ2V0X2lkeCA9IHBtdV9sZWdhY3lf
Y3RyX2dldF9pZHg7Cj4gPiAtICAgICAgIHBtdS0+Y3RyX2dldF93aWR0aCA9IE5VTEw7Cj4gPiAr
ICAgICAgIHBtdS0+Y3RyX2dldF93aWR0aCA9IHBtdV9sZWdhY3lfY3RyX2dldF93aWR0aDsKPiA+
ICAgICAgICAgcG11LT5jdHJfY2xlYXJfaWR4ID0gTlVMTDsKPiA+ICAgICAgICAgcG11LT5jdHJf
cmVhZCA9IHBtdV9sZWdhY3lfcmVhZF9jdHI7Cj4gPiAgICAgICAgIHBtdS0+ZXZlbnRfbWFwcGVk
ID0gcG11X2xlZ2FjeV9ldmVudF9tYXBwZWQ7Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+Cj4KPiAt
LQo+IFJlZ2FyZHMsCj4gQXRpc2gKCgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
