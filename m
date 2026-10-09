Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBD0CA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ohnua3jl16v3ZISRBCpQm1wXqIjtJQVrIzaZG3BToEM=; b=z/dETsOBfMqMja
	H+g79ubwg9OnFCHyJ/pL0gacPxa1IIApVhxvWWeoBZ3eUpTK4MGBUzPTDdH2YLVzh8p97k75fhqlL
	3eU/6N3/FKGP50QA7GZMtOGOBf4qQCgNYoaHrd1/9dRjWc9i4TqjDIwm1A4qhEX6IcHKAQUEJwUih
	f+tfhNU/MNtSyZLMfKpbBQ+HvFSk6oJl09SlW9FGKbxLjac69/UqNmDPfnWSCJ/25Nkj00LnrR7Uo
	0Va6BvHIsIs19iPAWVhFag7PuaBnolTJyQnjX+9tRjL3R1AVXsw9InlDQ0Rar95w9UuuBW5fIt1XO
	EboCheFdOR+Q1sx5sfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7op-000000063Y6-0TKI;
	Fri, 09 Oct 2026 10:27:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7on-000000063Wp-2H3I
	for linux-riscv@bombadil.infradead.org;
	Fri, 09 Oct 2026 10:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=; b=NJ8VGHyEQ+Ge3vV7dTzlNnEI8F
	nYHz360w2ss3R6lr3N5lbJdkRZb8UEffiS4zoFTMnpWd5OmbILmARTjL6IUNxWtn8268/cQrZZq1+
	pIqlAXSX3MSBRNTHifNcdL6zAy6yjqvwSElBjt+OOi8MtDtaWURwJD1s32g2T/IPOlZ3BHb/GgmJT
	NZhguJ6aRip6W2OcHOxT7aW6b06AX0A3WQZk2szf/nUF3178yENziQzeJY91CMO6NEnSBu83dPEPY
	Q7oYQbUsXRSVt8y/UCJiqGMIZ5vH2Qy+1q4iCbndQjgZcUY/XLDiKK9CmXQhWJfd7CRVbOXuCN0pk
	tFjY7KMQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF7ok-0000000B7iG-3lNJ
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 10:27:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso56897285e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 03:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791541629; cv=none;
        d=google.com; s=arc-20260327;
        b=j/yE02ErMZMloaaR4RjgRaZj3pazBdhu8Yo6kMqutIt70fR3dJntPsB72FuR8G3vQi
         YnAzz9Tqd9sPvDTATVSKrUAWusC+4S7knXQXJCSnSaY9F7h7CdNucyH3gJUz0eZbt4nQ
         L89K+L4t5mhEW8ZpJhWqItc/hcC7q3wvTg8YSnRlPh9+DTR4s4oq5wPmuc9509Xankja
         2hf96jNV6RlZkvf9JOpHDff4gDYRAEmEmHAsLwC/hwhRPXsR7tFbss2XBKw2FT+Mf/+s
         pCDQcOrF3y89wK8axeME3wQM9rYwzfV0X7/AMqIK8oMjzVD6JlH8ppkc3v9y2I8Ar+9d
         WzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        fh=Mk5xkJmArCAtU+my8TXXEDbn7z0yEKtKVFPbUqectmg=;
        b=OjyktQlk7DonwKEywuHXIYbD7UJHIZXSt6/+IqNGMQzyuYSgKEKdpUQpJNRTPyKnEq
         UpWhOD4h8JxP9sSAvsqYLsYAsmjnFWWhdIliz3sQ/dtzK/tS3t6bp0vWujN12J30Zb2t
         DGMrFBOto5rfRTZkTMFOYFJaCY5YF0pkYTVnHs9mxt1UkvP9xgInEm17eTrrT//zuQWL
         TUGiMzDPmFHj6KS1YP0MMd7jjY8gXVClr2JYRi/vY7D4qyzWeap7rQ5dX0Do7/hvwFuu
         up52Ed9WOqb/Z7EYowSSMBkyXqh9y1CTDP5TFxDWssLUaV2pc8mb7Q23ITS7qtTsvhQJ
         k2bg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791541629; x=1792146429; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        b=VvMygRiMQWbNaNSeOpA7jSZxQxPQTLJizLJguU7Nx+3lCVZ+mu1CL6+n/jlyz15HDa
         9uYXV0CsZF12VfmgjwoG5Tf5N+1J2hplvwSQOw2sXjO+gqW37vW8QdgO9JRiALE6ZHc1
         f0gK20oPyuxQ9E8jhF+dt1kwcipircQGdcUpXbhjw91R9UKm9Zw5yNeMKpRf7G+CNfAD
         1N+1BwzbdH1rZjib+rMPEBzxSD/8JcFSvlCrb0ZTFT7VmmFHKhtxgfAJcKICOdlj+bzh
         OmAyo6MWAQ9z2X99VD2Stu+R59A4HZI5EGqqpjWE8/268tSC9ZkTruHFpJUKDTKIq+xf
         +mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541629; x=1792146429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        b=wlCJ8IOxznfOGokyWdJuM4Hv13Dp3ClQy1tLcPlW1+7fcVvfFlaFEh/Aq4vYg+1M21
         r3goLAyccpmjn0rWAJiHywrUBHgOHlWHmNTrKf4UkqOnkEQ9GIQLzu1MKUik1t5UcPzH
         LW3t2LwBMDCHXrcTXq/ZQzzaq/AVUHWgKKW5dhZ2oppqYyCZtnLJrHauD5/eIDQcRCb/
         +cTRO/ttBZj3nf5IVAWgzVsHwdxsI8nTcz3o61Vqu0wVBM2kO25FgCvhup9mSVe98Z/m
         +DBbiv/2OqBiq9upsEDSlPqkeGFoVhEWJXgKSudrb64i2Rf0RdFZKvAYuVBsmbDp5lRt
         /h/A==
X-Forwarded-Encrypted: i=1; AKwUvBw6+ps6SBbSBnddSc6JgsqpKnLHMlyQq3KJZ3xOngSSH4tTabn5yG1Qbi75rMnLsdoba4LhiEu7ZMfqNg==@lists.infradead.org
X-Gm-Message-State: AFuF++lJm+6djp0zQOzTeV4Jfp1Xzx28R0D/YmFP+MdurzlXvO81J7IR
	Rx2mF/3ZNm+PLauTIimu0ZB/TKC4RDo/VL5NLHZAF9RcL20+Jr9X3rdidz4eiwvSgT62kkbg1Hg
	R+BmagKlIqRBW48Enz3WWlsejzIQ3TIPJbIUnYN47VA==
X-Gm-Gg: AYBFou3nXHRQlNCdXEibug8KBGRowuS3cpKN9SWDa1bU90/cLrIaI7Ynmn8FeVefdB0
	dvLegGGUxNN8uLjt2TI1CG9/iW2VKoDNsfjD3LOdhGzmFYulVqU/L8+bMlGfujkYrbL1GUa6jG3
	wg4DvMSVRYkkFC1/vV7c/BJ20NS5J8USvROZRP+1hR7M9DWj7/ZAIy0FfI1SNyFT6i1KJ/69jqS
	9S8ED4FnUtu85/XYHtA0roIBWycBAs+0nIy4FuPvuCObYZqv9R4bJENQl1MYU6r6T4l0e94cJHG
	fEJxuTMggboMaXNTil0wGFWIhNBZLh3Ev9PBpCaK6Giv06YTBPMgXOifrjSvyXm8OwTIeh7oFpI
	9o1QxtQXhJP1mH+kuN+JfPYAx2Ezyzub3//9aKjrzSHCHcQc1vHsKgWv9dPUg4AzKzvfdCu2Fpw
	==
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id
 5b1f17b1804b1-4a18e4a5355mr31129155e9.10.1791541629095; Fri, 09 Oct 2026
 03:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260925160300.467884-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925160300.467884-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 12:26:57 +0200
X-Gm-Features: AclHuK-pEq92e8PF3NtgM83whKL9xC8DLhFEcuppkWWmzGxqa0y5mveDAWbf6kU
Message-ID: <CAAhSdy2xu2MAKwOfPNRPG68XbtQsa-CT66phvTZe_XD_3Rk3Qg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Reject vCPU creation after AIA initialization
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112711_043684_DF0E0ECF 
X-CRM114-Status: GOOD (  17.71  )
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

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgNjowM+KAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQUlBIGluaXRpYWxpemF0aW9uIHNldHMg
dXAgcGVyLXZDUFUgSU1TSUMgc3RhdGUgYnkgaXRlcmF0aW5nIG92ZXIgYWxsCj4gb25saW5lIHZD
UFVzLiBDcmVhdGluZyBhbm90aGVyIHZDUFUgYWZ0ZXJ3YXJkcyBsZWF2ZXMgaXQgd2l0aG91dAo+
IGluaXRpYWxpemVkIElNU0lDIHN0YXRlLCBidXQgS1ZNIGN1cnJlbnRseSBwZXJtaXRzIHRoYXQg
c2VxdWVuY2UuCj4KPiBSZWplY3QgS1ZNX0NSRUFURV9WQ1BVIG9uY2UgQUlBIGluaXRpYWxpemF0
aW9uIHN1Y2NlZWRzLiBCb3RoIHBhdGhzIGFyZQo+IHNlcmlhbGl6ZWQgYnkga3ZtLT5sb2NrLCBz
byBjaGVja2luZyB0aGUgaW5pdGlhbGl6ZWQgc3RhdGUgZnJvbQo+IGt2bV9hcmNoX3ZjcHVfcHJl
Y3JlYXRlKCkgZnJlZXplcyB0aGUgdkNQVSBzZXQgdXNlZCBieSBBSUEuCj4KPiBGaXhlczogODlk
MDEzMDZlMzRkICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBkZXZpY2UgaW50ZXJmYWNlIGZvciBB
SUEgaXJxY2hpcCIpCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNA
b3NzLnF1YWxjb21tLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjQKClRoYW5rcywK
QW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jIHwgMyArKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IGUwNjJjYTE5ZjlkOC4uY2NmMmRl
ZjgzNGYxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC0xMzgsNiArMTM4LDkgQEAgc3RhdGljIHZvaWQga3ZtX3Jp
c2N2X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGt2bV9zYmlfcmVzZXQp
Cj4KPiAgaW50IGt2bV9hcmNoX3ZjcHVfcHJlY3JlYXRlKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWdu
ZWQgaW50IGlkKQo+ICB7Cj4gKyAgICAgICBpZiAoa3ZtX3Jpc2N2X2FpYV9pbml0aWFsaXplZChr
dm0pKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICsKPiAgICAgICAgIHJldHVy
biAwOwo+ICB9Cj4KPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
