Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9814C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwnIjROIS/ghsk7niDmay3DZw0IPDm5JIIrXwghl7Ks=; b=LrsEUq6/N5Lsjb
	Avj8+2ctkAUTQGLmkHZV3YzVEJSCtlKvxUQ80uN8Jbb4gAkli7NFSgWlXgD1L9Y8vxNLkvgCioV6w
	UqUCpVDVjxFV957gJ3tNVuDO1UC0sjjHSfOX7rf3mSHzP68P5LqyctqTxHToHdbVlSJFzQxDfHZZJ
	tsUIEUQMDQpXXNnqXAYyVR5i7Df34iIYleL0PZoHdne93rwDqLMjY5LmIe2JtVhu9XmVU3l1D+MpI
	GOy0DhQvowUX5LjIuM1HRR3xXWtGGD/164Pw+ygoxe8VT28nGnF4e+0DChaLiqAMZlwd9nPRw4Hdg
	IbXhDfJ3NsOXv3fKB7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0f-0000000F7cV-11uR;
	Tue, 05 Mar 2024 20:03:33 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0X-0000000F7Va-0GFQ
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 20:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709669003; bh=vpfgwixO8WjqhB/6stnV1JiUyPCqfxYij9zHMp1QwAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZouTvjQpf1bZ9BeqPtAUpKJ18sKL2h8ccqHJA25scMpqaa9lrhH7kuogGM80FipxA
	 ioQtAriCmW2mVkuIFp6tWFOLS0G9uBx1DcVR2dQM2WOQe8miz9wOxjjKOe4+UXBXPa
	 lAZeq7ijlMgCdNIfIvmVKJbT19nVXX+i3s7q4BuU=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id C898283; Wed, 06 Mar 2024 04:03:08 +0800
X-QQ-mid: xmsmtpt1709669000t3bslh3mh
Message-ID: <tencent_8E66E30C9FBB60BB36B9230E2E56CC770806@qq.com>
X-QQ-XMAILINFO: MiIS17MxlZUacsC+x3E/aOAgPni7ooIVOC/z2wi/LOdoBJsDW6ySDB6qGkTo3S
	 Loc6IjHEkJLxIW/IkNxe2jCwM4YYYY6ZLJ5lLYjo6GH/EwQM6BrbA4CPQTSw1NMeOSmCqqpqKO0E
	 8+UYvzqZIcP5KyJMTnH5un4IBq5v/2D88UAZ8CpyAsRnQoJ/bCO7io7uXoQsq5a6/VvgJH4AZ+f5
	 LqnHaIKbJQ08wQIuSzVDRRxVc62vMHOsxhfD1PL7Nty6xH+tOnxAy2ooHYNSvR5r9QE0HV4GwO0i
	 PYIM1h04pCKcwE/CWM3oRVSFlei3h77GbRCigJcC99bPZ5v0I8ERMA2IGcpI+5y1schyFIY081il
	 kTUaJVb8yEK7wT2OvBQ5GrisO0BCAWuoRc3O6PTnEsncZxmaHSGiDk3drk+i4vR5NDLZcR2st2dj
	 iWSxCEgeWk/Gy+vzR5W1To8CXoGOiecrRZnmiNI+9B6odoKUNOsPcsXWD+s+++6a/xin/v0qsLkc
	 FdNN3cXvoCn1I7HBvumtGl5BTxDPgaWOpFZNkYs9a/8yZfVeeXA5FzGQZhdCrFV/e7+1FZjj4G6U
	 KXokBLkuY5gMe5cnUqdjOlmvL8M+l7L0pKI4g6q6CI8YaQ75+CpeP7Wq6j92PNYuYDng8/hTqZSA
	 2ijoOJ1WgpYQJlfYVZj9IOLoFDjprdH6pAzJSCD7fOgD9FJiKdOWL40uRgSXnc1Ec1YFR3TbtYVD
	 KI9Atu1TozIQDzeKJ7eaH8JGMp0kD3aO5ev2QgMz9zh0PPqZPPNty8OFGVUSapjgIHdCmo5l2Yo/
	 acOZyH/9ee38PL2/eVB+mNDaUiiOxGwcdvaVH+Gw+btkVSHJ+EdqXAL5kSPplg+9HIo3YyvxrFJU
	 wqqT8eCBsTxnCeg+z79ycrpD3xXSFHNAuN/DD+x8wD+Cq3kMb4L0H79zDacATnFO4uovuzZ0fw2F
	 TyUQFVHsBlPh5r+SK7YElisY9SjGg5uh9W2XLSbAVtQ/rUFHjtTsBR4nGrgW5VH5aidzsPc/WUPU
	 f2kq6BrlU/IdgH5TgSjfKJfSf7UG3mbtG8UTxxzs0JLCC4BQL50I5yMC85kNwUwQhgchtmcdiWbm
	 4ZK7PxGj/Z62KU5JiTY/LDWU12t/KhPVXYjVucYO4qf3o3XNDDhg+mwoIUVQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v5 7/7] riscv: config: enable ARCH_CANAAN in defconfig
Date: Wed,  6 Mar 2024 04:03:02 +0800
X-OQ-MSGID: <20240305200302.1093082-7-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_120325_580252_A418F56E 
X-CRM114-Status: UNSURE (   7.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since K230 has been supported, allow ARCH_CANAAN to be selected to build dt
and drivers for it in defconfig.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 89a009a580fe..f89df7ddb543 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
+CONFIG_ARCH_CANAAN=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
