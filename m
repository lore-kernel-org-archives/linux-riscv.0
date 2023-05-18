Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F508C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AD9EUF4d8LdjwO/obrcf2bqeJPfsbHz366XybodxBDs=; b=vCV7Zs9DD6XmUz
	W9chIhc/eBfycsTLFMCg4Cniptl66FYAQcGyj+xM5BZToHcxzVWTp/jywvDud9VkV+F1To6cASXHI
	b9TRg3rnLcLfJyOX1ngtAHY7QK5w5MGLOqt1h5HDNMQ6djELbxaNmLI1ZI2jBuewl8THhhlYkGD9S
	MTHtO5xoHdHaGneJkArvPknHlyB+kV2Ek5xwe8Gr93YHP4cgUXtdex0NXgw+0c8CXzNxSWLmD5gqo
	6Q5KiH4wQl6wvu4zq/Eu2SNJ1ATH/q22JbVSnnm4TbP3cKro+0c7rC3sZBgEm5Y8tJ9gRVaDHudWg
	qPrPFOho3JFQt9BJmSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdT9-00D3YP-1j;
	Thu, 18 May 2023 13:14:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdT7-00D3Wi-1U
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:14:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BD7264F44;
	Thu, 18 May 2023 13:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B72C4339C;
	Thu, 18 May 2023 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415696;
	bh=lQTH6fQXqgDOV13+OOf/m8+ReoWieEMsKkpHvX1KsBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6EWjbahGfHXvROjB2vQAPwqJYGK9YXMzzTxQLwkq71y9CcePnOM9o0N6RgIJxBAA
	 iTUw77TFtCy266dawOWVsx7sYBg81q/acOunzlByttuu/7hUXMU6bAdWUJ7eOvEQgU
	 3It9oF8OK6aVWRyoLzt3nCb15zQ4TaRdM2/T7/NKOFw0Jcs8EDOLPfiSuZYUmrZnzE
	 fbsFQvX+QYCwyd2VkmID9Zbj0EnVj2cHi1nzb1M6HAeGrGFDVk/Au69twErCk4x7+s
	 JeniPBb8OhNwQRv4lKBbLI+UqzRKL20bsZWqfA8S6smJl087/UeJQBxf7ivFSyJJGH
	 lfg8CnyC2mhlA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 22/22] riscv: s64ilp32: Temporary workaround solution to gcc problem
Date: Thu, 18 May 2023 09:10:13 -0400
Message-Id: <20230518131013.3366406-23-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061457_537199_291679A6 
X-CRM114-Status: GOOD (  11.42  )
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

From: Guo Ren <guoren@linux.alibaba.com>

There is an existing problem in 64ilp32 gcc that combines two pointers
in one register. Liao is solving that problem. Before he finishes the
job, we could prevent it with a simple noinline attribute, fortunately.

struct path {
	struct vfsmount *mnt;
	struct dentry *dentry;
} __randomize_layout;

struct nameidata {
        struct path     path;
        struct qstr     last;
        struct path     root;
...
} __randomize_layout;

	struct nameidata *nd
	...
	nd->path = nd->root;
6c88                	ld	a0,24(s1)
				^^ // Wrong arg of mntget
e088                	sd	a0,0(s1)
	// Need inserting "lw a0,0(s1)" here
	mntget(path->mnt);
2a6150ef          	jal	c01ce946 <mntget>

Any gcc helps are welcome :)

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: LiaoShihua <shihua@iscas.ac.cn>
---
 fs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index edfedfbccaef..22a2ef77e074 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -541,7 +541,7 @@ EXPORT_SYMBOL(inode_permission);
  *
  * Given a path increment the reference count to the dentry and the vfsmount.
  */
-void path_get(const struct path *path)
+void noinline path_get(const struct path *path)
 {
 	mntget(path->mnt);
 	dget(path->dentry);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
