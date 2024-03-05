Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AC9C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwnIjROIS/ghsk7niDmay3DZw0IPDm5JIIrXwghl7Ks=; b=SJGEC4mabctipE
	h0LXCGoIyEuSpk2elIZTQzyJ01FYdlHyF5bv/pmDnEBX2lYEXYXHmks+oYveM3RiusRRJc7KeG7Uh
	0G1AYqoWD/I9qT2vRgGOEIYcLyuHn0clOBYgrSBweB8lg1116+bFPyDNlYcgDilknMvx8nAsW6IKT
	l5dwg+A2M1stV2DZzMXCVnHehNlCySSOW+XbahcQO6zGUpbNNXlmEYdrE9uFwX46uY7RoaHjyr25t
	GaFy8habEUz8OLE2JHk5CAecUCmotDkgHJ6YNH2QbxZNni6x+/AsE5JTvS5DOGJovh0cSAyA6zuBB
	rXBQkIWGRweaczk3gbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhadH-0000000F2WZ-0X67;
	Tue, 05 Mar 2024 19:39:23 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhad8-0000000F2Ol-2xH1
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709667550; bh=vpfgwixO8WjqhB/6stnV1JiUyPCqfxYij9zHMp1QwAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L5iOEki0/Vw7zzMQskadGa90kyC3VahLZNwWk9SCknaaAKHMJxBtoRh6ceJh2uHii
	 7run6rXbGwm7KRk+1PLSIgG6x7fU7VJX8qulWfOW9iBtDVQV5rt3OTaAfzgdL86M4K
	 TKVnTZFju0aUDm+EoAOpvSZGlpl5fF8lr8NjBuyk=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 9B6B9246; Wed, 06 Mar 2024 03:38:54 +0800
X-QQ-mid: xmsmtpt1709667548tsn8fl733
Message-ID: <tencent_45B4891DF371D3632042AA1BC5F8B6042509@qq.com>
X-QQ-XMAILINFO: Nq1uWKlIb9DMHn+IEp+nCFc4tIpsAONPQpmFByy0wSlIjTin+PQGW/T5EUAqaD
	 gBM+WEyXHZVL35R+I7Ms64Jqt5JB9ANcQKLf85RT6ffCXq4dN8qRsuw/N/HOrnaHlpaZRBWRxxgJ
	 H3cd55o1H2QlGRnhO+rwHusMM2myNLF381LQMWPiRpeY7J0AhD/ZuUPntQirN+RlfY2+51HKojjE
	 B7U2ztdR7NhnxHNEspzD5GSDrlJDgLF97hG0MsGgKh92YyHEA5SvORUqBR+/hFjqPlq1+CKpGqKG
	 Zsm7Ao8Mr/mB1rLc3gS23IMQrjf4zoYiUarKzJ2uBbejS7j5H+5OI8whWfBJagxl/LVGIG4LIaFZ
	 RMiBdZ4rD9kmeMIupjASOiebkNEE2f0xvqn6hOmZPqHNNrbNE72Ykoqzo2di9Po7TVOUlMmPF9TC
	 4DRJMx5so6Qn4ZhW8d3vjRidjm3Qz2eW9v5UMr/MhtzgSNZmib+s8j1Lm7xXatTV3Jxsu+IZJLDk
	 MCfNHK4mq0hMoWWTkH1QXIYsA3DgWtARIZtENaCMPAWOUdpB7Tcy+U0ntXbgwI9zeioC7InIL8fM
	 Ynk+7Cf5q4JD+bmNAdKAkad4FyhocZWcSeEu8EOOVlSEmQyOvOQH/JcitqF9gS0+sIplxtLTrX5l
	 4CVAhrW8xr6t25tYz16Voogx2+OejjGDCnbXVBNit/OYCJL+DpgJxAtSGaW8/dEkeWIGFBDvvtD4
	 UnvuvCj/YdknlIbOZWduBsx3+4fG9fEg/xakFypS++Nqnx5+s00jW1EvOHhQX+ULc5im3ZVgdcPm
	 TNPsXCIZKZyDc8Qa4fuUO4X60a/ElEAZh66jE6Z0Iba2RvT+G+XLKJOx7QaVl3StQFeFHsi69Cxw
	 RO7A7f4sFdn0dDwi6F4CS8NnX2qDTAgapMk2HmLHcpa7zujRDKVXPcPekCkiQ3P0PMtbIoF2L/TA
	 8gGjD0Lxap01JlHmQMTsa2jhullt3GJJG3qc42lq6G1oJs/UJ7wOlUOrKKq/O8RbquEp2iwLW/8v
	 Tco09Mg2PP3M0bwNmBLOzQxOjWYWns/wJFxxXCQ5VS/pC1pcJO
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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
Subject: [PATCH v4 7/7] riscv: config: enable ARCH_CANAAN in defconfig
Date: Wed,  6 Mar 2024 03:38:31 +0800
X-OQ-MSGID: <20240305193831.1084556-7-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
References: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_113915_148842_AF2E9817 
X-CRM114-Status: UNSURE (   7.50  )
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
