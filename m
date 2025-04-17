Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4433AC369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+cAYbDy79t3ZKH9WoI1wPbssMRp9YvAUL9fG4mkBhM=; b=KeknkqPMbZtYOj
	gcTmRunR6G0+squSOI+al+DGN51C2qJGNomiT9CUTGAN5+nPPeyc+gmS6+SgmoE2Z2FA2eG0Fs9Kp
	hVtVG11nWFkS/xg26maL+EAYx1hUhHAoMu+oivvnC4fA1txgyvuj8bCSfeJusNxso4AT7YLnP8xDo
	K29TEEaUeF91F7MJnnn/rUeWcrlVNJq/QPCl6RbFO54r78HQzPpq0/R2wGHlCtfLrKe1+Pnw/C+j0
	75DHNIrL3tfQwJMDdzWGO6oOpEgGcklgVNNmD5S+PSYp9vVNPAzBlLaQ9QfXEZFu97FPDqLQ2ZRBE
	96m5N+/2DYFoQxoE4o1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jex-0000000C5gL-2wEX;
	Thu, 17 Apr 2025 07:27:43 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jd8-0000000C5HM-1chX
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 07:25:51 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e6df32ad351so401440276.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 00:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744874749; x=1745479549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+6omS8qFdHgeBrC3YXQ2F75X2vgg9HVXzQut2+kiIg=;
        b=CrzJ+pqsr5l0EgGVEP39h/qsUz/Ca5EHkg+vjYAXLJuH1pWMSw0aSjy0ro4HMPHM63
         jPzX39DICO8MZ5GNjFT7o374x/u0SkSQwJZkLQM2DcgZydaUsoMhjjnQX6YIiZF37JAq
         MCM5Jf+BtgLn4xOvBncgJ1I87VWeuEJYhC9EJgxKqkq8CaUOKS6Ty+71K8KXNgMRrFV4
         Yz40k9yxxKu0tY4qZJw0He6x92w0mdgluBnmbF1Rm/d4g4ko52TPByzj+SqiOBudxqCU
         WVKq0M4K1QiiNfRTH55DGNBvpNEre2wpUaecM9x68kj0pC0olb4Oc/ZgL+rnTqnLyyIv
         QYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874749; x=1745479549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+6omS8qFdHgeBrC3YXQ2F75X2vgg9HVXzQut2+kiIg=;
        b=qetgIAzG77sfzMXn7o8RVj0+RZMKn47dXUfZIhzRkDhPiaF8SONKxY3Tr1M4WJK5jd
         dhFg/fV83PMjmrN/qjy2Ie7ggDnUxeEmgURLLqToVFcw57MViQv7fr0hawnbxC8Hln4Z
         5IQqtw1reUN4kZxF4ff0ps/CyrgQYqPE8VJ/apnCq66SyB/ADf33a7rHN3y47wB8Xssx
         XhwmhABpUjwV+hOEExZ6fJsOxADa5d5Urk5W5k9HWCm2zO1N/H0uX1jlvn3NTPasxB5R
         6ns6IWrMRAgmGGTAriQh5hfbX2+/vkJ+KaCFs+ATDIn1FCsFCeShyUMiCyFdHTsRyFjk
         d6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXY7F4qOWk90Xdeux78f4Crw6mwhTD5as7Yyh9/fXfVy+QVWe6pN3Wp/ToSKmcU7sbjczwsnbbMJ5FwuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuGpfa1m9kHQoRsDyrNDHIYABszmkoAOFOpQ4FtMhH+7brVT9J
	R2giDRhmNKvYDreGwgFMI0tEEVf9EQ0qWTdHGc0M8HHFTXlx9qtKMlFz9pRTflLv+dIMcgnfuOu
	K04JSJOFgPYjUJZpz+By5Kx9kHRE=
X-Gm-Gg: ASbGncutXNCVI9GPCNZoXDswl/IX3gnXrE286W19dEgh7ARcUHaOkCIk5kI0zaj3mIv
	FpWMwEl0V8k3kUPhr/mTpOzVazzcayRo9ZirZ/tbNQU+ph5Qd0cjx1S2LimF4SZxEDTIyl5r4kI
	MTK13Oe+3wiMCMgEZ10cF44FvwdsIrkf2NS2neyA==
X-Google-Smtp-Source: AGHT+IHNhX5FyTBj0UsN+DoR+c+A4Qnutg6OA5LPNfd4CP2jsuJHQX2673RgCB8Q3v/aIhw+/Ev5YMuntcdU39Cmj6w=
X-Received: by 2002:a05:6902:15c5:b0:e6d:f048:2b65 with SMTP id
 3f1490d57ef6-e7275988e38mr7146043276.21.1744874749187; Thu, 17 Apr 2025
 00:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
In-Reply-To: <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 17 Apr 2025 15:25:38 +0800
X-Gm-Features: ATxdqUFVWX06hgLw7RMPLAQMePr8t5dD5yi9HmuxQPrwkgjDOLRcbA08fu5uZ94
Message-ID: <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_002550_431629_3EDBF751 
X-CRM114-Status: GOOD (  20.10  )
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

SGkgQXJkLAoKT24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMjo1OOKAr1BNIEFyZCBCaWVzaGV1dmVs
IDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gKGNjIEVyaWMpCj4KPiBPbiBUaHUsIDE3IEFw
ciAyMDI1IGF0IDA4OjQ5LCBRaW5nZmFuZyBEZW5nIDxkcWZleHRAZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBGcm9tOiBRaW5nZmFuZyBEZW5nIDxxaW5nZmFuZy5kZW5nQHNpZmxvd2VyLmNvbS5j
bj4KPiA+Cj4gPiBBZGQgYSBzY2FsYXIgaW1wbGVtZW50YXRpb24gb2YgR0hBU0ggZm9yIFJJU0Mt
ViB1c2luZyB0aGUgWmJjIChjYXJyeS1sZXNzCj4gPiBtdWx0aXBsaWNhdGlvbikgYW5kIFpiYiAo
Yml0LW1hbmlwdWxhdGlvbikgZXh0ZW5zaW9ucy4gVGhpcyBpbXBsZW1lbnRhdGlvbgo+ID4gaXMg
YWRhcHRlZCBmcm9tIE9wZW5TU0wgYnV0IHJld3JpdHRlbiBpbiBwbGFpbiBDIGZvciBjbGFyaXR5
Lgo+ID4KPiA+IFVubGlrZSB0aGUgT3BlblNTTCBvbmUgdGhhdCByZWx5IG9uIGJpdC1yZWZsZWN0
aW9uIG9mIHRoZSBkYXRhLCB0aGlzCj4gPiB2ZXJzaW9uIHVzZXMgYSBwcmUtY29tcHV0ZWQgKHJl
ZmxlY3RlZCBhbmQgbXVsdGlwbGllZCkga2V5LCBpbnNwaXJlZCBieQo+ID4gdGhlIGFwcHJvYWNo
IHVzZWQgaW4gSW50ZWwncyBDTE1VTCBkcml2ZXIsIHRvIGF2b2lkIHJlZmxlY3Rpb25zIGR1cmlu
Zwo+ID4gcnVudGltZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBRaW5nZmFuZyBEZW5nIDxxaW5n
ZmFuZy5kZW5nQHNpZmxvd2VyLmNvbS5jbj4KPgo+IFdoYXQgaXMgdGhlIHVzZSBjYXNlIGZvciB0
aGlzPyBBSVVJLCB0aGUgc2NhbGFyIEFFUyBpbnN0cnVjdGlvbnMgd2VyZQo+IG5ldmVyIGltcGxl
bWVudGVkIGJ5IGFueW9uZSwgc28gaG93IGRvIHlvdSBleHBlY3QgdGhpcyB0byBiZSB1c2VkIGlu
Cj4gcHJhY3RpY2U/CgpUaGUgdXNlIGNhc2UgX2lzXyBBRVMtR0NNLCBhcyB5b3UgbWVudGlvbmVk
LiBXaXRob3V0IHRoaXMsIGNvbXB1dGluZwpHSEFTSCBjYW4gdGFrZSBhIGNvbnNpZGVyYWJsZSBh
bW91bnQgb2YgQ1BVIHRpbWUgKG1vbml0b3JlZCBieSBwZXJmKS4KCj4gLi4uCj4gPiArc3RhdGlj
IF9fYWx3YXlzX2lubGluZSBfX3VpbnQxMjhfdCBnZXRfdW5hbGlnbmVkX2JlMTI4KGNvbnN0IHU4
ICpwKQo+ID4gK3sKPiA+ICsgICAgICAgX191aW50MTI4X3QgdmFsOwo+ID4gKyNpZmRlZiBDT05G
SUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+Cj4gQ09ORklHX0hBVkVfRUZGSUNJ
RU5UX1VOQUxJR05FRF9BQ0NFU1MgbWVhbnMgdGhhdCBnZXRfdW5hbGlnbmVkX3h4eCgpCj4gaGVs
cGVycyBhcmUgY2hlYXAuIENhc3RpbmcgYSB2b2lkKiB0byBhbiBhbGlnbmVkIHR5cGUgaXMgc3Rp
bGwgVUIgYXMKPiBwZXIgdGhlIEMgc3RhbmRhcmQuCgpUZWNobmljYWxseSBhbiB1bmFsaWduZWQg
YWNjZXNzIGlzIFVCIGJ1dCB0aGlzIHBhdHRlcm4gaXMgd2lkZWx5IHVzZWQKaW4gbmV0d29ya2lu
ZyBjb2RlLgoKPgo+IFNvIGJldHRlciB0byBkcm9wIHRoZSAjaWZkZWYgZW50aXJlbHksIGFuZCBq
dXN0IHVzZSB0aGUKPiBnZXRfdW5hbGlnbmVkX2JlNjQoKSBoZWxwZXJzIGZvciBib3RoIGNhc2Vz
LgoKQ3VycmVudGx5IHRob3NlIGhlbHBlcnMgd29uJ3QgZ2VuZXJhdGUgcmV2OCBpbnN0cnVjdGlv
bnMsIGV2ZW4gaWYKSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBhbmQgUklTQ1ZfSVNB
X1pCQiBpcyBzZXQsIHNvIEkgaGF2ZSB0bwppbXBsZW1lbnQgbXkgb3duIHZlcnNpb24gb2YgdGhp
cyB0byByZWR1Y2UgdGhlIG51bWJlciBvZiBpbnN0cnVjdGlvbnMsCmFuZCB0byBhbGlnbiB3aXRo
IHRoZSBvcmlnaW5hbCBPcGVuU1NMIGltcGxlbWVudGF0aW9uLgoKPgo+IChzYW1lIGJlbG93KQo+
Cj4gQWxzbywgZG8geW91IG5lZWQgdG8gdGVzdCBmb3IgaW50MTI4IHN1cHBvcnQ/IE9yIGlzIHRo
YXQgZ3VhcmFudGVlZAo+IGZvciBhbGwgY29tcGlsZXJzIHRoYXQgYXJlIHN1cHBvcnRlZCBieSB0
aGUgUklTQy1WIHBvcnQ/CgpJIGJlbGlldmUgaW50MTI4IHN1cHBvcnQgaXMgYXZhaWxhYmxlIGZv
ciBhbGwgNjQtYml0IHRhcmdldHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
