Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522D6C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U+S6Qel9/9+CNJoXNk7MWuNrMStcpuH2HtaHcgkzXf4=; b=XPCLCsTn3IOWSX
	xbXUNGCR0249eYxD00wQLJST++9AZ9S7TflVHirAMDJnRWMf8/4FYb/exPysms0vWRtbukpSpL6cX
	rox9kgfuiA5IzngYK8pkvk+XY1BeE/T9aQRunvnRnTm06FFRrcTd4lFasFN0q/L9gd/UCYVEyKI3R
	f3Vd7hFPNmBSietj8i8YmudJagfJV94x+R72jrsVdebXb4+OFRUNbmrVP26Cy8aCYOiOoig7NjJL1
	xPlUw40C3Ik7juMyToUB508c7aCQyFRZS6lJQWrjQAx5aW9o12Hxm91JbQ6Abe94OYAAZzh1HFf0O
	9RLCfJM/8ZM5tNJeuwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUmci-00000002cKc-0Ok0;
	Fri, 19 Jul 2024 12:22:08 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUmcf-00000002cK7-2lfl
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 12:22:07 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: spacemit: add pinctrl support to K1 SoC
Date: Fri, 19 Jul 2024 12:21:38 +0000
Message-Id: <20240719-02-k1-pinctrl-v1-0-239ac5b77dd6@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFJammYC/0XMQY7CMAyF4atUWY8l24lC6FVGLBzHQAQUJu0gJ
 MTdCbBg+dt6393N1qrNbhzurtm1zvU89aCfwelepp1BLb0dIwdcYQJkOBBc6qRLO4IXzmhKnpB
 c31yabevt7f1uPt3s77+zy+f4VcfhbUaOLxAJssxVoSxAIp7MLGvh8Rpebv8Z6Pl0qss4oPrkY
 0gcEjGiSVnlQFElocYkvNZtEcnFbR6PJ/e4c0vhAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=bIc8sWnxQMUjNzrRcL6x7GDCVbT9j5645kBvGNMugsc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmmlpY/FJNMrsVYtdouohyPcxAyHdn+1LXWDOf7
 8cao4N5wwaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZppaWF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277fFhD/90/Jx9K6BO4lirUx
 RwpNGXjyHCQ3I/HSbwEduvcF6BrEjIpDO1GqfWOUuG9KEFNbcMe6yFAiZ+PH6IWl8TNZ6mmVY4W
 vCEweyCiFQeI75cByD3M82RqFRDOUWbDbCAfc7ni/ivDJb75anCp/wrRoZ6rtEnDxInp9U8OKXi
 Flr01mlNIBeM6XUs3Ba9fUroBszVpL/uj594vKNziaUW13vO3cJCvt0z83+Q+DXwbHyZR1tNUge
 ZKaZbm1TEM2ZrYwXjP/0SI9gHzceT9c23NFvyD8WWpY92WA51q9ZDtIerK55xTrgikyYkVGm6vw
 MXLX73Zzu+NvDodgidhM9QPMDDMjoG/xxzi/e4XLLb+qdQCZKGsVWN5F26TeMiCiinnUfjVloZx
 hL8L5cC0SnHtFFgqGmlZD4OsFh1fEGEtCKV+Kv6yqJUcrb2foicrbDE7jJZIatWwtp/g9XT7W8Y
 7nozxnf/8g9Q0kX4kSbLj88A4sX1woX7he29NWMNa5sopqi37JUcOZgCCHB21wRGwmMKr9wyVZ6
 VkNx4FdRGOFfAHLCZGeGJXASutWOk5LKFsikTiadNCWLd/HCJcAqkUqM0HWaNlqTFZMRNEGcLAO
 lG6KQdHataoC+hXKI3MuQr//KCtuwpc8bfJANLZcbKKBYKJd5g8BhIj6ze0H29WIXA9g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_052205_762215_217B6132 
X-CRM114-Status: UNSURE (   6.26  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds pinctrl support to SpacemiT's K1 SoC which
has feature compatible with pinctrl-single driver, then later
add pinctrl property for Bananapi-F3 uart device.

The pinctrl docs of K1 can be found here[1], and this dts is largely
converted from vendor's pinctrl code[2]

Note, ideally, we should map raw drive strength value to more user
readable current value, still need to figure out this..

Link: https://developer.spacemit.com/#/documentation?token=An1vwTwKaigaXRkYfwmcznTXned [1]
Link: https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x_pinctrl.dtsi [2]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      riscv: dts: spacemit: add pinctrl support for K1 SoC
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |    3 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 1746 +++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.h       |  220 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi            |   14 +
 4 files changed, 1983 insertions(+)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240708-02-k1-pinctrl-3a2b0ec13101
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v4
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 0ec28c28b96fb9bab28d05be6f772323bed4db95
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 6bba652dd4f57b276010990ec36cae348b0e1b4e
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
