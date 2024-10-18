Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11091D3F281
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 20:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAi8Kphtf/B6wh15JPGZy4zjFVeRThMJtp+zfbkM8fo=; b=2+7niq2jHNlS+v
	U7ySZHtN5JzFzbKQg20qLxzD2+fXQJINNIBIaHW5dFx7j3/rb5fc7maUM4mXruE/bzlytHMzBY2/x
	ph396JyUKv2GbrOKBUk/uDMTvJgWN5HJXH19xFIj/w3OKCdTgx5Ic0357Sh+zV9OW/jRkB7nUyeyo
	aK9DLuilM99NP5aYH98hfZxjtaem8DM9v0xWPda2nEL7WYVCBU4xENHqR4U4CiPpRjqPeYsJdsxLy
	VlhxX08kBFFPxkLHjmOkRc4hQ6ENpbJ477550qnYWqEavvOJrlXN+hJ3gilBoCrPzoqlOAYyPrjcX
	/o/CkR+nQW/YomAExHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1tJv-00000001uVM-3nSv;
	Fri, 18 Oct 2024 20:11:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1tJs-00000001uUE-1WGL
	for linux-riscv@lists.infradead.org;
	Fri, 18 Oct 2024 20:11:33 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so3038212e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Oct 2024 13:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1729282290; x=1729887090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjceIsWcwiJi9o8K3wuHgDeqcBFmrQpMfaaoOm2yWMc=;
        b=oYS4YQ3b3uOV0IvEP7uYMNeJCdxdKCCOx0LbvExraAYUWuk62mEpKzGXLhiysgKxdU
         pTjcBM/Xi2L2bHAf0Kmd5pL84SVKFuSWIULgrw/w0z7bMeHIy3eHCcuGHUO2rvxboZ8C
         I+6Ay5gy1h9HHfRhwunaqy0E1oYPniQtVBfrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729282290; x=1729887090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjceIsWcwiJi9o8K3wuHgDeqcBFmrQpMfaaoOm2yWMc=;
        b=cP8h55CjQdpvhoo4N3axLWVIDXmvoKmZ2j8C/fkJirsOxlscLzLGThywOUgYBZnCjW
         so40G5hN7rbgRPc6v8302X0GrqVL36k29BjqGsrAd9rNjMWAQQ7/SVH8i83XV/N+PRI8
         Zifx20/um7eWXSoMIL8Z/eyUiNkmT94zDifF9+C2f+qMRaQ13/LHba8jrxNUlXbU5d1m
         VFP0qx+eqxdz+Ggz5Pqsw2gGrNs4xE+GHWB5iKPFOBri4DixvHrQQlvNHTSMNrW+AKiX
         KOtYsUto4PVqylbZYmJwG2nI7bPKsvKD35qLDON/9g6Lz899kqfVZLNrEdS1MewDuMwz
         q9kg==
X-Forwarded-Encrypted: i=1; AJvYcCWx0yJuuhPW5/tT0dLIhyXEJ8RvHz6tKAXxbzph/8MFr8yo5568Q05KQeZigzq9NL1uavnpA+33o+2tOg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi7uutzxv44feHHh6TFuWi8qhm67R+ry8HX60gFfn3f/GYh3SU
	wfTWH4aid8Wi7E4qN9tfhuxiPO1SGjY0RX49+Aj4AU3WN/N9PULuAQJnXs19F6RnraWqkp4Bnl9
	Am+zLCO73ZZIt6aZBcmW9zLQZozdPGcb6EM1K
X-Google-Smtp-Source: AGHT+IEdHOrSLjkzUAeYvCUQQHFAMWufe92JOuvK/VstP4tFd3/prjystEPcQ+qjzWFtQzonKenRkCQKn82nAdly+bo=
X-Received: by 2002:a05:6512:6c5:b0:530:ad7d:8957 with SMTP id
 2adb3069b0e04-53a1545dff1mr2826449e87.49.1729282290131; Fri, 18 Oct 2024
 13:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240719160913.342027-1-apatel@ventanamicro.com> <20240719160913.342027-13-apatel@ventanamicro.com>
In-Reply-To: <20240719160913.342027-13-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 18 Oct 2024 13:11:18 -0700
Message-ID: <CAOnJCULYc-m_Jq-MxwGMbktmCvLPsMiA_tzxE2qYuoKgeR0BEw@mail.gmail.com>
Subject: Re: [PATCH 12/13] RISC-V: KVM: Save trap CSRs in kvm_riscv_vcpu_enter_exit()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_131132_429777_4B9B92CE 
X-CRM114-Status: GOOD (  19.80  )
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

T24gRnJpLCBKdWwgMTksIDIwMjQgYXQgOToxMOKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFNhdmUgdHJhcCBDU1JzIGluIHRoZSBrdm1fcmlzY3Zf
dmNwdV9lbnRlcl9leGl0KCkgZnVuY3Rpb24gaW5zdGVhZCBvZgo+IHRoZSBrdm1fYXJjaF92Y3B1
X2lvY3RsX3J1bigpIGZ1bmN0aW9uIHNvIHRoYXQgSFRWQUwgYW5kIEhUSU5TVCBDU1JzCj4gYXJl
IGFjY2Vzc2VkIGluIG1vcmUgb3B0aW1pemVkIG1hbm5lciB3aGlsZSBydW5uaW5nIHVuZGVyIHNv
bWUgb3RoZXIKPiBoeXBlcnZpc29yLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBh
dGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDM0
ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IGZlODQ5ZmIxYWFh
Yi4uODU0ZDk4YWExNjVlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC03NTcsMTIgKzc1NywyMSBAQCBzdGF0aWMg
X19hbHdheXNfaW5saW5lIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc3dhcF9pbl9ob3N0X3N0YXRlKHN0
cnVjdCBrdm1fdmNwdSAqdgo+ICAgKiBUaGlzIG11c3QgYmUgbm9pbnN0ciBhcyBpbnN0cnVtZW50
YXRpb24gbWF5IG1ha2UgdXNlIG9mIFJDVSwgYW5kIHRoaXMgaXMgbm90Cj4gICAqIHNhZmUgZHVy
aW5nIHRoZSBFUVMuCj4gICAqLwo+IC1zdGF0aWMgdm9pZCBub2luc3RyIGt2bV9yaXNjdl92Y3B1
X2VudGVyX2V4aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICtzdGF0aWMgdm9pZCBub2luc3Ry
IGt2bV9yaXNjdl92Y3B1X2VudGVyX2V4aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX2NwdV90
cmFwICp0cmFwKQo+ICB7Cj4gICAgICAgICB2b2lkICpuc2g7Cj4gICAgICAgICBzdHJ1Y3Qga3Zt
X2NwdV9jb250ZXh0ICpnY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4gICAgICAg
ICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpoY250eCA9ICZ2Y3B1LT5hcmNoLmhvc3RfY29udGV4
dDsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFdlIHNhdmUgdHJhcCBDU1JzIChzdWNoIGFz
IFNFUEMsIFNDQVVTRSwgU1RWQUwsIEhUVkFMLCBhbmQKPiArICAgICAgICAqIEhUSU5TVCkgaGVy
ZSBiZWNhdXNlIHdlIGRvIGxvY2FsX2lycV9lbmFibGUoKSBhZnRlciB0aGlzCj4gKyAgICAgICAg
KiBmdW5jdGlvbiBpbiBrdm1fYXJjaF92Y3B1X2lvY3RsX3J1bigpIHdoaWNoIGNhbiByZXN1bHQg
aW4KPiArICAgICAgICAqIGFuIGludGVycnVwdCBpbW1lZGlhdGVseSBhZnRlciBsb2NhbF9pcnFf
ZW5hYmxlKCkgYW5kIGNhbgo+ICsgICAgICAgICogcG90ZW50aWFsbHkgY2hhbmdlIHRyYXAgQ1NS
cy4KPiArICAgICAgICAqLwo+ICsKPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3N3YXBfaW5fZ3Vl
c3Rfc3RhdGUodmNwdSk7Cj4gICAgICAgICBndWVzdF9zdGF0ZV9lbnRlcl9pcnFvZmYoKTsKPgo+
IEBAIC04MDUsMTQgKzgxNCwyNCBAQCBzdGF0aWMgdm9pZCBub2luc3RyIGt2bV9yaXNjdl92Y3B1
X2VudGVyX2V4aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgICAgICAgICB9IGVs
c2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdjbnR4LT5oc3RhdHVzID0gY3NyX3N3YXAo
Q1NSX0hTVEFUVVMsIGhjbnR4LT5oc3RhdHVzKTsKPiAgICAgICAgICAgICAgICAgfQo+ICsKPiAr
ICAgICAgICAgICAgICAgdHJhcC0+aHR2YWwgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX0hUVkFM
KTsKPiArICAgICAgICAgICAgICAgdHJhcC0+aHRpbnN0ID0gbmFjbF9jc3JfcmVhZChuc2gsIENT
Ul9IVElOU1QpOwo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgaGNudHgtPmhz
dGF0dXMgPSBjc3Jfc3dhcChDU1JfSFNUQVRVUywgZ2NudHgtPmhzdGF0dXMpOwo+Cj4gICAgICAg
ICAgICAgICAgIF9fa3ZtX3Jpc2N2X3N3aXRjaF90bygmdmNwdS0+YXJjaCk7Cj4KPiAgICAgICAg
ICAgICAgICAgZ2NudHgtPmhzdGF0dXMgPSBjc3Jfc3dhcChDU1JfSFNUQVRVUywgaGNudHgtPmhz
dGF0dXMpOwo+ICsKPiArICAgICAgICAgICAgICAgdHJhcC0+aHR2YWwgPSBjc3JfcmVhZChDU1Jf
SFRWQUwpOwo+ICsgICAgICAgICAgICAgICB0cmFwLT5odGluc3QgPSBjc3JfcmVhZChDU1JfSFRJ
TlNUKTsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgdHJhcC0+c2VwYyA9IGdjbnR4LT5zZXBjOwo+
ICsgICAgICAgdHJhcC0+c2NhdXNlID0gY3NyX3JlYWQoQ1NSX1NDQVVTRSk7Cj4gKyAgICAgICB0
cmFwLT5zdHZhbCA9IGNzcl9yZWFkKENTUl9TVFZBTCk7Cj4gKwo+ICAgICAgICAgdmNwdS0+YXJj
aC5sYXN0X2V4aXRfY3B1ID0gdmNwdS0+Y3B1Owo+ICAgICAgICAgZ3Vlc3Rfc3RhdGVfZXhpdF9p
cnFvZmYoKTsKPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3N3YXBfaW5faG9zdF9zdGF0ZSh2Y3B1
KTsKPiBAQCAtOTI5LDIyICs5NDgsMTEgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfcnVuKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgICAgICAgICBndWVzdF90aW1pbmdfZW50
ZXJfaXJxb2ZmKCk7Cj4KPiAtICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfZW50ZXJfZXhp
dCh2Y3B1KTsKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfZW50ZXJfZXhpdCh2Y3B1
LCAmdHJhcCk7Cj4KPiAgICAgICAgICAgICAgICAgdmNwdS0+bW9kZSA9IE9VVFNJREVfR1VFU1Rf
TU9ERTsKPiAgICAgICAgICAgICAgICAgdmNwdS0+c3RhdC5leGl0cysrOwo+Cj4gLSAgICAgICAg
ICAgICAgIC8qCj4gLSAgICAgICAgICAgICAgICAqIFNhdmUgU0NBVVNFLCBTVFZBTCwgSFRWQUws
IGFuZCBIVElOU1QgYmVjYXVzZSB3ZSBtaWdodAo+IC0gICAgICAgICAgICAgICAgKiBnZXQgYW4g
aW50ZXJydXB0IGJldHdlZW4gX19rdm1fcmlzY3Zfc3dpdGNoX3RvKCkgYW5kCj4gLSAgICAgICAg
ICAgICAgICAqIGxvY2FsX2lycV9lbmFibGUoKSB3aGljaCBjYW4gcG90ZW50aWFsbHkgY2hhbmdl
IENTUnMuCj4gLSAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICB0cmFwLnNlcGMg
PSB2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQuc2VwYzsKPiAtICAgICAgICAgICAgICAgdHJhcC5z
Y2F1c2UgPSBjc3JfcmVhZChDU1JfU0NBVVNFKTsKPiAtICAgICAgICAgICAgICAgdHJhcC5zdHZh
bCA9IGNzcl9yZWFkKENTUl9TVFZBTCk7Cj4gLSAgICAgICAgICAgICAgIHRyYXAuaHR2YWwgPSBu
Y3NyX3JlYWQoQ1NSX0hUVkFMKTsKPiAtICAgICAgICAgICAgICAgdHJhcC5odGluc3QgPSBuY3Ny
X3JlYWQoQ1NSX0hUSU5TVCk7Cj4gLQo+ICAgICAgICAgICAgICAgICAvKiBTeW5jdXAgaW50ZXJy
dXB0cyBzdGF0ZSB3aXRoIEhXICovCj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3N5
bmNfaW50ZXJydXB0cyh2Y3B1KTsKPgo+IC0tCj4gMi4zNC4xCj4KCgpSZXZpZXdlZC1ieTogQXRp
c2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tIApSZWdhcmRzLApBdGlzaAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
