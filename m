Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DDBCD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m6bk8R+WAAvA4IYIaWVoWw3YAuJ2YxLhowxgFV5OR2U=; b=2wKNt7nfA0R34d
	e0uDTwfOmcoat6PaLQySLbRVdDi4EWH29qp5fOygHDTUlZXbK0rwTQ31901IV210BNuW60AWdql56
	Dz6KXTu5Kg2ArigkZtCp25RXCUJ0Ko75bvVrhXNLPA8HJsW4uBmQL+yXw/D3bLIsKZDs6RBt+Dlso
	yBN25aNP/6KyjH6EWxMbgkKE3/OlkzRSV+HdlGfF7nB+x/U/4u0R6bzeRQ6XHjp+8C5HEs03TzusV
	QSrIYRaOAIrxf51TFcxEiKSJbkiUjQK/OZE2jHDEg1O9DrO75QqVujVbZ7TlBsIXtrrxqgWZT6+b6
	2XcJOfSqWFZ1xXngNMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFQ-00FjN5-0X;
	Wed, 11 Oct 2023 11:19:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFG-00FjEf-1W
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40651b22977so11504465e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023154; x=1697627954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgxCkZcwRtJ6lnqrc2aMJ8ZnEwBE0+jayLLcWD/cr6c=;
        b=KKkrH/EVN1iGtWGIHMbJi0rqTDCy0UWrx404Z2JC8OxtKN4b4cN/5r0Im3mpAkYNmz
         D+/a4zG/8JTid5U8Z463IR4YY+zBw5jyIc+ngFmJnY+ZLksqWX1mdAujeNZIqkn/OWWd
         33gAyMi81/ptgEx7kKVlpr6m5nw1nMC8PsSPOaXRI0NPn3cbTGsLcMJabqukgtpKfjAq
         dCymO6KyRmxeVLvLHNuEKg3TBtAN/2Ib8Rh79FmS6ikJWQnFxTjjfx8kgtNWVkT6O73g
         NN0Pan4iZy+/Eo56GysrTgF5sJ1O1dGkqWRKhiGk4YtwCWuX6L7rRCo2vy65Xa/4kILf
         4X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023154; x=1697627954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgxCkZcwRtJ6lnqrc2aMJ8ZnEwBE0+jayLLcWD/cr6c=;
        b=TeVeQubQFkFAKme9KooHhctIH02cV5pBGyGmKLp3i6r7HcPWfEBSK8ncpXnpVuyW+D
         0mwcFus3mK698KyxhdAlvIriBGfkwjAA7aiLp/zoqM28IydbdE1043kuxWBoHVQv6JVQ
         Xq6UDEzqT+QT9kmBH2UcVrVBsTTlwVcz2G2bE3W07znHkHvztZwejp3UmOJCoP/xnTNm
         gjTz/VEaCw1l4L4PlPMjF/asfPKgLa1f0BE1i54dNZ+f/qbbPBUGcXXFVBCLY9WXravb
         0jgwc1cODk2UVhqhkeXMcPGhVZhsYkcei7f7kOxBkjwGz2EB27aWfpZYvL/cxVaaUPQX
         SBng==
X-Gm-Message-State: AOJu0Yz2aQqPqzUiid/EB/g7ZjtERWACQJnD64gKhrI4eSSR2TocBBcH
	+2pwo+BrcYuzttMoa3mWUGU2GpVbEDOmcmH4vJbfCg==
X-Google-Smtp-Source: AGHT+IEo/nqOQf5Nm/GUklG2Aaubo3KEMXGfw3sm6uWoHOgjqGYxkEcgDn49UXNfcqfEstuD4y7hWg==
X-Received: by 2002:a05:600c:3b9a:b0:3fe:21a6:a18 with SMTP id n26-20020a05600c3b9a00b003fe21a60a18mr18661658wms.3.1697023153795;
        Wed, 11 Oct 2023 04:19:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:13 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 00/13] riscv: report more ISA extensions through hwprobe
Date: Wed, 11 Oct 2023 13:14:25 +0200
Message-ID: <20231011111438.909552-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041918_653745_2BC09EEC 
X-CRM114-Status: UNSURE (   6.25  )
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

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byBnYXRoZXIgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
c3VwcG9ydGVkIElTQQpleHRlbnNpb25zIGZyb20gdXNlcnNwYWNlIHVzaW5nIHRoZSBod3Byb2Jl
IHN5c2NhbGwsIGFkZCBtb3JlIElTQSBleHRlbnNpb25zCnJlcG9ydC4gVGhpcyBzZXJpZXMgYWRk
cyB0aGUgZm9sbG93aW5nIElTQSBleHRlbnNpb25zIHN1cHBvcnQ6CgotIFpmaFttaW5dCi0gWnZm
aFttaW5dCi0gWmloaW50bnRsCi0gWnZiYgotIFp2YmMKLSBadmtiCi0gWnZrZwotIFp2a25lZAot
IFp2a25oW2FiXQotIFp2a3NlZAotIFp2a3NoCi0gWnZrbgotIFp2a25jCi0gWnZrbmcKLSBadmtz
Ci0gWnZrc2MKLSBadmtzZwotIFp2a3QKCkNsw6ltZW50IEzDqWdlciAoMTMpOgogIHJpc2N2OiBm
YXRvcml6ZSBod3Byb2JlIElTQSBleHRlbnNpb24gcmVwb3J0aW5nCiAgcmlzY3Y6IGFkZCBJU0Eg
ZXh0ZW5zaW9uIHByb2JpbmcgZm9yIFp2KiBleHRlbnNpb25zCiAgcmlzY3Y6IGh3cHJvYmU6IGV4
cG9ydCBadiogSVNBIGV4dGVuc2lvbnMKICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBadiogcmF0
aWZpZWQgY3J5cHRvIElTQSBleHRlbnNpb25zIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0Eg
ZXh0ZW5zaW9uIHByb2JpbmcgZm9yIFpmaC9aZmhtaW4KICByaXNjdjogaHdwcm9iZTogZXhwb3J0
IFpmaC9aZmhtaW4gSVNBIGV4dGVuc2lvbnMKICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBaZmgv
WmZobWluIElTQSBleHRlbnNpb25zIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5z
aW9uIHByb2JpbmcgZm9yIFppaGludG50bAogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmhpbnRu
dGwgSVNBIGV4dGVuc2lvbgogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFppaGludG50bCBJU0Eg
ZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHByb2Jpbmcg
Zm9yIFp2ZmhbbWluXQogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWnZmaFttaW5dIElTQSBleHRl
bnNpb25zCiAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgWnZmaFttaW5dIElTQSBleHRlbnNpb24g
ZGVzY3JpcHRpb24KCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgfCAxMjcgKysrKysrKysrKysrKysrKysrCiBEb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUu
cnN0ICAgICAgICAgICAgICAgfCAgNjUgKysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmggICAgICAgICAgICAgICAgfCAgMjEgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oICAgICAgICAgfCAgMjEgKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAgMjEgKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
cmlzY3YuYyAgICAgICAgICAgICAgICAgfCAgNTMgKysrKysrLS0KIDYgZmlsZXMgY2hhbmdlZCwg
Mjk0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKLS0gCjIuNDIuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
