Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33826C04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BT1zlojInJR2QP/R9iUOOba0248vWxSap/EzyMZ72gs=; b=a688GA0t2CBozz
	RvEefDNdgNKmD+hnalNmo0sAXibx1DHBMiehd73toeHh6768VNusE6NXFyxqCq01aqv+bnvNae0UV
	6CnUahE/0PLePkdXU5PnK0rSzBnkd20PKZQ9Y1ZHjz7LjbZ/P92M3sizkIN12NMSoM060tp+GA9KU
	9ZAq6pWvoRWmpR9lYLm0quJ4ADV4i1iU813ZQJWXvgU3kbSPBci57+fBn/U4Sw4pPcUfGbk0uEouc
	s5m+dEa2Xw+g0R0cfvw7hTWqlbNMVPEgAG+JefBq1Ueu3JOvV7EzNUg9NB/P3LJw3qiSKofWl+Bmw
	NSXLipZ8aOkOCnTYjBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR84-00000002D25-0pb5;
	Thu, 18 Apr 2024 12:44:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7Z-00000002CZq-2GYR
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Apr 2024 12:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HCF5E0lf403bRxRvK1+a63xMUHlXis3iiu/dcBPgPms=; b=R9oCcBzlQWdo9DlQuX9YkWNXLk
	nyUVexFO1rJ2OFuJXQu5Lok6BskpTWUsYSK75Dbpv/DN2BN87GbKxUH+VBMyDEOc+z2c7NMcu9Niw
	5M45tu5/W3lG53haRje8BHDizxL77UNWU/aVA08Ct8ch4NQiQ1Oai/EaOqv0dgo58uoQcFC+jQdOz
	emNNtA3qh6ILtU6pKb3+JEFqvYCDPSH8XhdtjJyGb+yaCsg3U1pcuW+VnETZ3ydVcdp9AeGbhjKET
	HF65TgS/XQFaiSwF2E3Lc+Nr2Oe+h/2g+ayJIcecfzIhiK4E4asUBtsfJJdMa59nOPDeviAWpE0M7
	lLg+bE1w==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7W-0000000Bzr6-02Px
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-349a31b2babso94929f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444244; x=1714049044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCF5E0lf403bRxRvK1+a63xMUHlXis3iiu/dcBPgPms=;
        b=i/C8DTe4A0WfdA3YiEhzRBmi3Y8kSKNNmY/CVY/oyHJSvOluMFklyGgfDVqUkXuLsN
         jIpcbvRW3kjKzg6UmYo6zWDciT8oHUYWoLVtBxP47WIOCFPUMvHNIFYPHFDx3NEZEDpc
         FgHUF+J7/dyhr3fVO2NS5JRZrEOqPDDFQazbKi6/mY1CrevrfkqJK7+r5OyjjdL/aXvO
         l0Y0l105syP98OKE7sPd8Ku5kRuDqgZHqrJGz0z4wjEfbRvPrZEQYvrA1miSzhhiETRi
         ECsOzXqwykC/eiSGzhrIrUQQSC/h0E6HUbdNy5NeUJ1KCchQkng/bBLzgJu4ZVOWl5wR
         odtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444244; x=1714049044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCF5E0lf403bRxRvK1+a63xMUHlXis3iiu/dcBPgPms=;
        b=drjDVoo9EDb+ucjM7JQDdWkvFRb6hVnbhDAwnnXWvdFmzkrNwZ8mjxGEJ1l7GVsFjp
         5vxLmKKD69mZVR87PnioM5NYkYrv1TAwJ9rfGT6BMwBl0HH97fRreNo1CPA4VQtJKAsd
         V5mMiOMa1/3YSZME1KV8h0rMCVfNLACsqfsUxhoLzi1KrglihYxbXnvlcJgCAiYo5zcb
         zd2pZyvoNLWODKJIP0euA+iSBqLH8C49d/+2EzbKJ9MdUngDZmYsNleUs70AgX8hGcNP
         zCFIvdrGeskvfNzyXoDxRIVbg2eixo/qhCY1L+B5WIqC92MH38feGXLZyu8X8/+w3azG
         KX3g==
X-Forwarded-Encrypted: i=1; AJvYcCXJhfKfU8lB2CCnLxtF0eoNr23sF877XE5rKqH+iNuRu1QGMyOoLIbcZBWAyPjm2K8rV5bU5Levm/xnURSTBVL6pHjeXaToCC8PLC+YFs7P
X-Gm-Message-State: AOJu0Yxt9/ndK0yrinV/u6XBqa8N4qW5qr3zJx8ROGoRGYr1/pxwVBlk
	JBPGBSjZ0pZ2tmPvhkQ8OVcm2r7woZMYNSAnU097RF9vR6vIAa3dV3UKAQzjhTI=
X-Google-Smtp-Source: AGHT+IHf5iuv0LIJwrYLLs/M29+a7bnqtqrULSppwC9XA+JzBmE6As/f1Ah2mDNqzxt/R7Bqm6p1VA==
X-Received: by 2002:a5d:5046:0:b0:349:eb59:c185 with SMTP id h6-20020a5d5046000000b00349eb59c185mr1524481wrt.1.1713444244182;
        Thu, 18 Apr 2024 05:44:04 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:03 -0700 (PDT)
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
Subject: [PATCH v2 08/12] dt-bindings: riscv: add Zcmop ISA extension description
Date: Thu, 18 Apr 2024 14:42:31 +0200
Message-ID: <20240418124300.1387978-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_134406_256388_C87E9B79 
X-CRM114-Status: UNSURE (   8.99  )
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
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAgICAgICAgfCAxMiAr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwKaW5kZXggMDE3MmNiYWExM2NhLi5hMDExM2NiNDY4OTMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApAQCAt
MjUyLDYgKzI1MiwxMSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgbWVyZ2VkIGluIHRoZSBy
aXNjdi1pc2EtbWFudWFsIGJ5IGNvbW1pdCBkYmM3OWNmMjhhMiAoIkluaXRpYWwgc2VlZAogICAg
ICAgICAgICAgb2YgemMuYWRvYyB0byBzcmMgdHJlZS4iKS4KIAorICAgICAgICAtIGNvbnN0OiB6
Y21vcAorICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpj
bW9wIGV4dGVuc2lvbiB2ZXJzaW9uIDEuMCwgYXMgcmF0aWZpZWQgaW4gY29tbWl0CisgICAgICAg
ICAgICBjNzMyYTRmMzlhNCAoIlpjbW9wIGlzIHJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNjdi1p
c2EtbWFudWFsLgorCiAgICAgICAgIC0gY29uc3Q6IHpmYQogICAgICAgICAgIGRlc2NyaXB0aW9u
OgogICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmYSBleHRlbnNpb24gZm9yIGFkZGl0aW9uYWwg
ZmxvYXRpbmcgcG9pbnQKQEAgLTU2Niw2ICs1NzEsMTMgQEAgcHJvcGVydGllczoKICAgICAgICAg
dGhlbjoKICAgICAgICAgICBjb250YWluczoKICAgICAgICAgICAgIGNvbnN0OiB6Y2QKKyAgICAg
ICMgWmNtb3AgZGVwZW5kcyBvbiBaY2EKKyAgICAgIC0gaWY6CisgICAgICAgICAgY29udGFpbnM6
CisgICAgICAgICAgICBjb25zdDogemNtb3AKKyAgICAgICAgdGhlbjoKKyAgICAgICAgICBjb250
YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2EKIAogYWxsT2Y6CiAgICMgWmNmIGV4dGVuc2lv
biBkb2VzIG5vdCBleGlzdHMgb24gcnY2NAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
