Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53A6C369CF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 01:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2X456CjRHObv2nK8mcDyO1AF3tUzXtBEixv6ejb1srQ=; b=JrbS8fo5mft3kw
	/mE+fGIeNFCIq3wHf4qvJgPPs8Zlr5XtHB2GD7o6Z3Cpz31NKYpP7soinsLQdTSZdN+DBauWcbCYk
	onVX3n8UGlCkzXi2xfTH/5tVinDl2T9Tu9nNoOA7q69wf9ZJ11QhIQg5ND0sopZ19DCFospczjpGv
	nb8IhrHzapPqC6A/vOlElXogjVCgZXWBt8RNOx6etES8c4SI2mew0JDlfBvUsfeYKQYGSsf1qVzdJ
	xw0CjNQFzLb6+AcDUs/GFhaL/uzAYqgzUKrIvaGJquykl0AYjK8ZG9Dqc2WINo4vp/BDHhyZaDCIZ
	OSMe2IeFFbB81y2Fv6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5avw-0000000Eo45-32qx;
	Fri, 18 Apr 2025 01:54:24 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5aqw-0000000EnVl-0VQ7
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 01:49:15 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e6deb3eb7dbso1261203276.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 18:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744940953; x=1745545753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmglLRoVsuPHltsr1TwX2csib2NZ7x5pIBHoukxn5Ak=;
        b=cn9Eulh0+s2AAdEXG7wWM3EH5svCk+z6fRzKT1n6ji/tg7If0rQAz1WVPaZVgD/KDu
         q7GDGQDTyeGBLfuXXQD1itTwRP5GlWWjUH1My2GPhJWUwzDQtTeKKUpXkh5CkOJd3HEA
         kD32tfz7SxYDCQXMcW3vPQh7sTkloZ/z5MWIA7tOtJZ1Xhqq2cekjSZ5erCq4EhGnZg6
         P4JrqoBXD+9pPZQ3/JZL0b/8rzDv3EYNi6TEuA43ZNJL77h3KVZcxBfz1+g0DX+1d5t7
         kNOrbJmfj/W0r6gpRPHavW0iypMhYBFxdGv+pd1W8Kzxh6ev/GdoZWHz961tdPqgmltI
         W8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940953; x=1745545753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmglLRoVsuPHltsr1TwX2csib2NZ7x5pIBHoukxn5Ak=;
        b=MIOO7L42BpPX5NQQSPwE+vSb5v8eI8KWdJkRzmfVcUJQZX9MfPHstm5hQJsPUpUEmi
         nafJvqr49B4KBgp3BLq8sx9yYweVaeDwtsiII8uOglOBitrQbR83tbUOmFUzt1YDpgzO
         9BmIj8U3IDRRVccucmG0IGx6gNUOdb6lGVJi4wgMfbka2oYkz9gn3F6UDXWYMZmTclVT
         2xwfQEy2AjY1rBGSRFCwZ0WFGpUvgwuAV35d4ouFWPktFNxDz+e1wfGCGkkHCaaGe3t0
         SM8pDHIzQQlaV86rAcW12i8Lea1jJGPot+Di5MNVbnwg0CXsU0zTsg71CX4aY5LuCMW1
         liQg==
X-Forwarded-Encrypted: i=1; AJvYcCWSYhSnhfOaT5Q7UBjTztTIv9VOhnD2E580cIBe4GgyhWt3pshjuOOUVDpTKxxfyLs3P3OmQCgNNEiaug==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxyXLz3aM1PBOrIUBmRjuL3nxinN4ZfrALFaYOzjiA6qb01jfu
	qXNYEsHgFoOXWtEa9uGZ6e5oyzY4WefdfRGGFzGv07k4hoSskmpfnRgZykrPAQVmRwDr4PgaA31
	siA7HxL4hrV/+Sp4cF3w26fOKQYE=
X-Gm-Gg: ASbGncuFdCvbUWXbBvDkGrMT+WJTCq9HDLK1hSZuGE3WxhArE4PmZDg6OHxO0Y+AP0u
	4rC/ON8LkiRMgpq0WdwrzoZQ8rLSAURIytcAN12k7H9JvfAYmWGY0ijKDDj2kJiGcyZxiDOWSfK
	cJcuT6yu6PUMWXlOZOgNKqbqIT94BaQ3Iw+RR+yg==
X-Google-Smtp-Source: AGHT+IGUJoDzahqgdqLndIsmYoX2akOdFbgKB06u7VmDFKJltr6uEQVcZZQMdCy9WoqoFlbvS6cd7gUnAw1TFwGFUck=
X-Received: by 2002:a05:6902:2510:b0:e72:8658:5839 with SMTP id
 3f1490d57ef6-e7297eae575mr1455987276.32.1744940952774; Thu, 17 Apr 2025
 18:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <CAMj1kXFPAVXOtPoETKvHB49kjZUPYrsAqsJwdL7p5Cu4xk75Rg@mail.gmail.com>
 <CALW65jY=LnVBYoKPOQnSKgGSA0brKzmo0vqoRDcqF_=jofLAng@mail.gmail.com>
 <CAMj1kXH-u7hiKGQfgYHj_16V4ATN_aHmA_wkvMSyLh+E3+QaAA@mail.gmail.com>
 <CALW65jZVYUZoka7Gbjcoh43qbkD7rGpw8gTZjjOYpZD-BhLyBQ@mail.gmail.com> <20250417165856.GB800@quark.localdomain>
In-Reply-To: <20250417165856.GB800@quark.localdomain>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 18 Apr 2025 09:48:56 +0800
X-Gm-Features: ATxdqUHBrp0rUxHu64YX4mBWqOm5CVQgF2oCMN8KPRYqB9bzHHQfTOroaVo3v4I
Message-ID: <CALW65jZGUQ9HsNi3QQQ-A9AAL31zcmqhVGLhKBQPfPM-CB67gg@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_184914_161163_39A8F538 
X-CRM114-Status: GOOD (  13.51  )
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

SGkgRXJpYywKCk9uIEZyaSwgQXByIDE4LCAyMDI1IGF0IDEyOjU54oCvQU0gRXJpYyBCaWdnZXJz
IDxlYmlnZ2Vyc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDE3LCAyMDI1IGF0
IDA0OjQyOjQ2UE0gKzA4MDAsIFFpbmdmYW5nIERlbmcgd3JvdGU6Cj4gPiA+IEkgc2VlLiBCdXQg
ZG8geW91IGhhdmUgYSBwYXJ0aWN1bGFyIGNvbmZpZ3VyYXRpb24gaW4gbWluZD8gRG9lcyBpdAo+
ID4gPiBoYXZlIHNjYWxhciBBRVMgdG9vPyBJIGxvb2tlZCBpbnRvIHRoYXQgYSB3aGlsZSBhZ28g
YnV0IEkgd2FzIHRvbGQKPiA+ID4gdGhhdCBub2JvZHkgYWN0dWFsbHkgaW5jb3Jwb3JhdGVzIHRo
YXQuIFNvIHdoYXQgYWJvdXQgdGhlc2UKPiA+ID4gZXh0ZW5zaW9ucz8gQXJlIHRoZXkgY29tbW9u
bHkgaW1wbGVtZW50ZWQ/Cj4gPgo+ID4gSXQncyBhZXMtZ2VuZXJpYy5jIChMVVQtYmFzZWQpIHdp
dGggYWNjZWxlcmF0ZWQgR0hBU0guCj4KPiBUaGF0J3MgYW4gb2RkIGNvbWJpbmF0aW9uLiAgTm9y
bWFsbHkgYWNjZWxlcmF0ZWQgQUVTIGFuZCBHSEFTSCBnbyB0b2dldGhlci4KPiBQcmVzdW1hYmx5
IHlvdSdyZSB0YXJnZXRpbmcgc29tZSBzcGVjaWZpYyBSSVNDLVYgQ1BVLiAgSXMgdGhpcyBnb2lu
ZyB0byBiZSBhCj4gb25lLW9mZiB0aGluZyBmb3IgdGhhdCBzcGVjaWZpYyBDUFU/ICBPciBjYW4g
d2UgZXhwZWN0IG1hbnkgUklTQy1WIENQVXMgdG8gaGF2ZQo+IEdIQVNIIGFjY2VsZXJhdGlvbiB3
aXRob3V0IEFFUz8gIEFuZCBpZiBzbywgd2h5PwoKVGhlcmUgYXJlIGEgZmV3IFJJU0MtViBDUFVz
IHRoYXQgc3VwcG9ydCB0aGUgQiBleHRlbnNpb25zCihaYmErWmJiK1piYytaYnMpIGJ1dCBsYWNr
IGJvdGggc2NhbGFyIGFuZCB2ZWN0b3IgY3J5cHRvIGV4dGVuc2lvbnMuCk9uZSBzdWNoIENQVSBh
bHJlYWR5IHVwc3RyZWFtZWQgaW4gdGhlIGtlcm5lbCBpcyB0aGUgU3BhY2VtaVQgSzEuCkFub3Ro
ZXIgZXhhbXBsZSBhbmQgdGhlIG9uZSBJJ20gY3VycmVudGx5IHJ1bm5pbmcgdGhpcyBjb2RlIG9u
IGlzIHRoZQpYdWFuVGllIEM5MDgsIGFzIGZvdW5kIGluIHRoZSBDYW5NViBLMjMwLgoKKCtDYyBH
dW8gUmVuKQpHdW8sIGRvIHlvdSBrbm93IGlmIGZ1dHVyZSBYdWFuVGllIENQVXMgd2lsbCBzdXBw
b3J0IHRoZSBSSVNDLVYKc2NhbGFyL3ZlY3RvciBjcnlwdG8gZXh0ZW5zaW9ucz8KClsxXSBodHRw
czovL3d3dy54cnZtLmNvbS9wcm9kdWN0L3h1YW50aWUvQzkwOApbMl0gaHR0cHM6Ly93d3cueHJ2
bS5jb20vcHJvZHVjdC94dWFudGllL0M5MDcKWzNdIGh0dHBzOi8vZG9jcy5iYW5hbmEtcGkub3Jn
L2VuL0JQSS1GMy9TcGFjZW1pVF9LMV9kYXRhc2hlZXQKPgo+IC0gRXJpYwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
