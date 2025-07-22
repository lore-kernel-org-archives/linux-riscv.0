Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362E1C83F25
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 11:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ry/erk99y03p4xgvj8Kc/zcqmW5wNOxy5tHuQcHxgP0=; b=eRqea1qE/7x7xH
	2+kwanOK+zkN2gFDxrhPDPCU+04S0skYpkgT39jvA1/hwXlJrk2VEHTdK+nGKxEEfpTr+Ut4tZ/85
	evw5+bvLkyZ/qsQMKGJ5Qa6+d6enYxZQd/F8+c3ByZVOXffeA3LVwDDO93OvW0D2CZgvKot8uP03s
	atDDt60H9cP3vuXeBDHyx20EPEQtANi/CTm81KQzC0GW1NLUE1eiReziXhpd5C19xp2xSmwYm/di8
	BKUtLLkrWxzRszaO6RxAeck/c570wSC3wkTliwLmHcEnhP/AewT9oSexuDrsA6YrRqqId6yykwgUs
	Rhm8t+8e7OOV4gU5UaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBCM-00000002Hyd-2x1Y;
	Tue, 22 Jul 2025 11:30:18 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB7q-00000002HBu-3iZS
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 11:25:40 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-884f7d29b85so2789932241.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753183537; x=1753788337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crTrKK7Fv8oEkT7Vw14WQxZmxE8sWQSgGRs4hNZ3Hf8=;
        b=Md874S7nUikBt1Z7OkfisomjOvZMO/CzDUuggBbXVBJym1I3fyagG7zcROQwICyKtG
         nIMU3lGkEeyMcA5+Ud7EcyOJ0L4AJqOR5ZeUBeG/Rg3u7CJPYyZ74OfwFs/PNhuPENXh
         wSPEK4KX48miZp4QtKN01Yo3oRz1qb2FqgRltmBcnJzH8rC0MDW632mXGRTCKYmKIusp
         zUcGp4pfBVNb8T9cOrWHnxYvLQmUjkV4WqfPAXiLmQmrrRQqFR+G6PSDKHa/byg/Zpd9
         OgT8LQC9hhSfVuPgINBxGgybsZWOUkdeqCDQI1f8UVvti/BkAeuvP4OLhxPfoQjlATPL
         XhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753183537; x=1753788337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crTrKK7Fv8oEkT7Vw14WQxZmxE8sWQSgGRs4hNZ3Hf8=;
        b=qyz50glNOAOQ5WJQ75vx0kDDm5waAa4LiH6e7gyD9Kery4nBsnqFrfbQUds8ZVXw+U
         Yq5ksRex1S4mF9ImWyW2nh9kgfpTiutI0MPyxlwkEVmDfIIgh6/RyLHoMWUQBgA9nwVL
         dlVynqDrySy1ma92v4wSaK/A9ob5MV4nS/Qi7mz5Yjx2R7d2z2knokTLJWM3F7fwOrlT
         pEteHz17FhX3/0Tvxa5E51wTcKHxS45whctevreH6qtqn0CMVWMttLrGKaIRN01MWcUs
         tTNxPgtCDVfpc6gg13eJXfSTbv7KCQs3FU3+VPsleABCe/7BZM2S2hUHPwM/kfTxrBda
         Dbcg==
X-Forwarded-Encrypted: i=1; AJvYcCXhyIK5BqkqEiu41DqwgKos7uYjCNnzFOKBle5Q+jRkCkHeZuDYuU7BX9WkWBzVXfv7xgChCCGVJJNAMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuD0KCiEVhnpHarM56Jt50kmrWBzr5lj3zdkz7iDfTgBNs1epe
	bXcSvU60shhcS71jHuu4NUm+nwzaykBlgZEs++nmVsQq84g7eOp0wx2GtlaQKhirvgj5fx8vQud
	mmcXumXG7Sd0XlBbCaMiXbYZHl4jdWM4=
X-Gm-Gg: ASbGncsPxQdTch8wYOrmZ44RM/m2R5SFvFpW/bh+IE65ZJLaTRAqZ97Y3LlQ9SF1VN6
	vaLl3Wna5CqxwDTsdZxYCqUOY0glH9TRzbHPhTsqFRHGTnSMpaHnhxKeNMtYid5lr7tBE/S/Cu8
	3GHqYf7wRLeQKrcB48vRVy5jgw/nbKDV5iysUgAvN7fUnlycDnFvadWJ4cZyKasLG1PRQ65L7VE
	sCw
X-Google-Smtp-Source: AGHT+IGBGW1NdHmoHUfa8aAEY3c8SNcPSI/VawRsJ44yRxDkRqQovc+wfZlxzFhug4UAYnDAuP0fvet8e45XcgOHBIs=
X-Received: by 2002:a05:6102:d94:b0:4de:d08f:6727 with SMTP id
 ada2fe7eead31-4f9980fc7f4mr9967163137.13.1753183536999; Tue, 22 Jul 2025
 04:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250722112050.909616-1-uwu@icenowy.me>
In-Reply-To: <20250722112050.909616-1-uwu@icenowy.me>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 22 Jul 2025 19:25:25 +0800
X-Gm-Features: Ac12FXxLmNaOOyB0s5JDwxeuilIksRxnGlyAFtVocFnRD_Uc6fPCEhU9HDxosSQ
Message-ID: <CAAT7Ki9DUJhZgqW7e4ggcgHM9K21ExAEMbK=WjOiVged0+=fCA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: add pgprot handling for RISC-V
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, 
	Yao Zi <ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042538_948127_A4900500 
X-CRM114-Status: GOOD (  14.86  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgNzoyMeKAr1BNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKPgo+IFRoZSBSSVNDLVYgU3ZwYm10IHByaXZpbGVnZWQgZXh0ZW5zaW9u
IHByb3ZpZGVzIHN1cHBvcnQgZm9yIG92ZXJyaWRpbmcKPiBwYWdlIG1lbW9yeSBjb2hlcmVuY3kg
YXR0cmlidXRlcywgYW5kLCBhbG9uZyB3aXRoIHZlbmRvciBleHRlbnNpb25zIGxpa2UKPiBYdGhl
YWRtYWUsIHN1cHBvcnRzIHBncHJvdF97d3JpdGVjb21iaW5lLG5vbmNhY2hlZH0gb24gUklTQy1W
Lgo+Cj4gQWRhcHQgdGhlIGNvZGVwYXRoIHRoYXQgbWFwcyB0dG1fd3JpdGVfY29tYmluZWQgdG8g
cGdwcm90X3dyaXRlY29tYmluZQo+IGFuZCB0dG1fbm9uY2FjaGVkIHRvIHBncHJvdF9ub25jYWNo
ZWQgdG8gUklTQy1WLCB0byBhbGxvdyBwcm9wZXIgcGFnZQo+IGFjY2VzcyBhdHRyaWJ1dGVzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9k
dWxlLmMKPiBpbmRleCBiM2ZmZmU3YjUwNjIuLmFhMTM3ZWFkNWNjNSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX21vZHVsZS5jCj4gQEAgLTc0LDcgKzc0LDggQEAgcGdwcm90X3QgdHRtX3Byb3RfZnJv
bV9jYWNoaW5nKGVudW0gdHRtX2NhY2hpbmcgY2FjaGluZywgcGdwcm90X3QgdG1wKQo+ICAjZW5k
aWYgLyogQ09ORklHX1VNTCAqLwo+ICAjZW5kaWYgLyogX19pMzg2X18gfHwgX194ODZfNjRfXyAq
Lwo+ICAjaWYgZGVmaW5lZChfX2lhNjRfXykgfHwgZGVmaW5lZChfX2FybV9fKSB8fCBkZWZpbmVk
KF9fYWFyY2g2NF9fKSB8fCBcCj4gLSAgICAgICBkZWZpbmVkKF9fcG93ZXJwY19fKSB8fCBkZWZp
bmVkKF9fbWlwc19fKSB8fCBkZWZpbmVkKF9fbG9vbmdhcmNoX18pCj4gKyAgICAgICBkZWZpbmVk
KF9fcG93ZXJwY19fKSB8fCBkZWZpbmVkKF9fbWlwc19fKSB8fCBkZWZpbmVkKF9fbG9vbmdhcmNo
X18pIHx8IFwKPiArICAgICAgIGRlZmluZWQoX19yaXNjdikKPiAgICAgICAgIGlmIChjYWNoaW5n
ID09IHR0bV93cml0ZV9jb21iaW5lZCkKPiAgICAgICAgICAgICAgICAgdG1wID0gcGdwcm90X3dy
aXRlY29tYmluZSh0bXApOwo+ICAgICAgICAgZWxzZQo+IC0tCj4gMi41MC4xCj4KClRlc3RlZC1i
eTogSGFuIEdhbyA8cmFiZW5kYS5jbkBnbWFpbC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
