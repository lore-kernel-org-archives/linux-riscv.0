Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0BBC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuJUuxKh69wwKMnIpcd+YpYLFAsWPpjXIP//7EuQzwE=; b=DbgvT2B9kCkwPQ
	1S1fYcEzgjsv9rAWkXRze9O+Fws7tO68EoV8zOhHZmEjr9DtL9iAEUQOW99WLbfPVzL0YdMXmoB9A
	lgu2wsv6dmC8Lreaner8WkPIqHpEmzk56X6fByhE8qoZFyPto4ih1mKX/3rwRHp5D63TRnEnOZEt1
	4Va+qDL2Myu38JZCfBiKiD2ObqOqioVR09c9MldTOa22TazuO9dDNHv5WHGFZgeBwvXLHaymc/8XY
	8CaW6eaZpu4yqQ2tEMGlEOY4Djz4qhIrKUxgkeIYHRIYBqF9lV+UIfcd3CSTSqWOgEfpsV5m5K1t2
	FufOXNEs6JOVnCLpnEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phXAb-000ghw-3D;
	Wed, 29 Mar 2023 14:53:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phXAZ-000ghI-2B
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 14:53:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id q19so12960507wrc.5
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680101575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2kmo0aenMDSgvw0VfC+Yjgx7r7yEQ3UFvZP5QHKIFU=;
        b=2AX6WT151XrxxKQ9+KZHBNPV0OKNUZqklMPvJ36VJq9J3TuOH8OV8pTmqS9WA/lBIZ
         fFjAMYfcPxG8VZ/ozr3H6SR/ckhvHEIGfk4SrzK1MAD3PEVvf5idTnEHFAY6o8TnBvL4
         F39elSu+TIpfZ4LyV6FX3/zyPkTvaG/66tZxHkwqMmwInLZEbEdQrMbbrpLuNQ6YC/3z
         fl4ForUJSR2MqgC7/PbT2lQoIr+MWtZS3mkaRITA+tVFU+uOStpSTnw1HsF9GzvnNVIA
         NJXB4pb+gH0+ApT++xs6D3QtTr4nV0GuyXY9BkXUWz4wTr52ilLrBe86Jho2QAG3/vft
         QsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2kmo0aenMDSgvw0VfC+Yjgx7r7yEQ3UFvZP5QHKIFU=;
        b=H5c11YK+ZVf8+xogMKEjgpcPj7aE6NttzpA2Hc8io8j6cZyL+FJ8WqL3IEHPdfB2Pn
         6J7+0wEtvNZChDD0rEe9jOTSsuBQYOESW8C0nvPhhILxPr+QO3O9zwd8EIXa+bZ2IBFK
         c8GXr1g2oLjN0wxO79q0X174XFv6vw/ppRF5FYc/9BGygY7a49331p6s9cTHlm+homVY
         qS4G3pSfoVZ/8VaMaDMYYiHB0VYjKY4TgLzvDW8I4dcMnyw5hk/cygliCqvbWJnZ9v8Z
         dAqnqhKXB9OOBEFGIDBM9tA5Owjr8ho3nYFTYIveZ/WP4ckRMoJpuMG3LHWDolSENkRn
         cZLA==
X-Gm-Message-State: AAQBX9ejPNrWSx5n7BhSiJnWxzk4yYdR93LOeU1xu/GWzZ/z2jtcMMuO
	a24UJ92/i4KCGUgJpMY9PH7qR0SNcLljAufhIzY+NA==
X-Google-Smtp-Source: AKy350YibrgJqYb/G35x+FrqrJN2n0PzT7ee4etzLgFgZl3mXcWrfWIyeg9q9WE/eraWA5q1adz/eOCiZYh4p396ZL8=
X-Received: by 2002:a5d:6606:0:b0:2de:9905:a46e with SMTP id
 n6-20020a5d6606000000b002de9905a46emr3109552wru.13.1680101575731; Wed, 29 Mar
 2023 07:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
 <20230329081932.79831-3-alexghiti@rivosinc.com> <179c38d6-4298-4a16-b0d7-8aee49a91f58@spud>
In-Reply-To: <179c38d6-4298-4a16-b0d7-8aee49a91f58@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 Mar 2023 16:52:45 +0200
Message-ID: <CAHVXubh9t7VuM337Br-4y7zJp1msr6+bAtr1eVLc+P50V9Bikg@mail.gmail.com>
Subject: Re: [PATCH -fixes v2 2/3] riscv: Do not set initial_boot_params to
 the linear address of the dtb
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_075259_709943_09677A5A 
X-CRM114-Status: GOOD (  19.97  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgNDozN+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1hciAyOSwgMjAyMyBhdCAxMDoxOTozMUFNICsw
MjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBlYXJseV9pbml0X2R0X3ZlcmlmeSgpIGlz
IGFscmVhZHkgY2FsbGVkIGluIHBhcnNlX2R0YigpIGFuZCBzaW5jZSB0aGUgZHRiCj4gPiBhZGRy
ZXNzIGRvZXMgbm90IGNoYW5nZSBhbnltb3JlIChpdCBpcyBub3cgaW4gdGhlIGZpeG1hcCByZWdp
b24pLCBubyBuZWVkCj4gPiB0byByZXNldCBpbml0aWFsX2Jvb3RfcGFyYW1zIGJ5IGNhbGxpbmcg
ZWFybHlfaW5pdF9kdF92ZXJpZnkoKSBhZ2Fpbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jIHwgNSArLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiA+IGluZGV4IDU0MmVl
ZDg1YWQyYy4uYTA1OWI3M2Y0ZGRiIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2V0dXAuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+ID4gQEAgLTI3OCwx
MCArMjc4LDcgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQo+ID4g
ICNpZiBJU19FTkFCTEVEKENPTkZJR19CVUlMVElOX0RUQikKPiA+ICAgICAgIHVuZmxhdHRlbl9h
bmRfY29weV9kZXZpY2VfdHJlZSgpOwo+ID4gICNlbHNlCj4gPiAtICAgICBpZiAoZWFybHlfaW5p
dF9kdF92ZXJpZnkoX192YShYSVBfRklYVVAoZHRiX2Vhcmx5X3BhKSkpKQo+ID4gLSAgICAgICAg
ICAgICB1bmZsYXR0ZW5fZGV2aWNlX3RyZWUoKTsKPgo+IFNpbGx5IHF1ZXN0aW9uIG1heWJlLCBi
dXQgc2luY2UgaXQgaXNuJ3QgZXhwbGljaXRseSBtZW50aW9uZWQsIHRoZQo+IFhJUF9GSVhVUCBi
aXRzIG5vIGxvbmdlciBtYXR0ZXI/CgpUaGUgWElQX0ZJWFVQIGlzIG9ubHkgbmVlZGVkIHdoZW4g
dHJhbnNsYXRpbmcgdmlydHVhbCB0byBwaHlzaWNhbAphZGRyZXNzZXMsIGJ1dCB0aGF0IGRvZXMg
bm90IG1lYW4gSSBkaWQgbm90IGJyZWFrIGl0LCBJIGhhdmVuJ3QKY29uc2lkZXJlZCBYSVAgYXQg
YWxsLi4uCgo+IEFsc28sIGluIHJlbGF0ZWQgbmV3cywgSSBhc3N1bWUgeW91IGRvbid0IGhhdmUg
YSBRRU1VIHNldHVwIHRoYXQgY2FuIGRvCj4gYm9vdCBhbiBYSVAga2VybmVsPwoKSSBoYXZlbid0
IGJvb3RlZCBhIFhJUCBrZXJuZWwgZm9yIGEgbG9uZyB0aW1lIG5vdywgaGVyZSBhcmUgbXkgbm90
ZXMKZnJvbSB0aGF0IHRpbWU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9BbGV4R2hpdGkvYWxleGdoaXRp
LmdpdGh1Yi5pby9ibG9iL21haW4veGlwL1hJUC5tZAoKPgo+IENoZWVycywKPiBDb25vci4KPgo+
ID4gLSAgICAgZWxzZQo+ID4gLSAgICAgICAgICAgICBwcl9lcnIoIk5vIERUQiBmb3VuZCBpbiBr
ZXJuZWwgbWFwcGluZ3NcbiIpOwo+ID4gKyAgICAgdW5mbGF0dGVuX2RldmljZV90cmVlKCk7Cj4g
PiAgI2VuZGlmCj4gPiAgICAgICBtaXNjX21lbV9pbml0KCk7Cj4gPgo+ID4gLS0KPiA+IDIuMzcu
Mgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
