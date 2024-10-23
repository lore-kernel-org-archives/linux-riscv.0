Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54C4CFA460
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uB0q3JnRwJu/pU5nPqe0EuqEn16jvUPxj/mXTyld4wk=; b=tapVagRBrhQfRn
	I5iCuHRTPQuyHMqfBCKXqb9tEzsZ/5qPes9Y30nd+LAeOEyLnC2Tp7F8tKqd4QFC1HOY4TIOPixCH
	xJFFcjTLlopYKk230fOFEAaSfUkhFTuKA4nMX44Ttk2Io0q3TLoYWQ28fulUt8vL1vVeDRipm+CyO
	B/guyNUwa+Y+eHBLsWDM9Ym3Hi7IvvcPNyR3Ds7jRIPgJ8qpBUI3B5Wp2hAuPlc1ODbf30iPdoRKD
	KaesfEdDEqlN6UFt1X5ETh34+STPQ2gcJlFHQiy+nTavNjL4a4jE5+CI+OPXbJsLJYkP/5MUyI0W3
	9Xpp1v2emd+VvOCxbrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gxM-0000000Ffjt-2r6T;
	Wed, 23 Oct 2024 19:23:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gJD-0000000FZXX-2MJ7;
	Wed, 23 Oct 2024 18:42:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d5689eea8so18030f8f.1;
        Wed, 23 Oct 2024 11:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729708934; x=1730313734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ay/OqGD2GTrz3V0tm8K+95EMKdw2lJQesOojfLv6f0=;
        b=ABvicYfiRJppK34YtRIFGqpR72h+qBH9mEfhy0Au8UNt0KiIml7DWNanVxq9EWbxTT
         M0QXzDcRbHSIUWrNCQBredWUn110P0TXeFOL/YODznDjVYhP2aoXfVu07V37d0mtXDoQ
         JaN/21CeON/MPSChoZptnwZfjL1k5UJwLQ2f+2e8ybFGt925gO7ex2+7fdIDoxEcavHO
         kfhicucnY3ENL58EYifa1OS2IevCQo78fCWuKRR6lWNq3TUDpxvTP+s0vAH2EKp+b/r0
         XcURoNRt04RYq7WUJfWvWFT8cO4HcWKVNaj/pxtmasFhR+shNTiY+rUceaLB225v8CqQ
         KGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708934; x=1730313734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ay/OqGD2GTrz3V0tm8K+95EMKdw2lJQesOojfLv6f0=;
        b=QQj7S+iZoHZudlehIivQdrTRPCCEKMk6P85fT0DHEoBnAwRSKfXB288nJwJBNqCirp
         RyANJ8KM1ieeVIWoSEQrZJkLd+8E5/Eww8gvkazpB3gj6SeaKOHrN5HCoHZb1WRHAohQ
         vKOkHi0gnKBhcuiHpmsLm6R3AAxIqbqPBNM6rXFZzR7ErJp9vtrY5BSzOmkoiFJKCp9h
         sDkxipMkh4yggnsmhu/51zjoaewfnMyPjFIZ5Vz0kxy4MqT2OchcfC6eR9hbO+ACc9cW
         IQe1MGF0bCeD5wh78Fgm9CxOQNITrRldBEZvdbyytiKvksUTDTLVvo2z2yFEQjfm2mjg
         ANTw==
X-Forwarded-Encrypted: i=1; AJvYcCUlKd0jZI/zvQmYdeW+PI3V0YSdtVZKMtEZ2AFKSBXS9HDhBpFsmmmSbr8u+Ur4mFS3SQaBshPLXH+qI+TAVT+h@lists.infradead.org, AJvYcCUs9dpQ9/yPSwps3wJSmcgkzTAoTNLysqNg5VmDtThRDQmUHkZES0DcT7carsbYKcgeT4e61ZAGNPbguVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZgYZQGRlOkRaXTiLaaw/7ZVdZyiLeIvDMy4Ydwz+T0aMKgvmM
	0LHKf2RgWVbl3ln63WxOQ6QO+l+/2A2074h2pJmvkk4Pv0SNGUIFx//7irOagpR0NfilY3fTmEz
	xgKrCOgEqAhTO6c6GuYuQae7bDW4=
X-Google-Smtp-Source: AGHT+IFB3tSRsLc8IJ+ZLmbBRgiQxMJcijIbkhHI+LcLoWS2ExMHeUZd0pXljEEFRrdcgGNxkIUIlWkiXJ0JtmbA57I=
X-Received: by 2002:adf:f5c4:0:b0:37d:5338:8733 with SMTP id
 ffacd0b85a97d-37efcf7ba95mr2248780f8f.37.1729708933928; Wed, 23 Oct 2024
 11:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com> <20241022015913.3524425-4-samuel.holland@sifive.com>
In-Reply-To: <20241022015913.3524425-4-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 23 Oct 2024 20:42:03 +0200
Message-ID: <CA+fCnZe49OGG_8J40_d9dTUBktY6qe-1dq1Y6Q+7hY9=xmUWQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] kasan: sw_tags: Support outline stack tag generation
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_114215_627053_A81BE296 
X-CRM114-Status: GOOD (  18.20  )
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

T24gVHVlLCBPY3QgMjIsIDIwMjQgYXQgMzo1OeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgYWxsb3dzIHN0YWNrIHRhZ2dpbmcg
dG8gYmUgZGlzYWJsZWQgYXQgcnVudGltZSBieSB0YWdnaW5nIGFsbAo+IHN0YWNrIG9iamVjdHMg
d2l0aCB0aGUgbWF0Y2gtYWxsIHRhZy4gVGhpcyBpcyBuZWNlc3Nhcnkgb24gUklTQy1WLAo+IHdo
ZXJlIGEga2VybmVsIHdpdGggS0FTQU5fU1dfVEFHUyBlbmFibGVkIGlzIGV4cGVjdGVkIHRvIGJv
b3Qgb24KPiBoYXJkd2FyZSB3aXRob3V0IHBvaW50ZXIgbWFza2luZyBzdXBwb3J0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4g
LS0tCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIFNwbGl0IHRoZSBnZW5lcmljIGFuZCBSSVNDLVYg
cGFydHMgb2Ygc3RhY2sgdGFnIGdlbmVyYXRpb24gY29udHJvbAo+ICAgIHRvIGF2b2lkIGJyZWFr
aW5nIGJpc2VjdGFiaWxpdHkKPgo+ICBtbS9rYXNhbi9rYXNhbi5oICAgfCAyICsrCj4gIG1tL2th
c2FuL3N3X3RhZ3MuYyB8IDkgKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL21tL2thc2FuL2thc2FuLmggYi9tbS9rYXNhbi9rYXNh
bi5oCj4gaW5kZXggZjQzOGE2Y2RjOTY0Li43MmRhNWRkY2NlYWEgMTAwNjQ0Cj4gLS0tIGEvbW0v
a2FzYW4va2FzYW4uaAo+ICsrKyBiL21tL2thc2FuL2thc2FuLmgKPiBAQCAtNjM2LDYgKzYzNiw4
IEBAIHZvaWQgKl9fYXNhbl9tZW1zZXQodm9pZCAqYWRkciwgaW50IGMsIHNzaXplX3QgbGVuKTsK
PiAgdm9pZCAqX19hc2FuX21lbW1vdmUodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzc2l6
ZV90IGxlbik7Cj4gIHZvaWQgKl9fYXNhbl9tZW1jcHkodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAq
c3JjLCBzc2l6ZV90IGxlbik7Cj4KPiArdTggX19od2FzYW5fZ2VuZXJhdGVfdGFnKHZvaWQpOwo+
ICsKPiAgdm9pZCBfX2h3YXNhbl9sb2FkMV9ub2Fib3J0KHZvaWQgKik7Cj4gIHZvaWQgX19od2Fz
YW5fc3RvcmUxX25vYWJvcnQodm9pZCAqKTsKPiAgdm9pZCBfX2h3YXNhbl9sb2FkMl9ub2Fib3J0
KHZvaWQgKik7Cj4gZGlmZiAtLWdpdCBhL21tL2thc2FuL3N3X3RhZ3MuYyBiL21tL2thc2FuL3N3
X3RhZ3MuYwo+IGluZGV4IDIyMGI1ZDRjNjg3Ni4uMzI0MzVkMzM1ODNhIDEwMDY0NAo+IC0tLSBh
L21tL2thc2FuL3N3X3RhZ3MuYwo+ICsrKyBiL21tL2thc2FuL3N3X3RhZ3MuYwo+IEBAIC03MCw2
ICs3MCwxNSBAQCB1OCBrYXNhbl9yYW5kb21fdGFnKHZvaWQpCj4gICAgICAgICByZXR1cm4gKHU4
KShzdGF0ZSAlIChLQVNBTl9UQUdfTUFYICsgMSkpOwo+ICB9Cj4KPiArdTggX19od2FzYW5fZ2Vu
ZXJhdGVfdGFnKHZvaWQpCj4gK3sKPiArICAgICAgIGlmICgha2FzYW5fZW5hYmxlZCgpKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gS0FTQU5fVEFHX0tFUk5FTDsKPiArCj4gKyAgICAgICByZXR1
cm4ga2FzYW5fcmFuZG9tX3RhZygpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woX19od2FzYW5fZ2Vu
ZXJhdGVfdGFnKTsKPiArCj4gIGJvb2wga2FzYW5fY2hlY2tfcmFuZ2UoY29uc3Qgdm9pZCAqYWRk
ciwgc2l6ZV90IHNpemUsIGJvb2wgd3JpdGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyByZXRfaXApCj4gIHsKPiAtLQo+IDIuNDUuMQo+CgpSZXZpZXdlZC1ieTogQW5k
cmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
