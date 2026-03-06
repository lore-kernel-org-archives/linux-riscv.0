Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E528BF51416
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qYyl9juHjHzIJWkHpZcrJgGLvr/U3DV/H+i+ftuJFg=; b=zWDBuj0SYnUnAA
	zYOYiRBIEJK7E7TYpw69gq54y3enc6i07Ut3YF4NEnoseFXJMLintbmR/bXHBKRHf0HEklXcUjImV
	E/fpkPTz85pWdfeZ376ddYpkipGZ7jR0hQQTIg7oojIfzRSDjiaoTwDcNB4xGEtC5rMDJhU/craB4
	vGSVgxcrBWNiWaAdH91ij9SVp/tNXCCuoylnO0+lDmmgNC8vJC9KiJ081vn2qUVfSm0B0c4/yhlXO
	lDAwNskyldS/4eth/ugphir0IHjlAlrL5fzuXghRRF0F71otwTczNqwIqUmC2PhrX7DiKFGaDTGv2
	cTuGephP4qP+PK/JTzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEV-000000037Xl-3E0O;
	Fri, 06 Mar 2026 07:04:23 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPET-000000037Wz-1XrE
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 07:04:23 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-66f3e7d9eccso5741948eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 23:04:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780660; cv=none;
        d=google.com; s=arc-20240605;
        b=KUjnCoYNbYk7EVv6UXYwiyR6mqG7z1o3Nr26VihX+5/8Ouvy35TzWIPkTY0KhgO3zq
         vDRk36WnFG3iu+p7gL+dkWDxHM+rwtxAMlfY+Bm/1+iv/FU0vEB5Zg1c4zCbw3IMf8EL
         SbvExMAFrHxV03vi8p0vsg1e9rG01CQxjuCab/ukRyN1owD/6hE1+3PH2ABU6IBJi6v4
         IA5DuYE6LBXrb4V6PJi4OH7OipmGQVijOd7CcScKJ1ZP8j0wiLVTLbO0Qf4qEHDWO21m
         KDuZHAlXjG35jI68j1UB9Q1Jwn9Y3aHJu0hoEK1zUd9jsdCOWhRTq1uq6YcD1RsgIyUA
         Lpiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        fh=49CtR4It5sapSSVGh+BCaB/cHsfhEs2vjh4tCu0KHtQ=;
        b=KFm6QFbuHAZilF3D/XXDHeN/ruUYQYDNwSwm/tJtqakq0djqh7iooOISmCvK5WuBc1
         J/0ZuR0170AhQ3qBeDaxCVB+CAMUdVHlE0gfuUo+X3UmrBoQo+LHbqbM8pGgWmZAqsYR
         pxoPkPDyCBbxasP3Zm5/BGC1IkoxDaMwwS1UFVSH9GuQ99h2pYtBknKMT/rphw54rF2k
         fduikCHeK/VMbMfLAglaNgSeTk/Q5m/HZuojeCz465MZGSVqt+KtxJc19aODk1qagPrd
         sofyELlTyU+Y//kERnR9JbQ75KBFPPt5lz4Rmsng8QX3Ji92nGXGleNWbx3soOOyDnZF
         NrJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780660; x=1773385460; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        b=BnjV/4DyhFxpN1Tb3k5Rr8DXwFVmaoSuh/eHYQzttVM0WtlwboeVnwphAPDaFWRm1O
         QGrPmfkNzqFubMFDb/99+Q7SqV6VSbsG5nel6Y1q/ERurTdb7GAotu9qq8lyU44CgRfP
         hTAxpd8PxmP/+2G3MkSnVowwnOAphFaTI2PAUrBMs5JjbMV1xNE4zGowz6xUGri6MAFr
         5eIaJOUdbanibYpEqEYOa5wh4HjPommuTDMBVZNflMWaSi9CZpJr7OiLC9U++2FDHa6E
         xanV8nZ7kZOxkDGwlmGNpKptvMj1vbTvlOfO+sKKjoE+gyQHn2SJd/qDn5Ae032S/4yH
         nrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780660; x=1773385460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        b=efGIB7cRpee/SZjYbj8OtQpMx+TNh7zqP6NLGbq0+m/2lgaovC280HZwoxMirH66Zr
         tKMDx+yQ0wzORaW44lPb6/HxWDaENpWphkSbspjIZgpIlO0M1NCeKvv+Ojin0APSEs+c
         qM3XZEowRjsKYzbdZgsFLj7GZGN0waZGKAffkehkR/G0VaiI6+HlUc4IDWwcahjG0c7Y
         eWpye3qfpPTktUzffds7fMAM+Pvaja1WBsY6w4tof7YaxkjXlbinpURfpqjWesr2Sduk
         07kt+VzL1q6XeGmNdddrvG+sTrbOQjutt4Tae6DC9FSsuIkJf7TMDKd1U5xGqp1Dd0Ga
         b7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnA1ylo7zLjtAHWkujqSJZVQSXUl/N7oBTxrwa3ezf4T6mOUnpn5qKvXmPWB65dPeHVme+fj/BvEugOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjyu5pOGoDSaCDcMm0KX3yu8hiPCO4PSMvo3ZaKuyP5ePWTQ4R
	55Ov/u+vPjUca4mrhO3d+yH5CtPQ+xpe8u07uY6C1V7DVZGwzitl7WgN39h6SKuuQkQu7MMEx+s
	ipQ8MVMl0lcDRP/GPOSGgBcOWjkJ7h058/m0G1DRKKg==
X-Gm-Gg: ATEYQzyyAAEvDmUg1X5WArJalw3cIJESev/VRf1SJXZ96f+qeS4govpstScp2SZv9Vw
	VAE11S4HPWg13Q9daMuZ4EK84sJgq47GAkkYVso1iC7CcVIFrWq/ShuJajkVDNChsUDQdln/dJp
	SOAp5f2Y94cKY3fO1MQ5cLmofSTp+mC4+xtg6uFYcseSgD9B0jjXfhdHGKmDrdsiFts2igc7/M2
	d1Ek7WD9biwIn92hNYi+IryGNg3xHTeCkTWPX4Su3ZHMAtwJeoeH76b5U9M3eerQl3ZMk25y4et
	d2ICHrtE+U5sDU5lXq2X5Lr3c6WUXtKiFO6nxJHoyLUTqillVjJFLMhhdNWRQatxPE2p1S+vTSK
	1O/WIaWMD2o5IedCDC93X1lyHEA==
X-Received: by 2002:a05:6820:1b05:b0:674:62e7:190f with SMTP id
 006d021491bc7-67b9bca7baamr925571eaf.17.1772780660047; Thu, 05 Mar 2026
 23:04:20 -0800 (PST)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-2-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-2-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:08 +0530
X-Gm-Features: AaiRm533kBoYnXDCQRSDQXrP3bNbpBpz22jiDNqrmWLzZZYwaIGtUWbuuXDPWwo
Message-ID: <CAAhSdy2u3C2JyakhnSZxuSO2ecJsaz9DXWkRp96CArqHz4Ce9w@mail.gmail.com>
Subject: Re: [PATCH 01/27] RISC-V: KVM: Fix error code returned for Smstateen ONE_REG
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_230421_673577_EFDA8436 
X-CRM114-Status: GOOD (  14.88  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTozMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBSZXR1cm4gLUVOT0VOVCBmb3IgU21zdGF0ZWVu
IE9ORV9SRUcgd2hlbjoKPiAxKSBTbXN0YXRlZW4gaXMgbm90IGVuYWJsZWQgZm9yIGEgVkNQVQo+
IDIpIFdoZW4gT05FX1JFRyBpZCBpcyBvdXQgb2YgcmFuZ2UKPgo+IFRoaXMgd2lsbCBtYWtlIFNt
c3RhdGVlbiBPTkVfUkVHIGVycm9yIGNvZGVzIGNvbnNpc3RlbnQKPiB3aXRoIG90aGVyIE9ORV9S
RUcgaW50ZXJmYWNlcyBvZiBLVk0gUklTQy1WLgo+Cj4gRml4ZXM6IGMwNDkxM2YyYjU0ZSAoIlJJ
U0NWOiBLVk06IEFkZCBzc3RhdGVlbjAgdG8gT05FX1JFRyIpCj4gU2lnbmVkLW9mZi1ieTogQW51
cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgoKUXVldWVkIHRoaXMgYXMgZml4
IGZvciBMaW51eC03LjAtcmNYCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jIHwgMTggKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4g
aW5kZXggZTdhYjZjYjAwNjQ2Li42ZGFiNGRlZWQ4NmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMK
PiBAQCAtNTQ5LDkgKzU0OSwxMSBAQCBzdGF0aWMgaW5saW5lIGludCBrdm1fcmlzY3ZfdmNwdV9z
bXN0YXRlZW5fc2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gIHsKPiAgICAgICAgIHN0
cnVjdCBrdm1fdmNwdV9zbXN0YXRlZW5fY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5zbXN0YXRlZW5f
Y3NyOwo+Cj4gKyAgICAgICBpZiAoIXJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUt
PmFyY2guaXNhLCBTTVNUQVRFRU4pKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsK
PiAgICAgICAgIGlmIChyZWdfbnVtID49IHNpemVvZihzdHJ1Y3Qga3ZtX3Jpc2N2X3Ntc3RhdGVl
bl9jc3IpIC8KPiAgICAgICAgICAgICAgICAgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKQo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9F
TlQ7Cj4KPiAgICAgICAgICgodW5zaWduZWQgbG9uZyAqKWNzcilbcmVnX251bV0gPSByZWdfdmFs
Owo+ICAgICAgICAgcmV0dXJuIDA7Cj4gQEAgLTU2Myw5ICs1NjUsMTEgQEAgc3RhdGljIGludCBr
dm1fcmlzY3ZfdmNwdV9zbXN0YXRlZW5fZ2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zbXN0YXRlZW5fY3NyICpjc3IgPSAmdmNwdS0+
YXJjaC5zbXN0YXRlZW5fY3NyOwo+Cj4gKyAgICAgICBpZiAoIXJpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBTTVNUQVRFRU4pKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT0VOVDsKPiAgICAgICAgIGlmIChyZWdfbnVtID49IHNpemVvZihzdHJ1Y3Qga3Zt
X3Jpc2N2X3Ntc3RhdGVlbl9jc3IpIC8KPiAgICAgICAgICAgICAgICAgc2l6ZW9mKHVuc2lnbmVk
IGxvbmcpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiAgICAgICAgICpvdXRfdmFsID0gKCh1bnNpZ25lZCBsb25n
ICopY3NyKVtyZWdfbnVtXTsKPiAgICAgICAgIHJldHVybiAwOwo+IEBAIC01OTUsMTAgKzU5OSw3
IEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19jc3Ioc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICByYyA9IGt2bV9yaXNjdl92Y3B1X2FpYV9nZXRfY3Ny
KHZjcHUsIHJlZ19udW0sICZyZWdfdmFsKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAg
ICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSX1NNU1RBVEVFTjoKPiAtICAgICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOwo+IC0gICAgICAgICAgICAgICBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91
bmxpa2VseShSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTikpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmMgPSBrdm1fcmlzY3ZfdmNwdV9zbXN0YXRlZW5fZ2V0X2Nzcih2Y3B1LCByZWdfbnVtLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJnJlZ192YWwpOwo+ICsgICAgICAgICAgICAgICByYyA9IGt2bV9yaXNjdl92Y3B1X3Nt
c3RhdGVlbl9nZXRfY3NyKHZjcHUsIHJlZ19udW0sICZyZWdfdmFsKTsKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByYyA9IC1FTk9F
TlQ7Cj4gQEAgLTY0MCwxMCArNjQxLDcgQEAgc3RhdGljIGludCBrdm1fcmlzY3ZfdmNwdV9zZXRf
cmVnX2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICAgICAgICAgIHJjID0ga3Zt
X3Jpc2N2X3ZjcHVfYWlhX3NldF9jc3IodmNwdSwgcmVnX251bSwgcmVnX3ZhbCk7Cj4gICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NTUl9TTVNUQVRF
RU46Cj4gLSAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiAtICAgICAgICAgICAgICAgaWYg
KHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKQo+
IC0gICAgICAgICAgICAgICAgICAgICAgIHJjID0ga3ZtX3Jpc2N2X3ZjcHVfc21zdGF0ZWVuX3Nl
dF9jc3IodmNwdSwgcmVnX251bSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ192YWwpOwo+ICsgICAgICAgICAgICAgICBy
YyA9IGt2bV9yaXNjdl92Y3B1X3Ntc3RhdGVlbl9zZXRfY3NyKHZjcHUsIHJlZ19udW0sIHJlZ192
YWwpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAg
ICAgICAgICAgIHJjID0gLUVOT0VOVDsKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
