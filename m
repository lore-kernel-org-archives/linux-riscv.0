Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C8C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lH9JzmaxcmL251tr6CVMCa9IeBz8So4IlOmxhYL0BZg=; b=YAGUTrc8VwR5Xk
	vAbPx694AePOf73MAWQ4zewRV/5T7uKJAecoB1amBGAGw7fWQk4KbtG+/VvtXfZMBkBD90JyKcjQx
	ksoikM4UW+eLHpaNZ3GbNqXDEi+tltA4qI5xLQCeLW0F5L1uErjtcm0N1KyCNjaAcp1uZ2iSV5Sys
	2eVm+wxW+v+oKbDvOVcVJVJyejVS+SwidA8enf9ijopfl81q0+YqMLnRvQYVhVOKnQnecIk0pepxv
	tr+WzrZHKmBRO5VH9BWcrg952+qPKpbF3yeqLyJmeanPNLWD497+duG1qqQycKpZ3gKSerQ/b8Vd7
	lvltIwhdNMn8mNvgIJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAiv-0000000FdOV-3zJy;
	Fri, 12 Apr 2024 06:49:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAis-0000000FdME-2QU1
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ecf406551aso497709b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904557; x=1713509357; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OG/1LVtmS5PJqTGfRsDdfy/GBt6FFfLWIvrVveL3MDU=;
        b=aef7Cehs9ccg4PhKCHjoZzosw6rLVGbqi+3fEPSt74MWrgzWIZuUuvsg7jP7m0xMQQ
         F0kvYBygHTs5lC7hQf92U7oi65Q8VgLLxiGRer8T6ZVmYc5iA7TacWX6avR4hD//Jw7P
         i/vSIbX+Vd4y/Cx/CVQZKGVwih2TMUBB3awD8/JS6gHcUJeObO/d3yhRdfrEey2Ho9ZM
         1P+a1OdRbaN7Cs7REk00H7PiU1hHRSi887afk/2xZNhZJ12/QnpVhJ9qFhhFkZ9E3Jje
         3fZ8D4D0ayOuG+3/OiyjmDkG0A9bhHbE7l/2OTfK0ZDepP8bFLHvrGJFbu2KDRwxxQLV
         PduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904557; x=1713509357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OG/1LVtmS5PJqTGfRsDdfy/GBt6FFfLWIvrVveL3MDU=;
        b=hibUOALXYxTaJiaMcTrcBpB/hppXzKtGhNeBp0IO/BEQ5ywNuihTJxP6d83Wkqxves
         O3+T+ylvD/91Yzsbzvy62UmYKAlyM2KtTh0Y8yvj2s/gFfT26RvNujVSIHErnabIel4W
         xfYsWJyeUxbCCPEYn360/QBchJgFc3ItziUonpxU/vKmkWxSQ8YQOrbJlQmZuBdhOnsZ
         bE1FDekRaeo7FI0cp2TTpIJKWwCLhWbmaarvGTfmMYlmFxajc3CTjYIz77P83L0yHvaC
         blqKmIMco4CaKAzGv1TknllhURoj7N1xriVN1BlqTGeX0fllpfEuYr51v0h7CtxV3E5m
         2YVg==
X-Gm-Message-State: AOJu0Yz/NaO5hvwh6xY61oV85MjMrwKJfxlwWw7kaFnYenaN6YGCfrTS
	XGFkijWzxyTaRYCeclcVMWo/6WQSO045t8df1PDGmt46Y43QCXaEAQQwPDEG540=
X-Google-Smtp-Source: AGHT+IFZRErvycpHhYv8nDAOA0AKK9dvDMskucFNFf/LNGcE2rSUEQs2FrZTO0yAgsH3aEtNLPJo3w==
X-Received: by 2002:a05:6a20:3d85:b0:1a7:4962:6fad with SMTP id s5-20020a056a203d8500b001a749626fadmr2551948pzi.10.1712904557446;
        Thu, 11 Apr 2024 23:49:17 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:17 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:49:00 +0800
Subject: [PATCH v4 4/9] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa
 detection
MIME-Version: 1.0
Message-Id: <20240412-zve-detection-v4-4-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_234918_687524_B7762941 
X-CRM114-Status: GOOD (  13.24  )
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

TXVsdGlwbGUgVmVjdG9yIHN1YmV4dGVuc2lvbnMgYXJlIGFkZGVkLiBBbHNvLCB0aGUgcGF0Y2gg
dGFrZXMgY2FyZSBvZgp0aGUgZGVwZW5kZW5jaWVzIG9mIFZlY3RvciBzdWJleHRlbnNpb25zIGJ5
IG1hY3JvIGV4cGFuc2lvbnMuIFNvLCBpZgpzb21lICJlbWJlZGRlZCIgcGxhdGZvcm0gb25seSBy
ZXBvcnRzICJ6dmU2NGYiIG9uIHRoZSBJU0Egc3RyaW5nLCB0aGUKcGFyc2VyIGlzIGFibGUgdG8g
ZXhwYW5kIGl0IHRvIHp2ZTMyeCB6dmUzMmYgenZlNjR4IGFuZCB6dmU2NGYuCgpTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgotLS0KQ2hhbmdlbG9nIHYzOgog
LSByZW51bWJlciBSSVNDVl9JU0FfRVhUX1pWRSogdG8gcmViYXNlIG9uIHRvcCBvZiA2LjkKIC0g
YWxwaGFiZXRpY2FsbHkgc29ydCBhZGRlZCBleHRlbnNpb25zIChDbMOpbWVudCkKQ2hhbmdlbG9n
IHYyOgogLSByZW1vdmUgdGhlIGV4dGVuc2lvbiBpdHNlbGYgZnJvbSBpdHMgaXNhX2V4dHNbXSBs
aXN0IChDbMOpbWVudCkKIC0gdXNlIHJpc2N2X3p2ZTY0ZF9leHRzIGZvciB2J3MgZXh0ZW5zaW9u
IGxpc3QgKFNhbXVlbCkKLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAgNSAr
KysrKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMzYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggZTE3ZDAwNzhhNjUxLi5m
NjRkNGU5OGU2N2MgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTgxLDYgKzgxLDExIEBACiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRTTwkJNzIKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUNB
UwkJNzMKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YQU5ERVNQTVUJCTc0CisjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWlZFMzJYCQk3NQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTMyRgkJNzYKKyNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NFgJCTc3CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZF
NjRGCQk3OAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RAkJNzkKIAogI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IGY2
ZjNlY2U2MGQ2OS4uMzhkMDlkZTUxOGIxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0xODgs
NiArMTg4LDM1IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZiYl9leHRzW10g
PSB7CiAJUklTQ1ZfSVNBX0VYVF9aVktCCiB9OwogCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZF
MzJGX0lNUExZX0xJU1QJXAorCVJJU0NWX0lTQV9FWFRfWlZFMzJYLAorCisjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWlZFNjRGX0lNUExZX0xJU1QJXAorCVJJU0NWX0lTQV9FWFRfWlZFNjRYLAkJXAor
CVJJU0NWX0lTQV9FWFRfWlZFMzJGLAkJXAorCVJJU0NWX0lTQV9FWFRfWlZFMzJGX0lNUExZX0xJ
U1QKKworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RF9JTVBMWV9MSVNUCVwKKwlSSVNDVl9J
U0FfRVhUX1pWRTY0RiwJCVwKKwlSSVNDVl9JU0FfRVhUX1pWRTY0Rl9JTVBMWV9MSVNUCisKK3N0
YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZlMzJmX2V4dHNbXSA9IHsKKwlSSVNDVl9J
U0FfRVhUX1pWRTMyRl9JTVBMWV9MSVNUCit9OworCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50
IHJpc2N2X3p2ZTY0Zl9leHRzW10gPSB7CisJUklTQ1ZfSVNBX0VYVF9aVkU2NEZfSU1QTFlfTElT
VAorfTsKKworc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmU2NGRfZXh0c1tdID0g
eworCVJJU0NWX0lTQV9FWFRfWlZFNjREX0lNUExZX0xJU1QKK307CisKK3N0YXRpYyBjb25zdCB1
bnNpZ25lZCBpbnQgcmlzY3ZfenZlNjR4X2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1pWRTMy
WCwKKwlSSVNDVl9JU0FfRVhUX1pWRTY0WAorfTsKKwogLyoKICAqIFdoaWxlIHRoZSBbbXNdZW52
Y2ZnIENTUnMgd2VyZSBub3QgZGVmaW5lZCB1bnRpbCB2ZXJzaW9uIDEuMTIgb2YgdGhlIFJJU0Mt
VgogICogcHJpdmlsZWdlZCBJU0EsIHRoZSBleGlzdGVuY2Ugb2YgdGhlIENTUnMgaXMgaW1wbGll
ZCBieSBhbnkgZXh0ZW5zaW9uIHdoaWNoCkBAIC0yNDUsNyArMjc0LDcgQEAgY29uc3Qgc3RydWN0
IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoZCwgUklTQ1ZfSVNBX0VYVF9kKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShxLCBSSVND
Vl9JU0FfRVhUX3EpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKGMsIFJJU0NWX0lTQV9FWFRfYyks
Ci0JX19SSVNDVl9JU0FfRVhUX0RBVEEodiwgUklTQ1ZfSVNBX0VYVF92KSwKKwlfX1JJU0NWX0lT
QV9FWFRfU1VQRVJTRVQodiwgUklTQ1ZfSVNBX0VYVF92LCByaXNjdl96dmU2NGRfZXh0cyksCiAJ
X19SSVNDVl9JU0FfRVhUX0RBVEEoaCwgUklTQ1ZfSVNBX0VYVF9oKSwKIAlfX1JJU0NWX0lTQV9F
WFRfU1VQRVJTRVQoemljYm9tLCBSSVNDVl9JU0FfRVhUX1pJQ0JPTSwgcmlzY3ZfeGxpbnV4ZW52
Y2ZnX2V4dHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6aWNib3osIFJJU0NWX0lTQV9F
WFRfWklDQk9aLCByaXNjdl94bGludXhlbnZjZmdfZXh0cyksCkBAIC0yODAsNiArMzA5LDExIEBA
IGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHp0c28sIFJJU0NWX0lTQV9FWFRfWlRTTyksCiAJX19SSVNDVl9J
U0FfRVhUX1NVUEVSU0VUKHp2YmIsIFJJU0NWX0lTQV9FWFRfWlZCQiwgcmlzY3ZfenZiYl9leHRz
KSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJjLCBSSVNDVl9JU0FfRVhUX1pWQkMpLAorCV9f
UklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmUzMmYsIFJJU0NWX0lTQV9FWFRfWlZFMzJGLCByaXNj
dl96dmUzMmZfZXh0cyksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZlMzJ4LCBSSVNDVl9JU0Ff
RVhUX1pWRTMyWCksCisJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHp2ZTY0ZCwgUklTQ1ZfSVNB
X0VYVF9aVkU2NEQsIHJpc2N2X3p2ZTY0ZF9leHRzKSwKKwlfX1JJU0NWX0lTQV9FWFRfU1VQRVJT
RVQoenZlNjRmLCBSSVNDVl9JU0FfRVhUX1pWRTY0RiwgcmlzY3ZfenZlNjRmX2V4dHMpLAorCV9f
UklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NHgsIFJJU0NWX0lTQV9FWFRfWlZFNjRYLCByaXNj
dl96dmU2NHhfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZmaCwgUklTQ1ZfSVNBX0VY
VF9aVkZIKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZobWluLCBSSVNDVl9JU0FfRVhUX1pW
RkhNSU4pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRfWlZLQiks
CgotLSAKMi40NC4wLnJjMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
