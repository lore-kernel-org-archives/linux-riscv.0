Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8A9C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUHQszpvseprtTu6HVGyD5dMIQJBb3hilSMApXi+BMg=; b=AAb4XFWSCBHFrJ
	va1Pn0bulaKwYppEtz8Ubax/KyKdVw/sDwZPqhqjpZ7yISaAqp4x839046qupQa5Fdcxln8cQzdky
	sY6LQDLXwOG15Mr+6B4fifaW8ZdfBGcvmTYpnrsx81nCZvvimgNB0wsdniCPG8WONyz6F939coc9t
	XoEVGH+C/Kny8f1+awmFfsgSYD9ngL3NSOqHc9NJV19jeymaResoH5xVQXC+VpLIkizpXCxm7g+tF
	lVY8DkdgJJHRXE7g8vE1sl0B4woT0VyBYOHnAMb2kpCcTbp5wVleVOeaUB6ZTLvUW8AszmtBlHo4f
	CcxF+IcgSyJ1LnBBmMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q21At-00FJZ6-14;
	Thu, 25 May 2023 02:57:59 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q21Am-00FJVI-29
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 02:57:54 +0000
X-QQ-mid: bizesmtp63t1684983430tny3hp8d
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 10:57:08 +0800 (CST)
X-QQ-SSF: 01200000000000303000000A0000000
X-QQ-FEAT: Q40xx9djesRnvDjNn8FEKK30CJtqMZLJIor2xKhK5CaxBB9mt0DXuMlLPYqPB
	XwU+t+ZR2ppVV1gWFz/3tdYgXvOqNyx2sj1tDRvmvPJSxWf9mmIV9/kKzgpyLRFF6pAKMpv
	dB0eKB2SSKXJh3FTbdTch41OWKYEWPRex1/kKW7pZjOibMJK72PzfbAwoYu0dNrdZKe15AK
	dTMzuKSl3z/YxPs5jNKNOm7HuebEE7nCnLbDXy5qf6ij3OKz81p/au9NFgD8Zl6iWkiPEDq
	GcW6VwoPGDF1TVFO2o+HzRuvCW71F1mCYe/bYfS8TJHE/z7e4lhSzEBaQvPwUFBEwu87AX9
	fT3d27frdI1M3q8tgGm3Jw0nwmLKBJdf6njsyPLQRlj+Yw3Q4gHY9U0yQCyzavwq1c5rNIA
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4042248179779979880
From: Song Shuai <songshuaishuai@tinylab.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	songshuaishuai@tinylab.org,
	steven.price@arm.com,
	vincenzo.frascino@arm.com,
	pcc@google.com,
	wangxiang@cdjrlc.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	jeeheng.sia@starfivetech.com,
	leyfoon.tan@starfivetech.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/4] arm64: hibernate: remove WARN_ON in save_processor_state
Date: Thu, 25 May 2023 10:55:53 +0800
Message-Id: <20230525025555.24104-3-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230525025555.24104-1-songshuaishuai@tinylab.org>
References: <20230525025555.24104-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_195753_040719_5669A667 
X-CRM114-Status: UNSURE (   7.28  )
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

During hibernation or restoration, freeze_secondary_cpus
checks num_online_cpus via BUG_ON, and the subsequent
save_processor_state also does the checking with WARN_ON.

So remove the unnecessary checking in save_processor_state.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/arm64/kernel/hibernate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 788597a6b6a2..02870beb271e 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -99,7 +99,6 @@ int pfn_is_nosave(unsigned long pfn)
 
 void notrace save_processor_state(void)
 {
-	WARN_ON(num_online_cpus() != 1);
 }
 
 void notrace restore_processor_state(void)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
