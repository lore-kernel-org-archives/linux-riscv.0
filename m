Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC02C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWUlZgznxf9Ec+TlBcPwLMbHBxwEHgEwtp/RTsuU/AQ=; b=o3Yq5be49M+wfY
	cv3NDUmVnbDrRejO4frbgkR24v8Jt/XQh2XkYbz4bn0rvlK/Sj95skIx3rDbuTIyxxIUJOPKfIugU
	FWk1ac8pKtrONX/WT4oI/XwQ4qvDzSuphs0l0D9wRGojWXzEBo2Yc0fEyXLRk9ML+GJdp52u0K4WM
	qmgBxPQ+pL1kS37OFPgH+4VnmlS+3JcKg9UOKWhaeW/JaiqSncxjXBAdqXt6JlIPiuQew6yZb8dZu
	Db4JOzDldA1hizMolFKo5rx5BTO+essDOyvvRcxfty+sEubA4CUAu+75yg/0XFb/XYevXtxg1l7BK
	PDpNr8LVFzw5Gxge4wkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23ne-00Bkr4-08;
	Sun, 12 Nov 2023 06:18:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nZ-00Bkmj-2d
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:18:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EDF6BCE0D85;
	Sun, 12 Nov 2023 06:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF689C433CC;
	Sun, 12 Nov 2023 06:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769898;
	bh=C5/JTwI5wb372y7wWIYf3dQ+SLZcZm+RSCZqId06nPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XzxiUc/riiP4tMEJUwggD2u9mRqrLLZ41Aw67HFXqS1bHzAuFmeIH2H5OdveRi8cH
	 5zztfx/t2iY6XV7eYL8QLHaXv5f+VLVEv0DQBpzv3fhdQ34oepKnhuUHQCRLTAAfmI
	 BlXFjNTpR4nT0HBy8oRTm2UlXg1Lm37W6+Es2jfbgDfBCMc1rqNVmbOAc2iRrA8GrJ
	 6R8wIWO+3OcjVbkakLgVpVjgClmWXdTeeqSpyTGCAbCoxFIQVQxFEwORvHlUkG+QQa
	 oywT+nnivDrE06mlTpUBGGpGzGR1WmPvM77j7UI/6TmlIhpnpuKOcrEvU6Cvpr98bH
	 HAReT157wq6iw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	LiaoShihua <shihua@iscas.ac.cn>
Subject: [RFC PATCH V2 28/38] riscv: s64ilp32: Temporary workaround solution to gcc problem
Date: Sun, 12 Nov 2023 01:15:04 -0500
Message-Id: <20231112061514.2306187-29-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221822_026850_5E24B3A7 
X-CRM114-Status: UNSURE (   8.79  )
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
index e56ff39a79bc..1285736dadc4 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -543,7 +543,7 @@ EXPORT_SYMBOL(inode_permission);
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
