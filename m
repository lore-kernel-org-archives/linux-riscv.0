Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2963EC369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6b7KsNyNzYneZLrf1L+kXxWrb/fsrxwXZnSHNHUkREs=; b=o0CqV90RUsJ+dp
	UlhyPIJxUv+b+OReFQFjjDGEWfSFg2NMTX9NcwW2qshUzwju9HL7lyhu+iYdJs5rPXWmiETGu2kKJ
	kFNthvDsWVvNKKBNa1Lg0+QPumdGOlqKhG8P0s02iKcHLSo7mDozBS/2BNz9IMmQSckDYCMKE4lIt
	FVet8WImG6/6rzJ7wqXPw6ukeI4nzGFPvootUYy2kJp4DVA9nFoVUFplzyi8t8jRVn6mxfmeNA4t8
	vVjKosGfMvWTpkNdIV9x5GO/8JNOqCl4srXVmSIdrJPYTJHsAoDhqrE9OPsDoZqx5PnKEWVlb7Cs7
	ktV2onu6UbUeygSh4v8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IsG-0000000HEdP-03pu;
	Fri, 25 Apr 2025 13:13:48 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HsF-0000000H4ML-0pND
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:09:46 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3d57143ee39so19635295ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745582982; x=1746187782; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viCw2qA4ejmDM4IL1wv9giS7D3cMPoAepDm5Vm/i2EM=;
        b=GztN7hGX81UOOAQXLhDaIC5F7rTTDzaH7RHnl4P3/WvxasUSmAimXvJ2wjIeOpSXbF
         jEk+/rdIpx3oo/EY3ZFi4uRwDRBbSqnSqlksolopSQZSeKvds7YsFe52GQzy4XwFL4pa
         ACMz/kJszcGNEIkV4F8sHknQn+MgEpxtdiaD/QbVy/C1Dch4TX/muPTiVriQCK1P2LiP
         bt2oQBI3BMHlDUJM4Ckk2ygtSRP+hfsXJH5RA4UrbsgAs4/Klqr/mY2kjR0MLxV2P882
         NNMT6n5Fah+uabHVvg96EznAqS1kNmWgwLLSFw3h+sC0o7VSpp1DJehtw4+duX9BY0LZ
         a0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582982; x=1746187782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viCw2qA4ejmDM4IL1wv9giS7D3cMPoAepDm5Vm/i2EM=;
        b=nuF8eKDdEbKTYEfUG21YFVzZ6ahdUEfr1qjsBBHtbH/85Hb/+5ST34ZIbsPPpROmXr
         6kfu4HvGODxZ1BXJhYZdA0PQWXPxH5tJUmstTz5FpZUeXf735kCwMF6ExEXBg3LrJBf+
         f9dMEFuCUI5CZWNoNI4Xin4m2gx6PRw0A0Sxyq+/RtF2J5Y83iNQBO4KmNOGAla7L/gh
         wBAi6Ll4etIeqYXBbqn35bNjgCuSUhOnlWj/W8Im+0gCAhmOJXPxc96nDwx+D75jJWyh
         CRFXMUYpyw3EflqokrqVblS9Hk8AiCuTt0TbUpt38yl8Nv9qyYeJ5SodL5uA2xp/OOrd
         Gk6A==
X-Forwarded-Encrypted: i=1; AJvYcCVyo03v16C2dA8XGQoQeOVNRXvbgdWu6b+fGvFISNrJPBKppWRkaWsZl7M2WI/E4FKAIXrUdjwALXDPgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuzwg/zlmxlKawtMiOY/BqMg8ilwjIkXQ9rg/HtfeQm7m++N/s
	iExRuXmmA9JtOZCVGvuoLYwZTLzh4KSRtjWazdynH9cM6XCCLc5f6OGMaEmb4xUiaWHtZK4JQlv
	i1EnP0+ufUQXLe4PRTxYQNoWWl4+5PUdPAAOfPQ==
X-Gm-Gg: ASbGncsG0JueZ6pNLgLexJW/4BGPsP99LB1J2axGqx9rgLvdgWMqzc6l6c6kMN+bHhP
	lZClyh514X2Uh+qla4xSx+pAOK9MQtwY1hPtrHYiCI4Jhj4De7Ge9DHIXxiUgd2kDj95moIJww4
	Qb/J4YROLb8Y3ycykZXgcxwvolnyP60fKNrQ==
X-Google-Smtp-Source: AGHT+IGoEJG5zH/Wr0uFePVEm/5CuSYxVySEAKvHuO5qDV3z6MJIg+y3hhgx9qY6URyzTt8T0jY2qH9X8K2GpPqyw1A=
X-Received: by 2002:a05:6e02:174a:b0:3d4:2409:ce6 with SMTP id
 e9e14a558f8ab-3d93b3aad74mr19265945ab.5.1745582981830; Fri, 25 Apr 2025
 05:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com> <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
In-Reply-To: <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Apr 2025 17:39:30 +0530
X-Gm-Features: ATxdqUFstmpMiz2VW1TbmZRJAZ7pd1khz3F8RMk9AGfAqqDs4TxHZFyQgyus6fM
Message-ID: <CAAhSdy11BqtEV+RoFmnpizxCTiKaWexMQGKvP15BF-AkDZUDJQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: riscv: selftests: Add stval to exception handling
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_050943_490128_6ADC1CD9 
X-CRM114-Status: GOOD (  11.99  )
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgNjoxMOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFNhdmUgc3R2YWwgZHVyaW5nIGV4Y2VwdGlvbiBoYW5kbGlu
ZyBzbyB0aGF0IGl0IGNhbiBiZSBkZWNvZGVkIHRvCj4gZmlndXJlIG91dCB0aGUgZGV0YWlscyBv
ZiBleGNlcHRpb24gdHlwZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggfCAxICsKPiAgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9oYW5kbGVycy5TICAgICAgfCAyICsrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+IGluZGV4IDVmMzg5MTY2MzM4
Yy4uZjRhN2Q2NGZiZTlhIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiBAQCAtOTUsNiArOTUsNyBAQCBzdHJ1
Y3QgZXhfcmVncyB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGVwYzsKPiAgICAgICAgIHVuc2ln
bmVkIGxvbmcgc3RhdHVzOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBjYXVzZTsKPiArICAgICAg
IHVuc2lnbmVkIGxvbmcgc3R2YWw7Cj4gIH07Cj4KPiAgI2RlZmluZSBOUl9WRUNUT1JTICAyCj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvaGFuZGxl
cnMuUyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvaGFuZGxlcnMuUwo+
IGluZGV4IGFhMGFiZDNmMzViYi4uMjg4NGMxZTg5MzliIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvaGFuZGxlcnMuUwo+ICsrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvaGFuZGxlcnMuUwo+IEBAIC00NSw5ICs0NSwx
MSBAQAo+ICAgICAgICAgY3NyciAgczAsIENTUl9TRVBDCj4gICAgICAgICBjc3JyICBzMSwgQ1NS
X1NTVEFUVVMKPiAgICAgICAgIGNzcnIgIHMyLCBDU1JfU0NBVVNFCj4gKyAgICAgICBjc3JyICBz
MywgQ1NSX1NUVkFMCj4gICAgICAgICBzZCAgICBzMCwgMjQ4KHNwKQo+ICAgICAgICAgc2QgICAg
czEsIDI1NihzcCkKPiAgICAgICAgIHNkICAgIHMyLCAyNjQoc3ApCj4gKyAgICAgICBzZCAgICBz
MywgMjcyKHNwKQo+ICAuZW5kbQo+Cj4gIC5tYWNybyByZXN0b3JlX2NvbnRleHQKPgo+IC0tCj4g
Mi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
