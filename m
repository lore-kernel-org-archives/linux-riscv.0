Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14041C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANKOv/bNmPNcpwxeVx3lx/cPYXe0QJ9GkA5cSLfSR48=; b=3PvRD30riiaa9W
	yCWMR/kRYjeV+K7dTg78AODuSz3N9Qzd/umBEWAO0cRBaanp3pSNxfe+9nXVg7ifsYREd0pw5TQ/T
	vMvzPICKfKFLWcUmjqwlAHTY9FLS8HqmQwHzobvqHFxgpWpgtxeojBZsrikwX4+WiSHE67zsBP7PE
	0hgfedM9dsXqFIwI3MFoU0/IORkz6tZpjMPflKuLxCW7DyuK0XGXFiiOonuch/JVyhJWaWcMphTgm
	jC+4UFYoW2GYO8rWWB2ZZdwl807++61a9CIdybQjX7xwOe7H9xvnUyxC0VcLFCk4rac3qF959Q2P1
	hZ6n3p9GH4j6zNC2/XYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyRr-00000006JvI-1VPQ;
	Mon, 17 Aug 2026 14:36:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyRo-00000006Ju3-3EGu
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:36:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so3086554f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 07:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786977379; cv=none;
        d=google.com; s=arc-20260327;
        b=AETOg/dS0wviq84EBdaL28KiA1VeALIAXnWxlxmTULtQkTJ/Iv9+ANtc3eVgjt9ij7
         jNhZhQQPJ9J492wL9yZ6eM8l7phYT2RJlMtH0NBVmrhpRYdR0qsm1ZTEnhmiRFifQXkY
         JQVHvz+7nLghwMdjx4uzJTMJb++25IqqLTyGaogdp4KG3t9pXuYR/PWPJpOMSut/hPw+
         9pFXdXaUEBP2B2hEkDQLMRbL8TdiFpyejWKqeXZhSdCTJEbeXSBrMs8yAgfyht8bO3j9
         /DsiBpMfZUYAgVIcD1VPiC0Y968yUoxPOruk+LbRtWJw0SSC/6RXUPVTkeNOhE9nq+LA
         /QgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Q9mUk1j9BGIZ4+aL3dH4Blj/F6t4jRqGRH0W+LkDsA=;
        fh=brfo6Ysyf96agF5jUnIB1va1uhheD9smAXhC4AjqiMg=;
        b=c5zZoJUt8ThzxM6lsxNa4411yx2U9MTW3JbmivnoXLZA0uFlGvH+HgQdOuIMOyxgpD
         QvxQl0OvYE8DxQKrm7RqduOiEPzB/vg+pkNLcumnv8u1sxx88oDkFwYcOKgcWO168MWT
         JfiXu9rAsTUuu0T/LC4I4F8/Xs3SX2zx+Sp22UY7uLzLrxOCoInHYunsEOSsP5eqFQOf
         7SY83qS3KEpw1r/fSHaa4Jc6Mxjksf/m357Mor85pp+FMfaU3d3cUxT0cfgAweN26h87
         zNTELaHlV5xpcHz4Hk5xqKlvg6/OMdi40YiQzJx8ywWiQyzWv0jFwZyeYmlLyXbrHmNF
         FPug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786977379; x=1787582179; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Q9mUk1j9BGIZ4+aL3dH4Blj/F6t4jRqGRH0W+LkDsA=;
        b=Hin9Dgn2wfBFsrEpTBzTby0h//pgQXVoDHGQqcj3MlUhJYSFn1CT76EZpOQ9q7e5XS
         HWqe0z8IBmuQYx7kbk29aAd/J/b7yFkPiD50f8dMOsNAbFo9e6cxksT2rGDJlzFXmBsF
         rsPodOq5rF4TI7ukeiN0/xYq43JLC5YAT1x/VUAK33Abaw8fSV90z8unmC1J/gfKNLPm
         MHt6ce9iadmBGD0fOjVitvI3GVXUdXFc0XMS4e2m3Ix5FU1GoHO1uS+2271F5a5t/r4V
         CrsAoQI+lBRdpDktGiawZzPkG24rA8hsKcdwiGftf8rMLIzWawOhcgiP8tsoBI90rs5d
         a34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977379; x=1787582179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Q9mUk1j9BGIZ4+aL3dH4Blj/F6t4jRqGRH0W+LkDsA=;
        b=POS6qakqkbQvCnrhCcuoNmDUh9IDZgFDVe3hR/1XHUp+BLbXuEbgPYfYoLUSIkEcG6
         RcPnpNPducfsRFkJyBo3545nbN4MUWJMSnCbbJERhTN4xvX5qZzg7px7c5nskZ3ek4w3
         5VdU30AnBTGHtGVBzvqJWsFxYkB52ewL/o2kmqu6hoZkrEFdblopjXF4TrFvp7AtdS07
         ZBHOyGt34tF//tCHKFglP17sAAnvkirTd9ysg8E/ro90dpOnRU9oNkSf8WrjsCgWHzOM
         lTGIECsApgNpfj4UALeOU7mruHgJ+So1Xv7brg+mFoSXm4zvFNr9cQzOHV+Md2r3gN3h
         4Fzg==
X-Gm-Message-State: AOJu0YxMEQ278Qe7zc1RAhiyrkoT6XDsmcz+XvZaGPTd0X8sAwoIOFZD
	+VexBnST/l/3vr2B1Cs1/WO0hvf4NPlfkhJPZW2EWzdzgmaVNAEeoV0T7kkWde0lhOyruVrf4C2
	riQdPFl1i75aYdSLHvdWvdD/sg0zhfI8pwiYIN8uH6g==
X-Gm-Gg: AR+sD10Uv7wW4L6kU6/z0HP3WlISgfL+z9dUv/D0dIFB4NepMufJyvGICzib2stuxJh
	/JSPT5lb6mLqgPbiE74ygrkvtzyftgoR+V2aXkhcG1h2HNSzHOrNBwixVu2nZjLWnO7uwPcTHlg
	6FtoqsJPEzEoXFNLjm/F6cLkTgKXNCldzb/Wc6Xm6fIbmUiYNA6eDxmvGeCd4yyI5+d1a73Hao0
	IQOoSQ07IYGFvi5elhIY/fjRGdMsojniVAhjdogqsMoHCaqo052FWY0qqj1W2zQVZqdlohX+9kM
	rxsQ3KVUykKAw5l6BOgw+7xQ/RoktwNJ0wagzDwmynFITXa+1uKKWWBxGosKbPoE9i/4ktgfJ8A
	oF41l1DTs7n10lKskwgNcEYNy4NHGZgV2mxiBP8xAgUlS5zNpUVT0ppdJeFSRThs=
X-Received: by 2002:a5d:6d44:0:b0:481:474a:9a05 with SMTP id
 ffacd0b85a97d-4816078593emr30358115f8f.26.1786977378942; Mon, 17 Aug 2026
 07:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-4-guoren@kernel.org>
In-Reply-To: <20260816070049.2097442-4-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Aug 2026 20:06:05 +0530
X-Gm-Features: AcwNN1VGUgzpoeXy4pY2Dsz25rS5MCofp5xHQHLd12Nx15XaIV2eYim1MLYS1V8
Message-ID: <CAAhSdy2TxxiK_yPx5Sjhy3SMf5PsKry2-W+oYZbqqWZHUr8SMw@mail.gmail.com>
Subject: Re: [PATCH 3/5] clocksource: clint: Use IPI_MAX for IPI muxing
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tglx@kernel.org, daniel.lezcano@kernel.org, hui.wang@canonical.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_073620_822655_21450375 
X-CRM114-Status: GOOD (  13.92  )
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

T24gU3VuLCBBdWcgMTYsIDIwMjYgYXQgMTI6MzHigK9QTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiR1VPIFJlbiAoWHVhblRpZSkiIDxndW9yZW5Aa2VybmVs
Lm9yZz4KPgo+IFJlcGxhY2UgdGhlIGhhcmQtY29kZWQgQklUU19QRVJfQllURSB3aXRoIElQSV9N
QVggbm93IHRoYXQgdGhlCj4gY29uc3RhbnQgaXMgZXhwb3J0ZWQgZnJvbSByaXNjdiBhc20vc21w
LmguCj4KPiBTaWduZWQtb2ZmLWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5v
cmc+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50
LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMg
Yi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMKPiBpbmRleCAwYmRkOWQ3ZWM1NDUu
LmU1NmVlZTdlMzc4MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNs
aW50LmMKPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMKPiBAQCAtMjQz
LDcgKzI0Myw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNsaW50X3RpbWVyX2luaXRfZHQoc3RydWN0
IGRldmljZV9ub2RlICpucCkKPiAgICAgICAgIH0KPgo+ICAjaWZkZWYgQ09ORklHX1NNUAo+IC0g
ICAgICAgcmMgPSBpcGlfbXV4X2NyZWF0ZShCSVRTX1BFUl9CWVRFLCBjbGludF9zZW5kX2lwaSk7
Cj4gKyAgICAgICByYyA9IGlwaV9tdXhfY3JlYXRlKElQSV9NQVgsIGNsaW50X3NlbmRfaXBpKTsK
PiAgICAgICAgIGlmIChyYyA8PSAwKSB7Cj4gICAgICAgICAgICAgICAgIHByX2VycigidW5hYmxl
IHRvIGNyZWF0ZSBtdXhlZCBJUElzXG4iKTsKPiAgICAgICAgICAgICAgICAgcmMgPSAocmMgPCAw
KSA/IHJjIDogLUVOT0RFVjsKPiBAQCAtMjUxLDcgKzI1MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IGNsaW50X3RpbWVyX2luaXRfZHQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiAgICAgICAgIH0K
Pgo+ICAgICAgICAgaXJxX3NldF9jaGFpbmVkX2hhbmRsZXIoY2xpbnRfaXBpX2lycSwgY2xpbnRf
aXBpX2ludGVycnVwdCk7Cj4gLSAgICAgICByaXNjdl9pcGlfc2V0X3ZpcnFfcmFuZ2UocmMsIEJJ
VFNfUEVSX0JZVEUpOwo+ICsgICAgICAgcmlzY3ZfaXBpX3NldF92aXJxX3JhbmdlKHJjLCBJUElf
TUFYKTsKPiAgICAgICAgIGNsaW50X2NsZWFyX2lwaSgpOwo+ICAjZW5kaWYKPgo+IC0tCj4gMi40
My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
