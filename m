Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3570CC56201
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 00:18:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2BE020708
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 00:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DGWGKUqb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dj6Hn/1k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2BE020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sXW7NlyccAcRUepWu651rpyU4ChOS/s4DzKBLHoWMw0=; b=DGWGKUqbdyvtx7o6eKNMnN0y6
	D9zrZCOihw+Ka4vsCxDzZopJVJVy6f7gztuJ1h9CXO0O7RFJJMJ3nuTUlto/wD6x3Bwc/9B5BKz6A
	NzA/lHRREC3lcKQfi3UsoA/CHI/yU+AWW3mVMtI8u93ZTeSYiVgqma7Q7vY17065HhGz7pr32u8kZ
	wsqtRzkEjiI7ZDpoM3t2uG0IUIeE/pQDH1AilLJIjiTqg6mZ5OO+AE47rzuXtG8KnkkS8N+ycfOgr
	QToB4BFDXmaaxfnXB9KvEiayUnRMOCp3Qi5sSuf4vJMi7s9mMRg544KRTY2aFZ1SRf7XIcdxMwQDm
	llroPtxJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXCgZ-0005bp-Pp; Tue, 27 Oct 2020 00:17:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXCTs-0008FC-M3
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 00:04:59 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BBD021707;
 Tue, 27 Oct 2020 00:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603757089;
 bh=zJP6FABmNY+7aHNngYzTeoWqZzqO+Ut9jn9IXW73IeQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dj6Hn/1kAwpuLf7u0pwZt4gdsVIBbk1Cbq/Yzbwr1VMA/FYp7VD7bzk4KBQe2p521
 eeCLj31bj84qqxw6UTKWKUV0cpQYWlYVqrNOkmKJTG+EDH/Ge6JDQxEAf4NKZPMEKZ
 4Tc4kju5bcOFp6qUnq0koRvq+0uIph67q8FT4UFU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 28/60] riscv: Define AT_VECTOR_SIZE_ARCH for
 ARCH_DLINFO
Date: Mon, 26 Oct 2020 20:03:43 -0400
Message-Id: <20201027000415.1026364-28-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000415.1026364-1-sashal@kernel.org>
References: <20201027000415.1026364-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_200453_646768_B2776668 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Zong Li <zong.li@sifive.com>

[ Upstream commit b5fca7c55f9fbab5ad732c3bce00f31af6ba5cfa ]

AT_VECTOR_SIZE_ARCH should be defined with the maximum number of
NEW_AUX_ENT entries that ARCH_DLINFO can contain, but it wasn't defined
for RISC-V at all even though ARCH_DLINFO will contain one NEW_AUX_ENT
for the VDSO address.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Pekka Enberg <penberg@kernel.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/uapi/asm/auxvec.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 1376515547cda..ed7bf7c7add5f 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -21,4 +21,7 @@
 /* vDSO location */
 #define AT_SYSINFO_EHDR 33
 
+/* entries in ARCH_DLINFO */
+#define AT_VECTOR_SIZE_ARCH	1
+
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
