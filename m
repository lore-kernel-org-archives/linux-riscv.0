Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF4DCCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4w2Gl3nSBIvhfr0CNJdDtlE02vO6Z9GskoE1ObkTa3E=; b=BwWgWGIlyAcvG+
	e/n8CPqGaWY35166YxEa70I4TBxBrHgH5H7eUrUD4N3VdUCEBM8BuRCg4YoOdjQNoCy5hw9D5N9qc
	Re8blNJL2P683xeeTLxb00N+lMFNTt8u1/Mi9g5rjqOZCX5C88isoEFXEMlqfsHCOYFWymKbGpO+X
	aZKgg3nwEE1abGXjgEUFttsD1pr6/cpHuSjpPvhauSlVF7JnaSou40dUtBzvCgt7JSnu91CYR++Qv
	AopH6smqh7/jdp1cDJQ3e19t6KO/t3LfKSNvOf1jlyFhXOqEbSDfVj1xW4C3rrXXjy5kAXkwf7ifg
	FtSupXap0L1NHYZKlefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8uqt-00000000ZOb-3i5a;
	Wed, 15 Oct 2025 06:19:11 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8uqq-00000000ZEB-1kjW
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 06:19:10 +0000
X-QQ-mid: esmtpsz20t1760509100tc191fae6
X-QQ-Originating-IP: AGYyXmsCBRc5yqg5sROqL2InOJpb5Xugb1zpPXUPvFI=
Received: from GPU-Server-A6000.. ( [202.201.1.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Oct 2025 14:18:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 715155269882244565
EX-QQ-RecipientCnt: 14
From: Yuan Tan <tanyuan@tinylab.org>
To: arnd@arndb.de,
	masahiroy@kernel.org,
	nathan@kernel.org,
	palmer@dabbelt.com,
	linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@maskray.me,
	tanyuan@tinylab.org,
	falcon@tinylab.org,
	ronbogo@outlook.com,
	z1652074432@gmail.com,
	lx24@stu.ynu.edu.cn
Subject: [PATCH v2 3/8] scripts/Makefile.asm-headers: pass USED_SYSCALLS to syscalltbl.sh
Date: Wed, 15 Oct 2025 14:18:08 +0800
Message-ID: <C997B2D86EB526D5+4bc4efa1739f38c14463918474e8bfb3d8071041.1760463245.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760463245.git.tanyuan@tinylab.org>
References: <cover.1760463245.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MN7J+qOXnZ1LpZYwKidf3Gnb83k4SfJRp4UnTaf4xQKBqQ843xSjSHx4
	fbgQ0wzdK3EpKTf3GtIMU5Wr/HNkvioktxPY7ciWGEUM2IMje3AFOBB4tjR4iWQXtljZOSK
	Kl8l8OYMUDH9KfGD+SBwM2bboN3QcfuMIL7FRa2FaHsd9o6W7ezlwk+KFhaLR9zPxf3JimC
	2grKf+klY/i0n/BZ96ZcI6K938tqjrNJ0EJmvqvOxg6sTY3fM8tR6490SFce6LQoDGEUhCq
	hQ9GFjba6dl0Ar6+yNHzFyN5GbkF9ufBt3qdcyneLWL9x2N+yHews7lvv0+JNnot4yVBs26
	UOd2V9iGylIv92DsMsddNJvlqNta6KDMIQj0vghl2SCy1sqLIOVfCrl5OaCZhqTUbRai4Me
	SmNk1MnQ714ZjKQ+aiP2E3kA7E2inECn9XA9JxMFDAVrk+ceQBq0j8KERYxm95QP7Iu/I4X
	rVV9fKXVUf49AmH7FWbuxK7oj8Jmt1cAE/6vktjjPwaJcp+Y5nCjoMz8Wj/JpX9K+VkHvis
	pWkwqShvGRPwFM3+aH2rDwTVHJD8VSc+/CnGPuRmG6p9jj3gpD2iQPQCXcYT+Hv6VQOCj/l
	KDK63HG0508JRtpR3xYpQB51ZkFHrUgSaILuXqqvJGrHSzPId9RiDUeFCEGgtVdiiaDPIc+
	/ckVEnXDDe9bLD2RuRSAnFyIah2dxCyRLGigjDUlwTZjKoYHKMZPDO1Ou67j0phgxhVFa5U
	uHZe7JShwmEMWkWGigbajEiGXQTNmOsexp/kPNCmNUWWrzs4r3JL/jSFFBjMKlLVHU8TMKx
	nvQPhvlxsPtboTo0iXscEPx614EHc2/A39CWmu/4G0NjbFZsltyjItmF2IKSt+rw+bh054l
	u7LE/fbOBwTKVKVCgiYi9doQkmC6u6k24UX4yLfna/4dw5b859Bg0k3Hav13h44vBkKKmsy
	zlKhGrG4FnQjN/rlr0tRhzV3LgaAaBLlXVAgi7qvnTCRvcDqf4SDcdk0906ZMQwZB/mLoz3
	o1l4Ys9NE3aRScZYPnyU02N+P84ZnaHkG9Utz8iA==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_231909_295274_9655912C 
X-CRM114-Status: UNSURE (   6.10  )
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

From: Yuhang Zheng <z1652074432@gmail.com>

Include auto.conf in asm-headers and pass CONFIG_USED_SYSCALLS to
syscalltbl.sh when CONFIG_TRIM_UNUSED_SYSCALLS is enabled.

Signed-off-by: Yuhang Zheng <z1652074432@gmail.com>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 scripts/Makefile.asm-headers | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index 8a4856e74180..0ae82c6a2a15 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -13,6 +13,8 @@
 PHONY := all
 all:
 
+include $(objtree)/include/config/auto.conf
+
 src := $(srctree)/$(subst /generated,,$(obj))
 
 syscall_abis_32  += common,32
@@ -68,6 +70,8 @@ quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) \
 		   $(if $(systbl-args-$*),$(systbl-args-$*),$(systbl-args)) \
 		   --abis $(subst $(space),$(comma),$(strip $(syscall_abis_$*))) \
+		   $(if $(CONFIG_TRIM_UNUSED_SYSCALLS), \
+		   --used-syscalls=$(subst $(space),$(comma),$(strip $(CONFIG_USED_SYSCALLS)))) \
 		   $< $@
 
 all: $(generic-y) $(syscall-y)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
