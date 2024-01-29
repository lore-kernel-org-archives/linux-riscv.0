Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2114EC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=466J5Xhck1Q3C20TFwI8U1hDDP6bdDbz8HCg8Zok2pM=; b=gsdSJsIvNSOmEL
	Um+N6lEAglkb1zjCUdKRJ8R/bVoQE8VqiWcgCKn11GpCsj95YKSBP07nbFU7Djb2TNxaUdGt1mDMf
	jqKUoGV3QvGQubLEUnhekOffpQ1bP2/Hzmikcqc8rO7Usm7h3dpUyeszGMGxoTFnBQo4XaUbJx0vc
	3Dr5ZAVynZvyscxNuEBgpGxeZtqZLuPYP9W0STm9ZB0U+EBKjR12RcGVy/yJTwX/ABHii7k4Zmuil
	Uylhr9uGRn+8wYNiAkBocilXhN6xlHNhPso7euv9NDmmMXCYtUPefqkQcLloLLv+XAygb9kXyytfB
	G9AeZdN9Q3a0IYy6qeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPQE-0000000CKbJ-3BQa;
	Mon, 29 Jan 2024 11:03:26 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPQB-0000000CKaN-1y3N
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 11:03:24 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e113b81107so703442a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 03:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706526142; x=1707130942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTJxbxSOrvcrYc8CLPfFyPhV1mIIGJ+doi7MTifU0M0=;
        b=O7CTqhchFmMyVaAw5vMGzOjFL3aDJ16t8wTcl9VW79JKTnCXdeBNUFWBqJD7QC+mZr
         /vCDCHEvzzAnpAdz/DCnEFPMaR+zzwBqyByy7mc2DsT7G7EJnTM//zQD5ObUEqT/0vwH
         ie2/ZqaEqaIWKDMkyRfnQ9sgvIbyyyxcQE5s4YAaMk6M25bT/Lqt09BLr4DgBzfhmTPL
         5NuhnIvq9RqScmZS20xRJlbKNusIT1EPA9JZ2DbJ+M6FVE1fupOBYzma0IWIgXfnut4l
         Xfl/8Pl4eAvJzDJVRcNgxkSKeFAeDrWb+iQvPqwE9Qu0G8QBkL9VBEQ2qWr+75cdIPYw
         NJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706526142; x=1707130942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTJxbxSOrvcrYc8CLPfFyPhV1mIIGJ+doi7MTifU0M0=;
        b=DtuEJM/gu7qHxHInFEy5XqjS8q1JGnk6+Y4oouW2ZRpNZV9le9ndF2lecZrUhTI2QK
         OEd6BpNCGT9Ghu7vYJON5ulrySOsN8EtY9SLAxPNPO1ojzlIJ2CIpf3lXZb5PQh07fc6
         tvJmd5dMGCy0R7onRfQaPvOHsk7Z+6u2225hTEzqRzajjAPqFE3n6I17996g4dxRmL0e
         ri8cXDc8e5uLj9Is/wmFyfLtJ+/2FNARQd+rY7e+Zj7o0UAI3ffvxpTQWNyICEabMZR1
         iMXTurJ+jkbiqbKjGK4Pv5XvixtAocAT7OcqSLxKWlPh9R3HKokD4p+e5qO6xL8vGNwD
         ga+A==
X-Gm-Message-State: AOJu0YwECE2//xaxAetoETpcsU9KrjpWwvw1sxI8cHzb+mdslv2rhsy9
	I+e8u5QBWYlZu9aEh8u7Z04wZ5xSxGsOUcxQxXsq7CHwUpcB71aDvBjt1jdDSkc9t0yAiVu7tf3
	/Zl8wA60yvbF3o0Zpna0Eh3VZpMuaLYP+jEevfA==
X-Google-Smtp-Source: AGHT+IFyB6ujhYtsGwcb5sT9gwnpJFYAxXYY7eiiu37ZZfUtpEHnWyotucxQcOKyU9rF1HwrYKMWvXZazIT3hfyDpvA=
X-Received: by 2002:a05:6870:d611:b0:214:76ce:3877 with SMTP id
 a17-20020a056870d61100b0021476ce3877mr2253435oaq.16.1706526141790; Mon, 29
 Jan 2024 03:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20240125062044.63344-1-cuiyunhui@bytedance.com>
 <ZbdYijWK1PnHXn47@xhacker> <CAEEQ3wnSN8dLh3FcmHq5yPwQRdjLQa_VjcuTH+7YYZLOqCzaCQ@mail.gmail.com>
 <ZbdyLJ24I2fa6oNb@xhacker>
In-Reply-To: <ZbdyLJ24I2fa6oNb@xhacker>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 29 Jan 2024 19:02:10 +0800
Message-ID: <CAEEQ3w=gpSTxzxTzh-zHbP37P8s5eVCzG6RZndBXF-U+mNrziw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: add uniprocessor flush_tlb_range() support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com, 
	mchitale@ventanamicro.com, dylan@andestech.com, 
	sergey.matyukevich@syntacore.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_030323_561736_3B92F1C6 
X-CRM114-Status: GOOD (  21.22  )
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

SGkgSmlzaGVuZywKCk9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDU6NTHigK9QTSBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMjksIDIwMjQg
YXQgMDQ6MjY6NTdQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+IEhpIEppc2hlbmcsCj4g
Pgo+ID4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDowMuKAr1BNIEppc2hlbmcgWmhhbmcgPGpz
emhhbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgSmFuIDI1LCAyMDI0
IGF0IDAyOjIwOjQ0UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiA+ID4gQWRkIHN1cHBv
cnQgZm9yIGZsdXNoX3RsYl9yYW5nZSgpIHRvIGltcHJvdmUgVExCIHBlcmZvcm1hbmNlIGZvcgo+
ID4gPiA+IFVQIHN5c3RlbXMuIEluIG9yZGVyIHRvIGF2b2lkIHRoZSBtdXR1YWwgaW5jbHVzaW9u
IG9mIHRsYmZsdXNoLmgKPiA+ID4gPiBhbmQgaHVnZXRsYi5oLCB0aGUgVVAgcGFydCBpcyBhbHNv
IGltcGxlbWVudGVkIGluIHRsYmZsdXNoLmMuCj4gPiA+Cj4gPiA+IEhpIFl1bmh1aSwKPiA+ID4K
PiA+ID4gSUlSQywgU2FtdWVsIHNlbnQgc2ltaWxhciBwYXRjaCBzZXJpZXMgYSBmZXcgd2Vla3Mg
YWdvLgo+ID4gPgo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0
MDEwMjIyMDEzNC4zMjI5MTU2LTEtc2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbS8KPiA+ID4KPiA+
ID4gQWZ0ZXIgdGhhdCBzZXJpZXMsIGRvIHlvdSBzdGlsbCBuZWVkIHRoaXMgcGF0Y2g/Cj4gPgo+
ID4gVGhhbmsgeW91IGZvciB5b3VyIHJlbWluZGVyLiBJIGRpZG4ndCBmaW5kIGl0IGJlZm9yZSBJ
IG1haWxlZCBteQo+ID4gcGF0Y2guIEkganVzdCBsb29rZWQgYXQgdGhlIGNvbnRlbnQgb2YgdGhp
cyBwYXRjaC4gSSB1bmRlcnN0YW5kIHRoYXQKPiA+IG15IHBhdGNoIGlzIG5lZWRlZC4gRm9yIGEg
c2luZ2xlIGNvcmUsIGEgbW9yZSBjb25jaXNlIFRMQiBmbHVzaCBsb2dpYwo+ID4gaXMgbmVlZGVk
LCBhbmQgaXQgaXMgaGVscGZ1bCB0byBpbXByb3ZlIHBlcmZvcm1hbmNlLgo+Cj4gQ3VycmVudGx5
LCByaXNjdiBVUCBmbHVzaF90bGJfcmFuZ2Ugc3RpbGwgdXNlIGZsdXNoIGFsbCBUTEIgZW50cmll
cywKPiBvYnZpb3VzbHkgaXQncyBpcyBhIGJpZyBoYW1tZXIsIHRoaXMgaXMgd2hhdCB5b3VyIHBh
dGNoIGlzIHRyeWluZyB0bwo+IG9wdGltaXplLiBJJ20gbm90IHN1cmUgd2hldGhlciBJIHVuZGVy
c3RhbmQgeW91ciBjb2RlIGNvcnJlY3RseSBvciBub3QuCj4gTGV0IG1lIGtub3cgaWYgSSBtaXN1
bmRlcnN0YW5kIHlvdXIgY29kZS4KPgo+IEFmdGVyIHBhdGNoNSBvZiB0aGUgU2FtdWVsJ3Mgc2Vy
aWVzLCBfX2ZsdXNoX3RsYl9yYW5nZSBpcyB1bmlmaWVkIGZvcgo+IFNNUCBhbmQgVVAsIHNvIHRo
YXQgVVAgY2FuIGFsc28gYmVuZWZpdCBmcm9tIHJlY2VudCBpbXByb3ZlbWVudHMsIHN1Y2gKPiBh
cyByYW5nZSBmbHVzaCByYXRoZXIgdGhhbiBhbGwuCgpJbiBteSBvcGluaW9uLCBVUCBkb2VzIG5v
dCBuZWVkIHRvIGNvbWJpbmUgc29tZSBTTVAgaWYuLi4gZWxzZSwKb25fZWFjaF9jcHUoLi4uKSBs
b2dpYywgd2hpY2ggaXMgYWxzbyBhIG1hbmlmZXN0YXRpb24gb2YgcGVyZm9ybWFuY2UKaW1wcm92
ZW1lbnQuIHdoYXQgZG8geW91IHRoaW5rPwpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
