Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3420CE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ixVTd5UjyQ71edUTUfTBuHwIRwRzWU38zS+gw4ufWQ=; b=p+BWsGA6hkB5yD
	SCnZexIRlOUvuSewLryWUcw25bNzqK3XNjz/e2g/GovzMvlFz8HknKTCuTihgFwYV7dxgOLmINXvc
	uP1CFkhVaVjldtbPmoE2KfZc0p3rR0OapJzctmsmJlHFH5mfKH4qpwlf2GW07js76Un8n42K4bGh/
	5VCBEvjQxuOAdMN5KLLoaU+LNNRy/+zJKZusIO8wFzVGAA3dJKO6BH7PvIuOwybd8/xvD1RTT28b2
	jdO2wGoOXHQv6+3WWb8L+mI3zAYJdewLzVZgeyt5ciNJ4WyGXdEdCk1O8TeeHViGMo6VRqRF1lbVg
	y6kEtl7JQ431Vp8Hebkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk4X7-00B8bJ-0c;
	Sat, 23 Sep 2023 15:27:01 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk4X4-00B8av-1O
	for linux-riscv@lists.infradead.org;
	Sat, 23 Sep 2023 15:26:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso465233466b.2
        for <linux-riscv@lists.infradead.org>; Sat, 23 Sep 2023 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1695482815; x=1696087615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=su6WYbPXHqLnNDFrNX/cj9aw9V1j7eGBIGjhoDpKtWE=;
        b=kGQKIDv8pqpu6w6zAny15jEjoqyCIjBaX2Rmptc30P3Kt2G0s6TSkuNHNT0/vU8Bws
         MDLpot5J7nbGPwdTlQYQespj5Wop/XeBkIQ8NgI3c74wEsOIPCZcN595MioMAFQlPAwl
         vrPg6Fx/qAeCSOsE/PEDwKY3820b0n9kJ0DqP+WDhja3GzBzyPzPIVWhkGcWz2zSdgZk
         teS/n0tb5Cw+R3g+uZFkbMhoOsgXQAIWLENjyKfKKVPwVBQktRwOB9a1RAXUKPK79Xzs
         Q6vi060PKVVdBg92drwRMc9Q3j9QEQ8QTF27DfKj93DeGhDdZJOdKEbMLmwcrJT//d0Z
         jNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695482815; x=1696087615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=su6WYbPXHqLnNDFrNX/cj9aw9V1j7eGBIGjhoDpKtWE=;
        b=FOX3uqTJCA6UamJVZfpLCu0D5ACkmyyVdDY+gbDoUB0MfE5Rv6dBnSnDWr4o+aRwSh
         XZTwut35/bAkUXWo3t3E+hagzPNdw7DkZ/g9IwA6uCa0L29OWdDJyhIq3N6W/RxxLMpE
         hOk2vBYdm4je3P37D760vxSaDgSXMshcyScX4TQyWceC9Meci/sxgTJ9cXf/OaBBNQ2M
         6YiKA9D/Gq67mwcKds7Hp1HlM2KdhP3F7lZhliFP0rQ9p1/jlFxR38j9ZJFsKD5dxh0c
         kJae4bV2tvZYgGrHX0Ey9t5J4EbrWbGZXDPFYqm/hyOx8pTHpa89ME8kFqUQtRTKEWG6
         Xdag==
X-Gm-Message-State: AOJu0YzESCZ2bmSaxpXAXSy85hvBDMzpVmuJZUNQioiWZ0VdMJRYaRlu
	x2Y75ll6ifNoJbcPYgHa0xDi
X-Google-Smtp-Source: AGHT+IFoH2k1RhzmFyq3NWLYhDgDBjvsmXXcDn6IrBtEaB5273OwXVlXds6aaSc1IEDF0vwczySL9w==
X-Received: by 2002:a17:906:328a:b0:9ae:284:c93d with SMTP id 10-20020a170906328a00b009ae0284c93dmr1941980ejw.5.1695482815280;
        Sat, 23 Sep 2023 08:26:55 -0700 (PDT)
Received: from localhost (ip-005-147-049-011.um06.pools.vodafone-ip.de. [5.147.49.11])
        by smtp.gmail.com with UTF8SMTPSA id sa21-20020a170906edb500b009add084a00csm4007325ejb.36.2023.09.23.08.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 08:26:54 -0700 (PDT)
From: Daniel Maslowski <cyrevolt@googlemail.com>
X-Google-Original-From: Daniel Maslowski <cyrevolt@gmail.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Daniel Maslowski <cyrevolt@gmail.com>
Subject: [PATCH] riscv: dts: starfive: Add VisionFive 2 PHY supplies
Date: Sat, 23 Sep 2023 17:26:53 +0200
Message-Id: <20230923152653.3371216-1-cyrevolt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_082658_492237_8EEEA3C5 
X-CRM114-Status: UNSURE (   9.97  )
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

SSBjaGVja2VkIHRoZSBzY2hlbWF0aWNzIHRvIHNlZSB3aGF0IHBvd2VyIHN1cHBsaWVzIGFyZSBu
ZWVkZWQuClRoaXMgYWxsb3dzIGZvciB1c2luZyBldGhlcm5ldCB3aXRob3V0IG90aGVyIGRyaXZl
cnMgZW5hYmxlZAp0aGF0IHdvdWxkIGNvaW5jaWRlbnRhbGx5IGVuYWJsZSB0aGUgc2FtZSBwb3dl
ciBzdXBwbHkuIOKaoQoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIE1hc2xvd3NraSA8Y3lyZXZvbHRA
Z21haWwuY29tPgotLS0KIC4uLi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlz
aW9uZml2ZS0yLXYxLjNiLmR0cyAgICB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1z
dGFyZml2ZS12aXNpb25maXZlLTItdjEuM2IuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFy
Zml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjNiLmR0cwppbmRleCBkNGVhNGEy
YzBiOWIuLmJjMWFjMTJiYzcxYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFy
Zml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjNiLmR0cworKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuM2Iu
ZHRzCkBAIC0xNiwxMiArMTYsMTQgQEAgJmdtYWMwIHsKIAlzdGFyZml2ZSx0eC11c2UtcmdtaWkt
Y2xrOwogCWFzc2lnbmVkLWNsb2NrcyA9IDwmYW9uY3JnIEpINzExMF9BT05DTEtfR01BQzBfVFg+
OwogCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmFvbmNyZyBKSDcxMTBfQU9OQ0xLX0dNQUMw
X1JNSUlfUlRYPjsKKwlwaHktc3VwcGx5ID0gPCZ2Y2NfM3YzPjsKIH07CiAKICZnbWFjMSB7CiAJ
c3RhcmZpdmUsdHgtdXNlLXJnbWlpLWNsazsKIAlhc3NpZ25lZC1jbG9ja3MgPSA8JnN5c2NyZyBK
SDcxMTBfU1lTQ0xLX0dNQUMxX1RYPjsKIAlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZzeXNj
cmcgSkg3MTEwX1NZU0NMS19HTUFDMV9STUlJX1JUWD47CisJcGh5LXN1cHBseSA9IDwmdmNjXzN2
Mz47CiB9OwogCiAmcGh5MCB7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
