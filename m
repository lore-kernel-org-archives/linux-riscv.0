Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0043DCD6E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 06:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMgWU0r2qPFrEa90/e8vShdS89OxSPV01N/eK4Fcqyg=; b=ORYnI+RYxgjM7F
	juJlNFPv6UaqX4/KKRxEbLeS90oB4nVm+S1eGSyo1ldFAp7Xkndi7C59Fj2A0faDOLraosgB9kTYP
	Jq3CEbBzG/sWc0x1vT1JwtrAj4M9QvzAVM9gzNjcr9LhK5CAVU8wG0jJs+Y/wfuUj0tlz7rkOWqMT
	8eXMa0ZjI+jdFV9K2I2JqrW8ZHstUI5gkjnL2xco6RkQRE0hRVsmoax/NhDz6ykUnWPjA8vqwUkaF
	tz5zJuZwiWA9yG+j1PfjpWM73KfDlW1Ke3QSWRqpPYbfDcdAN35YS7WMvWxAPAukkUml9zpp00uvv
	e9k6bJFB+N2zU1EgAOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOMo-00000000BWE-47em;
	Fri, 05 Jun 2026 06:49:19 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOMm-00000000BV5-0p7e
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 06:49:17 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-69e1eacc41fso1115313eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 23:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780642154; cv=none;
        d=google.com; s=arc-20240605;
        b=GmxfEmlRDcDl2YhWc7TFYFLggBDB2lVAOKHN+Kn/N3b/Lcxa0xzAnxCD/wXoYx+PoP
         kijnsfW72ei74+RzmnJUA/pkRmvTFU9PeYa1iYrY330VdvWcgF5Gk9thbrYPOkld7qmo
         DFAUdHOlDn/2qeR/gGVRHBf8ltCThFHXp1oBQa+mKyUG8d/z/G4lbf9vea/t6lUntjbX
         0OsxsA+qQz1C41+HcSd/S8/AR/ItWunFWrW3Kmg4/AuB4C0vB65j8TqSn8ppbQHb8fhs
         RERHX23Rlq8Cw89vB5s1P/GxaIHxHdocc7MSjUrNNVoxQxZfXR9P89FORcx2dhHReEGg
         21tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6XDq1xh1XzOsuKw97N0TVXndgcJC/tzYgMFv9LJzmno=;
        fh=3eP4LO91dduv29xkBqnvggK3AVn5fUfKdPQ/lqjIGZY=;
        b=PRC0ojCEsMcXbDiJtqlNePZNSkSCjGbsFfQ3NJSmiVyg1xSZdYM485CCQdcGuw9F78
         v/H3py1rO6kPxoKUK3ezBl8jgVnIY6O8HIoSDhZhGQGdck0LwFD4M0rGpVXEkqZAlueE
         3pmnXw/jK4CfR6p+bd0V7QYe7l8u0krqM6xkQztT+durVXJwm/WviZkgCwoOcwgDzoCN
         dUnE+JI6LOuS8S/vYyGgODrSlf6aU9oBMsc2QcfjTrt/2s2qKMoU09RJK3e8CAU1QLAv
         AByr9UY9i/zNBFLNHu2zejG6uUxVNcB9ocmqTGNH1T3rtQgiOSeYZupcG1VRXBHIj6AK
         xhjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780642154; x=1781246954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XDq1xh1XzOsuKw97N0TVXndgcJC/tzYgMFv9LJzmno=;
        b=O2Df4XSY0FYXmc+cBNOGFqlPaTHEWTHDEADw+YfrPpJ0RtaCXzhgXJxEqmMALxKURM
         hIX0HRZCDTxpyVn5R8+r7GyeXOho/w6O/IJ87ayvG07pC7Rde98uOnnc3yMyeRpvjkcs
         DZYcpVd2UbQkog6SccwGqu+x/NjUUmoQeQLLSwzohy8KHaZp5dbOAc2iImAfvD3kRubg
         19vCr7pOD6du7Q3Mnyj7YZmsEtYsVyLsN01Uxi6Tgh6S+uiNWTR3ZLbDae2JR0blzP4o
         nUoYrzSQXwCf/rvW8GM20Yj43pSaXsxe2AdqfiJn/KAYv0NaSbxbiuE9tot+YG3LEUxV
         RGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780642154; x=1781246954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XDq1xh1XzOsuKw97N0TVXndgcJC/tzYgMFv9LJzmno=;
        b=ZJaPmsQ5nDiadNLUZwTQ6KRNycRYOE3EOAsktYqVZB5gW+JCEvW/LqrxNq5Knn4zI/
         0Q1emmXQJ+ol2+s2zWMFHrT5lJaLRlkWmtQ+ZOdbJZ/mFUJxenpaE8TwkCz2ttGnL2KZ
         bv2HRHs6njDhDXFfbDuQUyV+sKJlxqlVvrVpDjoru7+ffXC2ZN6JbPJis/1Ek93JiBV9
         70ZMmsw7z/xl0oWzVWum8VYM7MpsmvE/BhZsfdO5btmbKBlt1KsJtU3vjn4EU+6Na369
         P3RbVgzzv9wX5A7eKmzsVhRobGsfq+b4cUdQHKUifKyNiQ2Uy1yiam8BqECntb+P8OZt
         9HYA==
X-Forwarded-Encrypted: i=1; AFNElJ9n/uMQCivbt47LdDjUejweSRPWbQctzjF2D9i3gCTB6Xqmj1rR3VPDdSF/jJCzDtz2ppwA1l5NHXcDNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWv5u0r790fNXEhj4nDY4Icdfs9UfkWmeBrp4OD2J/VxnR144z
	THUk+cJmRAF5Jx+TXppuyrPTGOouXgxNJjoyU/SmIS/Vq3ndISNp95SAD9SsKpDx+r35gBRWr3s
	wVVFe3hHdsYeH8gFLyGFaZfVBzVKIZ92c6JNFJbVrag==
X-Gm-Gg: Acq92OHBzmM8GrGABoqsObwF63bLBXATo9NOuiVUKrhdxLTOD0lO13BEZYsHhuNRLAp
	0+pjPhp3kIgbcCZHiD4w4EKilze2Y4QnjxD4zvS7lNJ44pzf2xUznkro5O7GBYYiI8Z/PhYnUgG
	F0I2h2CZ9MoGu3cj37eQJJpMVYjhMbl4etFqct05Yhm6M7TBBfG6QTe0WWE5yprr+0iuU0MJM/b
	seFyHmhghxYMOf/bzbf9jaAyNffyrWnMvNyi32zhUSO/mQ6F0zsFl3i3HEJBWrXF/JD6HrrEbyp
	jwutn9ttLwU+dVfOJQA7WXznlA6xLnhNfRdEpAe6Ez6NV2QoCkcrR8tNnuYuuiEyZmvfxAJlUVz
	p/gaoRODZK1DFHnrFHQV5oJggRcU4s3wVdQ6+
X-Received: by 2002:a05:6820:561c:b0:69b:6d47:8180 with SMTP id
 006d021491bc7-69e68c23141mr771817eaf.39.1780642154512; Thu, 04 Jun 2026
 23:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260528113840.2629186-1-inochiama@gmail.com>
In-Reply-To: <20260528113840.2629186-1-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 12:19:03 +0530
X-Gm-Features: AVVi8CeHnuM2CioMa5An9kIeCY2Cck7qIHe-9yB0iUqpIPQzrG2HNoEWHmj4vmY
Message-ID: <CAAhSdy096z4SdwQKBxM0ZtE5=i3UZrhMD-BcES9UdP5OgajqEA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Enhance the logging check for mmu mapping
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_234916_375996_5B114477 
X-CRM114-Status: GOOD (  20.93  )
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

T24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgNTowOOKAr1BNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiBlbmFibGluZyBkaXJ0eSByaW5nLCB0aGUgZGly
dHkgYml0bWFwIGlzIGRpc2FibGUsIGFuZCB0aGUgbG9nZ2luZwo+IGNoZWNrIGlzIGFsd2F5cyBm
YWxzZSBhcyB0aGUgUklTQy1WIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBzZWxlY3QKPiAiTkVFRF9L
Vk1fRElSVFlfUklOR19XSVRIX0JJVE1BUCIuIEFsdGhvdWdoIHRoZSBkaXJ0eSBsb2cgaXMgcmVj
b3JkZWQKPiBzaW5jZSB0aGUgd3JpdGUgcGF0aCBhbHJlYWR5IHRyeWluZyB0byBhZGQgdGhlIGRp
cnR5IGxvZywgdGhlIGxvZ2ljIGZvcgo+IGxvZ2dpbmcgY2hlY2sgaXMgYnJva2VuIGFuZCBzb21l
IHNpZGUgZWZmZWN0IHdpbGwgb2NjdXJzLgo+Cj4gRW5oYW5jZSB0aGUgbG9nZ2luZyBjaGVjayBm
b3IgbW11IG1hcHBpbmcgc28gaXQgY2FuIGNoZWNrIGJvdGggdGhlIGRpcnR5Cj4gcmluZyBhbmQg
dGhlIGRpcnR5IGJpdG1hcC4KPgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2No
aWFtYUBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgOSArKysrLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5j
Cj4gaW5kZXggMmQzZGVmMDI0MjcwLi5iNTg3M2JjYTlkY2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC0xNDIsOSAr
MTQyLDggQEAgdm9pZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICpr
dm0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGt2bV9tcl9jaGFuZ2Ug
Y2hhbmdlKQo+ICB7Cj4gICAgICAgICAvKgo+IC0gICAgICAgICogQXQgdGhpcyBwb2ludCBtZW1z
bG90IGhhcyBiZWVuIGNvbW1pdHRlZCBhbmQgdGhlcmUgaXMgYW4KPiAtICAgICAgICAqIGFsbG9j
YXRlZCBkaXJ0eV9iaXRtYXBbXSwgZGlydHkgcGFnZXMgd2lsbCBiZSB0cmFja2VkIHdoaWxlCj4g
LSAgICAgICAgKiB0aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVjdGVkLgo+ICsgICAgICAg
ICogQXQgdGhpcyBwb2ludCBtZW1zbG90IGhhcyBiZWVuIGNvbW1pdHRlZCBhbmQgZGlydHkgcGFn
ZXMgd2lsbCBiZQo+ICsgICAgICAgICogdHJhY2tlZCB3aGlsZSB0aGUgbWVtb3J5IHNsb3QgaXMg
d3JpdGUgcHJvdGVjdGVkLgo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAoY2hhbmdlICE9IEtW
TV9NUl9ERUxFVEUgJiYgbmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKSB7Cj4g
ICAgICAgICAgICAgICAgIGlmIChrdm1fZGlydHlfbG9nX21hbnVhbF9wcm90ZWN0X2FuZF9pbml0
X3NldChrdm0pKQo+IEBAIC00MzMsOCArNDMyLDggQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAg
ICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+ICAgICAgICAgc3RydWN0IGt2bSAq
a3ZtID0gdmNwdS0+a3ZtOwo+ICAgICAgICAgc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlICpw
Y2FjaGUgPSAmdmNwdS0+YXJjaC5tbXVfcGFnZV9jYWNoZTsKPiAtICAgICAgIGJvb2wgbG9nZ2lu
ZyA9IChtZW1zbG90LT5kaXJ0eV9iaXRtYXAgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAh
KG1lbXNsb3QtPmZsYWdzICYgS1ZNX01FTV9SRUFET05MWSkpID8gdHJ1ZSA6IGZhbHNlOwoKV2h5
IGlzIHRoaXMgbm90IGNvcnJlY3QgYXBwcm9hY2ggdG8gZGV0ZXJtaW5lIHdoZXRoZXIgbG9nZ2lu
ZyBpcyBlbmFibGVkID8KCktWTSBBUk02NCBkb2VzIGEgdmVyeSBzaW1pbGFyIHRoaW5nIChSZWZl
ciwgbWVtc2xvdF9pc19sb2dnaW5nKCkgaW4KYXJjaC9hcm02NC9rdm0vbW11LmMpLgoKPiArICAg
ICAgIGJvb2wgbG9nZ2luZyA9IGt2bV9zbG90X2RpcnR5X3RyYWNrX2VuYWJsZWQobWVtc2xvdCkg
JiYKPiArICAgICAgICAgICAgICAgICAgICAgICEobWVtc2xvdC0+ZmxhZ3MgJiBLVk1fTUVNX1JF
QURPTkxZKTsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdm1hX3BhZ2VzaXplLCBtbXVfc2VxOwo+
ICAgICAgICAgc3RydWN0IGt2bV9nc3RhZ2UgZ3N0YWdlOwo+ICAgICAgICAgc3RydWN0IHBhZ2Ug
KnBhZ2U7Cj4gLS0KPiAyLjU0LjAKPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
