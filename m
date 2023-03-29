Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA116C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAsOfSPKzuV5xOc+w6rOwWhh6nhhvpV7BB1aY1mHf2M=; b=MKVoGSA/Qnm9f5
	tgtlVvvbrFf8/Vk3Rexqx0kE7WqVm5rz+yacvuTPolm5zZvLNtN/BtA/plGJ522PfzEg+UxWbclFG
	KUsuhG7Bdt5D/U7rJG45yRmYFpQFvBvh5V+ouW3TbvQRvkhSTZMJopiwgTwpo4R0nGO8SsmMO1BDS
	Ewlf4QIFp5jUCfxIRqCEfE0vhFdV45q4vf8ppS12gEzIl+eOWP06iDC6xU6VMswjtPNwPw3CoClKl
	h51yy7anO3mwitlXHWcfwCsdz7kffzGta22VVZ1P8I4AUaRGYGmjXK9jqbVCGKuNQsbUSyOGDdbJA
	mcIX1dhDrusy1fNiyyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYB9-000vDp-0U;
	Wed, 29 Mar 2023 15:57:39 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYAw-000v5J-2p;
	Wed, 29 Mar 2023 15:57:28 +0000
Received: by mail-ed1-f54.google.com with SMTP id ew6so65229251edb.7;
        Wed, 29 Mar 2023 08:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiLLqeasGYV72OnUftYDwpJH98iYFk7qhLz9/jkuOco=;
        b=mbmAXGYM1ZQpNwVMPmhtWON8o3+NB9U2FoMGZCNugIbwM3XhvdPApEmNq0cprH/A9u
         uIYtSHXOUhd0W5PtJvi8Ke1XkCoJOLQk1ajrG5M5EljLHKprcMdjz77Z+58V73KZIW1F
         pjaNEz1EnmTQWVOI/KH9/veYeKLZA+riKascv1YMbCWrk8xLsuY8b7GtYu4awO2KcwF9
         TxJxfuQFFKL0QEhZMSOwP6nTuQDNIzftX5d6d3/q2lh+J8OhRupskis7uGOpqh1nwWSX
         +1NhDlrh0IBNcni0IcecVE4Czsz5g744S5SukARKRG0Ajrja9qIE1fDoYha5wD5jP0/X
         o73w==
X-Gm-Message-State: AAQBX9e1VeFw+i8Hd2rcW/pa6HlJKt9gJMvCqu9fqKZmYvDAVidFuPEg
	dPUgXZcXi6EI0WZDarSyhCfVHU3sa7sot1Ieb44=
X-Google-Smtp-Source: AKy350bpppzhtgK7epjSXQz3h0DFNSdZnWNofTwOprIA61Xay8SqtY2fCtP8X1SqYIkDWIEHDZMZthJxQAfHpdrMVVg=
X-Received: by 2002:a50:cc94:0:b0:4fb:c8e3:1ae2 with SMTP id
 q20-20020a50cc94000000b004fbc8e31ae2mr10233137edi.3.1680105443653; Wed, 29
 Mar 2023 08:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-16-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-16-581e2605fe47@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Mar 2023 17:57:12 +0200
Message-ID: <CAJZ5v0iFMOWMuG1t4gwzF=m-kfonj4ni9+zciRHDzqFcTGaYpw@mail.gmail.com>
Subject: Re: [PATCH 16/19] cpuidle: Adjust includes to remove of_device.h
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
X-CRM114-CacheID: sfid-20230329_085726_933884_00EC5C42 
X-CRM114-Status: GOOD (  17.17  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgNTo1MuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gTm93IHRoYXQgb2ZfY3B1X2RldmljZV9ub2RlX2dldCgpIGlzIGRl
ZmluZWQgaW4gb2YuaCwgb2ZfZGV2aWNlLmggaXMganVzdAo+IGltcGxpY2l0bHkgaW5jbHVkaW5n
IG90aGVyIGluY2x1ZGVzLCBhbmQgaXMgbm8gbG9uZ2VyIG5lZWRlZC4gQWRqdXN0IHRoZQo+IGlu
Y2x1ZGUgZmlsZXMgd2l0aCB3aGF0IHdhcyBpbXBsaWNpdGx5IGluY2x1ZGVkIGJ5IG9mX2Rldmlj
ZS5oIChjcHUuaCwKPiBjcHVob3RwbHVnLmgsIG9mLmgsIGFuZCBvZl9wbGF0Zm9ybS5oKSBhbmQg
ZHJvcCBpbmNsdWRpbmcgb2ZfZGV2aWNlLmguCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+IFBsZWFzZSBhY2sgYW5kIEkgd2lsbCB0YWtlIHRo
ZSBzZXJpZXMgdmlhIHRoZSBEVCB0cmVlLgoKQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxy
YWZhZWxAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXBzY2ku
YyAgICAgIHwgMSAtCj4gIGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXFjb20tc3BtLmMgIHwgMyAr
LS0KPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCAyICstCj4gIGRyaXZl
cnMvY3B1aWRsZS9kdF9pZGxlX3N0YXRlcy5jICAgIHwgMSAtCj4gIDQgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y3B1aWRsZS9jcHVpZGxlLXBzY2kuYyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXBzY2kuYwo+
IGluZGV4IDZkZTAyN2Y5ZjZmNS4uYmY2ODkyMGQwMzhhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Y3B1aWRsZS9jcHVpZGxlLXBzY2kuYwo+ICsrKyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXBz
Y2kuYwo+IEBAIC0xNiw3ICsxNiw2IEBACj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAtI2lu
Y2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wc2NpLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbV9k
b21haW4uaD4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcWNvbS1zcG0u
YyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXFjb20tc3BtLmMKPiBpbmRleCBjNmUyZTkxYmI0
YzMuLjFmYzk5NjhlYWUxOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1x
Y29tLXNwbS5jCj4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcWNvbS1zcG0uYwo+IEBA
IC0xMSw4ICsxMSw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L29m
X2FkZHJlc3MuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8
bGludXgvb2ZfcGxhdGZvcm0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHVpZGxlLmg+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jIGIvZHJp
dmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiBpbmRleCBiZTM4M2Y0YjY4NTUuLmFl
MGI4MzhhMDYzNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1z
YmkuYwo+ICsrKyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gQEAgLTgs
NiArOCw3IEBACj4KPiAgI2RlZmluZSBwcl9mbXQoZm10KSAiY3B1aWRsZS1yaXNjdi1zYmk6ICIg
Zm10Cj4KPiArI2luY2x1ZGUgPGxpbnV4L2NwdWhvdHBsdWcuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2NwdWlkbGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2NwdW1hc2suaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L2NwdV9wbS5oPgo+IEBAIC0xNSw3ICsxNiw2IEBACj4gICNpbmNsdWRlIDxsaW51eC9rZXJu
ZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2Yu
aD4KPiAtI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9wbV9kb21haW4uaD4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2R0X2lkbGVf
c3RhdGVzLmMgYi9kcml2ZXJzL2NwdWlkbGUvZHRfaWRsZV9zdGF0ZXMuYwo+IGluZGV4IDAyYWEw
YjM5YWY5ZC4uMTJmZWM5MmE4NWZkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9kdF9p
ZGxlX3N0YXRlcy5jCj4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2R0X2lkbGVfc3RhdGVzLmMKPiBA
QCAtMTQsNyArMTQsNiBAQAo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gLSNpbmNsdWRlIDxs
aW51eC9vZl9kZXZpY2UuaD4KPgo+ICAjaW5jbHVkZSAiZHRfaWRsZV9zdGF0ZXMuaCIKPgo+Cj4g
LS0KPiAyLjM5LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
