Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C14CD37B4
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4JFwqSL+DsTUSkSbxyhVJHfdlFv7mgHFPFDDXvqDfo=; b=EtwomIftvmaW4d
	4rBVSlI3D0ElNnDgDoZ61LW1U1bXBSzdrbcoR/KFt9FwJOJ66jycBbzRyyjJAr06NHuIFWUR6prA3
	fyHRuiGrCrqkah8YBsaxAoTq6VvPa2fNHLybF2xcJr3MteRRnkUzwepeUMZCSOnvK449qZPpK3iD1
	HMTpO7S8XAT8zdJkGKfgrfv+6EncJ4TXXiSQYZUttn7Hi6SKCnrpEWmmO/ocZFYjVivAL8PnUUQT6
	vPMfynSjTYqAxPmu2RC/8KzRcopvJtsLbDtf4LvjhCsg2x6EUEsktVgS3mKUvJs9LW/Zady2gNFLO
	4gZc3IvzmRHuLc3Ao0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtJM-00DkeH-1b;
	Sun, 17 Sep 2023 15:03:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtJK-00DkdV-0J
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 15:03:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B77A60B9F
	for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 15:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1ED0C433AD
	for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694963023;
	bh=U6gzi/H/haf5kt9PcJpUWoeEHC4CJCR4lpWm4En9f7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S0xWtcZWnba4obYh0068sGQ66IWZl2fmtLZZp1wFW8zqcsewLJ02o6ZqG3rN6PbjO
	 2pM1q0qL4IUFA9QBU70CxqrSkEjWGZgXpURffMhww1TyJTczuSxZIWbpERxhpgHIlY
	 WKeS+apsTJD6Sybvg8ZzrbRGXy9JyAYiBtTppF9w7mqX7+H0EWzEQm22wd2rd/+Ucw
	 aGMMfNb5hpUGbyJhJ9k+/8XamAb4FJYnP1nhEUGtFxnnk6S+DuWa5l5Pg5obCSvJpO
	 aKothsGzx8U+7zKcIfROtXAfwfYJRx5LV3eFxsXfBsrhoZilNgXeKvztNlJCOtkSvA
	 YWLQ+NJS175wg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9adcb89b48bso289566366b.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 08:03:43 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx+f9TLZMhFnobqhZ45nj9GKr/x2PchjgUP9ZAlwnn/61sIzKLL
	q/4X7ALtd4zaJIAJrEXXomWDrTKmsbdxrTc6/5s=
X-Google-Smtp-Source: AGHT+IGC2NhuzaJiU15MVNfQzo+WjISHQF1PH5bt2TC3OQQ17M0SeWPf6Cv0qt75lmZG9MWNIHP06ql/70uxG80Bm1A=
X-Received: by 2002:a17:906:196:b0:9a1:be5b:f499 with SMTP id
 22-20020a170906019600b009a1be5bf499mr5650894ejb.24.1694963022087; Sun, 17 Sep
 2023 08:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-13-guoren@kernel.org>
 <ZQP0EJc4ClA-iT6J@redhat.com>
In-Reply-To: <ZQP0EJc4ClA-iT6J@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 17 Sep 2023 23:03:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQMNu7PXf3JT-nZt1+jp6osqERUvnvEexjK+Ak=ahxcUA@mail.gmail.com>
Message-ID: <CAJF2gTQMNu7PXf3JT-nZt1+jp6osqERUvnvEexjK+Ak=ahxcUA@mail.gmail.com>
Subject: Re: [PATCH V11 12/17] RISC-V: paravirt: pvqspinlock: Add nopvspin
 kernel parameter
To: Leonardo Bras <leobras@redhat.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_080346_215693_B6DFEADE 
X-CRM114-Status: GOOD (  22.72  )
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

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMjowNeKAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIFNlcCAxMCwgMjAyMyBhdCAwNDoyOTowNkFN
IC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBEaXNhYmxlcyB0aGUgcXNwaW5sb2NrIHNsb3cg
cGF0aCB1c2luZyBQViBvcHRpbWl6YXRpb25zIHdoaWNoCj4gPiBhbGxvdyB0aGUgaHlwZXJ2aXNv
ciB0byAnaWRsZScgdGhlIGd1ZXN0IG9uIGxvY2sgY29udGVudGlvbi4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IHwgIDIgKy0KPiA+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9xc3BpbmxvY2tfcGFyYXZpcnQuYyAgICAgICAgICB8IDEzICsrKysrKysrKysr
KysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFy
YW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJz
LnR4dAo+ID4gaW5kZXggZjc1YmVkYzUwZTAwLi5lNzRhZWQ2MzE1NzMgMTAwNjQ0Cj4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiA+IEBA
IC0zODU3LDcgKzM4NTcsNyBAQAo+ID4gICAgICAgICAgICAgICAgICAgICAgIGFzIGdlbmVyaWMg
Z3Vlc3Qgd2l0aCBubyBQViBkcml2ZXJzLiBDdXJyZW50bHkgc3VwcG9ydAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIFhFTiBIVk0sIEtWTSwgSFlQRVJfViBhbmQgVk1XQVJFIGd1ZXN0Lgo+ID4K
PiA+IC0gICAgIG5vcHZzcGluICAgICAgICBbWDg2LFhFTixLVk1dCj4gPiArICAgICBub3B2c3Bp
biAgICAgICAgW1g4NixYRU4sS1ZNLFJJU0MtVl0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBE
aXNhYmxlcyB0aGUgcXNwaW5sb2NrIHNsb3cgcGF0aCB1c2luZyBQViBvcHRpbWl6YXRpb25zCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgd2hpY2ggYWxsb3cgdGhlIGh5cGVydmlzb3IgdG8gJ2lk
bGUnIHRoZSBndWVzdCBvbiBsb2NrCj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29udGVudGlv
bi4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9xc3BpbmxvY2tfcGFyYXZpcnQu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3FzcGlubG9ja19wYXJhdmlydC5jCj4gPiBpbmRleCA4NWZm
NWEzZWMyMzQuLmEwYWQ0NjU3ZjQzNyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3FzcGlubG9ja19wYXJhdmlydC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9xc3Bpbmxv
Y2tfcGFyYXZpcnQuYwo+ID4gQEAgLTQxLDggKzQxLDIxIEBAIEVYUE9SVF9TVEFUSUNfQ0FMTChw
dl9xdWV1ZWRfc3Bpbl9sb2NrX3Nsb3dwYXRoKTsKPiA+ICBERUZJTkVfU1RBVElDX0NBTEwocHZf
cXVldWVkX3NwaW5fdW5sb2NrLCBuYXRpdmVfcXVldWVkX3NwaW5fdW5sb2NrKTsKPiA+ICBFWFBP
UlRfU1RBVElDX0NBTEwocHZfcXVldWVkX3NwaW5fdW5sb2NrKTsKPiA+Cj4gPiArc3RhdGljIGJv
b2wgbm9wdnNwaW47Cj4KPiBJdCBpcyBvbmx5IHVzZWQgaW4gaW5pdCwgc28gaXQgbWFrZXMgc2Vu
c2UgdG8gYWRkIF9faW5pdGRhdGEuCj4KPiBzdGF0aWMgYm9vbCBub3B2c3BpbiBfX2luaXRkYXRh
OwpPa2F5LgoKPgo+IE90aGVyIHRoYW4gdGhhdCwgTEdUTToKPiBSZXZpZXdlZC1ieTogTGVvbmFy
ZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPgo+Cj4gVGhhbmtzIQo+IExlbwo+Cj4gPiArc3Rh
dGljIF9faW5pdCBpbnQgcGFyc2Vfbm9wdnNwaW4oY2hhciAqYXJnKQo+ID4gK3sKPiA+ICsgICAg
ICAgbm9wdnNwaW4gPSB0cnVlOwo+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArZWFy
bHlfcGFyYW0oIm5vcHZzcGluIiwgcGFyc2Vfbm9wdnNwaW4pOwo+ID4gKwo+ID4gIHZvaWQgX19p
bml0IHB2X3FzcGlubG9ja19pbml0KHZvaWQpCj4gPiAgewo+ID4gKyAgICAgaWYgKG5vcHZzcGlu
KSB7Cj4gPiArICAgICAgICAgICAgIHByX2luZm8oIlBWIHFzcGlubG9ja3MgZGlzYWJsZWRcbiIp
Owo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICBp
ZiAobnVtX3Bvc3NpYmxlX2NwdXMoKSA9PSAxKQo+ID4gICAgICAgICAgICAgICByZXR1cm47Cj4g
Pgo+ID4gLS0KPiA+IDIuMzYuMQo+ID4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
