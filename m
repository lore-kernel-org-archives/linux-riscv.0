Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544DAC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VS4ECLBbdPAgzKRcInZ8kWLsVHWXdUK8WvCLl7gmOYE=; b=rw4ztxBtHOPbXj
	RdLTCqDGBFWLgxhiSFlN96ZbdVTK8/FUFRo5XONiGPpwz6CfXY+Nz3AB1dQayNUiaUtYvbqj7C1Hv
	QjPN0urRqmBca0YdL43HInUvKqGGaNNdFcSPKQucql4CagSU13QSnj0dmCZ1TCXxY+l2MG0I+Amis
	oufa7cAbxHcN8cMMLZu0vJR29YhQjfW/UUE32J8pCnCe/CqgV4P8SCuG9mYXyfqW4Ecui/I66qxOy
	0lWIC4tuzzbqeKNrcMI8n/LYg/mXHTfEqRvIUh4uloXkLYYDR6FxpCq7aWht5p0DOccXr57VXt+uf
	skZUY/neWLW7PBgb7Szw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66IQ-00EoNA-0w;
	Mon, 05 Jun 2023 09:14:38 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q66IN-00EoMG-0x
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 09:14:36 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-75eb918116aso62014985a.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 02:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685956473; x=1688548473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE0xssBXcK9nZ+e8wfDpCxReNmG+e30YEh+xZMobuHQ=;
        b=PIAoC/LhkYM27nDo4SJJQNhcXu9rNI7W+He0InIiRvpP6PNh+TDH0z4fD881+7/isH
         KAAjqxuWkn3poO5jCFCS3L5KEZwcXXjiRoXVJ23LmiX2Yf1UljB1Eg5MmjqDHEbTwKRX
         bOhUFeBDWeIqMYjlM18TqumVEaAqWmgh3m1cYt0J3gnVtvDxw0z8LJF0Nhq7+eufHVWv
         B5i7i6eHHyzO5lsRKE1+ILa2n5IaCJW/Sk8vBAdk9v6hcljHeOrHSG7eLoPjelaFNmfb
         YQhfC6xgY/BZaoQKSGTR9bPxSwQqlHbE3hE9zpyX49DjOLUg3O9o+LbxJCCRqs+J96sD
         GUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685956473; x=1688548473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rE0xssBXcK9nZ+e8wfDpCxReNmG+e30YEh+xZMobuHQ=;
        b=ihaMjhIy05BWBIJ2SLsJyKk4rIXrfQWQcdWSTanLAo7AmcDAS0ZbRCjQhOjmCw9ffS
         h7wG4F5LDmF68+LJ3ADCnO/Cjv4j9Q7hCVdnztteeKCbTSLzV6K5ml31Tqkk2u5U4ZZn
         DnWWvr6BD8zIssLbrKMi1Rprpu4ogTJmCLsKG76DpdmhkGspOHrxfuoSWQvEs/e6z6tk
         E5Hx2j2sZvtEB5dnRVSwMNtRA73/XmSLimKBLZYH7kwgE/C13duMtVFHs1qf5xsEbV+n
         uypJXEHqhAVxJv57rQFHLCZ6wM5yVPP9kS+u/0FKvBfQnbRE5M2g9kHCedNoNOiqKSGJ
         SwPA==
X-Gm-Message-State: AC+VfDw04EMaq9tt7oIwWxSNzQB4EFvQ0QuZ3HpIsp1bxMKPwP1Cl1Xk
	Wsu3cpWaKGzVZbY3sMcTj79iJ0BJK2Eh54YLlcQ=
X-Google-Smtp-Source: ACHHUZ44ZC3HtizNbif0Pd3vZlP2LsWIeHXWBfYc4IZjIR0M7aQKnZ0bfR9VTq7NXsjtd03zjdTQCpOVOBIRqPK97Yw=
X-Received: by 2002:a05:620a:8b87:b0:75b:23a0:e7a0 with SMTP id
 qx7-20020a05620a8b8700b0075b23a0e7a0mr18512831qkn.1.1685956473319; Mon, 05
 Jun 2023 02:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230605014850.9591-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230605014850.9591-1-jiasheng@iscas.ac.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Jun 2023 12:13:57 +0300
Message-ID: <CAHp75VdZct58EiLDL0ebCvcQBVMzuZxJZ8z=bs8D2UDaCsuo9A@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_021435_360283_72E09F35 
X-CRM114-Status: GOOD (  17.69  )
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

T24gTW9uLCBKdW4gNSwgMjAyMyBhdCA0OjQ54oCvQU0gSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEFkZCB0aGUgbWlzc2luZyBjaGVjayBmb3IgcGxhdGZv
cm1fZ2V0X2lycSgpIGFuZCByZXR1cm4gZXJyb3IgY29kZQo+IGlmIGl0IGZhaWxzLgoKUmV2aWV3
ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4KCj4gRml4
ZXM6IGY1MmQ2ZDhiNDNlNSAoImdwaW86IHNpZml2ZTogVG8gZ2V0IGdwaW8gaXJxIG9mZnNldCBm
cm9tIGRldmljZSB0cmVlIGRhdGEiKQo+IFNpZ25lZC1vZmYtYnk6IEppYXNoZW5nIEppYW5nIDxq
aWFzaGVuZ0Bpc2Nhcy5hYy5jbj4KPiAtLS0KPiBDaGFuZ2Vsb2c6Cj4KPiB2MiAtPiB2MzoKPgo+
IDEuIENoZWNrIGJlZm9yZSBhc3NpZ25pbmcgdmFsdWVzLgo+Cj4gdjEgLT4gdjI6Cj4KPiAxLiBS
ZXR1cm4gImdpcnEtPnBhcmVudHNbMF0iIGluc3RlYWQgb2YgIi1FTk9ERVYiLgo+IC0tLQo+ICBk
cml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwaW8vZ3Bpby1zaWZpdmUuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXNpZml2ZS5jCj4gaW5kZXgg
OTg5MzljZDRhNzFlLi43NDVlNWY2NzI1NGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncGlvL2dw
aW8tc2lmaXZlLmMKPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYwo+IEBAIC0yMjEs
OCArMjIxLDEyIEBAIHN0YXRpYyBpbnQgc2lmaXZlX2dwaW9fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gICAgICAg
ICB9Cj4KPiAtICAgICAgIGZvciAoaSA9IDA7IGkgPCBuZ3BpbzsgaSsrKQo+IC0gICAgICAgICAg
ICAgICBjaGlwLT5pcnFfbnVtYmVyW2ldID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCBpKTsKPiAr
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBuZ3BpbzsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIHJl
dCA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgaSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyZXQg
PCAwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICAgICAg
ICAgIGNoaXAtPmlycV9udW1iZXJbaV0gPSByZXQ7Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIHJl
dCA9IGJncGlvX2luaXQoJmNoaXAtPmdjLCBkZXYsIDQsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGNoaXAtPmJhc2UgKyBTSUZJVkVfR1BJT19JTlBVVF9WQUwsCj4gLS0KPiAyLjI1LjEKPgoK
Ci0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
