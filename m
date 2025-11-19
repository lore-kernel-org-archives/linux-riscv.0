Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B48CF34B2
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7FGYfu72w4zvERO6MY74vNqE8YOI8YdH3EmPJYXA28=; b=jDkI7KXiUKV1ET
	yRvK6MUi6i7HAjxniqKN04YmqXMZru1T4Kr7eZ/d+wzzLJEnuXBQS6ebFL1p/P5rMvg5thLSGHcmt
	hVP+eaa/MJQfkktOS7/TI0Iuxrl84Mb/GACO0jk/D1OY6WVbB1/oFEfO7sHzufJCvWGd2qT+/LlcN
	I1BHhjxeNbDU1H++EBJDXKo+2ZP/OfjjIvT86reqJ/gYaz5rUa4IMWNRhMJsJMgq67k4ujOgB8Qwo
	hlsFZFi9tdP6xTt/t0ZHgJ6foiFiqPMiKCkGg5SqE2iphxuml7QA5ahRz/alFQwhi7gZ48Ha2rCQd
	aZXevjIy58iD4lOIE/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjPM-00000003Oic-3Qe5;
	Wed, 19 Nov 2025 14:43:44 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjPK-00000003OhJ-0uj4
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 14:43:43 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-594285c6509so7169832e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 06:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563416; x=1764168216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4rPsaXkkkPPqP8F89aStRjGcZr5tE7ulQ3b9FN2Uak=;
        b=PB90hS5hzjW6L1eaPaBREECJR4S4UVZknoV+LLqMNtPc5TsVb4KeF6jFCO+6QejWno
         8OexfVNfOH9J5W6NXUCuWNPSl9K0sXlIJC/+qDNMo/zid8VLWhwPQtw43Z2bHclGhwbr
         FpgYJ9uQdCVaTLBXwgoJxlN8qXi0QSdtsYVG9P3hF5FV5vsVKjpyvU+pZeeMRJqOQLiE
         SD/R9z50U0OBywNqyyb5EvwDLKHwTCKogKt0Ztv3pRvYR2BNuytFDGs65OnkKAaH23mr
         yYcl2WKIh4qy37F6jHzo7peGeOpt1TPLA8pnG8+QTRFPieouV0iQfrIhL5mYYm/h4tZX
         P9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVOZgOkdY7peRphur8TxT3Gi2R3TnW4KSIBlk86gzEP66CSfLxdk2AQEb7B7E7Agv/M1FLdWJSCx7K8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2b/4dsYmazxmivTmsGlWAKxaqDJSf4zpvhAhAQJA7Xyg5CSog
	sZYkyDQzDtgQ7sddD17P03IxR5JcbYsVwBccb+hJVU3hicIEAJsI/x+TVw+Kxhwy
X-Gm-Gg: ASbGncu/ZnnRA0z2WOPXCrGaaZ84bagZvnRGr6L6SkVip8W9MUSxKDV4inxFhyBZjqq
	Wa1NzNNPN3FPEPy7JaXYX6+SUWVSahxWPGRds0T12WkVxXGSGaBh77Gfwople4yiayiLSM960r1
	bJo9lpXTySBhQEA8BjcRoyNmov+tLaytIGNK2kFVRFDnNkBV2hdUtfcFyRE7pVuxOHUNft2xyBx
	TBaYTvFPC8oeWar+w6zc7ozdex9NxaNnEYsbtjK5sZF94yai9sul+2KccQCpM5Wq/zqdIsVK2Z4
	WVGEj12jlj18EsOQYvLwXTeELc8KT4G0AM7AQmtoh4nkwIzmTO4YtY2g4zwcMRXvL4mG3rJW5rO
	0VXx5/f7r8IbWI7zrz5aYW2yw5uHXAsoml9jeEQ3wugAQt1pWtj7YF7JyIb7jhYrDwqNaQXRWrr
	XlGoAGjILHUvCVpiE2j6ORzhZ2oSDZXJ8EikMLH5XRQXXN+ukFy+QedQ==
X-Google-Smtp-Source: AGHT+IFwogMP/pq3Qo0KDF6SgfS2t/dUU48+d+BDAHviGfcX0FyWrNPG3qNjjKn0e8hc6yhCDuT+Cg==
X-Received: by 2002:a05:6512:154d:20b0:595:90f9:b9d2 with SMTP id 2adb3069b0e04-59590f9bd8emr3819581e87.3.1763563416190;
        Wed, 19 Nov 2025 06:43:36 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ba022sm4714434e87.49.2025.11.19.06.43.34
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:43:34 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37ba5af5951so61917021fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 06:43:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFLKUxn3H/vkwuB8y7N+6dvkbBPGlYM+CoLSxB5CJVnTIO3DQxwg4nRMx5+8WrnOc2pcqmKwf0XMBLlg==@lists.infradead.org
X-Received: by 2002:a2e:9ace:0:b0:372:904d:add4 with SMTP id
 38308e7fff4ca-37babd35f8amr45635351fa.28.1763563413779; Wed, 19 Nov 2025
 06:43:33 -0800 (PST)
MIME-Version: 1.0
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk> <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 19 Nov 2025 22:43:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
X-Gm-Features: AWmQ_bnEwqpydG-ZRtqWc8I4l30DitJuwNrACYzTdhyRCjLGsAnpeFb-cKD8BLA
Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: pass struct device to
 init()/exit() methods
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_064342_273296_1CC7E933 
X-CRM114-Status: GOOD (  12.05  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgNjowNOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gQXMgc3RydWN0IHBsYXRfc3Rt
bWFjZW5ldF9kYXRhIGlzIG5vdCBwbGF0Zm9ybV9kZXZpY2Ugc3BlY2lmaWMsIHBhc3MKPiBhIHN0
cnVjdCBkZXZpY2UgaW50byB0aGUgaW5pdCgpIGFuZCBleGl0KCkgbWV0aG9kcyB0byBhbGxvdyB0
aGVtIHRvCj4gYmVjb21lIGluZGVwZW5kZW50IG9mIHRoZSB1bmRlcmx5aW5nIGRldmljZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1saW51
eC5vcmcudWs+Cj4gLS0tCj4gIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1hbmFy
aW9uLmMgICB8ICA0ICstLQo+ICAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWlj
NzcwMC5jICAgfCAgNCArLS0KPiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxv
b25nc29uMS5jIHwgMTIgKysrKy0tLS0KPiAgLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLXJlbmVz
YXMtZ2JldGguYyAgICAgIHwgIDQgKy0tCj4gIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtczMyLmMgICB8IDE0ICsrKysrLS0tLS0KPiAgLi4uL2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLXNvY2ZwZ2EuYyAgIHwgIDIgKy0KPiAgLi4uL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdGkuYyAgIHwgIDQgKy0tCgoKPiAgLi4uL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIHwgMTAgKysrLS0tLQo+ICAuLi4vbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bnhpLmMgfCAgNCArLS0KCkZvciBzdW44aSAvIHN1
bnhpLAoKQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0BrZXJuZWwub3JnPgoKPiAgLi4uL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy10aGVhZC5jIHwgIDIgKy0KPiAgLi4uL2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wbGF0Zm9ybS5jIHwgMjggKysrKysrKysrKy0t
LS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L3N0bW1hYy5oICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArLS0KPiAgMTIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRp
b25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
