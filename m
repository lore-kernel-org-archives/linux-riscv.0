Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912D9C54E41
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vxi5kgCq8ZgTCecrvszWsoUl90AW6oqxqiWoHaytYI=; b=om7S95sjjKnYwI
	XJ4aTv9NzA5UslcoOXBqYg3SpWr2AxoQRTMHH6ohLCwPV9Z0XAsTaNPkqE+mWXmAjIUdRRFXFEhkg
	NxVaB1Pvxwx/mqXGCYTJGOVqrAbCvnKTcBZYA6JZb9Sq5hi6ZO4uxx0Gxw35FhS7lZ3ulPtRxnYVN
	/TgPLkmLWnyXy4qAf1YuMhB5OpZKAV824TK11UIPio+rxXaXof6wUwWkuUpJz0qxydjcXiWDzSrSN
	u9xTpFnairdJz7orzxKOMkMkUkBvOnutfip9+xap+H5W5ymqE2WHWlt+muKgTY7nMmR5/NN5JqHDt
	7/eULobmXYrPc9vQGXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFWK-0000000AhwQ-0orv;
	Mon, 04 Mar 2024 21:06:48 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFWD-0000000AhqP-1aIx
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 21:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709586398; bh=ZIJLq3BiSFnxhdHDEf99zRwFrDLRKM6iSM1wB2EtUew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nzGyLKnPoGwBIxlwfAUkuIQaPJA9KVS2EVwhIN+BOpCesuCz0Torj02Xss3nbkPkN
	 KWd69ANDZl307XhIZylOq5CSU0Hz1gAZUEteiBbMBSTqcoOtehKwF1xTZSMrGN9yM+
	 GrVImA5ab/6WEg6pJoSoWl0+Ge8K2nBmcEEM2hMI=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1953A8D2; Tue, 05 Mar 2024 05:06:21 +0800
X-QQ-mid: xmsmtpt1709586396tlqjaady1
Message-ID: <tencent_E2812086B695A334EE5E8C70C85CA3171F06@qq.com>
X-QQ-XMAILINFO: OOPJ7pYMv25tJaZk7lZP4Q8/mDJpXDiT5T4zZuM22dEU2c/Gy7TSuOPa/AA6bu
	 CpJhKfQjQJeyJPTNUNGRG2pPp6A2yctjqvUlxBJeAR5MVOUPMLUyufmP5Xl2lsP8bMG26G8oHdoy
	 bWNkiPHu9SK6l5PYmClXHLRkHYRSxMeHn6ic6toVKBXjVUQkWhTCnDx8yofLUVXv3BMk9mAPxMt/
	 ardIAzSS/Bxv6LPxdswI/Xq5er/yWIxI8iNiC3bX42yEpNRABbNbOlM2X01nR0i0peEpV9VCidWG
	 SmRfDuSENS7VykPyUNhLUpL+w1YHbalNtuiVt/RqpO2OgPLEN+IQ5a1vLUd+igd8tHaNz2+QJ6L4
	 ZXCySTc+oe/MSNMBW/1g0KiJAvDcQWs9cYwCU7QrdgW4VId7FnLcfIv6QqDUw7oNcyLWS/UqK9JW
	 W9XyGDpbQzF6d2nL8FV/P58/6IbQMh3aIgkl6GaT1CcW+ccfHxl95/uEg9XA/nsXF862Q3ExJmW5
	 6fVVWWkOoOKHLb3dJB0P3q0lGkCwALjBzGl2QUgBFR3HxdB7kweRDhoiRcpL8tpbOgdZVxu2zYRq
	 WjoV4jvBFBCGB1CkRi9tQgT2RErH5mtk69d8yYcNC/a4QUObCIQo0W7n3rWf9uXJi7qkK6eUVSKt
	 WvRxwEzmbHn266f4AS5slz29IDA9ElFbKIO6kUWNFLK41//9a4Qf44bG7qNUgkNM0MnrlYUR3eZh
	 E1HzGvnKgM4cgfxCROws6zzowP+OouIYRKwqh6JMw/46RK2fXwAezH/S0UyyE61R/uD7ry1ckW8H
	 f3YJPg+lHw8hRbNeBSqaTYIypSTS6xB4lBl7Z/QnMAaVURaC8pn2Gmty6X9fEQOkIanniTuCgw8p
	 HHSNzNHwQKb6F1tTdl25fiMRzzwT5bUAOzedonNPjYyzVe9KHUa3+hvLiyO8bs6grusXlvS3ZAVx
	 WX/AaIZD6SRoQWqhKFiiOuGY7TdUWiPL1quwVLV9PugG9+cf++uink06Z28C0eKdufxYybiEyH+A
	 vC3+rb/94l24P7q9OyoNhrQ18Y2uRKKRewkX1alGFpxdjvvBTNy7IGyJ8UgwlxfdaQ7Ckw9RP/0B
	 57rk/F
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 7/7] riscv: config: enable SOC_CANAAN in defconfig
Date: Tue,  5 Mar 2024 05:06:01 +0800
X-OQ-MSGID: <20240304210601.777883-7-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_130641_862938_5A21B9D5 
X-CRM114-Status: UNSURE (   8.06  )
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

Since K230 has been supported, allow SOC_CANAAN to be selected to build dt
and drivers for it in defconfig.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 89a009a580fe..20b557ec28df 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
+CONFIG_SOC_CANAAN=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
