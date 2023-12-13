Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D13C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouNKVyGzYCqMO9ZmRq5sN2s4FvlhTqmV6aCzYzKFA5g=; b=22M+DIDb3D2y9c
	VRkbam3yN3J541SOiIUpKWFTtIaVWTO1RT3s6FTiMhByxaf0W91MbNDM23AIVT3TR91gM+Ni/9a9v
	apbfjsCRoGP9B+FFze+qdSIgXHV6ILqeeZUzOS/oz7gN3zuLAxufYu9LsYRug1YEZ1UJ9hFMK/7jj
	WHZWbkqtlet/cgekZxr52NJ55SBlWYxigZhiySGeKX9OdgqZgJ/ngodwo9zJILgoZYwvgTn97uY/8
	GdjDSbRCT7SjAqwtJYvV7SDI0OqR34ztAPKoLmo2ohcUeseacVBlblmNxNvX+wIbzFSnJ9HmW7Oln
	U5D0EMtbla+ZAzziayNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUU-00ET9i-1K;
	Wed, 13 Dec 2023 11:33:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUP-00ET2M-0U
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c2d50c0adso12676075e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467196; x=1703071996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bstEpC4Wn7eojNR4ey8qLYKe/MWWQca3CdSgitFw4Fg=;
        b=V2s8ZDn+ZohUFotCRi0acdAAnFj0pVLSiOpTGcUIQ66orpDfb+W34iqJFkuqhDnzFD
         sWIGxq2p+/fA+YEkQkCuiVIkMJCILcXeUtStgITreYRroTSoQht80wFWb+P4XmyunIrC
         coYh2NmhK81yn7bG4ADivmnSzBB+ONQm3mqqEEoveQpoUyAlKdanGN0eCaYzVIR+ik8Z
         Ijqp8Ntoz3dVPSrpPvqPkvQuR963yak0XdM4/bu8YCbArokFCRdFAIjdQv4zPUVW5/Cj
         iadSny9tVG2+lYpPAPwUr43NtcathMUKbVgqs2nBV2x45O5v8SE5USUDLp+rjv8bmGgO
         8vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467196; x=1703071996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bstEpC4Wn7eojNR4ey8qLYKe/MWWQca3CdSgitFw4Fg=;
        b=Jo7jFW5mm030awcZ/bXNa0DMGq/zJzkpeb1GLvk4OOSo6Ve0ftk9804Dd79Qyi2E2o
         I2CMAlip2M10QKXQbLuLYT700TIzeVDCiHI5Ig6nFvRs975LQR2QOPP0bMIdspXdw5oC
         glgsJcOpl+J4ZEBb/vgrLRbMdc4EZS4t8fmTOenqhLmCxor5l49SiHlYkrxYEvzT5yPH
         +kPh1Aacb/ia1sLjFDDuiXs4h5EoI4b+OecTPfRaEDodbTzFdoa+vxbe1lQNYurBKJuW
         VnOu/QOfm5e8wgSegbZ+wMRU8R0utlXYUw3i/IStmxp8n/oCV8BjjXD1Z14xVnn9VXvs
         X+Ug==
X-Gm-Message-State: AOJu0YzICxYWmrCcnv7TROpOc9BNc+2bxh5cWwqojy6D2Qkv1Mr7BanX
	RTi4X8AG9igvdpytxlTIt20ifg==
X-Google-Smtp-Source: AGHT+IG2tOfMAS1pydsf4pPawIp50fPoX384Fx9efJpcAm8MmIokurwGuZwz8GEsZl7/fbAwTEX3Lg==
X-Received: by 2002:a05:600c:358c:b0:40b:5547:76a0 with SMTP id p12-20020a05600c358c00b0040b554776a0mr9797289wmq.0.1702467195152;
        Wed, 13 Dec 2023 03:33:15 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:14 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 3/9] dt-bindings: riscv: add Zam ISA extension description
Date: Wed, 13 Dec 2023 12:32:59 +0100
Message-ID: <20231213113308.133176-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033321_192721_23537D9F 
X-CRM114-Status: UNSURE (   8.74  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmFtIElTQSBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAppbmRleCAzNTc0YTBi
NzBiZTQuLjkxMmNjNmE0MmViNCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCkBAIC0xNzEsNiArMTcxLDExIEBA
IHByb3BlcnRpZXM6CiAgICAgICAgICAgICBtZW1vcnkgdHlwZXMgYXMgcmF0aWZpZWQgaW4gdGhl
IDIwMTkxMjEzIHZlcnNpb24gb2YgdGhlIHByaXZpbGVnZWQKICAgICAgICAgICAgIElTQSBzcGVj
aWZpY2F0aW9uLgogCisgICAgICAgIC0gY29uc3Q6IHphbQorICAgICAgICAgIGRlc2NyaXB0aW9u
OiB8CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmFtIGV4dGVuc2lvbiBmb3IgbWlzYWxpZ25l
ZCBhdG9taWNzIGlzIHN1cHBvcnRlZCBhcworICAgICAgICAgICAgcmF0aWZpZWQgaW4gdmVyc2lv
biAyMDE5MTIxMyBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KKwogICAgICAgICAtIGNvbnN0OiB6
YmEKICAgICAgICAgICBkZXNjcmlwdGlvbjogfAogICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpi
YSBiaXQtbWFuaXB1bGF0aW9uIGV4dGVuc2lvbiBmb3IgYWRkcmVzcyBnZW5lcmF0aW9uCi0tIAoy
LjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
