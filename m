Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF416C83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OAJbHq8Ao7GZD+zdNVroBqnRPq1clrrNPfoxax1jblk=; b=dMZL4Abvo22DjnE6jiLHrT+Exz
	zfwXMBhIfwweJK/71K3OLahGCchGmTAIfvgVDquNLJAMWJUZljfjNYYMzBTH8IPu+NDRHFCAIQ59u
	r2zyzrxhiLn/xSI41wsYG/0Eefx5MqjLcI7hEj33Xik+zWbrxGJoN2Duj5XNjrS01/tqG/uQ5EP9k
	t2lElUkkMYV2DiH56QN6bIO9Qdml1b7citX9TQYHT2KpKzRqx55YrNwB6HPohz5WXLrvh/qdnsEhO
	26ftTrN8dtUr1t1w8HxZIR4rxJ++nXByVw+3YpHR9G8ngJvqJOVJ0LvhNtfUW0SyGfb1IrbKic/1G
	T6+Bfp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qacuX-009gjM-0A;
	Mon, 28 Aug 2023 14:08:09 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qacuU-009gia-0j
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 14:08:07 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d72e09f1263so3663061276.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693231685; x=1693836485;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQzBZViMiXxzuO/spH4qOnPzxeBorWIS0cpOhC8IESs=;
        b=fboNAGalMsxnymcuH7wioVYD/m5EN7GeTmFkCaLwBntl9TGqPNA3u6ygbRrxl7Bcq9
         f97CUH2ApiiuJJPtNUx+Z3gBbJcBve2BehuWVeWfMr055SQOZ+CgU3WInkb+o6z9+g2+
         dCK76Zlzg/tCdjA6DSxJYCTT1ufxAAZhuVIKllwjOneVYfUHtpnAOoEh8kKKjwW/t7BZ
         pO3GF1ygEUtt3cPTuLvedl5Q9WeNI39bm+goAiO+JQAVrQArtzZy3LXPwkfRbqgKBu0q
         kU/dyyguNYApXjsZF1QAl+nEFv+GzlSA2WwjvT/BKu7DVfH5VHhIkfJUyK2s8wIQ9ycL
         Ywaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693231685; x=1693836485;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IQzBZViMiXxzuO/spH4qOnPzxeBorWIS0cpOhC8IESs=;
        b=GmxRycj4ENvSUYylOrAx+q4Fvp6p4QaUvtSDEA4kA+0Xes4cpbmWae/h5kwh5O/Lyz
         I5296liQZiU2T0pVjSQDAlLZOQsikv+3aFcuMlgM1VqtVhMWzJIAqxWw1M1c9SIPXA6K
         uHsMrlDriL1H8il7u4C0xtwo1cWCzzOXn/OevCZhkYKpwQsGHlaH5pqxYwztId93RDI4
         5TPUlBUxS91jbHZFX167qgz5MD4k0EuftgX3SU2BulBzvr4MmEEqFndDt9jBlbybPjAE
         9uv8tHvQ/Oefrp04Hu/PYNBG/eBHxy3WAseBUyi6fSHE2ypEz0F0jsCQsRZY3KQsgz9D
         54GQ==
X-Gm-Message-State: AOJu0YwACuWJ2IbmCWQuIbJ/BIsJWJGss/g+HCn6v4l1YPU3vu82r+EE
	hGb7ZvzJ1vYEinlvPzrsxu/r4nz8174=
X-Google-Smtp-Source: AGHT+IEPNT5dxV90uoo9KWwoJMe2AWhX3rk37xDhBjZEi+PP9HmLSdQmZzdNZnH9NrHYW4COEsiPyZAlMGs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:41c1:0:b0:d4f:638b:d806 with SMTP id
 o184-20020a2541c1000000b00d4f638bd806mr874814yba.8.1693231685064; Mon, 28 Aug
 2023 07:08:05 -0700 (PDT)
Date: Mon, 28 Aug 2023 07:08:05 -0700
In-Reply-To: <CAJve8onbxHjJoC-k-TtOm1BBtjm38moaW-Kk8siKsxt9nwZZZw@mail.gmail.com>
Mime-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <ZMrVrXlvu/FJEayx@google.com>
 <CAJve8onbxHjJoC-k-TtOm1BBtjm38moaW-Kk8siKsxt9nwZZZw@mail.gmail.com>
Message-ID: <ZOyqRfdvxpdtSE1c@google.com>
Subject: Re: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
From: Sean Christopherson <seanjc@google.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_070806_266071_0388489F 
X-CRM114-Status: GOOD (  16.06  )
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

T24gU3VuLCBBdWcgMjcsIDIwMjMsIEhhaWJvIFh1IHdyb3RlOgo+IE9uIFRodSwgQXVnIDMsIDIw
MjMgYXQgNjoxNuKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3
cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEp1bCAyNywgMjAyMywgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+
IFRoZSBzc3RjX3RpbWVyIHNlbGZ0ZXN0IGlzIHVzZWQgdG8gdmFsaWRhdGUgU3N0YyB0aW1lciBm
dW5jdGlvbmFsaXR5Cj4gPiA+IGluIGEgZ3Vlc3QsIHdoaWNoIHNldHMgdXAgcGVyaW9kaWMgdGlt
ZXIgaW50ZXJydXB0cyBhbmQgY2hlY2sgdGhlCj4gPiA+IGJhc2ljIGludGVycnVwdCBzdGF0dXMg
dXBvbiBpdHMgcmVjZWlwdC4KPiA+ID4KPiA+ID4gVGhpcyBLVk0gc2VsZnRlc3Qgd2FzIHBvcnRl
ZCBmcm9tIGFhcmNoNjQgYXJjaF90aW1lciBhbmQgdGVzdGVkCj4gPiA+IHdpdGggTGludXggdjYu
NS1yYzMgb24gYSBRZW11IHJpc2N2NjQgdmlydCBtYWNoaW5lLgo+ID4gPgo+ID4gPiBIYWlibyBY
dSAoNCk6Cj4gPiA+ICAgdG9vbHM6IHJpc2N2OiBBZGQgaGVhZGVyIGZpbGUgY3NyLmgKPiA+ID4g
ICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBleGNlcHRpb24gaGFuZGxpbmcgc3VwcG9ydAo+
ID4gPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGd1ZXN0IGhlbHBlciB0byBnZXQgdmNw
dSBpZAo+ID4gPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIHNzdGNfdGltZXIgdGVzdAo+
ID4KPiA+IEZZSSwgcGF0Y2ggNCB3aWxsIGNvbmZsaWN0IHdpdGggdGhlIGluLWZsaWdodCBndWVz
dCBwcmludGYgY2hhbmdlc1sqXSwgYXMgd2lsbAo+ID4gcmV3b3JraW5nIHRoZSBleGlzdGluZyBh
cmNoX3RpbWVyIHRlc3QuICBNeSBwbGFuIGlzIHRvIGNyZWF0ZSBhbiBpbW11dGFibGUgdGFnCj4g
PiBsYXRlciB0aGlzIHdlZWsgKHdhaXRpbmcgdG8gbWFrZSBzdXJlIG5vdGhpbmcgZXhwbG9kZXMp
LiAgSSBoaWdobHkgcmVjb21tZW5kIGJhc2luZwo+ID4gdjIgb24gdG9wIG9mIHRoYXQuCj4gPgo+
IAo+IEhpIFNlYW4sCj4gCj4gQ291bGQgeW91IGhlbHAgcG9pbnQgbWUgdG8gdGhlIGltbXV0YWJs
ZSB0YWcgZm9yIHRoZSBndWVzdCBwcmludGYgY2hhbmdlcz8KClNvcnJ5LCBJIGZvcmdvdCB0byBj
cmVhdGUgdGhlIHRhZyB1bnRpbCBsYXN0IHdlZWssIHByb2JhYmx5IG1hZGUgaXQgYSBiaXQgaGFy
ZCB0bwpmaW5kLi4uCgogIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0teDg2L2xpbnV4LmdpdCB0YWdz
L2t2bS14ODYtc2VsZnRlc3RzLWltbXV0YWJsZS02LjYKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
