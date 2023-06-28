Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE169EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV8SBPFMua2EUps/uU5RQvx9LdD31A3FbbDppmxd83o=; b=SBFSWp02OWMOmp
	JimtuOHmrLLLYNFHKmEZeKTjqb/nf3LLt56IusphI8hQ6SL0WhiAMheStwdwnbx4t/jEnmnVqFGid
	vGETc8XfxutlLRLynEJj61m/BGTCnEamwUHpclEObnq3ni5JjQSKW74bEmCDyVQR93Kaqhxv7N0dW
	kEY7zEGWiuAA8ADHqPjwrdDL8m40z9v1LlXToIt4ve/TgH/hN9GQqinbrYVsVBiUa4EG7X9shSmH8
	2z58dJemVSAEQf9isNPBmwYnGCi7XmdPPAHLbF966imahi4Kiy8hFqXq+npi9FDk6ygFz6KXW19Jp
	OSI4k00Cc4enDnFezCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qESQR-00FM6p-15;
	Wed, 28 Jun 2023 10:29:27 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qESQO-00FM5e-1X;
	Wed, 28 Jun 2023 10:29:25 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b5c231f842so58792011fa.2;
        Wed, 28 Jun 2023 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687948161; x=1690540161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9+dB0uPjR6dzec0l9qeLYrn0RkeAmaPi6wiBE0Rz0s=;
        b=b2Rs2cSK28LUBmSPPPXn1tL6IRsmSP2tJgPSfQSx4O5vycvWrA8kXiiRZLuf47VqNQ
         3T5FosiCwHUqAqiWFHaG1ckoLAJZE8HaG1zHw5D8T0V+TrINR2QnL3/PH2dd8VbGR0O/
         A/bGKjFPDpYY/4XE571aMQ29SutOrFhUowFPKjCXEV8NJSbkp1tNbP4Vhgu8hW7zlCY9
         LIkALG9i847X5HSNaM32b94V+lrtjI9t6xRUthyF3e8TsPSeoRv5f8s0GX/aMf89bYrC
         cp+awk1KsU8+n8daJmyM+z1eW9ItpBDv93fq6bcTCW6DP4TZAhyDJkSjmYdWiR6uPH2q
         dKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687948161; x=1690540161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9+dB0uPjR6dzec0l9qeLYrn0RkeAmaPi6wiBE0Rz0s=;
        b=WzYeG+kR2gqon4EnnnHx9pQr6gV1zf9xjAhLxLA4nKAFO61cdwdW4H29EZWzcX8bO8
         /RTjmqPNC5jaEcyNGw4JQvOac5raN/RaJAAad7ywx3TO8SrtQioo/Glhn383mVMt0eiT
         0Fbo4PoUcuB2kxzw96qTBN3pjB0OSbbpjmjgFE058+gGtpwvtDgr4jb+170IIHotKR3E
         RGKTiRNImjBqgL0Uoay0MZcT3ehbgyz6tJ69Vin+H9Fs/rliOd9ZjPYI/OV75BvGtvPB
         Z+23rqHu5t/SRau+PCIa48R9eGaYi5bfYFkdu3886bA261qOry3IKGLZggdamLhRsrzl
         SLww==
X-Gm-Message-State: AC+VfDytBV9yrJbnbVSaAqO7vcXxVSBwUHQ3xBX4nchNjiujSRLSZhNA
	RBi3AR93OpcPTiQkkM85rgzRkhiGjQ778VQYW94=
X-Google-Smtp-Source: ACHHUZ4h09V3wI1azpJqOp/sAeZVBD2vtw10dniqbPA1C8M7x23FpqEn0BF2WO5Dy4bGcYG4R5lh8sQuVPSUE5aJ9aE=
X-Received: by 2002:a2e:9183:0:b0:2b4:6e21:637e with SMTP id
 f3-20020a2e9183000000b002b46e21637emr17706195ljg.16.1687948161020; Wed, 28
 Jun 2023 03:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687515463.git.haibo1.xu@intel.com> <fa6b80b578553e561ccacaeb24091e0716975593.1687515463.git.haibo1.xu@intel.com>
 <20230627-feb5bf584a3fd16d2c0ffe66@orel>
In-Reply-To: <20230627-feb5bf584a3fd16d2c0ffe66@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 28 Jun 2023 18:29:09 +0800
Message-ID: <CAJve8o=CN4TJz5R9+zne_mA9L_doNTwg+w39OgU5HKXPzb4hmg@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] KVM: riscv: selftests: Add finalize_vcpu check
 in run_test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_032924_516557_B2899A69 
X-CRM114-Status: GOOD (  26.34  )
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

VGhhbmtzIGEgbG90IQoKT24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgNToxNuKAr1BNIEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjMs
IDIwMjMgYXQgMDY6NDA6MTNQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBEaXNhYmxlIGFs
bCB2Y3B1IGV4dGVuc2lvbnMgd2hpY2ggd2VyZSBlbmFibGVkIGJ5IGRlZmF1bHQKPiA+IGlmIHRo
ZXkgd2VyZSBhdmFpbGFibGUgaW4gdGhlIHJpc2MtdiBob3N0LCBhbmQgb25seSBlbmFibGUKPiA+
IHRoZSBkZXNpcmVkIG9uZSBmb3IgYSB2Y3B1X2NvbmZpZy4KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6
IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYyB8IDQyICsrKysrKysrKysrKysrKysrKysr
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1s
aXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKPiA+IGlu
ZGV4IDNiZWI2YjYyZGUwYS4uNjEyZGFiYzYxMTM3IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiArKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKPiA+IEBAIC0xMzgsMTEgKzEzOCw1MCBAQCBz
dGF0aWMgc3RydWN0IGt2bV92Y3B1ICp2Y3B1X2NvbmZpZ19nZXRfdmNwdShzdHJ1Y3QgdmNwdV9y
ZWdfbGlzdCAqYywgc3RydWN0IGt2bQo+ID4gICAgICAgcHJlcGFyZV92Y3B1X2luaXQoYywgJmlu
aXQpOwo+ID4gICAgICAgdmNwdSA9IF9fdm1fdmNwdV9hZGQodm0sIDApOwo+ID4gICAgICAgYWFy
Y2g2NF92Y3B1X3NldHVwKHZjcHUsICZpbml0KTsKPiA+IC0gICAgIGZpbmFsaXplX3ZjcHUodmNw
dSwgYyk7Cj4gPgo+ID4gICAgICAgcmV0dXJuIHZjcHU7Cj4gPiAgfQo+ID4gICNlbHNlCj4gPiAr
c3RhdGljIGlubGluZSBib29sIHZjcHVfaGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGlu
dCBleHQpCj4gPiArewo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcg
dmFsdWU7Cj4gPiArCj4gPiArICAgICByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9J
U0FfRVhUX1JFRyhleHQpLCAmdmFsdWUpOwo+ID4gKyAgICAgaWYgKHJldCkgewo+ID4gKyAgICAg
ICAgICAgICBwcmludGYoIkZhaWxlZCB0byBnZXQgZXh0ICVkIiwgZXh0KTsKPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuICEh
dmFsdWU7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIGZpbmFsaXplX3ZjcHUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+ICt7Cj4gPiArICAg
ICBzdHJ1Y3QgdmNwdV9yZWdfc3VibGlzdCAqczsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAg
ICAgKiBEaXNhYmxlIGFsbCBleHRlbnNpb25zIHdoaWNoIHdlcmUgZW5hYmxlZCBieSBkZWZhdWx0
Cj4gPiArICAgICAgKiBpZiB0aGV5IHdlcmUgYXZhaWxhYmxlIGluIHRoZSByaXNjLXYgaG9zdC4K
PiA+ICsgICAgICAqLwo+ID4gKyAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBLVk1fUklTQ1ZfSVNB
X0VYVF9NQVg7IGkrKykgewo+ID4gKyAgICAgICAgICAgICBfX3ZjcHVfc2V0X3JlZyh2Y3B1LCBS
SVNDVl9JU0FfRVhUX1JFRyhpKSwgMCk7Cj4gPiArICAgICB9Cj4KPiBuaXQ6IGNhbiBkcm9wIHRo
ZSB7fQo+Cj4gPiArCj4gPiArICAgICBmb3JfZWFjaF9zdWJsaXN0KGMsIHMpIHsKPiA+ICsgICAg
ICAgICAgICAgaWYgKCFzLT5mZWF0dXJlKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAvKiBUcnkgdG8gZW5hYmxlIHRoZSBkZXNpcmVk
IGV4dGVuc2lvbiAqLwo+ID4gKyAgICAgICAgICAgICBfX3ZjcHVfc2V0X3JlZyh2Y3B1LCBSSVND
Vl9JU0FfRVhUX1JFRyhzLT5mZWF0dXJlKSwgMSk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIC8q
IERvdWJsZSBjaGVjayB3aGV0aGVyIHRoZSBkZXNpcmVkIGV4dGVuc2lvbiB3YXMgZW5hYmxlZCAq
Lwo+ID4gKyAgICAgICAgICAgICBfX1RFU1RfUkVRVUlSRSh2Y3B1X2hhc19leHQodmNwdSwgcy0+
ZmVhdHVyZSksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlczogJXMgbm90IGF2
YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHNcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbmZpZ19uYW1lKGMpLCBzLT5uYW1lKTsKPiA+ICsgICAgIH0KPiA+ICt9Cj4gPiArCj4g
PiAgc3RhdGljIHN0cnVjdCBrdm1fdmNwdSAqdmNwdV9jb25maWdfZ2V0X3ZjcHUoc3RydWN0IHZj
cHVfcmVnX2xpc3QgKmMsIHN0cnVjdCBrdm1fdm0gKnZtKQo+ID4gIHsKPiA+ICAgICAgIHJldHVy
biBfX3ZtX3ZjcHVfYWRkKHZtLCAwKTsKPiA+IEBAIC0xNzgsNiArMjE3LDcgQEAgc3RhdGljIHZv
aWQgcnVuX3Rlc3Qoc3RydWN0IHZjcHVfcmVnX2xpc3QgKmMpCj4gPgo+ID4gICAgICAgdm0gPSB2
bV9jcmVhdGVfYmFyZWJvbmVzKCk7Cj4gPiAgICAgICB2Y3B1ID0gdmNwdV9jb25maWdfZ2V0X3Zj
cHUoYywgdm0pOwo+ID4gKyAgICAgZmluYWxpemVfdmNwdSh2Y3B1LCBjKTsKPgo+IE5vdyB0aGF0
IGJvdGggYXJtIGFuZCByaXNjdiBjYWxsIGZpbmFsaXplX3ZjcHUoKSB3ZSBjb3VsZCBkbyB0aGUg
d2Vhawo+IGZ1bmN0aW9uIHRyaWNrIGZvciBpdCBhbmQgbW92ZSB0aGUgYXJjaC1zcGVjaWZpYyBp
bXBsZW1lbnRhdGlvbnMgdG8KPiB0aGVpciBvd24gYXJjaC1zcGVjaWZpYyBmaWxlcy4KPgo+ID4K
PiA+ICAgICAgIHJlZ19saXN0ID0gdmNwdV9nZXRfcmVnX2xpc3QodmNwdSk7Cj4gPgo+ID4gLS0K
PiA+IDIuMzQuMQo+ID4KPgo+IE90aGVyd2lzZSwKPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
