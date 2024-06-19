Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87705C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HE7Qo7gqsc5flUNia8cFy3loAhJA8NhlYHtbf48aLCs=; b=PmLWIbTASo3dol
	/1p2pPS4XWLtuePjh8i9YdNu3WrqDpMhp7RUqyW3aoqIpjjkvA7KbNPomqq/fNNqMBH35Alvgosnr
	kB/FPmo2lo7D/BQ6pT/U+lBiHrnsiXbXw9K8tTvRF8hFles0rVYh5RCreFHsmxqjbPtuOi82C95zi
	rb8Ycr5PZTrN/W9ib6O4+OteDNrUKOnAGNVEW7jlRUW6EDXQZFcg8nr9pUyA+uHWIwMqPQEs+bJjJ
	5j5oeiLcR69W+KBQrmfnHRa1l7DQDV0bRV0Vj4U0A54tgWMFVixhRrDJEnzwyT6lnqCTobkzQowWF
	bKHTJytcaCkb0IdOQ1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtcg-000000010uX-1Rgj;
	Wed, 19 Jun 2024 11:37:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbd-00000000zwV-1zx7
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:36:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52cb2fca706so432805e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796959; x=1719401759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPgjZRcqRRqmI3UFgS+Cn+Zr3OcI7PEtvkIvlPP0qT0=;
        b=S3p/attwO+dWnpqExafBV1bUJoJmaXjD7IWumxhRYUVf5tB8GiuI7f3lCxjLXLRHgv
         Uto3a+E29v2wfKPH2Yx62o4n5WMfxS8v60XqK3d8NeBHevSM4ly8DXOOucgEtL2odfcN
         91gn/RictJNEgmiUkb3VzOyf5GgX3N+xGKBjs4wnzmyEoPsctlf8DNFZm9Ka3Z253RFS
         3qTF6eeBVMn6bYFLcaeIVIun5oHnhx7Rg/8QgVS9oZnU0TDNkeaFub2nCSv7IpwNq0QB
         WvRCE4+UFkKltTEhu6p7JthtHDU+nJkktnrVfTuRFhJw6gVBbfYlhJgedIYoSDLr31Ww
         s3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796959; x=1719401759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPgjZRcqRRqmI3UFgS+Cn+Zr3OcI7PEtvkIvlPP0qT0=;
        b=RKjRbhk4OVNoF4+Cd0xK7p7rJA0ING+kTqELPDVGEln2FcP2QVKwwqqWs8sPns4lbs
         ginMny90Wd95WmpExRTru+S3NJwMMIOW3HeXRGNacZprWjbakvEktCsVsk32S81z1SKD
         MvBjf8xco5TWaJ8ZVYqV9hpjxM2n00X13YHd5yvrRpGgQA1gLPtHYaAlcpriSpOaYxBl
         ajFb1OH0XHbjNjLYFJSI4XZ1KXTxpdb+wQksO1LgW3mP1j/oTA9iSsPpT4/qQ8zAL03k
         x5KilQfdNAfk8rlxP40WgHcqXNLOyvMsQxmYRt3zrjid2JuDvx3F3x6Z9GVMm4mdNOFZ
         V+nw==
X-Forwarded-Encrypted: i=1; AJvYcCXdNr2TJ/XxDFP+jThpVXWwXPo3RdnzrFJqkt5w8ZPsSjQJknARSnqLf5NiFXzBfyO1xKJPn04tMNmHK7n1k3+WL4/aSv5SF2sSZjV/Jjq3
X-Gm-Message-State: AOJu0YwxvNlJjtc28AyXQrydlvtALxERrevUGHNAl3xxqXsCZIbycRV5
	zolX7TAi8osq9dr/ydOhh5ZM/JjDd/WakrLGY8+434rETdYqrwrj9gBrYLFpmg0=
X-Google-Smtp-Source: AGHT+IEEUCVgW+BCowVYPjYKYwNlCLmKSZ/5HGn2eR9JA6+OxkNbZ4kw3whUx8mTA5ZRd8MgB6kmxQ==
X-Received: by 2002:a05:6512:398f:b0:52c:a7b6:bb11 with SMTP id 2adb3069b0e04-52ccaa59e2dmr1406908e87.1.1718796959602;
        Wed, 19 Jun 2024 04:35:59 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:59 -0700 (PDT)
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
Subject: [PATCH v7 16/16] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Wed, 19 Jun 2024 13:35:26 +0200
Message-ID: <20240619113529.676940-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043601_938189_05B1DF5D 
X-CRM114-Status: UNSURE (   9.55  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjbW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0gc28gYWRk
IHRoaXMKZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWct
bGlzdC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDg2
NGE3MDFlZjZjMy4uMWE1NjM3YTZlYTFlIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCkBAIC02MCw2ICs2MCw3IEBAIGJvb2wgZmlsdGVy
X3JlZyhfX3U2NCByZWcpCiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0I6CiAJY2FzZSBLVk1fUkVHX1JJ
U0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VY
VF9aQ0Q6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9T
SU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Y6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9F
WFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ01PUDoK
IAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8
IEtWTV9SSVNDVl9JU0FfRVhUX1pGQToKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtW
TV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pGSDoKIAljYXNlIEtW
TV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVND
Vl9JU0FfRVhUX1pGSE1JTjoKQEAgLTQzMSw2ICs0MzIsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAq
aXNhX2V4dF9zaW5nbGVfaWRfdG9fc3RyKF9fdTY0IHJlZ19vZmYpCiAJCUtWTV9JU0FfRVhUX0FS
UihaQ0IpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkNEKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpDRiks
CisJCUtWTV9JU0FfRVhUX0FSUihaQ01PUCksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkEpLAogCQlL
Vk1fSVNBX0VYVF9BUlIoWkZIKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpGSE1JTiksCkBAIC05NjAs
NiArOTYyLDcgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2EsIFpDQSksCiBLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHpjYiwgWkNCKSwKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUco
emNkLCBaQ0QpLAogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2YsIFpDRiksCitLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHpjbW9wLCBaQ01PUCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHpmYSwgWkZBKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZoLCBaRkgpOwogS1ZN
X0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6ZmhtaW4sIFpGSE1JTik7CkBAIC0xMDIxLDYgKzEwMjQs
NyBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7CiAJJmNvbmZpZ196
Y2IsCiAJJmNvbmZpZ196Y2QsCiAJJmNvbmZpZ196Y2YsCisJJmNvbmZpZ196Y21vcCwKIAkmY29u
ZmlnX3pmYSwKIAkmY29uZmlnX3pmaCwKIAkmY29uZmlnX3pmaG1pbiwKLS0gCjIuNDUuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
