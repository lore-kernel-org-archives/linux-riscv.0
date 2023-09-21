Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336A5CD4954
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 05:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0Qbr4O2/ABGTJEvmxG8xEj+UvGbiSCTJt5Kk/In1YI=; b=QO4yxvdC5J5Jv5
	zjrryvaEf1qKODvfPKmUapE2fbxhIk1BSMUROhdiAgVmN1+Ij8zAVADXly7/t7t4apX7V32v6Xod5
	buzYyfXaKW8nWLwGKGhxgqW0s2AcjBoevg4CdDRK9CKeKtFhwyq0kljDQe6Jsli3Y73WcPXZ9oeS7
	/hVEGLfwGtDptGbFAa1O9W+tCWkO/8ElfPe1a0Kq5+bJfMZ2tREpDIs4oaVVzOcDHgs4ib1D7C0jm
	WL0Xs1a7d0rs5lycqtB7M1FrJJ65Ev415QnFUH3hKcHtxRofhuFAdMMFOo/cxVvYDLhFnKs6j9o35
	6be5JWml0Y/sbYk6zA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjC9J-0059kW-2F;
	Thu, 21 Sep 2023 05:22:49 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjC9G-0059jL-1L
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 05:22:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-274939681b5so350728a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 22:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695273762; x=1695878562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9nCvb9CrO2GaZq009DzYQ8CxVOSv0DQu3f44RpIAl4=;
        b=FTO2YivDyXsKDaI13RHWrAWaguoAlU0o2fI03APq3iCTTivWa/pzCWWBGtIkZImF6i
         axfOMz516bmGmXcGJDMJ+JDk83Jr+LJx3LOTGwwX98bUa0vOg6gwGGjAt+C2DJpdTdlo
         m5l2Oh5XgDLUJW1ujV1jl6UsTVlCepkk5ER9FbkaRD6Ggjpt/Jc9ZjNO5cOVV5eqWY+j
         SoUlsciLfOvAA8NMHyuo+fpBjkGB9Mhe0mP4VtHfDL2r2RbS5O6/2GMlpp7Q+6xq7n6q
         AvAtXnd4n8AstY5cwXCkVfN4vFsxc0MXLJExWgw04rhZfV1Ev4PUMZcz/HWZ3N9SeAhh
         t/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695273762; x=1695878562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9nCvb9CrO2GaZq009DzYQ8CxVOSv0DQu3f44RpIAl4=;
        b=WvG14LBR5nG+BGBSxVHl1cSejIVNl1F0jnqq4WKTEaHYCID34Cegv1lwpXUEBgXmEw
         Sz3y90MXcB34CLbCB+6dvEck3D1noRgHpnGrnJH89n9fEqsOwMAr17+xiFF+6V09tdVG
         DICre3l0vMN/R5m3Tb/ojjsyAroLxVop68OxTUc/H6IwrXWaP85RXDL0HBnD33e+8uer
         9r7Nvt8BPcrSs4cn0ANgBbBhVQcZrqjv4/2EqWWffmGq8J3uRo5DnyWyA5h8qoX7ujmn
         GALvbHJGIszF2Nq4j1cX9PcMwYvo4yEcV4GeccQrA5eAEkrjyxzG5nw3/yhddjNAf7FZ
         W++A==
X-Gm-Message-State: AOJu0Yz5SmWet61yjgDQ2rziP+LAsHw63a762wkclxH+3hcWbVDAcxKM
	n0VytMQw00hIjlKrL/FbNmvaqpl40rpFYR5eRKIehw==
X-Google-Smtp-Source: AGHT+IHVPuhFW+sGrMGW2iY7pMa14QvaelEddHySWV/HAgZhZpuV4DDEx4xNG/hsPPFcqiqQeUvbDngd1S9ogJ2JCoI=
X-Received: by 2002:a17:90a:c08a:b0:268:553f:1938 with SMTP id
 o10-20020a17090ac08a00b00268553f1938mr4569172pjs.4.1695273761830; Wed, 20 Sep
 2023 22:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230920154608.1447057-1-apatel@ventanamicro.com>
In-Reply-To: <20230920154608.1447057-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 21 Sep 2023 10:52:29 +0530
Message-ID: <CAK9=C2WXtRLTFA5JeWbkyKt+1qyTat0nw7v3-b6oQ-YO_37tdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM RISC-V fixes for ONE_REG interface
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_222246_450811_AC95B798 
X-CRM114-Status: GOOD (  10.74  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgOToxNuKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGluY2x1ZGVzIGZldyBhc3NvcnRl
ZCBmaXhlcyBmb3IgS1ZNIFJJU0MtViBPTkVfUkVHIGludGVyZmFjZQo+IGFuZCBLVk1fR0VUX1JF
R19MSVNUIEFQSS4KPgo+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gcmlzY3Zf
a3ZtX29uZXJlZ19maXhlc192MiBicmFuY2ggYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0
ZWwvbGludXguZ2l0Cj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIEFkZHJlc3NlZCBEcmV3J3Mg
Y29tbWVudHMgaW4gUEFUQ0g0Cj4KPiBBbnVwIFBhdGVsICg0KToKPiAgIFJJU0MtVjogS1ZNOiBG
aXggS1ZNX0dFVF9SRUdfTElTVCBBUEkgZm9yIElTQV9FWFQgcmVnaXN0ZXJzCj4gICBSSVNDLVY6
IEtWTTogRml4IHJpc2N2X3ZjcHVfZ2V0X2lzYV9leHRfc2luZ2xlKCkgZm9yIG1pc3NpbmcKPiAg
ICAgZXh0ZW5zaW9ucwo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBGaXggSVNBX0VYVCByZWdp
c3RlciBoYW5kbGluZyBpbiBnZXQtcmVnLWxpc3QKPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czog
U2VsZWN0aXZlbHkgZmlsdGVyLW91dCBBSUEgcmVnaXN0ZXJzCgpRdWV1ZWQgdGhpcyBzZXJpZXMg
Zm9yIDYuNi1yY1ggZml4ZXMKClRoYW5rcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X29uZXJlZy5jICAgICAgICAgICAgICAgICAgfCAgNyArKy0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0v
cmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgNTggKysrKysrKysrKysrKystLS0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Cj4gLS0K
PiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
