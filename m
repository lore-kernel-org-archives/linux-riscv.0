Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C49C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72QSpAlFtVAjYT4olyIM/zZs3xzLROrkp3fNsNeHY5I=; b=5A1qd3pr8paK8Z
	4F+9LjFlElPzijXfyisZyDZr4/n8JKa8UptoUNYnQaZewj4WsrevN81pNPd4ljH/ZxG0N9szTFqr5
	IYUI1qeHypd+bq3fj+VsrXgMrwRs2/cd5UeLvf1GY/jpmN+uD/2YO4TXEiTmtwcmBkBmfPY1OoK94
	xb6zqJ/yQ+25SjOtIaBejCiTWo7vNqh06MUdmRnPU001peGjkso9pFvDS8kM5fzqFCex4oryWxXGW
	r513HTod19z90pE2HrVRfrpe+zhghVPwcQYxGmNGN66Vh7ap502OMPh8IGgyiR71vAILEOXYi2sG1
	1J7LyNaiDyneN5kLouow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC9b-0000000Elyo-2ICW;
	Mon, 29 Jun 2026 13:36:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC9Y-0000000ElxA-2JwA
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 13:36:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-46cf972f281so1809815f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782740158; x=1783344958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=doyC8I0iyjgl9WNg7f1yJvwuKOKmYWmbgU7IZ2SdeB/6DOf1CFr3HCgx5t9DHg+64t
         Cc1H1N/rX2bnuuYOLBdcc5+GelvAd0kaGgyTCorXGQobQQLhmHF/lq1pWKVVe1GeymNR
         2KnWDhtly+3mfIgYsnlHgVZVLOU/tiEddK0nalEwx8HEPRjq4nIJM9OJG7MqgHlOtba8
         RcJ6QHpbmm+PIL8KU47rPK7JfGGtAk5TzYO4EcLfE/qxn5FC7jIGLRHenZ8jWteIyEQ9
         /06ANjhk+9STkzV5T9v4JGdSqvBbvS6lNIISiH1AE7cbL0X2QguSK6weSrnU8sX4IiVQ
         gf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740158; x=1783344958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=Mc2rPzOmR4FD1KgxofUNTxY10G/Np9WuoQfECAaj6yzvPVXhXE/chkvM3BROOSn0MI
         qkNf3Qt7X3KJSZhLpI+9lLqrwr589WA3yjE563YFV1CgN36GYhuhE46rFwA4CzaoQZiC
         gGRH93PQivJ/7k2sCKCOhK9uKqbiMXVj9D5AekbwatWJuPE2WaiW5s4T/eRUSTjvUbu8
         l+nrrTGbN7qkSnqD1mfuRtLrRoxJ9nF+lRH8sprF6zxPXr5/ZOTxLQdUbvNDkCT5y8yg
         aPfdc/w5vxb16b1owt6+5xnMB5zw/QXUduz6VMrtueHKDXVGCF9SUTRqAt5orJn19gce
         H0VA==
X-Forwarded-Encrypted: i=1; AFNElJ/wJuudvP204Ny6rRN+re2DQQc6ZuAp9muAYnee+1O4eveUCHwgiogATBqZoH/HkJ2pVTKzPxnXUelcZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8o43pOqKLYJK8Byr2xDQX3rEoCEMoLQTD/FRk1iNekQOPPrYF
	ERO0Lu/uJ+ljmVyOyDQw/pH+lsieT+B6hzLMcbIXOcgkq/mHLbGwx+Dq
X-Gm-Gg: AfdE7cmghQFipzNz8QSE76slVrOq3RBb8qsb5VnWaqo8bxq2pSyyZtgFpVAHEyz0MEG
	vGooyGDfro30yds7EvicCc8q6pZlIS7YZCQbdjZBHohtyr3J73b+1DsjF7VTOXdpgUVcS7B+gEy
	htD3fM0Evl69l64uLo0sPm+O1EW6cqMkBnscKkrxVH2nBW7yXB4ZV1eEWDJtclG2e/6ahRYrGZE
	kzCu6SqiJgjwwoY/NKc4VRZRkvLmCEmLG+aae1J2ifdz5tA0okQbTs7WWG4OuqZP3U0P7nuZ7+j
	fuazoD392UgOqfvFoTF1I9B3gWrCMQe/VJ3hfP7mcKzP3RJe2M7TxmgclkQa4ZLefS+RVc3Mmb3
	cGuN579NSK4QRLExtca6SY1OPRQekbW4xWv5tmuX8xFopariNHM0tsrzGpqzpx65QHLFRLNy290
	O67jCZx3N7X0uKEfyhH+ERDbvTFbSXdUzKOk3wcIlzAuvprJUF7H1dmDtt/eo+4favkSVySg06f
	qWhZQLA
X-Received: by 2002:a05:600c:524e:b0:493:b2c1:b302 with SMTP id 5b1f17b1804b1-493b2c1b445mr34652035e9.16.1782740157956;
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47327c47122sm13954850f8f.34.2026.06.29.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Message-ID: <2496717f-12b9-4d33-b6db-1db278aee8e2@gmail.com>
Date: Mon, 29 Jun 2026 14:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_063600_618435_8212D7AB 
X-CRM114-Status: GOOD (  12.91  )
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

SGkgQmFydG9zeiwKCk9uIDYvMjkvMjYgMTI6MjgsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6
Cj4gK2NvbmZpZyBQSFlfUUNPTV9TR01JSV9FVEhfU0NNSQo+ICsJdHJpc3RhdGUgIlF1YWxjb21t
IERXTUFDIFNHTUlJIFNlckRlcy9QSFkgZHJpdmVyIChmaXJtd2FyZSBtYW5hZ2VkKSIKPiArCWRl
cGVuZHMgb24gT0YgJiYgKEFSQ0hfUUNPTSB8fCBDT01QSUxFX1RFU1QpCj4gKwlzZWxlY3QgR0VO
RVJJQ19QSFkKPiArCXNlbGVjdCBQTV9HRU5FUklDX0RPTUFJTlMKPiArCWhlbHAKCkkgdGhpbmsg
UEhZX1FDT01fU0dNSUlfRVRIX1NDTUkgaXMgbWlzc2luZyBhIGRlcGVuZGVuY3kgb24gUE0uIEkg
Z2V0IGEKYnVpbGQgZXJyb3IgY3VycmVudGx5OgoKV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVu
ZGVuY2llcyBkZXRlY3RlZCBmb3IgUE1fR0VORVJJQ19ET01BSU5TCiAgRGVwZW5kcyBvbiBbbl06
IFBNIFs9bl0KICBTZWxlY3RlZCBieSBbeV06CiAgLSBQSFlfUUNPTV9TR01JSV9FVEhfU0NNSSBb
PXldICYmIE9GIFs9eV0gJiYgKEFSQ0hfUUNPTSB8fApDT01QSUxFX1RFU1QgWz15XSkKCmRyaXZl
cnMvcG1kb21haW4vY29yZS5jOiBJbiBmdW5jdGlvbiDigJhnZW5wZF9xdWV1ZV9wb3dlcl9vZmZf
d29ya+KAmToKZHJpdmVycy9wbWRvbWFpbi9jb3JlLmM6OTM2OjIwOiBlcnJvcjog4oCYcG1fd3Hi
gJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluCnRoaXMgZnVuY3Rpb24pCiAgOTM2IHwgICAgICAg
ICBxdWV1ZV93b3JrKHBtX3dxLCAmZ2VucGQtPnBvd2VyX29mZl93b3JrKTsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgXn5+fn4KZHJpdmVycy9wbWRvbWFpbi9jb3JlLmM6OTM2OjIwOiBub3Rl
OiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcwpyZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVh
Y2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgpkcml2ZXJzL3BtZG9tYWluL2NvcmUuYzogSW4gZnVu
Y3Rpb24g4oCYZ2VucGRfZGV2X3BtX3Fvc19ub3RpZmllcuKAmToKZHJpdmVycy9wbWRvbWFpbi9j
b3JlLmM6MTEzMzozOTogZXJyb3I6IOKAmHN0cnVjdCBkZXZfcG1faW5mb+KAmSBoYXMgbm8KbWVt
YmVyIG5hbWVkIOKAmGlnbm9yZV9jaGlsZHJlbuKAmQogMTEzMyB8ICAgICAgICAgICAgICAgICBp
ZiAoIWRldiB8fCBkZXYtPnBvd2VyLmlnbm9yZV9jaGlsZHJlbikKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBDQyAgICAgIG1tL3RydW5jYXRlLm8KCi0g
SnVsaWFuIEJyYWhhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
