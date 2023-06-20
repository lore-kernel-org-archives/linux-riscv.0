Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF4DEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fXQi86slc9A1Q0yVNaUSJWeHgHM4HMbc5rbzcN+lHns=; b=28aHgnj6+tFr6xv9fEf7HjgOpD
	EPfRz/VDxeqB3WzCkxCYUIqDZ65ryHqOX41Abc8utRmc+XXtGtry/MvDoeLtY13DSxBzNIrXi4kav
	e0Rl48we6tJ2HfR0+sj5Mvpg00hFhVEPBVqdIi28m0wYkCYCxy3uYaxpOAoHuTeqsYNLpkuBgBg1j
	w0mWDLVyxJhAbJyUhI8F2Ykvv79mcQtrgDDckDouyNEcGLwyhLupSFh+ZFVkVBUUT+gXD5or88Ez5
	+bJ2vkvjYEtXOZf1IQnjEIElAvF7BvK40l8jyZndUs764AxpJf/mIw1xJUCThxBf+0uYuz51U0MSL
	W/lB7BEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiAN-00CJcP-2j;
	Tue, 20 Jun 2023 20:41:31 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiAK-00CJbV-1o
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:41:30 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-66872d4a141so1667036b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 13:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687293687; x=1689885687;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EF5pfw7nSexoxaL00DnHZHZZwsqD5TiJVywKTlCaMwA=;
        b=hWeNrmljP93jSxzhei/v39dLMKKk8J0YPTwSLxt5ZzC4WcVPNA2EvxRCDsFALqOObQ
         5n78ddONrxtndrMaDx2gXwTlxmmDPr2C+PDk/8GXeTc4ULf1Afo6qoU02tM404eSlicn
         tEWUGOJg+ubOS0NfeHea5dQmwj94A0cDG2vPtukz4N37AZ7CoHDWbyIBvYrV7hO6B3bs
         AH3+Wgs1WAAx2OVmkoHiglujxQjdDAgoWN0EinCzyei3djV4G7lcZIkowpVErsPfzUq8
         50+RIIc3XEt10bFk3/HdloIXez5+lzfUkiSJO3yS2bL24Ec6kqsXAM1alFmWBv3M57Ok
         6DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687293687; x=1689885687;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF5pfw7nSexoxaL00DnHZHZZwsqD5TiJVywKTlCaMwA=;
        b=YhQLgwhULgGTzvr1JhoOf9Avbg2/1WT0Lp+DOhP92g+Wu3/8+47oKY8noi26bgqDgz
         p0W9rF7cZB8XDR4SNJQ2eGcUVrIDOTtD1TFBbdbhArBCKa3MefkhLiwS9sSrJEIpMenS
         xYtjveKtuSbv/zWrDb3dfHvtss+LcupEpV6KMrZjVmvB4LdbQ0mxMBR7zHceR7M8sXEL
         yCnaEM18OHeLoRbdb5Df9C/BABq84Vm0mgzAaYJ25mbHNkagOta0mBI72Md6oY/kO/jD
         mrNS99Yfd7id8NJwrOguHJTEMVdsxDoG+eVnZKDRYx7jD/PQpz3dASNg/tfEcbHtgzt+
         1EVg==
X-Gm-Message-State: AC+VfDx3U5cT7prvpucCVnF064bNqwzRSpMbhMBPsSUZCBm5WAeZrpJx
	9DsqYMDec2Oaudl6AhMQkALS+w==
X-Google-Smtp-Source: ACHHUZ6ffVx6Cvd8xsXtqOUfPvX7b64/KBe6+XkBWdmb3+gj5EE2y4oGpVnTGcclXeauAdY0SmiHkA==
X-Received: by 2002:a05:6a20:3d85:b0:118:a48:8977 with SMTP id s5-20020a056a203d8500b001180a488977mr10690039pzi.3.1687293686986;
        Tue, 20 Jun 2023 13:41:26 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c21-20020a62e815000000b00668738796b6sm1677820pfi.52.2023.06.20.13.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:41:26 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:41:26 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 13:39:03 PDT (-0700)
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
In-Reply-To: <CAKwvOdnZ8+CrBGCDhzi8o8UrOjg-CyuRO=OLKpx9X4iGheV77Q@mail.gmail.com>
CC: falcon@tinylab.org, Conor Dooley <conor@kernel.org>, guoren@kernel.org,
  linux-riscv@lists.infradead.org, npiggin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  paulburton@kernel.org, vincent.chen@sifive.com, tim.bird@sony.com, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ndesaulniers@google.com
Message-ID: <mhng-fc838dfb-f78e-4a40-8c39-bdc4ddee3df8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_134128_854252_E71738EB 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMCBKdW4gMjAyMyAxMzoyNjo1MyBQRFQgKC0wNzAwKSwgbmRlc2F1bG5pZXJzQGdv
b2dsZS5jb20gd3JvdGU6Cj4gT24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNDoxN+KAr1BNIFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPj4KPj4gT24gVHVlLCAyMCBK
dW4gMjAyMyAxMzoxMzowNiBQRFQgKC0wNzAwKSwgbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20gd3Jv
dGU6Cj4+ID4gT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMDQ6Mjk6MzZQTSArMDgwMCwgWmhhbmdq
aW4gV3Ugd3JvdGU6Cj4+ID4+IFNlbGVjdCBDT05GSUdfSEFWRV9MRF9ERUFEX0NPREVfREFUQV9F
TElNSU5BVElPTiBmb3IgUklTQy1WLCBhbGxvd2luZwo+PiA+PiB0aGUgdXNlciB0byBlbmFibGUg
ZGVhZCBjb2RlIGVsaW1pbmF0aW9uLiBJbiBvcmRlciBmb3IgdGhpcyB0byB3b3JrLAo+PiA+PiBl
bnN1cmUgdGhhdCB3ZSBrZWVwIHRoZSBhbHRlcm5hdGl2ZSB0YWJsZSBieSBhbm5vdGF0aW5nIHRo
ZW0gd2l0aCBLRUVQLgo+PiA+Pgo+PiA+Cj4+ID4gSnVzdCBjcm9zcyByZWZlcmVuY2luZyB0aGUg
cmVwb3J0IGZyb20gUGFsbWVyIGFnYWluc3QgdjI7IEkgc2VlIG9ycGhhbgo+PiA+IHNlY3Rpb24g
d2FybmluZ3MgZnJvbSB0aGUgbGlua2VyIHJlbGF0ZWQgdG8gdGhlIEVGSSBzdHViIHdoZW4gYnVp
bGRpbmcKPj4gPiBhbGxtb2Rjb25maWcgd2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQuCj4+ID4KPj4g
PiB2MjogdGhyZWFkIGZvciByZWZlcmVuY2UuCj4+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvQ0FLd3ZPZG1zZ01ONW9RcERMaDEyRDBYLUNmUUR0SEMtRXR4SGNCbkFEa2hu
eWl0TUtRQG1haWwuZ21haWwuY29tLwo+Pgo+PiBTb3JyeSBmb3IgcmVwbHlpbmcgdG8gdGhlIHYy
LCBJJ20gbWFya2luZyB0aGF0IGFzIHN1cGVyc2VlZGVkIGluCj4+IHBhdGNod29yay4gIElJVUMg
aXQgaXMgYSByZWFsIGlzc3VlIG9uIHlvdXIgZW5kIHRvbz8gIEknbSBhbHNvIG5vdCAxMDAlCj4+
IHN1cmUgYWJvdXQgdGhlIGhhbmcsIEkganVzdCBsZXQgTExEIGNvb2sgZm9yIGFib3V0IDEwIG1p
bnV0ZXMgYmVmb3JlIEkKPj4gbm90aWNlZCBpdCB3YXMgc3RpbGwgcnVubmluZyBhbmQgcG9zdGVk
Lgo+Cj4gWWVzOyBpZiB0aGlzIGlzIG1lcmdlZCwgb3VyIENJIGJ1aWxkcyBvZiBBUkNIPXJpc2N2
IGFsbG1vZGNvbmZpZyB3aWxsIGdvIHJlZC4KPgo+IEkgYXNzdW1lIGEgbGlua2VyIHNjcmlwdCBz
b21ld2hlcmUgbmVlZHMgdG8gYmUgdXBkYXRlZCwgYnV0IEkgaGF2ZW4ndAo+IGZvdW5kIGlmL3do
ZXJlIHRoZSBlZmkgc3R1YidzIGlzLgo+Cj4gZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi96
Ym9vdC5sZHMgcGVyaGFwcz8KPgo+IE9uIFR1ZSwgSnVuIDIwLCAyMDIzIGF0IDQ6MjLigK9QTSBD
b25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBSZXBlYXRpbmcgbXlz
ZWxmIGZvciB0aGUgc2FrZSBvZiB0aGUgYXJjaGl2ZXMgb3Igdy9lLCB0d28gZGlmZmVyZW50Cj4+
IHN1Ym1pdHRlcnMgd2l0aCBkaWZmZXJpbmcgdmVyc2lvbiBudW1iZXJzLiBUaGUgdjIgZnJvbSBK
aXNoZW5nIGlzIG1vcmUKPj4gcmVjZW50IHRoYW4gdGhlIHYzIGhlcmUgZnJvbSBaaGFuZ2ppbiwg
dGhleSBhZ3JlZWQgaW4gdGhpcyBtYWlsIHRocmVhZAo+PiB0byBtZXJnZSB0aGVpciB3b3JrLgoK
VGhhbmtzLCBzbyB3ZSdyZSBnb2luZyB0byBqdW1wIG92ZXIgdGhlcmUuCgo+Cj4gLS0gCj4gVGhh
bmtzLAo+IH5OaWNrIERlc2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
