Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF8FC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEHwD5AlZJZAQg7vcrnoDr0spFrU9VM70hGhBESyMWw=; b=UTL75hvslzsnjB
	qdOpqZWCHizTNgIF6d3GiUneN5JHmm6DMYRJnSrPowpDTgzmrFR/ffYhWWPVsauC+oT59W1owgAI5
	8ngiqT6LEktu5ctkUqu1aBJ4ZCVJ8+BUdvz09SwoZarE468uLTMlJ93dCK2orD6vZy/RAbFipHXNn
	m3C4zfVY3jfAr1BFHTqsEm1aC6TTbXpCh0eLxSSW2946hNXIdGCtUj+wqd6lDsB5GhmPyWI5Pt4xC
	XMqRD3VY9RqDOeJQRsaQoENHy62OxqoA9w0GLqAcVmJ51U70JVo7qp1Qvz3+jnarotugYdz+kUvdU
	xH5sUtx/NYtJUssltoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAs-000F6H-NE; Sat, 11 Mar 2023 11:14:06 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxA4-000EcT-OZ
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 11:13:19 +0000
Received: by mail-ed1-x535.google.com with SMTP id ec29so30729803edb.6
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC9LP4Mz3ZehLFvi2CSx22bsql7JNCcQ0viTq1wmSCc=;
        b=O4S33oHNUCZoaXa1/QENkscGWzkVC5vXemfIKwaGTgV94h9Skey96TbQiRRLkCDmBP
         xRoabFrs2wASqubivqfcgL4ZsVoG/abE12Fgx86eMPRytCmEtI0Dp3mts5s+NnTbS3TN
         SnhU523+D2+a25wrW3xsy+knBpl6l8eDUY1F36c6Nr61tOouSC7iBtl5356TiCC76BG+
         ZTBnnJcXcdo2WoHDxL9iyQG0JeMNpnfRQdaCCxfJtjgiy5o6xNvnGPWAdzuk5Ui44u5U
         zQyFJXKE4jtrQ8KFv9mpx2N0fNcURBaoMTVMTLkTAeIXssbN8Zs+Zqpu48Oc/p5fkBc4
         sC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC9LP4Mz3ZehLFvi2CSx22bsql7JNCcQ0viTq1wmSCc=;
        b=EqzpxL35JjZA3TYz8/TaoyEtZjFj/b356mG6RpQP+t2t/hBt7jv5iEIQIzoHvilxcw
         d35J+gV6KQYL4cdh9BuN5lBntJHCvmHxaKZ+Ugc1URQDzYaI91y+s39YXWV6VK0dOBZP
         XbwTwUAujuAegJhJjIjytITrXhrqIxGS+AYO3kUKTvGyCdlwvlbk9mNb96gfdnL9eb32
         ikXmstGifnZf5TGcJ1T94IHrTrrtD5Ss6J9etxOPoc/337TEz8ebbq9jD7/761N77EGc
         /Oj7df4MZEHtC6omuRKD+VmHUclxgVT/E/q4LDApz4NzQ+wnQXnQQacWeAFBaqaNLSCC
         sD8w==
X-Gm-Message-State: AO0yUKX9B/HqNsUB7ZicEcmmeFlrtlXzg1eJKX9G2HZVZY047wcCK1MN
	kv/fPcdG5j30Fq+c6QX2vGiqbQ==
X-Google-Smtp-Source: AK7set8NY+cOflW1Wg/2w/XINECjCWqtchHoBTmqix4SLXg+4znExK1iEYJu1Qx4UfVb7s6bex1nUg==
X-Received: by 2002:a17:906:4f94:b0:8ed:e8d6:42c4 with SMTP id o20-20020a1709064f9400b008ede8d642c4mr27839053eju.12.1678533194223;
        Sat, 11 Mar 2023 03:13:14 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Nandor Han <nandor.han@ge.com>,
	Semi Malinen <semi.malinen@ge.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/8] gpio: sifive: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:13:04 +0100
Message-Id: <20230311111307.251123-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031316_875712_607061C7 
X-CRM114-Status: GOOD (  14.12  )
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

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL2dwaW8v
Z3Bpby1zaWZpdmUuYzoyNjM6MzQ6IGVycm9yOiDigJhzaWZpdmVfZ3Bpb19tYXRjaOKAmSBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXNpZml2ZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cGlvL2dwaW8tc2lmaXZlLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYwppbmRleCBiYzU2
NjBmNjFjNTcuLjk4OTM5Y2Q0YTcxZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tc2lm
aXZlLmMKKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMKQEAgLTI3MCw3ICsyNzAsNyBA
QCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzaWZpdmVfZ3Bpb19kcml2ZXIgPSB7CiAJ
LnByb2JlCQk9IHNpZml2ZV9ncGlvX3Byb2JlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCT0gInNp
Zml2ZV9ncGlvIiwKLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHNpZml2ZV9ncGlv
X21hdGNoKSwKKwkJLm9mX21hdGNoX3RhYmxlID0gc2lmaXZlX2dwaW9fbWF0Y2gsCiAJfSwKIH07
CiBidWlsdGluX3BsYXRmb3JtX2RyaXZlcihzaWZpdmVfZ3Bpb19kcml2ZXIpCi0tIAoyLjM0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
