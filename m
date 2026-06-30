Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082FFC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 04:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5B0SJe+9YBcK1pZaA7zfNz8y6qztQkSeYQRSYsONptw=; b=Gc4fjp1oQli14W
	LortHLue5nZNKlOlUVLm1kvde90g5j4f2KyKpzvQy1kzevc5y9me57u85YiOZOPNz/c6JP9yTLcT4
	zE3UVYusr+iUJNhQ4moNeGHHLcZFVzP7nsL77WoSxYyqE99w7gu27XsyRLqcdDD9PMyiOVbcGyzk6
	fF6UArqgoWFYf+ALijMmP909hv+kIj0OH0/2lFxEB48OZp8oFW/zHyrT4HKbGRU9uye3UPZWvOhrY
	S2OM7Lt6sSe0TXXjp+b7McQ50kzrQRpZILwjRPlU5YmkMaODKrpNGGc6kp/QX3nbjc53T5Gl1SqGv
	s5qU1ujLHOM01q7++mcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQJQ-0000000FmVW-0PR1;
	Tue, 30 Jun 2026 04:43:08 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQJM-0000000FmV3-3dLd
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 04:43:06 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e9dd333d37so459061a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782794580; cv=none;
        d=google.com; s=arc-20260327;
        b=Umnrxuc5YqQ8vdF48aqKYaUYkzGAqC5YvvdoFucV1CQY/9Kg4eBgzz6Tare3ZDcKKZ
         /X+ibAmeAwQmzNwtOgI4DKHcWbk/z6AwkAqphRQBX36FCV9JJOIy7FhHL+rwP+1w46+o
         soNlsaE1iCgRgfA3dTQ36lvmdUX/4AT8lAI+qiZL9adLRxG0C6RbAIpKvhoORmQY7taa
         1jaNv59M9aP9uj8B2bnxnPfLi7ivsYF+J7YlDCs7Pa3JEjdB3YDjSCwqVpZU/p1l5fLV
         vWcBoVRNkEdA6955COvjAv3iZT+sJYzso4VWYaCDWG3VYp9Ux7+Yxjo6CrMjGFxgri30
         N82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TkcngDtZZBcSBYuktpVSvj/Zq3c5gyjbDMX0CALcXeM=;
        fh=GIdbkGKxM+CmL6NrUWz2WZFHk0bQoNr9sGveA9BhYR4=;
        b=X1/bXfXyYJfONdRveTTHmQzvL8jLXsBf/Trau6Ept/h6XZWkwTMQ18ztHAB/7tOkqz
         c/FtHbWMLqEgS6BQ7ZwKp4FdkxUATPYJ/qwzmoB6bC1bBM9QBX97TZTnxZ5Ap2jk5gI8
         QmrnwSj9BXHB+XKF3whKmaPIXuG0zQ2d44ITDzQr4E0pr5aCxgCTKL7ReijAwWtCmkdv
         MpgcaD23MIMHVXXHRM1Uvi1wyDo/vI2aNVoP6KGXK2OzNUSPSSp5zWESHKMTnRD535af
         jM5OWa416H+A0Zvm1vtROHZ5k4DyVM1dVzFBGzShomGAt71TBRSdX/3p9Xz/IMuaGQRz
         A45w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782794580; x=1783399380; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkcngDtZZBcSBYuktpVSvj/Zq3c5gyjbDMX0CALcXeM=;
        b=V0/ppZXmoPONi2CJ1zteipC9OwUHHfL8i1z4zGfEG1BqDzz1u3GTyvv8dnw3jaYVCO
         8V0B6vzeZKf/6DI9XJDapt3VrbE2MpW5BU/yWdX6cjXdqS/BpdF1zX/fEdxrje9xLkmC
         uXdRVfygwTN7HJCu5lm8ZJywsXOAgZQqIqddmg/6Q1kq5188Xd5Vk+YzM9sjIYOfW+hk
         J7jgoLOLZb1Qymk6Gu6FnWdBpSs7TFP5H8K7/y7Ijm9gLYNNPPInDituD96z0lQbgCyI
         CYOeC8oefNWTWQtjf06iOdVzE3jhC9xuMNyb+1uWeuEZJtdBN5L4eBz1oVeWKELucNYP
         VbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782794580; x=1783399380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TkcngDtZZBcSBYuktpVSvj/Zq3c5gyjbDMX0CALcXeM=;
        b=BAb7Z0njMU0Ur/WI3KFa7Tw6Mo97Psg8hUO3Fi8lbL4e1cYCKSM6dQkkyJOOeniwXo
         vHRi00v/xfaa7B2ni4ClR2QcBmTEadKnz7Ld02zxHkXyunKJCf6yb7YicuI/ZeNxdLtx
         AViTA9qKajIxNnizfkKFSL6219Ncy3NbqRSI2RcyH9c0o9J8BVji9zl/5jxHhJYIaNqj
         fEzVLBGM/2g84KSGuayuLqW/YVEqopbyocpKKqwUwifk0d2Yyf+iC86Sg+dEhhukUA2F
         fBGDc4tTfJBVu/6VRIRIPBCmujmDtGo8PE1Od88WwDDtdoR+OxO96KVj3v6U0LfAMDi0
         P3vw==
X-Forwarded-Encrypted: i=1; AFNElJ+KAjX6x73eyaDisCLGhjqzVGCEEczx6VqPIqUfx/NUH17qpArqrUpBc2vdZyLDtCxXSuy2LN8OpgF1bA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKQZvZNC1DI00WKkDbioSZczZzbKa+DJaC4RdjDeCEWABifzrT
	kdmrzaFvv6mOC5AqLebRAfKm4UlQMJbR7SBpc/ANxVw5viyCa7K5fWbgjrsrcYX7p9YUKRa22sb
	k5BjD11MVgooCkPQW4rWc0mEGGSa4OONjCLlxKQD0Jw==
X-Gm-Gg: AfdE7clFLbjSDmLzCYbUjxgOo8052EnlS2kodGHw8VenowRxdavkHmUR8I/z8Hmu7gn
	WDzFDilRZ4jFDlvVtwgFXmtrpfgFvbCNadNhiodBoh0z7RAy2+rKoFQJT2tMi0GWiXcNNkYv1Bs
	eyBam3TbEL7cdDiqH7xzUV8fh0d/kSwnJGJl6v3x4RJTP4uJf08jB+m9Cv+d+b/Hz/gzYfPA778
	uuXx5HGa0L3BTrAQPRjkSPVZGMIAALnqGhycHUHE+6ZA693aCXviPmoahFs0h2x1YaSSIbBcjo=
X-Received: by 2002:a05:6808:c2f8:b0:492:5bf0:d29e with SMTP id
 5614622812f47-495eafc41a8mr2097270b6e.34.1782794580112; Mon, 29 Jun 2026
 21:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260523042052.35476-1-cuiyunhui@bytedance.com> <20260629210432.ef76ce885cd9ccd28b7a2127@linux-foundation.org>
In-Reply-To: <20260629210432.ef76ce885cd9ccd28b7a2127@linux-foundation.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 30 Jun 2026 12:42:48 +0800
X-Gm-Features: AVVi8Cf2cA6T1Xo7mNpI3K1o6jk4PWx27zkWEacArefsJbxedBCHcATc89AHDzk
Message-ID: <CAEEQ3w=XVq_y1kG8YTHkwavB59R3kJXonX1G+QmB+TTin-BFOA@mail.gmail.com>
Subject: Re: [External] Re: [RESEND PATCH] riscv: mm: exclude invalid THP PMDs
 from page table check
To: Andrew Morton <akpm@linux-foundation.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tongtiangen@huawei.com, pasha.tatashin@soleen.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_214305_234654_42652C71 
X-CRM114-Status: GOOD (  25.46  )
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

SGkgQW5kcmV3LAoKT24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTI6MDTigK9QTSBBbmRyZXcgTW9y
dG9uCjxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgMjMgTWF5
IDIwMjYgMTI6MjA6NTIgKzA4MDAgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+Cj4gPiBSSVNDLVYgVEhQIHNwbGl0dGluZyB1c2VzIGEgdGVtcG9yYXJ5IGludmFs
aWQgUE1EIHN0YXRlIHdoZXJlCj4gPiBwbWRfbWtpbnZhbGlkKCkgY2xlYXJzIF9QQUdFX1BSRVNF
TlQgYW5kIF9QQUdFX1BST1RfTk9ORSBidXQgbGVhdmVzCj4gPiBfUEFHRV9MRUFGIHNldCBzbyB0
aGUgTU0gY29kZSBjYW4gc3RpbGwgcmVjb2duaXplIHRoZSBQTUQgYXMgYSBUSFAgc3BsaXQKPiA+
IGluLXByb2dyZXNzIGVudHJ5Lgo+ID4KPiA+IFRoYXQgdGVtcG9yYXJ5IHN0YXRlIG5vIGxvbmdl
ciBkZXNjcmliZXMgYSB1c2VyLWFjY2Vzc2libGUgbWFwcGluZywgYnV0Cj4gPiBwYWdlX3RhYmxl
X2NoZWNrIGN1cnJlbnRseSB0cmVhdHMgaXQgYXMgb25lIGJlY2F1c2UgdGhlIFJJU0MtViBQTUQK
PiA+IHVzZXItYWNjZXNzaWJpbGl0eSB0ZXN0IG9ubHkgY2hlY2tzIHdoZXRoZXIgdGhlIFBNRCBp
cyBhIGxlYWYgYW5kIGhhcwo+ID4gdXNlciBwZXJtaXNzaW9ucy4KPiA+Cj4gPiBBcyBhIHJlc3Vs
dCwgd2hlbiBhIFBNRC1zaXplZCBhbm9ueW1vdXMgVEhQIGlzIHNwbGl0IGR1cmluZyBhIENPVyBm
YXVsdCwKPiA+IHBhZ2VfdGFibGVfY2hlY2sgY2FuIGFjY291bnQgdGhlIGludmFsaWQgaW50ZXJt
ZWRpYXRlIFBNRCBhcyBhIGxpdmUgUE1ECj4gPiBtYXBwaW5nLCBhbmQgdGhlbiBhY2NvdW50IHRo
ZSByZXBsYWNlbWVudCBQVEUgbWFwcGluZ3MgYWdhaW4gd2hlbiB0aGUKPiA+IHNwbGl0IGluc3Rh
bGxzIHRoZSBQVEUgdGFibGUuIFRoaXMgbGVhdmVzIHN0YWxlIFBNRCBhY2NvdW50aW5nIGJlaGlu
ZCBhbmQKPiA+IGxhdGVyIHRyaWdnZXJzIHBhZ2VfdGFibGVfY2hlY2sgZmFpbHVyZXMgc3VjaCBh
cyBhIG5vbi16ZXJvCj4gPiBhbm9uX21hcF9jb3VudCB3aGVuIHRoZSBmb2xpbyBpcyBmcmVlZC4K
PiA+Cj4gPiBGaXggdGhpcyBieSB0aWdodGVuaW5nIHBtZF91c2VyX2FjY2Vzc2libGVfcGFnZSgp
IHNvIFBNRCBwYWdlLXRhYmxlLWNoZWNrCj4gPiBhY2NvdW50aW5nIG9ubHkgY29uc2lkZXJzIGxl
YWYgUE1EcyB0aGF0IHN0aWxsIGNhcnJ5IGVpdGhlcgo+ID4gX1BBR0VfUFJFU0VOVCBvciBfUEFH
RV9QUk9UX05PTkUuIFRoaXMgcHJlc2VydmVzIHRoZSBUSFAgc3BsaXQgc2VtYW50aWNzCj4gPiBy
ZXF1aXJlZCBieSB0aGUgTU0gY29kZSB3aGlsZSBwcmV2ZW50aW5nIHBhZ2VfdGFibGVfY2hlY2sg
ZnJvbSB0cmVhdGluZwo+ID4gaW52YWxpZCBzcGxpdCBQTURzIGFzIGxpdmUgdXNlciBtYXBwaW5n
cy4KPiA+Cj4gPiBXaXRoIENPTkZJR19QQUdFX1RBQkxFX0NIRUNLPXkgYW5kIENPTkZJR19QQUdF
X1RBQkxFX0NIRUNLX0VORk9SQ0VEPXksCj4gPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9j
b3cgY29tcGxldGVzIHN1Y2Nlc3NmdWxseSBvbiBSSVNDLVYgYWZ0ZXIKPiA+IHRoaXMgY2hhbmdl
Lgo+Cj4gVGhhbmtzLiAgVGhpcyBzZWVtcyB0byBoYXZlIHNsaXBwZWQgdGhyb3VnaCBjcmFja3Mu
Cj4KPiBBSSByZXZpZXcgYXBwZWFycyB0byBoYXZlIGZvdW5kIGEgY291cGxlIG9mIHJlbGF0ZWQg
YW5kIHNlcmlvdXMgaXNzdWVzCj4gaW4gdGhpcyBjb2RlLgo+Cj4gICAgICAgICBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjMwNDIwNTIuMzU0NzYtMS1jdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbQo+Cj4gcGVyaGFwcyB5b3UgaGF2ZSB0aW1lIHRvIHRha2UgYSBsb29rPwoKVGhh
bmtzIEFuZHJldywgSSBsb29rZWQgaW50byB0aGUgU2FzaGlrbyBmaW5kaW5ncy4KCkJvdGggZmlu
ZGluZ3MgYXJlIHByZS1leGlzdGluZyBhbmQgZG8gbm90IGFwcGVhciB0byBiZSByZWdyZXNzaW9u
cwppbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2guIFRoaXMgcGF0Y2ggb25seSBjaGFuZ2VzCnBtZF91
c2VyX2FjY2Vzc2libGVfcGFnZSgpIGZvciBwYWdlX3RhYmxlX2NoZWNrIGFjY291bnRpbmcuCgpU
aGUgcG1kX3ByZXNlbnQoKSAvIF9QQUdFX0xFQUYgLyBzd2FwIHNvZnQtZGlydHkgaW50ZXJhY3Rp
b24gbG9va3Mgd29ydGgKY2hlY2tpbmcgc2VwYXJhdGVseSwgZXNwZWNpYWxseSB3aXRoIENPTkZJ
R19NRU1fU09GVF9ESVJUWSBlbmFibGVkLiBUaGUKcHVkX3ByZXNlbnQoKSAvIF9QQUdFX1BST1Rf
Tk9ORSBjYXNlIGFsc28gbG9va3MgbGlrZSBhIHByZS1leGlzdGluZyBoZWxwZXIKaW5jb25zaXN0
ZW5jeSBmb3IgUFVELXNpemUgaHVnZSBtYXBwaW5ncy4KCkkgd2lsbCBpbnZlc3RpZ2F0ZSBib3Ro
IHNlcGFyYXRlbHkgYW5kIHNlbmQgZm9sbG93LXVwIGZpeGVzIGlmIHRoZXkgdHVybgpvdXQgdG8g
YmUgcmVhbCBpc3N1ZXMuCgo+Cj4gPiBGaXhlczogM2ZlZTIyOWE4ZWI5ICgicmlzY3YvbW06IGVu
YWJsZSBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0siKQo+ID4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRl
ZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgg
fCA5ICsrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IEknbSBub3QgZXZlbiBzbGlnaHRseSBhIHJpc2N2IG1haW50YWluZXIsIGJ1
dCBJJ2xsIHF1ZXVlIHRoaXMgdXAgZm9yCj4gc29tZSBsaW51eC1uZXh0IHRlc3RpbmcgYW5kIHNv
IEkgY2FuIGtlZXAgYW4gZXllIG9uIHRoZSBpc3N1ZSwgdGhhbmtzLgo+Cj4KPgoKVGhhbmtzLApZ
dW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
