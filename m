Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADFAC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yz9dU89q+9U86G34Av7FsRwMW+aOrbN80U5athpSQy0=; b=zcx6U9yvpplWOl
	WhXEnHL3Bekj6Lben+uYMkQ+B6pXDxzxzIkxccPrLIkROew/OwXst6/lxm/6qdavXtRpsNv97Ymhx
	8g1SquOKTeT9YboU/aOIC3ErfMj5A3A/MgOGypx82SddKKfYd6lJ9FnKEG+QCQcB8e08LAPTVLpK0
	9WadVE3BKAfZ1lYz6d48Rq8fNxP4vYz+nPWZJpuO6zHvWfiA2E1hSoD7Osa8KuT8iQYNW7Y1yRf6E
	4K8PXwt4pmbLi7vKsALUQCJRwHepCxtGbJkCSiEhzQ6zmTwj4++awktdgPVUwtEricj9RAOfQfBWi
	cJLsNRnwqv2xVWqA5l8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU1Ay-0000000DMyy-075q;
	Wed, 17 Jul 2024 09:42:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU1Av-0000000DMyJ-3L8H
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 09:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16B6C6158F
	for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 09:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E3CC4AF0D
	for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721209336;
	bh=4wsWKtT4pzbR3ZnSQuInnMNaiV+eFoZ7JNsZBHRlVZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VRyzN9+MaTsL1fzKS9dRhvspzof/X5Mah4RnJPHPYcIp3cwyvZAV/NRdmCLxFzWDB
	 ErM9VEKHPp1NV6bTn7eHTPWV8Y/JxJEYK0SQv6CQqZHEOW1ik20NTGEVjENzZIMKXN
	 MiEL+30s8w29cSBvLxGB0ZppHRWVGISilrxjOwij0dTea8kDVlTku62UHCw0h/AzAO
	 d8IW6CAo/Z3NTSds6sw1Fxy4sdQGxNdrNs9vZmP1yFp5jA6Kogs9MqsUYkTwUlgP2M
	 T2+mZyXKvv6MsDxUHlZ6jg6fRWayutquo+53hClZRZHeLxrjoqG4eFruL3gqInOvxU
	 MBBFxrSj7jwAQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a083ba04e7so495803a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 02:42:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWy6M8P9ESyWqdPTUuD1eAlcTq9ZdvQ/xTkpO7pPMZl6AH2WX66ZtbslUFvzkAucG5W225CWog0/QUirzNiVwg+KpJdvSKf8C7o9BwQ5wLM
X-Gm-Message-State: AOJu0YzeJ0BMBk0tNejAesoXqeppAA09VnZ6PgYi5v9ZsMVPqVeOJrsB
	xAH5da60L7CjloMxnVkmbTgzAjHddtmysKYPMW/WVXgfll5rmUPrQi5oqCBsZQ4ep+w4iFnF2Bk
	QxextFyQfmQMkjtcXHqcqOmboNkI=
X-Google-Smtp-Source: AGHT+IGiAh07Q4bbOoU7hNbdq3a1E1po4+o3FRxrUjYkTgr0fGJMGJBP0KlzYZojtvYYoe1XftYpOs7aU54iRzxyjoo=
X-Received: by 2002:a50:d7c1:0:b0:59c:50c3:af65 with SMTP id
 4fb4d7f45d1cf-5a069e9bfa2mr1331551a12.14.1721209335328; Wed, 17 Jul 2024
 02:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240717061957.140712-1-alexghiti@rivosinc.com> <20240717061957.140712-11-alexghiti@rivosinc.com>
In-Reply-To: <20240717061957.140712-11-alexghiti@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 17 Jul 2024 17:42:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRSeoa+_w_bp4D9i3w61D769OZBcMAPPhbSadkvouwrLw@mail.gmail.com>
Message-ID: <CAJF2gTRSeoa+_w_bp4D9i3w61D769OZBcMAPPhbSadkvouwrLw@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] dt-bindings: riscv: Add Ziccrse ISA extension description
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_024218_001271_DDB8C721 
X-CRM114-Status: GOOD (  14.39  )
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

T24gV2VkLCBKdWwgMTcsIDIwMjQgYXQgMjozMOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGQgZGVzY3JpcHRpb24gZm9yIHRoZSBaaWNj
cnNlIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIGludHJvZHVjZWQgaW4KPiB0aGUgcmlzY3YgcHJv
ZmlsZXMgc3BlY2lmaWNhdGlvbiB2MC45LjIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA2ICsrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiBpbmRleCBlNjQz
NjI2MGJkZWIuLmIwOGJmMWE4ZDhmOCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+IEBAIC0yNDUsNiAr
MjQ1LDEyIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAgIGluIGNvbW1pdCA2NDA3NGJjICgi
VXBkYXRlIHZlcnNpb24gbnVtYmVycyBmb3IgWmZoL1pmaW54Iikgb2YKPiAgICAgICAgICAgICAg
cmlzY3YtaXNhLW1hbnVhbC4KPgo+ICsgICAgICAgIC0gY29uc3Q6IHppY2Nyc2UKPiArICAgICAg
ICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmljY3JzZSBleHRl
bnNpb24gd2hpY2ggcHJvdmlkZXMgZm9yd2FyZCBwcm9ncmVzcwo+ICsgICAgICAgICAgICBndWFy
YW50ZWUgb24gTFIvU0Mgc2VxdWVuY2VzLCBhcyBpbnRyb2R1Y2VkIGluIHRoZSByaXNjdiBwcm9m
aWxlcwo+ICsgICAgICAgICAgICBzcGVjaWZpY2F0aW9uIHYwLjkuMi4KPiArCj4gICAgICAgICAg
LSBjb25zdDogemsKPiAgICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ICAgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgWmsgU3RhbmRhcmQgU2NhbGFyIGNyeXB0b2dyYXBoeSBleHRlbnNpb24gYXMgcmF0
aWZpZWQKPiAtLQo+IDIuMzkuMgo+ClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
