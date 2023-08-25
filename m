Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD2C3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 05:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSCB9jQ8LW4DfMHuOZM2BSaocv/OcWz/p3NVwTVbOKQ=; b=thlOrSDxvrEq92
	HNt+61rcC0NyI71duVnrDjEnWw44UnKh6YUZUCKS8VPZ83qNcEYDtZ1jxxgKDQIv9ZaqxXKMgS1m1
	RZhD2psEoeMObkEXFtbzT47HgtWnWJaWXcBJ2Pi0zRvMoz8VmfJB6yG8B1C9zeIIFWxb9roGb23DD
	dan66cHp4JYkYLVKvuoC22EyF94mwDhabZJVY64WEsobg/8LiX0vkGsKJ6FA5/SgcPtiCgGFTVAmn
	ghmAusghvEWB18tSrckcgqZ6YkP8ScBaFpfTKcTH5Z4Ei3h8cSg4ugJSWOYghjvfIXJBDB+4XXztA
	FhXvADa5nshqQfaSdO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZPaY-004ONr-0o;
	Fri, 25 Aug 2023 05:42:30 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZPaV-004OMz-1v
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 05:42:29 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5733bcf6eb6so358721eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 22:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692942145; x=1693546945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46o2vqzFPDatSdHHNgzmWzwxYNKn1sS6WAkkKsDp+P8=;
        b=iSDdxw5l8aoqBZJ4nD6SokRw3rT8X3hGggDXOyna2TIlR6C3uHvECy+sCU87a3rwc+
         IekTKTZk23NeVMWedddmN5w2OjuY4kTL/ugWIiXLM2fdeVnLwtY+pXxMbttlXg11SxUP
         TNvJvSUouzkMrNzRf/j34oNAWOJi9l3lyxUHHpNpQUgIsGCeXXmKS6DijRhAQeYUwFPW
         LIdqHsJdkTbu98jUlzLq8k7+wKPvxdlWE4gQAUw2ikoCbXQIeMGkcyeOKnT8cDW58YF5
         HIulo0JBXv4bLd6IH7cXuP69yQZ1xhT+9WxIGetXjIGhMkc7UI/9MIoFNI69FtOHW1O4
         f2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692942145; x=1693546945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46o2vqzFPDatSdHHNgzmWzwxYNKn1sS6WAkkKsDp+P8=;
        b=H4wn92goL464CfiVspMuDigQEHm5xS3eGqKdI2mNqQuzGkUzmIb64ts9s4Y8BcBSyg
         Dp/CVON+E2xD4vhMEBvlPFOzdWjgKJ2vjS8/9HJC004vnECHgb9M0m2vRr10Q+Cdd7Dn
         L+XFseGDK7aTQG3YwM+0G917W0QokC1u2FxrtMVaaReae1GA149lqJuvDmuhwG83SNax
         Ce/SkS64wu5fV7meI9dlb35SfTN4sQXP1gKXhZZN6KOmnj3bz2Srli3Fp4Njw1E1stom
         vRwlF7Q7ZOzR95SgAVeswBQYSSBcbP83JoS0zPN0Eg5AnV3C+Ard7C4x26sidLyx8Qem
         EUJQ==
X-Gm-Message-State: AOJu0YwortHnWIfuNfVEMyHhMdqZAp4bbeIGIErP7WnlYe8X0IJZhdWU
	yvPKVJYW4QcoKeKCiyv/rJ0XHvfwnPOaNt3GFqdyTw==
X-Google-Smtp-Source: AGHT+IGjjgqLBVEzKJWPplZ0yLZ67zAtldLS8M5GU6WX96OgKZs21aUbBltUW9QWJCntrD6UtrYTNSbrXXrJm5D3SsU=
X-Received: by 2002:a4a:919c:0:b0:572:b659:a236 with SMTP id
 d28-20020a4a919c000000b00572b659a236mr3903937ooh.6.1692942144830; Thu, 24 Aug
 2023 22:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230129064956.143664-1-tjytimi@163.com>
In-Reply-To: <20230129064956.143664-1-tjytimi@163.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 25 Aug 2023 13:42:13 +0800
Message-ID: <CAMWQL2gBj84qhBopi=YKmHaUose2ggALKtOWqb6adDiuvS5xcg@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: support arch_has_hw_pte_young()
To: Jinyu Tang <tjytimi@163.com>
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	yuzhao@google.com, conor.dooley@microchip.com, ajones@ventanamicro.com, 
	guoren@kernel.org, tongtiangen@huawei.com, anup@brainfault.org, 
	akpm@linux-foundation.org, falcon@tinylab.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Greentime Hu <greentime.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_224227_688217_8B09CC79 
X-CRM114-Status: GOOD (  24.78  )
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

SGkgSmlueXUsCgpJdCBzZWVtcyBsaWtlIGl0IGhhcyBiZWVuIGEgd2hpbGUgc2luY2UgdGhlIGxh
c3QgcmVsZWFzZSBvZiB0aGlzIHBhdGNoLiBEbwp5b3UgaGF2ZSBhbnkgcGxhbnMgZm9yIHRoZSBw
YXRjaCByZWNlbnRseT8gT3IsIGRvIHlvdSBtaW5kIHNoYXJpbmcgYW55CmludGVybmFsIHByb2dy
ZXNzIG9uIHRoZSBwYXRjaD8KCldlIGFyZSBzdGFydGluZyB0byB3b3JrIG9uIHRoZSBTdmFkdSBl
eHRlbnNpb24gb2YgcHRlIEEvRCBiaXQgZmVhdHVyZSBvbgpMaW51eC4gRG8geW91IGZpbmQgYW55
IHBsYWNlcyB3aGVyZSB3ZSBtYXkgcG90ZW50aWFsbHkgd29yayB0b2dldGhlciB0bwpnZXQgdGhp
bmdzIG1vdmluZz8gQWxzbywgSSBhbSB3aWxsaW5nIHRvIGJhc2Ugb24gdG9wIG9mIHlvdXIgd29y
ayBhbmQKY29udGludWUgc2VuZGluZyB0aGUgc2VyaWVzIChieSBrZWVwaW5nIGFsbCB0aGUgY3Jl
ZGl0cyBmcm9tIHRoZSBvcmlnaW5hbAp3b3JrKQoKUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBo
YXZlIGFueSB0aG91Z2h0cywgdGhhbmtzIDopCgpSZWdhcmRzLApZb25nLVh1YW4KCk9uIFN1biwg
SmFuIDI5LCAyMDIzIGF0IDI6NTPigK9QTSBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+IHdy
b3RlOgo+Cj4gVGhlIGFyY2hfaGFzX2h3X3B0ZV95b3VuZygpIGlzIGZhbHNlIGZvciByaXNjdiBi
eSBkZWZhdWx0LiBJZiBpdCdzCj4gZmFsc2UsIHBhZ2UgdGFibGUgd2FsayBpcyBhbG1vc3Qgc2tp
cHBlZCBmb3IgTUdMUlUgcmVjbGFpbS4gQW5kIGl0Cj4gd2lsbCBhbHNvIGNhdXNlIHVzZWxlc3Mg
c3RlcCBpbiBfX3dwX3BhZ2VfY29weV91c2VyKCkuCj4KPiBSSVNDLVYgUHJpdmlsZWdlZCBCb29r
IHNheXMgdGhhdCByaXNjdiBoYXZlIHR3byBzY2hlbWVzIHRvIG1hbmFnZSBBCj4gYW5kIEQgYml0
Lgo+Cj4gU28gYWRkIGEgY29uZmlnIGZvciBzZWxlY3RpbmcsIHRoZSBkZWZhdWx0IGlzIHRydWUu
IEZvciBzaW1wbGUKPiBpbXBsZW1lbnRhdGlvbiByaXNjdiBDUFUgd2hpY2gganVzdCBnZW5lcmF0
ZSBwYWdlIGZhdWx0LCB1bnNlbGVjdCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEppbnl1IFRhbmcg
PHRqeXRpbWlAMTYzLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAg
ICAgfCAxMCArKysrKysrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwg
IDcgKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBl
MmI2NTYwNDNhYmYuLjE3YzgyODg1NTQ5YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25m
aWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtMTgwLDYgKzE4MCwxNiBAQCBjb25m
aWcgUEFHRV9PRkZTRVQKPiAgICAgICAgIGRlZmF1bHQgMHg4MDAwMDAwMCBpZiA2NEJJVCAmJiAh
TU1VCj4gICAgICAgICBkZWZhdWx0IDB4ZmY2MDAwMDAwMDAwMDAwMCBpZiA2NEJJVAo+Cj4gK2Nv
bmZpZyBBUkNIX0hBU19IQVJEV0FSRV9QVEVfWU9VTkcKPiArICAgICAgIGJvb2wgIkhhcmR3YXJl
IFNldCBQVEUgQWNjZXNzIEJpdCIKPiArICAgICAgIGRlZmF1bHQgeQo+ICsgICAgICAgaGVscAo+
ICsgICAgICAgICBTZWxlY3QgaWYgaGFyZHdhcmUgc2V0IEEgYml0IHdoZW4gUFRFIGlzIGFjY2Vz
c2VkLiBUaGUgZGVmYXVsdCBpcwo+ICsgICAgICAgICAnWScsIGJlY2F1c2UgbW9zdCBSSVNDLVYg
Q1BVIGhhcmR3YXJlIGNhbiBtYW5hZ2UgQSBhbmQgRCBiaXQuCj4gKyAgICAgICAgIEJ1dCBSSVND
LVYgbWF5IGhhdmUgc2ltcGxlIGltcGxlbWVudGF0aW9uIHRoYXQgZG8gbm90IHN1cHBvcnQKPiAr
ICAgICAgICAgaGFyZHdhcmUgc2V0IEEgYml0IGJ1dCBvbmx5IGdlbmVyYXRlIHBhZ2UgZmF1bHQs
IGZvciB0aGF0IGNhc2UganVzdAo+ICsgICAgICAgICB1bnNlbGVjdCBpdC4KPiArCj4gIGNvbmZp
ZyBLQVNBTl9TSEFET1dfT0ZGU0VUCj4gICAgICAgICBoZXgKPiAgICAgICAgIGRlcGVuZHMgb24g
S0FTQU5fR0VORVJJQwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggNGViYTlhOThk
MGUzLi4xZGI1NGFiNGUxYmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC01
MzIsNiArNTMyLDEzIEBAIHN0YXRpYyBpbmxpbmUgaW50IHB0ZXBfY2xlYXJfZmx1c2hfeW91bmco
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gICAgICAgICAgKi8KPiAgICAgICAgIHJldHVy
biBwdGVwX3Rlc3RfYW5kX2NsZWFyX3lvdW5nKHZtYSwgYWRkcmVzcywgcHRlcCk7Cj4gIH0KPiAr
I2lmZGVmIENPTkZJR19BUkNIX0hBU19IQVJEV0FSRV9QVEVfWU9VTkcKPiArI2RlZmluZSBhcmNo
X2hhc19od19wdGVfeW91bmcgYXJjaF9oYXNfaHdfcHRlX3lvdW5nCj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBhcmNoX2hhc19od19wdGVfeW91bmcodm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJuIHRy
dWU7Cj4gK30KPiArI2VuZGlmCj4KPiAgI2RlZmluZSBwZ3Byb3Rfbm9uY2FjaGVkIHBncHJvdF9u
b25jYWNoZWQKPiAgc3RhdGljIGlubGluZSBwZ3Byb3RfdCBwZ3Byb3Rfbm9uY2FjaGVkKHBncHJv
dF90IF9wcm90KQo+IC0tCj4gMi4zMC4yCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
