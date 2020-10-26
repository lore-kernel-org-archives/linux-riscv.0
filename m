Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3445FC4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:54:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67E02151B
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="unGlRxRs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzAkbfRq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67E02151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EaM8M27qkG4vmzPv6lzm0sf2giB7deP4AfrgFkqocyA=; b=unGlRxRsOki9CQuhWIAjtQtIf
	Bd2s/psA82wg5jGMG5BDBkGp+3KEVM3U4ckJ0iqDcJdHRTLJTM65BDujiEVIeHpXwaGNZ6vyXzHPj
	20/gEEvcNxxJqNSkdIgjadD1rQq3w66a/KnrE/zzLuUjBlq1Kt81XTRt5bhow+0EUKikwFE0Jm1tj
	JHQE1OostlgcmXrc/hp6sF5JIPjaW8Sqt7o1CfAFN12VahrfXQ1GPFQPJhc5zwx3I6+b3uapMUnJX
	Ue7lPbASR3K/WwIXRgvfiOknTNldpqiTK7H5DxrKxacP4ng/3X8Ur4i7HeVi0HkHSyFXL40pCMvcn
	LgFgrorKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXCJX-0002ti-V4; Mon, 26 Oct 2020 23:54:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXCG3-0001Jx-IT
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 23:50:45 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBAD720773;
 Mon, 26 Oct 2020 23:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756233;
 bh=FwGCC5je+qSALh6pUyJFCTlFd8RGLBo3/olgLlei+uQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZzAkbfRq/w/rOVQVB6OPm10O49lsC9XqUqiOf6emtf/HuLH2QpY9aoFWSoSNogNsv
 OGqGBt7EKJNila2g5xUCAv7LA2Ob8TkIlOsexWfpqXYJ50EcXXkfZSF4Q4IzY91V/R
 T0RiR1x7PgD+p/CCe7b1eeMG7G5D3Wqq9gDruyhA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 071/147] riscv: Define AT_VECTOR_SIZE_ARCH for
 ARCH_DLINFO
Date: Mon, 26 Oct 2020 19:47:49 -0400
Message-Id: <20201026234905.1022767-71-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_195035_793648_A920E16E 
X-CRM114-Status: GOOD (  11.37  )
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
index d86cb17bbabe6..22e0ae8884061 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -10,4 +10,7 @@
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
