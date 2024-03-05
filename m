Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C01C48BF6
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 03:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NWs2B0zR4YZC31NSVj0NHwYQ9EhODosUsYNIcGNJaE=; b=ii2w0fSI1Ab36j
	tdX250qmgReY72b4bFH5H8sfC7PrSwfO7yHUNs0kTNqBIIsBI42F9b6EMLd0qEm/PNX/C722x97tf
	pccpp64pABjEmFGy4HXQQe7j6pepDCTAKptDyUzxTokWabX9NGDLUojWpiDZER6E8yJI7tR5Gh6no
	AY0RTQjsZNynR4Hphghxwdti1ELBX0HPc8tIMA+TZg4fphySsNP6J+rqZg9grgxkb4qUr6MaBBvqw
	MrhWpi6d9bTOxP0ACvhfK/rtxpC2I5b445YD/OrbbCOssIYhQDcJSmgmCo777iZ2A8Gbx7jEPfbzP
	9j2uzePiobSQq0BtQb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhL5q-0000000BeL5-1bUH;
	Tue, 05 Mar 2024 03:03:50 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhL5m-0000000BeKF-13w7
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 03:03:49 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d275e63590so74428211fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 19:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709607822; x=1710212622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeP7yg03z/TtSAn/5mkkxNPbmXMp4hRVJ5K3zTplORI=;
        b=ELAhFLvIzkyoSeEhVU0bcYwuhIL3aPFTnb4wY+/jNe75+9JC+N9YR6KQbOydb/1dE5
         pKEL33/DutM/5FxIK5K2Ko1W52Xz2tb+KjKc6W82qVLq1J/Gm793//RWII0IfTWJYp/k
         1iRoj6LDLwQBU8y68RlO66i6nW/Z93pLss8i0LQMIuC+xkVx9uQ0R8aA0LW5b9PMJkNG
         HrvTNARbvyqwjU4Rp8XAeY21hyxNe6a1vrJgmQb21RlJtQCBTk/r/bszCZfg854CHvFc
         Ft3YRgSWHSb2Lhn0q7XlmX4nUlGuCwLAe75udi+AZUz/OrlYh6xSO1i4twbIoJlWakvJ
         2NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709607822; x=1710212622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeP7yg03z/TtSAn/5mkkxNPbmXMp4hRVJ5K3zTplORI=;
        b=Ho9EbuDxGpm/PqOkg6n97x8M1zpCo+NT8arHn0sxzEtaHlellokA4p2PT1MkMIUmZT
         EbGuSrKSon1WDx+Epn1hzRRBAoykX4s3efdq5f/eQ2Yg+pQFWNwEPAoJ+6jZp4C7NjGz
         UawVKvuv0wa9UXfAtdV40sZWHm+l2YWt0EY2ONEYsFI706iGlnNM6D1JGn+HEd/12Ci3
         ZI7tm/n+NE7LpcdiGB2YLjQOsj4iy6ugQ+f08Y16tl5kLxS/e88fQS03dOYVmI2dI9XS
         Klv5o88jZN88GZF3yYVvAd1JMY0U/rtCZaqxeC8Cy8jIf05G/XYqFBjlZ4y1J7CwHqlR
         aw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVW5qq/fb+Jp+GoiLZZg1Uc8jGQbwXIul2tm3YnjsLBxCz/5ifgrymPNjpK4V6n8d+qn60TD0JJJu0XErw0tbdtwaDfQrEl2dCT7ybmajtX
X-Gm-Message-State: AOJu0YwH/VgHzRW3Evxb/O4vyQ1b2Tb+rn8vqk7nnoamyEmc2keP+vHG
	tIE3ar5ox8kf3z5ua+3FGbJPYQI+IDLrSjUKhd/30uX6Q8Haxj6uNYWur52Rfn09tb+zBpPfkV7
	xyT3AVsBIeQDevrKlU5AHTinWC3YWz65eJcoqow==
X-Google-Smtp-Source: AGHT+IFPXo6a34SIvWl7lw7N7W4+IchbD08putpSxKw58/8CLAWWz2yNLnjUOFdz0I/fYG+Hmoz7mGxMqGuepuD1+8g=
X-Received: by 2002:ac2:54bb:0:b0:513:1cfb:a848 with SMTP id
 w27-20020ac254bb000000b005131cfba848mr325931lfk.33.1709607822218; Mon, 04 Mar
 2024 19:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
 <20240229121056.203419-3-alexghiti@rivosinc.com> <20240304-makeshift-bakeshop-26c9611de1a3@spud>
 <87msrdzqxi.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87msrdzqxi.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 5 Mar 2024 08:33:30 +0530
Message-ID: <CAK9=C2Xjgr9_H-sHkmAAc95dAm2jd+_dxLUxSM3RM3NrQJFKGQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: Fix text patching when IPI are used
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrea Parri <andrea@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Andrea Parri <parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_190346_325435_1C4D393B 
X-CRM114-Status: GOOD (  17.19  )
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

T24gVHVlLCBNYXIgNSwgMjAyNCBhdCAxOjU04oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyaXRl
czoKPgo+ID4gT24gVGh1LCBGZWIgMjksIDIwMjQgYXQgMDE6MTA6NTZQTSArMDEwMCwgQWxleGFu
ZHJlIEdoaXRpIHdyb3RlOgo+ID4+IEZvciBub3csIHdlIHVzZSBzdG9wX21hY2hpbmUoKSB0byBw
YXRjaCB0aGUgdGV4dCBhbmQgd2hlbiB3ZSB1c2UgSVBJcyBmb3IKPiA+PiByZW1vdGUgaWNhY2hl
IGZsdXNoZXMgKHdoaWNoIGlzIGVtaXR0ZWQgaW4gcGF0Y2hfdGV4dF9ub3N5bmMoKSksIHRoZSBz
eXN0ZW0KPiA+PiBoYW5ncy4KPiA+Pgo+ID4+IFNvIGluc3RlYWQsIG1ha2Ugc3VyZSBldmVyeSBD
UFUgZXhlY3V0ZXMgdGhlIHN0b3BfbWFjaGluZSgpIHBhdGNoaW5nCj4gPj4gZnVuY3Rpb24gYW5k
IGVtaXQgYSBsb2NhbCBpY2FjaGUgZmx1c2ggdGhlcmUuCj4gPj4KPiA+PiBDby1kZXZlbG9wZWQt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4+IFJldmlld2VkLWJ5
OiBBbmRyZWEgUGFycmkgPHBhcnJpLmFuZHJlYUBnbWFpbC5jb20+Cj4gPgo+ID4gV2hhdCBjb21t
aXQgZG9lcyB0aGlzIGZpeD8KPgo+IEhtbS4gVGhlIGJ1ZyBpcyBleHBvc2VkIHdoZW4gdGhlIEFJ
QSBJUEkgYXJlIGludHJvZHVjZWQsIGFuZCB1c2VkCj4gKGluc3RlYWQgb2YgdGhlIGZpcm13YXJl
LWJhc2VkKS4KPgo+IEknbSBub3Qgc3VyZSB0aGlzIGlzIHNvbWV0aGluZyB3ZSdkIGxpa2UgYmFj
a3BvcnRlZCwgYnV0IHJhdGhlciBhCj4gcHJlcmVxdWlzaXRlIHRvIEFJQS4KPgo+IEBBbnVwIEBB
bGV4IFdEWVQ/Cj4KClRoZSBjdXJyZW50IHRleHQgcGF0Y2hpbmcgbmV2ZXIgY29uc2lkZXJlZCBJ
UElzIGJlaW5nIGluamVjdGVkCmRpcmVjdGx5IGluIFMtbW9kZSBmcm9tIGhhcnQgdG8gYW5vdGhl
ciBzbyB3ZSBhcmUgc2VlaW5nIHRoaXMKaXNzdWUgbm93IHdpdGggQUlBIElQSXMuCgpXZSBjZXJ0
YWlubHkgZG9uJ3QgbmVlZCB0byBiYWNrcG9ydCB0aGlzIGZpeCBzaW5jZSBpdCdzIG1vcmUKb2Yg
YSBwcmVwYXJhdG9yeSBmaXggZm9yIEFJQSBJUElzLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
