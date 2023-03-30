Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C8FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 04:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+H8uJN2QzZJJbwoB3Vv5eBQ5K+HF7mQ25CC12RSeJg=; b=OEe3gklONTVh9C
	EUA4orW1+e2+/ibCZC2Wv7BdImmhGU+ygtb8nqW4NQ+bg0j2SCqYLT8ep9E/oaLISsq7uEhy9meEq
	vrwkGUDzm+j/ZoUpgmDioQ1EHKqzl8lq4jctllOeriqVn/OEKI1jXO1JQYsQBKg1wxGXLQ+KMTZOh
	OXXwlylVKxtvJF7mT1Hktn6hkNr5ClWuyITPow+r6a7zwcf+29Mn8Lnos0bBn6/K4DW7DBtjFCXHc
	W9b6k1YRX7py7bXKY5aPhEjIKfOd8JbujyomfLtZTcUeq3aqyGYik6YN/7sKoooJtxHXPDXl2WkGy
	FcNAfnJ6pnJUWufrIqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phjUZ-002TxC-2O;
	Thu, 30 Mar 2023 04:02:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phjUV-002TvW-20
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 04:02:25 +0000
Received: by mail-ed1-x52e.google.com with SMTP id cn12so71449227edb.4
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 21:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1680148938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRrMSTrE1hzXNMTnJR9hzwcHZG5OJLH6N1k4mRkhtxc=;
        b=ynfExVnq8Pbne4CrK35vVvzcZo/HMcJEJUR3Ujna/kLNgyxndnnVOhaOok7Q3u4boK
         FW4keBgSZ6pU7kWyE+manshTU5Tk7hNavSWkOvFCWTteIMmp/9Qk7GSzFj7kYZ5XfmBv
         miUHdrLcGJzpXksYn+qz42allwe3QMPmR/pnE7vpqvm1r6J8sdtN2nbt3yHJRZJvjQa2
         WULHOKYx2FaImOfeOidrkyK9ABt3NseOxAzqi3/iHsrvkvaPYLGzC0VonLkMDJt7dAvE
         qA6CCYx7R2kWBHI86Kqb+JhYZk0VIktRQH4ecdVqtPrNiVN9gXZkgnTnC6UdsKE6Gs/B
         u+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRrMSTrE1hzXNMTnJR9hzwcHZG5OJLH6N1k4mRkhtxc=;
        b=5KXhk0sFRhFKDeJb3uQUdydQ15LDIsp/hrm9Ddw+VZJt+9zDzHU9xupH0ySz3zVtI/
         2zU3poPajJPV94hftWVk6ayyo+vDb/i202ltJIKodkvnA+SdRBvEk3SuuMK3EoA9Rsob
         frlN2wwMGdYt96Rg0B4d0/BT40pfznTIG3eoYN+0j1Fxs40YGWX/CmpclkGWQtRaiHz3
         3dBXw38bKMQLHJ4mUDn7euJtLQ2mxGB1+zhCHNjBBXctkPSwiWux+bcZRV9i1HZw6Fw2
         RvUZC2g0NQIWU1R2Hlm3ugC4dBVSGn8/jJ/XbTX2A1I6KYq0aSp/Uk2Shfhu19yrQFjR
         ZPQA==
X-Gm-Message-State: AAQBX9d6SjEsIz2dK39IXbwP5n4M7lAzz8FwCywdCl+PyVTtEtGXfDxd
	QgXDgBWKNOIjCBnlRrEW+nKKLrzA/LU9g3AxeL3Sjw==
X-Google-Smtp-Source: AKy350YsOJqAiqRYem5e01w1p2m+BEvgEUELir1jFBDVGQszGos9GuJs6YHfU/Z+9mLpMcFmxWEdJiS8UYrZt9G/tI4=
X-Received: by 2002:a50:9fef:0:b0:4fc:1608:68c8 with SMTP id
 c102-20020a509fef000000b004fc160868c8mr10756114edf.1.1680148938164; Wed, 29
 Mar 2023 21:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-16-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-16-581e2605fe47@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Mar 2023 09:32:06 +0530
Message-ID: <CAAhSdy3MYV=v2TNZ_507zGe6Pj_c95TZwODPK8-zTHpkn-ukww@mail.gmail.com>
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
	Konrad Dybcio <konrad.dybcio@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Marc Zyngier <maz@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_210223_858042_D0D35694 
X-CRM114-Status: GOOD (  17.15  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgOToyMuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gTm93IHRoYXQgb2ZfY3B1X2RldmljZV9ub2RlX2dldCgpIGlzIGRl
ZmluZWQgaW4gb2YuaCwgb2ZfZGV2aWNlLmggaXMganVzdAo+IGltcGxpY2l0bHkgaW5jbHVkaW5n
IG90aGVyIGluY2x1ZGVzLCBhbmQgaXMgbm8gbG9uZ2VyIG5lZWRlZC4gQWRqdXN0IHRoZQo+IGlu
Y2x1ZGUgZmlsZXMgd2l0aCB3aGF0IHdhcyBpbXBsaWNpdGx5IGluY2x1ZGVkIGJ5IG9mX2Rldmlj
ZS5oIChjcHUuaCwKPiBjcHVob3RwbHVnLmgsIG9mLmgsIGFuZCBvZl9wbGF0Zm9ybS5oKSBhbmQg
ZHJvcCBpbmNsdWRpbmcgb2ZfZGV2aWNlLmguCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgoKRm9yIGNwdWlkbGUtcmlzY3Ytc2JpLmMKQWNrZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+IFBs
ZWFzZSBhY2sgYW5kIEkgd2lsbCB0YWtlIHRoZSBzZXJpZXMgdmlhIHRoZSBEVCB0cmVlLgo+IC0t
LQo+ICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1wc2NpLmMgICAgICB8IDEgLQo+ICBkcml2ZXJz
L2NwdWlkbGUvY3B1aWRsZS1xY29tLXNwbS5jICB8IDMgKy0tCj4gIGRyaXZlcnMvY3B1aWRsZS9j
cHVpZGxlLXJpc2N2LXNiaS5jIHwgMiArLQo+ICBkcml2ZXJzL2NwdWlkbGUvZHRfaWRsZV9zdGF0
ZXMuYyAgICB8IDEgLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1wc2NpLmMg
Yi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1wc2NpLmMKPiBpbmRleCA2ZGUwMjdmOWY2ZjUuLmJm
Njg5MjBkMDM4YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1wc2NpLmMK
PiArKysgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1wc2NpLmMKPiBAQCAtMTYsNyArMTYsNiBA
QAo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2Uu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvcHNjaS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcG1fZG9tYWluLmg+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXFjb20tc3BtLmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1
aWRsZS1xY29tLXNwbS5jCj4gaW5kZXggYzZlMmU5MWJiNGMzLi4xZmM5OTY4ZWFlMTkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcWNvbS1zcG0uYwo+ICsrKyBiL2RyaXZl
cnMvY3B1aWRsZS9jcHVpZGxlLXFjb20tc3BtLmMKPiBAQCAtMTEsOCArMTEsNyBAQAo+ICAjaW5j
bHVkZSA8bGludXgvaW8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L29mLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4gLSNpbmNsdWRl
IDxsaW51eC9vZl9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvY3B1aWRsZS5oPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJp
c2N2LXNiaS5jCj4gaW5kZXggYmUzODNmNGI2ODU1Li5hZTBiODM4YTA2MzQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiArKysgYi9kcml2ZXJzL2Nw
dWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+IEBAIC04LDYgKzgsNyBAQAo+Cj4gICNkZWZpbmUg
cHJfZm10KGZtdCkgImNwdWlkbGUtcmlzY3Ytc2JpOiAiIGZtdAo+Cj4gKyNpbmNsdWRlIDxsaW51
eC9jcHVob3RwbHVnLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHVpZGxlLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9jcHVtYXNrLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHVfcG0uaD4KPiBAQCAtMTUs
NyArMTYsNiBAQAo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9v
Zl9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcG1fZG9tYWluLmg+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY3B1aWRsZS9kdF9pZGxlX3N0YXRlcy5jIGIvZHJpdmVycy9jcHVp
ZGxlL2R0X2lkbGVfc3RhdGVzLmMKPiBpbmRleCAwMmFhMGIzOWFmOWQuLjEyZmVjOTJhODVmZCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWlkbGUvZHRfaWRsZV9zdGF0ZXMuYwo+ICsrKyBiL2Ry
aXZlcnMvY3B1aWRsZS9kdF9pZGxlX3N0YXRlcy5jCj4gQEAgLTE0LDcgKzE0LDYgQEAKPiAgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9vZi5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4KPiAg
I2luY2x1ZGUgImR0X2lkbGVfc3RhdGVzLmgiCj4KPgo+IC0tCj4gMi4zOS4yCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
