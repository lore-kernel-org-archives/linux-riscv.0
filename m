Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68437EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 01:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U51RPYc4nV0NlT0ZJEatSAjVaMmv+94bbElqCUCrfqo=; b=LYnkDef6dQDkcl
	/8GyD0WRMFeEHWAhtxcTih5MGYxJq+iO9ibTNGUxUIpr/L2eSEaPeZ4iSIsfNIp+5/TNq1MgsVo0G
	C5929jugzIFKPst5P3mceJmma7AH3Xli4X/b9VS41Qc1VXrWX4Uakc2r3J0v7LcfCxvVxZaYG4GvL
	5AgXUpurfr2578d33Li5b/S3aLEDZrE06bJeAHforOtzjDogrLdXYeHmIxM29nTPfGuulcmTLJN47
	KZFYxpT+qN7rg0rI/oqFNBYX8txznrqO09S0/FPfTLPcQ2MwfEuDujMJQk5HHa9NLyIV9KjmI2WLA
	qC/B4pceK5Qdu6sZ5XJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBn4F-00Csu9-30;
	Wed, 21 Jun 2023 01:55:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBn4B-00Cssw-2M;
	Wed, 21 Jun 2023 01:55:29 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f871c93a5fso3939492e87.2;
        Tue, 20 Jun 2023 18:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687312525; x=1689904525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wz+JcRD5iqUFNC0O0Ru60ZgS8tD+DjfgbMM6b7JgDDE=;
        b=I4Xks4H0f9hjuiTto0xGg2qYpfM1NZn0dyFE3RFSgjOTxwdHLkw2aJFM6SQ4UPOBl2
         dNK6TDWAZALS3CRzxzO+dpAo1U9mCItEUs562QTVmbmesDW2NSyCOoPgJOgoYQAz7I81
         HLw63JGcQ4kMncWwX/yetxeXc4t9tZnic1kQbgvD1AUCJKn28T1HFnucS8Q2s7Nx+DQZ
         f8U5MS+CPM3LZ1R10maFt1FXao1Rfu9UuLwRlmRiKcyG4Eu87O2mrDltGfJ0J9bBeZ4/
         piitDPizcx0RsJDQqHWespeaFg6I0iuKgvJ4MSz6hINYPHYT0FU7ayv5Ygm+4xicdr1J
         wVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687312525; x=1689904525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz+JcRD5iqUFNC0O0Ru60ZgS8tD+DjfgbMM6b7JgDDE=;
        b=LTW7mTXwjGiA9diI6MMBKk9tr/uBlvY5dKPCNuRBG2QvrDrq8hUYFj1saPfB0/FJPW
         q5gB4U0no1Ci8AZ8yr8om4Grye7a7U142awb8umM40+CcQwEbJpizz9H93Gm3U2n2YZF
         Sf9o6Ppattw9oYqRFIYUIFOTqy/Gse4pvB44c4DKDZbtmwr2JtZEt/Z3YjV2ya2zBONo
         jqeB9TekzhZVkE+UlS3FZcJE1Hthr24DOC9HllNKuNjyGOha34fwOs1gTcgdM5lxBX3w
         kB8aj0ULK0xwVL7elBcoC0pF6wJVGCwe1W4qbSguGlC98mj+RiVTItgN3RV129BrHBUQ
         mfJA==
X-Gm-Message-State: AC+VfDy6I0xVcm8N/DGCyVA7Tc5c6ecwOv/K/SngtGKypBfYmBP8E/yW
	ZTQOneGCREu08jyok22KcULX0gk736T04s1Nn7c=
X-Google-Smtp-Source: ACHHUZ6wY9wkDAsQKF4/pJB6A70/338sp9DCerB/qo1fiLgVSLjXYq0d7uPy8bn+2oY5S0+fhyThzcL/uGhJOGcqvb4=
X-Received: by 2002:a05:6512:1cd:b0:4f9:573a:689d with SMTP id
 f13-20020a05651201cd00b004f9573a689dmr610014lfp.37.1687312525203; Tue, 20 Jun
 2023 18:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686275310.git.haibo1.xu@intel.com> <8cd4ce50f5f4a639f4508085959aae222d4d4386.1686275310.git.haibo1.xu@intel.com>
 <20230609-fba04b424a4d46574e04e587@orel> <CAJve8okjRZEt6_6SB9EWm+6c7utpExzenfWo2T1N-J6G9w9czQ@mail.gmail.com>
 <20230620-95ce8ab70956a72b9da3a31a@orel>
In-Reply-To: <20230620-95ce8ab70956a72b9da3a31a@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 21 Jun 2023 09:55:13 +0800
Message-ID: <CAJve8onNFfHFcvAGkbtnxjzqgfq4geL1zOwJEc8Xzc=NHVDrFg@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] KVM: riscv: selftests: Add get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Gardon <bgardon@google.com>, 
	David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_185528_579406_D573C4D7 
X-CRM114-Status: GOOD (  27.55  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNjo0NOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMDY6MDU6
NTlQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBPbiBGcmksIEp1biA5LCAyMDIzIGF0IDk6
MzXigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gRnJpLCBKdW4gMDksIDIwMjMgYXQgMTA6MTI6MThBTSArMDgwMCwgSGFpYm8g
WHUgd3JvdGU6Cj4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCBhaWFfY29uZmln
ID0gewo+ID4gPiA+ICsgICAgIC5zdWJsaXN0cyA9IHsKPiA+ID4gPiArICAgICBCQVNFX1NVQkxJ
U1QsCj4gPiA+ID4gKyAgICAgQUlBX1JFR1NfU1VCTElTVCwKPiA+ID4gPiArICAgICB7MH0sCj4g
PiA+ID4gKyAgICAgfSwKPiA+ID4gPiArfTsKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBzdHJ1
Y3QgdmNwdV9yZWdfbGlzdCBmcF9mX2RfY29uZmlnID0gewo+ID4gPiA+ICsgICAgIC5zdWJsaXN0
cyA9IHsKPiA+ID4gPiArICAgICBCQVNFX1NVQkxJU1QsCj4gPiA+ID4gKyAgICAgRlBfRl9SRUdT
X1NVQkxJU1QsCj4gPiA+ID4gKyAgICAgRlBfRF9SRUdTX1NVQkxJU1QsCj4gPiA+ID4gKyAgICAg
ezB9LAo+ID4gPiA+ICsgICAgIH0sCj4gPiA+ID4gK307Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdHJ1
Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7Cj4gPiA+ID4gKyAgICAgJnppY2Jv
X2NvbmZpZywKPiA+ID4gPiArICAgICAmYWlhX2NvbmZpZywKPiA+ID4gPiArICAgICAmZnBfZl9k
X2NvbmZpZywKPiA+ID4gPiArfTsKPiA+ID4gPiAraW50IHZjcHVfY29uZmlnc19uID0gQVJSQVlf
U0laRSh2Y3B1X2NvbmZpZ3MpOwo+ID4gPiA+IC0tCj4gPiA+ID4gMi4zNC4xCj4gPiA+ID4KPiA+
ID4KPiA+ID4gSSBzZWUgd2UgaGF2ZSBhIGJpdCBvZiBhIHByb2JsZW0gd2l0aCB0aGUgY29uZmln
cyBmb3IgcmlzY3YuIFNpbmNlIHdlCj4gPiA+IGRvbid0IGRpc2FibGUgYW55dGhpbmcgd2UncmUg
bm90IHRlc3RpbmcsIHRoZW4gZm9yIGFueSB0ZXN0IHRoYXQgaXMKPiA+ID4gbWlzc2luZywgZm9y
IGV4YW1wbGUsIHRoZSBmIGFuZCBkIHJlZ2lzdGVycywgd2UnbGwgZ2V0IG91dHB1dCBsaWtlCj4g
PiA+ICJUaGVyZSBhcmUgNjYgbmV3IHJlZ2lzdGVycy4gQ29uc2lkZXIgYWRkaW5nIHRoZW0gdG8g
dGhlIGJsZXNzZWQgcmVnCj4gPiA+IGxpc3Qgd2l0aCB0aGUgZm9sbG93aW5nIGxpbmVzOiIgYW5k
IHRoZW4gYSBkdW1wIG9mIGFsbCB0aGUgZiBhbmQgZAo+ID4gPiByZWdpc3RlcnMuIFRoZSB0ZXN0
IGRvZXNuJ3QgZmFpbCwgYnV0IGl0J3MgbWVzc3kgYW5kIGNvbmZ1c2luZy4gSWRlYWxseQo+ID4g
PiB3ZSdkIGRpc2FibGUgYWxsIHJlZ2lzdGVycyBvZiBhbGwgc3VibGlzdHMgbm90IGluIHRoZSBj
b25maWcsIHByb2JhYmx5Cj4gPiA+IGJ5IHN0YXJ0aW5nIGJ5IGRpc2FibGluZyBldmVyeXRoaW5n
IGFuZCB0aGVuIG9ubHkgcmVlbmFibGluZyB0aGUgb25lcwo+ID4gPiBpbiB0aGUgY29uZmlnLgo+
ID4gPgo+ID4gPiBBbnl0aGluZyB0aGF0IGNhbid0IGJlIGRpc2FibGVkIGlzIGVpdGhlciBhIEtW
TSBidWcsIGkuZS4gd2Ugc2hvdWxkCj4gPiA+IGJlIGFibGUgdG8gZGlzYWJsZSBpdCwgYmVjYXVz
ZSB3ZSBjYW4ndCBleHBlY3QgZXZlcnkgaG9zdCB0byBoYXZlIGl0LAo+ID4gPiBvciBpdCBuZWVk
cyB0byBiZSBpbiB0aGUgYmFzZSByZWdpc3RlciBzdWJsaXN0IChtZWFuaW5nIGV2ZXJ5IGhvc3QK
PiA+ID4gd2lsbCBhbHdheXMgaGF2ZSBpdCkuCj4gPiA+Cj4gPgo+ID4gSEkgQW5kcmV3LAo+ID4K
PiA+IEkgZm91bmQgc2V2ZXJhbCBtdWx0aS1sZXR0ZXJzIElTQSBFWFQoQUlBL1NTVEMgZXRjKSB3
ZXJlIG5vdCBhbGxvd2VkCj4gPiB0byBiZSBkaXNhYmxlZC4KPiA+IElzIGl0IGEgYnVnPyBzaGFs
bCB3ZSBmaXggaXTvvJ8KPgo+IEV4dGVuc2lvbnMgdGhhdCBhIGd1ZXN0IGNvdWxkIHVzZSAocmVn
YXJkbGVzcyBvZiB3aGV0aGVyIG9yIG5vdCB0aGUgaG9zdAo+IGRlc2NyaWJlZCBpdCBpbiB0aGUg
Z3Vlc3QncyBpc2Egc3RyaW5nKSwgYmVjYXVzZSB0aGUgaW5zdHJ1Y3Rpb25zIG9yIENTUgo+IGFj
Y2Vzc2VzIGRvbid0IHRyYXAsIGNhbid0IHRydWx5IGJlIGRpc2FibGVkLiBTbywgaXQncyBub3Qg
YSBidWcgdG8KPiBwcm9oaWJpdCBkaXNhYmxpbmcgdGhlbSBhbmQgaW5kZWVkIHRoZSB0ZXN0IGNh
c2VzIHNob3VsZCBhY3R1YWxseSBlbnN1cmUKPiBkaXNhYmxpbmcgdGhlbSBmYWlscy4KPgoKU28g
dGhlc2Uga2luZHMgb2YgSVNBX0VYVF8qIHJlZ3Mgc2hvdWxkIGJlIGluIHRoZSBiYXNlIHJlZyBs
aXN0LCByaWdodD8KClRoYW5rcywKSGFpYm8KCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
