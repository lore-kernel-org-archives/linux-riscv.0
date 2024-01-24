Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B007C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 02:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jb+dXDDKZAGUdFJMDlbbA8IUgmarB0S78Irdd4uDX3c=; b=EI2jQZmeiEyIn7
	KMFA+tFPebZ1sUyO7vxsK4lMv9bi+k/EtPFRDzbsw/8Y68YByki1BEZW1SBA4ruoGIjssr26OLRN9
	0ffrXe5DAfIjWuJYTfhN4H55v3BdJxYwG0CufqIFzhVk8hFtfR3VQv79XKQDep2fO97oD81DKLsc4
	9Ng4JKhU6sWqCc3iszVJ39bxJM8F1IxAzuIhLY3NZLLesqIooUVEjHLG2X9eMAL5tzkjxYolYRIma
	6NKyP5ZCyGwq0w55sZ6RG5yD8d4tKIsCNh9OEwlo20dYfE/g75ITeQt9hfIvuhrKoLBE7R33zsM64
	wKdupOxblgyLmUcWHX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTGg-001BKF-2V;
	Wed, 24 Jan 2024 02:45:34 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTGc-001BHu-2e
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 02:45:32 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e0eb1cf1f5so1466519a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 18:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706064264; x=1706669064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLStPRDEUuipPewqlBuPtKmABGx0U3Grm+aWQKSFKf8=;
        b=VNKqqeRU2IATRUGr//4Q0dJTt74MN87cu6rkeqgErIg16CJD8ZxF2JjQhhUoV0mKAI
         GtKwejXqsepxm5LwtgZEhp5O8WyupIXX5pZBFAKPikvtsmK2ZPyM0hVgBOWK+5a5rmIw
         9fiQKmzYvLtSz2/Lp65SJ8d0kwYz0k+GdN2aMeeCC6KT2aUbV1pvrtIgIHmgfC256qJZ
         mSmmqwuQYbd/XXZ7pgGoOrW5NJ0InwnbzP0Tl6mcpj7ujCEeHMdDi9eNlfm4OdX+bBAE
         QmmnajLiFSy90gH1eVeBJSbyk+IEYoj6VnLiS8j4SDs1sCHKDgJgC/9kElZ8YEVtKm6B
         1a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706064264; x=1706669064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLStPRDEUuipPewqlBuPtKmABGx0U3Grm+aWQKSFKf8=;
        b=b42/2pO9mFirDE5Y6DOrKc/AXltzBHonlo0pOFoDA7d2Xs0FDYAlFEx6gb5z2yKMCR
         hhB8OdP2OWHxkc01641SOcNB+Dk8/xPYayPR+opWe6ZvM++vIaqaw0puexQt4WdxL6V4
         jpAQKv6lJA84CWfocniZwVBK5471Y7pmG2MD3IxK72g8cmrKaMhNBAXTHgWDdPFCvl8C
         983f53P2JZDATgVktTYAMHPAndxmJQ/7HfBpzQ627GlsP9UuQJebcaw8CqIS6yrx4Nl0
         WqEc0MXp7wzhdo5LJOTJmeLuGa0FU1s0BnKPa9KK3N/FAB7DXLWJ42x6vxdh3W9WkVZe
         8xpw==
X-Gm-Message-State: AOJu0Yy4xFRK0cyJcIPBRp2Hz6RWvawXQng1uv1auPg/07eiMSd44QkW
	CTLfjavhPc11gTEpwEnE5DxvDmfnq+HXxyR8zWtdj+RUWFvAV41bc4WCrVZcxZez0geixXCO6Aq
	CbAa4nbyuBZz066NWnrUg0dh9CATaWksgj1SItg==
X-Google-Smtp-Source: AGHT+IFqvahBMjknexU3UQEvvfPE6ZUeOFepSNYttsSFqeDVjZXoJr47EtHe5S11okcMDhN0dF7pfISUrhdsjk24sFQ=
X-Received: by 2002:a05:6870:a90c:b0:206:c95d:fcc5 with SMTP id
 eq12-20020a056870a90c00b00206c95dfcc5mr2297811oab.108.1706064263853; Tue, 23
 Jan 2024 18:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20240123132730.2297719-1-alexghiti@rivosinc.com>
In-Reply-To: <20240123132730.2297719-1-alexghiti@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 24 Jan 2024 10:44:12 +0800
Message-ID: <CAEEQ3wk5edUFTuE3H3KDGkCXj0+=i7Z1BM2M+6X-Tk9_m8X_iQ@mail.gmail.com>
Subject: Re: [External] [PATCH] riscv: Fix wrong size passed to local_flush_tlb_range_asid()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dennis Zhou <dennis@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_184531_190404_DB41EAFD 
X-CRM114-Status: GOOD (  17.07  )
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

SGkgQWxleGFuZHJlLAoKT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgOTozMeKAr1BNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBsb2NhbF9mbHVzaF90
bGJfcmFuZ2VfYXNpZCgpIHRha2VzIHRoZSBzaXplIGFzIGFyZ3VtZW50LCBub3QgdGhlIGVuZCBv
Zgo+IHRoZSByYW5nZSB0byBmbHVzaCwgc28gZml4IHRoaXMgYnkgY29tcHV0aW5nIHRoZSBzaXpl
IGZyb20gdGhlIGVuZCBhbmQKPiB0aGUgc3RhcnQgb2YgdGhlIHJhbmdlLgo+Cj4gRml4ZXM6IDdh
OTJmYzhiNGQyMCAoIm1tOiBJbnRyb2R1Y2UgZmx1c2hfY2FjaGVfdm1hcF9lYXJseSgpIikKPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4g
LS0tCj4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gaW5kZXggOGQxMmIy
NmY1YWMzLi45NjE5OTY1ZjY1MDEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVz
aC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gQEAgLTY4LDcgKzY4LDcgQEAg
c3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHVuc2lnbmVkIGxv
bmcgc3RhcnQsCj4KPiAgdm9pZCBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVk
IGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICB7Cj4gLSAgICAgICBsb2NhbF9mbHVz
aF90bGJfcmFuZ2VfYXNpZChzdGFydCwgZW5kLCBQQUdFX1NJWkUsIEZMVVNIX1RMQl9OT19BU0lE
KTsKPiArICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHN0YXJ0LCBlbmQgLSBzdGFy
dCwgUEFHRV9TSVpFLCBGTFVTSF9UTEJfTk9fQVNJRCk7Cj4gIH0KCldoYXQgbWFrZXMgbWUgY3Vy
aW91cyBpcyB0aGF0IHRoaXMgcGF0Y2ggaGFzIG5vdCBiZWVuIHRlc3RlZD8KQlRXLCBJdCBpcyBi
ZXN0IHRvIGtlZXAgdGhlIHBhcmFtZXRlciBvcmRlciBvZiBhbGwgZnVuY3Rpb25zIGluCnRsYmZs
dXNoLmMgY29uc2lzdGVudDogY3B1bWFzaywgc3RhcnQsIHNpemUsIHN0cmlkZSwgYXNpZC4KClRo
YW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
