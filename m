Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75187D1358A
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 23:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Message-Id:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OPlfsSpMDbkJe5cVqlZKh7pQ4GuSEVIKk3BWD3qKhMs=; b=R4L6C47GcW+WQm
	3Kw/OGVbPy2QipcGYbEgl2K1FCKcB1wX3d307BGCdwk8yOW174BD0itiDf54A8zEyTQY/kGK0j1Ye
	HD6tECJE0wM0HTank/riP54I6wIxK4YvY23yIbDmPOGwN6U4FdGYhLnbeeOs8WbVThKu0+rQoq6ER
	F/Iv+wFIVkPXsewSxBNkcg+cYhjL2VNN7UTmRQDifTPD3/Q92zRrFkg467mKQ06bcHsVI7qYhXXsf
	2Lup9SOIsDE+7b2dgH60AYaCYGck8SpF3GPhSbMMxI4dCd5a2jc/ladIjVAGlcW17A2DjiUk5yLqa
	p7+6qH5+iE4996mDvvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5CJD-000000093CU-41ZH;
	Sun, 27 Oct 2024 23:04:31 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5CJA-000000093C1-3rVA
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 23:04:30 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 28 Oct 2024 07:04:00 +0800
Subject: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
MIME-Version: 1.0
Message-Id: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAODGHmcC/32NQQrCMBBFr1Jm7UgmKRVdeQ/poo3TdhATmYSil
 Nzd2AO4+Iv34b+/QWIVTnBpNlBeJUkMFeyhAb8MYWaUe2WwxrZkrENj8EH4HCTkGlZsOx7d5Ii
 7yUKdvZQnee/KW195kZSjfvaHlX7tH9lKSOhNN57O5L1lvs4ccozHqDP0pZQvN6s71bEAAAA=
X-Change-ID: 20241023-00-k1-maintainer-46eb3f31e6f2
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=eQ5d6JYzedEo6qgOSBefHqNWMIjTUKtho4mHNp4xUoY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnHsb1gwt+NcWlFwWtfZiq7ZsnYJstpRio7SGLE
 ZpMeJzY8/qJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZx7G9V8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277ezeEACazH3qkA59+bdj3x
 hfSM5zNIf+a9bWfeibbOEEeF/LUGt3b4420R4+KvAS/mFuFfZ31Pgc8Uc6y/ScJ6Z5nPd5IYxSC
 NlC6qHTMSBC029Te89c97shw1LH1a1WRZjylWBetAftZa/+EfVggaDDne2otMTJ8pFpL1OmMha2
 Mb4zrDxTeh0EqDEfGOHNkD7g1WOcbCMitcJx0dDRY0YHypSlTmN+EbmFAjErhGQxHqRZmyK9gXN
 yz0PnAukThSyM6WsoznQr6+VHiM3+GmEjR+hRXtjwYzVJ1AKNJkevTG8O2SrQAxxFBZCdvBTTXc
 F7Ygf3qJfVGwo/u/Ecb2ptt5XJ0WxbkGVM/l4hDKxlFXKVj4kzgmBp1DSFysfLF7t5TMG5gNldq
 TQxcTzi2qtjExq3+cDjP9pXl9b6nLozLx7rNgwbl4MI8mOAQ6Nmw99qGpoSnLdRjMy/bDKiP9hR
 GN7iur85Y2fMwKAuAvJACR0Va+OuM4QN5+TPWnhApCDVNwbzvD2Y4jnXSFlBYaEXwRVfToNZShg
 iPGxjHl14MTMuuLelyb7dWchigQu6Eahj/+boYuoxgDC7AUXtOEZChBcdexHyKmV0osVw1pvOjq
 R0VADyiOgo4dC8vi8AaLOwUfN5+kBGGdMhQBlk6YYoUqxzNSJQuxqXOUufKusSNwRuUQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_160429_020741_CF3A86AF 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, soc@kernel.org, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add myself as maintainer of SpacemiT's SoC tree, which
suggested by Conor [1].

Link: https://lore.kernel.org/all/20241018234615-GYA2124001@gentoo/ [1]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
This will setup proper maintainer info about Spacemit's kernel tree,
which should help to take soc and device tree patches, and send the
pull request up to Arnd's soc tree.

I asked Kevin to host the kernel tree under SpacemiT's account
on github, which should help people to get access more easily,
and promote the tree a little bit.

I could take this patch through this spacemit's soc tree if no objection,
of cource, after got ACK.
---
Changes in v2:
- drop RISC-V exclude dts
- add mailinglist info
- Link to v1: https://lore.kernel.org/r/20241023-00-k1-maintainer-v1-1-c06b791cc2ee@gentoo.org
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9659a5a7fb3347d649855992a559e3526d18443..88fe4ca801537eff7eb5001406a611ef80632b5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19814,6 +19814,15 @@ F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 
+RISC-V SPACEMIT SoC Support
+M:	Yixun Lan <dlan@gentoo.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git https://github.com/spacemit-com/linux
+F:	arch/riscv/boot/dts/spacemit/
+N:	spacemit
+K:	spacemit
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>

---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241023-00-k1-maintainer-46eb3f31e6f2

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
