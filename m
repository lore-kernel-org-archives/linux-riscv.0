Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00A4C7EE2E
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZAjt8vxvixkcGSeLXZMG1HGjKsTr8LnwGFtx6o9vtA=; b=FEa7nSOhIJ48P4
	CKengVJhQDJNl/uIDWUXOa4F5iDBV9a6CH2AbxQU65JXNpGyShlQ+fzxX9rGkrQOmMfdqE5OFygEN
	Yu/94WJ8i6zAylC3TH0N7wyO+LxZP1Nh2hKqaXP8TTTI6ssRHU2iqzPXDm3V255q5dRYbTWeYf8BS
	Dt1AikHqbEo+6Gp/HUCj2lbX4GpAwuSpTqzAZNDsPbAdF33BR7vnFcL3iaQQtQbMMTql56nra5qGy
	8ePU4mnoBlbC/zH9bRK7jQB/1c9FLptWE4OwfE9rZ63rodm3Ap5LzJz/TwQe+NflwaRNX4FPobOFV
	nOBGtlVBNxVa9otnYQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGxy-009vNj-0x;
	Wed, 17 May 2023 13:13:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGxr-009vGa-2a;
	Wed, 17 May 2023 13:13:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6D6D642BB;
	Wed, 17 May 2023 13:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ACBC433A1;
	Wed, 17 May 2023 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329190;
	bh=d19FT2UXzed3oRWIfJJFjSTk/2JiLUfj9No4RlO7/6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D1+6zXZHFnxnG+wOAs+I7Jk3ZmwjP67pJgzP0uRLk1KweQErWDtrD6kcCaiJbOcnT
	 FeyForINJFNNHVR7SlZDLxBqXsy6U1Q8QSU2g7HzT+HDxANY+2tRRB/juS7IWqHnN0
	 R7uJEX9uIR2BJ1iVGwpgqVvJxOimPbuxDH8nVE33oigOLH+a2C6WGLVT5O2FBvlKz1
	 1cchN4Ol9FfjcJdHRvb6NG6ME/EGUJBb5JSRXXIOYIHDL60v7knAjAptFgq2qEdzKr
	 kBNHvdOcis7Z2szvD6pixKpaEvKxiNP2G0OykAdHnW8HCBkYh+jiZUMYx1rLc8DsBc
	 EwxZhq5xDzb7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	audit@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 12/14] init: move cifs_root_data() prototype into linux/mount.h
Date: Wed, 17 May 2023 15:11:00 +0200
Message-Id: <20230517131102.934196-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061311_943097_758EFA83 
X-CRM114-Status: GOOD (  15.33  )
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

From: Arnd Bergmann <arnd@arndb.de>

cifs_root_data() is defined in cifs and called from early init
code, but lacks a global prototype:

fs/cifs/cifsroot.c:83:12: error: no previous prototype for 'cifs_root_data'

Move the declaration from do_mounts.c into an appropriate header.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/mount.h | 2 ++
 init/do_mounts.c      | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mount.h b/include/linux/mount.h
index 1ea326c368f7..f381eb44b24c 100644
--- a/include/linux/mount.h
+++ b/include/linux/mount.h
@@ -124,4 +124,6 @@ extern int iterate_mounts(int (*)(struct vfsmount *, void *), void *,
 			  struct vfsmount *);
 extern void kern_unmount_array(struct vfsmount *mnt[], unsigned int num);
 
+extern int cifs_root_data(char **dev, char **opts);
+
 #endif /* _LINUX_MOUNT_H */
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 811e94daf0a8..83447c46ad6d 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -489,8 +489,6 @@ static int __init mount_nfs_root(void)
 
 #ifdef CONFIG_CIFS_ROOT
 
-extern int cifs_root_data(char **dev, char **opts);
-
 #define CIFSROOT_TIMEOUT_MIN	5
 #define CIFSROOT_TIMEOUT_MAX	30
 #define CIFSROOT_RETRY_MAX	5
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
