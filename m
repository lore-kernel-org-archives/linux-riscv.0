Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C80CE79A7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 22:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgwYniHy1beTFfxgwn2awde6yAHVwFXkEYRd3VbMtFk=; b=oajy0lxsBMEhlG
	nfNoF0lXoqK5ATZASbLlhSHOdlgA1mf8qOfpiQ/SzhVuosOKUL1dKDclSVG43z8lAs8ZbDgNPpK3y
	43kqkux12eDqoxlrpGGpAwHNPiWi40RSk+nj4gZHJSHKWFNE7qlqZGohcBkVpRkG9zSRYL3ynrrwP
	7Xky8+c4q9L6SQ6PI5Op2PkxZHvjzyIrfkZz54OXn9NF4FbwTVM9jeKVSkcV1BmMHgih2pxJHut+M
	laswpD8t3SoO9yZfpbBzXjlfY75Iy5Zp1j6thikvDArFf3wzd+bJGlE3yoVfVXIaYR5QtdaK3Dj46
	zTf5lQ9Ebd1NHi7mJNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuEa-00F9ZK-13;
	Mon, 25 Sep 2023 22:39:20 +0000
Received: from bg2.exmail.qq.com ([114.132.224.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuEX-00F9Xs-1j
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 22:39:19 +0000
X-QQ-mid: bizesmtp62t1695681542tdrh3qq7
Received: from linux-lab-host.localdomain ( [116.30.124.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Sep 2023 06:38:56 +0800 (CST)
X-QQ-SSF: 01200000002000E0Y000B00A0000000
X-QQ-FEAT: SFhf6fKhx//PtbsvyVYEL/gCYQ5xMD8J6LwaCKhulpVEfmJppGRkMmjMj3Bxv
	8wdytKPzLVFJlPA82FjC2Ti02tsIHXGhP+Tb7KY7NXZeQX14PHTRUwY1uNtWxj7nVvdw5N8
	ypB+bBYPZTiHwLTOfPVZ2o3kvUQu/slgqaqTTvxwiXKKuRoubwr8vyOsZC+zpBmOn8ghMQm
	AG5bLu8EeQJF77jcZcCDh8tBPzUgxyBcq+ybkOO584JaaHxdkRqP9QMqdLVLQkwKUzkpjRx
	8jfcH0gidHmiUdV76m98gNAlJ0swOV9yXGIUaa85PdpJ4c+AiLAPLqrLnY0hvGmFDffugib
	/YpU8n7ZB5APg72lHoVQhLN1V/LOaRguiP/XLXevf0Z/Nx5UZypKAyBjtff2CMVyBvswmd1
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11640928319628299727
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: falcon@tinylab.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v1 3/7] DCE/DSE: Add a new scripts/Makefile.syscalls
Date: Tue, 26 Sep 2023 06:38:56 +0800
Message-Id: <df1ce8c514c3efc1323d5ed69e6ecbdb2542b960.1695679700.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_153917_911667_8C9C54E0 
X-CRM114-Status: GOOD (  12.53  )
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

When CONFIG_TRIM_UNUSED_SYSCALLS is enabled, get used syscalls from
CONFIG_USED_SYSCALLS. CONFIG_USED_SYSCALLS may be a list of used
syscalls or a file to store such a list.

If CONFIG_USED_SYSCALLS is configured as a list of the used syscalls,
directly record them in a used_syscalls variable, if it is a file to
store the list, record the file name to the used_syscalls_file variable
and put its content to the used_syscalls variable.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 scripts/Makefile.syscalls | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 scripts/Makefile.syscalls

diff --git a/scripts/Makefile.syscalls b/scripts/Makefile.syscalls
new file mode 100644
index 000000000000..5864d3a85996
--- /dev/null
+++ b/scripts/Makefile.syscalls
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifndef SCRIPTS_MAKEFILE_SYSCALLS
+  SCRIPTS_MAKEFILE_SYSCALLS = 1
+
+  ifdef CONFIG_TRIM_UNUSED_SYSCALLS
+    ifneq ($(wildcard $(CONFIG_USED_SYSCALLS)),)
+      used_syscalls_file = $(CONFIG_USED_SYSCALLS)
+      ifeq ($(shell test -s $(used_syscalls_file); echo $$?),0)
+        used_syscalls != cat $(CONFIG_USED_SYSCALLS)
+      endif
+    else
+      ifeq ($(subst /,,$(CONFIG_USED_SYSCALLS)),$(CONFIG_USED_SYSCALLS))
+        used_syscalls = $(CONFIG_USED_SYSCALLS)
+      else
+        $(error No such file: $(CONFIG_USED_SYSCALLS))
+      endif
+    endif
+
+    ifneq ($(used_syscalls),)
+      used_syscalls := $(subst $(space),|,$(strip $(used_syscalls)))
+    endif
+
+    used_syscalls_deps = $(used_syscalls_file) $(objtree)/.config
+
+    export used_syscalls used_syscalls_deps
+  endif # CONFIG_TRIM_UNUSED_SYSCALLS
+
+endif # SCRIPTS_MAKEFILE_SYSCALLS
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
