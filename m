Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD18606A33A
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EHt5UYJ7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOfL5CB5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ap1sReFvaf8bMvfxmiUSc7gSTQefuTUqP9V5UHntzuE=; b=EHt5UYJ73PTplq6ib+9cn8Hcct
	8DVjhy6+8zqeRdKaAa1oKZdBt8XWsvZqK1JTIdM6qW8CxXDD3Zgzth4h8TLw035FObWCoUgrbMIvv
	JiVzey8gW9RtQNwEN/NuwKvBWbD5kWpCZtMc5uSrm46gaHOhm2wfQJdWbe3coMGVpdfrYAqRR1/qI
	W0XGl3toeWFCcFA30VJN9xoqeUyfjpOHX6Kql/a0PnviXYSUTau+aSq1JyUMj1q+Rn+3Dzpjb4CbR
	UGefdbxTYUb2kvYQfswrWNiDEDpAft/XOqm1w68kKiLkIo9sJEa/RLieF9+TYOnaJrc4Zy1HXpJB5
	IgJDCg6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh3v-0000000EmsT-07el;
	Sat, 07 Nov 2026 14:06:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh3t-0000000Ems5-3fNC
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 14:06:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5913E41493;
	Sat,  7 Nov 2026 14:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581C91F008A5;
	Sat,  7 Nov 2026 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060389;
	bh=lN6MEVTLqxQZaRhIMVGcckvM4AhB2Yd9HdbNbDtVrlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WOfL5CB5L+dz7EAp/U9cZKaHOfkSdSte8r9Zl9PdDINIP8kqdNTpe9gExHHcQdRc+
	 pWa71RHtpZkQnijX8QDtR2sxvZOhw1XJkuunIrkapyy0Z8G5lX5rR+TBc8EeSF7Xy9
	 hjCn13ZaUNKh0ITroHRosAmPLqHjCFjMi5XJ+ObKs8ooJxToGY1umSXSxx8je0ZoAy
	 IIVg1V9cmBbuPf2ZZfF2NJe0VTF88QYAXA/0mB5gY3NCSBa5YKjf/5bZhLIu5hwBYW
	 em7cxjInqAzt3gc4VjceyoSAIgauthcJrM5S0I8SCsCkzdvi3NnGj/v89tvYNe0gS9
	 XyXH2FrSoeR8A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH RESEND v5 2/3] riscv: word-at-a-time: improve find_zero() for RV32
Date: Sat,  7 Nov 2026 21:46:12 +0800
Message-ID: <20261107134613.17830-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107134613.17830-1-jszhang@kernel.org>
References: <20261107134613.17830-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To remove non-necessary zero bits couting on RV32, replace the
'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/word-at-a-time.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index ce04d6a088f6..f2d16c1eea8d 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -67,7 +67,7 @@ static inline unsigned long find_zero(unsigned long mask)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
-		return fls64(mask) >> 3;
+		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
 
 	return count_masked_bytes(mask);
 }
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
