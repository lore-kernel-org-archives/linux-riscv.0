Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC29C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJ0nWZyxbywIMcJASQQehxZeiOAzb0PppjrlpAStALA=; b=qzWUB3+VHqvvgm
	tJ8G3LFQ/PASMkxwZRuEeCsNpvWTcC+0xxOTqzA/3jW6jGbcoQrTpm+KlJyQygKMmnOed8Ho0Uo/p
	f/oEvHCtUw8utvaB/xWGU9kq7x4OcjM/JPInKEhwXJQ86QPZgVMzip66JRCTa+QZaDtw9xC2bKNlW
	sxM251co87jz30arf4+kD8Y8k7mY4f6+PZDORC4Li1b0oj3wwxObyuEjojnaQgtTsmsp4otrMJMhq
	LwgEOiZVh0XDC8HCpuIEF8kdrZINTZJcs7JfZlT35m6vdow1q5P4WGItYDVX9TMVbsa6ON2dIJb1R
	65oTiDTe/PXynnNACMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTji-00000002nsZ-1KfY;
	Thu, 18 Apr 2024 15:31:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjN-00000002cXR-2Vgd
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cdC41mYpitxeoerTPG3yyRH/m087Cg7WhfTha8ba/eQ=; b=pTucYq8aKtN3vZf8UPqZix7Rz/
	d+hi6AdBZyG0Ecuu9cTRO0C1VZEbhdJa+pxya2O3m+E3SjmBX+ZynuHqnJgdWQ7uNfdq0n6LWL1XN
	C9irR1FR/k1zejUihChfD4BmdY1sc0OgyL0/7kujD4Qznxdi9JD1puCvh22QO6oetgaVTJDii3R9R
	MSR5QCLR6ByY+h07UXE5a2EdvzKqfkav1+6Ne9SgEbxXAkTVW6T2gUIteq7cbPIDG1kXa5yGj3NUf
	zysK1Yz2pYXjiEUuPXCJC7M0pHK35ILgeK+oR20ag07v7tbFNJtsv0ap+qdhzRtPy3ya7tQhg4F90
	Gse9u1Hw==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjK-0000000C2Ou-0j9G
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:27:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-349bd110614so164231f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713450432; x=1714055232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdC41mYpitxeoerTPG3yyRH/m087Cg7WhfTha8ba/eQ=;
        b=CdEqqG5HV75M53C1n8WBG2cR+FAu3W6yIUMdUqtgTEajm3jI5sZf+WNhCuOgbGgf4W
         hOTpPq8AZqHEMWm/apDyZ0y+yg8AfUJ8vQDNPywGURxE0IUxjkYeDSAHca9cBqPq+jmv
         8ZA0XZdMqDD/P/pan5ax4GrA8G0Wa4myEyjshjtTR4fLwelBW6ccaLxuwEKD1WrDSP1Z
         rfkOWP+8owi81Q57TtdSGgrkQPEcdm9+RhKozXiRhxfpbxVG9E68PCmrdVxHLJah28Id
         WjktD8fWPkHpcApCcrsmKBg2BL9hdGLjoNkRRHYjMVnYwkEeu7oe3vJOy5D028bkRg8z
         5ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450432; x=1714055232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdC41mYpitxeoerTPG3yyRH/m087Cg7WhfTha8ba/eQ=;
        b=vQE/YEDxwGkRi5QgFlJWxIdGuCmM4vTqoHa8jzTvmzna2SOQgDDFMbAsQ9V5EraDDK
         2MYt0lSzARdiPncto2MVDfF4x1Z63WPEAzwvAg5g3oFzE0tgAv/LfkQJIcmB6oMD72yD
         T0YZaBb8WItaBHYlPNKSShZc238lL2tUr7WghghGqtoX/14Yo+p7ODnKJVOsh8Yv+CpN
         Am3WyCvsBJsCaoNKFZdF4eF1VdH2fK6Yc/hf8zq8PuksFRQkEX/Xo8ZYbpxGGVKlP37G
         KpatnH5DsWLl7z8P/rP/ezzyoH+xCqwFYRmpFhOQ4LMdBtOJUOK8ItykBKuG9DKdTZ8Z
         g7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVSDsKg2eaWxf20U8ejo36bG3qpMwyLYHNp8zpN+lGNqDREjNGXi3QjeKX6pDso05WCXT8u9GWnDWI49XHeCiIZrMlcCgVnY8BextU7q187
X-Gm-Message-State: AOJu0Yx4o3dpYENMc71zkVi3ncyzth7YUXp1esXg/zgsYtHKj7+oi0JF
	KD6QaKns/2l86OVvDL0vp3yv4QJYwCGirY16V96FcC0sHIZbk6x+erdO1oi5LjM=
X-Google-Smtp-Source: AGHT+IG+7UAmdiY0BoZwG9iLOw0KtSyypeYXnsCe7CYjI2xbi4A4G8xboXK1Q/fcCptfkBlEV51ecg==
X-Received: by 2002:a05:600c:4f51:b0:418:73d1:94e9 with SMTP id m17-20020a05600c4f5100b0041873d194e9mr2017672wmq.4.1713450432345;
        Thu, 18 Apr 2024 07:27:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm2873645wmo.42.2024.04.18.07.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:27:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Ved Shanbhogue <ved@rivosinc.com>
Subject: [RFC PATCH 2/7] dt-bindings: riscv: add Ssdbltrp ISA extension description
Date: Thu, 18 Apr 2024 16:26:41 +0200
Message-ID: <20240418142701.1493091-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418142701.1493091-1-cleger@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_152714_459990_36714E8D 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgU3NkYmx0cnAgSVNBIGV4dGVuc2lvbiB3aGljaCBpcyBu
b3QgeWV0CnJhdGlmaWVkLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sCmluZGV4IDYzZDgxZGM4OTVlNS4uY2U3MDIxZGJiNTU2IDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9u
cy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwKQEAgLTE0Nyw2ICsxNDcsMTIgQEAgcHJvcGVydGllczoKICAgICAgICAgICAg
IGFuZCBtb2RlLWJhc2VkIGZpbHRlcmluZyBhcyByYXRpZmllZCBhdCBjb21taXQgMDFkMWRmMCAo
IkFkZCBhYmlsaXR5CiAgICAgICAgICAgICB0byBtYW51YWxseSB0cmlnZ2VyIHdvcmtmbG93LiAo
IzIpIikgb2YgcmlzY3YtY291bnQtb3ZlcmZsb3cuCiAKKyAgICAgICAgLSBjb25zdDogc3NkYmx0
cnAKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNz
ZGJsdHJwIHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciBkb3VibGUgdHJhcAorICAgICAg
ICAgICAgaGFuZGxpbmcgYXMgY3VycmVudGx5IGRlZmluZWQgYnkgY29tbWl0IGU4NTg0N2IgKCJN
ZXJnZSBwdWxsIHJlcXVlc3QKKyAgICAgICAgICAgICMzMiBmcm9tIHZlZC1yaXZvcy8wNDE1XzEg
Iikgb2YgcmlzY3YtZG91YmxlLXRyYXAuCisKICAgICAgICAgLSBjb25zdDogc3N0YwogICAgICAg
ICAgIGRlc2NyaXB0aW9uOiB8CiAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3N0YyBzdXBlcnZp
c29yLWxldmVsIGV4dGVuc2lvbiBmb3IgdGltZSBjb21wYXJlIGFzCi0tIAoyLjQzLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
