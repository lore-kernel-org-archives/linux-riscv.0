Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE66EC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGiQdQCIj+ZVBVZr4SR9pFtyGR0yxf2unDNacCPDl74=; b=KdF4U2Z+vWf2YN
	xmIHi6p7LChkNM3fgOI5cjPXn8ecHNw0Ifgbg0ywP463GFNIwN99jCdOSoEHy3je8y0LbGqRN1MZg
	nfTyOoJpXusdwCFEkuJAat3vX65gnUr75qRbBB/9/7XZ/JzHl48kAIVajIoZKsE2L92Dmny6GChzh
	/Hb9jyaSuy3ZtWdtSVzoWp1isXgojA4KuzrKYQx3aShXzgTgONY3ANRcq0rKEfPep45ig1mGO5bgr
	awKH+x6aHmLh5bA+KOulJyWIuEsYVDgaA7rfWVRNwfKNTDcU4AkKZ5iKLnHbmVCmHZdobQ5eRLT6T
	HW+Jgot5WDyixgBk0PEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CPu-008lVu-0s;
	Thu, 08 Jun 2023 09:58:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CPr-008lUY-0t
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 09:58:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30ae141785bso414303f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686218329; x=1688810329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bro8SCdRCjEHWuDcBtldZHsndfar0M9rwEdZ8SQ0W0s=;
        b=DWLlXBMjR+In9QMk6WByU+4r6ZJwRxIdZLTZafSYiCKOJbbbT6swcxcbDLzxBWXjSp
         1fbhQV7xgyvNNKARmYmQiulH1nZx4WLvUTDj3K4StImn2hgIxDj2+ikZyPIKdWisMOTf
         POkUvZLouPzWG0TFB+pG8Fqpf4v308cP9MheL82rSXAkIQHV8FTqswIFUo3ofKEZH1T5
         gBAYnPnURVTOhHfQfMReB4ybwIfvFPWb9VgzTP9BzQ4nEZKp69qw8Fh1mVAeJnQ4O6Qb
         hvdyiWTomMIhVCmxq/xcYY3sZSRGDpAgFxYDyLLQmROw3quJagxDYH4kZcjPI1PfZRLY
         vJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686218329; x=1688810329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bro8SCdRCjEHWuDcBtldZHsndfar0M9rwEdZ8SQ0W0s=;
        b=Ea64ukbWXbYJ3xUHgLxVuYwaVQg0VjMwH5BUg6Zc8jX9wTDU69gTvf7b5en41i4Cu9
         g3NGcNc7CSPAA02gpKJrd8nhch+0mW4whg5fXilFWN02l0qUOudpcDPxRVkCFl4yCq0N
         xNXKoTfeE+rwVbDpEHd5zWDe3TdGkpTMtQlvzAl3RzquZAqRiviFFIABUS1/aVAplKB4
         r2a0XF+BXrGlGyUFTvKK4K6/yhbdBu15Pqqp+ntbw9xp+A23rrVVIarb+PdhX3d0GfR1
         j8aeKRTEeRgqkG2q5OVmmWRBkCdP+KQCmNIxnslrIp55ntM/jpv/QjWL8ke7WsBliOjs
         WQpg==
X-Gm-Message-State: AC+VfDyezHVKZYAStMl2JYPDek4kT3Qf+4n3lW4tFublT9sbLm+GplyZ
	F1v6rOcpjUdBOe6g6sw73k+SMQ==
X-Google-Smtp-Source: ACHHUZ6f6RLGsz44l11hXuy9AWjs8GZ3O0KJYqBLOUqFSQ6jSeZDCKr+qhXxSeHoE89ty7CpeH4xmQ==
X-Received: by 2002:a5d:6550:0:b0:30a:9014:838d with SMTP id z16-20020a5d6550000000b0030a9014838dmr6419901wrv.11.1686218329062;
        Thu, 08 Jun 2023 02:58:49 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600000cc00b002ff2c39d072sm1065586wrx.104.2023.06.08.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:58:48 -0700 (PDT)
Date: Thu, 8 Jun 2023 11:58:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 11/11] KVM: riscv: selftests: Add get-reg-list test
Message-ID: <20230608-344953a953eeb63ef6c26fb8@orel>
References: <cover.1684999824.git.haibo1.xu@intel.com>
 <da390e6200e838fce320a2a43b2f87951b4e0bbb.1684999824.git.haibo1.xu@intel.com>
 <20230525-2bab5376987792eab73507ac@orel>
 <CAJve8okR_iH4vF9DV9zTkDaeYe25kP7KUcKQphmjG5q-iVb-KA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8okR_iH4vF9DV9zTkDaeYe25kP7KUcKQphmjG5q-iVb-KA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_025851_313361_391E5EE0 
X-CRM114-Status: GOOD (  15.20  )
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

T24gVGh1LCBKdW4gMDgsIDIwMjMgYXQgMDU6NDU6MjFQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMToxOOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiAKPiA+ID4gKyAgICAgS1ZNX1JFR19SSVND
ViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NW
X0NPUkVfUkVHKG1vZGUpLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpF
X1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfUkVHKHNzdGF0dXMp
LAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdf
UklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfUkVHKHNpZSksCj4gPiA+ICsgICAgIEtWTV9S
RUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVH
X1JJU0NWX0NTUl9SRUcoc3R2ZWMpLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JF
R19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfUkVHKHNz
Y3JhdGNoKSwKPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBL
Vk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzZXBjKSwKPiA+ID4gKyAg
ICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NTUiB8
IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzY2F1c2UpLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NW
IHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9D
U1JfUkVHKHN0dmFsKSwKPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9V
NjQgfCBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzaXApLAo+ID4g
PiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1Zf
Q1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfUkVHKHNhdHApLAo+ID4gPiArICAgICBLVk1fUkVHX1JJ
U0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVND
Vl9DU1JfUkVHKHNjb3VudGVyZW4pLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JF
R19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfVElNRVIgfCBLVk1fUkVHX1JJU0NWX1RJTUVSX1JF
RyhmcmVxdWVuY3kpLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2
NCB8IEtWTV9SRUdfUklTQ1ZfVElNRVIgfCBLVk1fUkVHX1JJU0NWX1RJTUVSX1JFRyh0aW1lKSwK
PiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJ
U0NWX1RJTUVSIHwgS1ZNX1JFR19SSVNDVl9USU1FUl9SRUcoY29tcGFyZSksCj4gPiA+ICsgICAg
IEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9USU1FUiB8
IEtWTV9SRUdfUklTQ1ZfVElNRVJfUkVHKHN0YXRlKSwKPiA+ID4gKyAgICAgS1ZNX1JFR19SSVND
ViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9BLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8
IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0MsCj4gPiA+ICsgICAg
IEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9JU0FfRVhU
IHwgS1ZNX1JJU0NWX0lTQV9FWFRfRCwKPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9S
RUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9G
LAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdf
UklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0gsCj4gPiA+ICsgICAgIEtWTV9SRUdf
UklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfSSwKPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9V
NjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9NLAo+ID4KPiA+
IEkgdGhpbmsgYWxsIHRoZSBhYm92ZSBzaG91bGQgaGF2ZSB0aGUgc2l6ZSBLVk1fUkVHX1NJWkVf
VUxPTkcuIFBsZWFzZSBhbHNvCj4gPiB0ZXN0IHdpdGggYSAzMi1iaXQgaG9zdC4KPiA+Cj4gCj4g
SGkgQW5kcmV3LAo+IAo+IEp1c3Qgbm90aWNlZCB0aGUgUklTQy1WIDMyLWJpdCBrdm0gc2VsZnRl
c3RzIHdhcyBub3Qgc3VwcG9ydGVkIGN1cnJlbnRseS4KCk9oLCByaWdodC4KCj4gRXZlbiB0aG91
Z2ggSSB0cmllZCB0byByZW1vdmUgdGhlIGJlbG93IGNoZWNrIGZvciAzMi1iaXQsIHRoZXJlIHdl
cmUKPiBzdGlsbCBtYW55IHdhcm5pbmcgYW5kIGVycm9yIG1lc3NhZ2VzIGR1cmluZyBjb21waWxp
bmcuCj4gSXQgc2VlbXMgMzItYml0IEtWTSBzZWxmdGVzdHMgd2FzIG5vdCBzdXBwb3J0ZWQgZWl0
aGVyIGZvciBBUk0veDg2LiBEbwo+IHdlIGhhdmUgYSBwbGFuIHRvIHN1cHBvcnQgaXQgb24gcmlz
Yy12PwoKTm8gcGxhbiBhbmQsIGlmIHRoZXJlIHdhcywgaXQgd291bGQgYmUgc3VwZXIgbG93IHBy
aW9yaXR5LiBTbyBmb3Igc3R1ZmYKbGlrZSB1c2luZyBLVk1fUkVHX1NJWkVfVUxPTkcsIHdlJ2xs
IGp1c3QgaGF2ZSB0byB0cnkgYW5kIGdldCBpdCByaWdodAp3aXRob3V0IHRlc3RpbmcuIElmIHNv
bWVib2R5IGFkZHMgMzItYml0IHN1cHBvcnQgdG8gdGhlc2UgdGVzdHMgc29tZWRheSwKdGhlbiwg
aG9wZWZ1bGx5LCBpdCdsbCBqdXN0IHdvcmsgKEknbSBhbGxvd2VkIG9uZSBvdmVybHkgb3B0aW1p
c3RpYwpjb21tZW50IHBlciBkYXkpLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
