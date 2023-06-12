Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A08BC7EE25
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 06:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFCEMYSFY5+0Hns75o7EAY8Bz6zh9N7rVA9QVqMrlvA=; b=idNfDuXegOE/4M
	EW6n3tIxYoXMWubS+lfshvn75tlBYZw5YMV9ExSM51Nbww70xO7HHdW1kAMooleKyliKNbvkGKWHz
	3HX5X2jll7fappAVuLxJLMDePQ++gVrxvOgpZ7e5ajgWZndnkImKgdtfVjvt3Ovf2LJ4bLCFPLxYl
	xzSCcTK4gFScYntw2f1sqkmL3F9048QL7aHmDDEneDiTBpcWRZBtkiS24wXtoBoPqElv6aopuLumK
	vpKYsTZqKnuQNp/2cZfzqOC8/ufudPkppwFCYTAuHFtDT8RnlW2fGF5ojSvlB0k0ZGxyOGRXZXsl6
	VQqqvHqzadkUwu8Kk00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8bVE-002pqg-2e;
	Mon, 12 Jun 2023 06:58:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8bVB-002ppW-2A
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 06:58:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so28587745e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 23:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686553085; x=1689145085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muMBbKlbOgkWCg/h+XMxPqeAhUGmHsuqP1SYaCH/UFY=;
        b=u1BzlaXv/XyxGzixcDsbYA6ou0iLzBYLm+xz8c2f0mzFqrhD6OosEWU0uEvCLlCoqg
         lrDygREmx13n3/aae1SHNfNQkZvdfSAVKFe5sTX8SZVlwefi4W25BQbZB3Fuxg0t42NE
         B0GBthaRpdt9jTCcRIHXhqrNOqabbxZPgm6nfQaT9r1LmuvnzYtoCRCFZNsveDw2yvT2
         XRAk9s3UZwg2KLM47gSPLpT0G3Fsk5K7R5IqzHdXpS/t8tj3AqRq00ypOSNNlmuTMxK7
         7iaiCa2rCHXCmlyo6m6X660ilMWPqmMSFPjk/YWVNdse17EpmOXfb17GQ6oQplXZMpQA
         3gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686553085; x=1689145085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muMBbKlbOgkWCg/h+XMxPqeAhUGmHsuqP1SYaCH/UFY=;
        b=QZYxscK+OBOTXfeXT4ushrSLvFKc1pX9nXHE/Sxra9XMYdZAQOUUN4YiN2lYKwtLHK
         UNLKfo1ALMAH7UYNqr7rPu+817bFC3x0PYNnAvdu/fWnpftAdgEn7X3vDO5VfrgRTr8Z
         I7v2zglPr/PexYL2xGGVEoAJyqtnKGfsDXhlQvgkEREu/oYQ0OIacH/FC0mKRva93d7I
         ONckpV0dwwEjYYmZWBzouPrM+Q0oahM5Lw/AlwZG5NLfRjAQTJ1mp+GT/ExsphJU6RrB
         aEikW6KsdZyr3VpjjXzRQYwt/aBTRPmUnduuzUoCBL/OmpQQuqugT9HHaTeb5ZPmskV5
         M4eQ==
X-Gm-Message-State: AC+VfDwuzRc6Wg7k0QzMAKo2+cbHt+cf7iGTve4NfIqU7qpw3saTdrCv
	KDosJZXy/WTMnfzwhpgXZa1yGPYJrXWOUlQDfU0r8g==
X-Google-Smtp-Source: ACHHUZ7SXgq3JBJs8PX9muZNuGvjPynjHw0jAq/dt4Hqj7hqWMp/CmUtXBq0rbDUvO3pifJPHKZxoWr+KJqLwHYrSa4=
X-Received: by 2002:a7b:c5d9:0:b0:3f8:2777:188 with SMTP id
 n25-20020a7bc5d9000000b003f827770188mr295405wmk.11.1686553085028; Sun, 11 Jun
 2023 23:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
 <20230607-jogging-grudging-70dede86bc53@spud> <CAHVXubggydGfNu3OzcxWXREJbB+G9dmr9sFD7vXhVxbG-N58Pg@mail.gmail.com>
 <20230610-ability-mockup-f6aa71bad6a1@spud> <tencent_06282B9141D32F1D19BE2BB41998E1612607@qq.com>
In-Reply-To: <tencent_06282B9141D32F1D19BE2BB41998E1612607@qq.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 12 Jun 2023 08:57:52 +0200
Message-ID: <CAHVXubgL8TZydzWogqxNczNkKin=qLp4i6=5d0YVBQdqMtFVjw@mail.gmail.com>
Subject: Re: [PATCH] riscv: reserve DTB before possible memblock allocation
To: Woody Zhang <woodylab@foxmail.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_235809_934123_FB442983 
X-CRM114-Status: GOOD (  28.75  )
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

T24gU3VuLCBKdW4gMTEsIDIwMjMgYXQgMToyN+KAr0FNIFdvb2R5IFpoYW5nIDx3b29keWxhYkBm
b3htYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEp1biAxMCwgMjAyMyBhdCAwNDo0MToxN1BN
ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPk9uIFRodSwgSnVuIDA4LCAyMDIzIGF0IDA5
OjQ5OjQ0QU0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+PiBPbiBXZWQsIEp1biA3
LCAyMDIzIGF0IDg6MTfigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4+ID4KPiA+PiA+ICtDQyBBbGV4LCB5b3Ugc2hvdWxkIHRha2UgYSBsb29rIGF0IHRoaXMg
cGF0Y2guCj4gPj4gPgo+ID4+ID4gT24gV2VkLCBKdW4gMDcsIDIwMjMgYXQgMDk6MzU6MTlQTSAr
MDgwMCwgV29vZHkgWmhhbmcgd3JvdGU6Cj4gPj4gPiA+IEl0J3MgcG9zc2libGUgdGhhdCBlYXJs
eV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpIGFsbG9jYXRlcyBtZW1vcnkKPiA+PiA+ID4g
ZnJvbSBtZW1ibG9jayBmb3IgZHluYW1pYyByZXNlcnZlZCBtZW1vcnkgaW4gYC9yZXNlcnZlZC1t
ZW1vcnlgIG5vZGUuCj4gPj4gPiA+IEFueSBmaXhlZCByZXNlcnZhdGlvbiBtdXN0IGJlIGRvbmUg
YmVmb3JlIHRoYXQgdG8gYXZvaWQgcG90ZW50aWFsCj4gPj4gPiA+IGNvbmZsaWN0cy4KPiA+PiA+
ID4KPiA+PiA+ID4gUmVzZXJ2ZSB0aGUgRFRCIGluIG1lbWJsb2NrIGp1c3QgYWZ0ZXIgZWFybHkg
c2Nhbm5pbmcgaXQuCj4gPj4gPgo+ID4+ID4gVGhlIHJhdGlvbmFsZSBtYWtlcyBzZW5zZSB0byBt
ZSwgSSBhbSBqdXN0IHdvbmRlcmluZyB3aGF0IGNvbXBlbGxpbmcKPiA+PiA+IHJlYXNvbiB0aGVy
ZSBpcyB0byBtb3ZlIGl0IGF3YXkgZnJvbSB0aGUgbWVtYmxvY2tfcmVzZXJ2ZSgpcyBmb3IgdGhl
Cj4gPj4gPiBpbml0ZCBhbmQgdm1saW51eD8gTW92aW5nIGl0IGFib3ZlIGVhcmx5X2luaXRfZmR0
X3NjYW5fcmVzZXJ2ZWRfbWVtKCkKPiA+PiA+IHNob3VsZCBiZSB0aGUgc3VmZmljaWVudCBtaW5p
bXVtICYgd291bGQga2VlcCB0aGluZ3MgdG9nZXRoZXIuCj4gPgo+ID4+IFRoYW5rcyBDb25vci4K
PiA+Pgo+ID4+IFNvIHRoZSBwYXRjaCBsb29rcyBnb29kIHRvIG1lLgo+ID4+Cj4gPj4gQnV0IEkg
ZmluZCB0aGlzIGZyYWdpbGU6Cj4gPj4KPiA+PiAtIHdlIGRvIG5vdCBjaGVjayBtZW1ibG9ja19y
ZXNlcnZlKCkgcmV0dXJuIHZhbHVlIHRvIG1ha2Ugc3VyZSB0aGUKPiA+PiByZXNlcnZhdGlvbiBy
ZWFsbHkgaGFwcGVuZWQgKGFuZCBxdWlja2x5IGxvb2tpbmcgYXQgdGhlIGNvZGUsIEknbSBub3QK
PiA+PiBldmVuIHN1cmUgaXQgcmV0dXJucyBhbiBlcnJvciBpZiB0aGUgcmVnaW9uIHdhcyBhbHJl
YWR5IGFsbG9jYXRlZCkuCj4gPj4gLSB3ZSBoYXZlIHRvIG1ha2Ugc3VyZSBubyBtZW1ibG9jayBh
bGxvY2F0aW9uIGhhcHBlbnMgYmVmb3JlIHNldHVwX2Jvb3RtZW0oKS4KPiA+PiAtIHdlIGFsc28g
aGF2ZSB0byBjaGVjayB0aGF0IG5vIGZpeGVkIG1lbWJsb2NrX3Jlc2VydmUoKSBoYXBwZW5zIGFm
dGVyLgo+ID4+Cj4gPj4gVGhlIGxhc3QgMiBwb2ludHMgbWF5IHNvdW5kIG5hdHVyYWwsIGJ1dCB3
ZSdsbCBoYXZlIHRvIHRha2UgZ3JlYXQgY2FyZQo+ID4+IHdoZW4gYWRkaW5nIHNvbWUgY29kZSBh
cm91bmQgaGVyZS4gSSdtIHdvcmtpbmcgb24gYW4gImVhcmx5IGJvb3QKPiA+PiBkb2N1bWVudCIg
YW5kIEknbGwgYWRkIHNvbWV0aGluZyBhYm91dCB0aGF0LCBidXQgYSBydW50aW1lIHRoaW5nIHdv
dWxkCj4gPj4gYmUgd2F5IGJldHRlciBJTU8uCj4gPj4KPiA+PiBZb3UgY2FuIGFkZDoKPiA+Pgo+
ID4+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
Cj4gPgo+ID5idHcgQWxleC9Xb29keSwgd2hhdCBpcyB0aGUgYXBwcm9wcmlhdGUgRml4ZXMgdGFn
IGhlcmU/Cj4KPiBJbiBlZjY5ZDI1NTlmZTkgKCJyaXNjdjogTW92ZSBlYXJseSBkdGIgbWFwcGlu
ZyBpbnRvIHRoZSBmaXhtYXAgcmVnaW9uIiksCj4gQWxleCBtb3ZlIGVhcmx5X2luaXRfZmR0X3Nj
YW5fcmVzZXJ2ZWRfbWVtIHRvIHNldHVwX2Jvb3RtZW0oKSB0byBwcmV2ZW50Cj4gbWVtb3J5IGFs
bG9jYXRpb25zIGJlZm9yZSBvZiByZXNlcnZhdGlvbnMuIEJ1dCBpdCBzaG91bGQgbm90IGJlIHB1
dCBiZWZvcmUKPiBEVEIgcmVzZXJ2YXRpb24uCj4KClllcCwgdGhhdCdzIHRoZSBjdWxwcml0LCBs
ZXQncyBhZGQgdGhlIHByb3BlciB0YWc6CgpGaXhlczogZWY2OWQyNTU5ZmU5ICgicmlzY3Y6IE1v
dmUgZWFybHkgZHRiIG1hcHBpbmcgaW50byB0aGUgZml4bWFwIHJlZ2lvbiIpCgpUaGFua3MhCgpB
bGV4Cgo+Cj4gV29vZHkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
