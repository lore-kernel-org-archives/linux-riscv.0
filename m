Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBACC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XCBmylLTj5uU5QjE5DJA0QqTxGTV2b3otcR2YbBTfM=; b=RWvcMZQjPJ9or3
	1xFJpoNpWOfj/ifYecC5IIGhsp1nfInhLFTTyJ9wHRqOdTnyWNAXKrgsTLIccLxwvg2iBbDImF4f7
	rO1nRz1x73iSNW4ttOwloVsOKrL965Qxj8xIo0r34vFbeCSbpqS/kTZdBArE9qPBs1b/2Pk/Bh2+2
	X9TEYCYBZvAMhw1n4PyXHMWvKIUYb7tun5osaWWzsaZVIfsv++CRzTC92VewfhfzfgNND9mCtFhyV
	dGyVjxvtrSXT/AOlZ34/mdw4Fr1EToikI/fhZH0+1NQR2zpuf0JUkS8sxS9epvgcZX3dWsyxIoGwy
	3d67YcSt0+LmbHF3CWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywcm-00BkLN-2R;
	Fri, 03 Nov 2023 16:02:20 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywcj-00BkK1-2E
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:02:19 +0000
X-QQ-mid: bizesmtp66t1699027320t0x8xgof
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:01:57 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: WQH7Uj+YMzXZTIeeYrzzH5itva0gXKImwAhNhNH+6I4DrfveqC5LRL/AcrFVZ
	2/7bONsuYtIn2ySjQU5hL5gWFOT7EvhlXQ1iFCFG8OaKZP82pUKHeAwChH+M65VreM8t5le
	MEaIGsQTivG4RvqDkHbOYJyCINDKGWbhCKa0dUgjtXcRjNQmYo+pBt7KJc23OgX11rPo9HH
	eolIdA7eZrnIQZKidwNzLUodbR1P5fT1YDTe/GJ96w1sqVpiiORBTxHvJJR8fCReTgImbhn
	xk8Hctv3kJsMKpvxmjJqlVVP2vs4VDq6gBW71Z2pzucXzcbSYEcpsDNDwo0ITDvRO3EglyR
	gZFh+VYSI8gOs/YSPsMhwdqkvgrOUqcnzKKQlenAv7mO2o1OXg=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8381555887930633905
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 09/14] DCE/DSE: inhibit .size directive for SHF_GROUP
Date: Sat,  4 Nov 2023 00:01:55 +0800
Message-Id: <7807078d4612beaa3f450df9f3f3cf70b2bccb4a.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090218_039211_73918C8E 
X-CRM114-Status: UNSURE (   6.00  )
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

.size directive fails in some functions with SHF_GROUP, this is not
really required for normal building, inhibit it to silence the compiling
failures with SHF_GROUP.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index a4e522b747cb..f67b6e8d2c45 100644
--- a/Makefile
+++ b/Makefile
@@ -936,6 +936,9 @@ endif
 # `rustc`'s `-Zfunction-sections` applies to data too (as of 1.59.0).
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
 KBUILD_CFLAGS_KERNEL += -ffunction-sections -fdata-sections
+ifdef CONFIG_SECTION_SHF_GROUP_SUPPORT
+KBUILD_CFLAGS_KERNEL += -finhibit-size-directive
+endif
 KBUILD_RUSTFLAGS_KERNEL += -Zfunction-sections=y
 LDFLAGS_vmlinux += --gc-sections
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION_DEBUG
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
