Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C0CD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnGm4T7ORCPjacU0Uiaqvr68NKMoUfmxJ3dsE3BO2jY=; b=EeiMggwkB7LqUV
	OmRiYYO6vzcKj0/LxMbIhQFPEAD3ILQIhcKGesKkQvIl5MpFWILL5nPz7l8e5X5TmLDq0WL3JxXQj
	jXzptbx78sjwWN4qEcv9GW+TAic5KTu0148EimUv2+7X/sDdIFJUTmhf/AAmGqDamUHnEN0uwwu5/
	12wJH8UsYVSRV+N9DgEd61s9PCpVJCdF1yWFOCq+d0pKimVYXzZta9SMkaotWD5kVTGctW4dhKxoy
	xDUbNVn/8IXLNMDuBs8b9IBzZy+XEermY0tekUDYVYdys3mNRCmKpL8+AnCEwR34o+Sg4fWQ3y7qW
	aXx/MriDVrx8ZQVOWxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYMH-00Fqpe-0h;
	Wed, 11 Oct 2023 12:30:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFO-00FjJy-3C
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-406532c49dcso17186255e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023164; x=1697627964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgOpomIA0gFd2Dumo10XdK5WbanlcO0t/Ib98/qFyoU=;
        b=eUOLoBH8L6oA1krLbTb+HuNfCqbtD/nsF2rGsUfXo2Sqj3dc3J0IybNvtCREjZZ6M8
         UuOQJzTq1fl/Bpcq0IQAYAxo3pjdTyj2Q2XRSp++uxO6c4X7phExiBneifIvlosHttu6
         6RmeO1CdOho3/NZ+pXfNu050coiVxNxVh5zqGC9BYf59dpq8OP8tuXjkmJdLFPe5GXyt
         d8vLp3iiDMDooOc6fwHpqdwDhEYHiijaC9Ue7b5TuG4e4w0qRgB1tZUN+RMO0Fg6ZMbJ
         FN6qMAONEYWq8c+NR6J4PGz2lH5Uh6yiow1IT+g+UcREPBgRhmFsdnPSqKcQ2ML5tQEq
         qGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023164; x=1697627964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgOpomIA0gFd2Dumo10XdK5WbanlcO0t/Ib98/qFyoU=;
        b=BMM1sdXYNqhupVJGDzy8V5+y2XEr2IzCn/ji//5NxVAG8rv6g9rJf4B8vXPYN8hLx/
         yjIXvEipuQu0cJR1liS4/EeMX36p4cfdnNHn2Wp7e2LoG3/IQpKu0j+6/184JaASriHJ
         fKVYNOqOv1tgHShZZtMB6ZvhF0jzpSUmUO2ph+jChbv2Zsst2sYrYu3p9XEytVMkd/Ab
         BYByGZX1SeRubAFIPB2X2sHrtOefHKpFZbU+fzWStoEoz0d6HDeSLeivRWC0M2r4FfjB
         PZXG2RYYzV6qTBCWhJomJATZhsRQson51s1VKD6dJKn/Tx3n6Kxeg9mmitDzY6MlyaCT
         EoHg==
X-Gm-Message-State: AOJu0YzI4on0LTvwzgu7CfPZTR3ml8T8+taOpnus2HhcTvmAFaQROEt8
	+ogRxl5aFkZiByvBjJax1iFQKXHpklrmxb4IG38How==
X-Google-Smtp-Source: AGHT+IFVFIbx7DKNbft8CuPYlaXxcUAmVstIo+qHMKhRiCsnw92NpkwOTsKvZdeKecHBMfd8bUqpbw==
X-Received: by 2002:a05:600c:1c1f:b0:405:38d1:621 with SMTP id j31-20020a05600c1c1f00b0040538d10621mr18328348wms.3.1697023163815;
        Wed, 11 Oct 2023 04:19:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:23 -0700 (PDT)
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
Subject: [PATCH v1 10/13] dt-bindings: riscv: add Zihintntl ISA extension description
Date: Wed, 11 Oct 2023 13:14:35 +0200
Message-ID: <20231011111438.909552-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041927_070545_098825ED 
X-CRM114-Status: UNSURE (   8.54  )
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
bm93IGJlIHJlcG9ydGVkCnRocm91Z2ggaHdwcm9iZSBmb3IgdXNlcnNwYWNlIHVzYWdlLgoKWzFd
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMTNfd3NOOFltUmZIOFlXeXNGeVRYLURq
VGtDbkJkOWhqL3ZpZXcKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAppbmRleCA0YzkyMzgwMGQ3NTEuLjcwYzJiMDM1MTM1NyAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCkBAIC0yNDcsNiArMjQ3LDEyIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBU
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
