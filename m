Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10883CAC587
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQ3XD3Mu1sejXF81MDwa0AR21XnEyUQJt6TRnidpTJo=; b=Hr4qiYl7zUSfLE9ELadst3MQRN
	oSVRhP5ml4FVZewrH0dB4yFxZ12gIMK2SoLDxF1ca57ld01dxrGfn+EpOcHOEIQ5zyjAt0WX2Mbz+
	u/smkJPDrbeFPmUDIWVdrZSrwzHocPbKsx88ROUyJTLIm/7oZWDeCdi2WM5muuw0ddTFwcitqcLo3
	4rWkjbWz5qkg24fgPlrpJKWNs1Jt3rvgvyMTv6yGVRRgZc3zubwJUDu2FcxZ/fS5QtA+2cUr90I/C
	HbMmOe3WVhL9At0RqCCD3OLeRr7i9Tcvot4adPoqDOXycGDt3kuGuea62u4PDEqiv6ja2FwC2UXnd
	/3YpeB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcE0-00000001gEi-2W67;
	Thu, 11 Sep 2025 08:00:12 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcDw-00000001gA2-2Vwm
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 08:00:10 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso847751a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757577606; x=1758182406; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QrlNksX0kBZBWgevQvqTCUnuhFgrLUFmsGDLIooJuIw=;
        b=GVGM7MRs1tyz0gcrYuWRFQJdAlM5qxqHvqZp/aLkMz+V+XsdVUWwKCJnLMh9nXhIgx
         of+kuRS0WTIVfistxpKxq36GVU4tYbv952FzwKdLlybf04z3Ns2eFgRGASdD6lpWh59g
         hL2+omrQ6kpqD7QFWP3UWtZ2jxWem7I0nEsyT2ZanoIud6Sj4JCJppAQy/c5bgXvDC79
         aFIaxTUIzErffVitxXDjcSG6vhauNXfCUeInBMiPGoYJ3zAs8NwF8AMgXkrYpDpBtssU
         gfXLMhe/3nnxnZCgNMKD3rVctf3ISXk99NNaIRNrfyEnbnd12io0Cs+TnuGiOeMRGsn+
         mQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577606; x=1758182406;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrlNksX0kBZBWgevQvqTCUnuhFgrLUFmsGDLIooJuIw=;
        b=IUeOa8ZqwfUQY4ea4aQebExE0iiYxaLzVo9r+ASSfC87sUel9I/lqsolYb+gbMhGXt
         z7z/Bz+lXTKimVpxEqWRGQF27GAVBF7ZUOkNm/qhgD39kOM8z7cFLJ+nzI9PFPKkCaa0
         sqOgIZyXhnq+wHs1O/6caEKYVCQ+zvICoRoiioRWtAHs+mplFwkfstQKoMi4aALUAsqv
         +dtXFed6FIjs3n2kc6f75G3YJMrpWp4vxrytrMT1P9eBVfPadmJUBr4wADYThoMv/o4U
         8GJomTPdMvHH3YXKpg+LyW6j0CM1ydjRJIYrt7yOUio2cH8FiyMudbbEJkZPab6vMIxI
         43dg==
X-Forwarded-Encrypted: i=1; AJvYcCXu9uzhAakYTYpDPhDo3Ykh8/uFg0gI1xb2Ick1IpCOEEHwVTBtCyog5GCmi85bA0VY/R7JXDk07dGkjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymC0UKUi0x3OhsWJ6RAdJgPzGidizGk/svtsXLA29Wc8BJ5X5s
	X4nEzU95Se3kNQxrN4Q7ZH1z69D7LPGSVg+JnpBne1xwKJS9mHwMvC68E3/oRVVjAY0=
X-Gm-Gg: ASbGncuR3SSbjLv191nPR7VbUPo3J8pBzOsO7Nn+0TCIPdvpYuh4bLXcPhd+5yTRixL
	kNOfGpexDtNB1y3HdlG67Rrku+RPMGo1ocLMDCWbl0f+2bYSGab+QKJwet9JCpDlMjgPD2/FCYT
	CKclirsfRrf5lRoFS34TSnF1+xJU0ILbFr4l2Vz3LNsyH2qSH1MXM+in9TNJlQrp5g0dKahJ/hq
	8TVlYK+8vkJ0BNyo/QPMWAk1uYOSTFWfKvgkC82vMTPLE4pH/1N74mRhqd2U7IlGhpd6DjcsmCZ
	IkkHAPlk8IEotUwxTuRkILG1wJSGCUo2JIzjSkC/nDZ2MA/isBCCDjO4pw/1MpvfY4w48L9zU28
	qIy+b2z8oSlKU8TfU+3TaDR67VRzB+krKDFam2an1o3aGtYtOAorPi23LXh3medRn3emdo0Wiil
	dDBX07BU6H4UUuHz2UtlPtknm/ccrU1F3LyI325C/lhucBFJr7/pzRSwY=
X-Google-Smtp-Source: AGHT+IHtwJP+NpH1ymNM/0dCe30VtYrs+73DFAhA7FZXocgko07f9smiOVMlJT1b7qw2DXXLesjZRA==
X-Received: by 2002:a05:6402:50c8:b0:62e:c525:4f94 with SMTP id 4fb4d7f45d1cf-62ec5255575mr672136a12.32.1757577606313;
        Thu, 11 Sep 2025 01:00:06 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b? (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de. [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec3410ee7sm644477a12.50.2025.09.11.01.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:00:05 -0700 (PDT)
Message-ID: <eb760054-1679-408a-9de9-2505f88382dd@suse.com>
Date: Thu, 11 Sep 2025 10:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] paravirt: cleanup and reorg
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20250911063433.13783-1-jgross@suse.com>
 <20250911074817.GX3245006@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20250911074817.GX3245006@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_010008_786423_164806BB 
X-CRM114-Status: GOOD (  24.55  )
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
Content-Type: multipart/mixed; boundary="===============1164970789374023057=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1164970789374023057==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qqcArw2UNkNKESBZAhTAYfh4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qqcArw2UNkNKESBZAhTAYfh4
Content-Type: multipart/mixed; boundary="------------SW0CtEgoDQ04mHi3OOJ80Cxj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <eb760054-1679-408a-9de9-2505f88382dd@suse.com>
Subject: Re: [PATCH 00/14] paravirt: cleanup and reorg
References: <20250911063433.13783-1-jgross@suse.com>
 <20250911074817.GX3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250911074817.GX3245006@noisy.programming.kicks-ass.net>

--------------SW0CtEgoDQ04mHi3OOJ80Cxj
Content-Type: multipart/mixed; boundary="------------uLSRgxz23yDirGsh3b5wzau0"

--------------uLSRgxz23yDirGsh3b5wzau0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDkuMjUgMDk6NDgsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPiBPbiBUaHUsIFNl
cCAxMSwgMjAyNSBhdCAwODozNDoxOUFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gU29tZSBjbGVhbnVwcyBhbmQgcmVvcmcgb2YgcGFyYXZpcnQgY29kZSBhbmQgaGVhZGVy
czoNCj4+DQo+PiAtIFRoZSBmaXJzdCAyIHBhdGNoZXMgc2hvdWxkIGJlIG5vdCBjb250cm92
ZXJzaWFsIGF0IGFsbCwgYXMgdGhleQ0KPj4gICAgcmVtb3ZlIGp1c3Qgc29tZSBubyBsb25n
ZXIgbmVlZGVkICNpbmNsdWRlIGFuZCBzdHJ1Y3QgZm9yd2FyZA0KPj4gICAgZGVjbGFyYXRp
b25zLg0KPj4NCj4+IC0gVGhlIDNyZCBwYXRjaCBpcyByZW1vdmluZyBDT05GSUdfUEFSQVZJ
UlRfREVCVUcsIHdoaWNoIElNTyBoYXMNCj4+ICAgIG5vIHJlYWwgdmFsdWUsIGFzIGl0IGp1
c3QgY2hhbmdlcyBhIGNyYXNoIHRvIGEgQlVHKCkgKHRoZSBzdGFjaw0KPj4gICAgdHJhY2Ug
d2lsbCBiYXNpY2FsbHkgYmUgdGhlIHNhbWUpLiBBcyB0aGUgbWFpbnRhaW5lciBvZiB0aGUg
bWFpbg0KPj4gICAgcGFyYXZpcnQgdXNlciAoWGVuKSBJIGhhdmUgbmV2ZXIgc2VlbiB0aGlz
IGNyYXNoL0JVRygpIHRvIGhhcHBlbi4NCj4+DQo+PiAtIFRoZSA0dGggcGF0Y2ggaXMganVz
dCBhIG1vdmVtZW50IG9mIGNvZGUuDQo+Pg0KPj4gLSBJIGRvbid0IGtub3cgZm9yIHdoYXQg
cmVhc29uIGFzbS9wYXJhdmlydF9hcGlfY2xvY2suaCB3YXMgYWRkZWQsDQo+PiAgICBhcyBh
bGwgYXJjaHMgc3VwcG9ydGluZyBpdCBkbyBpdCBleGFjdGx5IGluIHRoZSBzYW1lIHdheS4g
UGF0Y2gNCj4+ICAgIDUgaXMgcmVtb3ZpbmcgaXQuDQo+Pg0KPj4gLSBQYXRjaGVzIDYtMTIg
YXJlIHN0cmVhbWxpbmluZyB0aGUgcGFyYXZpcnQgY2xvY2sgaW50ZXJmYWNlcyBieQ0KPj4g
ICAgdXNpbmcgYSBjb21tb24gaW1wbGVtZW50YXRpb24gYWNyb3NzIGFyY2hpdGVjdHVyZXMg
d2hlcmUgcG9zc2libGUNCj4+ICAgIGFuZCBieSBtb3ZpbmcgdGhlIHJlbGF0ZWQgY29kZSBp
bnRvIGNvbW1vbiBzY2hlZCBjb2RlLCBhcyB0aGlzIGlzDQo+PiAgICB3aGVyZSBpdCBzaG91
bGQgbGl2ZS4NCj4+DQo+PiAtIFBhdGNoZXMgMTMrMTQgYXJlIG1vcmUgbGlrZSBSRkMgbWF0
ZXJpYWw6IHBhdGNoIDEzIGlzIGRvaW5nIHNvbWUNCj4+ICAgIHByZXBhcmF0aW9uIHdvcmsg
dG8gZW5hYmxlIHBhdGNoIDE0IHRvIG1vdmUgYWxsIHNwaW5sb2NrIHJlbGF0ZWQNCj4+ICAg
IHBhcmF2aXJ0IGZ1bmN0aW9ucyBpbnRvIHFzcGlubG9jay5oLiBJZiB0aGlzIGFwcHJvYWNo
IGlzIGFjY2VwdGVkLA0KPj4gICAgSSdkIGxpa2UgdG8gY29udGludWUgd2l0aCB0aGlzIHdv
cmsgYnkgbW92aW5nIG1vc3QgKG9yIGFsbD8pDQo+PiAgICBwYXJhdmlydCBmdW5jdGlvbnMg
ZnJvbSBwYXJhdmlydC5oIGludG8gdGhlIGhlYWRlcnMgd2hlcmUgdGhlaXINCj4+ICAgIG5h
dGl2ZSBjb3VudGVycGFydHMgYXJlIGRlZmluZWQuIFRoaXMgaXMgbWVhbnQgdG8ga2VlcCB0
aGUgbmF0aXZlDQo+PiAgICBhbmQgcGFyYXZpcnQgZnVuY3Rpb24gZGVmaW5pdGlvbnMgdG9n
ZXRoZXIgaW4gb25lIHBsYWNlIGFuZA0KPj4gICAgaG9wZWZ1bGx5IHRvIGJlIGFibGUgdG8g
cmVkdWNlIHRoZSBpbmNsdWRlIGhlbGwgd2l0aCBwYXJhdmlydC4NCj4+DQo+PiBKdWVyZ2Vu
IEdyb3NzICgxNCk6DQo+PiAgICB4ODYvcGFyYXZpcnQ6IHJlbW92ZSBub3QgbmVlZGVkIGlu
Y2x1ZGVzIG9mIHBhcmF2aXJ0LmgNCj4+ICAgIHg4Ni9wYXJhdmlydDogcmVtb3ZlIHNvbWUg
dW5uZWVkZWQgc3RydWN0IGRlY2xhcmF0aW9ucw0KPj4gICAgeDg2L3BhcmF2aXJ0OiByZW1v
dmUgUEFSQVZJUlRfREVCVUcgY29uZmlnIG9wdGlvbg0KPj4gICAgeDg2L3BhcmF2aXJ0OiBt
b3ZlIHRodW5rIG1hY3JvcyB0byBwYXJhdmlydF90eXBlcy5oDQo+PiAgICBwYXJhdmlydDog
cmVtb3ZlIGFzbS9wYXJhdmlydF9hcGlfY2xvY2suaA0KPj4gICAgc2NoZWQ6IG1vdmUgY2xv
Y2sgcmVsYXRlZCBwYXJhdmlydCBjb2RlIHRvIGtlcm5lbC9zY2hlZA0KPj4gICAgYXJtL3Bh
cmF2aXJ0OiB1c2UgY29tbW9uIGNvZGUgZm9yIHBhcmF2aXJ0X3N0ZWFsX2Nsb2NrKCkNCj4+
ICAgIGFybTY0L3BhcmF2aXJ0OiB1c2UgY29tbW9uIGNvZGUgZm9yIHBhcmF2aXJ0X3N0ZWFs
X2Nsb2NrKCkNCj4+ICAgIGxvb25nYXJjaC9wYXJhdmlydDogdXNlIGNvbW1vbiBjb2RlIGZv
ciBwYXJhdmlydF9zdGVhbF9jbG9jaygpDQo+PiAgICByaXNjdi9wYXJhdmlydDogdXNlIGNv
bW1vbiBjb2RlIGZvciBwYXJhdmlydF9zdGVhbF9jbG9jaygpDQo+PiAgICB4ODYvcGFyYXZp
cnQ6IHVzZSBjb21tb24gY29kZSBmb3IgcGFyYXZpcnRfc3RlYWxfY2xvY2soKQ0KPj4gICAg
eDg2L3BhcmF2aXJ0OiBtb3ZlIHBhcmF2aXJ0X3NjaGVkX2Nsb2NrKCkgcmVsYXRlZCBjb2Rl
IGludG8gdHNjLmMNCj4+ICAgIHg4Ni9wYXJhdmlydDogYWxsb3cgcHYtY2FsbHMgb3V0c2lk
ZSBwYXJhdmlydC5oDQo+PiAgICB4ODYvcHZsb2NrczogbW92ZSBwYXJhdmlydCBzcGlubG9j
ayBmdW5jdGlvbnMgaW50byBxc3BpbmxvY2suaA0KPiANCj4gV2l0aCB0aGUgbm90ZSB0aGF0
IHRpcCB0eXBpY2FsbHkgbGlrZXMgYSBjYXBpdGFsIGFmdGVyIHRoZSBwcmVmaXgsIGxpa2U6
DQo+IA0KPiAgICB4ODYvcGFyYXZpcnQ6IFJlbW92ZSB1bm5lZWRlZCBpbmNsdWRlcyBvZiBw
YXJhdmlydC5oDQoNCk5vdGVkLCB0aGFua3MuDQoNCj4gDQo+IEZvciAxLTEyOg0KPiANCj4g
ICAgQWNrZWQtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZyYWRlYWQu
b3JnPg0KPiANCj4gDQo+IE5vdywgYXMgdG8gdGhlIGxhc3QgdHdvLCBJJ20gbm90IHN1cmUu
IExlYWtpbmcgdGhvc2UgbWFjcm9zIG91dCBvZiBQVg0KPiBpc24ndCBwYXJ0aWN1bGFybHkg
bmljZSwgdGhlbiBhZ2Fpbiwgbm90IHRoZSBlbmQgb2YgdGhlIHdvcmxkIGVpdGhlci4NCj4g
SnVzdCBub3Qgc3VyZS4NCg0KWWVzLCB0aGF0J3Mgd2h5IEkgZGlkbid0IGNvbnRpbnVlIHdp
dGggYWxsIG9mIHRoZSBvdGhlciBwb3RlbnRpYWwgbW92ZW1lbnQgb2YNCnBhcmF2aXJ0IGZ1
bmN0aW9ucy4gSSB3YW50IHNvbWUgZmVlZGJhY2sgZmlyc3QuIDotKQ0KDQpJdHMgYSB0cmFk
ZW9mZiBiZXR3ZWVuIGhhdmluZyBmdW5jdGlvbnMgd2l0aCAvIHdpdGhvdXQgcGFyYXZpcnQg
aW4gb25lIGZpbGUNCmFnYWluc3QgaGlkaW5nIHRoZSBwYXJhdmlydCBzdHVmZiBmcm9tICJu
b3JtYWwiIHJlYWRlcnMgKG5vdCB3cml0ZXJzLCBhcyB0aG9zZQ0KcHJvYmFibHkgbmVlZCB0
byB0b3VjaCB0aGUgcGFyYXZpcnQgdmFyaWFudCwgdG9vKS4NCg0KQlRXLCBJIHRoaW5rIHRo
ZSBtYWNybyBsZWFraW5nIGlzbid0IHRoZSBtYWluIHByb2JsZW0uIFRoZXJlIGFyZSBvdGhl
ciBtYWNyb3MNCmxlYWtpbmcgYWxyZWFkeS4NCg0KDQpKdWVyZ2VuDQo=
--------------uLSRgxz23yDirGsh3b5wzau0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------uLSRgxz23yDirGsh3b5wzau0--

--------------SW0CtEgoDQ04mHi3OOJ80Cxj--

--------------qqcArw2UNkNKESBZAhTAYfh4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjCgYQFAwAAAAAACgkQsN6d1ii/Ey8r
OAf/Qr2x8nYLyGRENJrie6zcaTwNZyeK2FPaGrjzVaiWjT9VH4G2q5x5mhR5oFWV4toAblU5ow2h
SX840JnBB/J+SkC/W9J4UKM5yKPxGuiAZIyUVnryVO46qdBhemIpMn03Sq3Bij/oQn62902kMQk8
+Fav26WncSGYllLET53pleP3CiC3wO/NrpLc1gGkGJR7e6Mh9/tA4FldPiYKafGEWVvvZvRHGsrb
BK/o5327iIlO40Rj51EE+RKO8uspX4JanSFzCXXis6bGSLcJtqwYK9y4eLMEqqvTNB8h30YWROBp
6YVlChchkh9g1mcOIfBDkyiK0cKJQ9lHSBC7mBkEiw==
=k6d0
-----END PGP SIGNATURE-----

--------------qqcArw2UNkNKESBZAhTAYfh4--


--===============1164970789374023057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1164970789374023057==--

