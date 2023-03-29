Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625F3C77B61
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oB0k2BRHl8sbPuPPoJ9dIHziAYmAeJ2TlpTzi/xeFZk=; b=cwQ4lgtT83QxA2
	gSWAnxZWjf0WR9kUbJt+b5CVyEzgitf3BZA4tTAIp68oFqPXnqyOum5Y3yF9iEsBao3tuGRUPePIF
	EqtKpbqrpCE183ylY1DuGpHY7QxGBVeQMdvTiaelUgGtFFf6qhoc+CmsSgi/75SJlQDXa8qE3Nq+x
	TVNOSZpu6W6mL0XyVFliT+NcV4xUM3p9b9UPAFkl2ChX7i2KB68Tf0B6jjAV+p7XInw41aHtk5Wyi
	0oWaNQNcWDBSeXhDXFjvHzScuSMBq+uPVKIJHlx+IlTO5ehL2j2LqzmQGXRrC3mVul9XR2Y77wfDD
	1+4XKLd9QmD/Z9HzxTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYBl-000vc2-32;
	Wed, 29 Mar 2023 15:58:17 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYBf-000vVt-1v;
	Wed, 29 Mar 2023 15:58:13 +0000
Received: by mail-ed1-f44.google.com with SMTP id r11so65309920edd.5;
        Wed, 29 Mar 2023 08:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzq+vIJia6Oe7/D+Sh+wrCg8ai+vibYcP9Z6Z0Gi+ds=;
        b=Nsxo9niHEpKrZ/kLUZ2OzbOJefM0ZD4Ug2wyRvhQCF2R9M5jLuIEntLHfcooIpBlGw
         R7rPq+eCjwo5rvXIOoiJA9v4N71Ld6Obj7FZC2WGJXAoZCJhDs0XXGRr8iboDfIe1IRP
         sSBEQ/4WOK7GwGsUbXFrhebJKr1t2NvA6OSQv3cR471SkXe0/on1u6HbtKt2yUV4hgcZ
         /0eVnt5x2Rll1kDQZpsWngkn5teOHDIwiMOYVnleGgtdXASqo/jCompzLPRpTXv4I5T4
         TSyXCvd/lLg+H6KvHYtB8eqGLdQmlyP3L3bBK5+eBkABjMd+aG2taH8WMMnUdEVYKt8i
         +Pjw==
X-Gm-Message-State: AAQBX9fBAS7JxvefieJjv5HVZXsDIMlLCkTIBSqpRBus26ber6BHxC9Z
	hE/1VC6ALYWl6adahAA+iXxzhugKg2QFPfmoXh0=
X-Google-Smtp-Source: AKy350boHE0zfBloqdcSNGmzBqUXXsRddCRy/sa5FfObdnxpOzEYGDjWB1IEyEgnL1SIEdbf4Xnc903CLkgoiq3GKuI=
X-Received: by 2002:a50:d49e:0:b0:502:148d:9e1e with SMTP id
 s30-20020a50d49e000000b00502148d9e1emr9950905edi.3.1680105487384; Wed, 29 Mar
 2023 08:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Mar 2023 17:57:56 +0200
Message-ID: <CAJZ5v0iBjt6Rms1QznB7LLvq5S2GcQRBmSXmT30rswTHtD7s8g@mail.gmail.com>
Subject: Re: [PATCH 14/19] cpufreq: Adjust includes to remove of_device.h
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085811_632981_D812906D 
X-CRM114-Status: GOOD (  17.58  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgNTo1M+KAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gTm93IHRoYXQgb2ZfY3B1X2RldmljZV9ub2RlX2dldCgpIGlzIGRl
ZmluZWQgaW4gb2YuaCwgb2ZfZGV2aWNlLmggaXMganVzdAo+IGltcGxpY2l0bHkgaW5jbHVkaW5n
IG90aGVyIGluY2x1ZGVzLCBhbmQgaXMgbm8gbG9uZ2VyIG5lZWRlZC4gQWRqdXN0IHRoZQo+IGlu
Y2x1ZGUgZmlsZXMgd2l0aCB3aGF0IHdhcyBpbXBsaWNpdGx5IGluY2x1ZGVkIGJ5IG9mX2Rldmlj
ZS5oIChjcHUuaCBhbmQKPiBvZi5oKSBhbmQgZHJvcCBpbmNsdWRpbmcgb2ZfZGV2aWNlLmguCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+IFBs
ZWFzZSBhY2sgYW5kIEkgd2lsbCB0YWtlIHRoZSBzZXJpZXMgdmlhIHRoZSBEVCB0cmVlLgoKQWNr
ZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGRy
aXZlcnMvY3B1ZnJlcS9jcHVmcmVxLWR0LXBsYXRkZXYuYyB8IDEgLQo+ICBkcml2ZXJzL2NwdWZy
ZXEva2lya3dvb2QtY3B1ZnJlcS5jICAgfCAyICstCj4gIGRyaXZlcnMvY3B1ZnJlcS9tYXBsZS1j
cHVmcmVxLmMgICAgICB8IDIgKy0KPiAgZHJpdmVycy9jcHVmcmVxL3BtYWMzMi1jcHVmcmVxLmMg
ICAgIHwgMiArLQo+ICBkcml2ZXJzL2NwdWZyZXEvcG1hYzY0LWNwdWZyZXEuYyAgICAgfCAyICst
Cj4gIGRyaXZlcnMvY3B1ZnJlcS9xY29tLWNwdWZyZXEtaHcuYyAgICB8IDQgKystLQo+ICBkcml2
ZXJzL2NwdWZyZXEvc3BlYXItY3B1ZnJlcS5jICAgICAgfCAyICstCj4gIGRyaXZlcnMvY3B1ZnJl
cS90ZWdyYTEyNC1jcHVmcmVxLmMgICB8IDEgLQo+ICBkcml2ZXJzL2NwdWZyZXEvdGVncmEyMC1j
cHVmcmVxLmMgICAgfCAyICstCj4gIGluY2x1ZGUvbGludXgvY3B1ZnJlcS5oICAgICAgICAgICAg
ICB8IDEgLQo+ICAxMCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLWR0LXBsYXRkZXYu
YyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLWR0LXBsYXRkZXYuYwo+IGluZGV4IGU4NTcwMzY1
MTA5OC4uZjk2NzVlMWE4NTI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVx
LWR0LXBsYXRkZXYuYwo+ICsrKyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLWR0LXBsYXRkZXYu
Ywo+IEBAIC02LDcgKzYsNiBAQAo+Cj4gICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L29mLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+Cj4gICNpbmNsdWRlICJjcHVmcmVxLWR0Lmgi
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJlcS9raXJrd29vZC1jcHVmcmVxLmMgYi9kcml2
ZXJzL2NwdWZyZXEva2lya3dvb2QtY3B1ZnJlcS5jCj4gaW5kZXggNzBhZDhmZTFkNzhiLi45NTU4
ODEwMWVmYmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jcHVmcmVxL2tpcmt3b29kLWNwdWZyZXEu
Ywo+ICsrKyBiL2RyaXZlcnMvY3B1ZnJlcS9raXJrd29vZC1jcHVmcmVxLmMKPiBAQCAtOSw3ICs5
LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvY2xr
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHVmcmVxLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9k
ZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gICNpbmNsdWRlIDxhc20v
cHJvYy1mbnMuaD4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVxL21hcGxlLWNwdWZyZXEu
YyBiL2RyaXZlcnMvY3B1ZnJlcS9tYXBsZS1jcHVmcmVxLmMKPiBpbmRleCAyOGQzNDYwNjIxNjYu
LmY5MzA2NDEwYTA3ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWZyZXEvbWFwbGUtY3B1ZnJl
cS5jCj4gKysrIGIvZHJpdmVycy9jcHVmcmVxL21hcGxlLWNwdWZyZXEuYwo+IEBAIC0yMyw3ICsy
Myw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9tdXRleC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdGltZS5oPgo+IC0jaW5jbHVkZSA8bGludXgv
b2ZfZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+Cj4gICNkZWZpbmUgREJHKGZt
dC4uLikgcHJfZGVidWcoZm10KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJlcS9wbWFj
MzItY3B1ZnJlcS5jIGIvZHJpdmVycy9jcHVmcmVxL3BtYWMzMi1jcHVmcmVxLmMKPiBpbmRleCA0
YjhlZTIwMTRkYTYuLmEyODcxNmQ4ZmM1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWZyZXEv
cG1hYzMyLWNwdWZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvY3B1ZnJlcS9wbWFjMzItY3B1ZnJlcS5j
Cj4gQEAgLTIzLDcgKzIzLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvaGFyZGlycS5oPgo+IC0jaW5j
bHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+Cj4gICNp
bmNsdWRlIDxhc20vbWFjaGRlcC5oPgo+ICAjaW5jbHVkZSA8YXNtL2lycS5oPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2NwdWZyZXEvcG1hYzY0LWNwdWZyZXEuYyBiL2RyaXZlcnMvY3B1ZnJlcS9w
bWFjNjQtY3B1ZnJlcS5jCj4gaW5kZXggYmE5YzMxZDk4YmQ2Li4yY2QyYjA2ODQ5YTIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9jcHVmcmVxL3BtYWM2NC1jcHVmcmVxLmMKPiArKysgYi9kcml2ZXJz
L2NwdWZyZXEvcG1hYzY0LWNwdWZyZXEuYwo+IEBAIC0yMSw3ICsyMSw3IEBACj4gICNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9tdXRleC5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4gKyNp
bmNsdWRlIDxsaW51eC9vZi5oPgo+Cj4gICNpbmNsdWRlIDxhc20vbWFjaGRlcC5oPgo+ICAjaW5j
bHVkZSA8YXNtL2lycS5oPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvcWNvbS1jcHVm
cmVxLWh3LmMgYi9kcml2ZXJzL2NwdWZyZXEvcWNvbS1jcHVmcmVxLWh3LmMKPiBpbmRleCAyZjU4
MWQyZDYxN2QuLmRmMTY1YTA3OGQxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWZyZXEvcWNv
bS1jcHVmcmVxLWh3LmMKPiArKysgYi9kcml2ZXJzL2NwdWZyZXEvcWNvbS1jcHVmcmVxLWh3LmMK
PiBAQCAtMTEsOCArMTEsOCBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+IC0j
aW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZv
cm0uaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BtX29wcC5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvcG1fcW9zLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY3B1ZnJlcS9zcGVhci1jcHVmcmVxLmMgYi9kcml2ZXJzL2NwdWZyZXEvc3BlYXItY3B1
ZnJlcS5jCj4gaW5kZXggYzZmZGYwMTlkYmRlLi43OGI4NzVkYjZiNjYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9jcHVmcmVxL3NwZWFyLWNwdWZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvY3B1ZnJlcS9z
cGVhci1jcHVmcmVxLmMKPiBAQCAtMTgsNyArMTgsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvZXJy
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KPiAtI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2Yu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jcHVmcmVxL3RlZ3JhMTI0LWNwdWZyZXEuYyBiL2RyaXZlcnMvY3B1ZnJlcS90ZWdyYTEy
NC1jcHVmcmVxLmMKPiBpbmRleCA3YTFlYTZmZGNhYjYuLjMxMmNhNWRkYzZjNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2NwdWZyZXEvdGVncmExMjQtY3B1ZnJlcS5jCj4gKysrIGIvZHJpdmVycy9j
cHVmcmVxL3RlZ3JhMTI0LWNwdWZyZXEuYwo+IEBAIC0xMSw3ICsxMSw2IEBACj4gICNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9vZi5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9wbV9vcHAuaD4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVmcmVx
L3RlZ3JhMjAtY3B1ZnJlcS5jIGIvZHJpdmVycy9jcHVmcmVxL3RlZ3JhMjAtY3B1ZnJlcS5jCj4g
aW5kZXggYWI3YWM3ZGY5ZTYyLi41ZDFmNWY4N2U0NmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9j
cHVmcmVxL3RlZ3JhMjAtY3B1ZnJlcS5jCj4gKysrIGIvZHJpdmVycy9jcHVmcmVxL3RlZ3JhMjAt
Y3B1ZnJlcS5jCj4gQEAgLTEyLDcgKzEyLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+
ICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4g
LSNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3Bt
X29wcC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9jcHVmcmVxLmggYi9pbmNsdWRlL2xpbnV4L2NwdWZyZXEuaAo+IGluZGV4IDY1NjIz
MjMzYWIyZi4uM2FjNGExMGQ0NjUxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvY3B1ZnJl
cS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9jcHVmcmVxLmgKPiBAQCAtMTUsNyArMTUsNiBAQAo+
ICAjaW5jbHVkZSA8bGludXgva29iamVjdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbm90aWZpZXIu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2Uu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BtX29wcC5oPgo+ICAjaW5jbHVkZSA8bGludXgvcG1fcW9z
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPgo+Cj4gLS0KPiAyLjM5LjIKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
