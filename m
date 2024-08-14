Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F75C531DC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79ABnsB56PM0iulcxfrYvpvRQRELgzOEH7Yi2aPjM1U=; b=j8+eeT7doWQ1be
	UrQ3PoFRczWTS54eYQ+4Q4or+6a3YOcHmIqhg8XUPLxj6U1j0uqHjkmh2aADcamgrbVH2yyieJoUT
	Y+0YiQjCs4pGAjWAYoFYiKFjW+yRHm/4VBS716i1VPeFWWYr6/3CtX72ooifP8qJ4OscsPHZv+hoB
	O/hhhli50+GVM1G02R0g3STXM7I7kobJpKT9/jitUhLJjGPklItX4peai+aL8/XKkARlo6KFEIqX+
	HX/Oaw0w5weazN3ZDYSghFFrDlmvmPF/8SSqhUC9I9ZukpmgO24g6uF43lYUunOvR8QsLbyTy7HU/
	utSc1nNWqNPjOIhb4ZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGWq-00000007b30-0f0q;
	Wed, 14 Aug 2024 16:07:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGTw-00000007aYD-2iEv;
	Wed, 14 Aug 2024 16:04:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-428243f928fso67441505e9.0;
        Wed, 14 Aug 2024 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723651455; x=1724256255; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YUv+UEK7DbXaXmZeHJkOXNJ/5IGPTcl3OKytRpyoA0=;
        b=X9+00+fEcuZ6f0SpqtSQmXD7Ivrmb08iC5tawkqOXapsTAvdSOYVS5wSU/YuEEr0+e
         WWsKuwyaqzkczCfX823sZQYIip9OqMSMMR8sixY4DSoZgsIHCaMPYXLLuBgkQaD6SiKJ
         5F8ZwxnAhfDiskdxkxz5TBRgZ44ck8+arMLUtGFV+yGkQbhzmxn+6nrh8Ls4qj9pWb8j
         hGBkehp4nXFeOK5SXIiLYQr0wj6vpHu+M0162iSkeKmPLHKAwvBKPROlLZj3OkkT5dPS
         HDBQRYE8Z2HbZRBkQuXwLrdjw9s6uSKaLgPrM8BLRM4Uaj3gWCv6kA8Y9CbPdfjTzzaI
         mffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723651455; x=1724256255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YUv+UEK7DbXaXmZeHJkOXNJ/5IGPTcl3OKytRpyoA0=;
        b=IBeeLf7sQpmSVbE2uO3USTdVFb7kMxPlbYSHGPnwzFQtSBxfuPcw1YAa7fhoLnbTfR
         yKWEmyrX0Lfotje5XnKa6WjDO0AQXDVy+Q87MBP6USPjTeW0J1SN8Lhh2MMYzNat46sK
         GXTYtZzz/oxcUcfdSxz1EawCVGvvxK/JW6ncy/nHDgrBB3gnklJmAxOn5uy5B9knxqKu
         nU+6xLc77CwdlLWQjuBtnPIUK6yae7wXg0sgUWxnN4Thl4xn3i5LcgkYlAd8ErrpiZBs
         V7aFOe14ErYfgV8aSijbc1c93FAaFZFRQRKFYSv4RFI9qCpfrxGW856hQ9Ls/VpzKy3H
         5VDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDZSskmjbvC6ghfhnLacxI+K8TcgG/5G54ZfOvow70tiUKBMrzH/pJukOjTqObLRbJc1WupRHVyRHugaE7lhb+@lists.infradead.org, AJvYcCXHyw4YjTbYpu0v6JuEaU8yBvp6OY4CvdzOTqvqthVSJpnSzpr4AmjB6bgQeXjWaHy/jmKKmj9YSkIKZmc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrD4TwV4yvtPuCCmVSlbeYVtE1vHeL1Is3eQOE5XLPFHEk2pY0
	Fvo1PzZMgt2dic8SeH9rhR7X4YZMsoHyy6kn6oXPQZnO/9CzbFG/rto4ZyMnULDunaRW5JUWaVj
	QCi8qotlJMo55SBRx/nMFckuzFUI=
X-Google-Smtp-Source: AGHT+IHieo20VqQV/NrE6RTDvC7T1ETRDy8XNxidtBA8vAjYT38DsBpFNCl6GoRE46mrcwlVyuYfQfB7LOR98Ajqch0=
X-Received: by 2002:a05:600c:3b88:b0:426:5520:b835 with SMTP id
 5b1f17b1804b1-429dd22f28cmr29544235e9.5.1723651455149; Wed, 14 Aug 2024
 09:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240814085618.968833-1-samuel.holland@sifive.com> <20240814085618.968833-8-samuel.holland@sifive.com>
In-Reply-To: <20240814085618.968833-8-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 14 Aug 2024 18:04:04 +0200
Message-ID: <CA+fCnZeHmfeQHDMFqELnPA-LNhWoKwxAKEPsEEBDCdoD9SEHwg@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] kasan: sw_tags: Support runtime stack tagging
 control for RISC-V
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_090416_731190_1B0D2318 
X-CRM114-Status: GOOD (  17.20  )
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

T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMTA6NTbigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGFsbG93cyB0aGUga2VybmVsIHRv
IGJvb3Qgb24gc3lzdGVtcyB3aXRob3V0IHBvaW50ZXIgbWFza2luZwo+IHN1cHBvcnQgd2hlbiBz
dGFjayB0YWdnaW5nIGlzIGVuYWJsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFu
ZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXkgS29ub3Zh
bG92IDxhbmRyZXlrbnZsQGdtYWlsLmNvbT4KCkJ1dCBzZWUgYSBuaXQgYmVsb3cuCgo+IC0tLQo+
Cj4gIG1tL2thc2FuL2thc2FuLmggICAgICAgfCAyICsrCj4gIG1tL2thc2FuL3N3X3RhZ3MuYyAg
ICAgfCA5ICsrKysrKysrKwo+ICBzY3JpcHRzL01ha2VmaWxlLmthc2FuIHwgNSArKysrKwo+ICAz
IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9tbS9rYXNh
bi9rYXNhbi5oIGIvbW0va2FzYW4va2FzYW4uaAo+IGluZGV4IGZiMmI5YWMwNjU5YS4uMDFlOTQ1
Y2IxMTFkIDEwMDY0NAo+IC0tLSBhL21tL2thc2FuL2thc2FuLmgKPiArKysgYi9tbS9rYXNhbi9r
YXNhbi5oCj4gQEAgLTYzMCw2ICs2MzAsOCBAQCB2b2lkICpfX2FzYW5fbWVtc2V0KHZvaWQgKmFk
ZHIsIGludCBjLCBzc2l6ZV90IGxlbik7Cj4gIHZvaWQgKl9fYXNhbl9tZW1tb3ZlKHZvaWQgKmRl
c3QsIGNvbnN0IHZvaWQgKnNyYywgc3NpemVfdCBsZW4pOwo+ICB2b2lkICpfX2FzYW5fbWVtY3B5
KHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywgc3NpemVfdCBsZW4pOwo+Cj4gK3U4IF9faHdh
c2FuX2dlbmVyYXRlX3RhZyh2b2lkKTsKPiArCj4gIHZvaWQgX19od2FzYW5fbG9hZDFfbm9hYm9y
dCh2b2lkICopOwo+ICB2b2lkIF9faHdhc2FuX3N0b3JlMV9ub2Fib3J0KHZvaWQgKik7Cj4gIHZv
aWQgX19od2FzYW5fbG9hZDJfbm9hYm9ydCh2b2lkICopOwo+IGRpZmYgLS1naXQgYS9tbS9rYXNh
bi9zd190YWdzLmMgYi9tbS9rYXNhbi9zd190YWdzLmMKPiBpbmRleCAyMjBiNWQ0YzY4NzYuLjMy
NDM1ZDMzNTgzYSAxMDA2NDQKPiAtLS0gYS9tbS9rYXNhbi9zd190YWdzLmMKPiArKysgYi9tbS9r
YXNhbi9zd190YWdzLmMKPiBAQCAtNzAsNiArNzAsMTUgQEAgdTgga2FzYW5fcmFuZG9tX3RhZyh2
b2lkKQo+ICAgICAgICAgcmV0dXJuICh1OCkoc3RhdGUgJSAoS0FTQU5fVEFHX01BWCArIDEpKTsK
PiAgfQo+Cj4gK3U4IF9faHdhc2FuX2dlbmVyYXRlX3RhZyh2b2lkKQo+ICt7Cj4gKyAgICAgICBp
ZiAoIWthc2FuX2VuYWJsZWQoKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIEtBU0FOX1RBR19L
RVJORUw7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGthc2FuX3JhbmRvbV90YWcoKTsKPiArfQo+ICtF
WFBPUlRfU1lNQk9MKF9faHdhc2FuX2dlbmVyYXRlX3RhZyk7Cj4gKwo+ICBib29sIGthc2FuX2No
ZWNrX3JhbmdlKGNvbnN0IHZvaWQgKmFkZHIsIHNpemVfdCBzaXplLCBib29sIHdyaXRlLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmV0X2lwKQo+ICB7Cj4gZGlmZiAt
LWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUua2FzYW4gYi9zY3JpcHRzL01ha2VmaWxlLmthc2FuCj4g
aW5kZXggMzkwNjU4YTJkNWI3Li5mNjRjMWFjYTNlOTcgMTAwNjQ0Cj4gLS0tIGEvc2NyaXB0cy9N
YWtlZmlsZS5rYXNhbgo+ICsrKyBiL3NjcmlwdHMvTWFrZWZpbGUua2FzYW4KPiBAQCAtNzMsNiAr
NzMsMTEgQEAgaWZlcSAoJChjYWxsIGNsYW5nLW1pbi12ZXJzaW9uLCAxNTAwMDApJChjYWxsIGdj
Yy1taW4tdmVyc2lvbiwgMTMwMDAwKSx5KQo+ICBDRkxBR1NfS0FTQU4gKz0gJChjYWxsIGNjLXBh
cmFtLGh3YXNhbi1rZXJuZWwtbWVtLWludHJpbnNpYy1wcmVmaXg9MSkKPiAgZW5kaWYKPgo+ICsj
IFJJU0MtViByZXF1aXJlcyBkeW5hbWljYWxseSBkZXRlcm1pbmluZyBpZiBzdGFjayB0YWdnaW5n
IGNhbiBiZSBlbmFibGVkLgo+ICtpZmRlZiBDT05GSUdfUklTQ1YKPiArQ0ZMQUdTX0tBU0FOICs9
ICQoY2FsbCBjYy1wYXJhbSxod2FzYW4tZ2VuZXJhdGUtdGFncy13aXRoLWNhbGxzPTEpCgpMZXQn
cyBpbmRlbnQgdGhpcyBsaW5lIGJ5IDEgdGFiIChJIGFscmVhZHkgc2VudCBhIHBhdGNoIHRoYXQg
Zml4ZXMKaW5kZW50YXRpb24gaW4gdGhlIG90aGVyIHBhcnRzIG9mIHRoaXMgTWFrZWZpbGUgWzFd
KS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8yMDI0MDgxMzIyNDAyNy44
NDUwMy0xLWFuZHJleS5rb25vdmFsb3ZAbGludXguZGV2L1QvI3UKCgo+ICtlbmRpZgo+ICsKPiAg
ZW5kaWYgIyBDT05GSUdfS0FTQU5fU1dfVEFHUwo+Cj4gIGV4cG9ydCBDRkxBR1NfS0FTQU4gQ0ZM
QUdTX0tBU0FOX05PU0FOSVRJWkUKPiAtLQo+IDIuNDUuMQo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
