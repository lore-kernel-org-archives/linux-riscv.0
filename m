Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67201E70703
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3bmFZQ7f8/6NyaG8kFxggLhuDOu2QPMQxVfOTix6Wo=; b=Prp6T6HUSJl23p
	dL2WV7fplnsEvcPFYbewfbNo08fsFS7Lh6+LcyODT5TdkJ4hJzIOKulFTwWFDIo1wpgO0WpB2nBMi
	GHOMhfSW/hmhnBBRcwt+iw1fkzLk1l3DHEgnIwi19egg2bktUszqaLUddxTzAlwrOvGcteNJw+A33
	C69/k+LMTq8PsBmJmK87MaXUw+h+x2rw2xfNLHPUNZwrzIY4dlE0VVIW2tEHVAdFrIwf9fun6+zh7
	r6DmxIW72o5trCCKM9MS54vv/SvKKoHUU0sJwk0c/7kC9y7Lk4/9dz85YCIuT217Pn/e9kAoT1BTj
	mjEUbxFg6Ye5YxxGKOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGQQ-005dvp-2m;
	Thu, 21 Sep 2023 09:56:46 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGQN-005duu-24
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 09:56:45 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-65649c60858so4079656d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695290198; x=1695894998; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5aeL1m05j80e9oN+xLZ02mKk3/iGVLqCptcDUWIcms=;
        b=fMPdcC5oU0esg6J8XuB3G1wL3fIfIO0+UYPnWL0siwFPkZ0U2s+Eor/bSdYc8FyGxv
         2Fq9KGEFdphzjiJgED+XXBOzi76qqa14yc1LX2OH0BRx3ZpH/XsKLyAdoaNViOHZumiU
         lcJ7BscvqsL+yVcO7c+oHRC7ZbXO5YqcXw30W/zCzkMe9gyv2YrgppQYroLs3VrkmhKi
         TZufhL7q0SytFGa8pv99JsqgqrGUOPPcJjtPW/N9c+lk2bTYRoSM4Xxl/UkR0LhCCfXj
         RC2TFPtW8WvB10dubpchfzPD2CktiGQTIMF6HYw5awRdqe+p94L3oB6ZSK7pU3UdRPiD
         bxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695290198; x=1695894998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5aeL1m05j80e9oN+xLZ02mKk3/iGVLqCptcDUWIcms=;
        b=rpasr/h0vpaCSH7Z5rqM/mUNqjW9wkyY/vRJmsWns0YgzmqGcBSOmc5M+7MO/JcQF1
         oFHNkoIlKjnztiqzQHzhyd+ZiKkk+hBhESidNzN6gYdoeB63AKQ9oPqH5KI25HQ6ynsR
         pGdrwRjK3mNLO0KE4HAEtZXEPq8UBq1t9uORzX7g5KVOQR7SnuCVGUUlm9dkmhStOYRG
         V+aFvDPARD1r3O69fbPF8iUP9LsmFD4/miUrzI0+HQQ+KLS27Es51yhNysCDSwAehzlc
         E4JjgVzzxAMLHtchq7fVoudZWNHaNGcUCDHmOSNaxyA687MSDprqo3sr603Y+ryCxeIp
         yMBg==
X-Gm-Message-State: AOJu0YymNNaatEV1H8t/lMv6c0hjUfoDVQyAZt3uivpI9K5vHwqa6pjh
	tFaxs2J6ZsUkXjZYA46ep56TGVGBtH5oR8qHa90=
X-Google-Smtp-Source: AGHT+IFjNuOaLnHZLJ3fR+xF1yRtMBP8O4XMFMdJeKXbl6vddyCODioXw7GjWdGHIclBjkNV6I63+h/UTPRHiQtPx5g=
X-Received: by 2002:ad4:41ca:0:b0:64f:4e64:5962 with SMTP id
 a10-20020ad441ca000000b0064f4e645962mr5569416qvq.31.1695290198622; Thu, 21
 Sep 2023 02:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <ffe6a61a8879232aea7b86ff8aee5d681c6bd287.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-financial-declared-7b4b4baae517@wendy>
In-Reply-To: <20230920-financial-declared-7b4b4baae517@wendy>
From: Chen Wang <unicornxw@gmail.com>
Date: Thu, 21 Sep 2023 17:56:28 +0800
Message-ID: <CAHAQgRBmUtyz-U+1Fu9qdvyhMuSzg+o4MMbTV9duUXsoSoPqUQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] riscv: dts: add initial SOPHGO SG2042 SoC device tree
To: Conor Dooley <conor.dooley@microchip.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>, 
	Inochi Amaoto <inochiama@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_025643_683659_91CFF725 
X-CRM114-Status: GOOD (  30.06  )
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

UmVnYXJkcywKCnVuaWNvcm54CgpDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPiDkuo4yMDIz5bm0OeaciDIw5pel5ZGo5LiJIDE2OjU45YaZ6YGT77yaCj4KPiBZbywKPgo+
IE9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0IDAyOjQwOjMyUE0gKzA4MDAsIENoZW4gV2FuZyB3cm90
ZToKPiA+IE1pbGstViBQaW9uZWVyIG1vdGhlcmJvYXJkIGlzIHBvd2VyZWQgYnkgU09QSE9OJ3Mg
U0cyMDQyLgo+ID4KPiA+IFNHMjA0MiBpcyBzZXJ2ZXIgZ3JhZGUgY2hpcCB3aXRoIGhpZ2ggcGVy
Zm9ybWFuY2UsIGxvdyBwb3dlcgo+ID4gY29uc3VtcHRpb24gYW5kIGhpZ2ggZGF0YSB0aHJvdWdo
cHV0Lgo+ID4gS2V5IGZlYXR1cmVzOgo+ID4gLSA2NCBSSVNDLVYgY3B1IGNvcmVzIHdoaWNoIGlt
cGxlbWVudHMgSU1BRkRDCj4KPiBUaGF0J3Mgbm90IHF1aXRlIHRydWUgdGhvdWdoLCBpcyBpdD8K
ClRoZSBjcHUgY29yZXMgb2YgU0cyMDQyIGlzIGM5MDIgZnJvbSBULUhFQUQsIGl0IHN1cHBvcnRz
IHZlY3RvciwgYnV0Cml0J3MgdjAuNywgbm90IG9mZmljaWFsIHYxLjAuIElmIHdlIGRlY2xhcmUg
aXQgYXMgc3VwcG9ydGluZwp2LWV4dGVuc2lvbiwgdGhlIGxhdGVzdCBrZXJuZWwoc2luY2UgNi41
KSB3aWxsIGlzc3VlIHJ2djEuMAppbnN0cnVjdGlvbnMgZHVyaW5nIGJvb3RpbmcgYW5kIG1ha2Ug
YzkwMiBjcmFzaC4gU28gd2UgaGF2ZSB0byByZW1vdmUKInYiIGZyb20gdGhlIGNhcGFiaWxpdHkg
b2YgSVNBIHRvIHBhc3MgdGhlIGJvb3Rpbmcgb2YgbWFjaGluZS4gWW91IGNhbgpjaGVjayB0aGUg
InJpc2N2LGlzYSA9ICJydjY0aW1hZmRjIjsiIGluIERUUy4KCj4KPiA+IC0gNCBjb3JlcyBwZXIg
Y2x1c3RlciwgMTYgY2x1c3RlcnMgb24gY2hpcAo+ID4gLSAuLi4uLi4KPgo+IFdoYXQncyBhICIu
Li4uLiI/IDspCkkganVzdCBjaXRlZCBhIGRlc2NyaXB0aW9uIGZyb20gVFJNIG9mIFNHMjA0MiBh
bmQgaXQgbG9va3MgdG9vIGxvbmcuIEkKd2lsbCBnaXZlIGEgYmV0dGVyIGRlc2NyaXB0aW9uIGhl
cmUgYW5kIGF2b2lkIHVzaW5nICIuLi4uLi4iIGluIHRoZQpuZXh0IHJldmlzaW9uLgoKPgo+ID4K
PiA+IE1vcmUgaW5mbyBpcyBhdmFpbGFibGUgYXQgWzFdLgo+ID4KPiA+IFsxXTogaHR0cHM6Ly9l
bi5zb3BoZ28uY29tL3Byb2R1Y3QvaW50cm9kdWNlL3NnMjA0Mi5odG1sCj4KPiBMaW5rOiBwbGVh
c2UuCj4KPiA+IEN1cnJlbnRseSBvbmx5IHN1cHBvcnQgYm9vdGluZyBpbnRvIGNvbnNvbGUgd2l0
aCBvbmx5IHVhcnQsCj4gPiBvdGhlciBmZWF0dXJlcyB3aWxsIGJlIGFkZGVkIHNvb24gbGF0ZXIu
Cj4gPgo+ID4gQWNrZWQtYnk6IFhpYW9ndWFuZyBYaW5nIDx4aWFvZ3VhbmcueGluZ0Bzb3BoZ28u
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWGlhb2d1YW5nIFhpbmcgPHhpYW9ndWFuZy54aW5nQHNv
cGhnby5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0
bG9vay5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5y
ZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2Fu
ZyA8d2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbj4KPgo+IFRoZXJlIGFyZSA0IHNpZ24tb2ZmcyBoZXJl
LiBTdXJlbHkgc29tZSBvZiB0aGVzZSBzaG91bGQgYmUKPiBjby1kZXZlbG9wZWQtYnlzPwo+Cj4g
PiArICAgICAgICAgICAgIGNwdTA6IGNwdUAwIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInRoZWFkLGM5MjAiLCAicmlzY3YiOwo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGRldmljZV90eXBlID0gImNwdSI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmlzY3Ys
aXNhID0gInJ2NjRpbWFmZGMiOwo+Cj4gUGxlYXNlIGFsc28gYWRkIHJpc2N2LGlzYS1iYXNlICYg
cmlzY3YsaXNhLWV4dGVuc2lvbnMuCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaS1jYWNoZS1ibG9jay1zaXplID0gPDY0PjsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLXNpemUgPSA8NjU1MzY+Owo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGktY2FjaGUtc2V0cyA9IDw1MTI+Owo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGQtY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgZC1jYWNoZS1zaXplID0gPDY1NTM2PjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBk
LWNhY2hlLXNldHMgPSA8NTEyPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBuZXh0LWxldmVs
LWNhY2hlID0gPCZsMl9jYWNoZTA+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG1tdS10eXBl
ID0gInJpc2N2LHN2MzkiOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNwdTBfaW50
YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJyaXNjdixjcHUtaW50YyI7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgfTsKPiA+ICsgICAgICAgICAgICAgfTsKPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28v
c2cyMDQyLmR0c2kKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjc0N2ZkOTc2NGM5NQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKPiA+IEBAIC0wLDAgKzEsNDM5IEBACj4gPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgTUlUCj4KPiBZb3Ugc2hvdWxkIGFk
ZCAoKSBhcm91bmQgdGhlIEdQTC0yLjAgT1IgTUlULgo+Cj4gPiArLyoKPiA+ICsgKiBDb3B5cmln
aHQgKEMpIDIwMjIgU29waGdvIFRlY2hub2xvZ3kgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+
ID4gKyAqLwo+ID4gKwo+ID4gKy9kdHMtdjEvOwo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9p
bnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSAic2cyMDQyLWNw
dXMuZHRzaSIKPiA+ICsKPiA+ICsjZGVmaW5lIFNPQ19QRVJJUEhFUkFMX0lSUShucikgKG5yKQo+
Cj4gV2h5PyBXaGF0IGRvZXMgdGhpcyBkbz8gV2hlcmUgd2FzIGl0IGNvcGllZCBmcm9tPwo+Ckl0
IHNob3VsZCBiZSB1bm5lY2Vzc2Fyee+8jCBJIHdpbGwgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IHJl
dmlzaW9uLgoKPiA+ICsKPiA+ICsvIHsKPiA+ICsgICAgIGNvbXBhdGlibGUgPSAic29waGdvLHNn
MjA0MiI7Cj4gPiArICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ICsgICAgICNzaXplLWNl
bGxzID0gPDI+Owo+ID4gKyAgICAgZG1hLW5vbmNvaGVyZW50Owo+ID4gKwo+ID4gKyAgICAgYWxp
YXNlcyB7Cj4gPiArICAgICAgICAgICAgIHNlcmlhbDAgPSAmdWFydDA7Cj4gPiArICAgICB9Owo+
ID4gKwo+ID4gKyAgICAgLyogdGhlIG1lbSBub2RlIHdpbGwgYmUgdXBkYXRlZCBieSBaU0JMLiAq
Lwo+Cj4gaHVoPyBTbyB0aGVzZSBhcmUgcmFuZG9tIG51bWJlcnMgYmVsb3c/IEVpdGhlciBwdXQg
c29tZXRoaW5nIHVzZWZ1bCBoZXJlCj4gb3IgZGVsZXRlIGl0IHBsZWFzZS4KClRoZSBtZW1vcnkg
Zm9yIFNHMjA0MiBpcyBub3QgZml4ZWQsIHRoZSBib290bG9hZGVyIHdpbGwgZGV0ZWN0IG1lbW9y
eQppbnN0YWxsZWQgb24gYm9hcmQgZHVyaW5nIGJvb3RpbmcgYW5kIGZpbGwgdGhlIGFjdHVhbCBh
ZGRyZXNzIGFuZCBzaXplCmluIHRoZSBtZW1vcnkgbm9kZS4gVGhlIGNvbW1lbnQgIiAvKiB0aGUg
bWVtIG5vZGUgd2lsbCBiZSB1cGRhdGVkIGJ5ClpTQkwuICovIiBpcyB0ZWxsaW5nIHRoaXMuCldl
IHdyaXRlIG1lbW9yeSBub2RlcyBsaWtlIHRoaXMgdG8gbWFrZSB0aGVtIGFjdCBqdXN0IGFzIHBs
YWNlaG9sZGVycwphbmQgdGhlIHZhbHVlIGlzIGJ5IGRlZmF1bHQgd3JpdHRlbiBhcyB6ZXJvLgoK
Cj4KPiA+ICsgICAgIG1lbW9yeUAwIHsKPiA+ICsgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAi
bWVtb3J5IjsKPiA+ICsgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAw
eDAwMDAwMDAwIDB4MDAwMDAwMDA+Owo+ID4gKyAgICAgfTsKPiA+ICsKPiA+ICsgICAgIG1lbW9y
eUAxIHsKPiA+ICsgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiA+ICsgICAg
ICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDAwMDAwMSAweDAwMDAwMDAwIDB4MDAwMDAw
MDA+Owo+ID4gKyAgICAgfTsKPiA+ICsKPiA+ICsgICAgIG1lbW9yeUAyIHsKPiA+ICsgICAgICAg
ICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiA+ICsgICAgICAgICAgICAgcmVnID0gPDB4
MDAwMDAwMDAgMHgwMDAwMDAwMiAweDAwMDAwMDAwIDB4MDAwMDAwMDA+Owo+ID4gKyAgICAgfTsK
PiA+ICsKPiA+ICsgICAgIG1lbW9yeUAzIHsKPiA+ICsgICAgICAgICAgICAgZGV2aWNlX3R5cGUg
PSAibWVtb3J5IjsKPiA+ICsgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDAwMDAw
MyAweDAwMDAwMDAwIDB4MDAwMDAwMDA+Owo+ID4gKyAgICAgfTsKPgo+ID4gKyAgICAgc29jOiBz
b2Mgewo+ID4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+ID4gKyAg
ICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8Mj47Cj4gPiArICAgICAgICAgICAgIHJhbmdlczsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgY2xpbnRfbXN3aTogaW50ZXJydXB0LWNvbnRyb2xsZXJANzA5NDAwMDAwMCB7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLWNsaW50LW1z
d2kiLCAidGhlYWQsYzkwMC1jbGludC1tc3dpIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwMDAwMDA3MCAweDk0MDAwMDAwIDB4MDAwMDAwMDAgMHgwMDAwNDAwMD47Cj4KPiAm
IG5hayB0byB0aGlzIHdpdGhvdXQgZnVydGhlciBleHBsYW5hdGlvbiEKPgo+IFRoYW5rcywKPiBD
b25vci4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
