Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27255C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 04:10:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA2920871
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 04:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h0Ryj5IK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJByXlLz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA2920871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rvfRo6d9eJk/+x2R+lU+bwMbWtqgHG14MdZFE08dl/Q=; b=h0Ryj5IKXGQlcy3+eGaY56FbL4
	W9wDwuuMheWPWAVZFlZ7GkyvFh9DvecVuijVQMWw4jQ+unBEH0VHmVf0dFFiShzdhsQ9eSxifPZi5
	a5hj/2O4toKkSyiC1Kos8l5/Y8Jl/8A6aG1T6cccPiAuxsOclNhgU/pLBJnfhJK4M1a1rxHY17BZz
	iC6mW4SGb9AIjriuH51DVw3uuxD3hYHm5copy+XUS0lIdnSOAR4iUmhY2ncgBmCcKS/ndW1bWu0Nj
	lDw+iF+EKE954M7hAlsCq1BTpw1f3OXNZ9HflMF7F12Z+EY36AWAA8RabEyxA21DlSQxxhplxkCmf
	t9jw7dRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gM3YA-00016v-EH; Mon, 12 Nov 2018 04:10:10 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM3Y7-0008Cr-H8
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 04:10:08 +0000
Received: by mail-pl1-x644.google.com with SMTP id n4-v6so3659014plp.2
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 20:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ftuYd77dxjW1o+kkM3mk15tl4baMVeCsWEMwA8MCLkE=;
 b=nJByXlLzLLFsN246P+rL3pwhkd1uuRNKjzSvFtFJIUWdPzSKk2ImhjJZN1lGJ+AS6T
 3OZXSmoBIXx/Zrru+tCJAfUd8fF88CV6cbWSJHqBLx4AajgSgxkfaDD4xy1Jblhj2/fR
 FTJ0mWr+AV+mVsFLiWVcyGma60qchtd6Pi4Je4CJQ+RqzMaxJXrBy7l01an2fUidFBh5
 lcwgSF+4PjrHrBD1I4ziODxK5yTP5gKcgTw7EqdFjXH7voEY62zdh09uBlqigqTsLw++
 00ca1wuWfrrUg+6QZVgFsV93hxTYK12Qr+T7TKYz4+AE+Ye4zATa7FeoCLD57SosbHBw
 MLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ftuYd77dxjW1o+kkM3mk15tl4baMVeCsWEMwA8MCLkE=;
 b=n85tHMvDDaKBD+Lwsx6ZGr94vLT9BEL6b8U/yKnkcg1D3+2tlAMcXZEaMMMOrvVyQZ
 q/vOcbAB4efUM5Hn2U9zRndmG4i6sa1jNo79b2wvMo4uDB+Qh/f/hR0hhDub8s32Axjr
 /h8BuJkutD93C24RXXFuknGEh+uf68uRd4alMMbMZxAVmDejGPdP3ExK0lQ9FRD2O9iw
 gnvY7Cp/oCBBwlNpsUrMRJxltK/WXBUQLBHuTxWukiW193iKPOHmo+SHPdKiXcyahxrk
 RjdteY9HsIiYkSn6PARDSnCg/0tJ1lHL8DlQac9ZUt0cqcGJJOofI5fRw0xuFelOeluy
 fLnw==
X-Gm-Message-State: AGRZ1gLSO0vr1ZX1ODpzq+KDtXU35Of4atzq02K7/ltuolY+nL62pE24
 foHAFtWkoLofypIXSrdF9mk=
X-Google-Smtp-Source: AJdET5fylLqW/Ack1hU5NK6gOdPMsgF5G0+oGr7FBFTtXFF8N+Z805eHW3Hiwg794KOXbd7Wfq9oUw==
X-Received: by 2002:a17:902:6801:: with SMTP id
 h1-v6mr18334087plk.177.1541995795799; 
 Sun, 11 Nov 2018 20:09:55 -0800 (PST)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id i189-v6sm27536599pfc.16.2018.11.11.20.09.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Nov 2018 20:09:55 -0800 (PST)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, zong@andestech.com
Subject: [PATCH 1/2] RISC-V: Request stat64 on RV32
Date: Mon, 12 Nov 2018 12:07:43 +0800
Message-Id:
 <41e8cb18d321244ab7000f7dc0467b6ebc5cab8f.1541995312.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1541995312.git.zongbox@gmail.com>
References: <cover.1541995312.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_201007_577968_5F6AB8C4 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181112040743.tDPyXKJaDaxn_NWpit8EOqr2sYwyaY_LQx0g7pqNQGE@z>

The stat64 family that is used on 32-bit architectures to replace
newstat.

Since commit 67314ec7b0250290cc85eaa7a2f88a8ddb9e8547 ("RISC-V: Request
newstat syscalls"), the RV32 build fail with undeclared 'sys_fstatat64'

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/include/asm/unistd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index eff7aa9..a4aade9 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -18,5 +18,6 @@
 
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_STAT64
 #include <uapi/asm/unistd.h>
 #include <uapi/asm/syscalls.h>
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
