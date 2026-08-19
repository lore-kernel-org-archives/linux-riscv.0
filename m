Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56630C5DF7D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 02:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vd4fkXubAZqESJVjh+QQJglK/ohLtkkk/icbuwx6oH8=; b=yNOloHopE5rJYF
	w1hPrNvCkYmis3AGvBjdPeLoboKBatO7S4i5W4G18n+D0mqYDOdwHSJLdWxrUr3oTUU1LRZSiIpF0
	/mEoFcVfAqUQXWdWbjA3skBdnNlJx11gti8PjvanP73QfLIf2La0dPgATLZsK4z+HrX93H9kSqYe9
	yMcrHEFRTDT3usVwbzXSWy6vgfYonGX8YMwjmWXwpeDQUbYVT6aPUObWzXIuwbJIhom16rXYLnGyA
	GtgPEfG65hgddq+yFGa9sNlpZQDZ7SdeODLWuKZWtXbwyEy7OkZslcARvbdiaiB0skm59cCzHpyNq
	LmoYanC/tU3zsp+MR/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW3P-00000008s2z-3nlk;
	Wed, 19 Aug 2026 02:29:23 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW3L-00000008s1U-36qL
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 02:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=rX/5Ncw6TkYVmkpNCpB1GzMuhqdAFux3EzHGz3ko38I=; b=mGygRzJMb4At3JlLUZ2Tw5P/gh
	o5C97RTeg2b/Rt6Q2d8QZ0eJhQSVhJiOv7v3hVBfNQMJ7Cu88OKJxSaWb/AclxAoh5QSctb5l51VP
	Oxp9QFhBLJ/Ac5uZMDWXW8emG8zspfpKKZadDzAsu9WynmP72ivYHVsHyJKb6c7jIOccteHDDSaQb
	8KT+ClPTJdD96fhNbSapoj1mRBnfGUIuOiHM56R6+hkoLIY781acUFmjVAKjlos6AOw/A6X7BoK6p
	/OBJnCBmnZGAYtPdChJBsxclxsMqBF8xHR+ARRw8ASvt8LYTqbgSfFvfV8F6qE3+LxwkN6hR7hn97
	XCDLWwRw==;
Received: from 186-249-144-28.shared.desktop.com.br ([186.249.144.28] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwW3G-005tfG-5O; Wed, 19 Aug 2026 04:29:14 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 18 Aug 2026 23:28:01 -0300
Subject: [PATCH RFC v2 02/13] proc: add config option SYSCTL_MODULE_ALIASES
MIME-Version: 1.0
Message-Id: <20260818-sysctl-module-aliases-v2-2-d5a69dae5798@igalia.com>
References: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
In-Reply-To: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
To: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: kernel-dev@igalia.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
 keyrings@vger.kernel.org, bpf@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, linux-sctp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com, 
 virtualization@lists.linux.dev, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_192919_808544_443E99E5 
X-CRM114-Status: UNSURE (   9.33  )
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

Add a config option for the 'sysctl:' module aliases feature.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 fs/proc/Kconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/proc/Kconfig b/fs/proc/Kconfig
index 24f5a36f45df8b1d6831a0f4011c1f6b1987cb52..e6591ec4bcf0ab2ad96ca7dc90b831b2f9873ac2 100644
--- a/fs/proc/Kconfig
+++ b/fs/proc/Kconfig
@@ -98,6 +98,19 @@ config SYSCTL
 	  building a kernel for install/rescue disks or your system is very
 	  limited in memory.
 
+config SYSCTL_MODULE_ALIASES
+	bool "'sysctl:' module aliases (EXPERIMENTAL)"
+	depends on SYSCTL && MODULES
+	default n
+	help
+	  The /proc/sys files registered by a module do not exist until the
+	  module is loaded; meanwhile, userspace cannot find or access them.
+
+	  This options adds 'sysctl:*/<path>/<file>' module aliases for the
+	  /proc/sys files registered by modules, so modules for nonexistent
+	  files can be loaded with 'modprobe sysctl:/proc/sys/<path>/<file>'
+	  by userspace when needed.
+
 config PROC_PAGE_MONITOR
  	default y
 	depends on PROC_FS && MMU

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
