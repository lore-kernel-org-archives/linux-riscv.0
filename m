Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFCAE77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 07:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2yKjRlX6071YvxSPgTGtSl1/k3Bq4KJRHjnyyJVwSf0=; b=1ZoF+QZskaLslw
	bH07Fn7B83ApIAscnxKY11cSPDTDYVC9rNafEM5YkLyS4YbNrL08+cWAfiGI1dBHIUFtOcQdBUbwh
	B1FcVgYYW2AzzcF9fdFKevXC9ktqZ6N7xTLIdyoMn3aZGqybHfXI3QaWo48tCWIZUABaX8Qrhyvto
	G5Em0vQkcH++ggFLw9rkXoS1VsiZoGxNPrkYhUEuBYTUGv6hK/rqeQUHoyxqBLbvSo8Bi/eQF3y26
	xkBOeIZKq1W3x+D9U1fylSsI3WcjhmCr2ic/5zo9mWuwDp2city2/Ypa0XCvu3NhqNUcgtVLRVpDC
	AvXlk0ZU2xnfqllZgezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTyuS-0000000Efsb-157C;
	Sat, 04 Jan 2025 07:49:24 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTyuP-0000000Efs8-0gF5
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 07:49:22 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5401be44b58so13750912e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 23:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1735976958; x=1736581758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF5ALbWcX9nI0qyDtGHdwo1g3k1BBGFUfkAY5l7TWmQ=;
        b=Pfpx0oWpXrSAzUlZSxk89u5IIooGzWk3Y1THYXehv/bPQj5xpcZqkmBZv4jWeD578k
         zExy6d03YuItVPMXcjvkaPAV730/8yJH/19lbazwV4u1Mutu4CNTcI3AjY7mfSg8PbJm
         atwDHhdcTDn4qNY2wAXIjEvuFIjnwVPnL9U+DlrMvR58BjfrJADwmPP1inzStN18bE+Q
         Lthn6KQ15c9JhzS/jL5iuyzjLq/RBs/LaEgObos+kLoVUUEhmWlZFLKWXhkNh4s0mgcI
         +KwYSuvGCPfNvUuhlLJdYtun5wX1yNYJ0tIjhD8G5a7R4SBOsptGjmLU3DVY6fL8CJAy
         jgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976958; x=1736581758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jF5ALbWcX9nI0qyDtGHdwo1g3k1BBGFUfkAY5l7TWmQ=;
        b=Njsk1Vjn0F3TYlr1uVOw2wSINijTImjl8UajKoIuHLKff2EAJ6b3imngFYMPkPcJV2
         IFz5zwJOycAmTYjdCgWL97eqSomZ3jpoDI/K2xPmPltTOGv7NvWPbkXWNRG+ZuACU+24
         Il75XnL767NHTWNotGrBnwnC9RX+WFKi3kGT3zXbe+4/m1qz9zkcUX7uTvS/JBqdiBnq
         L5UceAqMcxFgo1QpyEql3RhZlX744j96VVeX9zeFL51KE+mK0UsIu6S85qEuh3O5bMnZ
         Tde119s4cIag7rI94eAMky5NM/GqRMbYAyuAqGu4P9MZkNETKwcMvsLq7vfuDuiKwdVV
         /aMg==
X-Forwarded-Encrypted: i=1; AJvYcCVgaCL23wU89euEJY8tzq8os6fJZ5Mlb4NnM+pEV4PuFqNmmRxm9H+fmkf8Me0CvlprixK7GLEkpjJmlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWJQLsThl1FuTMjHpfPg5zjlq7+X9HBqWNwpE4h4MzGm6+HXsv
	EtLr/yn/x00Ktfe6Exz0mluRAVaEmBXmb7syvi4CLow5m6ekJmHVpDGiK5mwkEI26tWqA9jO+XT
	TcbEFq71ls0/fRqJ4tx33jVK6arlmnGciB9xtqw==
X-Gm-Gg: ASbGncup9LuhpknrOl6bJhH+JyJi/HltvmCcOgu25mjyl1lI0lSisvZI2qKP/Oeo6g4
	e9MqliTMMaXrMsYBs1Og3hJRB8ssdWFLbMw6OrGw=
X-Google-Smtp-Source: AGHT+IHEVpm8UAQhbCMu0xx1i5ZPp1VG9Tj6yxw4BePJzFyyHxzT1AJzqaTf+EBvAQKSdvorXReEkBz1mpDkUkDsEwo=
X-Received: by 2002:a05:6512:3d22:b0:540:1fcd:1d8a with SMTP id
 2adb3069b0e04-5422957afa2mr14424145e87.55.1735976958313; Fri, 03 Jan 2025
 23:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20250103125926.54203-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250103125926.54203-1-luxu.kernel@bytedance.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 4 Jan 2025 13:19:07 +0530
Message-ID: <CAK9=C2W1M8bXE2mLW1VUeDTKuqoiLy=PfdGxP5jxpGm8P3EGqQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Support allocating multiple msi-x vectors
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: anup@brainfault.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	lihangjing@bytedance.com, xieyongji@bytedance.com, 
	guojinhui.liam@bytedance.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_234921_205027_48302C97 
X-CRM114-Status: GOOD (  24.61  )
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

T24gRnJpLCBKYW4gMywgMjAyNSBhdCA2OjMw4oCvUE0gWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVk
YW5jZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBjb21taXQgbW9kaWZpZXMgYWxsb2MgYW5kIGZyZWUg
Y2FsbGJhY2sgb2YgaW1zaWNfYmFzZV9kb21haW4gdG8KPiBzdXBwb3J0IGFsbG9jYXRpbmcgYW5k
IGZyZWVpbmcgbXVsdGlwbGUgbXNpLXggdmVjdG9ycyBhdCBvbmNlLgoKVGhlcmUgYXJlIHR3byBz
ZXBhcmF0ZSBjb25jZXB0cyBoZXJlOiAibXVsdGlwbGUgTVNJLVggdmVjdG9ycyIgYW5kCiJtdWx0
aSBNU0kgdmVjdG9yIi4KCkZvciBtdWx0aXBsZSBNU0ktWCB2ZWN0b3JzLCB3ZSBkb24ndCBuZWVk
IHRvIGRvIGFueXRoaW5nIHNwZWNpYWwgc2luY2UKZWFjaCBNU0ktWCB2ZWN0b3Igd2lsbCBiZSBh
IHNlcGFyYXRlIE1TSSBtZXNzYWdlIChha2EgTVNJIGFkZHJlc3MKYW5kIE1TSSBkYXRhKS4gV2Ug
aGF2ZSB0ZXN0ZWQgdGhlIElNU0lDIGRyaXZlciBmb3IgUENJZSBkZXZpY2VzIHdpdGgKbXVsdGlw
bGUgTVNJLVggdmVjdG9ycyBhbmQgaXQgd29ya3MgZmluZSBiZWNhdXNlIHRoZSBQQ0kgZnJhbWV3
b3JrCnNldHMgdXAgYSBzZXBhcmF0ZSBNU0ktWCBkZXNjcmlwdG9yIGZvciBlYWNoIE1TSS1YIHZl
Y3RvciBbMV0uCgpGb3IgbXVsdGkgTVNJLCB0aGVyZSB3aWxsIGJlIGEgc2luZ2xlIE1TSSBhZGRy
ZXNzIGFuZCBtdWx0aXBsZSBjb25zZWN1dGl2ZQpNU0kgZGF0YSB2YWx1ZXMgZm9yIG11bHRpcGxl
IGludGVycnVwdHMuIFRoaXMgaXMgbm90IHByb3Blcmx5IHN1cHBvcnRlZApieSB0aGUgQUlBIHYx
LjAgc3BlY2lmaWNhdGlvbiBiZWNhdXNlIGNoYW5naW5nIHRoZSBNU0kgYWRkcmVzcyBvZiBhCnNp
bmdsZSBpbnRlcnJ1cHQgd291bGQgY2hhbmdlIHRoZSBNU0kgYWRkcmVzcyBvZiBhbGwgaW50ZXJy
dXB0cy4gVGhlCmN1cnJlbnRseSB0aGUgTGludXggSU1TSUMgZHJpdmVyIGRvZXMgbm90IHN1cHBv
cnQgbXVsdGkgTVNJLiBJbiBmYWN0LAp0aGVyZSB3YXMgYSBwYXJ0aWFsIG11bHRpIE1TSSBzdXBw
b3J0IGluIHRoZSB2MTEgb2YgTGludXggQUlBIGRyaXZlcgpzZXJpZXMgWzJdIHdoaWNoIHdhcyBs
YXRlciBkcm9wcGVkIGR1ZSB0byBwYXN0IHJlYXNvbmluZyBwcm92aWRlZAppbiB0aGUgcGFzdCBi
eSBUaG9tYXMgWzNdLgoKQUZBSUssIG1vc3QgUENJZSBkZXZpY2VzIHVzZSBNU0ktWCBhbmQgZXZl
biBMaW51eCBhcmNoL3g4NiBkb2VzCm5vdCBzdXBwb3J0IG11bHRpIE1TSSBzbyB3ZSByZWFsbHkg
bmVlZCBhIHN0cm9uZyByZWFzb24gdG8gc3VwcG9ydAptdWx0aSBNU0kgaW4gZnV0dXJlIEFJQSBz
cGVjaWZpY2F0aW9uIG9yIExpbnV4IElNU0lDIGRyaXZlci4KClsxXSBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9k
cml2ZXJzL3BjaS9tc2kvbXNpLmM/aD12Ni4xMy1yYzUjbjYyMgpbMl0gaHR0cHM6Ly93d3cuc3Bp
bmljcy5uZXQvbGlzdHMvZGV2aWNldHJlZS9tc2c2NDM3NzIuaHRtbApbM10gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzg3N2Q3eWh2ZTcuZmZzQHRnbHgvCgo+Cj4gU2lnbmVkLW9mZi1ieTog
WHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYyB8IDU0ICsrKysrKysrKysrKystLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYyBi
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+IGluZGV4IGM3MDg3
ODBlODc2MC4uZDBlYTBlYjIyZTJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW1zaWMtcGxhdGZvcm0uYwo+IEBAIC0xNDEsMzUgKzE0MSw0NSBAQCBzdGF0aWMgc3RydWN0IGly
cV9jaGlwIGltc2ljX2lycV9iYXNlX2NoaXAgPSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIElSUUNISVBfTUFTS19PTl9TVVNQRU5ELAo+ICB9Owo+Cj4gK3N0YXRpYyB2b2lk
IGltc2ljX2lycV9kb21haW5fZnJlZShzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluLCB1bnNpZ25l
ZCBpbnQgdmlycSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IG5yX2lycXMpCj4gK3sKPiArICAgICAgIHN0cnVjdCBpcnFfZGF0YSAqZDsKPiArICAgICAg
IGludCBpOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9pcnFzOyBpKyspIHsKPiAr
ICAgICAgICAgICAgICAgZCA9IGlycV9kb21haW5fZ2V0X2lycV9kYXRhKGRvbWFpbiwgdmlycSAr
IGkpOwo+ICsgICAgICAgICAgICAgICBpbXNpY192ZWN0b3JfZnJlZShpcnFfZGF0YV9nZXRfaXJx
X2NoaXBfZGF0YShkKSk7Cj4gKyAgICAgICB9Cj4gKyAgICAgICBpcnFfZG9tYWluX2ZyZWVfaXJx
c190b3AoZG9tYWluLCB2aXJxLCBucl9pcnFzKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCBpbXNp
Y19pcnFfZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sIHVuc2lnbmVkIGlu
dCB2aXJxLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
bnJfaXJxcywgdm9pZCAqYXJncykKPiAgewo+ICAgICAgICAgc3RydWN0IGltc2ljX3ZlY3RvciAq
dmVjOwo+IC0KPiAtICAgICAgIC8qIE11bHRpLU1TSSBpcyBub3Qgc3VwcG9ydGVkIHlldC4gKi8K
PiAtICAgICAgIGlmIChucl9pcnFzID4gMSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOwoKSSBkb24ndCBzZWUgd2h5IHdlIG5lZWQgdG8gaGFuZGxlICJucl9pcnFzID4gMSIg
b3ZlciBoZXJlIGJlY2F1c2UKUENJIGZyYW1ld29yayBhbHJlYWR5IGNyZWF0ZXMgYSBzZXBhcmF0
ZSBNU0ktWCBkZXNjcmlwdG9yIGZvcgplYWNoIE1TSS1YIHZlY3Rvci4KCklmIHdlIGRvIHN1cHBv
cnQgIm5yX2lycXMgPiAxIiBvdmVyIGhlcmUgdGhlbiB3ZSBzdGlsbCBuZWVkIGEgY2hlY2sKd2hp
Y2ggcHJldmVudHMgbXVsdGkgTVNJIChhcyBleHBsYWluZWQgYWJvdmUpLgoKPiAtCj4gLSAgICAg
ICB2ZWMgPSBpbXNpY192ZWN0b3JfYWxsb2ModmlycSwgY3B1X29ubGluZV9tYXNrKTsKPiAtICAg
ICAgIGlmICghdmVjKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVOT1NQQzsKPiAtCj4gLSAg
ICAgICBpcnFfZG9tYWluX3NldF9pbmZvKGRvbWFpbiwgdmlycSwgdmlycSwgJmltc2ljX2lycV9i
YXNlX2NoaXAsIHZlYywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgaGFuZGxlX3NpbXBs
ZV9pcnEsIE5VTEwsIE5VTEwpOwo+IC0gICAgICAgaXJxX3NldF9ub3Byb2JlKHZpcnEpOwo+IC0g
ICAgICAgaXJxX3NldF9hZmZpbml0eSh2aXJxLCBjcHVfb25saW5lX21hc2spOwo+IC0gICAgICAg
aXJxX2RhdGFfdXBkYXRlX2VmZmVjdGl2ZV9hZmZpbml0eShpcnFfZ2V0X2lycV9kYXRhKHZpcnEp
LCBjcHVtYXNrX29mKHZlYy0+Y3B1KSk7Cj4gKyAgICAgICBpbnQgaSwgZXJyOwo+ICsKPiArICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBucl9pcnFzOyBpKyspIHsKPiArICAgICAgICAgICAgICAgdmVj
ID0gaW1zaWNfdmVjdG9yX2FsbG9jKHZpcnEgKyBpLCBjcHVfb25saW5lX21hc2spOwo+ICsgICAg
ICAgICAgICAgICBpZiAoIXZlYykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1F
Tk9TUEM7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJvcjsKPiArICAgICAgICAg
ICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgaXJxX2RvbWFpbl9zZXRfaW5mbyhkb21haW4s
IHZpcnEgKyBpLCB2aXJxICsgaSwgJmltc2ljX2lycV9iYXNlX2NoaXAsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdmVjLCBoYW5kbGVfc2ltcGxlX2lycSwgTlVMTCwgTlVM
TCk7Cj4gKyAgICAgICAgICAgICAgIGlycV9zZXRfbm9wcm9iZSh2aXJxICsgaSk7Cj4gKyAgICAg
ICAgICAgICAgIGlycV9zZXRfYWZmaW5pdHkodmlycSArIGksIGNwdV9vbmxpbmVfbWFzayk7Cj4g
KyAgICAgICAgICAgICAgIGlycV9kYXRhX3VwZGF0ZV9lZmZlY3RpdmVfYWZmaW5pdHkoaXJxX2dl
dF9pcnFfZGF0YSh2aXJxICsgaSksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY3B1bWFza19vZih2ZWMtPmNwdSkpOwo+ICsgICAgICAgfQo+Cj4g
ICAgICAgICByZXR1cm4gMDsKPiAtfQo+IC0KPiAtc3RhdGljIHZvaWQgaW1zaWNfaXJxX2RvbWFp
bl9mcmVlKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sIHVuc2lnbmVkIGludCB2aXJxLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbnJfaXJxcykKPiAt
ewo+IC0gICAgICAgc3RydWN0IGlycV9kYXRhICpkID0gaXJxX2RvbWFpbl9nZXRfaXJxX2RhdGEo
ZG9tYWluLCB2aXJxKTsKPgo+IC0gICAgICAgaW1zaWNfdmVjdG9yX2ZyZWUoaXJxX2RhdGFfZ2V0
X2lycV9jaGlwX2RhdGEoZCkpOwo+IC0gICAgICAgaXJxX2RvbWFpbl9mcmVlX2lycXNfcGFyZW50
KGRvbWFpbiwgdmlycSwgbnJfaXJxcyk7Cj4gK2Vycm9yOgo+ICsgICAgICAgaW1zaWNfaXJxX2Rv
bWFpbl9mcmVlKGRvbWFpbiwgdmlycSwgaSk7Cj4gKyAgICAgICByZXR1cm4gZXJyOwo+ICB9Cj4K
PiAgc3RhdGljIGludCBpbXNpY19pcnFfZG9tYWluX3NlbGVjdChzdHJ1Y3QgaXJxX2RvbWFpbiAq
ZG9tYWluLCBzdHJ1Y3QgaXJxX2Z3c3BlYyAqZndzcGVjLAo+IC0tCj4gMi4yMC4xCj4KPgoKUmVn
YXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
