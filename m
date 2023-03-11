Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3637C74A5B
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JijcYy2T3DGD5AvCA8ZzPxFnPbu99vMJh6WQU/xsrgM=; b=RvxuZ5X7FlbDhH
	4I/iIBZsh5PJTBK+m+2wQWJNwkVtnuHItWrtmMlLE9tvVyW04Ps5MMtWDPbv2J8I3JFVFU7YHYO12
	VlWRGWnqqgOxQ9tIuCDAzM4FOHiQKcsGxtP8yUIihlMuP3oeiITrskqVyaA4b/10e01qyDg4sbKmM
	nBFZmXsQekYJcfKdgPXDDi1BmQYWPZPy3jJVLav3TF8tTnmkDQvgZr/wY+c8Z1pZ9xgpJiS16qGL1
	Y+s+fw974TZN531AjztO6Ogn07bwFxBBIN4qBfSLqXDDJJAJAv8FHuNML/ZIN03eQW+x6agvCCa5U
	gbAoaJTKErtFRqN4Od6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAJ-000El9-U8; Sat, 11 Mar 2023 11:13:31 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxA2-000EaT-Bm
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 11:13:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id ec29so30729581edb.6
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au7/yL1zYXB6rvSIYm06fKqV/NjBkMA3JzAdMmyQAvA=;
        b=XmqQxqtI03WcyyadnLOzT3XankDqi0o94vgWekai5pN10TUTNXpJG22qM9lKhC1aCs
         3AnM7FDQ2hqBZ2vgJI4I4bI1qHt4vIZ7KebWNYV/4y0ExT4HSjx4Hv+TtODAieHn9X+B
         THGjLaP9Vbs+Ze7T8gd/edgHrH5CUzGxuGUv/OXThpUHqgUM27cHLF/nVQtl3vZ8hjb3
         zuBZ2LLF4ih3ffhR8eus5Xje1uFb3AWLoc4eRmnBxKaK0gZShkcuuTbowjJb/Qa/hjWu
         gfSubhUU8uz7BWULWG9RppHcQYHp6nlwLJOG4NZKvp6pasl5CAtk83XCC2j22cbSJ3gY
         ITHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au7/yL1zYXB6rvSIYm06fKqV/NjBkMA3JzAdMmyQAvA=;
        b=EfjF24eOU0HYCLePUFVy7/xvLeYa6KLe4EYqFlOy0vHnX0biAqAk74/X15CVuvopUs
         VgjAslewmHCpPtPsrBTXj91K8Dhe4Cx0eNLiO3zna5ul0Uvuxy4NffD5oPmTl/GW6rEm
         mHyBjrNiSf8cq8wtNgBrWmRpMR3t0bXrs47GeFAdbtfo+e0UnKmf4n1lcsvOBgz6pUSv
         6v/6x4MePdv+uTFiJXLanl3TvfWOvvTGzfND55bpREWcaefgZABCveIzF9MAeXWDbt0p
         kPExu3OAmwSkLLbfxeTH5lbysyCvLeM7jc0Xdmto0q3aY4dqXk4sI1jkINppC9bliM4B
         m2uA==
X-Gm-Message-State: AO0yUKX1AXAgdq8mgH/TnpwE6F+J0SPmrRzpPMGxYOCiA8UV8ZRyiPLb
	I/3hctKQsmVdpCmSwiTEfZItFA==
X-Google-Smtp-Source: AK7set8iOl3WmX7WqLjnrxOQrqY8rpn1ZSUQAwX6L+oyJRwqyZmjK2u+y5kkGW9jsi6G9CtnL0hTrw==
X-Received: by 2002:a17:906:a4b:b0:88a:cbd1:e663 with SMTP id x11-20020a1709060a4b00b0088acbd1e663mr25443626ejf.6.1678533191998;
        Sat, 11 Mar 2023 03:13:11 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:11 -0800 (PST)
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
Subject: [PATCH 3/8] gpio: rcar: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:13:02 +0100
Message-Id: <20230311111307.251123-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031314_430372_9B25A247 
X-CRM114-Status: GOOD (  14.22  )
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
Z3Bpby1yY2FyLmM6NDM1OjM0OiBlcnJvcjog4oCYZ3Bpb19yY2FyX29mX3RhYmxl4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9ncGlvL2dwaW8tcmNhci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlv
L2dwaW8tcmNhci5jIGIvZHJpdmVycy9ncGlvL2dwaW8tcmNhci5jCmluZGV4IDViMTE3ZjNiZDMy
Mi4uMjUyNWFkYjUyZjRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1yY2FyLmMKKysr
IGIvZHJpdmVycy9ncGlvL2dwaW8tcmNhci5jCkBAIC02NjMsNyArNjYzLDcgQEAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZ3Bpb19yY2FyX2RldmljZV9kcml2ZXIgPSB7CiAJLmRyaXZl
cgkJPSB7CiAJCS5uYW1lCT0gImdwaW9fcmNhciIsCiAJCS5wbSAgICAgPSAmZ3Bpb19yY2FyX3Bt
X29wcywKLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKGdwaW9fcmNhcl9vZl90YWJs
ZSksCisJCS5vZl9tYXRjaF90YWJsZSA9IGdwaW9fcmNhcl9vZl90YWJsZSwKIAl9CiB9OwogCi0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
