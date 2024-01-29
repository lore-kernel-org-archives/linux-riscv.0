Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED8BC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrEMFDmPrFaZoS5GHJWZtxxh/qYhsjLrqpZY7Y0yAxk=; b=OJpT0Ve81c1btS
	dRbvUKUFDsR0+7RbXq3+BPaBdhXYuYnnLVDxifhBMSlHPk7myD55ATlhra6Gd9zOITUwhfPHR6qr7
	ubw12onn81YEYNxoFVKundFy8gh+vlbc9tCS9g6dgi5J0RL1noND0GsVamsT+3AGuUXglinmik1M4
	kCvTtCcLphF1rI3uu8NDVmFPJw0YMILmqWkMtFt27U9WgAHnPiZiZQpvDXSl5nqhFwQpuGMJ6uJBT
	hmAlcuOZvIbR966Zam7v6xwX2ESlSVbAp2AsutbTvG9DVo9JZDFjphXCYOd+NHYoryYqMMEWJyPOb
	fXFpfD/KYD5H+MczcTvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNZA-0000000BvPw-0TJe;
	Mon, 29 Jan 2024 09:04:32 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNZ6-0000000BvOe-1mHz
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 09:04:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a271a28aeb4so271179066b.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 01:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706519067; x=1707123867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmg3Hmk9zJNrE7hya32tHVBXLNynM4oyDoMxztwJS0A=;
        b=MjGL3cEWfVlCqIXGBEMn6qXyhzR11zfZVEhxq80+XjIbBPnGRE8zt9I5KhBqgYlMj5
         YFVN47+DD7lTVvdsOqcyVJ43HKwxSS5DwidtNWpaw/SwLHemEYUS96s0SOpKVCIHXNy1
         ca1L0/XSDkUDD+xRXoqLNqxa8pEQY+mE4ZdAJ6NzyNFSK0FqiudSr0PvDNMmj4s9Fksl
         XhostHzIpHh1isT8qsVLbVySJGvo551i4F7IUMhVnh2rRlgfkK6DEjZJ3hx1YDKs5Agj
         q31pgTaEiFq2ZmVLG6kaPFcHysiklpIQ5ZNRJX9pwB0M57RrQ96kE//tY/wfKo9Ja8uP
         w5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706519067; x=1707123867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmg3Hmk9zJNrE7hya32tHVBXLNynM4oyDoMxztwJS0A=;
        b=mGAm3zXS8soc7xwvH3RAoJNFmODEZ8EkcgJphNA56WIYHOKhoAeSoweWyIWqwLlUCP
         aoXCwxYwmIE3RCet/D3VW5VduBYnd43bJOBCfM5GnHghAI5/Prpyp/ZXGlxsNrohfWQo
         6p5RKmsMPjGFXKdp8EWo+8bOHz1vUIUqT2/OQq5PHHCcVw20iMqH4KYQSJvuQ6fjEWsf
         x01SGAMxMYZp2A1CyYL5FJqZ5S3lJNXe1m6Vd3REJdo4tKF2K6bmWxx+XEisslKCzEi/
         +c2dnXnvQiagaiZXtCb13nmM3tMdkG774iTGQIaVRZZyOtDVGrTDX3C9Ry/cazYXK7+d
         XpXw==
X-Gm-Message-State: AOJu0Yz6lHfUSh9onMzL9SJvABKf170PGaBMwPsWoNiZhmKkwq68W/ln
	Mhucep1h+GEEOcvaUWSDsnnWGyAKVlOgIiNMdk+lXQwG/39FyZVi87HIZRznwueZUZpQYKf7ZSE
	WYh9NLeG0oowvqkpGePkJcteF3D/pZZNaaDG+xw==
X-Google-Smtp-Source: AGHT+IFzvYufgRiNAVracHuQK2cLPonaFabFFL3fAz4Cpzxi0d4lWhEOTYTzLWAXVttGPvnGz4xbM9SbOoOM7XAfjvM=
X-Received: by 2002:a17:906:b204:b0:a35:ee97:7ca6 with SMTP id
 p4-20020a170906b20400b00a35ee977ca6mr224215ejz.24.1706519066861; Mon, 29 Jan
 2024 01:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20240123132730.2297719-1-alexghiti@rivosinc.com> <ZbdpTPMOw4lsPxBi@snowbird>
In-Reply-To: <ZbdpTPMOw4lsPxBi@snowbird>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 29 Jan 2024 10:04:16 +0100
Message-ID: <CAHVXubiwoB3jwGqNyKvoUB=73zU-w35c45CcaReD0vgTBxWKQA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix wrong size passed to local_flush_tlb_range_asid()
To: Dennis Zhou <dennis@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_010428_503455_0FB51D2A 
X-CRM114-Status: GOOD (  20.08  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMTA6MDHigK9BTSBEZW5uaXMgWmhvdSA8ZGVubmlzQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgQWxleGFuZHJlLAo+Cj4gT24gVHVlLCBKYW4gMjMsIDIw
MjQgYXQgMDI6Mjc6MzBQTSArMDEwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gbG9jYWxf
Zmx1c2hfdGxiX3JhbmdlX2FzaWQoKSB0YWtlcyB0aGUgc2l6ZSBhcyBhcmd1bWVudCwgbm90IHRo
ZSBlbmQgb2YKPiA+IHRoZSByYW5nZSB0byBmbHVzaCwgc28gZml4IHRoaXMgYnkgY29tcHV0aW5n
IHRoZSBzaXplIGZyb20gdGhlIGVuZCBhbmQKPiA+IHRoZSBzdGFydCBvZiB0aGUgcmFuZ2UuCj4g
Pgo+ID4gRml4ZXM6IDdhOTJmYzhiNGQyMCAoIm1tOiBJbnRyb2R1Y2UgZmx1c2hfY2FjaGVfdm1h
cF9lYXJseSgpIikKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyB8IDIg
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9t
bS90bGJmbHVzaC5jCj4gPiBpbmRleCA4ZDEyYjI2ZjVhYzMuLjk2MTk5NjVmNjUwMSAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9t
bS90bGJmbHVzaC5jCj4gPiBAQCAtNjgsNyArNjgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbG9j
YWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQodW5zaWduZWQgbG9uZyBzdGFydCwKPiA+Cj4gPiAgdm9p
ZCBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2ln
bmVkIGxvbmcgZW5kKQo+ID4gIHsKPiA+IC0gICAgIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lk
KHN0YXJ0LCBlbmQsIFBBR0VfU0laRSwgRkxVU0hfVExCX05PX0FTSUQpOwo+ID4gKyAgICAgbG9j
YWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQoc3RhcnQsIGVuZCAtIHN0YXJ0LCBQQUdFX1NJWkUsIEZM
VVNIX1RMQl9OT19BU0lEKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIF9faXBpX2ZsdXNo
X3RsYl9hbGwodm9pZCAqaW5mbykKPiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4KPiBTb3JyeSBmb3Ig
dGhlIGRlbGF5LCBJIGp1c3QgcHVsbGVkIHRoaXMgaW50byBwZXJjcHUjZm9yLTYuOC1maXhlcy4g
SSdsbAo+IHNlbmQgaXQgdG8gTGludXMgdGhpcyB3ZWVrLgo+Cj4gVGhhbmtzLAo+IERlbm5pcwoK
Tm8gcHJvYmxlbSwgdGhhbmtzIQoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
