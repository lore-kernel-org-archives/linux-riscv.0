Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C66EE14D4
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 04:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDprgsgLsGSwgSOnOB5sbAPlQ1YEAdVpqFvd6Ez+f+M=; b=snSlNIdld1JH8c
	HVV2shUh726hC+/Z1juGrdsbYH1+S+V64dUEyZ27ZcneJHlJiuhbPVVkiJSZeTjgpQXHP7vPN6qrm
	DygqXdribySPZZ8LTaawIr7eREt0k4y2rpyjGkDaI8hcD6Q1VRRUmG1v5ia77dg4PECrXm0ayZZju
	D/1ZJl5wUW4JQE8+NriUN9UuVAyQvgP75XGGYw6glEUWuF827pAf0S6xRGbLVzn+VdH0sxjHLsrUf
	444lkf2LWKIS3qF0IFLFcyobybeVKh+J6Ro4Wjzmd9NBy/i0zaxb9tX64zMyjXHezBIKKkSYgYwJh
	ZpwfdcGVxtDkIuRIJpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe6VZ-00BIQL-2Z;
	Thu, 07 Sep 2023 04:20:45 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe6VW-00BIPZ-2y;
	Thu, 07 Sep 2023 04:20:44 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bc63e0d8cdso8708321fa.2;
        Wed, 06 Sep 2023 21:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694060440; x=1694665240; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggNyFVV0uCZfL0MPihiu3QYZ5fZKGzQ4fJp4UHCFGEg=;
        b=Gj1jCv8lNQA3wgv/x6uO5uzGyV34JiGcf/cfWZjIKt3ejpCsuUNylUJe2GUskukwjK
         OZhBBFzLok5QebjIhK/rJJBj88W+koPrwgVSxnAHf22dJ0I3lCxOPwSJ5wqEgqCS7cvx
         9TqnzpiChz+69vCjiY8GqK7bKdqCb2jSc8wvl/YOnEhhcCtVHgV++SAgA4YhQ9sn6LYG
         vaEWklFWDfMePBOYJcCbdsdQu8AEFSceaU33uO32MP6xGIrwOq6SSFM2t9TeMO+3pLwe
         VSqWJFPSanGHQP3U7QeP3xqLVHGqm3z9+3nVv7Wk9z6CGynbzUr314AEnri91QYe7gFI
         yhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694060440; x=1694665240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggNyFVV0uCZfL0MPihiu3QYZ5fZKGzQ4fJp4UHCFGEg=;
        b=j98wFvGXEzXzLnWXYE/LWOnfbmdGt3ewPOBAfFJJQJNezyJ2BlzwhVWBhZsj9XfO/p
         dSG8+rqBHq8IO8d8b55goeFbtTyYASZdftT/AkIay7hc3miuYpctrsXDyQASOs5pVd7Z
         loZFfmblC26XSvTBI68h2dSa5hsGOuIijsqVQAw4Y1Khg2h2kBuoW0VHBDsGNjfkg4RF
         F6wWgqR0mjSnE7bPTfDPL5DbqmzQlKgaYekeAMvfHD1C3SOwbV+PP4s/iXjWhnqlgRQA
         N02FqXFrkIAgISRe2WVAZwuNsYlei/zTcnI3pE767mYvXOch8gMEMSrnB1SGp+ZLz+9K
         No8A==
X-Gm-Message-State: AOJu0YwwIq+bDhKZ9uUZchcCfntn3RcJxCUpwlOskQjcIi/n1uAfpFO0
	sIizIIXO9WMQbBOsQ27X8b74M3KqFqngUGaVTHM=
X-Google-Smtp-Source: AGHT+IEs3wMkr3Qdbzy7z2cdD2QQiWNG7Kmko0xSRTbnllA2oAUwbpm0j15v/Il5Cbh5yzHk8TJ3foGdBVTBUXfKPp0=
X-Received: by 2002:a2e:8708:0:b0:2bb:aaec:abad with SMTP id
 m8-20020a2e8708000000b002bbaaecabadmr3613921lji.30.1694060440378; Wed, 06 Sep
 2023 21:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <d2b3c53537fef3f0a2d27d8be663a64123d4bc3c.1693659382.git.haibo1.xu@intel.com>
 <20230904-a69c6a228bf4553cc58bca17@orel>
In-Reply-To: <20230904-a69c6a228bf4553cc58bca17@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 7 Sep 2023 12:20:29 +0800
Message-ID: <CAJve8ok03P-t7pTA9mH=5vvkUy4NtxHac_Z_NM88cs55YQZATg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] KVM: riscv: selftests: Add sstc timer test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Greentime Hu <greentime.hu@sifive.com>, 
	wchen <waylingii@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Peter Gonda <pgonda@google.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Like Xu <likexu@tencent.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, zhang songyi <zhang.songyi@zte.com.cn>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_212042_983056_5158E1CB 
X-CRM114-Status: GOOD (  22.07  )
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

T24gTW9uLCBTZXAgNCwgMjAyMyBhdCAxMDo1OOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBTZXAgMDIsIDIwMjMgYXQgMDg6NTk6
MzBQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBBZGQgYSBLVk0gc2VsZnRlc3QgdG8gdmFs
aWRhdGUgdGhlIFNzdGMgdGltZXIgZnVuY3Rpb25hbGl0eS4KPiA+IFRoZSB0ZXN0IHdhcyBwb3J0
ZWQgZnJvbSBhcm02NCBhcmNoIHRpbWVyIHRlc3QuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFp
Ym8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiAtLS0KCj4gPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2FyY2hfdGltZXIuYyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMKPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmM1MGEzM2MxZTRmOQo+ID4gLS0tIC9kZXYvbnVs
bAo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2FyY2hfdGltZXIu
Ywo+ID4gQEAgLTAsMCArMSwxMzAgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5Cj4gPiArLyoKPiA+ICsgKiBhcmNoX3RpbWVyLmMgLSBUZXN0cyB0aGUgcmlz
Y3Y2NCBzc3RjIHRpbWVyIElSUSBmdW5jdGlvbmFsaXR5Cj4gPiArICoKPiA+ICsgKiBUaGUgdGVz
dCB2YWxpZGF0ZXMgdGhlIHNzdGMgdGltZXIgSVJRcyB1c2luZyB2c3RpbWVjbXAgcmVnaXN0ZXJz
Lgo+ID4gKyAqIEl0J3MgcG9ydGVkIGZyb20gdGhlIGFhcmNoNjQgYXJjaF90aW1lciB0ZXN0Lgo+
ID4gKyAqCgo+IGd1ZXN0X3J1bltfc3RhZ2VdKCkgY2FuIGJlIHNoYXJlZCB3aXRoIGFhcmNoNjQs
IHdlIGp1c3QgaGF2ZSBhIHNpbmdsZQo+IHN0YWdlPTAgZm9yIHJpc2N2Lgo+CgpZZXMsIHdlIGNh
bi4gQnV0IGlmIHdlIHNoYXJlIHRoZSBndWVzdF9ydW5bX3N0YWdlXSgpIGJ5IG1vdmluZyBpdCB0
bwprdm0vYXJjaF90aW1lci5jCm9yIGt2bS9pbmNsdWRlL3RpbWVyX3Rlc3QuaCwgd2UgbmVlZCB0
byBkZWNsYXJlIGV4dHJhIHN1Yi1mdW5jdGlvbnMKc29tZXdoZXJlIGluIGEKaGVhZGVyIGZpbGUo
ZXRjLiBndWVzdF9jb25maWd1cmVfdGltZXJfYWN0aW9uKCkpLgoKPiA+ICsKPiA+ICtzdGF0aWMg
dm9pZCBndWVzdF9jb2RlKHZvaWQpCj4gPiArewo+ID4gKyAgICAgdWludDMyX3QgY3B1ID0gZ3Vl
c3RfZ2V0X3ZjcHVpZCgpOwo+ID4gKyAgICAgc3RydWN0IHRlc3RfdmNwdV9zaGFyZWRfZGF0YSAq
c2hhcmVkX2RhdGEgPSAmdmNwdV9zaGFyZWRfZGF0YVtjcHVdOwo+ID4gKwo+ID4gKyAgICAgbG9j
YWxfaXJxX2Rpc2FibGUoKTsKPiA+ICsgICAgIHRpbWVyX2lycV9kaXNhYmxlKCk7Cj4gPiArICAg
ICBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4KPiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gZGlzYWJs
ZSBhbGwgaW50ZXJydXB0cyB3aGVuIGRpc2FibGluZyB0aGUgdGltZXIKPiBpbnRlcnJ1cHQuCj4K
ClRoZXJlIGlzIG5vIGxvY2FsX2lycV9kaXNhYmxlKCkgcHJvdGVjdGlvbiBkdXJpbmcgdGhlIGlu
aXRpYWwgZGVidWcKcGhhc2UsIGJ1dCB0aGUgdGVzdCBhbHdheXMKZmFpbCB3aXRoIGJlbG93IGVy
cm9yIG1lc3NhZ2VzOgoKR3Vlc3QgYXNzZXJ0IGZhaWxlZCwgIHZjcHUgMDsgc3RhZ2U7IDA7IGl0
ZXI6IDAKPT09PSBUZXN0IEFzc2VydGlvbiBGYWlsdXJlID09PT0KICByaXNjdi9hcmNoX3RpbWVy
LmM6Nzg6IGNvbmZpZ19pdGVyICsgMSA9PSBpcnFfaXRlcgogIHBpZD01ODUgdGlkPTU4NiBlcnJu
bz00IC0gSW50ZXJydXB0ZWQgc3lzdGVtIGNhbGwKICAoc3RhY2sgdHJhY2UgZW1wdHkpCiAgMHgx
ICE9IDB4MCAoY29uZmlnX2l0ZXIgKyAxICE9IGlycV9pdGVyKQoKVG8gYmUgZnJhbmssIEkgYW0g
bm90IHF1aXRlIHN1cmUgd2h5IHRoZSBsb2NhbF9pcnFfZGlzYWJsZS9lbmFibGUoKSBtYXR0ZXJz
LgpPbmUgcG9zc2libGUgcmVhc29uIG1heSBiZSBzb21lIHRpbWVyIGlycSB3YXMgdHJpZ2dlcmVk
IGJlZm9yZSB3ZSBzZXQgdXAgdGhlCnRpbWVjbXAgcmVnaXN0ZXIuCgo+ID4gKwo+ID4gKyAgICAg
Z3Vlc3RfcnVuKHNoYXJlZF9kYXRhKTsKPiA+ICsKPiA+ICsgICAgIEdVRVNUX0RPTkUoKTsKPiA+
ICt9Cj4gPiArCj4gPiArdm9pZCB0ZXN0X3ZtX2NsZWFudXAoc3RydWN0IGt2bV92bSAqdm0pCj4g
PiArewo+ID4gKyAgICAga3ZtX3ZtX2ZyZWUodm0pOwo+ID4gK30KPiA+IC0tCj4gPiAyLjM0LjEK
PiA+Cj4KPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
