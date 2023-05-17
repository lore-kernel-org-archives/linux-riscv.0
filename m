Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB00C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tA6aNFe5r3JmlwnURe6YkLynzgl9G30h7QQD/VAPaos=; b=gsP2XrbbssvfF9
	EIEg3369xWdsChLcIt1qLQmn+0zG3d8zVn8OJ3TQQ0mh/VbcazQVmqvlt7ip4uIvCKCx3ir/c4/cH
	I2LGG8YWhPmcqBlEuaRoZAeR2qz9MTytHDnLVuOSYkfvX+tzT+DkY0sdGV6u1RG1h9p55gmKuaGBS
	4SDb489AYp0tigJBUYkzB39QMBcuH6jE342/is93PmXeafopN4PDY+DG3DIdXu7KA08DJSwGPtdhl
	RN8lvVg1z7hPPzFRNNE9JSobRRRGLKayQoBXh05/IjiXJgaQKJDDL4KmGOlRZlcJ062Gi7BpA2DoB
	GYhUOFdEjQFY2RsellYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGyH-009vho-0P;
	Wed, 17 May 2023 13:13:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGy7-009vWw-0h;
	Wed, 17 May 2023 13:13:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A47C163E73;
	Wed, 17 May 2023 13:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19EFC433A0;
	Wed, 17 May 2023 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329206;
	bh=JGGRsTfqJlmibWTBDdmhkqjrT8ru+5vGeLr90vAqN7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sUL++CNilYTKBfXlj2dPw8lmLxduHSA+47PUjO45sLxz4n2hEzFLajiqXD05oRvI8
	 26qxQpUDKHthdA9YwLEN/YHntIwAjq5IVk/J7nX75CJFm0yAiW/fp8Unf6Rbj8LRNG
	 UuAyk54JKmTtRzRbemmz9tzUGfiyIgAB+TQe5EXHbuj+wPEfM/oRJtkiWyMRQrpic3
	 qOjN6jBo+fGjO/IUX/iF6ln8D5N66od5Gncx4RdpQj8+TWomVhhGXJRHHJK3AEjfup
	 2fvc0cvn3xNc2dtggIu38wLBvRDjizWLgiEZ0mpy6+j/cgELWKA2rntPrjWLUxoYaK
	 TbULgVLN3CPyA==
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
Subject: [PATCH 14/14] time_namespace: always provide arch_get_vdso_data() prototype for vdso
Date: Wed, 17 May 2023 15:11:02 +0200
Message-Id: <20230517131102.934196-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061327_364729_B8D1F667 
X-CRM114-Status: GOOD (  14.62  )
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

The arch_get_vdso_data() function is defined separately on each architecture,
but only called when CONFIG_TIME_NS is set. If the definition is a global
function, this causes a W=1 warning without TIME_NS:

arch/x86/entry/vdso/vma.c:35:19: error: no previous prototype for 'arch_get_vdso_data' [-Werror=missing-prototypes]

Move the prototype out of the #ifdef block to reliably turn off that
warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/time_namespace.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/time_namespace.h b/include/linux/time_namespace.h
index bb9d3f5542f8..03d9c5ac01d1 100644
--- a/include/linux/time_namespace.h
+++ b/include/linux/time_namespace.h
@@ -44,7 +44,6 @@ struct time_namespace *copy_time_ns(unsigned long flags,
 				    struct time_namespace *old_ns);
 void free_time_ns(struct time_namespace *ns);
 void timens_on_fork(struct nsproxy *nsproxy, struct task_struct *tsk);
-struct vdso_data *arch_get_vdso_data(void *vvar_page);
 struct page *find_timens_vvar_page(struct vm_area_struct *vma);
 
 static inline void put_time_ns(struct time_namespace *ns)
@@ -163,4 +162,6 @@ static inline ktime_t timens_ktime_to_host(clockid_t clockid, ktime_t tim)
 }
 #endif
 
+struct vdso_data *arch_get_vdso_data(void *vvar_page);
+
 #endif /* _LINUX_TIMENS_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
