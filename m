Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2365FC7EE23
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 05:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oCVwRcB3yBX1Fz8Zyz04WcGg6uf3OwT8ycjAb0DypS8=; b=F/DK+r4pwcwcfN
	oopke1SSpderAD19UW0pHGP6Bsuw6Xm8GQNI3DiNKrvonnePk81g/wjAcZNAXhmPwm4pLaNZBIH3R
	ziQKO7dZmnldf0MSdWcWv7dbkdIVt9Whb5ZMvYC/Wumh/p7UNhQPBYZIYtLCZ0bllCyBMeMsk2qOZ
	y2v05GscwDS7CrzYbS3vru5FkaWka7Sjs2rQ7vLPncpzCy5mohBHEeuvKUClXo08Sev9wrQd0PtM4
	JrWq+QyfLgBEdM9lNkuyPiYacaMOACYcS7UHP5HqhNyAIzETkd/gojF+uFIXFd8OeRDJtfNVcLxhm
	atlvH8WEkYn9dM1jkbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gNE-00BMhI-2M;
	Sun, 04 Jun 2023 05:33:52 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5gNA-00BMf5-2k
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 05:33:51 +0000
X-QQ-mid: bizesmtp83t1685856800t6hsp1hm
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 04 Jun 2023 13:33:19 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: d1972br3SUxKhQs1ZN+1eZz5TyaxPW6VlL+DPYe/HQljaUpBS3ieDCvjI2Kp9
	2AyxX93pBGpl0L+rqRaO7q1KtZauN1SsCeYRWjeLZ35mn9OkC0FEAZFCyMLg+fHS4y7KhRk
	xJO/Ri0VtJnFgiDeeVYCglGWaWHMQgpEKJut1S3nAm6aswPIcMuxy18ssPBBwR6l3pWkQnC
	vgrgqEzqRML8kjhXl5GetHcUcjz1JguABoILnGic6ziWloi2cfwIVpEQblUR4gwVYLVR8Xd
	u1XDHBFOOJv1acYFPZ8VOCAg1apHaCxPZdfGMLbkljxdDGevI90Y6D7vvzehr3PgoYYWx/+
	GdlyHCBLyAnXOkIFegBEM/GQlOP2w==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3802795509129627829
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 0/4] tools/nolibc: add two new syscall helpers
Date: Sun,  4 Jun 2023 13:33:09 +0800
Message-Id: <cover.1685856497.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_223349_204824_8DEC5746 
X-CRM114-Status: UNSURE (   5.51  )
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

Hi, Willy

When I worked on adding new syscalls and the related library routines,
I have seen most of the library routines share the same syscall call and
return logic, this patchset adds two macros to simplify and shrink them.

All of them have been tested on arm, aarch64, rv32 and rv64, no new
regressions found.

If this is ok, I will rebase the new syscalls and library routines on
this patchset.

Best regards,
Zhangjin
---

Zhangjin Wu (4):
  tools/nolibc: unistd.h: add __syscall() and __syscall_ret() helpers
  tools/nolibc: unistd.h: apply __syscall_ret() helper
  tools/nolibc: sys.h: apply __syscall_ret() helper
  tools/nolibc: sys.h: apply __syscall() helper

 tools/include/nolibc/sys.h    | 369 ++++++----------------------------
 tools/include/nolibc/unistd.h |  12 +-
 2 files changed, 65 insertions(+), 316 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
