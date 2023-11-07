Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3339BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XriHi/rc7q6NxisWG8V73VMcvGDvo28qbKo0NpV7hlQ=; b=dBKWjFZm6IhLdo
	5VomiCwi9AOaKem+gg4zq654UL+Sfe34PXagLCaZQw5Sd0cE7QNDofQE3tZCcU4fJkYa2KuEEJ9e2
	SxCIAapM3W7InptjL/cdvcESanPsecOdwiJT+nPfb/J02v7NP604OigyoYRxmxGGaxAsGincAeL1S
	D+54EbnZuimZVQCuT0zReRkCYkz6IvfDBmTC9tKiCVfVdjwxL7kvExKCcP0HSfZSG0hpRXiSyfZ8I
	4Pi3TTVqQBheTpUrd0kmvkqGske7KGJXJvaE1eQv0UIEe85NiwEi63ce8dY/56NtkuwM0UKCccjUu
	eaN91d7p3Sp9WQmkh91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkx-0019Sp-1p;
	Tue, 07 Nov 2023 10:56:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jko-0019Dj-0F
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32f831087c6so1250718f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354575; x=1699959375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJyd1YBcb+U2PBneGSdwCeFg8Fe7xoja8XAVvgGr8QM=;
        b=Ct+8iY+ilorh0EPiZIZ6kUcpfaNuPK0zbYNtOwm9zgYEMzsot2Rd/mbiQHi1Nworgr
         VdH49F3GL1oxVV5fvMlW+3DUBzh8IJTyAFWLlr0TOtXj+kHaqney4J50wvSBmoMHFoXz
         HFnx6HD6iBKmBLZA/RnNtDHooPG1xIWN2XwzltJ9Xyvoue7E5z2dqABEOa5N8U6hJMDm
         WknFlaibzIA1r26QaT5BuKJegKKWuDLUVYh4H7Cl9ecoM7ikFyye3hK84WRfl7Jp/Op/
         AJSq1iqnUp1HRjj3u7n5JEr4YTFYvox8LGS4fK2F75qqkw693NQoVbWfcm40biOpFRoy
         3yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354575; x=1699959375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJyd1YBcb+U2PBneGSdwCeFg8Fe7xoja8XAVvgGr8QM=;
        b=sw+uIWaJuw9RJIP7SdR9fgtx/qM6SVLBuYIAKCvGBjlPE77yq73Vqq4BOalVBgybCm
         1CRt84iWkI6jFH66U2n8CEG8J3AXfWsfY2NosBKUO4CYJbIj34PhYy4BsmqpDIXHkbPx
         C+05nlKp+JWBbSZgzdCWAhX7ZOdXF0Q/BjyhdEaEOe6JZ4Gk/m1Ckwm04qI+9/LZ8ymg
         3LQeQg1g5NJIBjIQpQAuZfB+08QeZaFvcp/xnOJ9jp1+qo9O+FANn2X3MpYNODe+WF0v
         c/oCWJLERepO8A/Uy7O0chrndtj5pkiMdrGwTs0efds8J14izxzhJDIcGfsAIj9eY7lG
         rNdA==
X-Gm-Message-State: AOJu0Ywea+ySexzMUGCjHuGhJl3VhbsmnwawiF8KAYfDNZwmbk0zK9vx
	03fjTxSPmUNiwIHgZCGte+1aoAYcfnKlKs346FnIEg==
X-Google-Smtp-Source: AGHT+IFwqzEm1CRJc3Tvln28fqzLrx5PcA3gU0DPHRFsH47EQLrWlkSUXHW5cbEtNQ1KO6g6dWi35Q==
X-Received: by 2002:a05:600c:35d6:b0:404:7606:a871 with SMTP id r22-20020a05600c35d600b004047606a871mr24942179wmq.2.1699354574695;
        Tue, 07 Nov 2023 02:56:14 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:14 -0800 (PST)
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
Subject: [PATCH v3 12/20] riscv: add ISA extension parsing for Zihintntl
Date: Tue,  7 Nov 2023 11:55:48 +0100
Message-ID: <20231107105556.517187-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025618_158372_41C85F07 
X-CRM114-Status: UNSURE (   9.75  )
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

QWRkIHBhcnNpbmcgZm9yIFppaGludG50bCBJU0EgZXh0ZW5zaW9uWzFdIHRoYXQgd2FzIHJhdGlm
aWVkIGluIGNvbW1pdAowZGM5MWY1ICgiWmloaW50bnRsIGlzIHJhdGlmaWVkIikgb2YgcmlzY3Yt
aXNhLW1hbnVhbFsyXS4KCkxpbms6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMTNf
d3NOOFltUmZIOFlXeXNGeVRYLURqVGtDbkJkOWhqL3ZpZXcgWzFdCkxpbms6IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL2NvbW1pdC8wZGM5MWY1MDVlNmQgWzJdClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3
ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aAppbmRleCAxMGViZDM2ZjY3ZTAuLjViNTdiMjRkYjYwYyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aApAQCAtODMsNiArODMsNyBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1QJCTY1CiAjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWkZICQk2NgogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pGSE1JTgkJ
NjcKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUhJTlROVEwJCTY4CiAKICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9NQVgJCTEyOAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX0lOVkFMSUQJCVUzMl9NQVgK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCA3YzA0YzAzZTQzNWYuLmJhYThlZGZiMGU2YSAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjU4LDYgKzI1OCw3IEBAIGNvbnN0IHN0cnVjdCByaXNj
dl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHppY29uZCwgUklTQ1ZfSVNBX0VYVF9aSUNPTkQpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpp
Y3NyLCBSSVNDVl9JU0FfRVhUX1pJQ1NSKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWZlbmNl
aSwgUklTQ1ZfSVNBX0VYVF9aSUZFTkNFSSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50
bnRsLCBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlo
aW50cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHppaHBtLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
ZmgsIFJJU0NWX0lTQV9FWFRfWkZIKSwKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
