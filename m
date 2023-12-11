Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA8DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oACOYX12wLsG6N1ELh2fCsv2qct1QmmK96rflxcE3Qc=; b=MXgOx903vmhB4+
	mtKrtW79OPMtOrZ3wz4u9134IHZNFcttzqxrfgEJstKlK+gr3UM1RpEE8CpoPxCEP7XC6cvDUgaf7
	ruarA8qK1g0Y9/FfV7Nh37gf2hp+Np9G2xKaccxkfJRTvGbW0zs6kNcFFkAfIht3LURg1za0xKhK1
	Z0CsBRjyqHZAHQyY1f9uWTzzmcRLYQBcUqvdXvotoT3z7VatGAWlEEK3eo3uJTslO6vEy4R8Hx5Hy
	pWJARVsdqK0ShFWlxFYyAQnlaIsozX+Fees+Wvw1rp4l1aPF+zvU4KeJbvQl3D1YbqZVVXFYXPZSh
	YDy+R/zOT/atyGfq/NZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkB6-006Ngd-2S;
	Mon, 11 Dec 2023 17:34:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkAr-006NcK-2l
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 17:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 04C49B80F97
	for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 17:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599B1C433C8
	for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 17:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316068;
	bh=xuX6L1jHorTrNZtjpFIc75B8ypRXxqR2z0Z/exf+Bcc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KIjtlOXLZ/5nmD+yo2uenPqJ2aX9ssBIWM7zx7V9mGsNS4dvR6D8aAIpaFDBgT/r+
	 wCvrgF4StzlkDzjt3do/cB8Ml9zAQyJfXoeVqddjOpo3pkOKvyDvqomizxhhpAT3fh
	 rzG8LdwxdhzGsWTOvKytoF3vcPxedGlbsj2C2TPNgVi3xrrQSxjBVTpuaXQYZILPDr
	 Owt92PpG7h2R9rdPdu4WeAmREgjeG5gLlH18dk1z5Z0Y+LmOEd2gzOX3vK4wDsVx9I
	 iFwdL7SSj0y5Vdk3nDvkGPzjfeJpNdePgxd0MaZgSP5X3Vcf/XbxkKo4AkZuKQ91+7
	 ezj7eG3+MhM2A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso5392971e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 09:34:28 -0800 (PST)
X-Gm-Message-State: AOJu0Yz3RLBpCdQMy0yLYJDYY9/RqtQzEUhK9L8vFB6rTizHimCNcDsU
	F/FduJYFkHzO+V5IufkYW2XKDHtnQaPMTxyM0g==
X-Google-Smtp-Source: AGHT+IGMURGYLV/Y+ayED33ueZXlH85oU9OGhLmkTdCm4X1g7BaIMGfr4V8LF++R0RHFP+RuG1E0QnZTXRhkxEzjTew=
X-Received: by 2002:a05:6512:3d05:b0:50b:f776:1d6a with SMTP id
 d5-20020a0565123d0500b0050bf7761d6amr1293404lfv.1.1702316066602; Mon, 11 Dec
 2023 09:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20231204123315.28456-1-keith.zhao@starfivetech.com> <20231204123315.28456-6-keith.zhao@starfivetech.com>
In-Reply-To: <20231204123315.28456-6-keith.zhao@starfivetech.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Dec 2023 11:34:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJz5pcFwLbh9Jdw1HKLPFgF8ZQdCM18bHO_8R1dtmfx7Q@mail.gmail.com>
Message-ID: <CAL_JsqJz5pcFwLbh9Jdw1HKLPFgF8ZQdCM18bHO_8R1dtmfx7Q@mail.gmail.com>
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	aou@eecs.berkeley.edu, suijingfeng@loongson.cn, tzimmermann@suse.de, 
	paul.walmsley@sifive.com, mripard@kernel.org, xingyu.wu@starfivetech.com, 
	jack.zhu@starfivetech.com, palmer@dabbelt.com, 
	krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com, 
	shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_093441_778000_EB43C2EB 
X-CRM114-Status: GOOD (  17.71  )
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

T24gTW9uLCBEZWMgNCwgMjAyMyBhdCA2OjMz4oCvQU0gS2VpdGggWmhhbyA8a2VpdGguemhhb0Bz
dGFyZml2ZXRlY2guY29tPiB3cm90ZToKPgo+IGFkZCBoZG1pIGRyaXZlciBhcyBlbmNvZGVyIGFu
ZCBjb25uZWN0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBLZWl0aCBaaGFvIDxrZWl0aC56aGFvQHN0YXJm
aXZldGVjaC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9LY29uZmln
ICAgICAgICAgfCAgIDggKwo+ICBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vTWFrZWZpbGUg
ICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3N0YXJmaXZlX2hk
bWkuYyB8IDg0OSArKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vc3RhcmZpdmVfaGRtaS5oIHwgMzA0ICsrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL3Zl
cmlzaWxpY29uL3ZzX2Rydi5jICAgICAgICB8ICAgMyArCj4gIGRyaXZlcnMvZ3B1L2RybS92ZXJp
c2lsaWNvbi92c19kcnYuaCAgICAgICAgfCAgIDQgKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDExNjkg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3Zlcmlz
aWxpY29uL3N0YXJmaXZlX2hkbWkuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3ZlcmlzaWxpY29uL3N0YXJmaXZlX2hkbWkuaAo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92ZXJpc2lsaWNvbi9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29u
L0tjb25maWcKPiBpbmRleCBlMTBmYTk3NjM1YWEuLjEyMmM3ODZlMzk0OCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS92ZXJpc2lsaWNvbi9LY29uZmlnCj4gQEAgLTExLDMgKzExLDExIEBAIGNvbmZpZyBEUk1f
VkVSSVNJTElDT04KPiAgICAgICAgICAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgVmVyaVNpbGljb24g
a2VybmVsIG1vZGUKPiAgICAgICAgICAgc2V0dGluZyBhbmQgYnVmZmVyIG1hbmFnZW1lbnQuIEl0
IGRvZXMgbm90Cj4gICAgICAgICAgIHByb3ZpZGUgMkQgb3IgM0QgYWNjZWxlcmF0aW9uLgo+ICsK
PiArY29uZmlnIERSTV9WRVJJU0lMSUNPTl9TVEFSRklWRV9IRE1JCj4gKyAgICAgICBib29sICJT
dGFyZml2ZSBIRE1JIGV4dGVuc2lvbnMiCj4gKyAgICAgICBkZXBlbmRzIG9uIERSTV9WRVJJU0lM
SUNPTgo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICAgVGhpcyBzZWxlY3RzIHN1cHBvcnQgZm9y
IFN0YXJGaXZlIHNvYyBzcGVjaWZpYyBleHRlbnNpb25zCj4gKyAgICAgICAgICBmb3IgdGhlIElu
bm9zaWxpY29uIEhETUkgZHJpdmVyLiBJZiB5b3Ugd2FudCB0byBlbmFibGUKPiArICAgICAgICAg
IEhETUkgb24gSkg3MTEwIGJhc2VkIHNvYywgeW91IHNob3VsZCBzZWxlY3QgdGhpcyBvcHRpb24u
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZSBiL2Ry
aXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZQo+IGluZGV4IGJmNmYyYjdlZTQ4MC4u
NzFmYWRhZmNlZTEzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9N
YWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZQo+IEBA
IC02LDQgKzYsNSBAQCB2c19kcm0tb2JqcyA6PSB2c19kY19ody5vIFwKPiAgICAgICAgICAgICAg
ICAgdnNfZHJ2Lm8gXAo+ICAgICAgICAgICAgICAgICB2c19tb2Rlc2V0Lm8gXAo+ICAgICAgICAg
ICAgICAgICB2c19wbGFuZS5vCj4gK3ZzX2RybS0kKENPTkZJR19EUk1fVkVSSVNJTElDT05fU1RB
UkZJVkVfSERNSSkgKz0gc3RhcmZpdmVfaGRtaS5vCj4gIG9iai0kKENPTkZJR19EUk1fVkVSSVNJ
TElDT04pICs9IHZzX2RybS5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2ls
aWNvbi9zdGFyZml2ZV9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vc3RhcmZp
dmVfaGRtaS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmFh
NjIxZGIwZGVlMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNp
bGljb24vc3RhcmZpdmVfaGRtaS5jCj4gQEAgLTAsMCArMSw4NDkgQEAKPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIw
MjMgU3RhckZpdmUgVGVjaG5vbG9neSBDby4sIEx0ZC4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8
bGludXgvY2xrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KPiArI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L2hkbWkuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+ICsjaW5jbHVkZSA8bGludXgv
aXJxLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tZWRpYS1idXMtZm9ybWF0Lmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9tZmQvc3lzY29uLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L211dGV4Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KCllv
dSBwcm9iYWJseSBkb24ndCBuZWVkIHRoaXMgaGVhZGVyIGFuZCB0aGUgaW1wbGljaXQgaW5jbHVk
ZXMgaXQgbWFrZXMKYXJlIGRyb3BwZWQgbm93IGluIGxpbnV4LW5leHQuIFBsZWFzZSBjaGVjayB3
aGF0IHlvdSBhY3R1YWxseSBuZWVkIGFuZAptYWtlIHRoZW0gZXhwbGljaXQuCgpSb2IKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
