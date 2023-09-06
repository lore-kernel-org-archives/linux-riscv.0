Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC475EB8FB3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cYpJmeyAtAeZF+/p76CTMhkIP6frQ1PPOHGKrh8QCo=; b=zGNs0i0dML6uvk
	vV5TGctEAgMorjt6bcFwpejL3khF26cTbp8aCjhIsH28t4Ye+wLw0nAajwb4ckCV370CBL2sY4Yh9
	GCoQHKR6DK+qfw8djcYullmRbNER0H6TaBR8IFx5/g43nYnkY1nq02sR+wmnHV1S5GBNJjWthTj6X
	Q/VjOjKiJIBfsaoP54EDdBmwYHCv+bQ/VJU/OGEHICjlvLNrEGKixLrjK7RR/g7UJHuRTeSTAbcpm
	Fazt5TVBrAfsVudzCFgND1FaxzOQYmzT+nNE5cwlnZz4pBnK/h4Mg3plR4h9OmgG8pXhBLEQ4MJhS
	sHnzHP029pb2uXQpYKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdssk-00A6is-1H;
	Wed, 06 Sep 2023 13:47:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdsse-00A6g1-2a
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 13:47:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fef56f7248so35577895e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694008057; x=1694612857; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y8t/IGzui+H5qdVxzJl2s3G8bPpmqSY5irt+QEZLU50=;
        b=E6UDeQl5A9C0QUikfRVLlCRta5+oKhFe+7T6hX3VRml1FTHhYow5cYtBGKe11ZdJvM
         8K+44V/RkyKb7Az52lJE1Yi5jYJYllUNlB7Sm7ghRidU8IGLr9QcK/l7NcRKVPzpKv9m
         /isyHtrf+5PPdk7R6yL2cVFyx9U1Xam/NUBz+5wn3oXl/uxUBDwkd/nHBZWk6tVelcSu
         /dQL8A0o4DjI0p0aCqInfyh5dpYbX+uFQI80BsdYEqQjdiOKoxrQ9oMztoGc6hCgls5y
         bRTI/ALJqb+sVZMsBtmz5mY4nwWwf/socAAwjwR3tZaa+hKR6E4qdEAt0cqAtjPIwZUr
         +PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694008057; x=1694612857;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8t/IGzui+H5qdVxzJl2s3G8bPpmqSY5irt+QEZLU50=;
        b=XQmyHpi3K7vRZKRc43STVkPnXBDq0XtzC8IuT0PYhyvs+dCAA9PI5dVPqE6ZKRfQ8d
         nRwL/4HLaLctlxvzsdbP62kY10JDXaLu0dJgQbRqYNZpGCR++Q9e2R5ZxjKPHfA5eUfF
         8cH+fNSkWFLR744cVNZha1uFaYoC+cu6W5HfKbm7zo1Ahvce7vYsb2e+/3PYw28QG318
         EF8NeOWb7W6JgwBMZYYiAqLprubCb50DyCuBU8NTJYkl8gSTNqvTSq2g76z5c2cw3RsR
         Pk9vP3f8C6nHlW3b6TrC6YQHymAvj+/o13jvx5QlC7+wZqLoP7dW4RunDr1UlfrD7/if
         h5AQ==
X-Gm-Message-State: AOJu0Yy9OAbBckLzMWVZKcJUopVF7jTCg7tcd7Ld73tugaSI77nicdOo
	jZy0Wxx727VcPnqa5yRHBF3byw==
X-Google-Smtp-Source: AGHT+IH2baeDANzYLEU+6JGXtK6JPZZwhj4Y9FCTJIRzFumqNrzyHLa/aBqci+k9LlX/9np1HUfmTQ==
X-Received: by 2002:a5d:5087:0:b0:317:ef76:b773 with SMTP id a7-20020a5d5087000000b00317ef76b773mr2318629wrt.45.1694008056476;
        Wed, 06 Sep 2023 06:47:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x12-20020a05600c21cc00b003fed78b03b4sm19716726wmj.20.2023.09.06.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 06:47:34 -0700 (PDT)
Date: Wed, 6 Sep 2023 15:47:31 +0200
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
	wchen <waylingii@gmail.com>, Sean Christopherson <seanjc@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Lei Wang <lei4.wang@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Like Xu <likexu@tencent.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, 
	zhang songyi <zhang.songyi@zte.com.cn>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/8] tools: riscv: Add header file csr.h
Message-ID: <20230906-11348d34e52289c8f52be8f9@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <8173daae52720dbdabbd88a5d412f653e6706de1.1693659382.git.haibo1.xu@intel.com>
 <20230904-06f09083d5190fd50e53b1ea@orel>
 <CAJve8on7Yi7cDuXOVznuRdTvfUhig2hZy8g72nvnHkM7omoVAw@mail.gmail.com>
 <20230906-c35fdc0e07d2cc0f9cb93203@orel>
 <CAJve8ok-Z6VCziFj5t0=BoouZ-VLyGaqEng-dYGTFnP-CR36kw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8ok-Z6VCziFj5t0=BoouZ-VLyGaqEng-dYGTFnP-CR36kw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_064740_854515_629ED4C0 
X-CRM114-Status: GOOD (  27.05  )
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

T24gV2VkLCBTZXAgMDYsIDIwMjMgYXQgMDU6MDk6MjBQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAzOjEz4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBTZXAgMDYsIDIwMjMgYXQg
MDI6MzU6NDJQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgU2VwIDQsIDIw
MjMgYXQgOTozM+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gU2F0LCBTZXAgMDIsIDIwMjMgYXQgMDg6NTk6MjVQTSAr
MDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+ID4gPiBCb3Jyb3cgdGhlIGNzciBkZWZpbml0aW9u
cyBhbmQgb3BlcmF0aW9ucyBmcm9tIGtlcm5lbCdzCj4gPiA+ID4gPiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oIHRvIHRvb2xzLyBmb3IgcmlzY3YuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiA+ID4gPiAtLS0K
PiA+ID4gPiA+ICB0b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgNTIxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUyMSBp
bnNlcnRpb25zKCspCj4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL3Rvb2xzL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3NyLmgKPiA+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjRlODZjODJhYWNiZAo+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4g
PiA+ID4gKysrIGIvdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ID4gPiA+ID4g
QEAgLTAsMCArMSw1MjEgQEAKPiA+ID4gPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5ICovCj4gPiA+ID4gPiArLyoKPiA+ID4gPiA+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMTUgUmVnZW50cyBvZiB0aGUgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlhCj4gPiA+ID4gPiAr
ICovCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArI2lmbmRlZiBfQVNNX1JJU0NWX0NTUl9ICj4gPiA+
ID4gPiArI2RlZmluZSBfQVNNX1JJU0NWX0NTUl9ICj4gPiA+ID4gPiArCj4gPiA+ID4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsvKiBTdGF0dXMgcmVn
aXN0ZXIgZmxhZ3MgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIFNSX1NJRSAgICAgICAgICAgICAgIF9B
QygweDAwMDAwMDAyLCBVTCkgLyogU3VwZXJ2aXNvciBJbnRlcnJ1cHQgRW5hYmxlICovCj4gPiA+
ID4gPiArI2RlZmluZSBTUl9NSUUgICAgICAgICAgICAgICBfQUMoMHgwMDAwMDAwOCwgVUwpIC8q
IE1hY2hpbmUgSW50ZXJydXB0IEVuYWJsZSAqLwo+ID4gPiA+ID4gKyNkZWZpbmUgU1JfU1BJRSAg
ICAgICAgICAgICAgX0FDKDB4MDAwMDAwMjAsIFVMKSAvKiBQcmV2aW91cyBTdXBlcnZpc29yIElF
ICovCj4gPiA+ID4gPiArI2RlZmluZSBTUl9NUElFICAgICAgICAgICAgICBfQUMoMHgwMDAwMDA4
MCwgVUwpIC8qIFByZXZpb3VzIE1hY2hpbmUgSUUgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIFNSX1NQ
UCAgICAgICAgICAgICAgIF9BQygweDAwMDAwMTAwLCBVTCkgLyogUHJldmlvdXNseSBTdXBlcnZp
c29yICovCj4gPiA+ID4gPiArI2RlZmluZSBTUl9NUFAgICAgICAgICAgICAgICBfQUMoMHgwMDAw
MTgwMCwgVUwpIC8qIFByZXZpb3VzbHkgTWFjaGluZSAqLwo+ID4gPiA+ID4gKyNkZWZpbmUgU1Jf
U1VNICAgICAgICAgICAgICAgX0FDKDB4MDAwNDAwMDAsIFVMKSAvKiBTdXBlcnZpc29yIFVzZXIg
TWVtb3J5IEFjY2VzcyAqLwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyNkZWZpbmUgU1JfRlMgICAg
ICAgICAgICAgICAgX0FDKDB4MDAwMDYwMDAsIFVMKSAvKiBGbG9hdGluZy1wb2ludCBTdGF0dXMg
Ki8KPiA+ID4gPiA+ICsjZGVmaW5lIFNSX0ZTX09GRiAgICBfQUMoMHgwMDAwMDAwMCwgVUwpCj4g
PiA+ID4gPiArI2RlZmluZSBTUl9GU19JTklUSUFMICAgICAgICBfQUMoMHgwMDAwMjAwMCwgVUwp
Cj4gPiA+ID4gPiArI2RlZmluZSBTUl9GU19DTEVBTiAgX0FDKDB4MDAwMDQwMDAsIFVMKQo+ID4g
PiA+ID4gKyNkZWZpbmUgU1JfRlNfRElSVFkgIF9BQygweDAwMDA2MDAwLCBVTCkKPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsjZGVmaW5lIFNSX1ZTICAgICAgICAgICAgICAgIF9BQygweDAwMDAwNjAw
LCBVTCkgLyogVmVjdG9yIFN0YXR1cyAqLwo+ID4gPiA+ID4gKyNkZWZpbmUgU1JfVlNfT0ZGICAg
IF9BQygweDAwMDAwMDAwLCBVTCkKPiA+ID4gPiA+ICsjZGVmaW5lIFNSX1ZTX0lOSVRJQUwgICAg
ICAgIF9BQygweDAwMDAwMjAwLCBVTCkKPiA+ID4gPiA+ICsjZGVmaW5lIFNSX1ZTX0NMRUFOICBf
QUMoMHgwMDAwMDQwMCwgVUwpCj4gPiA+ID4gPiArI2RlZmluZSBTUl9WU19ESVJUWSAgX0FDKDB4
MDAwMDA2MDAsIFVMKQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyNkZWZpbmUgU1JfWFMgICAgICAg
ICAgICAgICAgX0FDKDB4MDAwMTgwMDAsIFVMKSAvKiBFeHRlbnNpb24gU3RhdHVzICovCj4gPiA+
ID4gPiArI2RlZmluZSBTUl9YU19PRkYgICAgX0FDKDB4MDAwMDAwMDAsIFVMKQo+ID4gPiA+ID4g
KyNkZWZpbmUgU1JfWFNfSU5JVElBTCAgICAgICAgX0FDKDB4MDAwMDgwMDAsIFVMKQo+ID4gPiA+
ID4gKyNkZWZpbmUgU1JfWFNfQ0xFQU4gIF9BQygweDAwMDEwMDAwLCBVTCkKPiA+ID4gPiA+ICsj
ZGVmaW5lIFNSX1hTX0RJUlRZICBfQUMoMHgwMDAxODAwMCwgVUwpCj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArI2RlZmluZSBTUl9GU19WUyAgICAgKFNSX0ZTIHwgU1JfVlMpIC8qIFZlY3RvciBhbmQg
RmxvYXRpbmctUG9pbnQgVW5pdCAqLwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyNpZm5kZWYgQ09O
RklHXzY0QklUCj4gPiA+ID4KPiA+ID4gPiBIb3cgZG8gd2UgZW5zdXJlIENPTkZJR182NEJJVCBp
cyBzZXQ/Cj4gPiA+ID4KPiA+ID4KPiA+ID4gQ3VycmVudGx5LCBubyBleHBsaWNpdCBjaGVja2lu
ZyBmb3IgdGhpcy4KPiA+ID4gU2hhbGwgd2UgYWRkIGEgZ2F0ZWtlZXBlciBpbiB0aGlzIGZpbGUg
dG8gZW5zdXJlIGl0IGlzIHNldD8KPiA+Cj4gPiBOb3QgaW4gdGhpcyBmaWxlLCBzaW5jZSB0aGlz
IGZpbGUgaXMgc2hhcmVkIGJ5IGFsbCB0aGUgdG9vbHMgYW5kLi4uCj4gPgo+ID4gPgo+ID4gPiAj
aWZuZGVmIENPTkZJR182NEJJVAo+ID4gPiAjZXJyb3IgIkNPTkZJR182NEJJVCB3YXMgbm90IHNl
dCIKPiA+ID4gI2VuZGlmCj4gPgo+ID4gLi4ud2UnbGwgc3VyZWx5IGhpdCB0aGlzIGVycm9yIHJp
Z2h0IG5vdyBzaW5jZSBub3RoaW5nIGlzIHNldHRpbmcKPiA+IENPTkZJR182NEJJVCB3aGVuIGNv
bXBpbGluZyBLVk0gc2VsZnRlc3RzLgo+ID4KPiA+IFdlIG5lZWQgdG8gZGVmaW5lIENPTkZJR182
NEJJVCBpbiB0aGUgYnVpbGQgc29tZXdoZXJlIHByaW9yIHRvIGFueQo+ID4gaGVhZGVycyB3aGlj
aCBkZXBlbmQgb24gaXQgYmVpbmcgaW5jbHVkZWQuIE1heWJlIHdlIGNhbiBzaW1wbHkKPiA+IGFk
ZCAtRENPTkZJR182NEJJVCB0byBDRkxBR1MsIHNpbmNlIGFsbCBLVk0gc2VsZnRlc3RzIHN1cHBv
cnRlZAo+ID4gYXJjaGl0ZWN0dXJlcyBhcmUgNjQtYml0Lgo+ID4KPiAKPiBNYWtlIHNlbnNlISBB
bm90aGVyIG9wdGlvbiBjYW4gYmUganVzdCBhZGQgIiNkZWZpbmUgQ09ORklHXzY0QklUIiBhdAo+
IHRoZSBiZWdpbiBvZiBjc3IuaAoKTm9wZSwgb3RoZXIgdG9vbHMvdGVzdHMgbWF5IHdhbnQgdG8g
aW5jbHVkZSBjc3IuaCBzb21lZGF5IGFuZCB0aGV5IG1heSBvcgptYXkgbm90IGJlIHRhcmdldGlu
ZyA2NC1iaXQuIFRoZXknbGwgbmVlZCB0byBhcHByb3ByaWF0ZWx5IHNldApDT05GSUdfNjRCSVQg
dGhlbXNlbHZlcy4gV2UgY291bGQgcmVxdWlyZQoKI2RlZmluZSBDT05GSUdfNjRCSVQKI2luY2x1
ZGUgPGFzbS9jc3IuaD4KCmV2ZXJ5d2hlcmUgd2UgaW5jbHVkZSBpdCwgYnV0IHRoYXQncyBlcnJv
ciBwcm9uZSBzaW5jZSBpdCdsbCBnZXQgZm9yZ290dGVuCmFuZCBub3RoaW5nIHdpbGwgY29tcGxh
aW4gdW5sZXNzIGEgZGVmaW5lIHdoaWNoIGlzbid0IGFsc28gcHJlc2VudCBpbgohQ09ORklHXzY0
QklUIGlzIHVzZWQuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
