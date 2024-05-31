Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F545C25B7E
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 04:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvsF8g0upN0OrVP0qVP+//fvEZhZ6VoIxvQmuw0GXS0=; b=0cV9hNs3kppHyx
	oktxBbICJjF7BNAzL/Gp2TZ3g6e0wi4eJzIpi2+BwgKKbSMO3L9hPRBLuyUGM+MWsRgTX6uySXsv4
	x+gdB/8zKxR0W40bDpgvh3AcvgO4gY+oTVeMCp1g96ZKBi3m4kJ1Yzhv9EecUIAq35/QMMdD1Kgn6
	6sadI0or3HrJJRrJVF/HrbjbRPvGAnvLXILjVs0RamwEB6LdVk7rMseTwcvAJ58yPhTwD20sqeitv
	t2Gq43H9KZ9WkUAw4vvk82qXqC5GPBnS8/2NrY+zML2zZzf5UO92XPYYLjmaZqkrQjO77hKXnuhre
	BIr80N0JqFeGs67Jmo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCtyH-00000009Cjz-08dY;
	Fri, 31 May 2024 04:34:29 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCtyD-00000009Chf-1PCP
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 04:34:27 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7e833061c74so74169839f.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 21:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717130061; x=1717734861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aojvCCZI7oDG8nQF+lVjR38DWbQN1/i4Dj6O/Uiios=;
        b=ZYoZeP4AyGYT18DGgjA4b76kRhs5JJmrBunOvdJOgyn1X9iyd+9YpHZ6Q3sULuWQ2K
         yNfkSSqhLeSrG/mWgg97XHbY2vSwD38ZO2ZPWQFs0nZ7p1SQKO9ryu1SCnPqWBRwR0q2
         IIooaocixE0TGdX0K/PGRQspNCXFhUisuk0Nb5JJ7tGvA2YWHpsIXOV3QmQdOTHdCXhX
         AYdW3nYBKMY6GGY/3EZCHDu/yeSobIcStfJaWSZPJp+5kExY9KRIChtMMvVZv/eRRkkS
         EVaRhUf3IW1/8g6xkgkgBRA8LY6JIolwtylsXHrwOujmlhZkmjNEt2pG+mlJ0PsZWxfG
         O4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717130061; x=1717734861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aojvCCZI7oDG8nQF+lVjR38DWbQN1/i4Dj6O/Uiios=;
        b=dLdnvdwLd9hSn2URCMj8gpPxL3mw6SwXIZlTjOn33PtoAii+dLL2iBUoPwax//qbrz
         GlozpRdoqx00iCHWiJ6xJvW1oosGF82zlRlPLR88GiCiFs5YOa6eCRjN09e0T2Jld6Zz
         0q2O0YsHOF028aX3XKJ7niqVt5oMy/YRbHq5lAU762fEYHt7of8kMaU04GBCixJZOocn
         nqDbUohkGlbrQ0CrN1Vw+kfS5TChuohOFvWKRsXRAIRl6I9a4PC7GXyjNwKs1ZQvAycm
         snBLzSEOGzvQl9LeJtojX0EMr9Td/IrI5l/Tw/g6c+mfkdLEkrvG7duPYnTpdg093P+P
         GjFA==
X-Gm-Message-State: AOJu0YxcpSXoRQt5ZcMjj2YW9xnyuFQ7VQNsgvSHDHGgKIVX9qFJjoq7
	LGdfWAsbAsTRiCdEn1vlBhtMgnkXYAs/mfcPBg4FJxBX7+OOdxWltLceqGOR4UgBA6nXz1FvyV8
	9y5lOKTGZJoL9gTEyV8iinKdjiOk4fvhxdlrxQw==
X-Google-Smtp-Source: AGHT+IFumUwOVBhqm9jSSegtfTbBsWrL7+wRv2hHDnozjQHdKdEmqi3s7UpbRv2rHVzdr2XDkO13liv49fwxH13T3Ws=
X-Received: by 2002:a05:6602:3425:b0:7de:c59f:2151 with SMTP id
 ca18e2360f4ac-7eaffe71e50mr101316239f.3.1717130060742; Thu, 30 May 2024
 21:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240415064905.25184-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240415064905.25184-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 May 2024 10:04:09 +0530
Message-ID: <CAAhSdy0STe67n6TB2ZH1OYZCTQ+yPycmsQ+8Ay0KsorwVYEo6w@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: KVM: No need to use mask when hart-index-bit
 is 0
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_213425_830540_7E941054 
X-CRM114-Status: GOOD (  19.10  )
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

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMTI6MTnigK9QTSBZb25nLVh1YW4gV2FuZwo8eW9uZ3h1
YW4ud2FuZ0BzaWZpdmUuY29tPiB3cm90ZToKPgo+IFdoZW4gdGhlIG1heGltdW0gaGFydCBudW1i
ZXIgd2l0aGluIGdyb3VwcyBpcyAxLCBoYXJ0LWluZGV4LWJpdCBpcyBzZXQgdG8KPiAwLiBDb25z
ZXF1ZW50bHksIHRoZXJlIGlzIG5vIG5lZWQgdG8gcmVzdG9yZSB0aGUgaGFydCBJRCBmcm9tIElN
U0lDCj4gYWRkcmVzc2VzIGFuZCBoYXJ0LWluZGV4LWJpdCBzZXR0aW5ncy4gQ3VycmVudGx5LCBR
RU1VIGFuZCBrdm10b29sIGRvIG5vdAo+IHBhc3MgY29ycmVjdCBoYXJ0LWluZGV4LWJpdCB2YWx1
ZXMgd2hlbiB0aGUgbWF4aW11bSBoYXJ0IG51bWJlciBpcyBhCj4gcG93ZXIgb2YgMiwgdGhlcmVi
eSBhdm9pZGluZyB0aGlzIGlzc3VlLiBDb3JyZXNwb25kaW5nIHBhdGNoZXMgZm9yIFFFTVUKPiBh
bmQga3ZtdG9vbCB3aWxsIGFsc28gYmUgZGlzcGF0Y2hlZC4KPgo+IEZpeGVzOiA4OWQwMTMwNmUz
NGQgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IGRldmljZSBpbnRlcmZhY2UgZm9yIEFJQSBpcnFj
aGlwIikKPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZp
dmUuY29tPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTAtcmNYIGZpeGVzLgoKVGhh
bmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgfCA3ICsrKyst
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgYi9hcmNoL3Jpc2N2L2t2
bS9haWFfZGV2aWNlLmMKPiBpbmRleCAwZWI2ODkzNTFiN2QuLjVjZDQwN2M2YThlNCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS9haWFfZGV2aWNlLmMKPiBAQCAtMjM3LDEwICsyMzcsMTEgQEAgc3RhdGljIGdwYV90IGFpYV9p
bXNpY19wcG4oc3RydWN0IGt2bV9haWEgKmFpYSwgZ3BhX3QgYWRkcikKPgo+ICBzdGF0aWMgdTMy
IGFpYV9pbXNpY19oYXJ0X2luZGV4KHN0cnVjdCBrdm1fYWlhICphaWEsIGdwYV90IGFkZHIpCj4g
IHsKPiAtICAgICAgIHUzMiBoYXJ0LCBncm91cCA9IDA7Cj4gKyAgICAgICB1MzIgaGFydCA9IDAs
IGdyb3VwID0gMDsKPgo+IC0gICAgICAgaGFydCA9IChhZGRyID4+IChhaWEtPm5yX2d1ZXN0X2Jp
dHMgKyBJTVNJQ19NTUlPX1BBR0VfU0hJRlQpKSAmCj4gLSAgICAgICAgICAgICAgIEdFTk1BU0tf
VUxMKGFpYS0+bnJfaGFydF9iaXRzIC0gMSwgMCk7Cj4gKyAgICAgICBpZiAoYWlhLT5ucl9oYXJ0
X2JpdHMpCj4gKyAgICAgICAgICAgICAgIGhhcnQgPSAoYWRkciA+PiAoYWlhLT5ucl9ndWVzdF9i
aXRzICsgSU1TSUNfTU1JT19QQUdFX1NISUZUKSkgJgo+ICsgICAgICAgICAgICAgICAgICAgICAg
R0VOTUFTS19VTEwoYWlhLT5ucl9oYXJ0X2JpdHMgLSAxLCAwKTsKPiAgICAgICAgIGlmIChhaWEt
Pm5yX2dyb3VwX2JpdHMpCj4gICAgICAgICAgICAgICAgIGdyb3VwID0gKGFkZHIgPj4gYWlhLT5u
cl9ncm91cF9zaGlmdCkgJgo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdFTk1BU0tfVUxMKGFp
YS0+bnJfZ3JvdXBfYml0cyAtIDEsIDApOwo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
