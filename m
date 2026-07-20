Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5317C44527
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdwUMo1IrUWCkmiUvqwu1yChRQ4CAL1l/u5xnlGSnZo=; b=PMcbE91vQeRTzrCvUhTSbwOoC4
	Ui8bpUgp2GAhPKoS09GjPlZQcESuRkrRh5uqzziAmWGLOY2w1qLRgRJFnTLtPXZ8kCpEXyaOpOyHk
	C9ofO3hy67hmqiqmf5f8J6GwpqxrB3E+w6BO16axco2MaEscZsSei59aHd85e1aDOj1wqkxxunRYA
	oZ/UbSmA7STIwgkhauy2DfmQ76CsQSXLXKN5LqBYrv/SO/axjbNr/r5u0VW2D4DQgcMT7bcvkZGAq
	4eeKXxcabGkxF1AtouIDCAD8//WZiIuTs/shliR1Ju+k0aTI1d53Vc0W3YyJAVrNMxdYJE/qKF2oH
	fB1mhXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllL4-00000006Utp-3r2p;
	Mon, 20 Jul 2026 10:35:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllL1-00000006UrS-2duW
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 10:35:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4955158f26aso11052205e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784543705; x=1785148505; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k37RWmWff7zt+PtsvHIuhzz9otckpy6kRhbc8EISwX4=;
        b=BcGkN1KlTbCrddiilYuF8ApNUBPl4dDpKwgp7UxhH3jl1muq+fLMknVstd6eWg70jF
         Vacb2EsMGjZcg5LQBK8ivv5jkAKL6iUf6UAvEe9SovFHkhmq8++45r/EiSGb32OXRebg
         YnKVkyJTCSvaTxBNXrop6o/7pEWrDo9SC77bJhbr4V/r6n3OFJRWh2/99Q23dIUBiCg7
         Co+5FuzcWSPeOeHzGzvA6PVry/hV2t3ZLGXuc7MyX+LEImizu1FB+pk367EErXJplgSB
         c45RXoGDk7QKT9E3e7zUXK47aHaETaHLx1BsAcb7jVvodIktI6foBWCO89IXGb7Wfp32
         UouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543705; x=1785148505;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k37RWmWff7zt+PtsvHIuhzz9otckpy6kRhbc8EISwX4=;
        b=F6Aj4yjtAV1P6QnNuiV0/ycEaNpRcRs7ILTHrAgRYLHlcxy4lvNXaolMywJISqtsih
         RyAeZyXjo6kryDr4IS1qkhgj6cZRTcKbi6ZBCy5lvfLu29RAvC+PF+jR8ppYxXxOFdl1
         1t5yT/PxkjfMbXYlYQbybPtfsZrFI9hFxpqs9ZTk4TtzO67hN4xr1NE+qkz/nf0WXv2M
         8h6VLwbQp4MuoWkT7Ud+qezR8Aoq18TQyJObqmyux0JvRGuQf26ze2pFzFgVtAuSvMv2
         a4BSOQJxMvwISK7RuGNHCoHdh/zSLW1o3TdnvZtHk57+j6LGwzCWbWG6yTD2p3LZQOpS
         NRtg==
X-Forwarded-Encrypted: i=1; AHgh+RoEQ84+eqqFJxSuo9DXmTCkAF4ukA2c+9+t3eNLfOg8I8X3JGY0mM40eCNqPE0GtuyCcKVlx+q7PCGUEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzljWxqX/cVe0sEaI8fTF/6XB8ZXktdZ+DUAbOCY82uEFEGEVRh
	H1bkBmFvZIWO4XDTZdmbMeeOJ0n21d9wsPeJAzy/KsUSmqJusyPBo65X89UNI3VbwnE=
X-Gm-Gg: AfdE7cnVyFLLrrlrCnQLP54tY3Arn4B5qSjTwSBH8fp1pry48lSHiPru/2SjylShPY3
	hbe0SS+ONt0SFJzhBKjy4Ce4YGdxBBMOjn3RXU1qkI/YDEukWVY/m69oT9+KjRZqya2Aw9zstd7
	YSFOyeETKuW6jC/2QQYlm/CdJp2G5Gub2ABvVysPTGakqiHSGYyZJIF24nwgTFX3Hb6FX1ySKOP
	b/2hTUw3mSl3XI3FZaagxAuPkXU/pMaKR5wwyB0XCJdx+1VKYa+pR7UbZ22IKqtbCv2I8guZofL
	5jUN2TaYjYgMSrHil6fi6ZXnaJvUmsQ4n5T4gpd4znF9xAod+nPrI44VsfNnkaTB7+WJZOU0NaY
	7UwBVh88GtPkLLnOCQAs3FRpO51/dZ5RNxMlFwlcE+bVZEeRLbzdS2Cqqq8ilrTLv3ZlnXA5O+k
	DIxWX+DA/3dnPe2KW8DknifbyGMrRP+HCoY9/PoTe5SToeZEJf2ft7+3CA446GsECi6zyBN21TP
	NDHdY2xJSRxASXT8mwbjrBR9xTJie1Q
X-Received: by 2002:a05:600c:4f14:b0:495:5ce6:9c18 with SMTP id 5b1f17b1804b1-4955ce6a33cmr61097885e9.27.1784543704827;
        Mon, 20 Jul 2026 03:35:04 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b074csm291431975e9.6.2026.07.20.03.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:35:04 -0700 (PDT)
Message-ID: <e258581c-a17f-4b5a-aafd-82e513a6288e@suse.com>
Date: Mon, 20 Jul 2026 12:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] sched: Convert paravirt_steal to new static key APIs
To: Hongyan Xia <hongyan.xia@transsion.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "bsegall@google.com" <bsegall@google.com>, "mgorman@suse.de"
 <mgorman@suse.de>, "vschneid@redhat.com" <vschneid@redhat.com>,
 "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org"
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Jiazi Li <jiazi.li@transsion.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1784538478.git.hongyan.xia@transsion.com>
 <773bbd8fcd5ef2ebfe1c64303c7a71a56368de69.1784538478.git.hongyan.xia@transsion.com>
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
In-Reply-To: <773bbd8fcd5ef2ebfe1c64303c7a71a56368de69.1784538478.git.hongyan.xia@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_033507_725087_ECF2A1D3 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7859439771667148309=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7859439771667148309==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xRaoXSGgLc0vY9TPQoiqAmqD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xRaoXSGgLc0vY9TPQoiqAmqD
Content-Type: multipart/mixed; boundary="------------GCGLUHAC00omEipMv2gl1qSr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Hongyan Xia <hongyan.xia@transsion.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "bsegall@google.com" <bsegall@google.com>, "mgorman@suse.de"
 <mgorman@suse.de>, "vschneid@redhat.com" <vschneid@redhat.com>,
 "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org"
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Jiazi Li <jiazi.li@transsion.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e258581c-a17f-4b5a-aafd-82e513a6288e@suse.com>
Subject: Re: [PATCH 2/3] sched: Convert paravirt_steal to new static key APIs
References: <cover.1784538478.git.hongyan.xia@transsion.com>
 <773bbd8fcd5ef2ebfe1c64303c7a71a56368de69.1784538478.git.hongyan.xia@transsion.com>
In-Reply-To: <773bbd8fcd5ef2ebfe1c64303c7a71a56368de69.1784538478.git.hongyan.xia@transsion.com>

--------------GCGLUHAC00omEipMv2gl1qSr
Content-Type: multipart/mixed; boundary="------------mHisnunnxH4NBSrCYMbsXcuq"

--------------mHisnunnxH4NBSrCYMbsXcuq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDcuMjYgMTE6MzgsIEhvbmd5YW4gWGlhIHdyb3RlOg0KPiBGcm9tOiBIb25neWFu
IFhpYSA8aG9uZ3lhbi54aWFAdHJhbnNzaW9uLmNvbT4NCj4gDQo+IHBhcmF2aXJ0X3N0ZWFs
X3JxX2VuYWJsZWQgYW5kIHBhcmF2aXJ0X3N0ZWFsX2VuYWJsZWQgdXNlIHJhdyBzdGF0aWNf
a2V5DQo+IEFQSXMgd2hpY2ggYXJlIG5vdyBkZXByZWNhdGVkLiBVc2UgdGhlIG5ldyBBUEkg
aW5zdGVhZC4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+DQoNCkFja2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------mHisnunnxH4NBSrCYMbsXcuq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mHisnunnxH4NBSrCYMbsXcuq--

--------------GCGLUHAC00omEipMv2gl1qSr--

--------------xRaoXSGgLc0vY9TPQoiqAmqD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpd+dYFAwAAAAAACgkQsN6d1ii/Ey+9
dQf+MNwHi0AEoRwM0kGFqoNIkbCEeUDIsEPaZE6ECmiLVl6im8D6Tu03Xw92X3m4V6P4h8KP0cln
E8xuh65pmvJfOkhbG6w3tnHb2DSaHJ3uBB1XN0hhnoe5LC2FjhTSrxSvUC9FTEmia3pQ/bsUMq1g
s1BGaaxWDZhqOb5KP+W7tHOds08mT0VosshO8KzjtGtIpD+Hge6qd/LrxV6unk6MKQNSVdDJWwEl
jB01KSXN6J0RnTSyvU9e/oCJWCrUdEBsjxd2JOFyef4dVLLVeFCm0gp0PLDEZEA+1VQSW0CE6Rjk
TWjyd5V7/0D5UL8U6E38KHqqAuYS7WBJJGJF/Nx96Q==
=Pl2M
-----END PGP SIGNATURE-----

--------------xRaoXSGgLc0vY9TPQoiqAmqD--


--===============7859439771667148309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7859439771667148309==--

