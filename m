Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AEEC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7ydzdqfwhUkpnUndRNEWA9Khb5N/xDP8AVfEComXno=; b=WXLpQjY/l5bqex
	0gO2F09kW5daDRnaYHFY+Vi1nRdvppnOciUIE0TZ4SLS5yUszFEafSr/1iR2eccSQgPq+g2QudhCd
	//fzuVY91Z93x0caZuKSeTCoKsPD3aH6HHO149QQeHCICGzzjKmIDrwlSMNssBNfcJcuiNh7b2G3C
	tsX4XGgACYeYdlDxSMVt2whLlQXkx+zPA9s1RrcKM3tx7KLjUPkSj3DJbiTmTAKKu/MW23d0eDE35
	G5wZR315P7DRRf4w3akhROsoifU6SIKGWSEDTwlCBAYsahJYvysY9bvJNNuv+00eIDwEdB9RX2aCZ
	jSyMWsJcsiihSI9q1f9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1tYs-00EPka-1y;
	Wed, 24 May 2023 18:50:14 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sbr-00EFv0-1p
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:49:17 +0000
X-QQ-mid: bizesmtp74t1684950423t77e0lrx
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 01:47:01 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: znfcQSa1hKZBlxy494Gp/CUTxDNxeJi9g6MNrUFAmf11ZBmaQQlpsB9yjSoP9
	kCNyyfNK4LVYRCC+QxI5nml5abQCRTMKoiHD1uZbPRTZ1RzErA2+ejZ5gCTE4aaBmHm5bj/
	ZQ1bgyUYryKHFl0PJWO5ymVDxnE2EuM41izSnz1UsJHmnDxwhtoG9KaU3OBjNXlgs+zbNtw
	5i9MDjM0WHVF2a96ojpLDypn3LHo2HPKKA40Q0jjS2qTrMgN6Fci78eZmVfBjVwe6Rx4Pj+
	NvUiNs0b9UznWltOOMBCnR8UPvdOzT4vkcsKKbIerPec1+SV01TSUsBd4hWFiKtvEnBRr9S
	KVY5EDSIESXpdffOq9gmaBnmtPOtzRkYz4oX4hJkkwSFjsyihUHNRYIIYhw7Um6ZkKDhbVj
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10920217601069788465
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 03/13] selftests/nolibc: print name instead of number for EOVERFLOW
Date: Thu, 25 May 2023 01:46:54 +0800
Message-ID: <e3c9bf5ccdae920f0609486256c52de8233aecb6.1684949267.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_104915_912596_6F5B706E 
X-CRM114-Status: UNSURE (   6.66  )
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
Message-ID: <20230524174654.bb6wvhpAgVx3w7oa5yGhy0ilT08_qZLuhkhtYYN_N7s@z>

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
