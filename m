Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE53EB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 06:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmmEvV6F5gxUmKNIJOcoU56iMRHEirrgcBcD9v8YREo=; b=UwwD9W0PjAIE34
	vb3NiuH497pkMqTCPrxJw8Q1ZWodYwGnSVGfR8he5pbMNycygMRS3FbxCv70bPem6q1Bs0Ahs5fl4
	2fR3pnqQNVjju+gYZR8j4twAcCDrmWdjTLrknJoYPuZWxsQwQd1t3q+fr9XdXvq2ZBcaOlS5lRC3t
	LPOL/sgmxBbX2kfJeXhUcSNKJud9fwzw3kTn2sXfdpf46ydFj+XvUZKdCM2oSQ/39DYFnHS7z50rQ
	wi2aOAkZrq/lTEUnpdhUfmsOtKFmHknKZJ5VeGribXxGGRHXgCjVrJB466HOjo0jn+mq6LRX5xDbm
	JZogPb43EChc+cMqPdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmEN-007O2D-0Y;
	Wed, 06 Sep 2023 06:41:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmEJ-007O0m-1r
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 06:41:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-402d0eda361so24599435e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 23:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693982493; x=1694587293; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDrXgceSRA6nWxSqvxXedEAqqqoYTPyIJVyrWo9VKf8=;
        b=Rh7wlPnZwf3M2L1F6CqUXgqC1vZj5TJFlze6CznJnG+9P61PD0M9JNtxtgIFaEdbOc
         boK6vYtWJUhBYrkgL9KsOPwQdqAILIkdNXuxgKLixqfPGMwJfmzePaFZn9GUmH72h/I1
         Ss3thTRUY4TcjMlPIAhwTYxtDYw5m5Y+AsAd3BevdxG6icw6zdvDp+SaoKDTD9KA/3b4
         IF1oc6Sz2QhG2P15Ktw7YTsQQ6RkJXG8HH8CHp9RaLMtV8w6e6j38ZsYfefrbg0qpzu+
         g9LpQaMWJIh7Q83pTPHEKyU5ZOT+mmRRqBolNIFJpngPhm76yo/fDEVpxP4lkDY6DH1H
         /M+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693982493; x=1694587293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDrXgceSRA6nWxSqvxXedEAqqqoYTPyIJVyrWo9VKf8=;
        b=WbJvpwuqvdl62mhm+WKQ1KU6lWsP4tOeX0GlIMnKGMwL4iK10doZNfedRWP0xg61Lb
         odrEzksHLidO0dEsTgSbHOQuiN2rnbb1QoaLNeW3fMeCJTkBI4k/XJaJqN2BTkEjcAdu
         NbFlPg/SfTMj5q8LmNZae99ptgQYBvqUHSSz79T7DtkwzH9EyFVoiP359Hdz91DbPNz0
         cUn4HEzfxsC0/x2zwnnmGjul7kcEBoWCuga1oUHx7aMZjz+ZVVba/8ZCxfEcQ/QBvs9z
         dPK/KVgrqx77dykyroE0zItP6OyYBKRC3hNBc/ROdZT7Vk3z01hDDybNGInx2xnJFIk5
         44BQ==
X-Gm-Message-State: AOJu0Yz7lxeHD+IV9FdZ3EI/XoX1v/eMxNOUcv0NBhmXZBY6LQeNt73G
	lrml2GjWuEnyW8gcXQVhgk2kpw==
X-Google-Smtp-Source: AGHT+IGX0i5tAkcMDPeTKOwlfoH2ZHWjyq3skD2KqOfwczWV54QzQ/+ExzzCATYleUpKxouAAc9edA==
X-Received: by 2002:a5d:6b49:0:b0:31a:ed75:75d6 with SMTP id x9-20020a5d6b49000000b0031aed7575d6mr1639449wrw.15.1693982493183;
        Tue, 05 Sep 2023 23:41:33 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id m14-20020a056000174e00b0031f3b04e7cdsm11905338wrf.109.2023.09.05.23.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 23:41:32 -0700 (PDT)
Date: Wed, 6 Sep 2023 08:41:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Sean Christopherson <seanjc@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, David Matlack <dmatlack@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Lei Wang <lei4.wang@intel.com>, Like Xu <likexu@tencent.com>, Peter Gonda <pgonda@google.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, David Woodhouse <dwmw@amazon.co.uk>, 
	Michal Luczaj <mhal@rbox.co>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/8] KVM: arm64: selftest: Split arch_timer test code
Message-ID: <20230906-6996fca9840e6de7b75692ec@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <c87337cfd7fb135e2efed589360a78c26a402eac.1693659382.git.haibo1.xu@intel.com>
 <20230904-11e853ffe3d8e9cf9ec6079d@orel>
 <CAJve8onwjBQcbVy75qyOF3A51-T0WyBkmeCV_wOZvzaPcrBVFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8onwjBQcbVy75qyOF3A51-T0WyBkmeCV_wOZvzaPcrBVFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_234135_614321_3AB49E08 
X-CRM114-Status: GOOD (  13.77  )
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

T24gV2VkLCBTZXAgMDYsIDIwMjMgYXQgMTA6MTQ6NTJBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gTW9uLCBTZXAgNCwgMjAyMyBhdCA5OjI04oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU2F0LCBTZXAgMDIsIDIwMjMgYXQg
MDg6NTk6MjRQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Ci4uLgo+ID4gPiArCj4gPiA+ICsjaW5j
bHVkZSAia3ZtX3V0aWwuaCIKPiA+ID4gKwo+ID4gPiArI2RlZmluZSBOUl9WQ1BVU19ERUYgICAg
ICAgICAgICA0Cj4gPiA+ICsjZGVmaW5lIE5SX1RFU1RfSVRFUlNfREVGICAgICAgIDUKPiA+ID4g
KyNkZWZpbmUgVElNRVJfVEVTVF9QRVJJT0RfTVNfREVGICAgIDEwCj4gPiA+ICsjZGVmaW5lIFRJ
TUVSX1RFU1RfRVJSX01BUkdJTl9VUyAgICAxMDAKPiA+ID4gKyNkZWZpbmUgVElNRVJfVEVTVF9N
SUdSQVRJT05fRlJFUV9NUyAgICAyCj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgbXNlY3NfdG9fdXNl
Y3MobXNlYykgICAgKChtc2VjKSAqIDEwMDBMTCkKPiA+Cj4gPiBJJ2QgbW92ZSB0aGUgYWJvdmUg
dG8gaW5jbHVkZS90ZXN0X3V0aWwuaAo+ID4KPiAKPiBZZXMsIG1zZWNzX3RvX3VzZWNzKCkgbWFj
cm8gc2hvdWxkIGJlIGEgY29tbW9uIEFQSSBmb3IgYWxsIHRoZSB0ZXN0cy4KPiAKPiA+ID4gKwo+
ID4gPiArI2RlZmluZSBHSUNEX0JBU0VfR1BBICAgIDB4ODAwMDAwMFVMTAo+ID4gPiArI2RlZmlu
ZSBHSUNSX0JBU0VfR1BBICAgIDB4ODBBMDAwMFVMTAo+ID4KPiA+IFRoZXNlIGRlZmluZXMgYmVs
b25nIGluIGFhcmNoNjQvYXJjaF90aW1lci5jCj4gPgo+IAo+IFRoZXNlIDIgZGVmaW5lcyB3ZXJl
IGFsc28gZGVmaW5lZCBpbiBvdGhlciB0ZXN0IGNhc2VzLCBzaGFsbCB3ZSBtb3ZlIHRoZW0KPiB0
byBhbiBhYXJjaDY0IHNwZWNpZmljIGhlYWRlciBmaWxlPyBNYXliZQo+IHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9pbmNsdWRlL2FhcmNoNjQvZ2ljLmg/CgpFdmVuIHRob3VnaCBjdXJyZW50
bHkgYWxsIHRoZSBhYXJjaDY0IHRlc3RzIHRoYXQgdXNlIHRoZSBnaWMgYXJlIHVzaW5nCnRoZXNl
IGRlZmluZXMgZm9yIHRoZSBiYXNlIGFkZHJlc3NlcywgZWFjaCB0ZXN0IGlzIGZyZWUgdG8gY2hv
b3NlIHdoYXRldmVyCmJhc2UgYWRkcmVzc2VzIGl0IGxpa2VzLiBJJ2QganVzdCBtb3ZlIHRoZW0g
YmFjayB0byBhYXJjaDY0L2FyY2hfdGltZXIuYwpmb3Igbm93LiBDb25zb2xpZGF0aW5nIHRoZW0g
aW50byBzaGFyZWQsIGRlZmF1bHQgYmFzZSBhZGRyZXNzZXMsIGlmIGRvbmUKYXQgYWxsLCBpcyB3
b3JrIGZvciBhbm90aGVyIHNlcmllcy4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
