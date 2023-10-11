Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D52CD6E63
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWcRbNjvrLWous3Rd58CBPbQu+7qqpemwglF/fnSp2o=; b=CREeMHw70D+oAw
	go6ZdSMdiz9SUkhuHF2yb1ac8i+wTMEbtzkEgC+vR38LIfEbyr++cs/Zf+TaqqEaVMhnEnFkyqjZt
	z5zsFxqKAld7yQkAV0enEwJe73mYvBDGvcmDKrinvHMT4cQ99JVGp+d21yKqwQRui1RX1dhlxCTG2
	c4PfG/WDwWNr7ds+eDLulmpoEwdtSbDLxKXqdx7bOiUKaAFRqz6kgj0JB4vA8QfAqDegOKQqkhOzn
	iYBVC0z50uksSRg28+n5D8xYzgW4vRMUhT9Ay3MezfWGJr55sRB+f9XDU81TpI+SLgNNMH5BRidUi
	pWeeodRslVEFcxjPuyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYMF-00FqpR-25;
	Wed, 11 Oct 2023 12:30:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFR-00FjNH-05
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Oct 2023 11:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4tXTHfOF9l2oA3bnmaAaKSnwfTQRRdZhw8v+5/SMqC8=; b=nkw8OyXHZXoh1KqylJ6xZ5gQai
	DTrBWdfVI0XF1TKg3d28ZOSqKB5uoFJO8WZr2Ow74J4MBI6jtJMtc1tQLAPoukwfe8Emuh4wAuTpV
	oDVOFqZlDg01HZnGtqqHu3P9MOj4KdVPp3VLcUi0qCeGRtLmlwVjjS2rtWLFtG7cu+gXU2O5ZF07B
	7U4k4evNj3zIHCFWCrRLADKrfkzqklp11ozNHbDfplfc2MItKIHj0UMwXv3TS/XSjw0e4IMzXKef3
	n/+eXnAWsejMoFcTspKZmjIhID8v8N5LNkqYyjE9FwU4PrtgWIKxnBtZ3DvbAtXG8nV/D0P7vc9wP
	A7csCHPw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFL-000A25-1y
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-405e48d8e72so11541415e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023163; x=1697627963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tXTHfOF9l2oA3bnmaAaKSnwfTQRRdZhw8v+5/SMqC8=;
        b=yIJq7zbdu+xpOlI050ZJgu4WSVbOxNniLvKTKWKVRFOLUyOJaW2Ph1OmwHYMOEeWtF
         u0u+BkvsdgHgeu4glrlCxpDVFlOpIUY2ciHWffIWceq2YZR0tc4T6K4pKqfC4So7E4ri
         mrt9X8Zvbt4UdPbh+kL7DK+96+yumBaZNKYhS5WuepVuZ34j+axkwbibNR6FaIfdIdvp
         SkJMYzpTKOrRfE/URKxIIStTuR9w1x/5GkqGPMhSaF5+h26FjcUPIClKQ1bjJvqU2pDC
         ZQtaO6Hk/Xyi75RL57Sb7rh6NyiSGXBSxS49KDivj8xYy6cEmL/kjpPH2rTXFXgTw8zH
         RIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023163; x=1697627963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tXTHfOF9l2oA3bnmaAaKSnwfTQRRdZhw8v+5/SMqC8=;
        b=qJ3ciJTMak65HLwQXkdRG55m9T+GNOqBo1xVlFrFSXOccaRYCvHNtyFyVMHkyVsgnx
         7MEvJyU/rPuoDytAtRqdJM5kWWLD+lrUXUJKfduRFxwnCslPA4YEx1SOfMB3OO/4Gx34
         znzkWz95P8nNFCB+4eEPLVfIGJ48ILmY1n95O1gQpXD9nKDYx7UuBhlk8YnD3vys5hTb
         hE0oGfvzZ5Lds/emm0Rvrumo3D6pscGcqkiIRIG64Ja5OBUlqUkJHBExKiRDUQRiPTFD
         7C775HWc0X4ajkv9mfuPhLwPN+AzC3bbRQWnkwkzj5sBC5p2IUqXOSYtUso3+XTP7Wbt
         LW/g==
X-Gm-Message-State: AOJu0YyOVG3ysDjXOboO0A9Tc8rtZZLEjNQxQqPhf9gyuHjsPPIB2FU8
	6hE11mgiywGSkmzFcVB/kjrhNm+DnamIGkzK3MMCdQ==
X-Google-Smtp-Source: AGHT+IGArMLkH9j0nR6q6ZxQVwuBHeskjOjNvD5ZUnKc5yiKkdCwzXcWhurTv5ALmG1Vajfi3OEIlw==
X-Received: by 2002:a05:600c:3c96:b0:403:334:fb0d with SMTP id bg22-20020a05600c3c9600b004030334fb0dmr18654577wmb.4.1697023162835;
        Wed, 11 Oct 2023 04:19:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:22 -0700 (PDT)
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
Subject: [PATCH v1 09/13] riscv: hwprobe: export Zhintntl ISA extension
Date: Wed, 11 Oct 2023 13:14:34 +0200
Message-ID: <20231011111438.909552-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_121925_357079_53AB837C 
X-CRM114-Status: GOOD (  10.68  )
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

RXhwb3J0IFppaGludG50bCBleHRlbnNpb25bMV0gdGhyb3VnaCBod3Byb2JlLgoKWzFdIGh0dHBz
Oi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMTNfd3NOOFltUmZIOFlXeXNGeVRYLURqVGtDbkJk
OWhqL3ZpZXcKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgIHwgMyArKysK
IGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yv
a2VybmVsL3N5c19yaXNjdi5jICAgICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCBi
L0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggMDZmNDlhMDk1ZjE5Li5hNTc3
YjFkNzJkZmYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKKysr
IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTMxLDYgKzEzMSw5IEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9FWFRfWkZITUlOYDogVGhlIFpmaG1pbiBleHRlbnNpb24gdmVyc2lvbiAxLjAgaXMKICAgICAg
ICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwuCiAKKyAgKiA6
YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UTlRMYDogVGhlIFppaGludG50bCBleHRl
bnNpb24gdmVyc2lvbiAxLjAKKyAgICAgICBpcyBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUg
UklTQy1WIElTQSBtYW51YWwuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBF
UkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9u
IGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggYzkwMTZhYmYwOTllLi4zYzRhYTVkMDFmOTMgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNDcsNiArNDcsNyBAQCBzdHJ1Y3Qg
cmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVktUCQkoMSA8PCAy
MSkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pGSAkJKDEgPDwgMjIpCiAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aRkhNSU4JKDEgPDwgMjMpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JF
X0VYVF9aSUhJTlROVEwJKDEgPDwgMjQpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBF
UkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAw
KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19yaXNjdi5jCmluZGV4IGRhOTE2OTgxOTM0Yi4uY2ExNzgyOWYzZTE2IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfcmlzY3YuYwpAQCAtMTU2LDYgKzE1Niw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNh
X2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUNIRUNLX0lTQV9FWFQoWkJBKTsK
IAkJQ0hFQ0tfSVNBX0VYVChaQkIpOwogCQlDSEVDS19JU0FfRVhUKFpCUyk7CisJCUNIRUNLX0lT
QV9FWFQoWklISU5UTlRMKTsKIAogCQlpZiAoaGFzX3ZlY3RvcigpKSB7CiAJCQlDSEVDS19JU0Ff
RVhUKFpWQkIpOwotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
