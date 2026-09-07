Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30356C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d2rPSVj9jTmYoLLsL7se1booh0S8ZnaLRKEyh71tAM=; b=RDmB6Eiygd8zdy
	zb4m12TmQIJTjNTqZ7N+8kiCaXH5NfE+uE6KE+bEEXZfIxpvAz72IApS7+7Dqu0Zbo8MKTlCE1q2H
	SGBtFdfETWC+9cnG+DJ70Ax0jZfo74WI+jtWN1LBmr/sWH+D05aD+RRPOGWJ7PBJZn0znkROGW9KU
	4KEz9cm1Cd6WXrlRhrLvu/OQgWMon8E2gui5OE2ljFi1qmidI1WhjMEnPnzNV9lNAL4iqyWq3F3Mp
	sd5kuJ3tBvMvO5Q9WmhXsIhllROiVhuTc2CKX47TS5/daq8qEhfwd4DX0aPixkxe2r4DKiqknzkGh
	XSdqNlazYQDt0GuXv3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UeA-00000006G92-2s7P;
	Mon, 07 Sep 2026 08:24:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ue7-00000006G6h-0t8r
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 08:24:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47de0093c42so3057105f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 01:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788769445; cv=none;
        d=google.com; s=arc-20260327;
        b=H17+MX7jeG3M1UZb2+py8wfZWpweainB+ZOUHO3esA6kK0TYbirxU/y/+8xqDerFy8
         gAGXgnEoleqNZ958UDL5jzxnrm8I469Hbe39KPIPayea90qiTK4hxYSdnoS2fFKvsPsG
         oUq9nytDcD0O7f4SXysDe92miqtm+OKCo6+J7NsQCy9CPbz6FvA9ATOu2oQOwpmqfHQA
         3/7yRyhDr8ouV2ZxVBLMHqn94pMG+wbHqNWP3Mv14aK1bGtQA2sNa46sVZqP3VAZgfs7
         nP3OaF2h58RqCK/KtRLd1Xqid4KHL8YMnWcsGJttAeCZfu8xB+jpDt/c9mRDBSns11Ae
         k0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        fh=zSJcxhS/AjWY7OBIs9Q1YD66AvKw2Lpztwqpu+jDeic=;
        b=IWtZ+YtxzTTcYSDxatzIrsUhV4++iog16dwvaRqoKsLo5oLVu3INlSgwQs4VNjGtlT
         yVpKoB6gajwFJs7DP4nxBg5p5MI/NjOzyllKIH3N3Ci9li9VturHjCd6tg0BFpLyM28z
         TIMEuhC1k1D413DgJ+JVFPMe1x8n6v6qtSRTtusRDSS6AnyqWzyEwhHieslZrA2Agkb5
         B5owHFMpky+cypx721RPjVW1Uhyw2N/yJvO8wqzpau85P1Hpg8kgIFJWiAD3/BcHVU+U
         yEPBMdA9aExFmhaDyAz1PSfwrdrYAHmsG4u72Aon2CXFzIaadBVcoGDgcRhgsq01JpaW
         o7jw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788769445; x=1789374245; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        b=M0teZe9Dzlc0cLLpRLVcVC5P8FhsCY6tBRrF+n59FoPmufx3AcA8tZCsV2CQ4l4ewc
         N+I9srguHiQtST7ShDEjrE49qxYv0hl9moaSRm5vGol81Xtg6dZYgg+00DSTyipP4/aT
         X8BGw6cYM0AWb6U8kvoAxl8LGAOo8d9fPlUdVtwOGjyIcFk9z+uwJozoJH7fCuMqMXrb
         xr6RSlYlXWt5xY81JKpFYgA5ro5sWWk4loNqMTMircj8J342WlneUYxlctjuC67bED48
         w9wa5gahzimnDDe1dFe8ADX68YadItVgoGg8F1CWqHsZP3zlquMbE+u3XhhCh+SYDtsE
         2bsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769445; x=1789374245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        b=OWGD6Zv9MXhCCRXh8vKBoseAzCGg5KuMCWRmGttprAXAUgZFRnAngWT1nCL51wNnqJ
         7wAQTwQO0XkM5X1acNeubLB5tg10haBgoyou/8dvoJUoZOVQEDpRHzkrg2efVGH4oCGs
         2h75rIk/DLEbhYmhLrxGKVHvdba3hF+w5YiO+zkDZkhzIWmcPIb4mwcpQHcXbPAtsOsQ
         aXGcf1qUQTYIOj6Iql1M1g3YKEC72KT7ykjPxSeQD/DiPi2ChLgLm/8ZAQUhnMgu5IMB
         /PuYyeZk6S+erCm6Vb6bW3AIxHXWAH+GsWcwNzOl5ytqQlWN4sxUQkFzqb/Sm2WKBhD6
         abQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpJ6KKyHK8u4YOmRpv9nrWnQzCF2zTHRH93/hAAJaqITLpWYe+wZPErE4gHjofxbtUHiZcAR4/1N3N3w==@lists.infradead.org
X-Gm-Message-State: AFuF++nsd/IaCETV9yUVIenDhMLSWbBNJJbKhtXwI6akLLTU4B+hww2y
	JzBMdJh/UibLpgNPjWxGyBJXGFO+aKm5gDWWWHMpkDkak6UbL0H/fRfu+xmsR2Orq7leN6jFT8r
	PF8tfm77y7GR8jmcKvEcKxLP39nP1E8vQ39Lr1Q+a+Q==
X-Gm-Gg: AYBFou2DmjdNfEjDBV0x8eUdCuh32QuScedOtloydSizqbA58LncZuhveF9kOP0owtm
	YanXrpubmNjDx7C/j2TXbB96sRduk2zfg9X2rfJ5gy865cm4/cP+Y2dAOuJRLd3xizOlNgkrEbX
	3TrJr3ImRK+31wL80CpANypWjyFvzm8MbZHJsgurX5qo2QpqrtdAl276uSrEOwCt4Gs8Tf3kF5L
	Mb/0SkZ5XIvWzSskkkF/DAwZ1bI1oSaHRKx+IyPRbfj1O1suwLihe/ryRhpUyniYG7d+jaXEZwE
	Jbnde79JO8OxLwZjgVwibOnGaxQjRePX2qLeZ2xZcvxV1mDTIQ9+Ggj8b1oFtp5/Jxds85xuqK1
	ej/gf1nBuqIQc54Kl7Rvg7wa2Zu30tGYMRQPZWunn56CfArhOVcRWgCoLQn06iik=
X-Received: by 2002:a05:6000:2f82:b0:485:8c16:5ef7 with SMTP id
 ffacd0b85a97d-4858c166148mr18091871f8f.49.1788769445126; Mon, 07 Sep 2026
 01:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Sep 2026 13:53:53 +0530
X-Gm-Features: AcwNN1UOItNX8Zqa8yZNak7eVCaaP3xVxuE0lRNcn1acCna6Fm_hGPjVZ5FCvUw
Message-ID: <CAAhSdy1zxu0cGnvpZEq_mPYRj07m7a+TA_8f0-sa=Mu7xtXvjA@mail.gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate
 multiple page table pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_012407_290905_E95F973B 
X-CRM114-Status: GOOD (  15.38  )
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

T24gV2VkLCBTZXAgMiwgMjAyNiBhdCAxMDoxMeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IEFkZCB2bV9hbGxvY19wYWdlX3RhYmxlX3BhZ2Vz
KCkgYW5kIHVzZSBpdCB0aHJvdWdob3V0IGFyY2ggY29kZSB0byByZXBsYWNlCj4gb3BlbiBjb2Rl
ZCBlcXVpdmFsZW50cy4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Cj4gUmV2
aWV3ZWQtYnk6IEl0YXJ1IEtpdGF5YW1hIDxpdGFydS5raXRheWFtYUBmdWppdHN1LmNvbT4KPiBU
ZXN0ZWQtYnk6IEl0YXJ1IEtpdGF5YW1hIDxpdGFydS5raXRheWFtYUBmdWppdHN1LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KCkxH
VE0uCgpGb3IgS1ZNIFJJU0MtVjoKQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+CgpSZWdhcmRzLApBbnVwCgoKPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2luY2x1ZGUva3ZtX3V0aWwuaCAgICB8IDkgKysrKysrKy0tCj4gIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9saWIvYXJtNjQvcHJvY2Vzc29yLmMgfCA0ICstLS0KPiAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyB8IDQgKy0tLQo+ICB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMgIHwgOCArKy0tLS0t
LQo+ICA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91
dGlsLmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbC5oCj4g
aW5kZXggZDlkMzlhODg5NGUyLi5jNTZmMzQyYjE2ZmQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWwuaAo+ICsrKyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsLmgKPiBAQCAtMTAxMywxMCArMTAxMywx
NSBAQCBzdGF0aWMgaW5saW5lIGdwYV90IHZtX3BoeV9wYWdlX2FsbG9jKHN0cnVjdCBrdm1fdm0g
KnZtLCBncGFfdCBtaW5fZ3BhLAo+ICAgICAgICAgcmV0dXJuIHZtX3BoeV9wYWdlc19hbGxvYyh2
bSwgMSwgbWluX2dwYSwgbWVtc2xvdCk7Cj4gIH0KPgo+ICtzdGF0aWMgaW5saW5lIGdwYV90IHZt
X2FsbG9jX3BhZ2VfdGFibGVfcGFnZXMoc3RydWN0IGt2bV92bSAqdm0sIHNpemVfdCBucl9wYWdl
cykKPiArewo+ICsgICAgICAgcmV0dXJuIHZtX3BoeV9wYWdlc19hbGxvYyh2bSwgbnJfcGFnZXMs
IEtWTV9HVUVTVF9QQUdFX1RBQkxFX01JTl9QQUREUiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm0tPm1lbXNsb3RzW01FTV9SRUdJT05fUFRdKTsKPiArfQo+ICsKPiAgc3Rh
dGljIGlubGluZSBncGFfdCB2bV9hbGxvY19wYWdlX3RhYmxlKHN0cnVjdCBrdm1fdm0gKnZtKQo+
ICB7Cj4gLSAgICAgICByZXR1cm4gdm1fcGh5X3BhZ2VfYWxsb2Modm0sIEtWTV9HVUVTVF9QQUdF
X1RBQkxFX01JTl9QQUREUiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+
bWVtc2xvdHNbTUVNX1JFR0lPTl9QVF0pOwo+ICsgICAgICAgcmV0dXJuIHZtX2FsbG9jX3BhZ2Vf
dGFibGVfcGFnZXModm0sIDEpOwo+ICB9Cj4KPiAgLyoKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2xpYi9hcm02NC9wcm9jZXNzb3IuYyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9saWIvYXJtNjQvcHJvY2Vzc29yLmMKPiBpbmRleCAwMTMyNWJmNGQzNmYu
LjJkY2FhMmM0YTAzOCAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
bGliL2FybTY0L3Byb2Nlc3Nvci5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2xpYi9hcm02NC9wcm9jZXNzb3IuYwo+IEBAIC0xMTUsOSArMTE1LDcgQEAgdm9pZCB2aXJ0X2Fy
Y2hfcGdkX2FsbG9jKHN0cnVjdCBrdm1fdm0gKnZtKQo+ICAgICAgICAgaWYgKHZtLT5tbXUucGdk
X2NyZWF0ZWQpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+IC0gICAgICAgdm0tPm1tdS5w
Z2QgPSB2bV9waHlfcGFnZXNfYWxsb2Modm0sIG5yX3BhZ2VzLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX0dVRVNUX1BBR0VfVEFCTEVfTUlOX1BBRERSLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm0tPm1lbXNsb3RzW01F
TV9SRUdJT05fUFRdKTsKPiArICAgICAgIHZtLT5tbXUucGdkID0gdm1fYWxsb2NfcGFnZV90YWJs
ZV9wYWdlcyh2bSwgbnJfcGFnZXMpOwo+ICAgICAgICAgdm0tPm1tdS5wZ2RfY3JlYXRlZCA9IHRy
dWU7Cj4gIH0KPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGli
L3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNj
di9wcm9jZXNzb3IuYwo+IGluZGV4IGRlZDU0MjlmMzQ0OC4uYzE3NWRjZDE0MTE0IDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMK
PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5j
Cj4gQEAgLTY5LDkgKzY5LDcgQEAgdm9pZCB2aXJ0X2FyY2hfcGdkX2FsbG9jKHN0cnVjdCBrdm1f
dm0gKnZtKQo+ICAgICAgICAgaWYgKHZtLT5tbXUucGdkX2NyZWF0ZWQpCj4gICAgICAgICAgICAg
ICAgIHJldHVybjsKPgo+IC0gICAgICAgdm0tPm1tdS5wZ2QgPSB2bV9waHlfcGFnZXNfYWxsb2Mo
dm0sIG5yX3BhZ2VzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
S1ZNX0dVRVNUX1BBR0VfVEFCTEVfTUlOX1BBRERSLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdm0tPm1lbXNsb3RzW01FTV9SRUdJT05fUFRdKTsKPiArICAgICAg
IHZtLT5tbXUucGdkID0gdm1fYWxsb2NfcGFnZV90YWJsZV9wYWdlcyh2bSwgbnJfcGFnZXMpOwo+
ICAgICAgICAgdm0tPm1tdS5wZ2RfY3JlYXRlZCA9IHRydWU7Cj4gIH0KPgo+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMKPiBpbmRleCBmYjlk
YWI5MmQ0ZDEuLjMzZjQ5ZDc0M2I1ZiAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMKPiBAQCAtMjAsOSArMjAsNyBAQCB2b2lkIHZp
cnRfYXJjaF9wZ2RfYWxsb2Moc3RydWN0IGt2bV92bSAqdm0pCj4gICAgICAgICBpZiAodm0tPm1t
dS5wZ2RfY3JlYXRlZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gLSAgICAgICBncGEg
PSB2bV9waHlfcGFnZXNfYWxsb2Modm0sIFBBR0VTX1BFUl9SRUdJT04sCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBLVk1fR1VFU1RfUEFHRV9UQUJMRV9NSU5fUEFERFIsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+bWVtc2xvdHNbTUVNX1JFR0lP
Tl9QVF0pOwo+ICsgICAgICAgZ3BhID0gdm1fYWxsb2NfcGFnZV90YWJsZV9wYWdlcyh2bSwgUEFH
RVNfUEVSX1JFR0lPTik7Cj4gICAgICAgICBtZW1zZXQoYWRkcl9ncGEyaHZhKHZtLCBncGEpLCAw
eGZmLCBQQUdFU19QRVJfUkVHSU9OICogdm0tPnBhZ2Vfc2l6ZSk7Cj4KPiAgICAgICAgIHZtLT5t
bXUucGdkID0gZ3BhOwo+IEBAIC0zOCw5ICszNiw3IEBAIHN0YXRpYyB1NjQgdmlydF9hbGxvY19y
ZWdpb24oc3RydWN0IGt2bV92bSAqdm0sIGludCByaSkKPiAgewo+ICAgICAgICAgdTY0IHRhZGRy
Owo+Cj4gLSAgICAgICB0YWRkciA9IHZtX3BoeV9wYWdlc19hbGxvYyh2bSwgIHJpIDwgNCA/IFBB
R0VTX1BFUl9SRUdJT04gOiAxLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
S1ZNX0dVRVNUX1BBR0VfVEFCTEVfTUlOX1BBRERSLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm0tPm1lbXNsb3RzW01FTV9SRUdJT05fUFRdKTsKPiArICAgICAgIHRhZGRy
ID0gdm1fYWxsb2NfcGFnZV90YWJsZV9wYWdlcyh2bSwgcmkgPCA0ID8gUEFHRVNfUEVSX1JFR0lP
TiA6IDEpOwo+ICAgICAgICAgbWVtc2V0KGFkZHJfZ3BhMmh2YSh2bSwgdGFkZHIpLCAweGZmLCBQ
QUdFU19QRVJfUkVHSU9OICogdm0tPnBhZ2Vfc2l6ZSk7Cj4KPiAgICAgICAgIHJldHVybiAodGFk
ZHIgJiBSRUdJT05fRU5UUllfT1JJR0lOKQo+IC0tCj4gMi41NS4wLjk2Ni5nNjY3M2FjZWYzOC1n
b29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
