Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E27C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/y2OTuX1SuyKx/Tu3CUjeoZMB+dUgoHSVxocCEbKlA=; b=CB4uZzZZN5qJUX
	aAPYZ4srKZRfTOs0Ap1v/uYUgc5Oxt06WrJgKPg8XkuNJyOTNZjgGS2Qh7HcUzgTc0M1U7Pc0R0ZC
	ENtBY/3mxG1JcUlwMz99E/rzJQ+HnlMPmd5P+AKlB2Lzt3Be46RxZ8dbjmwS9BZlBEHsWwNBD5y54
	N6zVL8ScQ89lpMn0CDGYsF4bht0IjDaBzcyKyA9/ebQ5KZnt25Ifcm/YM5uVU3TVPeVbkyVTwm32M
	5Gu/gEwGePjTzjFFbJnl6gNNDMDLY1eQg+ke0ER0/PB8If9JFDzKmGFWMU5eGT9VgbCxF/0ywcoEf
	hE+qNRje3FHp+9TFZGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8bmM-002tE7-2C;
	Mon, 12 Jun 2023 07:15:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8bmI-002tDI-31
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 07:15:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f7fcdc7f7fso25837245e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 00:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686554149; x=1689146149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ71bt9b3FYUgSPlOf8FiPxADV6UnEaiTW42jFRDtmk=;
        b=qB32c5dWVm9Kzbtq9fUOyGNeiqr2M+6q6lr21FsMUyfgRXg4wE0u6Ql1UOm1K2wqnz
         w+JlI+2Tq6SNFD7e0KLkwxyqB2nvPPLHooVZEdLVeNZvILT4MRbuOW8sCWsZKWsuamoL
         14C9OuZ658GfPM2KTb8YMmqeNzWxicmOJnDhjKZjUPiUDZC9xZb5cFWMJ9LJwxNipbkP
         GRVYG8MA/IN+NBkGD9TR4ecqDaWjzNsWFk3uUFZicYI7cnTcUGYBJU/57jjj/sE/SIzu
         I7siMO7MTji4E9VfmcMtlPH7WDGCKlKdfMMOQV3xOLaTXzADeFpaYA+/vlc5L/fmlseK
         8RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686554149; x=1689146149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQ71bt9b3FYUgSPlOf8FiPxADV6UnEaiTW42jFRDtmk=;
        b=bYOiHOEwEz9tSiPK2t+2LCvaMNs+XUg+60gi+sGzmG2k+fqeDSlwXLm2ZcUSsqvRl8
         uX0sg7sLiysxP9y7KBqVbguXoMhHtKTNKxGARUZfwtcGWPRJADwI+y2UlYw/mIidO9FO
         myHQlyW4XwAZ9Zycs/zNNuboooV94W8hrQ37b+up4g7BhN44d/AlOHdMCOX68O0X5amF
         kdELx5hiSEXIMBe+mbsALLzxkYmnCpEZTc8ADWKOyxIXgSVOCXGR8RShO6GL+hscV3HN
         5716yVLW0lOBoaiXu6IUifOZX4mYwM/YObGOVdaRa0Igv4PR43smzyCeFZsFwg9YhJwd
         nenQ==
X-Gm-Message-State: AC+VfDyd3fEZtHDeuxK1WYCppsS/Skva6oozpNb6MPXblasUrAwfds2m
	mQ2I3Da3ybCRwkW8+ztDkHFqkUP+7386OA1QsVu0oTQ1exDe/0PQafE=
X-Google-Smtp-Source: ACHHUZ5uY0mHfdIyxOS33Tx+basV/6dyKGu5gb0l5C4gE5e3VvPBE71lr30zNoEEprrb7OYY4jKBZVkFREq38dYDrJ8=
X-Received: by 2002:adf:e403:0:b0:30a:ea65:6676 with SMTP id
 g3-20020adfe403000000b0030aea656676mr4578723wrm.23.1686554148766; Mon, 12 Jun
 2023 00:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
In-Reply-To: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 12 Jun 2023 09:15:38 +0200
Message-ID: <CAHVXubiYHQCYkymde2y_okNb2XcE-xVBMj8iZ7kM5d08bhqxiQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: move memblock_allow_resize() after lm is ready
To: Woody Zhang <woodylab@foxmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_001550_979175_BD34486F 
X-CRM114-Status: GOOD (  21.60  )
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

SGkgV29vZHksCgpPbiBTYXQsIEp1biAxMCwgMjAyMyBhdCAxOjQ54oCvQU0gV29vZHkgWmhhbmcg
PHdvb2R5bGFiQGZveG1haWwuY29tPiB3cm90ZToKPgo+IFRoZSBpbml0aWFsIG1lbWJsb2NrIG1l
dGFkYXRhIGlzIGFjY2Vzc2VkIGZyb20ga2VybmVsIGltYWdlIG1hcHBpbmcuIFRoZQo+IHJlZ2lv
bnMgYXJyYXlzIG5lZWQgdG8gInJlYWxsb2NhdGVkIiBmcm9tIG1lbWJsb2NrIGFuZCBhY2Nlc3Nl
ZCB0aHJvdWdoCj4gbGluZWFyIG1hcHBpbmcgdG8gY292ZXIgbW9yZSBtZW1ibG9jayByZWdpb25z
LiBTbyB0aGUgcmVzaXppbmcgc2hvdWxkCj4gbm90IGJlIGFsbG93ZWQgdW50aWwgbGluZWFyIG1h
cHBpbmcgaXMgcmVhZHkuIE5vdGUgdGhhdCB0aGVyZSBhcmUKPiBtZW1ibG9jayBhbGxvY2F0aW9u
cyB3aGVuIGJ1aWxkaW5nIGxpbmVhciBtYXBwaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogV29vZHkg
WmhhbmcgPHdvb2R5bGFiQGZveG1haWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQu
YyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21t
L2luaXQuYwo+IGluZGV4IDllOWRhNjk3MjBjZS4uOGEzM2VjYmI0ZDBmIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBAQCAt
MjU4LDcgKzI1OCw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQpCj4g
ICAgICAgICBkbWFfY29udGlndW91c19yZXNlcnZlKGRtYTMyX3BoeXNfbGltaXQpOwo+ICAgICAg
ICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkKPiAgICAgICAgICAgICAgICAgaHVnZXRs
Yl9jbWFfcmVzZXJ2ZShQVURfU0hJRlQgLSBQQUdFX1NISUZUKTsKPiAtICAgICAgIG1lbWJsb2Nr
X2FsbG93X3Jlc2l6ZSgpOwo+ICB9Cj4KPiAgI2lmZGVmIENPTkZJR19NTVUKPiBAQCAtMTI1MCw2
ICsxMjQ5LDkgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX3ZtX2ZpbmFsKHZvaWQpCj4gICAg
ICAgICBjc3Jfd3JpdGUoQ1NSX1NBVFAsIFBGTl9ET1dOKF9fcGFfc3ltYm9sKHN3YXBwZXJfcGdf
ZGlyKSkgfCBzYXRwX21vZGUpOwo+ICAgICAgICAgbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwo+Cj4g
KyAgICAgICAvKiBEZXBlbmQgb24gdGhhdCBMaW5lYXIgTWFwcGluZyBpcyByZWFkeSAqLwo+ICsg
ICAgICAgbWVtYmxvY2tfYWxsb3dfcmVzaXplKCk7Cj4gKwo+ICAgICAgICAgcHRfb3BzX3NldF9s
YXRlKCk7Cj4gIH0KPiAgI2Vsc2UKPiAtLQo+IDIuMzkuMgo+CgpUaGUgY29tbWl0IGxvZyBkb2Vz
IG5vdCBkZXNjcmliZSB0aGUgaXNzdWUgdGhvcm91Z2hseSBlbm91Z2ggdG8gbWUsCm1heWJlIHlv
dSBjb3VsZCBwb2ludCB0byB0aGUgYXJtNjQgY29tbWl0IHRoYXQgZGlkIHRoZSBzYW1lPyBJIG1l
YW4KY29tbWl0IDI0Y2M2MWQ4Y2I1YSAoImFybTY0OiBtZW1ibG9jazogZG9uJ3QgcGVybWl0IG1l
bWJsb2NrIHJlc2l6aW5nCnVudGlsIGxpbmVhciBtYXBwaW5nIGlzIHVwIikuCgpBbm90aGVyIHBv
aW50IGlzIHRoYXQgSSB3b3VsZCBub3QgcHV0IHRoaXMgY2FsbCBpbnRvIHNldHVwX3ZtX2ZpbmFs
KCksCkknZCByYXRoZXIgYWRkIGl0IGluIHBhZ2luZ19pbml0KCkgYXMgaXQgZG9lcyBub3Qgc2Vl
bSBsaWtlIGEgZ29vZCBmaXQKZm9yIHNldHVwX3ZtX2ZpbmFsKCkuIEJ1dCB0aGF0J3MgYSBuaXQg
c28gdXAgdG8geW91IG9mIGNvdXJzZS4KCkFueXdheSwgdGhhdCdzIGEgZ29vZCBjYXRjaCwgdGhh
bmtzIQoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
