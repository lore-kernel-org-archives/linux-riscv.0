Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A81C0218D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 04:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Message-Id:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2lVoNf83kw/DESK62VKeQQVtUE//r4UWs5jQ6jf7neQ=; b=PNbe2viP18rXus
	LUMBYzl+fA1pJgqpkbWzUUgdpQ0taBqn4uDymIRJcwupGFIqL72q1afBTszVJV0MlyrTvYXbHxbjL
	WGJPsUM6ohjshxrnQOqmqcn1GNzks4tzgImN0yP+p8sopWFfNUNdVTBzwUrMCiI25/UOj0leklsml
	rixBKzmuoWhP8G1pe/m1vCUWV+u2IoKEjbz+eLhDWyvPDdp0G6Hp+Vgfe7QygvSUu7D3c+AmTXOYW
	B8kodffesM1tB0ILhwrSmrwPomQUKwddxxJ1IMODt+7mxh9wYf9SlmAHEnJ6t/f34i0hjfsvuGfuF
	gkOqfL3H6trOLQC+oJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcd8K-000000042OV-1y47;
	Tue, 28 Jan 2025 04:23:28 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcd8H-000000042O5-1Lu5
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 04:23:26 +0000
Received: from [127.0.0.1] (unknown [116.232.60.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E345D343581;
	Tue, 28 Jan 2025 04:23:16 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 28 Jan 2025 12:22:52 +0800
Subject: [PATCH] MAINTAINERS: spacemit: update various info
MIME-Version: 1.0
Message-Id: <20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAJtbmGcC/x2MMQqAMAwAvyKZDTTRgvoVcSg2ahCrtCKC+HeLw
 w033D2QJKok6IoHolyadA9ZqCxgXFyYBdVnBzZsDXGDK+HmNJwZiUhopbZkWs+OK8jVEWXS+z/
 2w/t+E4yIEWEAAAA=
X-Change-ID: 20250128-k1-maintainer-1-5e45109d2a23
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=p6KU/SgyEOlkeT46rnX6gRJRS45BoDhxbwx01TtZJDQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnmFuxRUZZwhzGuJ/gHNR4f948psYZrAXIDBEon
 dmv6/Bvs7uJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ5hbsV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UASD/0b4GlbXp5c8ZX1Ba
 3j8FSvY2Me2hcGBbdlGKiLnFjk8qqGtZ76qxclx7z7oaCY4Rtagi6Z/WWznZo4lg2sJWGkdn5K8
 OcLfoWS2WbYy6ALD0k2lUtCtybM01Laq3srQxljpZV1IXDJ5d8YwKe+EacS/lLiGXt46fwPiunx
 6Yd5p0WkQmt05G11Lz3Ytkpxs71eiUfRrct3M/+jvmhUtwjGtcYlRLWDH5IzqQrhDWwtoCpbBH0
 FW5X13JiBU/rzIXcYvQSTkl0jXPHpEtKtzmz47lOGsi+EF1uNw7tqQ5KmdZAc8+OWE7uYjXEAlE
 A+zR7ClwBc53+i78WoFjKbB/lkJixhcIVjVhuMbD/69jdJhmJcmhCFs9KKSt6MSOSqvgdBc8Fcp
 PuVS1GSv78LVg+B6m9lmKA243D4erh902v46Cso4JtMZ23GKbWFCLcrcoP+aGNvb6di8U32a/20
 PtbhJa321YPSWEceHfdk4LVAFsPRGmsXPsRIj/6opF0E8YBzkEv28Y4Ke3N/p+NOeiUV2X1ME5j
 wCqdrLirx7HRkCdoBiCn6FcKppi6b/UxDeyQoqoAyGtzQLesmEnD6k4E9fcq6HzWmw1/dhd1x/M
 M2ZUTC/25wRsLbBfepWhK0LSYvHRiWaTncHYUDrRBrTWos6Twy/cdn+aDKM1WpvzembA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_202325_395640_C63ADD4B 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Alex Elder <elder@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a wiki page to track status of mainline effort, add a dedicated
mailing list which can reduce the email's CC list a bit, the irc
channel should be useful for people to communicate.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Add additional wiki, mailing list, irc information
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d49306cc17e3403dbc06e2c7927d6cfce514481b..bf30f31e412fb50af8c0aa49fd25483ef229d37c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20326,7 +20326,10 @@ F:	drivers/perf/riscv_pmu_sbi.c
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
+L:	spacemit@lists.linux.dev
 S:	Maintained
+W:	https://github.com/spacemit-com/linux/wiki
+C:	irc://irc.libera.chat/spacemit
 T:	git https://github.com/spacemit-com/linux
 F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit

---
base-commit: f34b580514c9816a317764e6b138ec66a4adab25
change-id: 20250128-k1-maintainer-1-5e45109d2a23

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
