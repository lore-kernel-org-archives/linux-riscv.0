Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0800CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0icSz96hWUy9tzhzEBIwjrOPmfNqoM31qbQayXtpHRc=; b=WJMcLHwosY4I/X
	4RkgOHg0Nmd/XVThEpmz6lWDSDSkTL9PvdR5jMXnf5X28LuJBvQKJKmiIM+IhYX7FKxr2UdYFL7Uq
	zDfvcZU54KGEzau0YFqozE9GBj/ZbBzBidHffJJCjagCPditnnpr3J0YuBP/sSnhWba2thY0mEzkK
	1JxOIjavA8V8bUqb4rN+8PwC9JrvRhkeA8uvG8o6ydwV1uE+eDir2Bq1aSTs9jiEELbBOiQWW/GXF
	et8bNoxCOkcGKkupDoS+Xdx8OCToIG2tg43cv7HHWU5OwsSS8LuMm3B6VFgIowOJXQ1yyL8eeoffF
	SCi7ybRg2aHopUpj8mNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNI7-0000000E1jV-38tF;
	Mon, 27 Oct 2025 13:29:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNI5-0000000E1iD-3jCX
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:29:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-290cd62acc3so53371075ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761571781; x=1762176581; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Wt2P3rgJn+5UKGAbxiwQscDH8snP1L4I/rTGNdNX60=;
        b=IeEr3prJr25wZmZRqtzvAljjN7kIBa/ib3StTQ9oSy5d1MhgdS6emRR6D2xx8m1xxw
         x32StbW0Sr14n+HSVpoa4VUo/YaRhfdp+ikICBkwIQDxqYFB/j9WKkYvEMSFLxrMLLwV
         E4q49kR2UeA4cURYWcWu5iA02KgmMLFE9cJyXgp48nGiC/WL9z4Ooy9j19ibpKV6KXsn
         EWteaePH+1AdcJWzN2chC9bs1FSdpOCARMg5ASIP6FXvShXZAkCGB5jLCS6ys3nCf4Ti
         up9XIkZmw9KQKb1eg8OCHFIAI5CLOi1qcEdywLnQ5mYB/fafToaa7WUhVxzJ4yT47q82
         U7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571781; x=1762176581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Wt2P3rgJn+5UKGAbxiwQscDH8snP1L4I/rTGNdNX60=;
        b=R7uXiJ6SkGh0rgzdBu7mQdTaB26fmhy41ZkfAZZqL7QDxyKYp+hpfi5Gy+2KBI+Gn3
         kWEomF/bkQxbI/wuSM/Jlf+QY1VQGtJdk+mW9sD96lcz/IJtvUV8iaGIoMRdRS2aBuls
         xqg8qXvOjR6GnsbUmi2P10UnySJ7yGn4Ot9KEgvmuflDcHf8elm8uTnwDppfNJ6Y2naC
         hmO5hJRjzUyYbbNOW2Zam2H88N22VVd0VAIrnP8/dfHSdBOgwduoU/KK1n+7XesTk5yW
         JRHVX9jlLp6zGdFYJiUdAV31D+yjHYXeY6+ZKOnH9ml0/F4PJtz7J3+DzpqSh/6X1VlW
         dSGg==
X-Forwarded-Encrypted: i=1; AJvYcCXKJGX4rfR3ulUp2w9sl2rN+dHpS+cvs7ffx72LaOhvfzRcXNabZzpxaKVXv8Jr8p4vrorUtfyEMz2eog==@lists.infradead.org
X-Gm-Message-State: AOJu0YznTKjkW214IqCfdM14YfoyAP8ZdL1bm/GZx2r8VQIjayZs10+l
	+NeAdhB5eXNukcZUJLf9Iv4wW3x57IrW3XxLkwreOUuC2/oYri1fPmoRcpN6gsbK9nY=
X-Gm-Gg: ASbGncuNYUyt/4NvjXAQAH+0svMU6gcKKF8qCSmx8U4itL7AkfcMv71sJCFIILGNJN3
	riPviaZ73K6aC6j9ROwyWjpSHt78itlzibiYXw7xqhaplDxJr4AOixYwDryAAsiXN3ZI7R5inBF
	fEicMSrPVmRaPAKc7NvZmN2wfsfv3LFaXenwsnMAbpQKGfrHSBgd1Z3XA0MfGRnvqTt35BlwjxC
	nBLvY5732GPBTQFnqkdIj8RlC8JGX0GslsqZRO1fQQE2Mn3Djrgwdvma1vhxgpIH/MxzjYZjWvh
	fqXNZLJNLBA+tBahOzLdOl7p8LC/e12ThLkojQDQou6xyv59Xj/oKkmItNXpy6kD1c+DsUqOuVa
	cX1QuJ1zheKhTgY09HrPa/OaXq/eFJyg/77FPMVzfQbSmP6NYppCHitQvsfjfa53W05FBadSYbo
	UMJYBY8tr4aceR7jomgSyquvew6XR3RcJgmlAr0x/RIz+E5w==
X-Google-Smtp-Source: AGHT+IGhfwb4u5norrCouP8BPxoTLYfO2XYGgio+ddfcnsYJ7Y7fRmFkfkRRSKjz9BOxITMsUStHfA==
X-Received: by 2002:a17:903:9ce:b0:267:bd8d:19e with SMTP id d9443c01a7336-2948b9a823fmr133319325ad.22.1761571781056;
        Mon, 27 Oct 2025 06:29:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed5b056dsm4181028a91.1.2025.10.27.06.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:29:40 -0700 (PDT)
Message-ID: <2b4cd5a6-98f8-4ec6-bdac-c6c7dae84049@rivosinc.com>
Date: Mon, 27 Oct 2025 14:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH v7 2/5] riscv: add support for SBI Supervisor
 Software Events extension
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <20250908181717.1997461-3-cleger@rivosinc.com>
 <CAPYmKFuVC3CwHbytPzQCHOYPoQp2LhucbLRRRRsqHk9upkrW8A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPYmKFuVC3CwHbytPzQCHOYPoQp2LhucbLRRRRsqHk9upkrW8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_062942_071965_BFDB5978 
X-CRM114-Status: GOOD (  11.79  )
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

CgpPbiAxMC8yNy8yNSAxMzowMCwgWHUgTHUgd3JvdGU6Cj4+ICt2b2lkIGRvX3NzZShzdHJ1Y3Qg
c3NlX2V2ZW50X2FyY2hfZGF0YSAqYXJjaF9ldnQsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAr
ewo+PiArICAgICAgIG5taV9lbnRlcigpOwo+PiArCj4+ICsgICAgICAgLyogUmV0cmlldmUgbWlz
c2luZyBHUFJzIGZyb20gU0JJICovCj4+ICsgICAgICAgc2JpX2VjYWxsKFNCSV9FWFRfU1NFLCBT
QklfU1NFX0VWRU5UX0FUVFJfUkVBRCwgYXJjaF9ldnQtPmV2dF9pZCwKPj4gKyAgICAgICAgICAg
ICAgICAgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0E2LAo+PiArICAgICAgICAgICAgICAgICAo
U0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0E3IC0gU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0E2
KSArIDEsCj4+ICsgICAgICAgICAgICAgICAgIGFyY2hfZXZ0LT5pbnRlcnJ1cHRlZF9waHlzLCAw
LCAwKTsKPj4gKwo+PiArICAgICAgIG1lbWNweSgmcmVncy0+YTYsICZhcmNoX2V2dC0+aW50ZXJy
dXB0ZWQsIHNpemVvZihhcmNoX2V2dC0+aW50ZXJydXB0ZWQpKTsKPj4gKwo+PiArICAgICAgIHNz
ZV9oYW5kbGVfZXZlbnQoYXJjaF9ldnQsIHJlZ3MpOwo+PiArCj4+ICsgICAgICAgLyoKPj4gKyAg
ICAgICAgKiBUaGUgU1NFIGRlbGl2ZXJ5IHBhdGggZG9lcyBub3QgdXNlcyB0aGUgInN0YW5kYXJk
IiBleGNlcHRpb24gcGF0aAo+PiArICAgICAgICAqIChzZWUgc3NlX2VudHJ5LlMpIGFuZCBkb2Vz
IG5vdCBwcm9jZXNzIGFueSBwZW5kaW5nIHNpZ25hbC9zb2Z0aXJxcwo+PiArICAgICAgICAqIGR1
ZSB0byBiZWluZyBzaW1pbGFyIHRvIGEgTk1JLgo+PiArICAgICAgICAqIFNvbWUgZHJpdmVycyAo
UE1VLCBSQVMpIGVucXVldWUgcGVuZGluZyB3b3JrIHRoYXQgbmVlZHMgdG8gYmUgaGFuZGxlZAo+
PiArICAgICAgICAqIGFzIHNvb24gYXMgcG9zc2libGUgYnkgYm90dG9tIGhhbHZlcy4gRm9yIHRo
YXQgcHVycG9zZSwgc2V0IHRoZSBTSVAKPj4gKyAgICAgICAgKiBzb2Z0d2FyZSBpbnRlcnJ1cHQg
cGVuZGluZyBiaXQgd2hpY2ggd2lsbCBmb3JjZSBhIHNvZnR3YXJlIGludGVycnVwdAo+PiArICAg
ICAgICAqIHRvIGJlIHNlcnZpY2VkIG9uY2UgaW50ZXJydXB0cyBhcmUgcmVlbmFibGVkIGluIHRo
ZSBpbnRlcnJ1cHRlZAo+PiArICAgICAgICAqIGNvbnRleHQgaWYgdGhleSB3ZXJlIG1hc2tlZCBv
ciBkaXJlY3RseSBpZiB1bm1hc2tlZC4KPj4gKyAgICAgICAgKi8KPj4gKyAgICAgICBjc3Jfc2V0
KENTUl9JUCwgSUVfU0lFKTsKPiBJRV9TSUUgbWF5IG5vdCBhbHdheXMgYmUgZW5hYmxlZCBpbiBD
U1JfSUUoZm9yIGV4YW1wbGUgd2hlbiB3ZSBkaXNhYmxlCj4gQ09ORklHX0FDTElOVF9TU1dJIGFu
ZCB1c2UgaW1zaWMgZm9yIGlwaSkuIE1heWJlIHdlIHNob3VsZCBzZW5kIGlwaSB0bwo+IHRoZSBj
dXJyZW50IGNwdSBoZXJlLgoKSGkgWHUsCgpJbmRlZWQsIHRoYXQncyBhIGdvb2QgY2F0Y2guIFNl
bmRpbmcgYW4gSVBJIHdpbGwgYmUgbW9yZSBnZW5lcmljLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IFh1IEx1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
