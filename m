Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A71C43610
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 06:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D297D21104
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 06:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sP/ZC6Ft";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y3BYC6dv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D297D21104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VpxGhy1DvSPYFdTiDv7l3bam4TriqoalLxx/lfBbYAU=; b=sP/ZC6FtRzBPlfTl3YH1mlIjaP
	yFfjrZB6M4ktTP8R6bBEGbGTHsnmi1Fklj/rMTGpSO8COpFmhvDTcaTytboBdPhvfrLtbLzHx18xW
	gapKrtFua4Fo+Lo74sAHP9IEIZhiumtxoW+f35Gilahy4nrYerr8+op+QBolyoIkR9S3rxeOuAPoO
	1B/6jrezdQphyKu8v51T1SfvLY1MIP2u5t6xaLdJQQMEEafA9AuD3sUSpy/tjL0LiAkQ8nEmTJhiE
	bD3xz5Hbwzt6zMri2WdjNBbXKd543kA+sJty9vnGfp24IFNniCoeUAQ2qVqIprY4tCHUpkEjqM01P
	26mPhUuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSFN2-00031L-8o; Thu, 29 Nov 2018 06:00:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSFMv-0001lk-Q4
 for linux-riscv@lists.infradead.org; Thu, 29 Nov 2018 06:00:14 +0000
Received: from sasha-vm.mshome.net (unknown [37.142.5.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6136E208E7;
 Thu, 29 Nov 2018 05:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543471199;
 bh=S6M8p64PUl2ROx9FC8sH5EyjA4yqz1pTef73TT8mleY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y3BYC6dvWI0MaRSMDbcAvpTfNEmZ3vKjNV3zPDq2OSljB2E2E9aqR2xD5YK4lUxob
 SieOArvV9/oqeqVlBHflABAc6Fqd9vSq8uHLOrWwoPO+ny5/yX/a80zWgzCxV+Wu5k
 CKrrzCEzeVzX/IgmfTWZYFnteQ7yovTc5SINPERY=
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 50/68] riscv: fix warning in
 arch/riscv/include/asm/module.h
Date: Thu, 29 Nov 2018 00:55:41 -0500
Message-Id: <20181129055559.159228-50-sashal@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129055559.159228-1-sashal@kernel.org>
References: <20181129055559.159228-1-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_220010_670853_A5A76B43 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181129055541.ZkEonsprJ0-ur2fiNq8jeZh0a4IcBZtuIWyiqTTjevg@z>

From: David Abdurachmanov <david.abdurachmanov@gmail.com>

[ Upstream commit 0138ebb90c633f76bc71617f8f23635ce41c84fd ]

Fixes warning: 'struct module' declared inside parameter list will not be
visible outside of this definition or declaration

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Acked-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/module.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
index 349df33808c4..cd2af4b013e3 100644
--- a/arch/riscv/include/asm/module.h
+++ b/arch/riscv/include/asm/module.h
@@ -8,6 +8,7 @@
 
 #define MODULE_ARCH_VERMAGIC    "riscv"
 
+struct module;
 u64 module_emit_got_entry(struct module *mod, u64 val);
 u64 module_emit_plt_entry(struct module *mod, u64 val);
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
