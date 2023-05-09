Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CD4C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6doi8JYFjGha27R+FOHMQDA9cwkuw6NsF1d6IgdK9Uo=; b=2J0iHaI7K8CRSjxIo3rCjeycT1
	CztGNZz3uiGicz5UzJWwYaucSYR1sO5hHA8W9vTIc0x/JJ+7aL+hDl7LQ8vOGRXgtkg7S8nshorzi
	fq8V5wyzfXey9iUY4XyLAvzHvK3KZ0Yj83G3UU2j/pTV32iHF/NShMMO5NortDPIkCgpPb3qkbXAN
	mXG+PgQA/aEltGm8zaXwpcqY0FVj1d/u2dh6B13M7q4SMlUQrtfb6hM1GelMNpd22EaUuvMp5Kulg
	sEsGFnx0Jq4z1JHUX+g/iZe5zQfIx0qznG3KcxBcpA2tJtRQ5YI1RDI1bFV72QpFhx5f6hyKS8O5H
	s0SX53lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRc0-003woQ-1P;
	Tue, 09 May 2023 17:58:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRbw-003wnD-1d
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 17:58:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1aafa03f541so60599365ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683655130; x=1686247130;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlJsm86rT3SLxx+ZGGQ6/9XUqT8vn3qcLSBujAHvDQ0=;
        b=ge5QAE+vHW6/rthSAGBTramJL/OLMOEhOQnhkHzfuddyaQoTFa5elRBLKMrZrtNF7s
         a9Ra9ow9c8YNhriMVriuo9+kFNKHi93gtDfYsVYvC22KJ4fOlIC7iFISc69GaNxBWCRL
         VAVSpyOmRQ6yDIvAeuhZWHIZpfGwupLja9Gr+UwV+ZJTzziefN9m1dzQOW0p1VdCClLB
         0uVjfITEg4AwPUY+LxUbIky1aF1gz3N3RAraF1+JQ+QIvLd2iMwDdQ7cwPLohOlgsFSt
         VH5cYTeSl9+fWtNtLkMdOH/1wtja7t8bs20sCA3/uBvkkChbcEnRbavwOz654xSDDv6V
         +Rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655130; x=1686247130;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlJsm86rT3SLxx+ZGGQ6/9XUqT8vn3qcLSBujAHvDQ0=;
        b=NwKTpFJWbKM03gMq/hIeM54MMwfmfZyNOOVKAnFiko30yQQWCkaB3nVRSpSpnEacu5
         Qrx3BNWeNiqzOy/7EAEBAhr/K1VNEf7OxdxlykotdLxG843zaaBAd3BqJPsKcntjs1ir
         lgIRuIY5Thna7NsaMU+LtgjDsqQrbMCBFl3PnEyZzarwBjLUD2GGTqCPhw6RlenyHt5E
         WxQHCgBM/DnLuMjKnsACwMlhPecfFurAF7uB/QJpN9d8Y+jjR59YcDSQHmvQoUlNXBu6
         DNqTWWKSHEfNErapSJMgh5wVdB44CJQD/Wj9XoC2mVmGZX/1OpyCtqHbiQVvakweVjn9
         A6iQ==
X-Gm-Message-State: AC+VfDzRIYpjw68lhExCovQsZvU8N2t1A8RtMrle0wcGPFogknhYcKDT
	47YeK6URmREcb7G6oylzWTZeRIGnaPBH51g41T8=
X-Google-Smtp-Source: ACHHUZ5P1nlX10L+l60QDQSm73QeWCEprrfYGDnaXTPF/DVkKuwBOGe7eRAB+60LjZTEm6Qd9OQAjA==
X-Received: by 2002:a17:903:32cb:b0:1ac:94a9:941a with SMTP id i11-20020a17090332cb00b001ac94a9941amr4415200plr.30.1683655130332;
        Tue, 09 May 2023 10:58:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id io20-20020a17090312d400b0019fea4d61c9sm1896204plb.198.2023.05.09.10.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:58:49 -0700 (PDT)
Date: Tue, 09 May 2023 10:58:49 -0700 (PDT)
X-Google-Original-Date: Tue, 09 May 2023 10:58:29 PDT (-0700)
Subject: Re: [PATCH -next v19 20/24] riscv: Add prctl controls for userspace vector management
In-Reply-To: <2629220.BddDVKsqQX@diego>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-399d1e16-1a51-466f-8e71-c17e9b360d07@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_105852_783562_29A5F0F2 
X-CRM114-Status: GOOD (  18.31  )
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
Cc: wangkefeng.wang@huawei.com, guoren@linux.alibaba.com, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, Catalin Marinas <catalin.marinas@arm.com>, atishp@atishpatra.org, Jason@zx2c4.com, joey.gouly@arm.com, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org, anup@brainfault.org, greentime.hu@sifive.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com, shr@devkernel.io, Vineet Gupta <vineetg@rivosinc.com>, josh@joshtriplett.org, Paul Walmsley <paul.walmsley@sifive.com>, jordyzomer@google.com, omosnace@redhat.com, vincent.chen@sifive.com, ebiederm@xmission.com, kvm-riscv@lists.infradead.org, akpm@linux-foundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwOSBNYXkgMjAyMyAwNDoxNDoyNiBQRFQgKC0wNzAwKSwgaGVpa29Ac250ZWNoLmRl
IHdyb3RlOgo+IEhpLAo+Cj4gbmVlZCB0byBwb2tlIHRoaXMgbW9yZSwgYnV0IG9uZSBpc3N1ZSBw
b3BwZWQgdXAgYXQgZmlyc3QgY29tcGlsZS4KPgo+IEFtIERpZW5zdGFnLCA5LiBNYWkgMjAyMywg
MTI6MzA6MjkgQ0VTVCBzY2hyaWViIEFuZHkgQ2hpdToKPj4gVGhpcyBwYXRjaCBhZGQgdHdvIHJp
c2N2LXNwZWNpZmljIHByY3RscywgdG8gYWxsb3cgdXNlc3BhY2UgY29udHJvbCB0aGUKPj4gdXNl
IG9mIHZlY3RvciB1bml0Ogo+Pgo+PiAgKiBQUl9SSVNDVl9WX1NFVF9DT05UUk9MOiBjb250cm9s
IHRoZSBwZXJtaXNzaW9uIHRvIHVzZSBWZWN0b3IgYXQgbmV4dCwKPj4gICAgb3IgYWxsIGZvbGxv
d2luZyBleGVjdmUgZm9yIGEgdGhyZWFkLiBUdXJuaW5nIG9mZiBhIHRocmVhZCdzIFZlY3Rvcgo+
PiAgICBsaXZlIGlzIG5vdCBwb3NzaWJsZSBzaW5jZSBsaWJyYXJpZXMgbWF5IGhhdmUgcmVnaXN0
ZXJlZCBpZnVuYyB0aGF0Cj4+ICAgIG1heSBleGVjdXRlIFZlY3RvciBpbnN0cnVjdGlvbnMuCj4+
ICAqIFBSX1JJU0NWX1ZfR0VUX0NPTlRST0w6IGdldCB0aGUgc2FtZSBwZXJtaXNzaW9uIHNldHRp
bmcgZm9yIHRoZQo+PiAgICBjdXJyZW50IHRocmVhZCwgYW5kIHRoZSBzZXR0aW5nIGZvciBmb2xs
b3dpbmcgZXhlY3ZlKHMpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hp
dUBzaWZpdmUuY29tPgo+PiBSZXZpZXdlZC1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVA
c2lmaXZlLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNp
Zml2ZS5jb20+Cj4KPgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+PiBpbmRleCA5NjBhMzQzNzk5YzYuLjE2Y2Ni
MzU2MjVhOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPj4gQEAgLTksNiArOSw3IEBACj4+ICAjaW5j
bHVkZSA8bGludXgvc2xhYi5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4+ICAjaW5j
bHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3ByY3RsLmg+Cj4+Cj4+
ICAjaW5jbHVkZSA8YXNtL3RocmVhZF9pbmZvLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nv
ci5oPgo+PiBAQCAtMTksNiArMjAsOCBAQAo+PiAgI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KPj4g
ICNpbmNsdWRlIDxhc20vYnVnLmg+Cj4+Cj4+ICtzdGF0aWMgYm9vbCByaXNjdl92X2ltcGxpY2l0
X3VhY2MgPSAhSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfVl9ESVNBQkxFKTsKPj4gKwo+PiAgdW5z
aWduZWQgbG9uZyByaXNjdl92X3ZzaXplIF9fcmVhZF9tb3N0bHk7Cj4+ICBFWFBPUlRfU1lNQk9M
X0dQTChyaXNjdl92X3ZzaXplKTsKPj4KPj4gQEAgLTkxLDExICs5NCw1MSBAQCBzdGF0aWMgaW50
IHJpc2N2X3ZfdGhyZWFkX3phbGxvYyh2b2lkKQo+PiAgCXJldHVybiAwOwo+PiAgfQo+Pgo+PiAr
I2RlZmluZSBWU1RBVEVfQ1RSTF9HRVRfQ1VSKHgpICgoeCkgJiBQUl9SSVNDVl9WX1ZTVEFURV9D
VFJMX0NVUl9NQVNLKQo+PiArI2RlZmluZSBWU1RBVEVfQ1RSTF9HRVRfTkVYVCh4KSAoKCh4KSAm
IFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfTkVYVF9NQVNLKSA+PiAyKQo+PiArI2RlZmluZSBWU1RB
VEVfQ1RSTF9NQUtFX05FWFQoeCkgKCgoeCkgPDwgMikgJiBQUl9SSVNDVl9WX1ZTVEFURV9DVFJM
X05FWFRfTUFTSykKPj4gKyNkZWZpbmUgVlNUQVRFX0NUUkxfR0VUX0lOSEVSSVQoeCkgKCEhKCh4
KSAmIFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfSU5IRVJJVCkpCj4+ICtzdGF0aWMgaW5saW5lIGlu
dCByaXNjdl92X2dldF9jdXJfY3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKPj4gK3sKPj4g
KwlyZXR1cm4gVlNUQVRFX0NUUkxfR0VUX0NVUih0c2stPnRocmVhZC52c3RhdGVfY3RybCk7Cj4+
ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgaW50IHJpc2N2X3ZfZ2V0X25leHRfY3RybChzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRzaykKPj4gK3sKPj4gKwlyZXR1cm4gVlNUQVRFX0NUUkxfR0VUX05F
WFQodHNrLT50aHJlYWQudnN0YXRlX2N0cmwpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5l
IGJvb2wgcmlzY3Zfdl90ZXN0X2N0cmxfaW5oZXJpdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykK
Pj4gK3sKPj4gKwlyZXR1cm4gVlNUQVRFX0NUUkxfR0VUX0lOSEVSSVQodHNrLT50aHJlYWQudnN0
YXRlX2N0cmwpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl9zZXRf
Y3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgaW50IGN1ciwgaW50IG54dCwKPj4gKwkJCQkg
ICAgYm9vbCBpbmhlcml0KQo+PiArewo+PiArCXVuc2lnbmVkIGxvbmcgY3RybDsKPj4gKwo+PiAr
CWN0cmwgPSBjdXIgJiBQUl9SSVNDVl9WX1ZTVEFURV9DVFJMX0NVUl9NQVNLOwo+PiArCWN0cmwg
fD0gVlNUQVRFX0NUUkxfTUFLRV9ORVhUKG54dCk7Cj4+ICsJaWYgKGluaGVyaXQpCj4+ICsJCWN0
cmwgfD0gUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9JTkhFUklUOwo+PiArCXRzay0+dGhyZWFkLnZz
dGF0ZV9jdHJsID0gY3RybDsKPj4gK30KPj4gKwo+PiArYm9vbCByaXNjdl92X3VzZXJfYWxsb3dl
ZCh2b2lkKQo+PiArewo+PiArCXJldHVybiByaXNjdl92X2dldF9jdXJfY3RybChjdXJyZW50KSA9
PSBQUl9SSVNDVl9WX1ZTVEFURV9DVFJMX09OOwo+PiArfQo+Cj4gRVhQT1JUX1NZTUJPTChyaXNj
dl92X3VzZXJfYWxsb3dlZCk7Cj4KPiBrdm0gaXMgYWxsb3dlZCB0byBiZSBidWlsdCBhcyBtb2R1
bGUsIHNvIHlvdSBjb3VsZCBlbmQgdXAgd2l0aDoKPgo+IEVSUk9SOiBtb2Rwb3N0OiAicmlzY3Zf
dl91c2VyX2FsbG93ZWQiIFthcmNoL3Jpc2N2L2t2bS9rdm0ua29dIHVuZGVmaW5lZCEKPiBtYWtl
WzJdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxMzY6IE1vZHVsZS5zeW12ZXJz
XSBGZWhsZXIgMQo+IG1ha2VbMV06ICoqKiBbL2hvbWUvZGV2ZWwvaHN0dWVibmVyLzAwX2dpdC1y
ZXBvcy9saW51eC1yaXNjdi9NYWtlZmlsZToxOTc4OiBtb2Rwb3N0XSBGZWhsZXIgMgo+IG1ha2Vb
MV06IFZlcnplaWNobmlzIOKAni9ob21lL2RldmVsL2hzdHVlYm5lci8wMF9naXQtcmVwb3MvbGlu
dXgtcmlzY3YvX2J1aWxkLXJpc2N2NjTigJwgd2lyZCB2ZXJsYXNzZW4KPiBtYWtlOiAqKiogW01h
a2VmaWxlOjIyNjogX19zdWItbWFrZV0gRmVobGVyIDIKCmFuZCBwcmVzdW1hYmx5IHRoYXQgbWVh
bnMgdGhhdCAibWFrZSBhbGxtb2Rjb25maWciIGhhc24ndCBiZWVuIHJ1biwgCndoaWNoIG1pZ2h0
IHNoYWtlIG91dCBzb21lIG1vcmUgaXNzdWVzLgoKPgo+Cj4gSGVpa28KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
