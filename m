Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C119DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wtnv6HVlahh8u9qCDa7VCD4rClx1jZWDZ6dA7nMfuw4=; b=Wpeqs54fVwHjHO
	LIOZzhDE6GKPz2W3o2kzK/87snZDAtLP8hmDKq1LCr2l9kowHotSejhNNShjONsfmn8NyDIl4JOSb
	kTglYs8P97ubuc8r+0k9B8gUa5r50+l8YTLk3GOcFShOkVlkMndz/wVZ7D+6TPTnzXiZ4GXVBpFIa
	PPmqQK2fUPFDqmVS3mVl4h5Fp2FncrbQBWOsxn5PRJwb3d2yAFQV5a8qCa0uUB6m+3S5/vnZfVKFK
	bb1S8EEIrokUA7WvDgXD/neV8jYQzchmJllagIOhnrf9nIj58kLAglzmgTOTsaemsIFefCH6WKbv6
	Q74lp71DDqq4xTagPIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUowx-00Fy42-15; Thu, 17 Mar 2022 12:09:51 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolQ-00FsvW-Bb
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:58 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9BB583F5F4
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518271;
 bh=9NVaJhFyk/7XIToYVXJ7m5aI93pLstb15hWUEyZBYi8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=BVA3CyFnW+aYsuzhQzooLGLNnxqljgchgIRMSoMtA4bCJfAfbMnLJ3OC+WfYn+p9f
 n6Q9QjPzKaInRhlJ2+PaocDb/SKtZ+FWgQkCpRE/oPRwtIJDiagBqQXLLLeuaJ7l2c
 hx0+fUao1+lUEbDEOdLdPkT2Bnsntdgglvq/rEYZLtJTaub1dMj+jd5wFVfdByncRv
 I6CMQ7iCVjYX5ohPJCV3CSW1VeJo/Rm+6R4uLETP8Tcfsj/jvo9yesygPY/qUGywoL
 wdF50+LGlm+qZTSUTjjDe1hxp2kQz7NBVfjT7leyc5q7mG3pzkHBX7ijB4Oote8lOD
 H0eXRvOE9pm6g==
Received: by mail-wr1-f70.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so1493702wra.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NVaJhFyk/7XIToYVXJ7m5aI93pLstb15hWUEyZBYi8=;
 b=Wmuf38s4vNuVUKtIaocn3MFPw2e5UMT80QTwKtH9TY9vm5RkubRelStyucwOGnTQKH
 b88bYvD4e0ATX0iJ3Pl7hlg3wvWn+cKeRyQLo9zB/DCrbGz1cWqG0mtMQqpnmpysYxgb
 rc8WwGWsyj1v7ICtwnh3h7vbcz4vzKPRhyNRs58l3XjGuJeIGZLqgU7PJVvD5FGfsD0h
 Qhu3wpYQz3cQy5DLwH/ctEji3V0qOQ+Gi+L5JB2XS+Eo4l0vqX+R+S4cN7W1ZsO8ZrQH
 sLOyLIsb8sU/gcPzVysxlPLCktUojYpFHvOZfYXjAeKnxfuMqLHHtchdz+erTJ8qzMTK
 cZsA==
X-Gm-Message-State: AOAM5301tJzQOS8Qiwduk4LLS0BVO+46/SZPkxRIpiG5TYrVSKJAU6pX
 /nNhMvB1pSNoAX52svktJm3AchjB3Qu6s3Sh6H0kxInlEClfjK8NkujHbCkhRrWlZFfIzFmoEGQ
 XOEiEy0ry9lFyJ299CsUOUUD2AMLX5aSjnD/lHT+Hr2ECPw==
X-Received: by 2002:a05:6000:156f:b0:1f1:f99e:779e with SMTP id
 15-20020a056000156f00b001f1f99e779emr3699046wrz.99.1647518266481; 
 Thu, 17 Mar 2022 04:57:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymVAcTeO15IweAkScwvNQ6HG8sMEO3vGt45XqrwFfDK9yidy0suv6zYu7bE0rR0hIs55pTgQ==
X-Received: by 2002:a05:6000:156f:b0:1f1:f99e:779e with SMTP id
 15-20020a056000156f00b001f1f99e779emr3699013wrz.99.1647518266228; 
 Thu, 17 Mar 2022 04:57:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 14/18] dt-bindings: irqchip: nuvoton,
 wpcm450-aic: include generic schema
Date: Thu, 17 Mar 2022 12:57:01 +0100
Message-Id: <20220317115705.450427-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045756_628112_45C79DDC 
X-CRM114-Status: GOOD (  10.70  )
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

SW5jbHVkZSBnZW5lcmljIGludGVycnVwdC1jb250cm9sbGVyLnlhbWwgc2NoZW1hLCB3aGljaCBl
bmZvcmNlcyBub2RlCm5hbWluZyBhbmQgb3RoZXIgZ2VuZXJpYyBwcm9wZXJ0aWVzLgoKU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmlj
YWwuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9udXZvdG9uLHdw
Y200NTAtYWljLnlhbWwgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL251dm90b24sd3BjbTQ1MC1haWMueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9u
dXZvdG9uLHdwY200NTAtYWljLnlhbWwKaW5kZXggOWNlNjgwNGJkYjk5Li4yODVjMjBkZTA5NjIg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9udXZvdG9uLHdwY200NTAtYWljLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL251dm90b24sd3BjbTQ1MC1h
aWMueWFtbApAQCAtOSw2ICs5LDkgQEAgdGl0bGU6IE51dm90b24gV1BDTTQ1MCBBZHZhbmNlZCBJ
bnRlcnJ1cHQgQ29udHJvbGxlciBiaW5kaW5ncwogbWFpbnRhaW5lcnM6CiAgIC0gSm9uYXRoYW4g
TmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KIAorYWxsT2Y6CisgIC0gJHJlZjog
L3NjaGVtYXMvaW50ZXJydXB0LWNvbnRyb2xsZXIueWFtbCMKKwogcHJvcGVydGllczoKICAgJyNp
bnRlcnJ1cHQtY2VsbHMnOgogICAgIGNvbnN0OiAyCkBAIC0yMSwxNCArMjQsMTQgQEAgcHJvcGVy
dGllczoKICAgcmVnOgogICAgIG1heEl0ZW1zOiAxCiAKLWFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQotCiByZXF1aXJlZDoKICAgLSAnI2ludGVycnVwdC1jZWxscycKICAgLSBjb21wYXRpYmxl
CiAgIC0gcmVnCiAgIC0gaW50ZXJydXB0LWNvbnRyb2xsZXIKIAordW5ldmFsdWF0ZWRQcm9wZXJ0
aWVzOiBmYWxzZQorCiBleGFtcGxlczoKICAgLSB8CiAgICAgYWljOiBpbnRlcnJ1cHQtY29udHJv
bGxlckBiODAwMjAwMCB7Ci0tIAoyLjMyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
