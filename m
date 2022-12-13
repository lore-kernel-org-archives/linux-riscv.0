Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC78DC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUfPVnl1te77TPQOys8GuGFiWM9xBdYvXYECbEuimls=; b=eIsl3U2RCI0s6X
	DD+BFRNsY7CEbxJWZk0i+qI/BZEdSHsRBxBf3PmujG3MbtYTS9OSnu3y9VrVE8E7bQp31cMYC3sIS
	AaUorXFX+BB8FSlWs7bc4L3Yj5zoqpRYF4Hg3tkhF6M2eF79mylW2iYrpmfavm65bb8NwTCHpUlKM
	qRhxZLzQNKJt2Xq3s7a8B9sC5OGbysFnZTnm+2blMMQoHeCJEfR5w+7dqPzCK2GhfwhrsuIPIhAcV
	pUIzfHDIGOf0lmyH8X1K6xoepVNcAI6cf+2vKOFcxdmgvL7Yi5d3COeaU6fCd5bmt6SZWtfb7CcrY
	utgIwKKDtyMyEKUlEHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51t2-00EtRb-Mb; Tue, 13 Dec 2022 09:47:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51sp-00Es5s-8g
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 09:47:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id ay40so7826661wmb.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUffeOkZJV6CbBOjXRvBE9aKOOUHPUai9QNqwF2Rw6k=;
        b=s1JH0apqKbSMIxIiwVTiEGvWlt6voHGA0Qg93k6bu0bo94Xy2pc1rgrx+aKZpEtkx6
         tAkY+DS3eAY/MbbRYxforucS9NjS3Y/J+tyLt2y4zma1TERO/0grq5KMq0vq/JPyZFBz
         uuzCElIdsA0WjdkodayUEVOjRvLIQMBQqZyE+ugj5nJLcFiHRq0Adeoz1JxR/vw5valn
         M6ePXoLF+ntrgyqEb+FWCTpZ/Y72s2I7CfUH8aDCBnPG2ygVESeMtHM7BOVqZvMx+DrN
         +34OyPj6HJPDo1O1oBSY+duAkwoi2k2YHG0FzskbkMhvLtYA4PBVWcLfgYnkAWBL9chR
         D2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUffeOkZJV6CbBOjXRvBE9aKOOUHPUai9QNqwF2Rw6k=;
        b=LHUR9S/kq0Qfg1Fmggh5763V2frYOnwjZ6IBlYw4TI0yzcD0jfTzulOZAXcf8snxHy
         PzW8bo/oFD5glsLT3v6c7pKDpvKi8zlRtS03fPvFjRc8OE5ASp0s1nLDAyX/eawJFBVY
         Sf1nww/c6Bylqleti5Getgb60ivpv0CiX6KEPoJR+N+fKB++bJEnMEuMlyDQVbtkd4b2
         iT/BVt2NQ33LBo3PUend6TeZm7wgAIRuguTCjr4789wzY/ndnwTIC3jI/qU+tMTl5eJl
         RY3H20yQ9ZGbHPuME0it7Wma6gBuSpePsyFACwQdIpbN2J7/dBU4i27TJWDhJfjo6aBp
         dx8w==
X-Gm-Message-State: ANoB5pkJv9zabbL1+S8HYtiF5XYXsetkWVm8fd3xvad36ehe+/AnrBlo
	svcTPDgI/bpH4nJDgzrjjulxFw==
X-Google-Smtp-Source: AA0mqf45B8663eyuUa7gYYZoZljx5xDAypBaIEMtrhbpuNigeolIoqaS3rVH+IjTq+i8TltLJF+66w==
X-Received: by 2002:a05:600c:a54:b0:3cf:a41d:844b with SMTP id c20-20020a05600c0a5400b003cfa41d844bmr15253803wmq.5.1670924845957;
        Tue, 13 Dec 2022 01:47:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b003c6bd91caa5sm12602817wmb.17.2022.12.13.01.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 01:47:25 -0800 (PST)
Message-ID: <2505189d-c682-ed70-442b-798c258d3b68@linaro.org>
Date: Tue, 13 Dec 2022 10:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 05/14] KVM: selftests: Fix a typo in x86-64's
 kvm_get_cpu_address_width()
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Tom Rix <trix@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>,
 Aaron Lewis <aaronlewis@google.com>,
 Raghavendra Rao Ananta <rananta@google.com>
References: <20221213001653.3852042-1-seanjc@google.com>
 <20221213001653.3852042-6-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213001653.3852042-6-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_014731_313036_11E52941 
X-CRM114-Status: GOOD (  13.68  )
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

T24gMTMvMTIvMjIgMDE6MTYsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gRml4IGEgPT0g
dnMuID0gdHlwbyBpbiBrdm1fZ2V0X2NwdV9hZGRyZXNzX3dpZHRoKCkgdGhhdCByZXN1bHRzIGlu
Cj4gQHBhX2JpdHMgYmVpbmcgbGVmdCB1bnNldCBpZiB0aGUgQ1BVIGRvZXNuJ3Qgc3VwcG9ydCBl
bnVtZXJhdGluZyBpdHMKPiBNQVhfUEhZX0FERFIuICBGbGFnZ2VkIGJ5IGNsYW5nJ3MgdW51c3Vl
ZC12YWx1ZSB3YXJuaW5nLgo+IAo+IGxpYi94ODZfNjQvcHJvY2Vzc29yLmM6MTAzNDo1MTogd2Fy
bmluZzogZXhwcmVzc2lvbiByZXN1bHQgdW51c2VkIFstV3VudXNlZC12YWx1ZV0KPiAgICAgICAg
ICAgICAgICAgICpwYV9iaXRzID09IGt2bV9jcHVfaGFzKFg4Nl9GRUFUVVJFX1BBRSkgPyAzNiA6
IDMyOwo+IAo+IEZpeGVzOiAzYmQzOTYzNTNkMTggKCJLVk06IHNlbGZ0ZXN0czogQWRkIFg4Nl9G
RUFUVVJFX1BBRSBhbmQgdXNlIGl0IGNhbGMgImZhbGxiYWNrIiBNQVhQSFlBRERSIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0K
PiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIveDg2XzY0L3Byb2Nlc3Nvci5jIHwg
MiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIveDg2XzY0L3By
b2Nlc3Nvci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi94ODZfNjQvcHJvY2Vz
c29yLmMKPiBpbmRleCBjNGQzNjhkNTZjZmUuLmFjZmExZDAxZTdkZiAxMDA2NDQKPiAtLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3g4Nl82NC9wcm9jZXNzb3IuYwo+ICsrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIveDg2XzY0L3Byb2Nlc3Nvci5jCj4gQEAg
LTEwMzEsNyArMTAzMSw3IEBAIGJvb2wgaXNfYW1kX2NwdSh2b2lkKQo+ICAgdm9pZCBrdm1fZ2V0
X2NwdV9hZGRyZXNzX3dpZHRoKHVuc2lnbmVkIGludCAqcGFfYml0cywgdW5zaWduZWQgaW50ICp2
YV9iaXRzKQo+ICAgewo+ICAgCWlmICgha3ZtX2NwdV9oYXNfcChYODZfUFJPUEVSVFlfTUFYX1BI
WV9BRERSKSkgewo+IC0JCSpwYV9iaXRzID09IGt2bV9jcHVfaGFzKFg4Nl9GRUFUVVJFX1BBRSkg
PyAzNiA6IDMyOwo+ICsJCSpwYV9iaXRzID0ga3ZtX2NwdV9oYXMoWDg2X0ZFQVRVUkVfUEFFKSA/
IDM2IDogMzI7Cgo6KQoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAbGluYXJvLm9yZz4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
