Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15549C433E1
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 13:49:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D584A20826
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 13:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BeMiOHnK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D584A20826
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IxeDDymxpr+8S6u8bgkEDZsRBgqFyyPgHQXK8yio/LA=; b=BeMiOHnKnNmyvFwnPzdOthOBK5
	1qyM9s0n57wF+hHSjaerb7GSSfaouZ3cVjEySg6Ae6dV2sJeT7D56/b6zLbb9ayXmjmYjrLLBE6kv
	PgzNT1Osrf/K7YREi4Of+ZRmyATA0/Ll3hhUDpKJCOfFbclfsBedOQKCs//A2/4EvQghEbHXOMiCH
	mibVXtSV2W1jFV4y+UhcKj310aBMU056EpOtt6jET0hqL4u7heXg1POwesprCr3JNtFoAZHxLJtSW
	NZNgQAf1j8MC78D472iUIomvtc/ORmBeFmcNghxtfMJbWQVx0RmvbKKjkrD+kuELUiPMNCgNeFfN4
	6KKCZ+UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrM42-0005Ho-R1; Fri, 03 Jul 2020 13:49:14 +0000
Received: from sym2.noone.org ([2a01:4f8:120:4161::3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrM40-0005HM-RT
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 13:49:13 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49yxCC20Hjzvjc1; Fri,  3 Jul 2020 15:49:11 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH RESEND] riscv: Fix typo in asm/hwcap.h uapi header
Date: Fri,  3 Jul 2020 15:49:11 +0200
Message-Id: <20200703134911.4006-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_094913_024217_8A3E7E29 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

s/userpsace/userspace/

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
Resent due to infradead.org mailing list issues.

 arch/riscv/include/uapi/asm/hwcap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index dee98ee28318..46dc3f5ee99f 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -11,7 +11,7 @@
 /*
  * Linux saves the floating-point registers according to the ISA Linux is
  * executing on, as opposed to the ISA the user program is compiled for.  This
- * is necessary for a handful of esoteric use cases: for example, userpsace
+ * is necessary for a handful of esoteric use cases: for example, userspace
  * threading libraries must be able to examine the actual machine state in
  * order to fully reconstruct the state of a thread.
  */
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
