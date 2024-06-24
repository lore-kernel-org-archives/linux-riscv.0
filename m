Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A988FC2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qB8C671uJNOLMIxyzthM11sXlX9JXpkEZvXxSTMulck=; b=olUo2zsA7GD3eg
	IiU/IIqVXsWFb1Yo5WfSSucW+3fDZUHfVFmn3ujMoePwp+8qXtL7N21SWR03OZN1NAK2dvPRoyYxd
	IEwzj7l/UiU0/XevfWzS7uLOqLlLdUiWiEbBFymV6r3kOPqL2T1ll0mgu+o3PJiKOyh1F/L3uU5Ba
	y9/cEgsKhyP1S5GAJNATS0Gg/DPBO0yeCnISE2XJQEcQxZZj5FdCF1vNYiY2Y7eH2+Qepxp2SKDur
	AN4EV23pD4rMGnk/s3WEZnDgnAZqVB6ONXa1ThpuCqXY+2j+72ja9PTYc7tsL8SL9cb7jt4SSeemt
	ZC5zGJTI4wAVWXlJYWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLiCq-0000000Gg4p-33AT;
	Mon, 24 Jun 2024 11:49:57 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLiCn-0000000Gg49-2bC0
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 11:49:55 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-63186c222eeso38735637b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 04:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719229792; x=1719834592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd5I5Sm5SEEI9bJESKa04ZiDJHwtLURV9qvtnPEr1Cw=;
        b=ShspZaR2M50VCgST+joOGcpmUbZvJNNW33YE6FCbJRsIWHUchETT1d2ZdDYURwat9E
         CsMDzP5+FNR57kEbPHNTIyhvgIOy4JlgI3NfGQAWFpPzm3PKtiUDUyRGBZeBLXltWniD
         M2JclU5a7JSaAKZ7ieKPdTZPH7dQFNkJH1Nd/4Gsq5olehpBHDDI6ae8DwheVRicJ0XB
         k9lpodUTY/OSNck4oOn42YRCUP5p9nSr6KHkvSHepv+WTIDV2hpZOHEXRNTjXOxldhqh
         kZ33LVDL3wqiGwzKuRMxr8scuvknOLdhJv1ivd511TCq8BGKgvnmWyh+0+Noxe+mCFRn
         i0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719229792; x=1719834592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd5I5Sm5SEEI9bJESKa04ZiDJHwtLURV9qvtnPEr1Cw=;
        b=feE4hFlqzi16n1ctwdbx5Xffp2Klqcq5jmEgWyjvNgtLa/AsRCHBYlDtiQZMKAZQUU
         fQEtB2Mat/hmG4x18QLQO+vxu38lueBK95yicdrkEEz2rGpICFN4tvJ4a+NUQVZ5qjGj
         6gZWYw+4YMrDYPdwC43xxDw+n2nKg9k+eRsXtB7GOIqmGDbgrE7kOafPmUYYmohZtXcr
         AeKTRziISpAMge+CweTUjw0eguIcwznf8O+vHGt9XE/1y6XdSdLTYO3Y99xKLJZEAfFF
         6+QAnTe1nGmWrwpiItkBJx1IDYmGVLAcdYfMVM6oOvug7FCrOVXNdWpfWqlR8BBQMMVl
         SNVg==
X-Forwarded-Encrypted: i=1; AJvYcCUpMIfwc6INf12bLHwhTTpNhhc1eLr9KjSY+3syuWFXTxNrpLt7t24PPqnBxXtkKW/G6sgP6bkhhyIove3dTYbqvU4+OH5qjGAOhYxChbT7
X-Gm-Message-State: AOJu0YzYr9ivP5dPWY+Kp/K2FyvK3SKiwAM5l0GpCNnMUfgGKxY7zXSm
	WyLxgTETmB+D2r/uh+6/2tB/w/jFQT+O6HT6q/ex+t6c5f03lCwBzREwsA0pRt74lMDlfCOTdat
	/4UycsKnUhRq0qmVwfsqu9YmY0RxvPnLaih9FMQ==
X-Google-Smtp-Source: AGHT+IGJjTrlmcRbQh6/kbNdxg9y/Oeu+nWF3lYXzODXDhrNFp8r1QHIEdwFpED/HofduNZ7d6h1p7TJUAIO6YF8oeQ=
X-Received: by 2002:a81:9288:0:b0:62c:efa2:a091 with SMTP id
 00721157ae682-643aaa88c36mr39059547b3.14.1719229792054; Mon, 24 Jun 2024
 04:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240624082141.153871-1-alexghiti@rivosinc.com>
In-Reply-To: <20240624082141.153871-1-alexghiti@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 24 Jun 2024 19:49:41 +0800
Message-ID: <CABgGipXR6ETkH0w-8GG8uBtKbG5jvD0VHz-A-VnXFPgvqrd6Lw@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: patch: Flush the icache right after
 patching to avoid illegal insns
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_044953_720080_D1738ADE 
X-CRM114-Status: GOOD (  23.00  )
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

SGkgQWxleCwKCk9uIE1vbiwgSnVuIDI0LCAyMDI0IGF0IDQ6MjHigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gV2UgY2Fubm90IGRlbGF5IHRo
ZSBpY2FjaGUgZmx1c2ggYWZ0ZXIgcGF0Y2hpbmcgc29tZSBmdW5jdGlvbnMgYXMgd2UgbWF5Cj4g
aGF2ZSBwYXRjaGVkIGEgZnVuY3Rpb24gdGhhdCB3aWxsIGdldCBjYWxsZWQgYmVmb3JlIHRoZSBp
Y2FjaGUgZmx1c2guCj4KPiBUaGUgb25seSB3YXkgdG8gY29tcGxldGVseSBhdm9pZCBzdWNoIHNj
ZW5hcmlvIGlzIGJ5IGZsdXNoaW5nIHRoZSBpY2FjaGUKPiBhcyBzb29uIGFzIHdlIHBhdGNoIGEg
ZnVuY3Rpb24uIFRoaXMgd2lsbCBwcm9iYWJseSBiZSBjb3N0bHkgYXMgd2UgZG9uJ3QKPiBiYXRj
aCB0aGUgaWNhY2hlIG1haW50ZW5hbmNlIGFueW1vcmUuCj4KPiBGaXhlczogNmNhNDQ1ZDhhZjBl
ICgicmlzY3Y6IEZpeCBlYXJseSBmdHJhY2Ugbm9wIHBhdGNoaW5nIikKPiBSZXBvcnRlZC1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBDbG9zZXM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNjEzLWx1YnJpY2FudC1icmVhdGgt
MDYxMTkyYTk0ODlhQHdlbmR5Lwo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxl
eGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMg
fCAgNyArKy0tLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgIHwgMjYgKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAx
MyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2Uu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4gaW5kZXggODdjYmQ4NjU3NmIyLi40Yjk1
YzU3NGZkMDQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwo+IEBAIC0xMjAsOSArMTIwLDYgQEAgaW50IGZ0
cmFjZV9pbml0X25vcChzdHJ1Y3QgbW9kdWxlICptb2QsIHN0cnVjdCBkeW5fZnRyYWNlICpyZWMp
Cj4gICAgICAgICBvdXQgPSBmdHJhY2VfbWFrZV9ub3AobW9kLCByZWMsIE1DT1VOVF9BRERSKTsK
PiAgICAgICAgIG11dGV4X3VubG9jaygmdGV4dF9tdXRleCk7Cj4KPiAtICAgICAgIGlmICghbW9k
KQo+IC0gICAgICAgICAgICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfcmFuZ2UocmVjLT5pcCwgcmVj
LT5pcCArIE1DT1VOVF9JTlNOX1NJWkUpOwo+IC0KPiAgICAgICAgIHJldHVybiBvdXQ7Cj4gIH0K
Pgo+IEBAIC0xNTYsOSArMTUzLDkgQEAgc3RhdGljIGludCBfX2Z0cmFjZV9tb2RpZnlfY29kZSh2
b2lkICpkYXRhKQo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgd2hpbGUgKGF0
b21pY19yZWFkKCZwYXJhbS0+Y3B1X2NvdW50KSA8PSBudW1fb25saW5lX2NwdXMoKSkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsKPiAtICAgICAgIH0KPgo+IC0gICAgICAg
bG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpOwo+ICsgICAgICAgICAgICAgICBsb2NhbF9mbHVzaF9p
Y2FjaGVfYWxsKCk7Cj4gKyAgICAgICB9CgpTb3JyeSwgbWF5YmUgSSBzaG91bGQgcG9pbnQgaXQg
b3V0IGRpcmVjdGx5IGVhcmxpZXIuIEJ1dCBJIGRvbid0IHRoaW5rCnRoaXMgZGlmZiBjaHVuayBp
cyByZXF1aXJlZC4gVGhyZWFkcyBydW5uaW5nIGluIHRoZSBlbHNlIGNsYXVzZSBmcm9tCnN0b3Bf
bWFjaGluZSBtdXN0IG5vdCBydW4gaW50byBhbnkgcGF0Y2hhYmxlIGVudHJ5LiBJZiBpdCBydW5z
IGludG8gYQpwYXRjaGFibGUgZW50cnksIHJ1bm5pbmcgdGhlIGxvY2FsIGZlbmNlLmkgaXMgbm90
IGdvaW5nIHRvIGZpeCB0aGUKcHJvYmxlbS4KCj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9wYXRjaC5jCj4gaW5kZXggNDAwNzU2M2ZiNjA3Li5hYjAzNzMyZDA2YzQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Bh
dGNoLmMKPiBAQCAtODksNiArODksMTQgQEAgc3RhdGljIGludCBfX3BhdGNoX2luc25fc2V0KHZv
aWQgKmFkZHIsIHU4IGMsIHNpemVfdCBsZW4pCj4KPiAgICAgICAgIG1lbXNldCh3YWRkciwgYywg
bGVuKTsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFdlIGNvdWxkIGhhdmUganVzdCBwYXRj
aGVkIGEgZnVuY3Rpb24gdGhhdCBpcyBhYm91dCB0byBiZQo+ICsgICAgICAgICogY2FsbGVkIHNv
IG1ha2Ugc3VyZSB3ZSBkb24ndCBleGVjdXRlIHBhcnRpYWxseSBwYXRjaGVkCj4gKyAgICAgICAg
KiBpbnN0cnVjdGlvbnMgYnkgZmx1c2hpbmcgdGhlIGljYWNoZSBhcyBzb29uIGFzIHBvc3NpYmxl
Lgo+ICsgICAgICAgICovCj4gKyAgICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfcmFuZ2UoKHVuc2ln
bmVkIGxvbmcpd2FkZHIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2ln
bmVkIGxvbmcpd2FkZHIgKyBsZW4pOwo+ICsKPiAgICAgICAgIHBhdGNoX3VubWFwKEZJWF9URVhU
X1BPS0UwKTsKPgo+ICAgICAgICAgaWYgKGFjcm9zc19wYWdlcykKPiBAQCAtMTM1LDYgKzE0Mywx
NCBAQCBzdGF0aWMgaW50IF9fcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lk
ICppbnNuLCBzaXplX3QgbGVuKQo+Cj4gICAgICAgICByZXQgPSBjb3B5X3RvX2tlcm5lbF9ub2Zh
dWx0KHdhZGRyLCBpbnNuLCBsZW4pOwo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogV2UgY291
bGQgaGF2ZSBqdXN0IHBhdGNoZWQgYSBmdW5jdGlvbiB0aGF0IGlzIGFib3V0IHRvIGJlCj4gKyAg
ICAgICAgKiBjYWxsZWQgc28gbWFrZSBzdXJlIHdlIGRvbid0IGV4ZWN1dGUgcGFydGlhbGx5IHBh
dGNoZWQKPiArICAgICAgICAqIGluc3RydWN0aW9ucyBieSBmbHVzaGluZyB0aGUgaWNhY2hlIGFz
IHNvb24gYXMgcG9zc2libGUuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGxvY2FsX2ZsdXNoX2lj
YWNoZV9yYW5nZSgodW5zaWduZWQgbG9uZyl3YWRkciwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAodW5zaWduZWQgbG9uZyl3YWRkciArIGxlbik7Cj4gKwo+ICAgICAgICAgcGF0
Y2hfdW5tYXAoRklYX1RFWFRfUE9LRTApOwo+Cj4gICAgICAgICBpZiAoYWNyb3NzX3BhZ2VzKQo+
IEBAIC0xODksOSArMjA1LDYgQEAgaW50IHBhdGNoX3RleHRfc2V0X25vc3luYyh2b2lkICphZGRy
LCB1OCBjLCBzaXplX3QgbGVuKQo+Cj4gICAgICAgICByZXQgPSBwYXRjaF9pbnNuX3NldCh0cCwg
YywgbGVuKTsKPgo+IC0gICAgICAgaWYgKCFyZXQpCj4gLSAgICAgICAgICAgICAgIGZsdXNoX2lj
YWNoZV9yYW5nZSgodWludHB0cl90KXRwLCAodWludHB0cl90KXRwICsgbGVuKTsKPiAtCj4gICAg
ICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gIE5PS1BST0JFX1NZTUJPTChwYXRjaF90ZXh0X3NldF9u
b3N5bmMpOwo+IEBAIC0yMjQsOSArMjM3LDYgQEAgaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQg
KmFkZHIsIGNvbnN0IHZvaWQgKmluc25zLCBzaXplX3QgbGVuKQo+Cj4gICAgICAgICByZXQgPSBw
YXRjaF9pbnNuX3dyaXRlKHRwLCBpbnNucywgbGVuKTsKPgo+IC0gICAgICAgaWYgKCFyZXQpCj4g
LSAgICAgICAgICAgICAgIGZsdXNoX2ljYWNoZV9yYW5nZSgodWludHB0cl90KSB0cCwgKHVpbnRw
dHJfdCkgdHAgKyBsZW4pOwo+IC0KPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAgTk9LUFJP
QkVfU1lNQk9MKHBhdGNoX3RleHRfbm9zeW5jKTsKPiBAQCAtMjUzLDkgKzI2Myw5IEBAIHN0YXRp
YyBpbnQgcGF0Y2hfdGV4dF9jYih2b2lkICpkYXRhKQo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAg
ICAgICAgICAgICAgd2hpbGUgKGF0b21pY19yZWFkKCZwYXRjaC0+Y3B1X2NvdW50KSA8PSBudW1f
b25saW5lX2NwdXMoKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsKPiAt
ICAgICAgIH0KPgo+IC0gICAgICAgbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpOwo+ICsgICAgICAg
ICAgICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCk7Cj4gKyAgICAgICB9Cj4KPiAgICAgICAg
IHJldHVybiByZXQ7Cj4gIH0KPiAtLQo+IDIuMzkuMgo+CgpUaGFua3MsCkFuZHkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
