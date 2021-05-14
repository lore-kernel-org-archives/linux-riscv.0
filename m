Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FB3C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 21:15:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B835D6140A
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 21:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B835D6140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8+phyHxleOK0O5SgkXcAZhOnaFeJPntKVdglpqn0Zps=; b=GwvqMlKktb61WUqIhlbL6OyEI
	Gm8uRfeZ/3dFIsBfL1SqXdezFMjQBAL1ZwpV2quCL93ZC9fnrvCm2u1bGdB5/o9hTrvbSuZDe05Z+
	KcA+AW5vGUNRnDoijXI1/fsMZSeJaDhrnI+tQIqtS9cru3qjgDhCayVV6GT8PUwf3OO/A0kCxTEH9
	ITc5tmlZEVyxjboGQW0fZA/Z8HBy3KwhAHcM8CLnYHC9gy8g69bVDzQIUDmdNp0kgOiQ5gswSG41G
	MTkmoQKiC1WcfdCFvQvJYMDWWtXMEozr61oHcP9JwrvPpmqsSWgs2LYuGiwYKhKL7qrNpkAEWwSzM
	QMw7ydOPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhf9I-00924V-BA; Fri, 14 May 2021 21:15:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhf9D-00923m-Cv
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 21:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Z5wGYWWQ2FAumURVk8pKY57C4qbb9PmQYfuNvhI8eZk=; b=u+tOKsGVat8c84VRWiEr2+v2uu
 RYVIM6lzs0Newuk0mEbVusoWNSdWNHkrtRQUBRWWAFW9EChLbBVDwaIV7VGNdLTYfRwEwSOuGevsr
 RyItbCNs7zOVhUmRd+ljIsGSf8x5VGKrttW1HnokDBA2zg1CohwmswpqdgvFvAyCvVuqQXp1CXmJa
 +Z/5RsbqzhoCg7zxqz4pJtSaMWmBaAvGfJUfAalzM2JM976dSSgbyh0v/SLuGxMLHK5nJYcSY/6RZ
 Af018Xd0NqybLlCXNXefYNL7A1VgX88SYlHao/hRtWSf3jhItKFWRLOJha93fi1pGbK4FmzPiDa2s
 nXdkCDlQ==;
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhf9A-00CGbP-JK
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 21:15:02 +0000
Received: by mail-yb1-xb33.google.com with SMTP id m9so782218ybm.3
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 14:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z5wGYWWQ2FAumURVk8pKY57C4qbb9PmQYfuNvhI8eZk=;
 b=dPcu/lNC6wsZc0/6kTDr/9uhuz8R4BDf+NkFT8Mm+c9EDNn2K6hRW6UqpI87dFaFW0
 mKvHIqtEUCcJmnB8XYztjBgXq7m00jHItaHZF+iy74T8OGPVtKroAcicPU782X/V21ht
 ZX4/bHRO4QRBwBpIOI8SnkJKQOPWEZVGEn4FfK4JNKnXFnV/zAwDVcEEoVZV8lSpGH4I
 1wz6H98Ce8LeemdTNYjpCuzil6AOjFIFygcAH5GpTUP88Z/g4SJsoXPZUxMyMaLu6Iea
 kGDlI6+qf1GKD44K63e22isB5B3Lx4nD4lFrxeS1L3aTsgQNmia5+nsfSHMbz3Xy+PDs
 j3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z5wGYWWQ2FAumURVk8pKY57C4qbb9PmQYfuNvhI8eZk=;
 b=kX+3PNn0fdIo4M0kOXRGHk9ZQXSYkQOe+il+MFJdA/TrO4D9RK/zuLWmuHZyJE9GKj
 E0WtFTXyPBY7Lq5TdvSs7NYZKRn/0gsp8u4kRLaUC6FSYUsrdd+plnqchn0iMHmBKVvh
 NWoqrNvy4qjJfZpMB1PV9IONms8dh8TBmxW0f+cXjZdNKVoU7jRUYqKDhWjvk77ssP9N
 FWK3xuFKoARUkNeXOKGjjGAXhgl70i17RAQJFshSmM2AIvY++CkO/iH+OHzsWaz96oXm
 ezzN6/aBAleeWer6IevdSlHCxYK8VIZ06tacDTh/6vHAz1l+0GvimEa0PndA6virpAEJ
 apdw==
X-Gm-Message-State: AOAM531OU1VERShpY0Q5dDVWrjElPT31y5R16iXSBDiXX8P65yYqAcZ+
 Tgy8MlRAK1qJcJicYVwLOavsFHR88mRhtaBz9MgB1Q==
X-Google-Smtp-Source: ABdhPJzolTsUPvvUtZyIzhg0IuNK3946hzMOewBjBye/sZRlFeRj+JPtv4I/fSB/wuZcdIwVwjm3UF0ECiRsh9KdZVA=
X-Received: by 2002:a25:11c5:: with SMTP id 188mr63393652ybr.322.1621026896780; 
 Fri, 14 May 2021 14:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210514205643.383422-1-raj.khem@gmail.com>
In-Reply-To: <20210514205643.383422-1-raj.khem@gmail.com>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Fri, 14 May 2021 14:14:45 -0700
Message-ID: <CAFP8O3LH3_EdeCDhJ=tmcgcQdThrQTBvpav3cBWP5Tmqa2OkXA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Use -mno-relax when using lld linker
To: Khem Raj <raj.khem@gmail.com>
Cc: linux-riscv@lists.infradead.org, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_141500_679289_1EE14BE8 
X-CRM114-Status: GOOD (  19.01  )
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

T24gRnJpLCBNYXkgMTQsIDIwMjEgYXQgMTo1NyBQTSBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPiB3cm90ZToKPgo+IGxsZCBkb2VzIG5vdCBpbXBsZW1lbnQgdGhlIFJJU0NWIHJlbGF4YXRp
b24gb3B0aW1pemF0aW9ucyBsaWtlIEdOVSBsZAo+IHRoZXJlZm9yZSBkaXNhYmxlIGl0IHdoZW4g
YnVpbGRpbmcgd2l0aCBMTFZNPTEsIEFsc28gcGFzcyBpdCB0bwo+IGFzc2VtYmxlciB3aGVuIHVz
aW5nIGV4dGVybmFsIEdOVSBhc3NlbWJsZXIgKCBMTFZNX0lBUyAhPSAxICksIHRoaXMKPiBlbnN1
cmVzIHRoYXQgcmVsZXZhbnQgYXNzZW1ibGVyIG9wdGlvbiBpcyBhbHNvIGVuYWJsZWQgYWxvbmcu
IGlmIHRoZXNlCj4gb3B0aW9ucyBhcmUgbm90IHVzZWQgdGhlbiB3ZSBzZWUgZm9sbG93aW5nIHJl
bG9jYXRpb25zIGluIG9iamVjdHMKPgo+IDAwMDAwMDAwMDAwMDAwMDAgUl9SSVNDVl9BTElHTiAg
ICAgKkFCUyorMHgwMDAwMDAwMDAwMDAwMDAyCj4KPiBUaGVzZSBhcmUgdGhlbiByZWplY3RlZCBi
eSBsbGQKPiBsZC5sbGQ6IGVycm9yOiBjYXBhYmlsaXR5LmM6KC5maXh1cCsweDApOiByZWxvY2F0
aW9uIFJfUklTQ1ZfQUxJR04gcmVxdWlyZXMgdW5pbXBsZW1lbnRlZCBsaW5rZXIgcmVsYXhhdGlv
bjsgcmVjb21waWxlIHdpdGggLW1uby1yZWxheCBidXQgdGhlIC5vIGlzIGFscmVhZHkgY29tcGls
ZWQgd2l0aCAtbW5vLXJlbGF4CgpUaGlzIG1lYW5zIC1tbm8tcmVsYXggc2hvdWxkIGVtaXQgLm9w
dGlvbiBub3JlbGF4IGluIHRoZSBhc3NlbWJseS4KSSdsbCB0cnkgZml4aW5nIHRoaXMgaW4gQ2xh
bmcgMTMuCgo+IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Cj4g
Q2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KPiBDYzogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5i
ZXJrZWxleS5lZHU+Cj4gQ2M6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4K
PiBDYzogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+Cj4gLS0tCj4g
IGFyY2gvcmlzY3YvTWFrZWZpbGUgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gv
cmlzY3YvTWFrZWZpbGUKPiBpbmRleCAzZWI5NTkwYTA3NzUuLjUxOWYxMzNlMGQ1MyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+
IEBAIC0zOCw2ICszOCwxNSBAQCBlbHNlCj4gICAgICAgICBLQlVJTERfTERGTEFHUyArPSAtbWVs
ZjMybHJpc2N2Cj4gIGVuZGlmCj4KPiAraWZlcSAoJChMTFZNKSwxKQo+ICsgICAgICAgS0JVSUxE
X0NGTEFHUyArPSAtbW5vLXJlbGF4Cj4gKyAgICAgICBLQlVJTERfQUZMQUdTICs9IC1tbm8tcmVs
YXgKPiAraWZuZXEgKCQoTExWTV9JQVMpLDEpCj4gKyAgICAgICBLQlVJTERfQ0ZMQUdTICs9IC1X
YSwtbW5vLXJlbGF4Cj4gKyAgICAgICBLQlVJTERfQUZMQUdTICs9IC1XYSwtbW5vLXJlbGF4Cj4g
K2VuZGlmCj4gK2VuZGlmCj4gKwo+ICAjIElTQSBzdHJpbmcgc2V0dGluZwo+ICByaXNjdi1tYXJj
aC0kKENPTkZJR19BUkNIX1JWMzJJKSAgICAgICA6PSBydjMyaW1hCj4gIHJpc2N2LW1hcmNoLSQo
Q09ORklHX0FSQ0hfUlY2NEkpICAgICAgIDo9IHJ2NjRpbWEKPiAtLQo+IDIuMzEuMQo+Cj4gLS0K
PiBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRv
IHRoZSBHb29nbGUgR3JvdXBzICJDbGFuZyBCdWlsdCBMaW51eCIgZ3JvdXAuCj4gVG8gdW5zdWJz
Y3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwg
c2VuZCBhbiBlbWFpbCB0byBjbGFuZy1idWlsdC1saW51eCt1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tLgo+IFRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6
Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2NsYW5nLWJ1aWx0LWxpbnV4LzIwMjEwNTE0MjA1
NjQzLjM4MzQyMi0xLXJhai5raGVtJTQwZ21haWwuY29tLgoKCgotLSAK5a6L5pa5552/CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
