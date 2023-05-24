Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D05C7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 18:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7ydzdqfwhUkpnUndRNEWA9Khb5N/xDP8AVfEComXno=; b=bILpHcYSGU33+3
	VwXV/mBxhS0wrVCaQ19xrz2OxfewiixFNaCtYi5Q6VgYD03pVx/XPmfxVtJPguTL/gGdFXwA44Onw
	MYSs1ZEY0qWnwCzqP5RZhsxbWJK9pVWZiL2i5Nti21JC/Whbq9eSVCIj9Ouhker6ku7xGekD1MeAl
	DQxTP9VmT7r1XDMLUyKrpN3wHF8+atY67N91NkI0WKj1lvOltvA+t9X8rHqd9OApHGwkBCXAxAapS
	8UQjP/eBEc8dxp7auvAXUs69gnwMlBRFSmcbOnFPfF8aHNuNkdLFLEbTE5HCPGVrH2YeS7tDvT8kr
	MZWGQ3wFBKlxrDZqXS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1tDe-00ENLn-1L;
	Wed, 24 May 2023 18:28:18 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1tDc-00ENLI-0h
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 18:28:17 +0000
X-QQ-mid: bizesmtp68t1684952891t65czbqx
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 02:28:10 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000B00A0000000
X-QQ-FEAT: +s1mbd4gJMqdE3KdRVTj06Oef5rFep2Yg56N4B+cs6Guu0nKNUxftg2QT1KlM
	dlYOipD8hCAisipSxo2LjpBksL37GPw+t6SecCfgKbDUkpK6b/KY57LRTzuF0+asFDe/g3D
	7ceE5M262a0gu8UYsnqociWhvAq6UAn74kufgd1eQMdLxHQbEpuLMAZBLJkZTDRf9fZ+jwl
	vkG/LWzibxev+hfvt3AMdSUzzgqhYSNZNTYM/WkX6+fAusYUBw8Zrt3yT5ExqOYELiVWKGB
	dYGcS+uZdt+VvNRhXsG/a2C0Q8NSVn/v/Qdr9ULq5XkkJLVwzX+4bt2cxXTaX8iHVohX0/2
	3X6SHrd6kJQ86yPi4y7IQO9O6ERdTGNHPCpGsCfCpS7StksozHcgwjVNgjqVTFWcHxzYirF
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7461661690893722975
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 03/13] selftests/nolibc: print name instead of number for EOVERFLOW
Date: Thu, 25 May 2023 02:28:08 +0800
Message-Id: <e3c9bf5ccdae920f0609486256c52de8233aecb6.1684949267.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_112816_575577_7BB42314 
X-CRM114-Status: UNSURE (   6.47  )
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

EOVERFLOW will be used in the coming time64 syscalls support.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index c570bb848c1a..227ef2a3ebba 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -106,6 +106,7 @@ const char *errorname(int err)
 	CASE_ERR(EDOM);
 	CASE_ERR(ERANGE);
 	CASE_ERR(ENOSYS);
+	CASE_ERR(EOVERFLOW);
 	default:
 		return itoa(err);
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
