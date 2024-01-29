Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1365C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwnRGfGtoFTnSoM6DWJ+LUTI9+O+Zcn/bjEdsYCMhCE=; b=RaTRrerwsZTLF0
	WlT+UxVGFwqgaM/iUIb8ArRrZ7etzJoX4qPfdzCuHwnUGfv+0fpVEyX0AkD5xWfpUb+MIx7mdYKdp
	yjTH6UFHP/z1Twr9AM9kNY6Tqgi1wB6QDRVZnfdQPgM/UNpQq+c6dmoQSRE7dpyFVYq59pcxiKn/B
	9cVpAokw7XkHs8M1gdDlcLUXCSGSZQoD4oyVyDvp1cZVC2FC/1BWS1jIgIwo7cpLqe308gdQhxTN1
	+Cz/9q8iobsjVxr+zqTv/tGvSYeKIyt/izaJHgWsI8TohMLKAIZcN0P0Eb2aLDUQgvrUFt4zewg08
	0BIo3tRv56T/xGgCs7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTfG-0000000DJ6X-3vGR;
	Mon, 29 Jan 2024 15:35:14 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTfC-0000000DJ5D-3adD;
	Mon, 29 Jan 2024 15:35:11 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-210cd12fae2so25257fac.0;
        Mon, 29 Jan 2024 07:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706542508; x=1707147308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG+8XeCHdsIlnW4L47AUTukqeea8Ay75J0VzHSz+j7A=;
        b=JwbJXiuz0TjGIxn4wxg0wC/BbpwqvaxNMZcZJDi4tv85wtBLbJ0GLawxspkrd65fsE
         Ee8xmpr0boFfnhroKgYCHBEn/U0gGevQHakjymHg3R+Eb8ToUnD3xw+UdSlTZ8qdadba
         rWJ8/nkZIZOJuDMRTcfs6mSUgaqw1qobio9bYXQF6tSUITE/d0ogUBv6xLGOx1lBs1Eh
         ZTQrnVJ0gHTAI3bjsU3O1zZ4quMbEo2LgMK2NyqJMvmpBPn7LwnqRxLbs1quhuG5cdl+
         ztQdnW/IL7XpDwlpESl4fjEO1+of4aYmI04TD7CM35QNPgeK4W9r0kofHrQB5upyNeaC
         QVJw==
X-Forwarded-Encrypted: i=0; AJvYcCXxXcQz4mZVIvg1bHT5i3UlKM5gIbCGl3VKrkMtrkWHdYnwgxSL/Kn1RKPd0+lfS6Mu2t7eIffVUsgcFQWH2nzo8G2YR3eqH3lPG6AM/kQ2V6aJmwinbxslRnQGP9S8ulisv0XUvchgKwOsfwE/JasEeiUEMl8=
X-Gm-Message-State: AOJu0Yznc8SNQl2cY3PQMJmKE/sOKrr5qkSFSn8LWs/z1fzbKxTMHffr
	ka2MsyZ0b/4Zx0X7ka2zDEuokZdDPQ3/XM7B2+4HXWsdCJJaef7y/sGe3E4ks5LQEYBrAzL4Nx2
	7m98hLqpFrevjVxfPguXNSV70vuA=
X-Google-Smtp-Source: AGHT+IHhrTU6Vx9l5tJAOVsHqvjFv8owslRWENpfX2JETljBTVS4w/It4UoW1njjPVf/6maja2wtMQZ5MonYr2C+WRA=
X-Received: by 2002:a05:6870:230d:b0:214:fddf:99f7 with SMTP id
 w13-20020a056870230d00b00214fddf99f7mr7432263oao.5.1706542508620; Mon, 29 Jan
 2024 07:35:08 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <ZXxxa+XZjPZtNfJ+@shell.armlinux.org.uk>
 <20231215161539.00000940@Huawei.com> <5760569.DvuYhMxLoT@kreacher>
 <20240102143925.00004361@Huawei.com> <20240111101949.000075dc@Huawei.com>
 <ZZ/CR/6Voec066DR@shell.armlinux.org.uk> <20240112115205.000043b0@Huawei.com>
 <Zbe8WQRASx6D6RaG@shell.armlinux.org.uk> <CAJZ5v0iba93EhQB2k3LMdb2YczndbRmF5WGRYHhnqCHq6TQJ0A@mail.gmail.com>
 <ZbfBYgdLzvEX/VjN@shell.armlinux.org.uk>
In-Reply-To: <ZbfBYgdLzvEX/VjN@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Jan 2024 16:34:57 +0100
Message-ID: <CAJZ5v0gr3ZmLY9m+rYGP36zQYNH4ohL=zbym4LS3Eq+Qt4nZLA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or functional) devices
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_073510_923771_94AABA1D 
X-CRM114-Status: GOOD (  33.15  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDoxN+KAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0
IDA0OjA1OjQyUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gTW9uLCBK
YW4gMjksIDIwMjQgYXQgMzo1NeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4
QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEpvbmF0aGFuLAo+ID4gPgo+
ID4gPiBPbiBGcmksIEphbiAxMiwgMjAyNCBhdCAxMTo1MjowNUFNICswMDAwLCBKb25hdGhhbiBD
YW1lcm9uIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgMTEgSmFuIDIwMjQgMTA6MjY6MTUgKzAwMDAK
PiA+ID4gPiAiUnVzc2VsbCBLaW5nIChPcmFjbGUpIiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3
cm90ZToKPiA+ID4gPiA+IEBAIC0yMzgxLDE2ICsyMzg4LDM4IEBAIEVYUE9SVF9TWU1CT0xfR1BM
KGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcyk7Cj4gPiA+ID4gPiAgICogYWNwaV9kZXZfcmVh
ZHlfZm9yX2VudW1lcmF0aW9uIC0gQ2hlY2sgaWYgdGhlIEFDUEkgZGV2aWNlIGlzIHJlYWR5IGZv
ciBlbnVtZXJhdGlvbgo+ID4gPiA+ID4gICAqIEBkZXZpY2U6IFBvaW50ZXIgdG8gdGhlICZzdHJ1
Y3QgYWNwaV9kZXZpY2UgdG8gY2hlY2sKPiA+ID4gPiA+ICAgKgo+ID4gPiA+ID4gLSAqIENoZWNr
IGlmIHRoZSBkZXZpY2UgaXMgcHJlc2VudCBhbmQgaGFzIG5vIHVubWV0IGRlcGVuZGVuY2llcy4K
PiA+ID4gPiA+ICsgKiBDaGVjayBpZiB0aGUgZGV2aWNlIGlzIGZ1bmN0aW9uYWwgb3IgZW5hYmxl
ZCBhbmQgaGFzIG5vIHVubWV0IGRlcGVuZGVuY2llcy4KPiA+ID4gPiA+ICAgKgo+ID4gPiA+ID4g
LSAqIFJldHVybiB0cnVlIGlmIHRoZSBkZXZpY2UgaXMgcmVhZHkgZm9yIGVudW1lcmF0aW5vLiBP
dGhlcndpc2UsIHJldHVybiBmYWxzZS4KPiA+ID4gPiA+ICsgKiBSZXR1cm4gdHJ1ZSBpZiB0aGUg
ZGV2aWNlIGlzIHJlYWR5IGZvciBlbnVtZXJhdGlvbi4gT3RoZXJ3aXNlLCByZXR1cm4gZmFsc2Uu
Cj4gPiA+ID4gPiAgICovCj4gPiA+ID4gPiAgYm9vbCBhY3BpX2Rldl9yZWFkeV9mb3JfZW51bWVy
YXRpb24oY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlICpkZXZpY2UpCj4gPiA+ID4gPiAgewo+ID4g
PiA+ID4gICAgIGlmIChkZXZpY2UtPmZsYWdzLmhvbm9yX2RlcHMgJiYgZGV2aWNlLT5kZXBfdW5t
ZXQpCj4gPiA+ID4gPiAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gLSAgIHJldHVybiBhY3BpX2RldmljZV9pc19wcmVzZW50KGRldmljZSk7Cj4gPiA+ID4gPiAr
ICAgLyoKPiA+ID4gPiA+ICsgICAgKiBBQ1BJIDYuNSdzIDYuMy43ICJfU1RBIChEZXZpY2UgU3Rh
dHVzKSIgYWxsb3dzIGZpcm13YXJlIHRvIHJldHVybgo+ID4gPiA+ID4gKyAgICAqICghcHJlc2Vu
dCAmJiBmdW5jdGlvbmFsKSBmb3IgY2VydGFpbiB0eXBlcyBvZiBkZXZpY2VzIHRoYXQgc2hvdWxk
IGJlCj4gPiA+ID4gPiArICAgICogZW51bWVyYXRlZC4gTm90ZSB0aGF0IHRoZSBlbmFibGVkIGJp
dCBzaG91bGQgbm90IGJlIHNldCB1bmxlc3MgdGhlCj4gPiA+ID4gPiArICAgICogcHJlc2VudCBi
aXQgaXMgc2V0Lgo+ID4gPiA+ID4gKyAgICAqCj4gPiA+ID4gPiArICAgICogSG93ZXZlciwgbGlt
aXQgdGhpcyBvbmx5IHRvIHByb2Nlc3NvciBkZXZpY2VzIHRvIHJlZHVjZSBwb3NzaWJsZQo+ID4g
PiA+ID4gKyAgICAqIHJlZ3Jlc3Npb25zIHdpdGggZmlybXdhcmUuCj4gPiA+ID4gPiArICAgICov
Cj4gPiA+ID4gPiArICAgaWYgKGRldmljZS0+c3RhdHVzLmZ1bmN0aW9uYWwpCj4gPiA+ID4gPiAr
ICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4KPiA+ID4gSSBoYXZlIGEgcmVwb3J0IGZyb20g
d2l0aGluIE9yYWNsZSB0aGF0IHRoaXMgY2F1c2VzIHRlc3RpbmcgZmFpbHVyZXMKPiA+ID4gd2l0
aCBRRU1VIHVzaW5nIC1zbXAgY3B1cz0yLG1heGNwdXM9NC4gSSB0aGluayBpdCBuZWVkcyB0byBi
ZToKPiA+ID4KPiA+ID4gICAgICAgICBpZiAoIWRldmljZS0+c3RhdHVzLnByZXNlbnQpCj4gPiA+
ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2aWNlLT5zdGF0dXMuZnVuY3Rpb25hbDsKPiA+ID4K
PiA+ID4gICAgICAgICBpZiAoZGV2aWNlLT5zdGF0dXMuZW5hYmxlZCkKPiA+ID4gICAgICAgICAg
ICAgICAgIHJldHVybiB0cnVlOwo+ID4gPgo+ID4gPiAgICAgICAgIHJldHVybiAhYWNwaV9kZXZp
Y2VfaXNfcHJvY2Vzc29yKGRldmljZSk7Cj4gPgo+ID4gVGhlIGFib3ZlIGlzIGZpbmUgYnkgbWUu
Cj4gPgo+ID4gPiBTbyB3ZSBjYW4gYmV0dGVyIHVuZGVyc3RhbmQgdGhlIGhpc3RvcnkgaGVyZSwg
bGV0J3MgbGlzdCBpdCBhcyBhCj4gPiA+IHRydXRoIHRhYmxlLiBQPXByZXNlbnQsIEY9ZnVuY3Rp
b25hbCwgRT1lbmFibGVkLCBPcmlnPWhvdyB0aGUgY29kZQo+ID4gPiBpcyBpbiBtYWlubGluZSwg
SmFtZXM9SmFtZXMnIG9yaWdpbmFsIHByb3Bvc2FsLCBSYWZhZWw9dGhlIHByb3Bvc2VkCj4gPiA+
IHJlcGxhY2VtZW50IGJ1dCBzZWVtcyB0byBiZSBidWdneSwgUm1rPXRoZSBmaXhlZCB2ZXJzaW9u
IHRoYXQgcGFzc2VzCj4gPiA+IHRlc3RzOgo+ID4gPgo+ID4gPiBQIEYgRSAgIE9yaWcgICAgSmFt
ZXMgICBSYWZhZWwgICAgICAgICAgUm1rCj4gPiA+IDAgMCAwICAgMCAgICAgICAwICAgICAgIDAg
ICAgICAgICAgICAgICAwCj4gPiA+IDAgMCAxICAgMCAgICAgICAwICAgICAgIDAgICAgICAgICAg
ICAgICAwCj4gPiA+IDAgMSAwICAgMSAgICAgICAxICAgICAgIDEgICAgICAgICAgICAgICAxCj4g
PiA+IDAgMSAxICAgMSAgICAgICAwICAgICAgIDEgICAgICAgICAgICAgICAxCj4gPiA+IDEgMCAw
ICAgMSAgICAgICAwICAgICAgICFwcm9jZXNzb3IgICAgICAhcHJvY2Vzc29yCj4gPiA+IDEgMCAx
ICAgMSAgICAgICAxICAgICAgIDEgICAgICAgICAgICAgICAxCj4gPiA+IDEgMSAwICAgMSAgICAg
ICAwICAgICAgIDEgICAgICAgICAgICAgICAhcHJvY2Vzc29yCj4gPiA+IDEgMSAxICAgMSAgICAg
ICAxICAgICAgIDEgICAgICAgICAgICAgICAxCj4gPiA+Cj4gPiA+IEFueSBvYmplY3Rpb25zIHRv
IHRoaXM/Cj4gPgo+ID4gU28gQUZBSUFDIGl0IGNhbiByZXR1cm4gZmFsc2UgaWYgbm90IGVuYWJs
ZWQsIGJ1dCBwcmVzZW50IGFuZAo+ID4gZnVuY3Rpb25hbC4gIFtTaWRlIG5vdGU6IEknbSB3b25k
ZXJpbmcgd2hhdCAiZnVuY3Rpb25hbCIgbWVhbnMgdGhlbiwKPiA+IGJ1dCB3aGF0ZXZlci5dCj4K
PiBGcm9tIEFDUEkgdjYuNSAoYml0IDMgaXMgb3VyICJzdGF0dXMuZnVuY3Rpb25hbCI6Cj4KPiAg
X1NUQSBtYXkgcmV0dXJuIGJpdCAwIGNsZWFyIChub3QgcHJlc2VudCkgd2l0aCBiaXQgWzNdIHNl
dCAoZGV2aWNlIGlzCj4gIGZ1bmN0aW9uYWwpLiBUaGlzIGNhc2UgaXMgdXNlZCB0byBpbmRpY2F0
ZSBhIHZhbGlkIGRldmljZSBmb3Igd2hpY2ggbm8KPiAgZGV2aWNlIGRyaXZlciBzaG91bGQgYmUg
bG9hZGVkIChmb3IgZXhhbXBsZSwgYSBicmlkZ2UgZGV2aWNlLikgQ2hpbGRyZW4KPiAgb2YgdGhp
cyBkZXZpY2UgbWF5IGJlIHByZXNlbnQgYW5kIHZhbGlkLiBPU1BNIHNob3VsZCBjb250aW51ZQo+
ICBlbnVtZXJhdGlvbiBiZWxvdyBhIGRldmljZSB3aG9zZSBfU1RBIHJldHVybnMgdGhpcyBiaXQg
Y29tYmluYXRpb24uCj4KPiBTbywgZm9yIHRoaXMgY2FzZSwgYWNwaV9kZXZfcmVhZHlfZm9yX2Vu
dW1lcmF0aW9uKCkgcmV0dXJuaW5nIHRydWUgZm9yCj4gdGhpcyBjYXNlIGlzIGNvcnJlY3QsIHNp
bmNlIHdlJ3JlIHN1cHBvc2VkIHRvIGVudW1lcmF0ZSBpdCBhbmQgY2hpbGQKPiBkZXZpY2VzLgo+
Cj4gSXQncyBwcm9iYWJseSBhbHNvIHdvcnRoIHBvaW50aW5nIG91dCB0aGF0IGluIHRoZSBhYm92
ZSB0YWJsZSwgdGhlIHR3bwo+IGNvbWJpbmF0aW9ucyB3aXRoIFA9MCBFPTEgZ29lcyBhZ2FpbnN0
IHRoZSBzcGVjLCBidXQgYXJlIGluY2x1ZGVkIGZvcgo+IGNvbXBsZXRuZXNzLgoKVGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgbGFzdCB0d28gY29sdW1ucyBpcyB0aGUgcHJlc2VudCBhbmQKZnVu
Y3Rpb25hbCwgYnV0IG5vdCBlbmFibGVkIGNvbWJpbmF0aW9uIEFGQUlDUywgZm9yIHdoaWNoIG15
IHBhdGNoCmp1c3QgcmV0dXJuZWQgdHJ1ZSwgYnV0IHRoZSBmaXJtd2FyZSBkaXNhZ3JlZXMgd2l0
aCB0aGF0LgoKSXQgaXMga2luZCBvZiBhbmFsb2dvdXMgdG8gdGhlICJub3QgcHJlc2VudCBhbmQg
ZnVuY3Rpb25hbCIgY2FzZQpjb3ZlcmVkIGJ5IHRoZSBzcGVjLCB3aGljaCBpcyB3aHkgaXQgaXMg
ZmluZSBieSBtZSB0byByZXR1cm4gImZhbHNlIgp0aGVuIChmb3IgcHJvY2Vzc29ycyksIGJ1dCB0
aGUgc3BlYyBpcyBub3QgY3J5c3RhbCBjbGVhciBhYm91dCBpdC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
