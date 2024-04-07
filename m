Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28102C67861
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 01:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRjln73GQwZXS9BSL7/i+UI4gcLTfGi/vO+oFpXq+o4=; b=TEb8jVsFHhxxTH
	D9E+a0TJoQ4Gd69s7+/gplkN0RiHW0bF3XggqI6fwRO1Gi5o2AovPRejtymxHmP4a6Gyb1n65SaId
	sv8eactxTrDqamG7tRapR3zgJG8JYEg7LMKffUHC+RBnrhp1dVta/rI7c9xUnMG6/jjBQsqk4sNOL
	Fq/4j7gnJhbxDrSWA8QJ6Y4hOQtoQ2U/x2Ftb4wzo4FmDoJW7uqPDGNg0iiysu+mpVT+XreiXWEdy
	2d2DNVbSRULYZq/7Vsa9XmBO5PHX2tMOEvfxTrFM9cNg0lrR17ju5Swam3lgh0/SaBmeIUD5roCd1
	K0a2SrilLjayFH2Av0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHML-0000000BORa-49ii;
	Sun, 07 Apr 2024 01:30:13 +0000
Received: from out203-205-251-66.mail.qq.com ([203.205.251.66])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHMI-0000000BONU-0JT1
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 01:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712453406; bh=k2XCyj2HtiyDsP/ZIm+qg3j+A+CGArLiMKptqsaRcss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VtEQsyCODR6e+Ddzh4wdo6K/aNoruU/AKSvhR6XoyCoPne/TfL/BhISeGYfEkpzCE
	 5/Nvq3haZesHTz2NUkpaghL48P5XARbgk/xbHqm3P+/Sm5WpOCvlQ/XC3XMW5bZ2/T
	 I4KZce247GWFQkClqQ23eRmPd1y55aYgqGedD5nA=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 7741FE3D; Sun, 07 Apr 2024 09:29:52 +0800
X-QQ-mid: xmsmtpt1712453403t3v0hfvf4
Message-ID: <tencent_473BC2E2B2C48C84DC378AF0E90A0669130A@qq.com>
X-QQ-XMAILINFO: MdoRYM9mYrydIhPjf7JInuTgACUHdYElYYGn3GRcfJmO7aFfX4w5G4IPROs3BI
	 JK70PSrlPcq9O5TLjenzytJ0+LdME0gIpps4hDpbeqreTLLahDZj50XqR7HF2mIa0wdf0dNuk/G0
	 tN9rQUzIeiO92zIE6Xrr0eqgkU+IGTuVpNlcwHi8wGBk3nFNOfGmOTqm3s2PHb+MRE8Eemvf1+cm
	 iZzMlQRNRCFrKF11gF6TWZ3Mh5QYfHcF938HtZJM9FAtIWAdAxPtRe1O2ZuVdcdUBa/CCBs7E9zU
	 NOxhAHw3Vv6YrO/f3Hiobwb8rqiKBIC8mNSNt7yqOBPjHHcERAGo474DqWYgPsAPKuag8MQ0eODs
	 tnbqVDNrKh6dv23HISE7t+sdXjsPiMH5R7AggN8QHVMX+n9oVS5GDC8pLcGCxmDCa5iEZzmcnyIl
	 zF1iPOyEKAFSxrFxgK3/VbJ85GrwkFtNQJxtakOvTNBK6Ago+/xv5mO65Qcq0SMC2LKy6McEGxoV
	 zJyuPyKdyMAPN5R7Xv24zWQ+GVKNwOjyu6c5aZy/w8+YIa3I63AltOtjiDEomUebNiHvGx/bPyMM
	 fd2hv2p7r9R/ydLz2dL99X0+xaGF+GbAHmywox/ylniQOe7OJav1kDsxA8qZNujlkkxHsg75X2Eq
	 9Wgw7iG8wtgbkXUUuGY0ux5voOWsWTBYONJYLcdV5jhhYDx9D2SDIf0qlEaasz68Gu/2LY0xF3Wq
	 Xtf7u2gG8DfoiReDRFe4XycfP9y/zPpmpPRE+qbIVmhDepE9dKVosDl/9yYP1F96c+Tevnkmq23B
	 rHtQ+ki0QnWjRhotLWaKhse8MXwu7C2CrKOzbhMKDmwVLA9wh4JondMQdp+QWASMUtboQi1KhR1U
	 r8+KX8+VQlwbygOKBJiBRyEwnItjBk1Ch05BWhw0hnmPzOyNOX1zoiBUNQ785hd1VihvR9/veCil
	 cNUim+P6mcbjgEzzjhck3BaGYFf6PKPlKcpptKOiULFL+1kaYqLkkkNgLh4GqoSoDH+HNMUJJtBe
	 RDu3qA3iTSQsDuG8O6svI3eorR4tQWi/0rdLf6irjjVQL4myLYq0BfaRDCg6k=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 6/6] riscv: config: enable ARCH_CANAAN in defconfig
Date: Sun,  7 Apr 2024 09:29:44 +0800
X-OQ-MSGID: <20240407012944.2996666-6-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
References: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_183010_442533_0E5DFB3A 
X-CRM114-Status: UNSURE (   7.06  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc0ec2ee13bc..27bea8296b9d 100644
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
