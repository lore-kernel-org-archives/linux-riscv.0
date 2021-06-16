Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D54C48BE8
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 07:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49FF61159
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 07:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C49FF61159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cddIY3zSQpaGwVF0bG6gxrR0jo6ZYO+nRbS+R/KJYDs=; b=h3Hloc9Fo0MyFR
	IQ9uKIBu7qzaVLG4mHe+vOX9/z/Jz9g0ZTWIqx/YDpxWC/y0pLmeUu0ArnIqAvr6AOr6P8W/UcNG6
	GFQiq20qw7uPxnSUibNiRTJ8R6ToLkpXyDKYBeD9n9S2vwliFL3eKF2wNKWaevXBIupcTdu2eM+Kl
	HInK4wGw9ENky3IzDpNJ641Vs1k8CZFCj+a07mKy/8/hT8xH6iC55AgcLjWSkMpX1HcM+pnE3gZt4
	+njmeiAG/EHXpmwH3Bg9S9Ku30k4x22MNU3Y/lto0l97zTHefUdp9+qs+Y+0YnNDorbcwvRnaqD/A
	Bood5GojOTL5zn6XQoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltQS6-005III-HG; Wed, 16 Jun 2021 07:59:10 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQS3-005IHF-36; Wed, 16 Jun 2021 07:59:08 +0000
Received: by mail-ua1-f44.google.com with SMTP id v17so457300uar.12;
 Wed, 16 Jun 2021 00:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ok+NL5CmU/Ob0IX9KPH9BgLLQFejvOXElq4ySZvO/eg=;
 b=YgsJvVhDXjW2UaGKIsewlAB57Oj8pG5d88cP08aXyXX0WLQ5byFyDNtco5W4oNVHOI
 Ta552fYRYqSehH/ZrK8LhTgV3Lu0DRlTQxdB4xbbA51/65hghqGhKTEvBCsf1idKyC7O
 tkD6JuLDb4X6IpMTSnrkif6+u14rPCbiAqGkckRrKaNZjmJ8OSwq8jT8ids6XeuEoUmk
 ybwlNq/Xfx+KjSbFFKtnAiYB0CaIotdAHcRBHkPVvA2n7Wn9z8pd5MD9HNKIctvTwWwL
 qlDZ0DCHowhgijq2LX5gRO6juYvAD0HjV97uyv1AwEIpzzRmExaXdgSO7KGYOGI2LDpX
 C+Fg==
X-Gm-Message-State: AOAM533hLNk9dr167s0ZzK2sat1NgANk8FfXs/xaz0DdQTkdhkEBt9YO
 IFcwmGXkvugiYD9+hjBg7Lk7Pd4urZq1IfzdkUU=
X-Google-Smtp-Source: ABdhPJwQclxKI9oMkHq5wLHstPwtEsioniamAyg9w4TFoM8Z0IMpscNcKv+xD94ZERSu4Luuuw60gUOzCY4HQzoD7j0=
X-Received: by 2002:ab0:288f:: with SMTP id s15mr2815194uap.2.1623830345737;
 Wed, 16 Jun 2021 00:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623780059.git.geert+renesas@glider.be>
 <8661d652968d050489852ccb50df5ad4cc048900.1623780059.git.geert+renesas@glider.be>
 <96476719da53fe67dbb91268e2ad7492@mailhost.ics.forth.gr>
In-Reply-To: <96476719da53fe67dbb91268e2ad7492@mailhost.ics.forth.gr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Jun 2021 09:58:54 +0200
Message-ID: <CAMuHMdWjXFGHuT5OBcoyNrQ3C_+r3jnvGLsoDn-sv-yNe+GZVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: fdt: Add generic support for parsing elf core
 header properties
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_005907_171306_98EF2FA3 
X-CRM114-Status: GOOD (  21.73  )
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

SGkgTmljaywKCk9uIFdlZCwgSnVuIDE2LCAyMDIxIGF0IDE6MjggQU0gTmljayBLb3NzaWZpZGlz
IDxtaWNrQGljcy5mb3J0aC5ncj4gd3JvdGU6Cj4KPiDOo8+EzrnPgiAyMDIxLTA2LTE1IDIxOjE3
LCBHZWVydCBVeXR0ZXJob2V2ZW4gzq3Os8+BzrHPiM61Ogo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL29mL2ZkdC5jIGIvZHJpdmVycy9vZi9mZHQuYwo+Cj4gSSBiZWxpZXZlIGRyaXZlcnMv
b2Yva2V4ZWMuYyBpcyBiZXR0ZXIgc3VpdGVkIGZvciB0aGlzLgoKRnJvbSBhbiBlYXJsaWVyIHJl
c3BvbnNlIGZyb20gbWUgdG8gYSBjb21tZW50IGZyb20gUm9iOgoKfCA+IEFsc28sIG5vdGUgdGhh
dCB0aGVyZSBpcyBub3cgYSBkcml2ZXJzL29mL2tleGVjLmMgKGluIC1uZXh0KSB0aG91Z2gKfCA+
IG5vdCBzdXJlIGlmIGFsbCB0aGlzIHdvdWxkIGdvIHRoZXJlIG9yIHN0YXkgaW4gZmR0LmMgd2l0
aCB0aGUgcmVzdCBvZgp8ID4gdGhlIG1lbW9yeSBwYXJzaW5nLgp8CnwgSXQncyBnb25uYSBiZSB0
aGUgbGF0dGVyLCBhcyB0aGF0IGZpbGUgaGFuZGxlcyB0aGUgRkRUIGR1cmluZyBlYXJseQp8IGtl
cm5lbCBzdGFydHVwLCBmb3IgYm90aCBub3JtYWwgYW5kIGtkdW1wIGtlcm5lbHMuCnwKfCBEZXNw
aXRlIHRoZSBuYW1lLCBkcml2ZXJzL29mL2tleGVjLmMgaXMgbm90IGZvciBrZXhlYywgYnV0IGZv
cgp8IGtleGVjX2ZpbGUuICBUaGlzIGlzIHRoZSAibmV3IiBmYW5jeSBzeXNjYWxsIHRoYXQgcHJl
cGFyZXMgdGhlIERUQgp8IGZvciB0aGUgbmV3IGtlcm5lbCBpdHNlbGYsIHVubGlrZSB0aGUgY2xh
c3NpYyBrZXhlYyBzeXNjYWxsLCB3aGVyZQp8IHVzZXJzcGFjZSBpcyByZXNwb25zaWJsZSBmb3Ig
cHJlcGFyaW5nIHRoZSBEVEIgZm9yIHRoZSBuZXcga2VybmVsLgoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
