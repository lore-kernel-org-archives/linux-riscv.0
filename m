Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB8BCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad4OUXC6jul33zpPpGyp6gTgyeUs/caS/wowVBrr1Gw=; b=pKsYOQrIdfumdK
	vYIsh+QdS1MLplcLCVs3RXJ/mnrr98upyCoU8U2NmCzlfLI+wlQA9YwDlg5KV7G1fUFqeU+giQPJG
	+3mF1uaV8D0gWSahFXZrfR4j2GbcC6sW9BAty3VyjQTkV3r9JG3mc+UUI43WLryn7hMK5wGm1NUj3
	wAE0D0YksP6bp3ca5sFHKaeLyivjFVtmIfQV5Lww5LjC1PRSzK71h8L9RHLR+/ootHiHQJYIBK3nC
	AMkVeIxk5FYjOI3xidTxlluRAyNbgoWeoe9vV4aJyZ7aWemgDV5HqC3jdFG7L5pPOtIbL9wUIozA/
	PPOW78zACQ3H86FtppHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzj-000000063Yh-34CS;
	Wed, 10 Apr 2024 09:11:52 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzG-00000006394-0Ud9
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:27 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-516d23d3bceso1854817e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740278; x=1713345078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t15PVccKugGeH48k2RjHxzRDqhwHnpwL852aH0G35EQ=;
        b=B1mHKBMEwZM0LudEcZUYvGBNfJZzl3vkGx88jYI5YZCdgM79C1+4RFeXSPFUTHDiDc
         Od7oqW3ChvOAgnUG7NieTiVFq0noeKvdvO+o59BJd+0LErScnNSn7DCt4qA6LDAECnnQ
         ewR1tVukqNVTE4QBH6AQOrSiXIdI+sx3v7wmFxfIL/a6DkvIJ/55JwVZygguWRq2HGMY
         FOgnhngub9c59I/72vIfgYonYTeUPW7czaO7pFjLFl4V3vLlV1jGhIEkYK7XuDLkfYPA
         9w/MhBxzoRhdf5JOwJ0QhjOFZD8bXIP7JAOivCkhBe+IKUWb1EgnNoClaQTLj7Ff4707
         6LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740278; x=1713345078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t15PVccKugGeH48k2RjHxzRDqhwHnpwL852aH0G35EQ=;
        b=EzTRWRyUzljqGY9o5atR6ulshnTEwjtJpc8H/YzT/oRuiUPAXUQG3XVvj12v7rXP9y
         /g1RuSf5c+KufdJqzQiif1yt0Ri9jaRg1Fj33yEw2RhExOyQRWnGh+qn8YxGJd24rZFM
         HaO9Cw6mGiP9zvNun43Z0hqObt3FNdRsmmS9lmgAoEJZ75NBTCugoVEkPaC+iH7iBgcj
         kRnM5QPddoxwQwNhtezczDGoMLOuVgJOB+GJjBe8bTM9x/HrRLZfOwnwuP8kOCBY9daF
         KDhxp9e+OEl1xOmUeHfZ+kFSC10MWujs/Sre6GooJgYcFooh0FVjgqNDoFIpIglrUXgk
         eHJA==
X-Forwarded-Encrypted: i=1; AJvYcCUOSzE6QFO9UelXvh+5hfKbE6ZGUcUueYmapAW5Yq+gza2R1+ii+5NNLSQgAu7K2F0Zwlb4C6qvcfoWJ7P4Xja9TV9NOQNqLebQ1e2FiLSs
X-Gm-Message-State: AOJu0YywZwx3YebNPPNV0i3pVgcQ6iM//mIZLlfVRunWSbLXgeumdBva
	EX6KWkblOhYXv9BRga18fdt1AvhdUKpwoQnbejVfLJvjbrQMXFkxnkWow5fLWxA=
X-Google-Smtp-Source: AGHT+IEJVPrhhNyrwtKSmL80bhwWSb7hKQIJxpwscC0mKQBtReP2KsNql54gMOZNVGMTZPZ+xSnEDw==
X-Received: by 2002:a19:8c16:0:b0:513:ec32:aa89 with SMTP id o22-20020a198c16000000b00513ec32aa89mr1163732lfd.2.1712740278556;
        Wed, 10 Apr 2024 02:11:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:17 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 06/10] dt-bindings: riscv: add Zcmop ISA extension description
Date: Wed, 10 Apr 2024 11:10:59 +0200
Message-ID: <20240410091106.749233-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021122_274516_B7703553 
X-CRM114-Status: UNSURE (   9.15  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmNtb3AgKENvbXByZXNzZWQgTWF5LUJlLU9wZXJhdGlv
bnMpIElTQQpleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGluIGNvbW1pdCBjNzMyYTRmMzlh
NCAoIlpjbW9wIGlzCnJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNjdi1pc2EtbWFudWFsLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA1
ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKaW5k
ZXggNTE2ZjU3YmRmZWViLi45MDI4MDBiNmRmZTEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApAQCAtMjUyLDYg
KzI1MiwxMSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgbWVyZ2VkIGluIHRoZSByaXNjdi1p
c2EtbWFudWFsIGJ5IGNvbW1pdCBkYmM3OWNmMjhhMiAoIkluaXRpYWwgc2VlZAogICAgICAgICAg
ICAgb2YgemMuYWRvYyB0byBzcmMgdHJlZS4iKS4KIAorICAgICAgICAtIGNvbnN0OiB6Y21vcAor
ICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpjbW9wIGV4
dGVuc2lvbiB2ZXJzaW9uIDEuMCwgYXMgcmF0aWZpZWQgaW4gY29tbWl0CisgICAgICAgICAgICBj
NzMyYTRmMzlhNCAoIlpjbW9wIGlzIHJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNjdi1pc2EtbWFu
dWFsLgorCiAgICAgICAgIC0gY29uc3Q6IHpmYQogICAgICAgICAgIGRlc2NyaXB0aW9uOgogICAg
ICAgICAgICAgVGhlIHN0YW5kYXJkIFpmYSBleHRlbnNpb24gZm9yIGFkZGl0aW9uYWwgZmxvYXRp
bmcgcG9pbnQKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
