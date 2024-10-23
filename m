Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D705D2E010
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 04:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Message-Id:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CTIHP+V0G548qzGLiRkGC+IoZJwuXs6O1Uartg6eJm4=; b=uTEyjMwQcd9nAi
	4OvQTKLVDeIXehQ5Dl+ZF0Dtxp+djAoW/cZI8NB876N31hMvByNWBzvVcpnEQNak88WeTVpGRVNI4
	4n/c7lZmG0EFYf1XZFdwimnrHxRuDGHLzMmR7oBOhVEzZBeOFoac2a7+F8TkUApN/QxyVHjX53Nli
	UZWDnY8/hi9gtksFDVD3G8WOSnwqz1qaWq09D75FTHRUQABRWQyw6pyn2AJ3cFN2kCb6gZlktK2s7
	SqWmNwhirywpYv/X58fhpDS5eSzHplZIF3ucVWuIS4w++z0zJY3oeaPKivs/xF4n+HFR/u9nvwwoX
	REjdKPYnxE5Ovk0YXchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3SpP-0000000CtWl-40qA;
	Wed, 23 Oct 2024 04:18:36 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3SpN-0000000CtVm-2ZEy
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 04:18:35 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 23 Oct 2024 12:18:19 +0800
Subject: [PATCH] MAINTAINERS: setup support for SpacemiT SoC tree
MIME-Version: 1.0
Message-Id: <20241023-00-k1-maintainer-v1-1-c06b791cc2ee@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAAp5GGcC/x2MywqAIBAAf0X23IIvPPQr0cFqrSWy0IhA/Pekw
 xzmMFMgU2LK0IsCiR7OfMYmqhMwbz6uhLw0By21VVIblBJ3hYfneDcooXU0mWAUuaChZVeiwO+
 /HMZaP/FPGGtiAAAA
X-Change-ID: 20241023-00-k1-maintainer-46eb3f31e6f2
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=MXqKhhMBhWyZBsc9SHS9qzVzU0b6p3uwUTvpSqcje4o=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnGHkQ6gEuQT2/wDz1XN47OF8HfofAhGoUpBECM
 ZShQunUMIKJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZxh5EF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277cUWD/4pDWbldKSBD+E66k
 Mo6M208LrmXKaDlZ0KQ77I8hBDOGQWXoyHRNrd3CUGIRs4eVP4BdPYO6ny1eTAsobOjkx1UA9w1
 M9gjZn8Jvh1Stq/C5qD9QzUKo9dhdR47kDUodh2wIdretYBgPyXycXws0IMrfQ0QQ3CiPrcQVoe
 2XRqRY0Ud//eJavXsI0zg+kNiOy8wpwFcbMIVHJsVHaSjM8fMQJ/eyN3UhZAqqPvnp7FoEVolY2
 54E6RCTDCPe6p0Kxv1j4VgCaSAdrHO+oWr5y/Tx1f9T9N9YN/LGDNRIZFyntzCvxW66OJAMi6pn
 rj2F0YKIl88WOHhQivC4NhbwsOWwZ6TWHwSzCPRAz6iT8Inrx3v1zNSYV8Qw36CezQ0aO5Hs4W1
 xJRfGXw9JCGWu9V5W4aX1JRrti3yJnuH1zCFYIlCAE626+92/4okuRsD+pP55rSg6I5fsyED2s2
 xtu8vwfGpzO75XtQQuSbveEyNOAauTIH3+p8IlGYYOSHar5eVeRqwnZq5EN6+YM4kbvCRW7ncj6
 IcqhYg9WP+ayVvLVoqw3NoEUYhkKsyhkybHz5n6qVEYPw9hnyc2dOv9SpWFHru72OFKkO+WYVwU
 kgi/6hf9whex/i1/lIVEy+B3d3dux9lGCjDsK+//GJ+1J7npK9ltIRtFyS0Kn85+ofxg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_211833_717258_13AA85CA 
X-CRM114-Status: UNSURE (   7.21  )
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
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9659a5a7fb3347d649855992a559e3526d18443..4087023593f7a0b2d5c5827df682230c329f82a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19791,6 +19791,7 @@ F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
 X:	arch/riscv/boot/dts/sophgo/
+X:	arch/riscv/boot/dts/spacemit/
 X:	arch/riscv/boot/dts/thead/
 
 RISC-V PMU DRIVERS
@@ -21578,6 +21579,14 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT SoC Support
+M:	Yixun Lan <dlan@gentoo.org>
+S:	Maintained
+T:	git https://github.com/spacemit-com/linux
+F:	arch/riscv/boot/dts/spacemit/
+N:	spacemit
+K:	spacemit
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
 R:	Avadhut Naik <avadhut.naik@amd.com>

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
