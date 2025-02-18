Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F83C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOI98iMj326GNl4ms59NN+kYcuQo/21xqZqtIsTBJO4=; b=af0RcF6mnWcNze
	zWHssKTkyRftIyCCdGFGzpc4Y+83dSmLesChGrJxKVwE7N98uGboT826VjDoPVtyrKqlAF51fGuJO
	Y2zLJOYC1+1xYGixxWSlrhvrL7UVUmI6VfUcbS6EKIPefY4Men1YMKAaWoE9j6DiwwaSAN1b2ZNZF
	5A8cSClJy6jkkBurWEM96Ud3DLH4M3gc6MLVHnK/vVGGhnpFhYsUBuwHIg98C3xbwU6G91HTDENaV
	qbLD8rA8pKriOSpYFLgza98Dw64PXee/g86F2hsO9C41zs1S737UuYawPb8Bdtpwljr055in1Bf1z
	6N78pYad2zxWWgdmxcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTx1-00000009iEG-1fPd;
	Tue, 18 Feb 2025 20:12:15 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIy-00000009aC8-0oNL
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:53 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5de3c29ebaeso8164309a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907051; x=1740511851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2IJA96cn2epCMiVThMTa+CHJ1H46iDl1Xl8KOw8NEU=;
        b=ZO5cSFtFK7xy/0fAXFlHnnPXESJkFXR9IMjnaAYyk5FPRCGKSwdHBWuwBV7OqYsZtD
         Ictcv3m+LaYCPBl7LWChUZXmzo7phTqUNzNZj7+E+cXKtuPlYhOuIIFUZlM3msaaOfDi
         7gZDGUKJTTPVUnduNxHrPPLS4szX1LixKI6iUkFgdVrCiLrJdHCMyRSha4G5Umiqtlq/
         Xs88hK9ZxY0wWwljKMbGXBI99vhPQNdTX7QX00k7I87iTATLJehJ82bltZdvu8NQXgc7
         Dov8IA9eXAoAJPUF8X5lPz+jq/UieQU7JL3jVmwVxmnRK3E1zcTYbSLnz94Vhq9JticK
         E2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907051; x=1740511851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2IJA96cn2epCMiVThMTa+CHJ1H46iDl1Xl8KOw8NEU=;
        b=uXi/BHcSG3ANZpmlyGKsjVCgkYyy6LOBgeFd/5GJW6oL31zuMSZtm0zgLfXu6KpSIc
         qyzKtQbrddei4N1096HLhjJ6kEGVae9i5EqXE1aUEkVuUolz7JU+blxL194CCr3WCoxi
         8RvNvn7MBBO02NWbBQIFa/tIfLFLGgfo8VbBFbjQAVLItlqbTEh3XXprnkDBHz486QSR
         Cx7KTQXNPx+hsZ75jRSU7AKdPxpGgDaYuOTb+IqeoFD13Q+fVoyx/8oUGXVI8wlpNTbb
         RNS9OHQvut8ICXTHGIb+66KAGVVD75DroCDxq3J/UucFE5Yy3XyC2uknwSlGn4OvMdnF
         PJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVyZYMRUKChAQtXeihE92G7LqM2xT7MOw4AOTj2NNRxkW+rCdoha3EIxB0embukzYCYjAEVtwqy85ndMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7GrNXITbZyUTu+hGKcA5yEOPR4yVh0YOToHlWW0dvUysCFcwp
	i21NX4ByrzQe0T+cTi1Bdokw641wWXyEE9zdwM7bNKzW6+D/QQzeDVAv7xsrmnE=
X-Gm-Gg: ASbGncsHfpEoa3+umTVzmooOBq7J7fQga1erQL48Ri15kR0SstutR1sK86MEz6Hz4Lz
	CI1ogj98L16DcOTybsvE5noFb8UfqaliTr4qGDnEGpmQ9w+FAmmYtZuMqc/Vli18gvtk6bARPYh
	btDp8hT6upHB78SeZNF7Xih+HEfmaQyhCbgijIXxc68E7VtUdmlekLylTSq2dVHBzqire+++70P
	VR4Q6oE4aKP/iRHB0XSPBgcUU5hXSmma/rg3ZCxxkTNby0NmVHVnmoCaU9Rmxa4DRYvZmBLrTJv
	XdxPb8uErX0DbwlqDjK57EUoLdp5
X-Google-Smtp-Source: AGHT+IHXtRDavoFEuaxpZTZMT0EqHfm1KbVfaahxr8Qdj+LPqSMJy9KjmSUTGyYJHs3yvBW2gyEYug==
X-Received: by 2002:a05:6402:1ec8:b0:5e0:69b3:441c with SMTP id 4fb4d7f45d1cf-5e069b34491mr6798656a12.26.1739907050796;
        Tue, 18 Feb 2025 11:30:50 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:51 +0100
Subject: [PATCH v4 6/8] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
MIME-Version: 1.0
Message-Id: <20250218-aux-device-create-helper-v4-6-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ay58eJ7ot5/ul3WJ0A2vWFebi7iz9JDlKKz/MQBcPk0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/UNRwYRSxCacN/wjpG+gTD5T1KG1hcBQsMM
 QnDuvUYONiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf1AAKCRDm/A8cN/La
 hWCyEACe+SnGCN6YdYLKgHmg2tCmpB+scSaVfptOtiiCaNmkm2ceymUua+hl4HQuc+cggoymEAI
 NRoyFjvpDwxEsenxo50indBSo4J+xKz/BxfWgchbJ5jBN98rcIbG8qbRJoK6bofmL8VieWY/C9n
 QziuMeen3+L6VIqwheLwS89czpdFIbtEchmvyO7447kPZT/f9tcqTtHyZZQ9ZWmUEPqyytQH3g1
 FXnb/QkITd2cOjX8fiWKCwqHnHuZZioCk73ybWlnXFChDFTJO1C/Kubw+Ku8ou5Oi1eNm5DpAKD
 AnhlKqHvcd9jAybx2STZQG34ILyCq0PGKCqdShGQNi3dEiokHFL3C08wZwHaieTJgG/BRqHDLxd
 +zWCAJ1BPN4sHUG0VUhEU1N3y5PLQTlN+fqW1PfZs66fZF3RWN2m6IST2cjtFQqOp9qEe9VL2m9
 h+b2UEflNPJZnzrxvGsMYOa1GOe3xEDN35bjBbnpOKh+SqsEnFVFvC/O08+02k2pGEvuCJgPAjN
 cmFW/PiIsKprUWk5c8WAdIAGfcL4OPNoHW/au92eXmWfXnZY45TkkT8Hkk2hgbQosUEC1eOtFKf
 MF1kq+BTKv4twjueAZWSPLgmQ+t+yWBdXZDVBktP2ocMRM8KOEqTeFZuMEw7Sebi/SXGVa4YK25
 DPOtNJY5VIKPj0g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113052_248780_0412C6DC 
X-CRM114-Status: GOOD (  13.19  )
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

RnJvbTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KCk91ciBwYXJlbnQg
ZHJpdmVyIChjbGstZXllcSkgbm93IGRvZXMgdGhlCglkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9k
ZXYoZGV2LCBkZXYtPnBhcmVudCkKY2FsbCB0aHJvdWdoIHRoZSBuZXdseSBpbnRyb2R1Y2VkIGRl
dm1fYXV4aWxpYXJ5X2RldmljZV9jcmVhdGUoKSBoZWxwZXIuCgpEb2luZyBpdCBhZ2FpbiBpbiB0
aGUgcmVzZXQtZXllcSBwcm9iZSB3b3VsZCBiZSByZWR1bmRhbnQuCkRyb3AgYm90aCB0aGUgV0FS
Tl9PTigpIGFuZCB0aGUgZGV2aWNlX3NldF9vZl9ub2RlX2Zyb21fZGV2KCkgY2FsbC4KQWxzbyBm
aXggdGhlIGZvbGxvd2luZyBjb21tZW50IHRoYXQgdGFsa3MgYWJvdXQgIm91ciBuZXdmb3VuZCBP
RiBub2RlIi4KClNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxp
bi5jb20+ClNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29t
PgotLS0KIGRyaXZlcnMvcmVzZXQvcmVzZXQtZXllcS5jIHwgMTMgKystLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9yZXNldC9yZXNldC1leWVxLmMgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LWV5ZXEu
YwppbmRleCAwMmQ1MDA0MTA0OGI0MjkyMWUzZTUxMTE0OGNkMjlmMjE1YjVmYzVlLi44MDE4ZmE4
OTU0MjdiYjFlNTFlYTIzYjk5ODAzZGM3ZmU2MTA4NDIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Jl
c2V0L3Jlc2V0LWV5ZXEuYworKysgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LWV5ZXEuYwpAQCAtNDIw
LDE3ICs0MjAsOCBAQCBzdGF0aWMgaW50IGVxcl9wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2Rldmlj
ZSAqYWRldiwKIAlpbnQgcmV0OwogCiAJLyoKLQkgKiBXZSBhcmUgYW4gYXV4aWxpYXJ5IGRldmlj
ZSBvZiBjbGstZXllcS4gV2UgZG8gbm90IGhhdmUgYW4gT0Ygbm9kZSBieQotCSAqIGRlZmF1bHQ7
IGxldCdzIHJldXNlIG91ciBwYXJlbnQncyBPRiBub2RlLgotCSAqLwotCVdBUk5fT04oZGV2LT5v
Zl9ub2RlKTsKLQlkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9kZXYoZGV2LCBkZXYtPnBhcmVudCk7
Ci0JaWYgKCFkZXYtPm9mX25vZGUpCi0JCXJldHVybiAtRU5PREVWOwotCi0JLyoKLQkgKiBVc2lu
ZyBvdXIgbmV3Zm91bmQgT0Ygbm9kZSwgd2UgY2FuIGdldCBtYXRjaCBkYXRhLiBXZSBjYW5ub3Qg
dXNlCi0JICogZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgYmVjYXVzZSBpdCBkb2VzIG5vdCBtYXRj
aCByZXVzZWQgT0Ygbm9kZXMuCisJICogR2V0IG1hdGNoIGRhdGEuIFdlIGNhbm5vdCB1c2UgZGV2
aWNlX2dldF9tYXRjaF9kYXRhKCkgYmVjYXVzZSBpdCBkb2VzCisJICogbm90IGFjY2VwdCByZXVz
ZWQgT0Ygbm9kZXM7IHNlZSBkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9kZXYoKS4KIAkgKi8KIAlt
YXRjaCA9IG9mX21hdGNoX25vZGUoZGV2LT5kcml2ZXItPm9mX21hdGNoX3RhYmxlLCBkZXYtPm9m
X25vZGUpOwogCWlmICghbWF0Y2ggfHwgIW1hdGNoLT5kYXRhKQoKLS0gCjIuNDcuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
