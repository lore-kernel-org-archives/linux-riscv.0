Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD0ACD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/IqGxprlSyAFu4XvjoGWXO1daBEhKD3NwWTiOrHbco=; b=NH50Bbrt7FxAWa
	3TprsGlSgBBAhu+nNG5E7KPy+Z/8VrOF707AlTAoupBzbu4y9Zc4uq16H9EcrJBAi6Wfh0r4NRFc/
	tTkU95ZICC87tRijDVteO2Nb8jAI8c0jtDS/WOfp/M3Ugp1clJ8gz0hqlYUqOYEZF44DkfAWyMMhQ
	4yLidVEhoKdME68WQirS3R385h3v84/Be7J0sSnx2wzI80qUa25ndv9hvW2Otv7uoBz0PgxH6Z0Ks
	zVzS41gR9pTbZXWRVy/TYfzZdcGF2i0bm3PD4mogupAPnDHRPWGDDRdFhz1i2IMsVbQkyPbQyxwjJ
	eGCvhZP5h53ydVAOCW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNTo-00000002GMh-1ikR;
	Tue, 19 May 2026 16:39:40 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNTl-00000002GM6-1iOk
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 16:39:39 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7bdec52f48dso31317727b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 09:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779208776; cv=none;
        d=google.com; s=arc-20240605;
        b=hw5VMtKBPd4wW4eHP5w8rpXUyPVrwzBse2XQ2oA2TgdtkUMeuzoJFKXCbxpZ5oyGlm
         Nnvt7yb0Cnxyjwa+sGi9qu/HMb/QFEdrf/eUmzeeYqRG6QxVz5J9ixZGi+czRgHIJVOx
         YSXy9cGXw26DkBtdKF8lBmBQ8EcBfgRTm70OtG5LzJ3+7vje13OD2L9V5T/nz+aHxqb6
         oFGqXhzsJFvH7MCzsF6Iw6/X969zJk83IbAD28Ki9O9dFhGHvHgdke0F6b+Y3jpxqT8Q
         zv95+xNjne+1VKwRzMbjnQhE9s9WKTDxbS8SyIPE1zVhGZNyKCFbdryuPbEL9MukN9cj
         nVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9XOZzwqZh/Nt0S37qaMRQFNR8sQsoSQeVmxIa5b6lk=;
        fh=+SyZiNkbakePku4khnKgTq0EnQb1GxBasz0Xwnr2KQg=;
        b=D2wGjxGv0h/E9H6nYI09ZwmIZ56272DP3Z6Gs4+ClkufV7+oZviLHIJbiXOrVj9S0I
         axnStqBBmhWK30Q2h34+HYVp7D9jYxTy3lj0CjlhHoKSfExD53vKQCktVrCjqnvQjF3Y
         VHTW2L3/lRhzDgzi5gWAw6nzwi4SH4cV9dsolFrqFw6O9LFh1jb/tr3vD7LM5krT3SAE
         3e+i380Nc7OE3Nr9WAEQpGFj62h7qL7LNT0iyHOjO9EYknnXPbhCQRHmpssTpcCqDrbL
         xi5+8tw6goxsGvCIZBTYCbfS+7ySeIgsigyFSXzsnTVX9hoTEUjE9RrkmXtG47grb7vc
         BQUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779208776; x=1779813576; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9XOZzwqZh/Nt0S37qaMRQFNR8sQsoSQeVmxIa5b6lk=;
        b=asgE/GlWf8GeD1J69zUUSzK6uP27cBp6XdYawe5vbnCYus+XkI/6J20q+qLC5UPTi1
         fwP5t/CT+uUyoID5VkWKuUCRe/l9vHJ8PUlSw/bE8mSlA5vh7MMrGszzcjHJOG7mFA/w
         Iuy/OpmtBbFYnueO2bjTfe+vCav28W1KzYyDr9dEBM04KbjnirGNLaVZNOInPJWmB/R+
         Zf5AyLFij25DkJDxpDY8fGEx3xvp1EPJOV/6zrCObzd9R3bSnk/JZQ6//tTHmDfrZwfA
         cmqUPvy9/lM1vtPcax5wpOqvqaFjJyOG+CjqbTCbPSUIfxB23/3/KJg8WXjqOrq4OjRH
         LDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779208776; x=1779813576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9XOZzwqZh/Nt0S37qaMRQFNR8sQsoSQeVmxIa5b6lk=;
        b=cgVUVmoe0nCKMEklZ3To27TVSplBUiA/EcFYT2X7SLZshRTsYsuT/d3mvNIsbM6vz8
         OonXmFt80w9p2zTKjcNFi0QnVwsqByxeFh3zWe5zuqMTA18FxtRd5qzvIT0WYoyrQJkU
         xeSvQ1DxaD8OUKWkmZebL9BralYoxQwfzTL0mzMp6Cfqgivwy8yU4Ovc8P6ajq3hq8eZ
         DllK2zvQqcyftp09hwTtDNeLWeCmPu30zKIvtQ0JltUjXsJ1+8hr37NoXSSePnMO3ida
         zNlblvGIWtSlZ0Sb1fe9N2mjmnYSze4RNjKHqeNfjChjjJmOk07NAfZ3oDu9zwUMHxQt
         70Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/LhzxpdXMJpydH8eOPr8UZF3N0wCkZD6UvrYRPh0Nax/lH2XdbM9sbPg3ZZHspdRk7moEr0emXuj9H5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/iUkHTmgUjZRL6+uTepliVTb8YdMGcr5xX+yM8kL7Ys21knuq
	0Otfvl7coiRRIf1G5Pkro3gQ+xO2jfCgMrUi9Q11nIBkmJ0laKCiaMtwkBTevylcUJzA/uS9+3O
	bSC7YmQmh2iiFP1kPOMCIxE14Cw/F90aNsaWIcPuD9Q==
X-Gm-Gg: Acq92OGLg4SdsOi8XCLaJdq2ku7hzVbZhrWlDqJ5Y+AffKrSLFXi9uONDDdUqQEfpeW
	CpPb+M54LyJu3FbhIgb38J056VwH7hc8fUaT3s+tvdjBi0G+SPWGZEOCATwQfM37TgtvY4xTVfT
	mQcNJGCvUg+S0igvkwnoZEDtXsQIfZR+XMELln2cVj1E/Ae6qKfSpusdUjsh+DLrElFjaNDfzGX
	QgTxKiDejeFedIgPlBNGUeVicqWcp/KVH3n9VZfJ2uVNBa95GEsoelWIJvjVUZQCLtTTclboFAa
	R8AgMkaZg5XBUVqLXcWT3YdvePlnEpw/PcdQDA==
X-Received: by 2002:a05:690e:4007:b0:650:26c1:ee84 with SMTP id
 956f58d0204a3-65e0b04a256mr20453727d50.11.1779208776245; Tue, 19 May 2026
 09:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260519-vdso_cfi_makefile-v1-1-c129daba59f5@oss.tenstorrent.com>
In-Reply-To: <20260519-vdso_cfi_makefile-v1-1-c129daba59f5@oss.tenstorrent.com>
From: Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Date: Tue, 19 May 2026 11:39:24 -0500
X-Gm-Features: AVHnY4K9ZmhSAbWHPzXnQmtmarXseBfYeXy3CscEzf40vFgkyQwhWGhqGZaUY0A
Message-ID: <CAEev2e9bJfG0ueY4b=9zZ8stxzEAA1DBTM=D7De90zz+q152Vg@mail.gmail.com>
Subject: Re: [PATCH] riscv: cfi: add generated vdso files to make clean
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: thecharlesjenkins@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_093937_457722_AFB5E173 
X-CRM114-Status: GOOD (  17.73  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMTA6NTbigK9BTSBBbmlydWRoIFNyaW5pdmFzYW4KPGFz
cmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+Cj4gVGhlIHZkc28gZmlsZXMg
dGhhdCBhcmUgY29waWVkIG92ZXIgZnJvbSBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvIGRvIG5vdAo+
IGdldCBjbGVhbmVkIHVwIHdoZW4gbWFrZSBjbGVhbiBpcyBydW4uIEFkZCBhIGNsZWFuLWZpbGVz
IHRhcmdldCB0byB0aGUKPiBtYWtlZmlsZSBzbyB0aGF0IHRoZXNlIGZpbGVzIGdldCBjbGVhbmVk
IHVwIHByb3Blcmx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5pcnVkaCBTcmluaXZhc2FuIDxhc3Jp
bml2YXNhbkBvc3MudGVuc3RvcnJlbnQuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvX2NmaS9NYWtlZmlsZSB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc29fY2ZpL01ha2VmaWxlIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdmRzb19jZmkvTWFrZWZpbGUKPiBpbmRleCAxMDI5MjQ5OGI3NjU3
Li45MDYwMjNmYjVjMjdjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc29fY2Zp
L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzb19jZmkvTWFrZWZpbGUKPiBA
QCAtMjAsNiArMjAsOCBAQCAkKHZkc29fU19vYmplY3RzKTogJChvYmopLyUuUzogJChzcmMpLyUu
Uwo+ICAkKHZkc29fY19vYmplY3RzKTogJChvYmopLyUuYzogJChzcmMpLyUuYwo+ICAgICAgICAg
JChRKWNwICQ8ICRACj4KPiArY2xlYW4tZmlsZXMgOj0gJChub3RkaXIgJCh2ZHNvX2Nfc291cmNl
cykpICQobm90ZGlyICQodmRzb19TX3NvdXJjZXMpKQo+ICsKPiAgIyBJbmNsdWRlIHRoZSBtYWlu
IFZEU08gTWFrZWZpbGUgd2hpY2ggY29udGFpbnMgYWxsIHRoZSBidWlsZCBydWxlcyBhbmQgc291
cmNlcwo+ICAjIFRoZSBWRFNPX0NGSV9CVUlMRCB2YXJpYWJsZSB3aWxsIGJlIHBhc3NlZCB0byBp
dCB0byBlbmFibGUgQ0ZJIGNvbXBpbGF0aW9uCj4gIGluY2x1ZGUgJChzcmMpL01ha2VmaWxlCj4K
PiAtLS0KPiBiYXNlLWNvbW1pdDogMjU0ZjQ5NjM0ZWUxNmE3MzExNzRkMmFlMzRiYzUwYmQ1ZjQ1
ZTczMQo+IGNoYW5nZS1pZDogMjAyNjA1MTYtdmRzb19jZmlfbWFrZWZpbGUtZDU5MDA2ZjlkMDBk
CgpBcG9sb2dpZXMsIHNlZW1zIGxpa2UgYSBmaXggZm9yIHRoaXMgYWxyZWFkeSBsYW5kZWQgaW4g
Ny4xLXJjMS4gSSB3YXMKYnVpbGRpbmcgb2ZmIGEgdHJlZSBmcm9tIDcuMCBhbmQgZW5jb3VudGVy
ZWQgdGhpcyBpc3N1ZS4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBBbmlydWRoIFNyaW5pdmFz
YW4gPGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
