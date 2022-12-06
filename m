Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34859C352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 06:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IE7JfLfuPQH/JOo7E2/vhkW8NduKEtYjh+TU7haejMk=; b=LhrXjh4kOxv/Sf
	/W9pmBHaRCM2mS69kLFCIAz0/Lz+qjcEqnvA3v5ucuoJEUvoX4u1HoyBWKtd8GKqskXoLeVOMgj5K
	pdX5NZT1z/X7y9THQ7kaaOg+rCmXzSjQ9t2uCRVc9/mtMpQ98d9IyMCv0yeHV8eDo4ofsFwuBwBt0
	bifUscLuW5b+fkIUgsfPFIYkXYav3NFdINBh2CfFfT1nk0ppzFTjhaiR2bMkoKJbi51MLWfsqdoTF
	i8t3Dz9yQ/JN2vQUqOUMZwd/Bxtpip1a+DqRuku77KBNIjSMXRXjFGCiLXIh1iI/53WzMGOCl2o03
	Ul7WPJTTHPnpag75LwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Rcp-002Qek-GI; Tue, 06 Dec 2022 06:40:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Rcm-002QMb-Ee
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 06:40:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2036C61585
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 06:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F96BC433C1
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 06:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670308812;
	bh=2UPTSFMtC8PZoZckQhAgmrzqubqAbaCbl9+6gXlAzXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lw6Q7X3ze/epTpgAu2+Q6mEV+2cdCKEpQQZcjS99AekVVMdKNg/D8y1heYss+wJMa
	 LeGNevDT/gNl18jeXnG4GuQwPfsVhsAdPcneM6cW2RYyFsLvRJornuoC76AImIJEg5
	 xqQB24g8EBf7grc9kC0N4k73tsaTJa6k5RT+abb6TKi6dLVQSNh99rnt4AEVbwP4jZ
	 PxUlb1W21GkXaz/oBdiTjnd+X+CdobWEPG40kiLxq+rUSUsRBwO1XrW2WS2y80Soqt
	 MDLRpOZx5L8yIfOZsZAk3e0WMqg36B9hQqurHkafyfJ3o/q5Xu9ILOPSM/cGYf5ga1
	 jNZ/OgSOmUAaQ==
Received: by mail-ed1-f46.google.com with SMTP id c66so12635779edf.5
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 22:40:12 -0800 (PST)
X-Gm-Message-State: ANoB5pnj0NpRIrpOG3VCryfIcGnGVoMgd3FAIIiTrBEYd0ZxW5gdnXF8
	7HkMgiLO1Kl04/83I1/nXT9QiO8nGlW7yrZG92g=
X-Google-Smtp-Source: AA0mqf4UiAug0DZSHJ/dNaPXC7jnuJMoHAvmbB4knjFvReiDmDy5hZFcrNclRixVqByAdMOXJcNKQZ5COMaotDSXaTg=
X-Received: by 2002:a05:6402:1117:b0:46b:6da7:e8a9 with SMTP id
 u23-20020a056402111700b0046b6da7e8a9mr28827003edv.401.1670308810687; Mon, 05
 Dec 2022 22:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20221103075047.1634923-1-guoren@kernel.org> <20221103075047.1634923-7-guoren@kernel.org>
 <874jua9lcp.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <874jua9lcp.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Dec 2022 14:39:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRsZMM9vPqRWEwzOOhW2czo8uOJEtTGjixJig1kdQP1hg@mail.gmail.com>
Message-ID: <CAJF2gTRsZMM9vPqRWEwzOOhW2czo8uOJEtTGjixJig1kdQP1hg@mail.gmail.com>
Subject: Re: [PATCH -next V8 06/14] riscv: convert to generic entry
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_224016_630425_391A40AD 
X-CRM114-Status: GOOD (  24.53  )
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

T24gTW9uLCBEZWMgNSwgMjAyMiBhdCA2OjQ5IFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVGhpcyBwYXRjaCBjb252
ZXJ0cyByaXNjdiB0byB1c2UgdGhlIGdlbmVyaWMgZW50cnkgaW5mcmFzdHJ1Y3R1cmUgZnJvbQo+
ID4ga2VybmVsL2VudHJ5LyouIFRoZSBnZW5lcmljIGVudHJ5IG1ha2VzIG1haW50YWluZXJzJyB3
b3JrIGVhc2llciBhbmQKPiA+IGNvZGVzIG1vcmUgZWxlZ2FudC4gSGVyZSBhcmUgdGhlIGNoYW5n
ZXMgdGhhbiBiZWZvcmU6Cj4gPgo+ID4gIC0gTW9yZSBjbGVhciBlbnRyeS5TIHdpdGggaGFuZGxl
X2V4Y2VwdGlvbiBhbmQgcmV0X2Zyb21fZXhjZXB0aW9uCj4gPiAgLSBHZXQgcmlkIG9mIGNvbXBs
ZXggY3VzdG9tIHNpZ25hbCBpbXBsZW1lbnRhdGlvbgo+ID4gIC0gTW9yZSByZWFkYWJsZSBzeXNj
YWxsIHByb2NlZHVyZQo+ID4gIC0gTGl0dGxlIG1vZGlmaWNhdGlvbiBvbiByZXRfZnJvbV9mb3Jr
ICYgcmV0X2Zyb21fa2VybmVsX3RocmVhZAo+ID4gIC0gV3JhcCB3aXRoIGlycWVudHJ5X2VudGVy
L2V4aXQgYW5kIHN5c2NhbGxfZW50ZXIvZXhpdF9mcm9tX3VzZXJfbW9kZQo+ID4gIC0gVXNlIHRo
ZSBzdGFuZGFyZCBwcmVlbXB0aW9uIGNvZGUgaW5zdGVhZCBvZiBjdXN0b20KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IFN1Z2dlc3RlZC1ieTogSHVh
Y2FpIENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9yZz4KPiA+IFRlc3RlZC1ieTogWWlwZW5nIFpv
dSA8em91eWlwZW5nQGh1YXdlaS5jb20+Cj4gPiAtLS0KPgo+IFsuLi5dCj4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19yaXNjdi5jCj4gPiBpbmRleCA1ZDNmMmZiZWIzM2MuLmM4NmQwZWFmZGY2YSAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4gPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfcmlzY3YuYwo+ID4gQEAgLTUsOCArNSwxMCBAQAo+ID4gICAqIENvcHlyaWdo
dCAoQykgMjAxNyBTaUZpdmUKPiA+ICAgKi8KPiA+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2VudHJ5
LWNvbW1vbi5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9zeXNjYWxscy5oPgo+ID4gICNpbmNsdWRl
IDxhc20vdW5pc3RkLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9zeXNjYWxsLmg+Cj4gPiAgI2luY2x1
ZGUgPGFzbS9jYWNoZWZsdXNoLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL21tYW4tY29t
bW9uLmg+Cj4gPgo+ID4gQEAgLTY5LDMgKzcxLDI4IEBAIFNZU0NBTExfREVGSU5FMyhyaXNjdl9m
bHVzaF9pY2FjaGUsIHVpbnRwdHJfdCwgc3RhcnQsIHVpbnRwdHJfdCwgZW5kLAo+ID4KPiA+ICAg
ICAgIHJldHVybiAwOwo+ID4gIH0KPiA+ICsKPiA+ICt0eXBlZGVmIGxvbmcgKCpzeXNjYWxsX3Qp
KHVsb25nLCB1bG9uZywgdWxvbmcsIHVsb25nLCB1bG9uZywgdWxvbmcsIHVsb25nKTsKPiA+ICsK
PiA+ICthc21saW5rYWdlIHZvaWQgZG9fc3lzX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Cj4gPiArewo+ID4gKyAgICAgc3lzY2FsbF90IHN5c2NhbGw7Cj4gPiArICAgICB1bG9uZyBuciA9
IHJlZ3MtPmE3Owo+ID4gKwo+ID4gKyAgICAgcmVncy0+ZXBjICs9IDQ7Cj4gPiArICAgICByZWdz
LT5vcmlnX2EwID0gcmVncy0+YTA7Cj4gPiArICAgICByZWdzLT5hMCA9IC1FTk9TWVM7Cj4gPiAr
Cj4gPiArICAgICBuciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgbnIpOwo+
ID4gKyNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiArICAgICBpZiAoKHJlZ3MtPnN0YXR1cyAmIFNS
X1VYTCkgPT0gU1JfVVhMXzMyKQo+ID4gKyAgICAgICAgICAgICBzeXNjYWxsID0gY29tcGF0X3N5
c19jYWxsX3RhYmxlW25yXTsKPiA+ICsgICAgIGVsc2UKPiA+ICsjZW5kaWYKPiA+ICsgICAgICAg
ICAgICAgc3lzY2FsbCA9IHN5c19jYWxsX3RhYmxlW25yXTsKPiA+ICsKPiA+ICsgICAgIGlmIChu
ciA8IE5SX3N5c2NhbGxzKQo+ID4gKyAgICAgICAgICAgICByZWdzLT5hMCA9IHN5c2NhbGwocmVn
cy0+b3JpZ19hMCwgcmVncy0+YTEsIHJlZ3MtPmEyLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVncy0+YTMsIHJlZ3MtPmE0LCByZWdzLT5hNSwKPiA+ICAgICAgIHJlZ3Mt
PmE2KTsKPgo+IE5vdyB0aGF0IHdlJ3JlIGRvaW5nIHRoZSAicHRfcmVncyB0byBjYWxsIiBkYW5j
ZSwgaXQgd291bGQgbWFrZSBzZW5zZSB0bwo+IGludHJvZHVjZSBhIHN5c2NhbGwgd3JhcHBlciAo
bGlrZSB4ODYgYW5kIGFybTY0KSBmb3IgcmlzY3YsIHNvIHRoYXQgd2UKPiBkb24ndCBuZWVkIHRv
IHVud3JhcCBhbGwgcmVncyBmb3IgYWxsIHN5c2NhbGxzIChTZWUgX19NQVAoKSBpbgo+IGluY2x1
ZGUvbGludXgvc3lzY2FsbHMuaCkuIFRoYXQgd291bGQgYmUgYW4gb3B0aW1pemF0aW9uLCBzbyBp
dCBjb3VsZCBiZQo+IGRvbmUgYXMgYSBmb2xsb3ctdXAsIGFuZCBub3QgcGFydCBvZiB0aGUgc2Vy
aWVzLgpUaHggZm9yIHRoZSByZW1pbmRlcjsgSSB3aWxsIGhhdmUgYSBsb29rIGF0ICJwdF9yZWdz
IHRvIGNhbGwuIgoKPgo+Cj4gQmrDtnJuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
