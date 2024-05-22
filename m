Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4839C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNdJPiPqPHN+d/U4/Ml9Kdp7IK8HCEaX8+yf0kgly4o=; b=RdHBSKhTjxL2bi
	lSyPjqamj1YRC7T7JgeYBvt3Jyc+9avUvsAmgSrnR9fAfeyDQG4RNFu5CrDvJmDffTiixw3cdEw2Z
	yfy8mIbBOQWr6Rgu+8atAslrD54P1Q1gCcl9hkdI/+aPWxLBK3z+QmKERXrSA1gVhSKJThiygHgeJ
	21iTF7J3XfS6FApL8oaqmTwCYJlAs/aEGQ0mtW8ILMhruC/RVkLgnh5PiCJbNqvhfBUCbwXgG6KR0
	3diCeYewyFrhvcQ8uroHx1w0IwRO3MWs96Vk5L7HqnH5RBBiE/NEtAgtloMmPmzMJhp0ZfpZ0kqaA
	Bc03Sk4OBoK+Pb2VbcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9hHc-00000002Lps-2ln7;
	Wed, 22 May 2024 08:25:12 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9hHZ-00000002LkU-1utv
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 08:25:11 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c9d0671dfaso2555219b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716366298; x=1716971098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryQmKzk8MS5bOTQ7tYWhiPdYPLdCvZh4q9YKiDsePQg=;
        b=fju9egpH+DBr9GCcfrvpLjJjzY8vaX0/KUq9Ki9WNNW4l7JO8GHqF1EfXRT8AuSYt1
         y4KQss9sDzBgSNZt8Fyt6kIqYu4Iodi/zJy5Mv0OF7EF6a7Gq3lYzTQYLSvZ2FnfdlaL
         4Gz/4szZ+TP5fVyadaGD82vW7ygVmBxjtFG/RvW/9m+IAUBHJfvMGa+6kEl4Wshnaod2
         DuC8RZ3nQhxhcmf4yi+oeRG6B2YavswpEYgD6bGbtqsFBgJPjmR3PLrjsBNaSJuL1on3
         yLz+QdcfDxlkjrF4q0JCu6JE8K9M4X8BQxccgW0O/yK/qgyn9k1h+iO75RlSUZu3KiH+
         m8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716366298; x=1716971098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryQmKzk8MS5bOTQ7tYWhiPdYPLdCvZh4q9YKiDsePQg=;
        b=XdAWNaYkzSW/APe9y6hCDf6nRJltblaMjx60ZQOMqeEpM3CkFMnUfMUqif4uLLDUma
         9byAEk14VkbvIYuu+TCxA9cVAUz0THVw8Kc1rDyLU4AQRQ84cEzGtsmWl9muqV7zxJXF
         ybG1nn7dh1SnXio9FMUvsw3ZtZKuuF78nRbujKoMeRLlgz8TPjJLtTnj14k2SsbncbzM
         g5VCYhZxq3E4XgR8tVj0dUF/I8qXgugaCAa+KKfmzozAlCSOiacHuYD/8RAe/QdEi/e2
         44gp1HLz6EBuIqRzPCRq8qDZBsi5WZ99SjB4/VSex9h0U7grtRM4bmbyFnftMRxZx4g2
         5ukA==
X-Gm-Message-State: AOJu0YzkRgdZ82PbGwqu5fYjvboS/moQFYty/sXBLz4wuU5vBaFWo1u8
	nrlpHzbR5zWcQTynEXXBxiOm4NA3ijssNdMW8KxeWoNwMnNW/V8sngcwyAkgT2L+g9t6TPuKSYr
	cRx21NZQwsTU3v6f9ScN/yxrF/XJEVlziCIMsjGRWw+8lo91I
X-Google-Smtp-Source: AGHT+IF4k+kxPGLcYD0POCnK9OmyQ9preI608Hi2OXykANc9ri4/InnJ5s0XE9eRonrivkbfast3MVxc50oCdnXsClw=
X-Received: by 2002:a05:6808:140e:b0:3c7:4db:9769 with SMTP id
 5614622812f47-3cdb6c6eb3dmr1592357b6e.47.1716366298226; Wed, 22 May 2024
 01:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240415064905.25184-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240415064905.25184-1-yongxuan.wang@sifive.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 22 May 2024 16:24:46 +0800
Message-ID: <CAMWQL2jvNV70dX46J+EzUQXxw1yzVGzB2+knuPFiWK7mF2TfFA@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: KVM: No need to use mask when hart-index-bit
 is 0
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_012509_600760_5662A32D 
X-CRM114-Status: GOOD (  18.60  )
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

UGluZwoKT24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMjo0OeKAr1BNIFlvbmctWHVhbiBXYW5nIDx5
b25neHVhbi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gV2hlbiB0aGUgbWF4aW11bSBoYXJ0
IG51bWJlciB3aXRoaW4gZ3JvdXBzIGlzIDEsIGhhcnQtaW5kZXgtYml0IGlzIHNldCB0bwo+IDAu
IENvbnNlcXVlbnRseSwgdGhlcmUgaXMgbm8gbmVlZCB0byByZXN0b3JlIHRoZSBoYXJ0IElEIGZy
b20gSU1TSUMKPiBhZGRyZXNzZXMgYW5kIGhhcnQtaW5kZXgtYml0IHNldHRpbmdzLiBDdXJyZW50
bHksIFFFTVUgYW5kIGt2bXRvb2wgZG8gbm90Cj4gcGFzcyBjb3JyZWN0IGhhcnQtaW5kZXgtYml0
IHZhbHVlcyB3aGVuIHRoZSBtYXhpbXVtIGhhcnQgbnVtYmVyIGlzIGEKPiBwb3dlciBvZiAyLCB0
aGVyZWJ5IGF2b2lkaW5nIHRoaXMgaXNzdWUuIENvcnJlc3BvbmRpbmcgcGF0Y2hlcyBmb3IgUUVN
VQo+IGFuZCBrdm10b29sIHdpbGwgYWxzbyBiZSBkaXNwYXRjaGVkLgo+Cj4gRml4ZXM6IDg5ZDAx
MzA2ZTM0ZCAoIlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgZGV2aWNlIGludGVyZmFjZSBmb3IgQUlB
IGlycWNoaXAiKQo+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5n
QHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyB8IDcgKysr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yv
a3ZtL2FpYV9kZXZpY2UuYwo+IGluZGV4IDBlYjY4OTM1MWI3ZC4uNWNkNDA3YzZhOGU0IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL2FpYV9kZXZpY2UuYwo+IEBAIC0yMzcsMTAgKzIzNywxMSBAQCBzdGF0aWMgZ3BhX3QgYWlh
X2ltc2ljX3BwbihzdHJ1Y3Qga3ZtX2FpYSAqYWlhLCBncGFfdCBhZGRyKQo+Cj4gIHN0YXRpYyB1
MzIgYWlhX2ltc2ljX2hhcnRfaW5kZXgoc3RydWN0IGt2bV9haWEgKmFpYSwgZ3BhX3QgYWRkcikK
PiAgewo+IC0gICAgICAgdTMyIGhhcnQsIGdyb3VwID0gMDsKPiArICAgICAgIHUzMiBoYXJ0ID0g
MCwgZ3JvdXAgPSAwOwo+Cj4gLSAgICAgICBoYXJ0ID0gKGFkZHIgPj4gKGFpYS0+bnJfZ3Vlc3Rf
Yml0cyArIElNU0lDX01NSU9fUEFHRV9TSElGVCkpICYKPiAtICAgICAgICAgICAgICAgR0VOTUFT
S19VTEwoYWlhLT5ucl9oYXJ0X2JpdHMgLSAxLCAwKTsKPiArICAgICAgIGlmIChhaWEtPm5yX2hh
cnRfYml0cykKPiArICAgICAgICAgICAgICAgaGFydCA9IChhZGRyID4+IChhaWEtPm5yX2d1ZXN0
X2JpdHMgKyBJTVNJQ19NTUlPX1BBR0VfU0hJRlQpKSAmCj4gKyAgICAgICAgICAgICAgICAgICAg
ICBHRU5NQVNLX1VMTChhaWEtPm5yX2hhcnRfYml0cyAtIDEsIDApOwo+ICAgICAgICAgaWYgKGFp
YS0+bnJfZ3JvdXBfYml0cykKPiAgICAgICAgICAgICAgICAgZ3JvdXAgPSAoYWRkciA+PiBhaWEt
Pm5yX2dyb3VwX3NoaWZ0KSAmCj4gICAgICAgICAgICAgICAgICAgICAgICAgR0VOTUFTS19VTEwo
YWlhLT5ucl9ncm91cF9iaXRzIC0gMSwgMCk7Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
