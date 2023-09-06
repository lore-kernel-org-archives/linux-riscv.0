Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADBAEB8FA5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRRmpMvf5DzvzEo7DWNjMwas0d0uJBnYinF1WU5pHtw=; b=dhV1PTW/jo1C0c
	Y7m5u1y0v9lGTDM1bfTYjBC1uKeCIzlXgG4g0OQBKg6JxSlEecAvGRm1w6c4WHtbOG4oG6wn+1Luv
	6gWqykpgu/zxxEEwuCeeEGtiVxCC+OaHbuemZ8NQQ2mql4Gz9nZfXbf8Bb89q2+Y0VVUBWITUg1gG
	EDFLioABF6uH66hxu35HNcEMZ2qdzDZtvBOIIimY7Di/uq5rDBNcGz7vqbpNASVeTcRAkACxe334X
	fehSKeg8AHdVYQjO5LN+M6G1v5lxywQRzzy35ycLPKsibPLok+GfflESnLV0QPwXjHbe5IQEfzRzT
	43H/ixK1YuytPtlXr3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmjN-007SaM-26;
	Wed, 06 Sep 2023 07:13:41 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmjK-007SXP-02
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 07:13:39 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so52681161fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 00:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693984414; x=1694589214; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTsez1MtzhhlmQ/mCF+KXbnv+lrjtNHxtrQ8tWacSro=;
        b=Z6ZLtkr8PP6LxfQET+cdOP03O4mfW/QElOcCESUxm5n0fePpvU/G7qVXcWsLa873PA
         zUNTm0pg1uZrtm124dLwG2TIW9LUa7QzxsQw592vXW/gl4TnWf7QPtxz7iANylAO6foc
         ngp6i8dJ1skLvKQOIe7J+qfyeq447sSno+EYleZwW5DhnXDneK90E6iY3AgJCdVKNa8I
         qwprDBx8uHbIrWQtfYGmLPuPk8afTcW6dGNZyfa4igfdXqwKDK1HrcHDinYUf0Q3c5wF
         DT18VbD7p0GMjJy2AiXfcDmS7zb06cy39RFstInQy6k1fwRUpIuMXhLbHupltx+NOvem
         TQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693984414; x=1694589214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTsez1MtzhhlmQ/mCF+KXbnv+lrjtNHxtrQ8tWacSro=;
        b=OBuCtt8/onS6Neu5GQt1amLLRttabyuU4NOCvWjuRNo/kt5IqRL4B8A/8Xt6OMj5Xw
         Am0meXpY58jtvJpzIHljRsstVyafArl6zy+k5xR/j4BgM8ilvKqlPweYt+DZfob6E5GO
         CebmDOUzJlgQUMY4LFZd/WoF8erBztqhbtiNX8UEhwNPl3spMIhOBf2RK3UDpLVTw8ba
         m6jkKtmea27hMSQd5D0Soun2YIHYdTDiFfzSjwMvAxk77vU//aOWJ2yz1zUWupIA8qor
         GsK0ZzrsRMuamXz3m60c1ci1y5R+EC1MQ6NlM8lx/mRfuAQyMxcH7SMP1YOvY1Q200zg
         pfcA==
X-Gm-Message-State: AOJu0YxekIYeDftII3VeDnQh4GB8LOURvZeAHftmn+pDzeo9OMvB/ZZZ
	0TWktaENjRVkK0XVlTp43M0n0Q==
X-Google-Smtp-Source: AGHT+IFUfuCxBleSioCsaDTw5kdKiT/iGJ6erAaiBayaHgVuc5Zh2EjkSrt7wvrXGoCM5I5C4sZAoA==
X-Received: by 2002:a2e:9254:0:b0:2b9:55c9:c228 with SMTP id v20-20020a2e9254000000b002b955c9c228mr1549101ljg.27.1693984413992;
        Wed, 06 Sep 2023 00:13:33 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e2-20020a05600c218200b003fef5402d2dsm22237218wme.8.2023.09.06.00.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 00:13:33 -0700 (PDT)
Date: Wed, 6 Sep 2023 09:13:32 +0200
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
Message-ID: <20230906-c35fdc0e07d2cc0f9cb93203@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <8173daae52720dbdabbd88a5d412f653e6706de1.1693659382.git.haibo1.xu@intel.com>
 <20230904-06f09083d5190fd50e53b1ea@orel>
 <CAJve8on7Yi7cDuXOVznuRdTvfUhig2hZy8g72nvnHkM7omoVAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8on7Yi7cDuXOVznuRdTvfUhig2hZy8g72nvnHkM7omoVAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_001338_048470_E249A90C 
X-CRM114-Status: GOOD (  23.10  )
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

T24gV2VkLCBTZXAgMDYsIDIwMjMgYXQgMDI6MzU6NDJQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gTW9uLCBTZXAgNCwgMjAyMyBhdCA5OjMz4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU2F0LCBTZXAgMDIsIDIwMjMgYXQg
MDg6NTk6MjVQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+IEJvcnJvdyB0aGUgY3NyIGRl
ZmluaXRpb25zIGFuZCBvcGVyYXRpb25zIGZyb20ga2VybmVsJ3MKPiA+ID4gYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jc3IuaCB0byB0b29scy8gZm9yIHJpc2N2Lgo+ID4gPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICB0
b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgNTIxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTIxIGluc2VydGlvbnMoKykKPiA+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5o
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nz
ci5oIGIvdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ID4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjRlODZjODJhYWNiZAo+ID4gPiAt
LS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL3Rvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3Ny
LmgKPiA+ID4gQEAgLTAsMCArMSw1MjEgQEAKPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkgKi8KPiA+ID4gKy8qCj4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIw
MTUgUmVnZW50cyBvZiB0aGUgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlhCj4gPiA+ICsgKi8KPiA+
ID4gKwo+ID4gPiArI2lmbmRlZiBfQVNNX1JJU0NWX0NTUl9ICj4gPiA+ICsjZGVmaW5lIF9BU01f
UklTQ1ZfQ1NSX0gKPiA+ID4gKwo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiA+ID4g
Kwo+ID4gPiArLyogU3RhdHVzIHJlZ2lzdGVyIGZsYWdzICovCj4gPiA+ICsjZGVmaW5lIFNSX1NJ
RSAgICAgICAgICAgICAgIF9BQygweDAwMDAwMDAyLCBVTCkgLyogU3VwZXJ2aXNvciBJbnRlcnJ1
cHQgRW5hYmxlICovCj4gPiA+ICsjZGVmaW5lIFNSX01JRSAgICAgICAgICAgICAgIF9BQygweDAw
MDAwMDA4LCBVTCkgLyogTWFjaGluZSBJbnRlcnJ1cHQgRW5hYmxlICovCj4gPiA+ICsjZGVmaW5l
IFNSX1NQSUUgICAgICAgICAgICAgIF9BQygweDAwMDAwMDIwLCBVTCkgLyogUHJldmlvdXMgU3Vw
ZXJ2aXNvciBJRSAqLwo+ID4gPiArI2RlZmluZSBTUl9NUElFICAgICAgICAgICAgICBfQUMoMHgw
MDAwMDA4MCwgVUwpIC8qIFByZXZpb3VzIE1hY2hpbmUgSUUgKi8KPiA+ID4gKyNkZWZpbmUgU1Jf
U1BQICAgICAgICAgICAgICAgX0FDKDB4MDAwMDAxMDAsIFVMKSAvKiBQcmV2aW91c2x5IFN1cGVy
dmlzb3IgKi8KPiA+ID4gKyNkZWZpbmUgU1JfTVBQICAgICAgICAgICAgICAgX0FDKDB4MDAwMDE4
MDAsIFVMKSAvKiBQcmV2aW91c2x5IE1hY2hpbmUgKi8KPiA+ID4gKyNkZWZpbmUgU1JfU1VNICAg
ICAgICAgICAgICAgX0FDKDB4MDAwNDAwMDAsIFVMKSAvKiBTdXBlcnZpc29yIFVzZXIgTWVtb3J5
IEFjY2VzcyAqLwo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIFNSX0ZTICAgICAgICAgICAgICAgIF9B
QygweDAwMDA2MDAwLCBVTCkgLyogRmxvYXRpbmctcG9pbnQgU3RhdHVzICovCj4gPiA+ICsjZGVm
aW5lIFNSX0ZTX09GRiAgICBfQUMoMHgwMDAwMDAwMCwgVUwpCj4gPiA+ICsjZGVmaW5lIFNSX0ZT
X0lOSVRJQUwgICAgICAgIF9BQygweDAwMDAyMDAwLCBVTCkKPiA+ID4gKyNkZWZpbmUgU1JfRlNf
Q0xFQU4gIF9BQygweDAwMDA0MDAwLCBVTCkKPiA+ID4gKyNkZWZpbmUgU1JfRlNfRElSVFkgIF9B
QygweDAwMDA2MDAwLCBVTCkKPiA+ID4gKwo+ID4gPiArI2RlZmluZSBTUl9WUyAgICAgICAgICAg
ICAgICBfQUMoMHgwMDAwMDYwMCwgVUwpIC8qIFZlY3RvciBTdGF0dXMgKi8KPiA+ID4gKyNkZWZp
bmUgU1JfVlNfT0ZGICAgIF9BQygweDAwMDAwMDAwLCBVTCkKPiA+ID4gKyNkZWZpbmUgU1JfVlNf
SU5JVElBTCAgICAgICAgX0FDKDB4MDAwMDAyMDAsIFVMKQo+ID4gPiArI2RlZmluZSBTUl9WU19D
TEVBTiAgX0FDKDB4MDAwMDA0MDAsIFVMKQo+ID4gPiArI2RlZmluZSBTUl9WU19ESVJUWSAgX0FD
KDB4MDAwMDA2MDAsIFVMKQo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIFNSX1hTICAgICAgICAgICAg
ICAgIF9BQygweDAwMDE4MDAwLCBVTCkgLyogRXh0ZW5zaW9uIFN0YXR1cyAqLwo+ID4gPiArI2Rl
ZmluZSBTUl9YU19PRkYgICAgX0FDKDB4MDAwMDAwMDAsIFVMKQo+ID4gPiArI2RlZmluZSBTUl9Y
U19JTklUSUFMICAgICAgICBfQUMoMHgwMDAwODAwMCwgVUwpCj4gPiA+ICsjZGVmaW5lIFNSX1hT
X0NMRUFOICBfQUMoMHgwMDAxMDAwMCwgVUwpCj4gPiA+ICsjZGVmaW5lIFNSX1hTX0RJUlRZICBf
QUMoMHgwMDAxODAwMCwgVUwpCj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgU1JfRlNfVlMgICAgIChT
Ul9GUyB8IFNSX1ZTKSAvKiBWZWN0b3IgYW5kIEZsb2F0aW5nLVBvaW50IFVuaXQgKi8KPiA+ID4g
Kwo+ID4gPiArI2lmbmRlZiBDT05GSUdfNjRCSVQKPiA+Cj4gPiBIb3cgZG8gd2UgZW5zdXJlIENP
TkZJR182NEJJVCBpcyBzZXQ/Cj4gPgo+IAo+IEN1cnJlbnRseSwgbm8gZXhwbGljaXQgY2hlY2tp
bmcgZm9yIHRoaXMuCj4gU2hhbGwgd2UgYWRkIGEgZ2F0ZWtlZXBlciBpbiB0aGlzIGZpbGUgdG8g
ZW5zdXJlIGl0IGlzIHNldD8KCk5vdCBpbiB0aGlzIGZpbGUsIHNpbmNlIHRoaXMgZmlsZSBpcyBz
aGFyZWQgYnkgYWxsIHRoZSB0b29scyBhbmQuLi4KCj4gCj4gI2lmbmRlZiBDT05GSUdfNjRCSVQK
PiAjZXJyb3IgIkNPTkZJR182NEJJVCB3YXMgbm90IHNldCIKPiAjZW5kaWYKCi4uLndlJ2xsIHN1
cmVseSBoaXQgdGhpcyBlcnJvciByaWdodCBub3cgc2luY2Ugbm90aGluZyBpcyBzZXR0aW5nCkNP
TkZJR182NEJJVCB3aGVuIGNvbXBpbGluZyBLVk0gc2VsZnRlc3RzLgoKV2UgbmVlZCB0byBkZWZp
bmUgQ09ORklHXzY0QklUIGluIHRoZSBidWlsZCBzb21ld2hlcmUgcHJpb3IgdG8gYW55CmhlYWRl
cnMgd2hpY2ggZGVwZW5kIG9uIGl0IGJlaW5nIGluY2x1ZGVkLiBNYXliZSB3ZSBjYW4gc2ltcGx5
CmFkZCAtRENPTkZJR182NEJJVCB0byBDRkxBR1MsIHNpbmNlIGFsbCBLVk0gc2VsZnRlc3RzIHN1
cHBvcnRlZAphcmNoaXRlY3R1cmVzIGFyZSA2NC1iaXQuCgooUGxlYXNlIHRyaW0gZW1haWxzLCBh
cyBJJ3ZlIGJlZW4gZG9pbmcsIHdoZW4gZGlzY3Vzc2luZyBzcGVjaWZpYyBwYXJ0cy4pCgpUaGFu
a3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
