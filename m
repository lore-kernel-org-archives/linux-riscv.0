Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A461ACDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6/Wxmmp8mxdKwPf/o0wJPEYWyk6ky6sy2O3arT6+LU=; b=2Twwm0iahoslMa
	XRwoGWDP3sQWKOV2C32y28IdxHvQsv3TyscQfL6hylRtqO745D0LPmZEt1PUhoYBy4MB6bY4AFsm6
	By/sTqkbHgdALySNBeJFPiqdGZwdO90NNBwEGrbmc3sh0+5k1FTMtlRW5Cg9KXO24wTQu1oJuQLz3
	oa2+GuL5wwk1Khq56cWgYXBx3wD4abGbdQE55lZG7Wglmnz89SMhoJv+5lrryuuWsyH3ZqUZ0KbhA
	WXLTIuPz1JIQzOF9P+zr/k6LWeodXyiQ4+3HAfqpzDnizaAF56LzgCvEjJMKjw1FuQiGaiU0Ekcqa
	ilLdLbE/P5gyoo6neQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvW-00CNb6-21;
	Tue, 17 Oct 2023 13:16:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvF-00CNBY-0D
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-407acb21f27so736115e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548542; x=1698153342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2m+45j3rbdaE2NY5Ol9kX9V97sFwlFvtbz4uSqqCuM=;
        b=J+o/ydze76+w4/ssmdcn4nYPyQ0+3HpAWSJqrSnVFVDlsvvPrh2P3vRv6q+Ek4drkW
         /NWBpiL8YeJaG6+xUp4nGdu3wI/A8iIQF3tUlTtbIBPaiGF0759a8dESTEmjZ/TY/wWy
         1vFJAD/ImcRvYMWgZ4RVjQ8gAUJvOWPPNgPLIKE0ESKz3/kW0zOsFs1Y+a09LQ2WdjZq
         qGKvqPrX2s7SDpqOGCcopXCK3xSwR7IROXwa4HZamdmAnkdUmCOYqAGp4/Kg2qxmZ8ZN
         MgCRYe0q72J+HxDZs7XuNnncQdNjQhWFrkS/BJ5i+VKEvEh64VWfsoshjLEo95iIHyA6
         OoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548542; x=1698153342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2m+45j3rbdaE2NY5Ol9kX9V97sFwlFvtbz4uSqqCuM=;
        b=V0izfi7EZFjkJPJYkry1C7coasajgSAzMeptgHpy0doAI+iSjlxu8rJWWkuOE2FOYX
         QwlgYVLJH42eNhunfrBW0XCZIE74zolHU+FWdrBnI8MZ1HrjMMicNBFaxm1Tah4MyH3N
         pi3rWOYGCyw0sqgFHMQ37+Q5dpE+DJ+rpXXV7aLbFKuWOFLRjsZvkrkz07E7ZPs8IhDS
         UnV2IGkMTPhwM+Lt5melhA0+zUPDvEE9bQ/uu5vfhRU+nZSlsYnDvyIRkrUtd8+CeVq9
         yRmZEj9tFSNHpTx2tBGP5OsH7K8NQYVwagT4aQP08DlW8+CSH5A0iS6QTya7RYaPsRet
         4lkQ==
X-Gm-Message-State: AOJu0YxvWw8MphqlTwcsdJkCkQxfRIXSKC8PUZ3AilSP/UFf/S2VySGa
	6aJstMcUUbK8UzF/0JADPCJbo9bMBauS+fqlMQXMrA==
X-Google-Smtp-Source: AGHT+IGl5sTERYXS8gZHY5M+sSNt7WnBezruA/vUWy9wkpbAVX1cnbpzCqcAtWiC4jzRoXD25NnTVg==
X-Received: by 2002:a05:600c:929:b0:405:39bb:38a8 with SMTP id m41-20020a05600c092900b0040539bb38a8mr1653730wmp.2.1697548541300;
        Tue, 17 Oct 2023 06:15:41 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 15/19] riscv: hwprobe: export Zvfh[min] ISA extensions
Date: Tue, 17 Oct 2023 15:14:52 +0200
Message-ID: <20231017131456.2053396-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061545_135508_5A9CB197 
X-CRM114-Status: GOOD (  10.40  )
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

RXhwb3J0IFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uWzFdIHRocm91Z2ggaHdwcm9iZS4KCkxpbms6
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMV9ZdDYwSEdBZjFyMWh4N0puc0lwdHcw
c3FrQmQ5QlE4L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAg
IHwgOCArKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8IDIg
KysKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jICAgICAgICAgfCAyICsrCiAzIGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jp
c2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAppbmRleCA5
YzkwOWUwZDUzMTYuLjc4MmFjMjZjYjkyYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNj
di9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0x
NDYsNiArMTQ2LDE0IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UTlRMYDogVGhlIFppaGludG50bCBleHRlbnNp
b24gdmVyc2lvbiAxLjAKICAgICAgICBpcyBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklT
Qy1WIElTQSBtYW51YWwuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZGSGA6
IFRoZSBadmZoIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHRo
ZSBSSVNDLVYgVmVjdG9yIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCBlMmNjZDA1NDhkNmMK
KyAgICAgICAoIlJlbW92ZSBkcmFmdCB3YXJuaW5ncyBmcm9tIFp2ZmhbbWluXSIpLgorCisgICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRkhNSU5gOiBUaGUgWnZmaG1pbiBleHRlbnNp
b24gaXMgc3VwcG9ydGVkIGFzCisgICAgICAgZGVmaW5lZCBpbiB0aGUgUklTQy1WIFZlY3RvciBt
YW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgZTJjY2QwNTQ4ZDZjCisgICAgICAgKCJSZW1vdmUg
ZHJhZnQgd2FybmluZ3MgZnJvbSBadmZoW21pbl0iKS4KKwogKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMgcGVyZm9ybWFuY2UK
ICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgogCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCBkYzRlYWE5NzhhZDEuLjc5NDA3
MDEwOTUyYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUu
aAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBAIC01Miw2ICs1
Miw4IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhU
X1pGSAkJKDEgPDwgMjYpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkhNSU4JKDEgPDwg
MjcpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlROVEwJKDEgPDwgMjgpCisjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkZICQkoMSA8PCAyOSkKKyNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pWRkhNSU4JKDEgPDwgMzApCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQ
VVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8
PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDAp
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19yaXNjdi5jCmluZGV4IDg0ZGFhZjZlZDRhMS4uOGQ2ZWRkNzIxNjI3IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfcmlzY3YuYwpAQCAtMTg1LDYgKzE4NSw4IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVf
aXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCQlDSEVDS19JU0FfRVhUKFpW
S1NFRCk7CiAJCQlDSEVDS19JU0FfRVhUKFpWS1NIKTsKIAkJCUNIRUNLX0lTQV9FWFQoWlZLVCk7
CisJCQlDSEVDS19JU0FfRVhUKFpWRkgpOworCQkJQ0hFQ0tfSVNBX0VYVChaVkZITUlOKTsKIAkJ
fQogCiAJCWlmIChoYXNfZnB1KCkpIHsKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
