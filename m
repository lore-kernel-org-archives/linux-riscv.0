Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C23E95376
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvSfffQMa+5Z9pwkHCW9qUesjWi1L2ETFXkA82xZvJQ=; b=Omn5YMM7puwA91
	iOqgRztuif3tB05G53r+iotsjgokmKvhUlJGxydVaxndzQum3bDQK5tHpQNXWL5xVsFHcu6K+FalM
	/bSHtGU/YTcsQN6Z1kCgZEHOM/7zKxoW7f7jf6VBo3H1ojZCajxUfERywAr0JlrSWDJYBP9uPcPHg
	KDM3ZEpJH6ZSXp83Q2UlQ3zOyFt2rPu9MKkt1HXdmhL0VW9FO/msWuOPvoX8HoGUe5B8B3wCxNoeD
	J1o9A5pedAkoh4433PoMOchpCGbzkG4kKuXPioNv9PNdyV96y9qy48Jh8CHLBCxZKZmgeSkcReajx
	4Lxcc1FODSdPADnsz/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaOK-00000008Iqn-1XSN;
	Wed, 04 Feb 2026 10:45:48 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaOG-00000008IpY-3PCq
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 10:45:46 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7cfd04f1be8so2836322a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 02:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770201943; cv=none;
        d=google.com; s=arc-20240605;
        b=kEkahO3vMG0s4x8rkLsLMusO0AXBsyybDM8a9rpMVT+Zy0smpBJBge4+nHC0p9okKC
         BeTRWHeTLAkODnEwgAJoZ33ZHHVT+C1cAD8gUhjVvbIZe/KVD6J/ZFVRSAIpT1gNlK1k
         iTO61EZE5upoKp63v7QiCLLYWLEBtcLeOr/LImkavwo0con3aS5DEvSf0iDSFjQT9NwX
         34MT6XPPrzIQuHEAYmL9Zci8V5mSF8/8aEx9ymsTWo0LyLebCFP2YE3YkZaInEuqTHrT
         ylRW/EqufGGCBx/E3qMnycPEZPZdg/ipZW+XowtmYMHrccEJRk8RLDOZcquZe/l38FJO
         DJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MxBI3Px7yFYe/I8uXtDTSK/tYhQEb2S2RBT2z3tyr+o=;
        fh=nlidTO2qDHG85XmT9TupsXP93wF73Ag9oEij3h6myOg=;
        b=YUTpPXoF4IBvUGhdXJ1KcLLHF09/UiDNQhFnTZ/evFOnn7Fpo4XckD/f4zSijQueDk
         lSv0vKAiRP1jhJbyKd9i4BdnE2nw7oA/1W+8X3gdnZz6Hc9dlyXpj8jC2nNPh0WwWrZ5
         ApdhzwH+7TuxGS7s34UwUjWKdLIj0FDnyr0jWMppNXbpQj8lauF09lTL6GlblwXp5uXC
         gnT4sHKQX28AA+wNGcIi+RaR7n4DyYJUmMRf3O0stfmUyvo1oUr/HdaZH+pI+TZ5oxW4
         2xJ+FO2x5GIyTTzVtLuCgvuyXTKBeNjOswkumYsZwDuw/nms3yX0vme+jJzm1Nc2aJTp
         MhqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770201943; x=1770806743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxBI3Px7yFYe/I8uXtDTSK/tYhQEb2S2RBT2z3tyr+o=;
        b=y2aUFKB2SxfxUfofizCOYwmIes4bAizW+m2J1ZpNUjWQHLxzoKPEh+FX4NcGJv1QAE
         3rpInnPpQSENSxG+fV+Wd4r/v7yzSzkCP4mHvRXMNQJff/xD5Hlj5MRVqPElFpRys5k+
         xS1cX6nYX7VQ1vg3+n+OL39NKmtBk3AZ4EeVJVGqyeIuMlvVEg3WF/fi5oOPMGHFO1c5
         KrrWSb6oJCEIuEwahGWX4OgTEwh3zIxIyoXC1SI7VgU/Pr48QsF343AOLO4xEvP/Mk7F
         859eBZ3Su2HTVmxrgEskrRL/x/QYjYyx3ua4D7YlIzaeo4Hxj1hj3lHXrsS1eUVkSMA9
         5A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201943; x=1770806743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MxBI3Px7yFYe/I8uXtDTSK/tYhQEb2S2RBT2z3tyr+o=;
        b=tdte3vinFQprgDMqXTSDTh+Z0JUMliJcOVuGp9ID25it2KZYrourmvopQIML3RyHrX
         zYUvPDC+ZAFR9qu6P+Ev+b9b1n74Z/hhNOpt1k/5uKx2rIarqZfzgef3ty5SYvhak3bI
         Ov7jGN31ViJPfbS7iVkWHWGJtRLnbWgPZ3YbBz+PAHjg4jXIC0tl9Lm9B0X7vTPh0/nJ
         W1kkWjOXbMS4+nl0B5y4AQsq4hL34Dqlij3NEON9FMk9GIWeZ7OKF5pGlwRs9V7o2zsm
         +bc4ySyqQowJ4S8GrA1AUiD/YoxKPgwIFtf9q+9HQXDQM5oOse+B/InYHt4uDH81xKq3
         JxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl3TEPyL3n5pRm6wk5p5kU+5hkpLFT01Kguznz6Z+PcOh5em50MTJlA/Rfghjp7UZ+U7jIoyIFy+0VUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJbL/oWjXsZd4EwuFENk5dIymasHQ0R5rMfN0Rb9ZVZGe5movJ
	cNRN7+BIlAeV9n1SjhpBrJwO3Ets0N986PyKwac+/38PRQ34lQC7LL9n2sE5ryfS+RiCiuCUIUB
	1/K4iPQwQM9x8Ezd9C4WD/nAbJbCbkmP/QnVjuOTAxQ==
X-Gm-Gg: AZuq6aJKJMPlP6K/MrLfqpRlrVHUTZ0RcRAWunH0A7j1l8AiiKzP3R8DLXnFEJvvnbW
	vwu5L7VLdymd6Q01xDO6vVvdCZMU1UQsIZjS+e6l1RCRRuUoKvJT1t7crx7Gs2Yduwey3c7bFd0
	rbAkleF87H9fl7SzvNuNxqwExgJ1rEF/1b9lnXYb81fYlD7uDsfhOPyMv9yqRptACKENrcGeDFG
	adiiggD1VBIajxpzim0YeWFWHjs15yiiV60HiyYBmHYy5MPZBw785yNoYAyp5kDrk84PZGrbk9o
	i+wP+xArSrvxvvjQBNGG9D2fSE7rVYngMrrQx0GljjJmgSt/u5s+LxnMfw==
X-Received: by 2002:a05:6820:2d08:b0:668:d715:108f with SMTP id
 006d021491bc7-66a2390a170mr1139399eaf.73.1770201943318; Wed, 04 Feb 2026
 02:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20260202111728.4067036-1-qingwei.hu@bytedance.com>
In-Reply-To: <20260202111728.4067036-1-qingwei.hu@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Feb 2026 16:15:32 +0530
X-Gm-Features: AZwV_Qjv3CycWr9Nq6vgpbjHaX6Q3jzdVxmyiQUktF1pv6KohqSpje4QgNfRJcY
Message-ID: <CAAhSdy3DnWVT1z1C5VvyFQq7mFEf5rD5pt4Eq3WbyRjSLjmAsw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Skip stopping cycle counter
To: "qingwei.hu" <qingwei.hu@bytedance.com>
Cc: atish.patra@linux.dev, will@kernel.org, mark.rutland@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_024545_106638_0C4F88C9 
X-CRM114-Status: GOOD (  19.13  )
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

T24gTW9uLCBGZWIgMiwgMjAyNiBhdCA0OjQ44oCvUE0gcWluZ3dlaS5odSA8cWluZ3dlaS5odUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEZyb206IFFpbmd3ZWkgSHUgPHFpbmd3ZWkuaHVAYnl0
ZWRhbmNlLmNvbT4KPgo+IEluIHRoZSByaXNjdl9wbXVfc2JpIGRyaXZlciwgcG11X3NiaV9zdG9w
X2FsbCgpIGlzIGludGVuZGVkIHRvIHN0b3AKPiBhbGwgYXZhaWxhYmxlIGNvdW50ZXJzLiBIb3dl
dmVyLCBjb3VudGVyIDAgKHRoZSBjeWNsZSBjb3VudGVyKSBzaG91bGQKPiBiZSBleGNsdWRlZCBm
cm9tIHRoaXMgb3BlcmF0aW9uIGJlY2F1c2UgdGhlIGNvdW50ZXIgbWF5IGJlIHVzZWQgaW4KPiB1
c2VyIG1vZGUgYnkgcmRjeWNsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFFpbmd3ZWkgSHUgPHFpbmd3
ZWkuaHVAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
YyB8IDEwICsrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5j
IGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4IDdkZDI4MmRhNjdjZS4uMmJj
MDA1MGRhYmQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiAr
KysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAgLTkwMCwxMSArOTAwLDE1IEBA
IHN0YXRpYyBpbnQgcG11X3NiaV9nZXRfY3RyaW5mbyhpbnQgbmN0ciwgdW5zaWduZWQgbG9uZyAq
bWFzaykKPiAgc3RhdGljIGlubGluZSB2b2lkIHBtdV9zYmlfc3RvcF9hbGwoc3RydWN0IHJpc2N2
X3BtdSAqcG11KQo+ICB7Cj4gICAgICAgICAvKgo+IC0gICAgICAgICogTm8gbmVlZCB0byBjaGVj
ayB0aGUgZXJyb3IgYmVjYXVzZSB3ZSBhcmUgZGlzYWJsaW5nIGFsbCB0aGUgY291bnRlcnMKPiAt
ICAgICAgICAqIHdoaWNoIG1heSBpbmNsdWRlIGNvdW50ZXJzIHRoYXQgYXJlIG5vdCBlbmFibGVk
IHlldC4KPiArICAgICAgICAqIE5vIG5lZWQgdG8gY2hlY2sgdGhlIGVycm9yIGJlY2F1c2Ugd2Ug
YXJlIGRpc2FibGluZyBhbGwgYXZhaWxhYmxlCj4gKyAgICAgICAgKiBjb3VudGVycyAoZXhjZXB0
IHRoZSBjeWNsZSBjb3VudGVyKSB3aGljaCBtYXkgaW5jbHVkZSBjb3VudGVycwo+ICsgICAgICAg
ICogdGhhdCBhcmUgbm90IGVuYWJsZWQgeWV0Lgo+ICsgICAgICAgICoKPiArICAgICAgICAqIEN5
Y2xlIGNvdW50ZXIgaXMgZXhjbHVkZWQgYmVjYXVzZSBpdCBtaWdodCBiZSBhY2Nlc3NlZCBieSB1
c2VyCj4gKyAgICAgICAgKiBtb2RlIHZpYSByZGN5Y2xlLgo+ICAgICAgICAgICovCj4gICAgICAg
ICBzYmlfZWNhbGwoU0JJX0VYVF9QTVUsIFNCSV9FWFRfUE1VX0NPVU5URVJfU1RPUCwKPiAtICAg
ICAgICAgICAgICAgICAwLCBwbXUtPmNtYXNrLCBTQklfUE1VX1NUT1BfRkxBR19SRVNFVCwgMCwg
MCwgMCk7Cj4gKyAgICAgICAgICAgICAgICAgMCwgcG11LT5jbWFzayAmIH5CSVQoMCksIFNCSV9Q
TVVfU1RPUF9GTEFHX1JFU0VULCAwLCAwLCAwKTsKCk5BSyB0byB0aGlzIHBhdGNoLgoKRGlzYWJs
aW5nIGFsbCBjb3VudGVycyAoaW5jbHVkaW5nIGN5Y2xlIGFuZCBpbnN0cmV0IGNvdW50ZXJzKSBp
cyBpbnRlbnRpb25hbC4KUGxlYXNlIHJlZmVyIHRvIHBhc3QgZGlzY3Vzc2lvbnMuCgpSZWdhcmRz
LApBbnVwCgo+ICB9Cj4KPiAgc3RhdGljIGlubGluZSB2b2lkIHBtdV9zYmlfc3RvcF9od19jdHJz
KHN0cnVjdCByaXNjdl9wbXUgKnBtdSkKPiAtLQo+IDIuMzkuNQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
