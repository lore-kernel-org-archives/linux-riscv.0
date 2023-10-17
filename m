Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70784CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgvZYFyMt9UHtOLpAG/zyR9/+3Mf7VDvBeCkW/X+vgQ=; b=RkoqDxpHXB92t9
	LxNECknT3Y+tFTOK2T6U5GchBuvL6FzT0u+CJZKFV69lOfhuAHIBYvfx1lqX5uGzltY2IkLNcyKQL
	b/57ohQ3QFP5ExC51G+zijeZU2JIu2o38HG5+2OrHR6iALBM23GKlE+I6WcdTPhZjOvV4RogyP2kb
	OWsyrXcz8ULiY5hCQ60PAHNPRcYEG66jRF2nzKmgYuOQmRR8babarmVVcNN52A/yJpULTnOP2a85g
	NmQbjZQ5K7cJjM1l0+kF0ZkFZCa53GM0r9NN916k2uS14QXQX+dfM8RTpwEOcolcWU2K+JuhFdPPj
	bGpQK2eGHByQ0+jhP92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvP-00CNQ3-17;
	Tue, 17 Oct 2023 13:15:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvB-00CN8E-2A
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406532c49dcso17776695e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548540; x=1698153340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcwMvdrQT7dDiQfvq5mk8auJjq+yKDjdUlNI6K4rk90=;
        b=CbCWKzYv6gmuLITW1jO4lFV0H6lfK2ntogWMTDVH8MWPUsZmPfTToG6BlTgKVnF4CD
         7v8FA4tYcuSHQ8Q5PpQVhv3riH+NulTUVcpKgR/5CbIf18PtZErizFITaTYAdDxCkfRh
         Zg6zeoKKglHHZr0LRUT5gN9rear5NfP/tuVo10D1ctScFPj++5UUEZ8kVmWJ5G6yvENZ
         s+7ZzZLPmXFzDiSkB8gs9aPXE1ZVEIXMZLfspOh8mx0L0+fEFYvLBbKzZ6zkyBQrhb6X
         p7DoBqXXUV88ussMydFUxS+gmAggx8Xu43qcv7l177uIMMnbGPShLOyAxrlTppirPU6b
         UGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548540; x=1698153340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcwMvdrQT7dDiQfvq5mk8auJjq+yKDjdUlNI6K4rk90=;
        b=b92j/QoY/dSg5+hO1jmkqLOeTd9th5UfnZn9x2b8k1NW4HDLWEz79iiIYJvo+ZYCow
         3kVBZ1LbRn6rpshVT9L/m4sTA6ec+EQeussKZ6KAA7BqjgwryfUR2A0H36Ql9bjstLYL
         7X4xsI6PESynQvYU3zE2eLYmFIWlZd07kvZ5ScO/zmTf08dYKj6tD8RzLW40L3g7xEqi
         GFSur6h5jgSA2aCmpdu/Uevur0sFLGUU3mO3TzF9ohGkmM8oO2W3cjbnOPih+um0I3x5
         namFC7D46GfO9QnhUmIJMoOik8pWgG8MG52oYq770MzuNm89yCm6M0sO9HoVPyU/jhDt
         lMPQ==
X-Gm-Message-State: AOJu0YwSQD3UBR6DtBambYzj5fw3ncQiGK51/P5B/KpIb/I39jbAdPh7
	khrE65C6RRgqKbYISz/HrVaNE0/RiX74nOgAm9rp5g==
X-Google-Smtp-Source: AGHT+IHVBUlyPGQBU14EXa9PZ6UFLb59Nwth5umwYgIAc2moUAd+hl54lbf8HW53OTtnTpusU2Ppyg==
X-Received: by 2002:a05:600c:150c:b0:405:38d1:621 with SMTP id b12-20020a05600c150c00b0040538d10621mr1641826wmg.3.1697548539594;
        Tue, 17 Oct 2023 06:15:39 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:39 -0700 (PDT)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 13/19] dt-bindings: riscv: add Zihintntl ISA extension description
Date: Tue, 17 Oct 2023 15:14:50 +0200
Message-ID: <20231017131456.2053396-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061541_726575_123A7437 
X-CRM114-Status: UNSURE (   8.94  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBaaWhpbnRudGwgSVNBIGV4dGVuc2lvblsxXSB3aGljaCBjYW4g
bm93IGJlIHJlcG9ydGVkCnRocm91Z2ggaHdwcm9iZSBmb3IgdXNlcnNwYWNlIHVzYWdlLgoKTGlu
azogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xM193c044WW1SZkg4WVd5c0Z5VFgt
RGpUa0NuQmQ5aGovdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAppbmRleCBiMGEwZDFiZGYzNjkuLmViNGM3N2IzMTlmYiAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCkBAIC0zMjQsNiArMzI0LDEyIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBU
aGUgc3RhbmRhcmQgWmloaW50cGF1c2UgZXh0ZW5zaW9uIGZvciBwYXVzZSBoaW50cywgYXMgcmF0
aWZpZWQgaW4KICAgICAgICAgICAgIGNvbW1pdCBkOGFiNWM3ICgiWmloaW50cGF1c2UgaXMgcmF0
aWZpZWQiKSBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KIAorICAgICAgICAtIGNvbnN0OiB6aWhp
bnRudGwKKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBa
aWhpbnRudGwgZXh0ZW5zaW9uIGZvciBub24tdGVtcG9yYWwgbG9jYWxpdHkgaGludHMsIGFzCisg
ICAgICAgICAgICByYXRpZmllZCBpbiBjb21taXQgMGRjOTFmNSAoIlppaGludG50bCBpcyByYXRp
ZmllZCIpIG9mIHRoZQorICAgICAgICAgICAgcmlzY3YtaXNhLW1hbnVhbC4KKwogICAgICAgICAt
IGNvbnN0OiB6aWhwbQogICAgICAgICAgIGRlc2NyaXB0aW9uOgogICAgICAgICAgICAgVGhlIHN0
YW5kYXJkIFppaHBtIGV4dGVuc2lvbiBmb3IgaGFyZHdhcmUgcGVyZm9ybWFuY2UgY291bnRlcnMs
IGFzCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
