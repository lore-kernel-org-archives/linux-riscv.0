Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAFBC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 00:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcZfA5pREPUkdIOKNuG5k0IlxknbSO6d6Rzay5j8tuk=; b=SUyYoL0DnsVDjc
	/pztRB8GMB5FPkxi/psBFzRiuI/aiSAkJb2lUmJIToM6NjrG+Z49UdXXNmaLvWE/l/qak+Li1XYTL
	Ze9IQucOy+oyV/d22e81bCgfyVKvu7FLoOgWVh+Auy6c3ru8vtqXE55rama+vFijDxWz/g6ag4HV1
	cOJFjhxq4R+AtoyP4ei4Ihq1AGl4zOiqOxe3rfOa/PkWewAqLnu369D0I6RtUXejGkL2uWJTbigEN
	TC34tddOiTiQOE3LxuMhx1LRM5Q1UYlXGE6cJ5XVX7MEZyhfgvpSncDdzwqTSvNbHsTr7AGlX3rb2
	6gceQzaUZ2ZJVIS+Q49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGpiv-0075Lz-1X;
	Sat, 23 Dec 2023 00:18:37 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGpir-0075Lc-2r
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 00:18:35 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5d7a47d06eeso23282357b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 16:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703290711; x=1703895511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp9vWQxdAPDDdlHKGcJ8qgp0FvOo9mvy4HBh0flEGoE=;
        b=cidIJ+MeXH5RDjdK9GihEJswfAzelMzIY4TYK+UTaETsSkm5UPdWbuxCeVX+/4Y7N3
         lq1Xv7DMkD4OXch0JB65oeH708mqc1PQ3VN3dzJUREm4D9HhlYLHKDdWpvMJSsMffSJ2
         AQGmEP+GWPisDiSBlUkZ09dk1MUgu0fpIh1B4rlvk78yLPzXhSgCyYq44Tq/Z5QJr3+t
         C4y6bin/dZnsrgGb4At+wV9+4JqsAHwmOAOV22+LW0rVjefIcBeGM4Pf7ZI4KmvLBYnN
         c8wEl6cwtV33guKeLzow7Z/DbE2AFhTFT0+xQLr2ylqg4I9K7eU6RfatXxQDb23uOhQb
         lw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703290711; x=1703895511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp9vWQxdAPDDdlHKGcJ8qgp0FvOo9mvy4HBh0flEGoE=;
        b=iryFiOQ55rEFcF+rP3D1KTe/A9jc8FVRqP9kEn/36s48j8vF3ZLPDGC0opX3xQtch1
         o2mLJxZPaHbfPWQfIKlOzZraXjkGpsTC5V7rPrpSkaJKwYHPwl/nojxYwvClPWvzqHVF
         vzbxlnH8DUKGbQvxg7kJ5s/HTtk8Y2rjAcT459lLAUu5syZ444R5fgqhuFBNlx9YFDKt
         CgkqBPnaliNYz23DHeBK8JG77eFCQGJ5B3flWCup3t4EKWjmdwTIUKUtLoybYquqLBWx
         O+DRsc6xgXlNUm3dRSkOTCMr1wuAz85hVxI108JNRgHYHxTGbr1qnTz4O+V79UCNnCY1
         BXQw==
X-Gm-Message-State: AOJu0YybujJ8Yc3PoLdfeQP0GOLWA8P5ZRf7UGy7FBWWDDhGzIOeOG62
	+EozRBp6z4rAoCvVGICGQ/YnMV4Dumaa+LNozGo+WQSsdngI2A==
X-Google-Smtp-Source: AGHT+IH0J9appb9YaOYYWr0pL/JzayP1h7qzAi5FZV+YX3znd3OxV1cD/KlvJy/FEWLrONbRLEArBL7fAvmtung+mUc=
X-Received: by 2002:a05:690c:c0d:b0:5e7:e838:633a with SMTP id
 cl13-20020a05690c0c0d00b005e7e838633amr995068ywb.34.1703290711253; Fri, 22
 Dec 2023 16:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
 <20231215202137.GA317624-robh@kernel.org> <CAJM55Z9pBpYfwpxPH7bUumuosVDn9DHLSBngW6CtG7aK_z+_bQ@mail.gmail.com>
 <CACRpkdYT+jf4=dk3Y9cwa_=aYCihVq93N-iT0RUbtT2-+PX69w@mail.gmail.com>
 <CAJM55Z8osSFxKi_7=aRkEr+U3vAq0TS93OggnRzyPpssNuuJ3Q@mail.gmail.com>
 <CACRpkdbx7BOoHzbGd6n5p=Ho3GhMcujwUzQam0jLe6Ysg+xsNg@mail.gmail.com> <CAJM55Z8SwyNEqw4HWRd7G8Y9rdtOGtKy-KbzDorqohdK3nZg0A@mail.gmail.com>
In-Reply-To: <CAJM55Z8SwyNEqw4HWRd7G8Y9rdtOGtKy-KbzDorqohdK3nZg0A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 23 Dec 2023 01:18:19 +0100
Message-ID: <CACRpkdazVUJnfEJTXmAErfxptgnNGByQPU=aLz2RReZD_3GyyA@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_161834_010990_71A4D892 
X-CRM114-Status: GOOD (  14.12  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMzowN+KAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPiBMaW51cyBXYWxsZWlq
IHdyb3RlOgoKPiA+IERvIHRoZSBwZW9wbGUgZGVzaWduaW5nIGJvYXJkcyB1c2luZyB0aGlzIGhh
dmUgYmV0dGVyIGRvY3VtZW50YXRpb24gdGhhbiB3aGF0Cj4gPiB5b3UgaGF2ZT8gVGhlbiBlaXRo
ZXIgZ2V0IHRoYXQgZG9jdW1lbnRhdGlvbiBvciBqdXN0IGRvbid0IGdpdmUgdGhlbQo+ID4gdG9v
IG11Y2ggcm9wZS4KPgo+IFdlIGNhbiBjZXJ0YWlubHkgcHJldmVudCBMaW51eCBmcm9tIGV2ZXIg
Y29tYmluaW5nIHRoZSBzdHJvbmcgcHVsbC11cCB3aXRoIHRoZQo+IHJlZ3VsYXIgYmlhcywgYnV0
IHRoYXQgZG9lc24ndCBtZWFuIHRoYXQgdGhlIHZlbmRvciB1LWJvb3QgY2FuJ3QgZmluZCBhIHVz
ZSBmb3IKPiBpdCBhbmQgbWlnaHQgaGFuZCBvdmVyIHBpbnMgaW4gc3VjaCBzdGF0ZXMgTGludXgg
dGhlbiB3b3VsZG4ndCBrbm93IGhvdyB0bwo+IGhhbmRsZS4KCldoYXQgeW91IGFyZSBzYXlpbmcg
aXMgInRoZXJlIG1pZ2h0IGJlIHBlb3BsZSB3aG8gaGF2ZSBhY2Nlc3MgdG8KZG9jdW1lbnRhdGlv
biB0aGF0IEkgZG9uJ3QgaGF2ZSBzbyB0aGV5IGRvIHRoaXMgY3JhenkgdGhpbmciLgoKQ2xlYXJs
eSB5b3UgY2Fubm90IGRlc2lnbiBmb3IgdGhhdC4KClByaW50IGEgYmlnIGZhdCB3YXJuaW5nIGFu
ZCBmYWlsIHByb2JlIGlmIGl0IGhhcHBlbnMuCgpJZiBVLUJvb3QgaXMgdXNpbmcgc29tZSBmZWF0
dXJlIHlvdSBkZWZpbml0ZWx5IGNhbm5vdCBkZWFsIHdpdGggaWYgdGhpcwpoYXBwZW5zLCBhbmQg
dGhlbiB0aGUgcGVvcGxlIGRvaW5nIHRoaXMgY2FuIHZlcnkgd2VsbCB3cml0ZSBhIHBhdGNoIGZv
cgp0aGUga2VybmVsLgoKPiBJZiB5b3UgdGhpbmsgaXRzIGJldHRlciB3ZSBjb3VsZCBqdXN0IHBv
c3Rwb25lIHRoYXQgcHJvYmxlbSB0byB3aGVuL2lmIGl0IGV2ZXIKPiBoYXBwZW5zLgoKWWVzIHBs
ZWFzZS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
