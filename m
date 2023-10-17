Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98648CDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LAvTrw/wb8YSS5ZQ/69Lq50BE5NQq3agJBuDWSxV5I=; b=Vplqu7TSrr2DwE
	4ImU3NNb90RRryM4hqM5ghIRH96UUaA0GlqlxW7dVH9f44I2cfjARAd9uzKELNDPDvYk5dcFWIXAl
	iCfcZ2S4+m4h8yNHAbEo77tysiwoY9QKCdcCyllkR1I5g93Er4lZQ91ue/vrS07UxtkuvYVKWWafY
	RqYeprU6kTQIe0j0u5JdadmWkfwSyuXryvnSHFkToNi2nxMaq7ZQRusw4jecACAvidWB3szjTyBN8
	HcxqeRgjbTTHvshJ4/J0c7Ps1jXjj7fCxOIABpmJ+mz+SnuKX6CdMKdak8dp0ufDG2eCYw153ry3U
	q4Wx8eSqVHM4ai3eM0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvH-00CNGG-1B;
	Tue, 17 Oct 2023 13:15:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv7-00CN4L-36
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4053e6e8ca7so18306215e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548536; x=1698153336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWnPq2gaUY6Bw+QhkV+/+BvTRtvqF4BIiAlwEf1vKGM=;
        b=KybLODxwBZloNnuguenngfzkyVRropKZZbwuBZUFidXUq1H+89XnoPpMP7uIFuadXH
         ixGlh3e5z0xKYP7dzmRO+jIQ1pJjsodmSfI7HWvcFMNmlWs2/5P0zPiWpkNOwC9axS1k
         ZtZG6d3/O52u9ZuCjIOa7zJTtDpToJy4OBUdwwWyq9mV/lNoh16i7VuxcMIm7Dr1YSW3
         einzUNixfwLkZLk7viEsYomzzu+wR6tp03GghVrTg8JsGlzCmnh00tR+/CDiSOWRyvzV
         iYlfxES58e0IabPx4yce1Rzuvp92rCCOvjFHOXhbObXtywOMdi0gzp/yFPOVuLpUjUNr
         n9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548536; x=1698153336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWnPq2gaUY6Bw+QhkV+/+BvTRtvqF4BIiAlwEf1vKGM=;
        b=ZynjsHYvQu28PfOQ4uNRkuRX4GJmUFvJZaxxHO1gOc/rWeR4GICB7cNgaA5dt8lNHo
         rDyccR8KqPF4yavulxVmVP/rW/vCkCu3+QkTguDBb6dxaCix9mbXT8NNtpokvpwxfcdo
         28Ji8kcF4O0F/3CWYgFz/80LG6txNQQ4C5hstTEvDehNO81iG8sat4pGJqqXoX71ZUzo
         oP4Zi84aJpa//X5Tzm5mIG+YAJbWhrDfzVnMhcgZq4AthIOJrfqxfKDJMNTBSwPfk+85
         bzXE3FF/Ik46aZAuF9uMr1EXjaGeirJJLuVlwt4eCCfWXRFrz00lkZt40K+RKVPgDzz1
         XY/A==
X-Gm-Message-State: AOJu0YyrCLAxDWj3kx0IhCKd17XJvRHCI4Dz7ly57GaO0UrRS/ihOY1V
	amJ6VlLYTin7rWZZLFxU0JqSCclhgO9BNbscDuQ+TA==
X-Google-Smtp-Source: AGHT+IEySb+/Q17ICv3l76yF8jJjBFEiH3hFuZYYjFi7wwKXT2ljs/AM5fR+ARSo4sgAbdGf5BuQog==
X-Received: by 2002:a05:600c:1d9b:b0:408:3836:525f with SMTP id p27-20020a05600c1d9b00b004083836525fmr251193wms.1.1697548536185;
        Tue, 17 Oct 2023 06:15:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:35 -0700 (PDT)
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
Subject: [PATCH v2 10/19] dt-bindings: riscv: add Zfh[min] ISA extensions description
Date: Tue, 17 Oct 2023 15:14:47 +0200
Message-ID: <20231017131456.2053396-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061538_006886_D660E639 
X-CRM114-Status: UNSURE (   9.23  )
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

QWRkIGRlc2NyaXB0aW9uIG9mIFpmaFttaW5dIElTQSBleHRlbnNpb25zWzFdIHdoaWNoIGNhbiBu
b3cgYmUgcmVwb3J0ZWQKdGhyb3VnaCBod3Byb2JlIGZvciB1c2Vyc3BhY2UgdXNhZ2UuCgpMaW5r
OiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzF6M3RRUUxtNUFMc0FENzdQTTBsMENI
bmFweFdDZVZ6UC92aWV3IFsxXQpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+CkFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbCAgICAgICB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwKaW5kZXggOTNiZWI5ODcyOTAwLi5iMGEwZDFiZGYzNjkgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbApAQCAtMjA4LDYgKzIwOCwxOSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAg
ICAgaW5zdHJ1Y3Rpb25zIGFzIHJhdGlmaWVkIGF0IGNvbW1pdCA2ZDMzOTE5ICgiTWVyZ2UgcHVs
bCByZXF1ZXN0ICMxNTgKICAgICAgICAgICAgIGZyb20gaGlyb29paC9jbG11bC1maXgtbG9vcC1l
bmQtY29uZGl0aW9uIikgb2YgcmlzY3YtYml0bWFuaXAuCiAKKyAgICAgICAgLSBjb25zdDogemZo
CisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmZoIGV4
dGVuc2lvbiBmb3IgMTYtYml0IGhhbGYtcHJlY2lzaW9uIGJpbmFyeQorICAgICAgICAgICAgZmxv
YXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNjQwNzRiYyAo
IlVwZGF0ZQorICAgICAgICAgICAgdmVyc2lvbiBudW1iZXJzIGZvciBaZmgvWmZpbngiKSBvZiBy
aXNjdi1pc2EtbWFudWFsLgorCisgICAgICAgIC0gY29uc3Q6IHpmaG1pbgorICAgICAgICAgIGRl
c2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmaG1pbiBleHRlbnNpb24gd2hp
Y2ggcHJvdmlkZXMgbWluaW1hbCBzdXBwb3J0IGZvcgorICAgICAgICAgICAgMTYtYml0IGhhbGYt
cHJlY2lzaW9uIGJpbmFyeSBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVk
CisgICAgICAgICAgICBpbiBjb21taXQgNjQwNzRiYyAoIlVwZGF0ZSB2ZXJzaW9uIG51bWJlcnMg
Zm9yIFpmaC9aZmlueCIpIG9mCisgICAgICAgICAgICByaXNjdi1pc2EtbWFudWFsLgorCiAgICAg
ICAgIC0gY29uc3Q6IHprCiAgICAgICAgICAgZGVzY3JpcHRpb246CiAgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgWmsgU3RhbmRhcmQgU2NhbGFyIGNyeXB0b2dyYXBoeSBleHRlbnNpb24gYXMgcmF0
aWZpZWQKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
