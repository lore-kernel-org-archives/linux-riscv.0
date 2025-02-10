Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73998C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jC65Nco8X/NInGwpFfE/B8daaGM9Yuf3s8j1tcJ7RvI=; b=peIXCYrNQEfhMK
	Q0PKv45c5rVKrcM28LvRd75G4K8XwfZmFPrsw3RUvTJN0s2wm2wGUPE6TE0Vl36b7sdezEJkyyGfe
	/k5fB5k8Om+GlJyoWsNsXfvmzOnCXipyVjJ4PXs5+EwJa1AWI02110qTP7OZTgbHwogcmfyvYmcuJ
	jFTUO8nUEuolwWHCkp9JNy1fPdwUvbbxowfmf/mLVfp+4/l53zIJPR7HVbr7VrbRqa3UGZmQ3yAKG
	ih9yMwQXALIUZCAwoGiqZc886cvd3a5xhPs1E50W+eIGCJPGURDKKzTQ2MIgCZ4PDRo6Lo1y8f3FY
	TgJcGuQFoe90GGXLMURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWBe-00000000PDw-3oXE;
	Mon, 10 Feb 2025 15:59:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thW8y-00000000OYW-1ppN
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 15:56:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dc6d9b292so1808224f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 07:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739202979; x=1739807779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwvpqgCc60HMle4gfhwGXC+m016RdUxEz0jvpf/EWvY=;
        b=ESFbNcBgia6Tv418OgI0vm65maG188p3ciwDbr6cVPgX4H2UlFyIKI0aKmqoMjnkYi
         9EVsYrYBAj/9+l4ARJi1SLBrhM5FP99eWw4+VvFglqyVfKT3l9fxxHclsH41Ihj0zK69
         kAzvEUbaDWhgbfHEmtQlHIdGNB4KfqBvPuT/XsNbQjsGcQV0KDWDW2omSlGTeS7IZ3Qb
         1oOvn9jdazImsXKopXSeaup+KG5ve4vnVt89KCwg+l6r/vzJTstM2LmSjX+kO/n0hJqj
         LYX6sbxxoKNhZatdC1YPRKX1s0bwXhA0wjyN7VP8Sjhv+DBWXVWP14X9V2f8VEBr7WcY
         eaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202979; x=1739807779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwvpqgCc60HMle4gfhwGXC+m016RdUxEz0jvpf/EWvY=;
        b=pRliGXVDHzYbjggAiJDgFGCTLX1I+V6jZSoDOvlTFt5o0vR2tBiqw105bjpgiN7ix4
         C+3DXAvS8WDR4L8b4NCDvMFPIXcaT8jJJT4aRCl5MCDSApCVgGYPDjlM/bB2qvoMJC02
         uAnnhV3EwF/cTilyf8tfKjUtX3bf4yrUzK3Au47Y00zYV4AMMe47AcJmUkqSdvzXx6o4
         aJSG9fcceWC2eUOEpe/vtU1bIh0WxeBK3G0GWti4L9tYO7LYZvubavjYl37KKP3KVG1e
         9aKwhIddZnYkzEJQDO0oRMR+LDZNdjchi/JDHUs866M8JJcVidF8tzcWRNB7NA7yxNtd
         uzNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkIiJWBSjYEA7pHuR0ypkHqkdgzdfIXcr+3rGIPKohSPaew2lWAk0hrf6DePwFdB9OaOdxDa18aUi44A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZwRCY91EdzvkzoNjasN0Y4PxEIGF7KEIkyVrES0I5YNaE6EaE
	1UqdBrW69bdyUaREXTZBUl2EoQy0Awg41xokiX+yHqRf1g5PoAgXwa//OSORD5CBWltaRdOBdVm
	2CT0=
X-Gm-Gg: ASbGncv2uFNBWhNVTcVa0tEGvAQL/5MfiWTlw417pk3aJiE9IMyVoPKod/zUMj96thr
	HTHkRMZbEd4B3npFzwXqn1KrqCk8rDCRfmXJhyQlig2ARTFKyYX1fBE/U4GRwikj2KtDh2ILf8Z
	hjjdh1usdQhh6Rk+Y5kdh9DN80GhuJeKnsCfT9ZYYrDj05Z0mG0fgaoBS5CcmMbNuy5hdSamJJX
	OgwntamskZjR4Kk61U77b5cpOkwXOcLGfhAe7tctMK0pbBj6bdzmyxVXqqbkcUEbB3zeuX0VYtu
	U9sYfrwxZMUaV1yX
X-Google-Smtp-Source: AGHT+IF60Nrg56AuVmMzOdpuxKpb48uNb4fjvgwNZgYIhjdvOfRQGICperZSi1yz93HUq9t/Mg45tQ==
X-Received: by 2002:a05:6000:154d:b0:385:e17a:ce61 with SMTP id ffacd0b85a97d-38de41c5b79mr78637f8f.53.1739202978665;
        Mon, 10 Feb 2025 07:56:18 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38ddbfbb4ffsm4521649f8f.94.2025.02.10.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:56:18 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: cpufeature: use bitmap_equal() instead of memcmp()
Date: Mon, 10 Feb 2025 16:56:14 +0100
Message-ID: <20250210155615.1545738-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_075620_479783_31B26F63 
X-CRM114-Status: GOOD (  10.57  )
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

Q29tcGFyaXNvbiBvZiBiaXRtYXBzIHNob3VsZCBiZSBkb25lIHVzaW5nIGJpdG1hcF9lcXVhbCgp
LCBub3QgbWVtY21wKCksCnVzZSB0aGUgZm9ybWVyIG9uZSB0byBjb21wYXJlIGlzYSBiaXRtYXBz
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRl
eCBjNmJhNzUwNTM2YzMuLjQwYWM3MmU0MDdiNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAt
NDc5LDcgKzQ3OSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCByaXNjdl9yZXNvbHZlX2lzYSh1bnNp
Z25lZCBsb25nICpzb3VyY2VfaXNhLAogCQkJaWYgKGJpdCA8IFJJU0NWX0lTQV9FWFRfQkFTRSkK
IAkJCQkqdGhpc19od2NhcCB8PSBpc2EyaHdjYXBbYml0XTsKIAkJfQotCX0gd2hpbGUgKGxvb3Ag
JiYgbWVtY21wKHByZXZfcmVzb2x2ZWRfaXNhLCByZXNvbHZlZF9pc2EsIHNpemVvZihwcmV2X3Jl
c29sdmVkX2lzYSkpKTsKKwl9IHdoaWxlIChsb29wICYmICFiaXRtYXBfZXF1YWwocHJldl9yZXNv
bHZlZF9pc2EsIHJlc29sdmVkX2lzYSwgUklTQ1ZfSVNBX0VYVF9NQVgpKTsKIH0KIAogc3RhdGlj
IHZvaWQgX19pbml0IG1hdGNoX2lzYV9leHQoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAq
bmFtZV9lbmQsIHVuc2lnbmVkIGxvbmcgKmJpdG1hcCkKLS0gCjIuNDcuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
