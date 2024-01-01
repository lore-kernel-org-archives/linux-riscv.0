Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5118FC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jan 2024 02:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USx1N2ZkD37xOnUQ34Jzg3Ds4E80PFN63eC9Tk+xI4I=; b=z4MCkBM+4YGxjw
	9uDr7wwQdUWrad24xaPqXioCe1wPVb4aA1wxczNMHcky4YEZEnj4UxPnM14I1DCVMsxt3f+CVCnzD
	XODK8PA2oMhht1vqmpTop6zfygaJro5RSG08pN/fpjjELWT7hB/S/gNCXzOIEEFKmmj1XAvjLTGxq
	kHSXZwmPqqUY3LGnlA2BWTUAj4L+YnyK5kJYua5z4mSmDN6Z68iHFwbX5vJmFC+eL4bhv/bVYXn9n
	TtUucguiZG33RpFmSYwUjoNJjyQ2JmlF9yZZiMvZDLdzFP1JejnQulNN5WT+jAmX5caVHyWzzFOCY
	kYCu6hGMPUXJ4KhqBfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rK83f-005Y6E-3C;
	Mon, 01 Jan 2024 02:29:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rK83d-005Y5V-24
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jan 2024 02:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF7FD60EC2
	for <linux-riscv@lists.infradead.org>; Mon,  1 Jan 2024 02:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3038C433B8
	for <linux-riscv@lists.infradead.org>; Mon,  1 Jan 2024 02:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704076174;
	bh=NxcQt/1WVdElhgcHVwYbzLY/6vPTKg2Mr7ScZIEVR7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=deuTnnbhP22cVt2mKII+KMjMY/MdkNY5Tvkb/5RpiAWGhNn7wEPfvUzw1PybSQpwh
	 vru6kbn9xK/daV/HLaPB9JDtK7e2/N/4H4jV4tNeL+N1nYP6a5hudu7CPKLYDp2jXO
	 +15rND5Phz5X1ycirGD85UrH+LzdzO93K5WljP4mRSeIuv4BbMaD69LEKj7bpIWDla
	 4ausGfo+FDNdYsDEsaDIOhANCU0ywF1Au0WC/CKBjf43BQ9Xfb6pXnmVoJfM3Z6sIT
	 Wzq40HjMvjxAV4nJCH53zj3MBKTaO40MRDQ13DmeYLwAVHLppyJ5C5+EMl7DsF+Grf
	 eTT4b5/ocprvA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55559e26ccfso4211521a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 31 Dec 2023 18:29:34 -0800 (PST)
X-Gm-Message-State: AOJu0YzUobsl4K5i+CNkvdGHE83tu1MylCh9RWDCzzrZDb9ptI4wAYzJ
	ON8G1pmQ36P2XcJS/iCdjqtG5H91Cnd4wM0O0ws=
X-Google-Smtp-Source: AGHT+IFYhP/lTo9lpMwcHTK1Xjo1hbbfc1WD5tZJurTZJC1E2j/Mg8ZBMjQY1xh6HrQvXAx9kEtDW4p5Eh59NHPbY8c=
X-Received: by 2002:a50:8e17:0:b0:54f:51cc:6570 with SMTP id
 23-20020a508e17000000b0054f51cc6570mr6935713edw.63.1704076173099; Sun, 31 Dec
 2023 18:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-3-guoren@kernel.org>
In-Reply-To: <20231231082955.16516-3-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 1 Jan 2024 10:29:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTZeN+rfG6szdB+J1QySQ2tAadwpG_zt2cRir7Bn+Yh4g@mail.gmail.com>
Message-ID: <CAJF2gTTZeN+rfG6szdB+J1QySQ2tAadwpG_zt2cRir7Bn+Yh4g@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] riscv: Add ARCH_HAS_PRETCHW support with Zibop
To: paul.walmsley@sifive.com, palmer@dabbelt.com, guoren@kernel.org, 
	panqinglin2020@iscas.ac.cn, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	leobras@redhat.com, peterz@infradead.org, keescook@chromium.org, 
	wuwei2016@iscas.ac.cn, xiaoguang.xing@sophgo.com, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, uwu@icenowy.me, jszhang@kernel.org, wefu@redhat.com, 
	atishp@atishpatra.org, ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_182937_790310_90429D60 
X-CRM114-Status: GOOD (  15.52  )
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

T24gU3VuLCBEZWMgMzEsIDIwMjMgYXQgNDozMOKAr1BNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4KPiBFbmFi
bGUgTGludXggcHJlZmV0Y2h3IHByaW1pdGl2ZSB3aXRoIFppYm9wIGNwdWZlYXR1cmUsIHdoaWNo
IHByZWxvYWRzCj4gY2FjaGUgbGluZSBpbnRvIEwxIGNhY2hlIGZvciB0aGUgbmV4dCB3cml0ZSBv
cGVyYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggfCAxNiArKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmgKPiBpbmRleCBmMTlmODYxY2RhNTQuLjhkM2EyYWIzNzY3OCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+IEBAIC0xMyw2ICsxMyw5IEBACj4gICNpbmNs
dWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgo+Cj4gICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gKyNp
bmNsdWRlIDxhc20vaW5zbi1kZWYuaD4KPiArI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS1tYWNy
b3MuaD4KPiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+Cj4gICNpZmRlZiBDT05GSUdfNjRCSVQK
PiAgI2RlZmluZSBERUZBVUxUX01BUF9XSU5ET1cgICAgIChVTCgxKSA8PCAoTU1BUF9WQV9CSVRT
IC0gMSkpCj4gQEAgLTEwNiw2ICsxMDksMTkgQEAgc3RhdGljIGlubGluZSB2b2lkIGFyY2hfdGhy
ZWFkX3N0cnVjdF93aGl0ZWxpc3QodW5zaWduZWQgbG9uZyAqb2Zmc2V0LAo+ICAjZGVmaW5lIEtT
VEtfRUlQKHRzaykgICAgICAgICAgKHRhc2tfcHRfcmVncyh0c2spLT5lcGMpCj4gICNkZWZpbmUg
S1NUS19FU1AodHNrKSAgICAgICAgICAodGFza19wdF9yZWdzKHRzayktPnNwKQo+Cj4gKyNpZmRl
ZiBDT05GSUdfUklTQ1ZfSVNBX1pJQ0JPUAo+ICsjZGVmaW5lIEFSQ0hfSEFTX1BSRUZFVENIVwo+
ICsKPiArI2RlZmluZSBQUkVGRVRDSFdfQVNNKHgpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBBTFRFUk5BVElWRShfX25vcHMoMSksIENC
T19QUkVGRVRDSF9XKHgsIDApLCAwLCAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAg
ICAgICAgUklTQ1ZfSVNBX0VYVF9aSUNCT1AsIENPTkZJR19SSVNDVl9JU0FfWklDQk9QKQpUaGUg
UFJFRkVUQ0hXX0FTTSh4KSBkZWZpbml0aW9uIHNob3VsZCBiZSBvdXQgb2YgImlmZGVmCkNPTkZJ
R19SSVNDVl9JU0FfWklDQk9QLi4uICNlbmRpZiIsIGJlY2F1c2UgeGNoZ19zbWFsbCBtYXkgdXNl
IHRoaXMKbWFjcm8gd2l0aG91dCBDT05GSUdfUklTQ1ZfSVNBX1pJQ0JPUC4KCj4gKwo+ICsKPiAr
c3RhdGljIGlubGluZSB2b2lkIHByZWZldGNodyhjb25zdCB2b2lkICp4KQo+ICt7Cj4gKyAgICAg
ICBfX2FzbV9fIF9fdm9sYXRpbGVfXyhQUkVGRVRDSFdfQVNNKCUwKSA6IDogInIiICh4KSA6ICJt
ZW1vcnkiKTsKPiArfQo+ICsjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9aSUNCT1AgKi8KPgo+
ICAvKiBEbyBuZWNlc3Nhcnkgc2V0dXAgdG8gc3RhcnQgdXAgYSBuZXdseSBleGVjdXRlZCB0aHJl
YWQuICovCj4gIGV4dGVybiB2b2lkIHN0YXJ0X3RocmVhZChzdHJ1Y3QgcHRfcmVncyAqcmVncywK
PiAtLQo+IDIuNDAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
