Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA261C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8i55MiAiOXZJqzJyl3QIDgPwuLWwafAhy2opEj83VEY=; b=w2gLRNGG7ZRhYk
	pzm/D5xeqZo8ZoenC74/iOpnFGK5pbyuY1hAEf5JGe2aXnV3JEnnQf0sSZS3cZqZSJCdtt0bXMgES
	q2BDHkMA5xPSqxX2jarQ1Z5X3+XEdGIrAOHcnfAfMEJpLVc6Di3u/HhvkiL3j4SAE7iOgbyd9N8Fk
	S2ohHVPDu85GNUCqrLC6HsPTa6rbfLLJRztkTZsWjOKPI3YUNESFb1wFrNAtXoB4+dDkwo3NUJRIS
	Nl5kmHalLDR5Pp4FMu37h1BcELdaWwmxiQwufkR8DegxI35jVPzRR8Kr2APwA8AjhPKtYqiY47G9c
	pIRyL5LlTR277nM7ifUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JrS-0000000C8r2-3kvH;
	Thu, 17 Apr 2025 07:40:39 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JrQ-0000000C8qE-0klL
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 07:40:37 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30db3f3c907so4334741fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744875634; x=1745480434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9x7gR7Yz7XNUFWa+lwCa2rWEWOau+/yNpWiz9libhis=;
        b=ELe9wwk+3Ae955M+/KTbNVCTFlfSuA5WWgk5V4bLNmuYN6QlzASPNNs25oR50/v/wt
         Hkq2AZ1rCNtGAwZFxqdkj3hM/7OmPZIXoYrL8mGyFZyYyzZEKp4GmEK64mgDVe/A2POd
         Hrf2Cso3hSXXtCFYUuIFTaY8YikKyTcYcbJoK1SpBRb7WMgp8HH7ZmS3uFR9a1ONoOg+
         7eBUxtf+hnk17Vlb/6MbcvMy91MQl3EayjzFQ6KxJg/WfTXlX+Q4anKbjlClY1vTi9sK
         UnHJA62pjTHODeI2KnRpIQ3103yG+ji4FkavLtU9slF7/qCmVt9J4/qTqzps2GemkCQ5
         Vbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875634; x=1745480434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9x7gR7Yz7XNUFWa+lwCa2rWEWOau+/yNpWiz9libhis=;
        b=JK72o6sS4EIbDDixsM+vbLdMxpvWSG0HH3uyCp8IsyvljXAG8VrTkLDUUMz5aeMii+
         /esf1tT45YdGbH56wzHEWwF0ITNXcWBkElJHV/c/w65nWXps24chDXfGYMldh5CKpHPs
         vkZNN8uOTPJtC5H57Tz5hBotyIzyoZpvPJlPjsegN9wc5CzBeiSlyhvN0fxkk+NTUeb4
         NIfm6c0wkdDrE9h1UFMDcEXx8BLC2w0Firlrzp7v53mFNn66iwtfLWVy36NwcKKwpKCp
         sDxQrpL38yTejtXQ+1jj1gxxV264mm9V6Ny4MS08lfsTMRUXVlpzSwd++qs9t5mI1080
         vvNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9w9a2hrsSJXGe4rgpMAi0y8jYZTKq5laVV+qMTaU32Y9MQ4SUs9sop5N9OI6G591baWKwz9+lFt/jFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvYLbi/XedgCNcW4yU1ODU0dGElTDA99f70cj+RnRMq0ArW0Mp
	k9i/uURqy9YSucGtOug5PYN6JsaeVNOdTV9wJIO8rqxcbAoMlflZ+3HcET9DMx9eVtOQloqR8Gg
	8k9bqw3PqhOd2jCWVV6WZYPuais4=
X-Gm-Gg: ASbGncuutBLr5MdUefA2Ti+wVJWL0bqN/HZUZ8aykkEYcVlN9tlqby1MGHUUPyKvsdh
	8Hlk6XHvsee2uwCCtZyjAKGKByT7YlQWLlEB345+yI8jJFPyeghWBwRi6QsOXhLvSkIk/Uzau1H
	0bZ5iOJ2QtrkVKC4qzuMlg
X-Google-Smtp-Source: AGHT+IGZnKMxCdpzpwJnWblYSUd3QLkAetoc1gHCWvz1x15KmhiEoEGPl0XQ1oZjMxaysNCUGExVqyOCz6W5GquFftY=
X-Received: by 2002:a2e:a990:0:b0:30d:e104:b593 with SMTP id
 38308e7fff4ca-3107f73a78cmr16127281fa.39.1744875633362; Thu, 17 Apr 2025
 00:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
 <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
In-Reply-To: <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Thu, 17 Apr 2025 03:39:56 -0400
X-Gm-Features: ATxdqUG0eIH-yuy96XaXV-0vu-m2nutTChvWUTplyUTZfzB8DNwZOqlnJL5Xq5c
Message-ID: <CAH8yC8=9u42jK0-FrHOXvWDM-Z3jUKSSSFznTMVWUiPAgCFcTA@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: Qingfang Deng <dqfext@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_004036_213546_4AC1F4BF 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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
Reply-To: noloader@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMzoyNeKAr0FNIFFpbmdmYW5nIERlbmcgPGRxZmV4dEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQXJkLAo+Cj4gT24gVGh1LCBBcHIgMTcsIDIwMjUgYXQg
Mjo1OOKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gWy4u
Ll0KPiA+Cj4gPiBBbHNvLCBkbyB5b3UgbmVlZCB0byB0ZXN0IGZvciBpbnQxMjggc3VwcG9ydD8g
T3IgaXMgdGhhdCBndWFyYW50ZWVkCj4gPiBmb3IgYWxsIGNvbXBpbGVycyB0aGF0IGFyZSBzdXBw
b3J0ZWQgYnkgdGhlIFJJU0MtViBwb3J0Pwo+Cj4gSSBiZWxpZXZlIGludDEyOCBzdXBwb3J0IGlz
IGF2YWlsYWJsZSBmb3IgYWxsIDY0LWJpdCB0YXJnZXRzLgoKWW91IGNhbiB2ZXJpZnkgdGhlIGNv
bXBpbGVyIHN1cHBvcnRzIGludDEyOCB3aXRoIHRoZSBmb2xsb3dpbmcgbWFjcm86CgogICAgI2lm
IChfX1NJWkVPRl9JTlQxMjhfXyA+PSAxNikKICAgIC4uLgogICAgI2VuZGlmCgpBbHNvIHNlZSA8
aHR0cHM6Ly9nY2MuZ251Lm9yZy9waXBlcm1haWwvZ2NjLWhlbHAvMjAxNS1BdWd1c3QvMTI0ODYy
Lmh0bWw+LgoKSmVmZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
