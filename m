Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E1DC001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdKZhyLpkwFMBcqaLcEQrnueAu4PNvlI55RiQVGJSVU=; b=bUBgxKJGdY7nKk
	4CcMGSjXmN7gAcsxjrymWGNJ9lfhY/k6WjGv6hpfdfaq57a+KXlXoutarKZyiYhKq3zv+uevhjEmI
	3DMRsIUZHlYMuahbR/c4CKyQaMfG2mCCrB+sv8OzZ7h56dZkXNrQhs63a+cPFmNPidy65fGh0p6PM
	kJwlr3IQUnFbeDdkfTkaFd/dq5Yw9a6ykqSSC7d8V9RwKe0NEj4IOLpnp5ZgMvk6a67f9OuYSyQMO
	nT5KPoRzFNOjWqeRBSX1jv/k8uO+cXXl1D0Dfr+q2CQmlT0uePuYyw02NoO1vbSvXz8Bdyg7CYqym
	fE6tsM/2FKD5vD2OUpxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyWH-004tLo-0o;
	Mon, 24 Jul 2023 16:34:49 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyWE-004tKU-2T
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 16:34:48 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a412653335so2723916b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690216481; x=1690821281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0f7dDULSRSGbAiEBcGCpBzTqX0S4cgJ92lbxxwD/4M=;
        b=G0xhoaWqCsA49wfGwRvWd3+cpyYiXn3zFV4GCVj2lRlGOBDB+NohaPhagTznarEdVf
         eBGN9YqI39qIUwiWiMicV/0u7Y8NkEONBFzjlZiuRyrZPbP/9CKN0poTBNP/4Y586IjX
         HBIEM/KZbHmUU0K2FsYMz66CvUJW5//bEsmJDTm56Qu/E3dBZUUa63FHP7vDhixLaEqg
         3VCsV9xvoJiQVrixrKfi19YCtZPg+GFuK3Y6MVUbtNZzecL+mvpvlcskhUTkNSjwcpeV
         43zdG2u2rNa40fvxl6Wg7IXxc8KEYozgxXQjOzHqJ/khKKQEDXx8yb+5ycpSSYfhCtAT
         4fzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690216481; x=1690821281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0f7dDULSRSGbAiEBcGCpBzTqX0S4cgJ92lbxxwD/4M=;
        b=Mm/LT9HWUqXU7aAcE/dhf5IqvjdW/wsuZWVOmhGKWGiExNGzAVKoE701RHoAnej82V
         xnz9EbuwByHAyx5aEvX4Al5CBJEnqrnws5wnTftzNozp2McA5m2C1WMhJSW+SVu6USSX
         VEjlNK6vzxKUkOBcyNyAfuYjFPIzQpTDukMAPHJ+saLhx2/xYeQAogel/1ioi6ZstIym
         E0papmzfitZt1vKA29wDJqqG0eowineP/kRF6JQ0mWkCxHfCO3Vh6BembpAasW7upFXL
         Rn0wXsW9RtqNV15oJoi5jdg3du+K5+HG79+EjuNZzbs6Mgm6trkGPZW048Ey/G8YmWFD
         sbgg==
X-Gm-Message-State: ABy/qLbUG/U6p5x8Ff2mBt/cftuG/YCLA1eanu0uGlMRv7SUbnePnU1G
	niMUurW9NQliWEBSCGbfKZt6xolXLvvHzHw2oGjtHA==
X-Google-Smtp-Source: APBJJlGInXVc1E3RZtNYMrgrV6W2iOsxT5eyUGh4CvVW3/7lGpA554jXtto0liwDdfIS0p99YwAyost0u5cLer3B2e0=
X-Received: by 2002:a05:6808:1389:b0:3a4:8a13:98a1 with SMTP id
 c9-20020a056808138900b003a48a1398a1mr14481780oiw.49.1690216480904; Mon, 24
 Jul 2023 09:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221124094845.1907443-1-debug@rivosinc.com> <20230720001852.GA572618@google.com>
 <CAJF2gTRFvSvEvQeDugdp73o7w4ArdtQ99JScEbLkaLnFcftVcA@mail.gmail.com>
In-Reply-To: <CAJF2gTRFvSvEvQeDugdp73o7w4ArdtQ99JScEbLkaLnFcftVcA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 24 Jul 2023 09:34:04 -0700
Message-ID: <CABCJKueNhc8qCbZbHJqdCB+PHHy0u5ETP4uWfpWBRaOMX6U6hA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
To: Guo Ren <guoren@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_093446_801577_6B579B99 
X-CRM114-Status: GOOD (  10.33  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgODowNuKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDIwLCAyMDIzIGF0IDg6MTnigK9BTSBTYW1pIFRv
bHZhbmVuIDxzYW1pdG9sdmFuZW5AZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQXJlIHlvdSBw
bGFubmluZyBvbiByZXNlbmRpbmcgdGhpcyBwYXRjaD8gSSBzZWUgaXQgZGlkbid0IGdhaW4gbXVj
aAo+ID4gdHJhY3Rpb24gbGFzdCB0aW1lLCBidXQgdGhpcyBsb29rcyBsaWtlIGEgbXVjaCBjbGVh
bmVyIHNvbHV0aW9uIGZvcgo+ID4gc2VsZWN0aW5nIHRoZSBvdmVyZmxvdyBzdGFjayB0aGFuIGhh
dmluZyBhIGBzaGFkb3dfc3RhY2tgIGFuZCBjYWxsaW5nCj4gPiB0byBDIHRvIGNvbXB1dGUgdGhl
IHBlci1DUFUgb2Zmc2V0LiBUaGUgYXNtX3Blcl9jcHUgbWFjcm8gYWxzbyB3b3VsZAo+ID4gY29t
ZSBpbiBoYW5keSB3aGVuIGltcGxlbWVudGluZyBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0ssIHdo
aWNoIHdlJ2QKPiA+IGxpa2UgdG8gaGF2ZSBvbiBSSVNDLVYgdG9vLgo+IEkgcmVtZW1iZXIgd2Ug
ZW5kZWQgdXAgd2l0aCBhbiBhdG9taWMgbG9jayBtZWNoYW5pc20gaW5zdGVhZCBvZiBwZXJjcHUK
PiBvZmZzZXQsIHNvIHdoYXQncyB0aGUgYmVuZWZpdCBvZiBwZXJjcHUgc3R5bGUgaW4gb3ZlcmZs
b3dfc3RhY2sgcGF0aD8KClRoZSBiZW5lZml0IGlzIG5vdCBuZWVkaW5nIGEgc2VwYXJhdGUgdGVt
cG9yYXJ5IHN0YWNrIGFuZCBsb2NrcyBqdXN0CnRvIGNvbXB1dGUgdGhlIHBlci1DUFUgb2Zmc2V0
LiBXaXRoIENPTkZJR19TSEFET1dfQ0FMTF9TVEFDSywgd2Ugd291bGQKYWxzbyBuZWVkIGEgInNo
YWRvdyIgc2hhZG93IGNhbGwgc3RhY2sgaW4gdGhpcyBjYXNlIGJlZm9yZSBjYWxsaW5nIHRvCkMg
Y29kZSwgYXQgd2hpY2ggcG9pbnQgY29tcHV0aW5nIHRoZSBvZmZzZXRzIGRpcmVjdGx5IGluIGFz
c2VtYmx5IGlzCmp1c3Qgc2lnbmlmaWNhbnRseSBjbGVhbmVyIGFuZCB3aXRob3V0IGNvbmN1cnJl
bmN5IGlzc3Vlcy4KClNhbWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
