Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF02C3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xh/Fhw82PrIg6lrrV1DZrXEkNkH8DibrJoyYa9yN7lA=; b=OGOWSw3fU5vdAW
	05uOGES6RHZFfmTZSjO/eG48YZfUHes5h9HgprYOQAOvEW990BOzlB8FXVfyG9pkGonVYIsuWP9lH
	thIf6uFwrT49/36Evi3fHOamOlW0cLUaiI2UYfm6nMxDslkPqkQD39E59DtjVrE8LXdu6cCie7Kn+
	n1E6C469GWxScuqONrTOZ6LNDLHcmIh/OkI+usAi7qF4CK7hA4aBx4xCYTDv/hLWIFoQFQGgGjXzX
	M3NX4vf5UV9eSnlVcqRKhRBTBwDZz7xjDv7eBLLeCc2AvIz72J3udTkwy+9CaUOSYZ772DrrJx5Ax
	Hn/SdrUG3NsKqKTN6tZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR5yd-00000006LWv-3hio;
	Tue, 09 Jul 2024 08:13:31 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR5yZ-00000006LVu-3yvq
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 08:13:29 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e035ecb35ffso4525200276.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 01:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720512805; x=1721117605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWy5fM+Bn3PboFhjLeCT4KQSpv1r3KOtQtodjbe9XhQ=;
        b=Mnr2Jypv+xUTWPUly/yJx8OatNnhgvvXcZNbcQADyxNvpS2F0TGpyrHb/i3wA/0qhB
         zP/rhtWg8oJi51RCbEW8V5Y3RTNqRhqUOGImWf018+3Fh8dIpYlieetebgqX45yKmE9q
         KJHbt0l5VFsQqsvfPtb4WT86NDuCBOfYrhsU6kx7nRPsh/4vzft8JOHXc0d4PG78EPtg
         9soo20RiTRxfHYZqqSzl8gYK3lttz5Tp/xYyRHU6MYGuGdbxYpbC2MjfKmXiEy9ZUabP
         C3yDOLugGbqPSFJ0YNRksWhnMgyJOh9YoFQQSSfIkuztTtaba8RzG6yLreOaKRe2ttuk
         2FBA==
X-Forwarded-Encrypted: i=1; AJvYcCXm6NfPJZznU7U9+LgMfL1TC9Tm8N3MSS0le3g2w++QEII9bQjWK9bvZ0xT4m3J11P26HaeOnAi0e4Gp4qf6Iw/s5ohG+K2+W4lSRjnv2xa
X-Gm-Message-State: AOJu0Yz7AnhkA07xbfNcIUxkE5MFGx6UOswqjKE7CTc8dC6l5T3u1TNE
	zSzGPmgKa+0C1Ts+++lvLHVwleyYI/DzcMNt9My4Epdqa7RESEE+3QjFFKIPj9Y=
X-Google-Smtp-Source: AGHT+IFFXTwgnNXbnaYJLig9eORGvZ7PchV6vLT2YsMEOXdYNtFbtD7gIEqzIyfROaZDgLckXO4Vrw==
X-Received: by 2002:a0d:ea8f:0:b0:646:4057:a7c2 with SMTP id 00721157ae682-658eed5fbe8mr21644777b3.15.1720512804811;
        Tue, 09 Jul 2024 01:13:24 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e69da2a7sm2730027b3.115.2024.07.09.01.13.23
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 01:13:24 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6504101cfd6so43667607b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 01:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVirjqIKESN2hz6Ym9Zc1nL5FWQ2urWzBcMplDuCc2f5zROdSyyf8RIDVuKIiZLD4PvwW8r2Q4foKuF3TJDLA4ed5buQDo8O71D9u13M/zh
X-Received: by 2002:a81:7cd6:0:b0:61a:ccb0:7cdd with SMTP id
 00721157ae682-658f07d7740mr22170947b3.46.1720512803761; Tue, 09 Jul 2024
 01:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240624082141.153871-1-alexghiti@rivosinc.com>
In-Reply-To: <20240624082141.153871-1-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jul 2024 10:13:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwx=rU2MWhFTE6KhYHm64phxx2Y6u05-aBLGfeG5696A@mail.gmail.com>
Message-ID: <CAMuHMdUwx=rU2MWhFTE6KhYHm64phxx2Y6u05-aBLGfeG5696A@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: patch: Flush the icache right after
 patching to avoid illegal insns
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_011328_012838_6FE0F219 
X-CRM114-Status: GOOD (  20.54  )
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

SGkgQWxleGFuZHJlLAoKT24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgMTA6MjPigK9BTSBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+IFdlIGNhbm5vdCBkZWxh
eSB0aGUgaWNhY2hlIGZsdXNoIGFmdGVyIHBhdGNoaW5nIHNvbWUgZnVuY3Rpb25zIGFzIHdlIG1h
eQo+IGhhdmUgcGF0Y2hlZCBhIGZ1bmN0aW9uIHRoYXQgd2lsbCBnZXQgY2FsbGVkIGJlZm9yZSB0
aGUgaWNhY2hlIGZsdXNoLgo+Cj4gVGhlIG9ubHkgd2F5IHRvIGNvbXBsZXRlbHkgYXZvaWQgc3Vj
aCBzY2VuYXJpbyBpcyBieSBmbHVzaGluZyB0aGUgaWNhY2hlCj4gYXMgc29vbiBhcyB3ZSBwYXRj
aCBhIGZ1bmN0aW9uLiBUaGlzIHdpbGwgcHJvYmFibHkgYmUgY29zdGx5IGFzIHdlIGRvbid0Cj4g
YmF0Y2ggdGhlIGljYWNoZSBtYWludGVuYW5jZSBhbnltb3JlLgo+Cj4gRml4ZXM6IDZjYTQ0NWQ4
YWYwZSAoInJpc2N2OiBGaXggZWFybHkgZnRyYWNlIG5vcCBwYXRjaGluZyIpCj4gUmVwb3J0ZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gQ2xvc2VzOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDYxMy1sdWJyaWNhbnQtYnJl
YXRoLTA2MTE5MmE5NDg5YUB3ZW5keS8KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlz
IG5vdyBjb21taXQgZWRmMmQ1NDZiZmQ2ZjVjNCAoInJpc2N2OgpwYXRjaDogRmx1c2ggdGhlIGlj
YWNoZSByaWdodCBhZnRlciBwYXRjaGluZyB0byBhdm9pZCBpbGxlZ2FsCmluc25zIikgaW4gdjYu
MTAtcmM2LgoKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcGF0Y2guYwo+IEBAIC0xODksOSArMjA1LDYgQEAgaW50IHBhdGNoX3RleHRf
c2V0X25vc3luYyh2b2lkICphZGRyLCB1OCBjLCBzaXplX3QgbGVuKQo+Cj4gICAgICAgICByZXQg
PSBwYXRjaF9pbnNuX3NldCh0cCwgYywgbGVuKTsKPgo+IC0gICAgICAgaWYgKCFyZXQpCj4gLSAg
ICAgICAgICAgICAgIGZsdXNoX2ljYWNoZV9yYW5nZSgodWludHB0cl90KXRwLCAodWludHB0cl90
KXRwICsgbGVuKTsKPiAtCj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gIE5PS1BST0JFX1NZ
TUJPTChwYXRjaF90ZXh0X3NldF9ub3N5bmMpOwoKcGF0Y2hfdGV4dF9zZXRfbm9zeW5jKCkgaXMg
bm93IGlkZW50aWNhbCB0byAoc3RhdGljKSBwYXRjaF9pbnNuX3NldCgpLAphbmQgdGhlIGxhdHRl
ciBoYXMgbm8gb3RoZXIgY2FsbGVycy4KCj4gQEAgLTIyNCw5ICsyMzcsNiBAQCBpbnQgcGF0Y2hf
dGV4dF9ub3N5bmModm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbnMsIHNpemVfdCBsZW4pCj4K
PiAgICAgICAgIHJldCA9IHBhdGNoX2luc25fd3JpdGUodHAsIGluc25zLCBsZW4pOwo+Cj4gLSAg
ICAgICBpZiAoIXJldCkKPiAtICAgICAgICAgICAgICAgZmx1c2hfaWNhY2hlX3JhbmdlKCh1aW50
cHRyX3QpIHRwLCAodWludHB0cl90KSB0cCArIGxlbik7Cj4gLQo+ICAgICAgICAgcmV0dXJuIHJl
dDsKPiAgfQo+ICBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfdGV4dF9ub3N5bmMpOwoKcGF0Y2hfdGV4
dF9ub3N5bmMoKSBpcyBub3cgaWRlbnRpY2FsIHRvIHBhdGNoX2luc25fd3JpdGUoKSwgYW5kIGJv
dGgKZnVuY3Rpb25zIGFyZSBjYWxsZWQgZnJvbSBvdXRzaWRlIHRoaXMgZmlsZS4KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
