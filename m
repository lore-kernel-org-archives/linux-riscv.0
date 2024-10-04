Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7462CF8856
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HQ1P+c/q+rY5vp5lF1/wOvLNej3ACQ4ZKiz6JXsWLs=; b=Jr8FG39dJmkKAF
	hf/VRUsQYXYVgr+/VDpV96ipX8D6qrUtVSr4670m77Fh6zdhmWT5K/K8VO/mKkG1qltI8oSRa/GBm
	iyGFf8kW5fB99dwsyuuhrhWyI3J/6q80qDOlo1ojbEOYYXiE8ntkoQY+wDHPdibv5AY/URcR0mCQ8
	MS4bwoSvvuGbsqgpHNI5A9Gg/I49S/0yjWPogo6HTIpcYaQHfr+kdhvAZhH/TFsYYFxJkP2uoqfnE
	5kMedRfj4v1RHA1hpGpjeXpEz+pJJkP15EyUl8QSpRpxzqMcjPLe54KA8UbuDBiuu/g+syhBEWl1d
	yx35y5M/dmRBg2ueiCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmy2-0000000DgSF-3CMa;
	Fri, 04 Oct 2024 18:23:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swmxO-0000000DgGY-3rGU
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Oct 2024 18:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e91X+dCE+WFRFCxbRnGFaqgjTadOktlVjcSq1eYOfuk=; b=blJ6UnSzpbCj0acMITKZ3Gft1U
	Fa2HTNS/LwS8NKhSYaNykv3DFhmffYSADI6U4/H0nRrpolhMUmMEYokYOGDU41AAb/r/3oN5VcgHH
	7JzAU6owQrzYR7QDZ3G1sDjSljUSALV0E67Z4G4x/EXlKXHH+OFNEuPOBel6fsPoU6ZwL2I7m4RXO
	/nLM3LLdFjw6lDamnUnIOupA7Pm4KTyJECk+h17j6QGwc7NFaGFUpV16yWn46xXrugXHKnsv3dLqd
	6es0oSEYKYxSknprDR6rzHWQrRLYs2LWZLDXiz8o8X7aefaReuY8uWe2H76rIW0/XKRgIAviLFDJP
	N44MYOMA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swmxL-00000003sYe-2Ecn
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 18:23:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 313195C0052;
	Fri,  4 Oct 2024 18:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7636AC4CECC;
	Fri,  4 Oct 2024 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066190;
	bh=4+o4vbfqOTWQ+9y71GdIYZ4+aq+GqIgpKBjO5m4MQWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L+eBHfI+0byHTcEhgeJLnq9d9vpcuXb2eNIMhjqYDwTsUj4nRgYldoYAV+duPAqFa
	 osiQRBLdxK3vOkynN3/27dmHYM6izDa0IktA55v00/EOH+EUOM9l9BzWITBnw18JyJ
	 Ud1hWsczP09hJdhMFFzu7uHfBQN26YpkIRbK4cjTzx1L615qIxv77R+bjXRb8jrE9T
	 OUF9kDGrN2mNm/yws6AmXwOqySkzKsQowEeFABfHdvw7YXDJM8rDMZu50P2MtSr2fI
	 HtWoplEj9ta08AQ4A7PGAK+mpq5EeYULh8lpiauz4BnGcgIdROFg1MJH9b131YXPVl
	 QNcj3xv/o9Mow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	antonb@tenstorrent.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 35/70] riscv: avoid Imbalance in RAS
Date: Fri,  4 Oct 2024 14:20:33 -0400
Message-ID: <20241004182200.3670903-35-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182200.3670903-1-sashal@kernel.org>
References: <20241004182200.3670903-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_192311_879097_F588F0FB 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Jisheng Zhang <jszhang@kernel.org>

[ Upstream commit 8f1534e7440382d118c3d655d3a6014128b2086d ]

Inspired by[1], modify the code to remove the code of modifying ra to
avoid imbalance RAS (return address stack) which may lead to incorret
predictions on return.

Link: https://lore.kernel.org/linux-riscv/20240607061335.2197383-1-cyrilbur@tenstorrent.com/ [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Cyril Bur <cyrilbur@tenstorrent.com>
Link: https://lore.kernel.org/r/20240720170659.1522-1-jszhang@kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 68a24cf9481af..d143dde853b51 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -232,8 +232,8 @@ SYM_CODE_START(ret_from_fork)
 	jalr s0
 1:
 	move a0, sp /* pt_regs */
-	la ra, ret_from_exception
-	tail syscall_exit_to_user_mode
+	call syscall_exit_to_user_mode
+	j ret_from_exception
 SYM_CODE_END(ret_from_fork)
 
 #ifdef CONFIG_IRQ_STACKS
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
