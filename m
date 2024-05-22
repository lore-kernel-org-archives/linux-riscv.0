Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2101CC25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZoBNCsR9XtJiZG9qD7lBcvc9r5/VWzZgNScSPo7aCI=; b=SsykC3hAxvbJ+Y
	SfuhM/D7RKc/Zhb380fReoY+7eQIVEt6H6VcggfB0gQPpDvbdopfL7fj9cg8qRwlFbVSwnsYJtane
	q8TsfIWL2OCGbRN7oTNoKj8PTKUcCC8h26DQef3y09Dzr5B1V0l4WjTnCXuEUOuZCudeY+IpUM978
	wxiC559zp62MEoTVxIW0tZ42p6Od0vI7GROCUS1L4oD/3ZJUuNW5NWiWiP3cxjgcPzCcLw0eyJQyT
	n4nPo3M5JxGIu+VaPngbF34gbWumdICN6WZNPL7QOCPOs/RlVRjvo1/KNQvOh+9mUwZb1lY3oXLaf
	RkbMBvtg1DdpGS8S9jQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9qtH-00000003piy-30jT;
	Wed, 22 May 2024 18:40:43 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9qtE-00000003phl-23Xo
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 18:40:42 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7dec804bd19so17470739f.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716403238; x=1717008038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CkJWPtWzq2cjcP7a09if5B9kWWmXWyc6FlwIT3mHR0=;
        b=h8GGKxE4tVE7lVh1tnZNy8/omjw+ENyPyovHbUFSHIS+t8y2GRValhDcbZpPsq5kGB
         7HDhAUVBmKqep9P69POslN8q1OYC/ma5MdtsowjZODJ5S0vwwe8hrcqzKS3i7Y+1iQs2
         9ry1vc39nuOokT77mx7qRy99bxcLmD3qcmoS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716403238; x=1717008038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CkJWPtWzq2cjcP7a09if5B9kWWmXWyc6FlwIT3mHR0=;
        b=F9DpyebRlerFz8Gl3vN3MINdioqj9zk71HtwrHjmQuFirFp50kmQwJkhUwKc1aDt/M
         n9QNcKS+IyB4RjDMZMgwvr2ITgHuIcKhufonwjPXgxx4Y79J4cxyhNMUXH5Z9MSpKdWg
         XLkxORXE+sF+1wXDv/SD0TmKYokV2VrjI/nupq6aKPDpKj5ECZjvihispX49ndL+Ew2w
         hrXzrIsawo5pK7OnV1rW4W7gh2YL4zh09gYGdqvgJmnBtupQlm0JWe/2cylNvet3+yit
         BRmCZ4u/+Nv5Ns2XuXuZ50mVWQ2xf07Lh5kLYyYdfMy/6pm7oht4+RRHLoHnEEt6Bc0e
         h69A==
X-Forwarded-Encrypted: i=1; AJvYcCVs9uCXRnZCd1VXoCmEsvk5WWcowWsdbi8EXfUry69XyM1M9oZfoptr1y0PEBs35IU8p7xc4rMdHbpe/wXiCttmLucSRctkMjurFMDTOrHy
X-Gm-Message-State: AOJu0Yw+azrRmiNiq12hSt7mmZpndT+abibKJBEY2m1tZVDHfVULwlgl
	vjTBOsvMrb80gZG4+E28kNt3+GeVNhWVG4nbbs1rhcy69alPR9BR9bhIgWmq/Q0=
X-Google-Smtp-Source: AGHT+IHfJbSzf9eR6h+5NiCKdgJYC/D5h2NHJ2n/qeMndC5IVVrtGPtwRsxEDeIFRtYop2k9g8p2Vw==
X-Received: by 2002:a05:6602:420a:b0:7de:b279:fb3e with SMTP id ca18e2360f4ac-7e37db353b9mr293535939f.1.1716403238250;
        Wed, 22 May 2024 11:40:38 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-48a42b0e43dsm4496318173.101.2024.05.22.11.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 11:40:37 -0700 (PDT)
Message-ID: <7a7d6b6c-0f28-4ffe-9bf2-a25c088636db@linuxfoundation.org>
Date: Wed, 22 May 2024 12:40:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/68] Define _GNU_SOURCE for sources using
To: Edward Liaw <edliaw@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, shuah@kernel.org,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@android.com,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240522005913.3540131-1-edliaw@google.com>
 <6caf3332-9ed9-4257-9532-4fd71c465c0d@linuxfoundation.org>
 <20240522101349.565a745e@kernel.org>
 <CAG4es9VZ3r34sUkp31+GCrA_XOq6WqwUUitPMQFViLL83mezYg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAG4es9VZ3r34sUkp31+GCrA_XOq6WqwUUitPMQFViLL83mezYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_114040_567999_11E58499 
X-CRM114-Status: GOOD (  16.67  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS8yMi8yNCAxMTo0NCwgRWR3YXJkIExpYXcgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMjIsIDIw
MjQgYXQgMTA6MTPigK9BTSBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPiB3cm90ZToK
Pj4KPj4gT24gV2VkLCAyMiBNYXkgMjAyNCAxMDoxOTozMyAtMDYwMCBTaHVhaCBLaGFuIHdyb3Rl
Ogo+Pj4gT24gNS8yMS8yNCAxODo1NiwgRWR3YXJkIExpYXcgd3JvdGU6Cj4+Pj4gQ2VudHJhbGl6
ZXMgdGhlIGRlZmluaXRpb24gb2YgX0dOVV9TT1VSQ0UgaW50byBLSERSX0lOQ0xVREVTIGFuZCBy
ZW1vdmVzCj4+Pj4gcmVkZWZpbml0aW9ucyBvZiBfR05VX1NPVVJDRSBmcm9tIHNvdXJjZSBjb2Rl
Lgo+Pj4+Cj4+Pj4gODA5MjE2MjMzNTU1ICgic2VsZnRlc3RzL2hhcm5lc3M6IHJlbW92ZSB1c2Ug
b2YgTElORV9NQVgiKSBpbnRyb2R1Y2VkCj4+Pj4gYXNwcmludGYgaW50byBrc2VsZnRlc3RfaGFy
bmVzcy5oLCB3aGljaCBpcyBhIEdOVSBleHRlbnNpb24gYW5kIG5lZWRzCj4+Pgo+Pj4gRWFzaWVy
IHNvbHV0aW9uIHRvIGRlZmluZSBMSU5FX01BWCBsb2NhbGx5LiBJbiBnZXJlbmFsIGl0IGlzIGFk
dmlzYWJsZQo+Pj4gdG8gbm90IGFkZCBsb2NhbCBkZWZpbmVzLCBidXQgaXQgaXMgZGVzaXJhYmxl
IGluIHNvbWUgY2FzZXMgdG8gYXZvaWQKPj4+IGNodXJuIGxpa2UgdGhpcyBvbmUuCj4+Cj4+IFdp
bGwgdGhlIHBhdGNoIHRoYXQgQW5kcmV3IGFwcGxpZWQ6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI0MDUxOTIxMzczMy4yQUU4MUMzMjc4MUBzbXRwLmtlcm5lbC5vcmcvCj4+IG1h
a2UgaXRzIHdheSB0byBMaW51cz8gQXMgeW91IHNheSB0aGF0J3MgYSBtdWNoIHNpbXBsZXIgZml4
Lgo+IAoKVGhhbmsgeW91IEpha3ViLiBZZXMuIFRoaXMgaXMgYSBzaW1wbGVyIGZpeC4KCj4gUmln
aHQsIHRoaXMgcGF0Y2ggc2VyaWVzIG1heSBiZSB1bm5lY2Vzc2FyeSBhZnRlciBhbGwsIHNpbmNl
IHRoZQo+IHByb2JsZW0gaXMgZml4ZWQgYnkgdGhhdCBwYXRjaC4KPiAKPiBJdCBtaWdodCBiZSBi
ZXR0ZXIgdG8gZHJvcCB0aGUgc2VyaWVzIHVubGVzcyBpdCBpcyBkZXNpcmFibGUgdG8KPiBjZW50
cmFsaXplIHRoZSBkZWNsYXJhdGlvbiBvZiBfR05VX1NPVVJDRSB0byB0aGUgcm9vdCBNYWtlZmls
ZSAvCj4gbGliLm1rLiAgSWYgdGhhdCBpcyBzdGlsbCB3YW50ZWQsIG1heWJlIGEgbW9yZSBwYWxh
dGFibGUgYXBwcm9hY2gKPiB3b3VsZCBiZSB0byBzdXJyb3VuZCBldmVyeSBpbnN0YW5jZSBvZiAj
ZGVmaW5lIF9HTlVfU09VUkNFIHdpdGgKPiAjaWZuZGVmIF9HTlVfU09VUkNFIGZpcnN0LCB0aGVu
IGluZHVjZSB0aGUgY2hhbmdlIHRvIENGTEFHUyBpbiBsaWIubWsuCj4gVGhhdCB3b3VsZCBwcmV2
ZW50IGEgcGFydGlhbCBtZXJnZSBmcm9tIHRyaWdnZXJpbmcgYnVpbGQgd2FybmluZ3MuCgpQbGVh
c2UgZHJvcCB0aGlzIHNlcmllcy4KCnRoYW5rcywKLS0gU2h1YWgKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
