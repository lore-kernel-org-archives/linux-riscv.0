Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82BCC02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 19:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dsrlkutZlD1ZclYrA8z2RHRcvpjVuUn6ClPBhDP3jpM=; b=Lp0g5YbEB8IioB
	3qMjZxXNHXuaiW8FnLZYf/uQlcH+C//yaEhgwb1aAmS6n7ejRWFuO+lDyuTVt7D/3wNcQd2ymn2aX
	rygrgl1LcM9qnMoTjAAqDcKsk+YVRyBaBMAaXD5RuLckUy1x9ReQm2LZwYr0bWj9v0ATTgZDCMLec
	rFuzPQ4VnZbK24yAvt3wGVv2Yb04AHOakuv3l2ZsxDNOL98nr5Rp+UUgrgfmOeKe9/Q+IZd++tTil
	8D+46ckspLmO/v6iSCl6WkCmDlbXBBo7sZgKeVn2NhanL2RA6skveyTWFPcZOpzpn0IXQrxbuafE4
	SeM1YKs04sJa7PoFfCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7Zd-00000007MQe-2tW3;
	Thu, 06 Feb 2025 19:30:05 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7ZZ-00000007MPX-44ct
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 19:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1738870192;
	bh=hb/VRdBvoOPQUGQgI2/03oKonh4Fn4N6DJ1GnbGVOIA=;
	h=From:To:Cc:Subject:Date;
	b=j8Phy7ECpinCorObuHJ9Cx71vOKmzB1OFcxfuqvLqMEPKQYI9J7lXsGkLheWMwr32
	 4Pp9wcVISCxlshYyFBU/FRHasX42w+bSEpUqP+2wIESFAf9VZTSeh4t/AsQA8vHKlu
	 ddb4TCMJ5BFowczHtJVskYcHIUGTXKMI/z39ZZCQ=
Received: from debian.localdomain ([130.126.255.141])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 76C89252; Fri, 07 Feb 2025 03:29:44 +0800
X-QQ-mid: xmsmtpt1738870184tmphv9uhz
Message-ID: <tencent_AE90AA59903A628E87E9F80E563DA5BA5508@qq.com>
X-QQ-XMAILINFO: ONXjbYTFhCz05A1HOGH3Uq7V0ThlxAWGNw21QxOoVGfe3lNjILDMymu4O3Pxay
	 GlNyDXNldkP6Vlbtjb5/g1qwOKoikYknDU6Nh3m2gU7k+5sjIDH1axEFip04jmVp2l8ysSPzIqLW
	 uqPGJqvjK4uCtfOiKDkye5m4cgw3xGUVMbY6LYmuVjYY/lWCULTP0/B9CL6gZXjJV6lCX1EwJdM/
	 oTc8W7pSONXg/OF9VacGckJoEDGj6Bm0uEMxVSxUewQeUnvwgsV0gTFeUybNXEsteCPeJEp4KjSb
	 MUzg84lqCPyOSpeH6JKKo8inKo40BKP526GJbzdtg4AyzVqM33U0Rlq8YS1PXraavRDkWQ+m7LZ8
	 ZGFdO8RuD6DHLDOmOeNzxEQNFwnMePzTtputDcWmH9f6kGWBUwNDOhTcvxENa59xTuIv7fskAwUX
	 zbBGZFjdFbvLOXBHkXrPIsuqxVD1O0FLFUbSwPjUw9lduEKvtHGJ4g0IVSylKk43o7QbMyrP1VfC
	 k4aUdBz6iVloQVfkIpihxmSdxFtzFyeRZ1nAsr7nLeYV+hq5IaPqTYtRID5ftk0kpg3g3jQLOyfK
	 X24g82kvJKMeGY31FKnoFEdyoydj3aoO1c0tiMbQ8MRQPY2a2WfEx9gjeix8stGPyXUW2jYMC4Bk
	 nqmxP9oJtZBcPFlUwodsT7m2K6quPdRbQyjEADTy9An6+rpN1+4ncpP6+pM3iVcDUmsrvpRouMfZ
	 VJKkCEdXm0/DCeqHIUS2+EgUPLj+wSeyhjk2IbqXjLLfhmswNiQOdp8LhhV0Q+AWLRuRww/NiN6v
	 enO2WYUqZSX+Mazr9vz6JBU+e6RWfFt78WY85hlHDEl4D3y558Bs5bvIgRLyH1H0D249HA1vqmJ9
	 Jg7qAP/oTEmGqpxcqsBnTqvAKhQltKgCv4FS3Orwgls1bfcXs9XnHSOUA35khQVwR6+KtHRQHYLu
	 StqkHzyhIhyXgc/0K0OHomrC5TBT2/
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Juhan Jin <juhan.jin@foxmail.com>
To: guoren@kernel.org,
	guoren@linux.alibaba.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Juhan Jin <juhan.jin@foxmail.com>
Subject: [PATCH] riscv: ftrace: Add parentheses in macro definitions of make_call_t0 and make_call_ra
Date: Thu,  6 Feb 2025 13:28:36 -0600
X-OQ-MSGID: <20250206192836.208698-1-juhan.jin@foxmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_113002_555735_4BCFB84C 
X-CRM114-Status: GOOD (  10.24  )
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

This patch adds parentheses to parameters caller and callee of macros
make_call_t0 and make_call_ra. Every existing invocation of these two
macros uses a single variable for each argument, so the absence of the
parentheses seems okay. However, future invocations might use more
complex expressions as arguments. For example, a future invocation might
look like this: make_call_t0(a - b, c, call). Without parentheses in the
macro definition, the macro invocation expands to:

...
unsigned int offset = (unsigned long) c - (unsigned long) a - b;
...

which is clearly wrong.

The use of parentheses ensures arguments are correctly evaluated and
potentially saves future users of make_call_t0 and make_call_ra debugging
trouble.

Fixes: 6724a76cff85 ("riscv: ftrace: Reduce the detour code size to half")
Signed-off-by: Juhan Jin <juhan.jin@foxmail.com>
---
 arch/riscv/include/asm/ftrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index c4721ce44ca4..2636ee00ccf0 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -92,7 +92,7 @@ struct dyn_arch_ftrace {
 #define make_call_t0(caller, callee, call)				\
 do {									\
 	unsigned int offset =						\
-		(unsigned long) callee - (unsigned long) caller;	\
+		(unsigned long) (callee) - (unsigned long) (caller);	\
 	call[0] = to_auipc_t0(offset);					\
 	call[1] = to_jalr_t0(offset);					\
 } while (0)
@@ -108,7 +108,7 @@ do {									\
 #define make_call_ra(caller, callee, call)				\
 do {									\
 	unsigned int offset =						\
-		(unsigned long) callee - (unsigned long) caller;	\
+		(unsigned long) (callee) - (unsigned long) (caller);	\
 	call[0] = to_auipc_ra(offset);					\
 	call[1] = to_jalr_ra(offset);					\
 } while (0)

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
