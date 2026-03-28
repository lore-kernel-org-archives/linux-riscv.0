Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AD810F3DE2
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7JPV8/KQyuM9mCmDZha/Up8mnZvdJGXmk8jcuGCkCI=; b=CoI1qlaBq0Ofgk
	a3eY47vHBqNsZ5JNvnQCUPWoyHiNjgV0kyKqM5yFOXJw4Eprhv1qP4RkqXvC8do132GfkmE7l/V+w
	J8oi/81aJLzdNdrpQ227UHyzoNGlPKh0JFzxrwGLY0YzZtMcoRTQjJ6ld31WXNOTeCkS89wOkzjki
	oJtK/Umc+FUYLUNx74g5gKRWV9bCtTvwH8ncpKdLJaXD5mei2zK02e1nHMrFoOwru3BUBGheaOWFg
	DIZGcyGkBh8Ijy0Sy7EkNAjmwsrCLL4K460tVnpYfPM81vR69m7kOC5cdWi+PjsTsTabKvyJ7kVTT
	gS73U3qap9aobsXQ6mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QZ4-00000008o4c-1Di7;
	Sat, 28 Mar 2026 10:06:46 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QZ1-00000008o3x-3g2W
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 10:06:45 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-46702742c99so1960056b6e.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 03:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774692402; cv=none;
        d=google.com; s=arc-20240605;
        b=emWEgVCNnQJQPHzrE3WCLk/qF0QcuTXy+3U0J4cCXYNOLM4SdnFI1W2pjxZZVVavWj
         tTlk0cP6NGvSVB90OAhCoSQEIivZXX6j9dHIS2LjanBZczVt3bI/lkzSRTit+tTrrwER
         8tcbrtPX3+0c3UBe8HGzIc6GCpBBQZ2j6lywYT2off4FDqoMv2h4mXrlhPjEvOqo0zxt
         73tfH+oJ8F8m/Gfc5uz8t0RQ5vMx9shJYJAQcU7AN7ICmxO6eBT2hwhN9pzNWy7vlNh3
         nyG5yLn/GoAwPweDxGh2ECdrpuTypViQqnGoc0yBsjdh8Xd3FsD8cWRNMvS44fHJD2Vi
         jq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hfk8WCjcSH9rv2rGOCgYWMqdh0uuxmNhxPE/XH9vGjo=;
        fh=0t23T4BtSjjNh8japVbx5+E6+qoheBD1WFiU1ni8mzQ=;
        b=kQec8sV5Kks2cHp4aLoLH8VEzb0CSCJkSInGPjMTjSTP33XEf2SerTzhkEwQwMHsmT
         5syk6re/hOugi82jGhT8IDlHEDPT9ATH4kxtAaA4VjPiNNY01ZD4GpetYRz9D5Ueo9aB
         pLzuhH/ejQaY1wFfZLzm9JMBzM1y8IBrv10a3lM9oNSmvM8b8B7g6M2FyifSobGWnpui
         AvyaprJP1TDwYzwhxX2IvJZ3Rv7+NDSglQfjpzGmRI8s34HpMqGorAKQ7B17I/Q/0C7E
         AePA9s07qgMFJO3Vn5JSKTYEJZ8b/zl93V5P6mgY5pXx5KdHAnLh4+rgAh96TLUxkQ2G
         2SLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774692402; x=1775297202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hfk8WCjcSH9rv2rGOCgYWMqdh0uuxmNhxPE/XH9vGjo=;
        b=ULQhz5YtlBvBxQwSdvI9ofdHqjmMqTrkEeqgB55aDP2vZ3VHLNj653kj8hlHtU97NJ
         g3sK5yFelFfJP6t7Rwr7oaEY3DtXhR4SZzIPM5TNfp2k8hdBZexRViro1PokC+GBfH/w
         eSlROWWsbc/CC7WGgkwjmF2CmPwfsPT/MYPidHJYsXg6rIXEPPsmgyGrcXeXLLdcKwMo
         ubxPUjrzUHfay+XCOxiDgcuj6GrqcP9p6Gm0bgsCSUHSjd2i/xYxG/kTMgNzMQGVRH3x
         xh7vl4fZDZmrbVGU7s8oyaVm6JcggAlM+L7gdATfNe0CR6YCBgIn4ClvvRhOZ36wqkkP
         fsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774692402; x=1775297202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hfk8WCjcSH9rv2rGOCgYWMqdh0uuxmNhxPE/XH9vGjo=;
        b=RVDSvy4oSwcv40cKaCf8XHUuXxwAr/VCYTQAb0RP4bfRxMP5E2mlicnKXHlnolVWo+
         YrON/dlFIM1a3QSzt7fE7rSU2f0qzLY86sgVwlvqQ1UWPk9PH2a/p3Y5rWiGDW4LsCxt
         bwH8f7SOoF6k0+WRve0hTaUl9C82gmiDbYoYQWgRG1TE8ljiueoVddxW4F6Wkl+UiRLy
         vwCqUQtYQG3MKBnwuF87mfEBzRYqSVtWOzuU8bLeAotRMQkGp9R8Z9c0ymKk3JyIJsL6
         4QVNeudeLUGGpGyplIGW+Nwx6ADw6vdgmarmvVffBAB3e1LvNLM7FCriDt+X3RBYEV80
         aizg==
X-Forwarded-Encrypted: i=1; AJvYcCWHWUlGW0vq42mW5I96OUDgA/DvUxwQ/Y6wPZysOgEIOTFLnDejnU1tZONK/WouyV8bDHb4vAjSHf7F8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqFZHo6AtEqqTbu24UoiI6M5GoUjarRHehviM8oqe9p4JzHJII
	xx4OCVNos0I2QnvTXzZERhN5A4HaJR+5IKGq8uR2IluVGWHDrGOPoQY11l8x5yysHD1mUCRvKSr
	xQhP9rG+Q0AboM3NfZLSjWpjdPOZn7wwP64coEmzspw==
X-Gm-Gg: ATEYQzx7y0ochTb8/whuJWTPAcxvYvIEvTdp4T/qwyydeulq2uetjbJsM1GppPEPatK
	j9z2GmS+1bmdHjdtIQvfOVc1uMBBaOq7sVuyAl0F4ki8+zp+5wfRzTiIZptrKlxeiV+bsmDfgKa
	r2Q4QyIU7jriiJ3/7lkj9h/WQqMDMsAKzFToLQlx9ZNvOdfcCwgX0F722PMqmiiRZngTmxdqjTE
	q2wuHfLhvILpI1Zh5eB06OgizsX7AXsf9UYHD774n+yioGUYaLgU8DRVdcQG99Y6rad6ecIYFDh
	/qpHo8dTDGq1H02NRZ/hfq1V+PtUJE1V+/xQQ+k2pbqRzfG//Ryjoi5U93PqPYoc/nPRgJvXx8l
	RB/XsXt5uYD6TNJJtjiNx253AnAE=
X-Received: by 2002:a05:6820:1744:b0:67e:16b4:aa07 with SMTP id
 006d021491bc7-67e1877fb16mr2519511eaf.61.1774692402504; Sat, 28 Mar 2026
 03:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260328092157.75058-1-yufan.chen@linux.dev>
In-Reply-To: <20260328092157.75058-1-yufan.chen@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 28 Mar 2026 15:36:31 +0530
X-Gm-Features: AQROBzDbSN0ndaTo0i3wUYARAGuUJ9U0NfN66GMvIm76mGAmAZYGMorETfeVvDE
Message-ID: <CAAhSdy2uvN20G=fy4dRDqzkh_wKw9RyyMMM1p_A6g_HYYrSVjQ@mail.gmail.com>
Subject: Re: [PATCH] riscv/kvm: fix guest vector leak on host alloc failure
To: Yufan Chen <yufan.chen@linux.dev>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yufan Chen <ericterminal@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_030644_167982_6FA55E1B 
X-CRM114-Status: GOOD (  14.40  )
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

T24gU2F0LCBNYXIgMjgsIDIwMjYgYXQgMjo1MuKAr1BNIFl1ZmFuIENoZW4gPHl1ZmFuLmNoZW5A
bGludXguZGV2PiB3cm90ZToKPgo+IEZyb206IFl1ZmFuIENoZW4gPGVyaWN0ZXJtaW5hbEBnbWFp
bC5jb20+Cj4KPiBXaGVuIGFsbG9jYXRpbmcgdmVjdG9yIGNvbnRleHQgZm9yIGEgdkNQVSwgZ3Vl
c3RfY29udGV4dC52ZWN0b3IuZGF0YXAgaXMgYWxsb2NhdGVkIGJlZm9yZSBob3N0X2NvbnRleHQu
dmVjdG9yLmRhdGFwLiBJZiB0aGUgc2Vjb25kIGFsbG9jYXRpb24gZmFpbHMsIHRoZSBmdW5jdGlv
biByZXR1cm5zIC1FTk9NRU0gZGlyZWN0bHkgYW5kIGxlYWtzIHRoZSBndWVzdCBidWZmZXIuCj4K
PiBTd2l0Y2ggdGhlIGZhaWx1cmUgcGF0aCB0byBjZW50cmFsaXplZCBjbGVhbnVwLiBPbiBob3N0
IGFsbG9jYXRpb24gZmFpbHVyZSwgZnJlZSBndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCwgY2xl
YXIgdGhlIHBvaW50ZXIsIGFuZCByZXR1cm4gLUVOT01FTSB0aHJvdWdoIGEgc2hhcmVkIGV4aXQg
bGFiZWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWZhbiBDaGVuIDxlcmljdGVybWluYWxAZ21haWwu
Y29tPgoKVGhpcyBpcyBhbHJlYWR5IGZpeGVkIGJ5IHBhdGNoICJyaXNjdjoga3ZtOiBmaXggdmVj
dG9yIGNvbnRleHQgYWxsb2NhdGlvbiBsZWFrIi4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgfCAxMiArKysrKysrKysrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9y
LmMKPiBpbmRleCAwNWYzY2MyZDguLjRjMmY5MmRjZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+
IEBAIC03NSwxNSArNzUsMjMgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9ob3N0X3ZlY3Rvcl9yZXN0
b3JlKHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNudHgpCj4KPiAgaW50IGt2bV9yaXNjdl92Y3B1
X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+ICsgICAg
ICAgaW50IHJjID0gLUVOT01FTTsKPiArCj4gICAgICAgICB2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRl
eHQudmVjdG9yLmRhdGFwID0ga3phbGxvYyhyaXNjdl92X3ZzaXplLCBHRlBfS0VSTkVMKTsKPiAg
ICAgICAgIGlmICghdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkKPiAtICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
Cj4gICAgICAgICB2Y3B1LT5hcmNoLmhvc3RfY29udGV4dC52ZWN0b3IuZGF0YXAgPSBremFsbG9j
KHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJORUwpOwo+ICAgICAgICAgaWYgKCF2Y3B1LT5hcmNoLmhv
c3RfY29udGV4dC52ZWN0b3IuZGF0YXApCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+ICsgICAgICAgICAgICAgICBnb3RvIGZyZWVfZ3Vlc3RfdmVjdG9yX2RhdGFwOwo+Cj4gICAg
ICAgICByZXR1cm4gMDsKPiArCj4gK2ZyZWVfZ3Vlc3RfdmVjdG9yX2RhdGFwOgo+ICsgICAgICAg
a2ZyZWUodmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCk7Cj4gKyAgICAgICB2
Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwID0gTlVMTDsKPiArb3V0Ogo+ICsg
ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4KPiAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9mcmVlX3ZlY3Rv
cl9jb250ZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAtLQo+IDIuNDcuMwo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
