Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A8CC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=htZWyALG+FugiGo2zufZN1iLVJBu4I/IVmAgitb77K4=; b=NIbD99dIOvrJ1J
	oBkBsT5xmGuozBWgyYpu6MmjQVWuS0tneIct3veEdQrA4dSglBZf1o6GDDzSL41mbdHDxu9S1xMIP
	MwNHVoTnqur+iso64WUKFe6ZhtRds+Q6TwnRZ9QRJFy5UR6XNYI2212ie0QFQpBYvNsoc0s9f1Lop
	fqYAwc1f3VlcpmthrDq1mMA71PprMefc7lNdP3CdBP4H/PcWakZ9kpQjM8GSbvsmtpxkGsfivAH9N
	89Ans9FJoQyU9TPCulMus/Bmxpwm1kDTiBptzLle6zTxbmrecqLhxK8VPf+NZ2tZVPnSmVQid53Tj
	WwTd5x/h7d4Keo+ecyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa7s-009c3R-2N;
	Wed, 26 Jul 2023 08:44:08 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa7q-009c1x-0a
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 08:44:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b9c368f4b5so4923595ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690361043; x=1690965843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQc80XoWnWN+d0bN0a57A7yXCEucxsJNa3airtwPdzU=;
        b=Hp2YtMOJInODfh2RWJnZcs3r3BCbH0ObrksVLi76QalIoUjE9Ky2QLTWtluMnS07Lm
         cy9jHRYtAxMVi2aj59ILj+OQVqCHVarW2HTPIjg7wVuwjWsM1ZXLehF+9UE3DnnU14cf
         iWQGUhyt6+I233gVjENypM7bBVS2xSSuB+r3FVOII6Pmjz1S/wZvaI6WOlbGJa3dJQII
         fLy/j+uS8jAPTgadIJHcyPFNtU4zMhNFR7lZfUq0Rt8KlRZE1pAwPkQGoK2ds0kPUlAH
         PJ9oGK/kV1RKnchodGEDyymE5qjRJmfvgdBssBj3x8thUq48AM3BV2zuX2DUtRlSQmHG
         Zj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361043; x=1690965843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQc80XoWnWN+d0bN0a57A7yXCEucxsJNa3airtwPdzU=;
        b=jOD7ZmZyQffFibVNMTT5GAM0mUOyIUOhjgjC1Ej7YmLX4U8q+PlzIpNl8eBbLRlTed
         OxH44+Zv8Kd/sof0TYwAaxkmKa5lgGKm7egXntLguToK1RPalVDDhNxXxSIAzJqap8pI
         oo9+/g+rjx7IusYRwhmUS/UFOGzlLuij/WyYH7k4i68Oov+Eynu5a5wf5YxFmmJgGYKc
         mh65oYS/y+/quYbYaJgw+46yfSPVf+qZMLNejnvqkB7SF0T2WcXBIt9dS4m+IEyvJ5lw
         2qH9LEFjbLTGm+S/JO+sL83Pu7vMgNfpSF8w7fETUN1VVKb6v32qy2K+GGEfnFT89ZxN
         9KIA==
X-Gm-Message-State: ABy/qLYJfXo1CdQxWGUWOMa5MVr1Fa9yARplo3l6TGinrG5O5C+d/eKN
	eiDCqyAVaopHquQ9cFzFsbN4jg==
X-Google-Smtp-Source: APBJJlExZpncboZpnmSU/bDA6WhjsS+diGAbylKBltrvAwOAn+i5mgN5Gq5g82Zb6GypEbpgJ4Kldw==
X-Received: by 2002:a17:902:b18f:b0:1b8:ad90:7af8 with SMTP id s15-20020a170902b18f00b001b8ad907af8mr1606145plr.17.1690361042634;
        Wed, 26 Jul 2023 01:44:02 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001b3bf8001a9sm3978637plb.48.2023.07.26.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:44:02 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/7] Risc-V Kvm Smstateen
Date: Wed, 26 Jul 2023 14:13:45 +0530
Message-Id: <20230726084352.2136377-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_014406_224284_EDFEC8A8 
X-CRM114-Status: GOOD (  12.21  )
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

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IHRvIGRldGVjdCB0aGUgU21zdGF0ZWVuIGV4dGVuc2lv
biBmb3IgYm90aCwgdGhlCmhvc3QgYW5kIHRoZSBndWVzdCB2Y3B1LiBJdCBhbHNvIGFkZHMgc2Vu
dmNmZyBhbmQgc3N0YXRlZW4wIHRvIHRoZSBPTkVfUkVHCmludGVyZmFjZSBhbmQgdGhlIHZjcHUg
Y29udGV4dCBzYXZlL3Jlc3RvcmUuCgpUaGUgbW90aXZhdGlvbiBiZWhpbmQgU21zdGF0ZWVuIGZy
b20gdGhlIHNwZWMKKGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1zdGF0ZS1lbmFibGUp
OgoiVGhlIGltcGxlbWVudGF0aW9uIG9mIG9wdGlvbmFsIFJJU0MtViBleHRlbnNpb25zIGhhcyB0
aGUgcG90ZW50aWFsIHRvIG9wZW4KY292ZXJ0IGNoYW5uZWxzIGJldHdlZW4gc2VwYXJhdGUgdXNl
ciB0aHJlYWRzLCBvciBiZXR3ZWVuIHNlcGFyYXRlIGd1ZXN0IE9TZXMKcnVubmluZyB1bmRlciBh
IGh5cGVydmlzb3IuIFRoZSBwcm9ibGVtIG9jY3VycyB3aGVuIGFuIGV4dGVuc2lvbiBhZGRzIHBy
b2Nlc3NvcgpzdGF0ZS0tLXVzdWFsbHkgZXhwbGljaXQgcmVnaXN0ZXJzLCBidXQgcG9zc2libHkg
b3RoZXIgZm9ybXMgb2Ygc3RhdGUtLS10aGF0CnRoZSBtYWluIE9TIG9yIGh5cGVydmlzb3IgaXMg
dW5hd2FyZSBvZiAoYW5kIGhlbmNlIHdvbuKAmXQgY29udGV4dC1zd2l0Y2gpIGJ1dAp0aGF0IGNh
biBiZSBtb2RpZmllZC93cml0dGVuIGJ5IG9uZSB1c2VyIHRocmVhZCBvciBndWVzdCBPUyBhbmQg
cGVyY2VpdmVkLwpleGFtaW5lZC9yZWFkIGJ5IGFub3RoZXIuIgoKQ2hhbmdlcyBpbiB2NDoKLSBV
cGRhdGUgY29tbWl0IGRlc2NyaXB0aW9uIGZvciBwYXRjaCAxCi0gUmViYXNlIHRvIGt2bV9yaXNj
dl9xdWV1ZQotIEFkZCByZXZpZXdlZC1ieSB0YWcKCkNoYW5nZXMgaW4gdjM6Ci0gTW92ZSBEVCBi
aW5kaW5ncyBjaGFuZ2UgdG8gYSBzZXBhcmF0ZSBwYXRjaAotIE1vdmUgc2VudmNmZy9zc3RhdGVl
bjAgc2F2ZS9yZXN0b3JlIHRvIHNlcGFyYXRlIGZ1bmN0aW9uCgpDaGFuZ2VzIGluIHYyOgotIEFk
ZCBzbXN0YWVlbiBkZXNjcmlwdGlvbiBpbiByaXNjdi9leHRlbnNpb25zLnlhbWwKLSBBdm9pZCBs
aW5lIHdyYXAgYXQgODAgY2hhcnMKCk1heXVyZXNoIENoaXRhbGUgKDcpOgogIFJJU0MtVjogRGV0
ZWN0IFNtc3RhdGVlbiBleHRlbnNpb24KICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBzbXN0YXRl
ZW4gZW50cnkKICBSSVNDLVY6IEtWTTogQWRkIGt2bV92Y3B1X2NvbmZpZwogIFJJU0MtVjogS1ZN
OiBFbmFibGUgU21zdGF0ZWVuIGFjY2Vzc2VzCiAgUklTQ1Y6IEtWTTogQWRkIHNlbnZjZmcgY29u
dGV4dCBzYXZlL3Jlc3RvcmUKICBSSVNDVjogS1ZNOiBBZGQgc3N0YXRlZW4wIGNvbnRleHQgc2F2
ZS9yZXN0b3JlCiAgUklTQ1Y6IEtWTTogQWRkIHNzdGF0ZWVuMCB0byBPTkVfUkVHCgogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgIDYgKysKIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmggICAgICAgICAgICAgICAgICB8IDE4ICsrKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggICAgICAgICAgICAgfCAxOCArKysrKwogYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgIHwgMTEgKysrCiBhcmNoL3Jpc2N2
L2tlcm5lbC9jcHUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2t2bS92
Y3B1LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA3MCArKysrKysrKysrKysrKystLS0tCiBh
cmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgICAgICAgICAgICAgfCA0MSArKysrKysr
KysrKwogOSBmaWxlcyBjaGFuZ2VkLCAxNTQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0p
CgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
