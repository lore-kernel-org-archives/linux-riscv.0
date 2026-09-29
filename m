Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18022CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddyD9B32JBCIA63f+R2vYYKI+kYN2xB3Gkz12XYXXDw=; b=xJMK/pDTCjg7xy
	GPkv+vqeh/rzW9MGpMMUjpsMRubINyzwCJTftkyU1V5ARfdte0oapNngWT5QoOWAvHZuDqH2/xFDl
	yGLUY7m9ULq1KCqGbBsudr//KcbNBCt9LSqM3wD2RdyMxXZk16i92w5CnV88dBYkle2QppBWdTaXV
	PBrnLvP0wdz65xEOy9GuHGl0FGcjopXxjlLUs1Sko5WSSL1RugHKUiXrWGUKVI2ELS7ZOsFtQ5MFW
	7OSLQF4YB0/9+wdM5JJpC9v126AsOJnJw/19WzUztNHDH7bAM6UtrYxtZD7HvM5QlM/MZQ7bmFLDn
	/sV6SG2zsw/lhfLhOgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcVA-00000004H4I-2PXM;
	Tue, 29 Sep 2026 18:24:28 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcV8-00000004H34-1XQI
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 18:24:27 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48884b0219bso2315659f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 11:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706263; cv=none;
        d=google.com; s=arc-20260327;
        b=kbhR6+LiemqGLDIZ/ga6wMyqkQgyBLLtm/dVEHxXwbar06fMESK/0POYZlGPo86fY/
         4EimuVx532cu81YJ9wkK6jchWwy71EES6b8GqEb0ZuomJu/daMbbzJPW41xnqwn+QZIu
         F+RwJejx6qWl0q22PkkEcFiTDmSWBcCKNRWq/KSmMVXmsyeKh8TYj1iFjhme7/POn4hS
         q+InyEwhkC6WTji6HvO5wGz21CXiCtGQVDODtRq7dsCMx63xSoKKMky5nAFuT9fHi4xl
         VZBE36eB1Dg6rt++IYCmMoJ97UlQYiuliZ5JCNtbv0j1vzo+oBmFW2LN5ZImJ34hBiVh
         NGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        fh=rKEMNgjnBkD0gs1jtbp3dFXWFkVsSD6ShSnWHFXKxoE=;
        b=OfL6DFVB39HRtKahl8iTBQz9mWdDUhWgEGX2keorIuj6dI8HaIFUK572j4JhriwSB5
         yV0VO+VgAtrlAHWnskRZ15uCewLWGNU6bEiKLYRC00hfviV9UrOjF6TAhqT1jmyJGCxm
         kjCslP1vOyiyuBVXwa5Mj8pc0zfGgNT17hC8n0d0Sbn9rJVBLgnay9KOJM11Pt+ZtLys
         AIKiOfjCPMJWuNb4sMyFCr/UffpEchMjxBDV8+kAudW1II/HNbhURsyvfKiQzU7M2TKe
         f2i+9SEZaBCM30NMqbwrrzzG0q7R2FLpT1GKct/qE7IvR/r2EVz6aAr2lE1kSTmmLJe+
         ZhjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790706263; x=1791311063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=Ma/Y5eT5sZDlHzVr2E1w7xUlwJ3Te0/PpzxqqxLY7DVJzxz1YZlsHPeWbe6950NHwd
         Hc9S4fkUogyH9XZMZpahz7Yt2vKWiws/bF+ejdaZNYn/BzT4wW9yllqXHGfPYZWX4yoZ
         Rhg7zkir7a/U3aYnSNFJ7ZI+WC6NcVVXd5Y2d1fknS77yV+BABY4lqPJxU7MpSz7oDo5
         1hEmYftLPfM6kPNGIZUWgsy4r9Zj7pvxelpUP8q0yMKZPYPWYmBc2iN2VY6w7oXMqHHC
         5hWN3GycQiErRd31HiO1VJ6Bt8Kaw6FlSqsd93HJSswkE8PzEuVjpC0gFN+PSVYfCq7/
         OaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706263; x=1791311063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=cnHITxQQDy1tdfcUzRJS44ZOFZj5dc8WXbYB14MleXOAZZgGKgiZcGIKKpVLGXp6fC
         6rwEPeNa6ihCWGVKukHsRPhxkrSv7CGjoxiocSmMX94x/lf6OptkxJXTmnXclO41udV4
         5mEOMEEAOZfpXWgw9ZjXnDxqm+aa9uTtR1sX7d8beBHGVGqHtErfW96QTrLlz0RGiihU
         6dR67srZ3RwHI5glyVKx0junSLtx9PbvlNYM3AJJffnGPgq0/xlCnFDfuzXNi0bv3a8V
         Er57/jiSl98knAeKEAJTnQaHEIMNAOStx+Tbe/xp38xlpnSfrILx3cUd3gstoHJq2T2X
         K8QA==
X-Forwarded-Encrypted: i=1; AKwUvBysiyW7/MbyrAA7UzcyPFq/WarlUw81UB0G4DjfdGehEmhFWmGgfOq59M65a6a77yL7yR7JYzHTrvTJpA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIMw/1gBsKe1S+iFhn0XtL9lCYnHV3ekXrAkS8peDFYjIseokac
	D7fFawUxdXTAjP3oqU5UycjlQ9kwi9iQ+btJP72EDXOMn1XiEvHsQWgcXlTUDlgNlvDDw6qHV2i
	Ad1D5hryoC1B20FsbQiUI8PSVm2N46Q6bG5Uw/Glv
X-Gm-Gg: AYBFou1HMfFWjLIB6Hg+z/UjC+LOZ48XE9Fx96NsjvwQu6Gtf1XtUmkOqFFc9Ilsh4X
	/FpOrxZgoZG2vuHb2lNiMSjDOd1GJZWuAVRC+m5Zz6r4Lj5baimlWOHCdUgNfyvmfQB4waIIdw0
	ufjssxpSoAIyEv4OHQmni9XYzrebux6J3VuApaUsU7/PDK4yzdwcLNsbVkT5K7d8djyUADLCBE7
	YCb4+WVgQPM7smuPKDRRjM+nRt5D5b1OTO8zCuARK1CaFCU9wJOrjhzAlTYsP0ECPYOXDtyUrqh
	4i7fP39oi96UXYAmlQKYZ9/PueVN6NzXyEwgY6CKHzPf2C8a4TPpVy977rm0KNcuPg033IzRAdy
	KQBRRvOaDUno6rGY15gaE069YK7DKClwzovghf75GirX8dX3M7s1EDLfGB9s8W4V/ONs=
X-Received: by 2002:a05:6000:2381:b0:48a:fba3:d5b6 with SMTP id
 ffacd0b85a97d-48afe7ab8dbmr265943f8f.56.1790706262469; Tue, 29 Sep 2026
 11:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
In-Reply-To: <are6s5e6On3hpD3M@zx2c4.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Sep 2026 11:24:11 -0700
X-Gm-Features: AclHuK_OlHRHmRVZkjU6Ad7ygjuA5O41_jDQwI5Gzaif3nG5KjlJX6HrrO4nUUw
Message-ID: <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Nathan Chancellor <nathan@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_112426_425559_0EA2ED97 
X-CRM114-Status: GOOD (  18.47  )
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

T24gU2F0LCBTZXAgMjYsIDIwMjYgYXQgNToyOeKAr0FNIEphc29uIEEuIERvbmVuZmVsZCA8SmFz
b25AengyYzQuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgU2VwIDI2LCAyMDI2IGF0IDEyOjU1OjM0
UE0gKzAyMDAsIENocmlzdG9waGUgTGVyb3kgKENTIEdST1VQKSB3cm90ZToKPiA+IEhpIEphc29u
LAo+ID4KPiA+IExlIDI2LzA5LzIwMjYgw6AgMTI6MDIsIEphc29uIEEuIERvbmVuZmVsZCBhIMOp
Y3JpdCA6Cj4gPiA+IEFwcGFyZW50bHkgbm90IG9uIFJJU0NWLCB3aGljaCBpcyB3aGF0IHByb21w
dGVkIHRoaXMgcGF0Y2ggaW4gdGhlIGZpcnN0Cj4gPiA+IHBsYWNlLiBTbyBJIHN1c3BlY3QgTmF0
aGFuJ3MgdjIgaGVyZSBpcyB0aGUgd2F5IHRvIGdvLgo+ID4KPiA+Cj4gPiBEb24ndCB5b3UgaGF2
ZSAtZm5vLWJ1aWx0aW4gb24gUklTQ1YgbGlrZSB3ZSBoYXZlIG9uIHBvd2VycGMgPwo+Cj4gSSB0
aGluayBOaWNrIG1lbnRpb25lZCB0aGlzIGxlZCB0byBvdGhlciBwcm9ibGVtcyBhbmQgZGlkbid0
IGV4YWN0bHkKPiBzb2x2ZSB0aGUgcHJvYmxlbS4KClNvcnJ5LCBiZWVuIHZlcnkgYnVzeS4gIEdl
dHRpbmcgYmxhc3RlZCBmcm9tIGEgZmlyZSBob3NlIG9mIEFJCmdlbmVyYXRlZCBwYXRjaGVzIHRv
IHJldmlldy4uLgoKYXJjaC9hcm02NC9rdm0vaHlwL252aGUvTWFrZWZpbGUgaGFzIHRoaXMgcGF0
dGVybiBmb3IgZXhhY3RseSB0aGUgc2FtZQpwcm9ibGVtIEkgc3VzcGVjdC4gIE1heWJlIHRoYXQn
cyB0aGUgcmlnaHQgdG9vbCBpbiB0aGUgdG9vbGJveD8KCmBgYApkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZp
bGUKaW5kZXggOGRiZjI1MzJhNTczLi4yN2ZhNzJkOGZiODYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtl
ZmlsZQpAQCAtMjcsNyArMjcsNyBAQCBhc2ZsYWdzLXkgKz0gLURWRFNPX0NGST0xCiBlbmRpZgoK
ICMgRmlsZXMgdG8gbGluayBpbnRvIHRoZSB2ZHNvCi1vYmotdmRzbyA9ICQocGF0c3Vic3QgJSwg
JS5vLCAkKHZkc28tc3ltcykpIG5vdGUubworb2JqLXZkc28gPSAkKHBhdHN1YnN0ICUsICUubywg
JCh2ZHNvLXN5bXMpKSBub3RlLm8gLi4vLi4vbGliL21lbXNldC5vCgogaWZkZWYgQ09ORklHX1ZE
U09fR0VUUkFORE9NCiBvYmotdmRzbyArPSB2Z2V0cmFuZG9tLWNoYWNoYS5vCmBgYApGaXhlcyBg
bWFrZSAtc2tqIiQobnByb2MpIiBBUkNIPXJpc2N2IExMVk09MSBtcnByb3BlciBhbGxtb2Rjb25m
aWcKdmRzb19wcmVwYXJlYCBmb3IgbWUsIGFzIHBlcgpodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdC
dWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8yMTgzCihOYXRoYW4sIGRvbid0IGZvcmdldCB0byBsaW5r
IHRvIHRoYXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlKQpJJ20gc3VycHJpc2VkIEkgZGlkbid0IG5l
ZWQgLWZuby1zZW1hbnRpYy1pbnRlcnBvc2l0aW9uIChvciBvbmUgb2YgdGhlCnJlbGF0ZWQgZmxh
Z3MuLi4gLWZ2aXNpYmlsaXR5PWhpZGRlbikKCklmIHdlIHdhbnQgdG8gZ2V0IGJldHRlciwgKGlm
IHBlcmZvcm1hbmNlIG1hdHRlcnMgaGVyZSBhbmQgd2Ugd2FudCB0bwp0cmFkZSBzb3VyY2UrYnVp
bGQgc3lzdGVtIGNvbXBsZXhpdHkgZm9yIGFic29sdXRlIGNvZGUgcGVyZikgSSB3b3VsZApzdGFy
dCB3aXRoIHRoYXQsIHRoZW4gd29ycnkgYWJvdXQgY2xhd2luZyBiYWNrIHBlcmZvcm1hbmNlIHZp
YSB0aGluZ3MKbGlrZToKLSBfX2J1aWx0aW5fbWVtc2V0X2lubGluZQotIC1maW5saW5lLXN0cmlu
Z29wcz1tZW1zZXQKLSAtZmZ1bmN0aW9uLXNlY3Rpb25zKy1XbCwtLWdjLXNlY3Rpb25zIHRvIGRl
YWQgY29kZSBlbGltaW5hdGUgdGhlIG91dApvZiBsaW5lIGNvcHkgb2YgbWVtc2V0LCB0aG91Z2gg
SUlSQyB0aGVyZSdzIHBvdGVudGlhbCBmb3Igd2FzdGVkIHNwYWNlCmR1ZSB0byBhbGlnbm1lbnQg
cmVxdWlyZW1lbnRzIChtYXliZSB0aGUgb3V0IG9mIGxpbmUgY29weSBvZiBtZW1zZXQgaXMKc21h
bGxlci4uLmlkaykKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
