Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3715C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 07:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORQqM+RE8OG16LQcQL+cvvDTcg2GFfGUsiVmO3g77po=; b=vmz13FSRuH4rPq
	wWtvYopHNLJk+Fnh0Uq6+hHgHubvDn5sDuZFayHjflXRnBPCXzLNPsDz/PYQckFHkuxsabMVBk083
	oXJx7l0U6OhoYixzBkZM8JfYqQ7FUm5EVsuGwAU6sQ555g+WY5eihlnslFnjJfnvliLfI8WR0Ipo3
	xxKwWz71+Xe6Pn3hlKAo96NembrRjK8MZz8BCW1/rn1bdHGPaeGzesAxcLm36r6Knx2Gcwp2SYDdR
	O7BXr4i7CsZzew+MHyedm3SmxRTfnyKVEcJPHzQ8wt7XkF5VT8jjhODqUNW3SQez2gcd9OGDZQkOq
	ouImoxargVriFmfBF3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jvx-0000000C9Vb-0GAe;
	Thu, 17 Apr 2025 07:45:17 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jvu-0000000C9V4-1GtB
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 07:45:15 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e573136107bso422794276.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744875913; x=1745480713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcssgBbbVj+a/uBXXE9RC1cUGNGu+ygdY+cVqccmccM=;
        b=Eyz9VW9k5V/yyDC3pYBaKqzbttJy6XI2Q0uaHb0ya8+5yZYJd32YqW5q/c+QtLGXMS
         6DzJwnCNh9JSk6PDBL3ceNg1O5KwCAhAGcJKwiKB3WzngHg4o/oNos3EsOmjHBTN31GN
         hlLrN1XwaoxfYXDFsx7PoLVWuRuVD0UAtIrwX07Lgon8MwQSnluNTz+7Rm6scA4x+hhW
         X+aQf9xS6zOZkF6UzxyOGWC0Qu2c1d6r+RDcsQF5GH+JaLjxW7oTp/pnGl77RSB4wo9O
         PLV3GLnsUyPoJF7jHs5uwcdbRAV91GhiF4+Y8GizUFWjW0T8zVTR/E5Uw0X39LL3QfCo
         4s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875913; x=1745480713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcssgBbbVj+a/uBXXE9RC1cUGNGu+ygdY+cVqccmccM=;
        b=NN8WcMZcyT7BB/2fD68tOQvQr6t8TAV+0LIj04bcGrDNprM3VhdPYzf53F12N47Z3e
         MjypnrIMf1AqYwgZfsfA2MasCGDC8XduSU1V/4DGyGLQYBrV74tJEEDUVyMMBw26zBky
         twzQ1M/dC5xQyHX9ZxDpTo1hOuozTwnmOozWEDnRKourYRHlMYfQ1QA4HuHEommuVqaf
         00miILQledmORdaOOqYniRlMfgak0kTsU8eFfGkz8EmocWYaTHz6hONpn4QxpJgf7Is/
         Eb/XSOi6Ac1JwEFE13QLC8WLx0BUxx8NCOanP5iaVO+bnTIKvNCIgxujWJ65Gvp/VM3d
         17qA==
X-Forwarded-Encrypted: i=1; AJvYcCUIfwB2WPyo9zBC9tn8DWJ70aBmFpQcLLlIhmSphMMAj0uD7RggNEN9VjlD0JNT+n/qzWNMQ/ulHx5dHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRR0TT7GVz7snHjlLfGGi43BwJ7+JKPcEouqvBQCeLTsAwXmYA
	xPpJT2kNqZ8mZFoYZYQOHM2vn3n7tbgg/EpAAD5+Nh4+mL5nCxBWYNdZkZ2df5/nkKenxDf0IRy
	snjv53GcjOHLcKRW+agZpmUkgJnw=
X-Gm-Gg: ASbGnct4XvEvqrbormoRnpVSV8vrWB0XXH0CyG7HOLLIurdygrj2sQ4FYXXCMKL66PQ
	a0bCiMt/KVzOvNKMYhlag3WHta1jV7KphwbwFwiUHr+iX2XD3XcASyFE+AMmS9P66qANJqW1xPt
	dB7wvVLV/dW88gLOoEqB0LrlhKqjEfcIZ16A/W8A==
X-Google-Smtp-Source: AGHT+IGAR6lg2fMrbxA05CvZYcwcoxr2wuX/4XKhCG2jkWZV60uluWoRnjmCRD/x3C4szfiM33Qvp74JQs4FBRcBiiE=
X-Received: by 2002:a05:6902:10c4:b0:e6e:b3d:6f87 with SMTP id
 3f1490d57ef6-e7275f2995bmr6717565276.40.1744875913212; Thu, 17 Apr 2025
 00:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
 <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com> <CAH8yC8=9u42jK0-FrHOXvWDM-Z3jUKSSSFznTMVWUiPAgCFcTA@mail.gmail.com>
In-Reply-To: <CAH8yC8=9u42jK0-FrHOXvWDM-Z3jUKSSSFznTMVWUiPAgCFcTA@mail.gmail.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 17 Apr 2025 15:45:03 +0800
X-Gm-Features: ATxdqUH8LtN62wtWOBNCijYJvfLyDx2fGZykb1xFl1cR53g-9tp1DwUwsjdUDSI
Message-ID: <CALW65jZvieqvHei31Ufikz4SVEGvDZwGyLGf=9Myqw1hS9m-sg@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: noloader@gmail.com
Cc: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_004514_342694_4E4CF701 
X-CRM114-Status: GOOD (  12.01  )
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

SGkgSmVmZnJleSwKCk9uIFRodSwgQXByIDE3LCAyMDI1IGF0IDM6NDDigK9QTSBKZWZmcmV5IFdh
bHRvbiA8bm9sb2FkZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDE3LCAyMDI1
IGF0IDM6MjXigK9BTSBRaW5nZmFuZyBEZW5nIDxkcWZleHRAZ21haWwuY29tPiB3cm90ZToKPiA+
Cj4gPiBIaSBBcmQsCj4gPgo+ID4gT24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMjo1OOKAr1BNIEFy
ZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBbLi4uXQo+ID4gPgo+
ID4gPiBBbHNvLCBkbyB5b3UgbmVlZCB0byB0ZXN0IGZvciBpbnQxMjggc3VwcG9ydD8gT3IgaXMg
dGhhdCBndWFyYW50ZWVkCj4gPiA+IGZvciBhbGwgY29tcGlsZXJzIHRoYXQgYXJlIHN1cHBvcnRl
ZCBieSB0aGUgUklTQy1WIHBvcnQ/Cj4gPgo+ID4gSSBiZWxpZXZlIGludDEyOCBzdXBwb3J0IGlz
IGF2YWlsYWJsZSBmb3IgYWxsIDY0LWJpdCB0YXJnZXRzLgo+Cj4gWW91IGNhbiB2ZXJpZnkgdGhl
IGNvbXBpbGVyIHN1cHBvcnRzIGludDEyOCB3aXRoIHRoZSBmb2xsb3dpbmcgbWFjcm86Cj4KPiAg
ICAgI2lmIChfX1NJWkVPRl9JTlQxMjhfXyA+PSAxNikKPiAgICAgLi4uCj4gICAgICNlbmRpZgo+
Cj4gQWxzbyBzZWUgPGh0dHBzOi8vZ2NjLmdudS5vcmcvcGlwZXJtYWlsL2djYy1oZWxwLzIwMTUt
QXVndXN0LzEyNDg2Mi5odG1sPi4KClRoZXJlIGlzIGEgS2NvbmZpZyBzeW1ib2wgQVJDSF9TVVBQ
T1JUU19JTlQxMjguIEkgbWF5IHN3aXRjaCB0byB0aGF0LgoKPgo+IEplZmYKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
