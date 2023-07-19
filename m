Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D68EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZcDbAHV10cksIGsEsr1NQOg163pBbo80lbS37kpSqs=; b=HYw8XMDlFLBykd
	jJ0LiIKQEsgVBPwmm4+1bDQ1XD6UXPUbz82LSAaSmEWLJMV6Cj3OH1loA5prLamEcIZtBEPjO0rci
	/BP/0y7zbVG9lfaX081v1DgrWuNHJDN6eXdKGt5dDSyJwK5e9qm2FawYcELDJJPBCNxV4TtJ8T3RN
	IFzC5L/HcnkC2Tt263b5F7M+71ZfFvvRMYXZSXyVxtXs8Pk8w0Yt7xLlI+oCSRjf4oOPnM0ip6Rci
	is0gcSrOTHDanQIohUXnl13IMH3bZFy9extXtsPXR2erjpMg+qD0xT7mEMtx/xAOm+C7+OSarLoG4
	LxhKH+xrKxgnQoHkbaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7KP-007az1-0U;
	Wed, 19 Jul 2023 13:34:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7KK-007axG-2i
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 13:34:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3159d75606dso6580540f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689773685; x=1692365685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iqyJ1tyt/zGintHwIRAOam+B9iGxWukjiMScggaplw=;
        b=tnwmFnoxmhunQP8kjZ6qRl/OGitVUDE3mJI4J0Bb9Bp8DUXPw7FUvoH4SJaponnIjO
         79/V5ps+CVomWPG8NqwqNbIO27SABfwVaVw3Mb6qZ7VdwIgmflhthWPDxDkyN+f84CyN
         Zq8sLp3Svrl/2foju6LSuOvdNyrJH3ic0TqeIW8z8qycFVYogIcRSsPJoWCvYQP1w8aL
         n/t1wnClJAh/vfLOvbGFPdk/C5OweTX/OB/xQHUXjfxicXFF43koJxJP4T8yqxoolLPE
         XjzgJzV1MbjftRFqHKBTG8TuBD/B+I1enQDU1ce3L3gmKkUdxXiX6YtiZQRcIeH2Vk5D
         97zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689773685; x=1692365685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iqyJ1tyt/zGintHwIRAOam+B9iGxWukjiMScggaplw=;
        b=SbfcpvFUbUF2I29QDGUOLw/OSW6pKDNxfAeni04CE763L1mpZ7oiJUy3Pb74LMvq9l
         c5+SS51Mkn94nQAAZUivT+kfhQHdYTBaD7jEOls5kFrj7uvZR1w7PJX8GqwGlgNKw4p1
         JjSF3BZenBBauTadk7X7DTdce5UmboMVVd6c2oijed8Qi78IPSaggfizPkFjTuQTuTRe
         qeUD4NvOzaFS3RQTYmgA+JYUk8kqvJJn4tzWpNnLkIgWjxNcQMy+c7h+Yo/x6zn2j/g3
         mgG/3QmttZ2gv2fHbtkPrOzdpBBZnFAlaBFfyfYpZ9sXjqTu0ZONvCZ65wsbNxe3SD6S
         bHSQ==
X-Gm-Message-State: ABy/qLaMIMUneLzK79tDqJNefEuMJFRf46qdMloEZkngh/RZkhvUZVwn
	Y42KoGc3iLs0lig6MLDzjyLePA==
X-Google-Smtp-Source: APBJJlFyZliGO0KLF5ziGaA7+vZ36hbi8ZslxYYTzzyedsAOYH9vMG5lUGP70/h12j9uhl/y1hPRvg==
X-Received: by 2002:a5d:5906:0:b0:314:f1c:90bc with SMTP id v6-20020a5d5906000000b003140f1c90bcmr2067900wrd.69.1689773684758;
        Wed, 19 Jul 2023 06:34:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.201.220])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d5682000000b00314367cf43asm5360910wrv.106.2023.07.19.06.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 06:34:44 -0700 (PDT)
Message-ID: <f918a76f-324a-5c91-7dcc-5f5d43b247f6@linaro.org>
Date: Wed, 19 Jul 2023 15:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] vgacon, arch/*: remove unused screen_info
 definitions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Dexuan Cui <decui@microsoft.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren
 <guoren@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Khalid Aziz <khalid@gonehiking.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, WANG Xuerui <kernel@xen0n.name>,
 Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Palmer Dabbelt <palmer@rivosinc.com>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230719123944.3438363-5-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_063449_007330_325CD699 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTkvNy8yMyAxNDozOSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IEEgbnVtYmVyIG9mIGFyY2hpdGVjdHVyZXMgZWl0aGVy
IGtlcHQgdGhlIHNjcmVlbl9pbmZvIGRlZmluaXRpb24gZm9yCj4gaGlzdG9yaWNhbCBwdXJwb3Nl
cyBhcyBpdCB1c2VkIHRvIGJlIHJlcXVpcmVkIGJ5IHRoZSBnZW5lcmljIFZUIGNvZGUsIG9yCj4g
dGhleSBjb3BpZWQgaXQgZnJvbSBhbm90aGVyIGFyY2hpdGVjdHVyZSBpbiBvcmRlciB0byBidWls
ZCB0aGUgVkdBIGNvbnNvbGUKPiBkcml2ZXIgaW4gYW4gYWxsbW9kY29uZmlnIGJ1aWxkLiBUaGUg
bWlwcyBkZWZpbml0aW9uIGlzIHVzZWQgYnkgc29tZQo+IHBsYXRmb3JtcywgYnV0IHRoZSBpbml0
aWFsaXphdGlvbiBvbiBqYXp6IGlzIG5vdCBuZWVkZWQuCj4gCj4gTm93IHRoYXQgdmdhY29uIG5v
IGxvbmdlciBidWlsZHMgb24gdGhlc2UgYXJjaGl0ZWN0dXJlcywgcmVtb3ZlIHRoZQo+IHN0YWxl
IGRlZmluaXRpb25zIGFuZCBpbml0aWFsaXphdGlvbnMuCj4gCj4gUmV2aWV3ZWQtYnk6IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPgo+IFJldmlld2VkLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBBY2tlZC1ieTogRGluaCBO
Z3V5ZW4gPGRpbmd1eWVuQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IE1heCBGaWxpcHBvdiA8amNt
dmJrYmNAZ21haWwuY29tPgo+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9z
aW5jLmNvbT4KPiBBY2tlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgIGFyY2gvY3Nr
eS9rZXJuZWwvc2V0dXAuYyAgICAgICAgICB8IDEyIC0tLS0tLS0tLS0tLQo+ICAgYXJjaC9oZXhh
Z29uL2tlcm5lbC9NYWtlZmlsZSAgICAgIHwgIDIgLS0KPiAgIGFyY2gvaGV4YWdvbi9rZXJuZWwv
c2NyZWVuX2luZm8uYyB8ICAzIC0tLQo+ICAgYXJjaC9taXBzL2phenovc2V0dXAuYyAgICAgICAg
ICAgIHwgIDkgLS0tLS0tLS0tCj4gICBhcmNoL25pb3MyL2tlcm5lbC9zZXR1cC5jICAgICAgICAg
fCAgNSAtLS0tLQo+ICAgYXJjaC9zaC9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgIDUgLS0t
LS0KPiAgIGFyY2gvc3BhcmMva2VybmVsL3NldHVwXzMyLmMgICAgICB8IDEzIC0tLS0tLS0tLS0t
LS0KPiAgIGFyY2gvc3BhcmMva2VybmVsL3NldHVwXzY0LmMgICAgICB8IDEzIC0tLS0tLS0tLS0t
LS0KPiAgIGFyY2gveHRlbnNhL2tlcm5lbC9zZXR1cC5jICAgICAgICB8IDEyIC0tLS0tLS0tLS0t
LQo+ICAgOSBmaWxlcyBjaGFuZ2VkLCA3NCBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEw
MDY0NCBhcmNoL2hleGFnb24va2VybmVsL3NjcmVlbl9pbmZvLmMKClJldmlld2VkLWJ5OiBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
