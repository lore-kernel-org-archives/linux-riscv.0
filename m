Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE158C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 05:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jQBNThAUso+qmzpS0Dp6ZkGyV97zsSGwpgucNauKtRg=; b=duK3ESB1a5oPT/
	nlgF6nbCaMh4v3lOBk+uGZI+bLuXh2XOlZrtn1nRpoUNjFKNetuRdP0wYta1N5ykDjv7ghMRFJ3cF
	txC58xAybLRHhGnJMmXcAy8/qRddN4bVxBWq7YJcxfViH7yJHBAMRj5rwwHl2lFnJPAfnKFxWU0zx
	XVCyXK6VSxPkzDO5fWF5x9AHyj+UEc2WZyWGsteG3MRmZGMWIq4Gvp3sXfoAs4ZiWWO7W/rD8Qf4w
	nKGrSzZlsK+QuCf6puqj9lFrMqJUQ5tX4S28Pz528Ilx86aWB9i7ewMdBmF2usMG/bpKE2KPtxWZg
	BTeydHtsKPf83oMymQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ZFc-0000000AmEN-45tg;
	Fri, 04 Apr 2025 05:05:56 +0000
Received: from send172.i.mail.ru ([95.163.59.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ZFZ-0000000AmDx-2MJG;
	Fri, 04 Apr 2025 05:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=qCRKNJ6TKOGNtu/HB/ShbWp64AAzz59sXZSjteisduQ=; t=1743743148; x=1743833148; 
	b=i+XIb0q87/2WBaViWXODXqRPW3Ww8u57YItt0nImsJyEK0lazjzLNkloUoDpvDQ9AXAqaTzqBEc
	ffDEC/+1/KusUjSdnp3OjFiVCkxbTpqje5MdLo6jPfvU25lfDh46rwjm+mtHlkREyajjy/06EP7cy
	la5xkeZ97Clo0Na8DuFUYpd383KJ/4Q+sPNQF77n/XhE08LFQJiJtAqnS2ADCMZ0vOmfxuJOo5TWH
	ug0J3V6PdFXZItOC9X5WbYxJTSSXFdQvxbAEzIV21d/zPXzHYWLv5bDIEB2apGb3svMGngaT27MB7
	KhysvmZ0kIUUmUtdKmFK3yVJ3hq+262pOaEQ==;
Received: by exim-smtp-895bd549-rm27q with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1u0ZFQ-000000006VZ-46k6; Fri, 04 Apr 2025 08:05:45 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	peterz@infradead.org,
	elver@google.com,
	namcao@linutronix.de,
	tglx@linutronix.de,
	samuel.holland@sifive.com,
	daniel.lezcano@linaro.org,
	apatel@ventanamicro.com
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH 1/1] time/sched_clock: move sched_clock_register() out of .init section
Date: Fri,  4 Apr 2025 08:05:40 +0300
Message-ID: <20250404050540.13507-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Authentication-Results: exim-smtp-895bd549-rm27q; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD97BB0EF39AD2B33D5BD60E8C87DB2D982134ABF3320BD5053182A05F538085040D6D4A5DE20558E133DE06ABAFEAF670551C19575E9DC620F6A8EE8716F45326E855C50119FE1CC9E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE746D93DAA4671895CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375669E7A8FB0630A8A263D3AA1BB23A200624CF4DA3FA0C56F8A59D233FAEF5DE2688EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C07734D68A6916D8318941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B64AAE2D1698E8717BCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166176DF2183F8FC7C0E4A630A5B664A4FF725E5C173C3A84C309A7649CC036878F35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A51B832C159022EF245002B1117B3ED696285A88008676CBA07E0012C66AE17B00823CB91A9FED034534781492E4B8EEAD303003AC7AA20DD0C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34A246DFF68F0EE19E0B718E1CA6C4A0EA57B80ABE69FCF18BF2D00F8CB0FB7206546FDF43544AD09F1D7E09C32AA3244C37A6E747837C8E0A77DD89D51EBB77425216AF1FEBB2E6EAEA455F16B58544A29A21F9916E05C5175DA084F8E80FEBD3498BCAF62EB65D490083D0702184784583DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtmzbc7E3ThzAJuJ7cdLsSQw==
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB622204DB50A0B48B6F1A4CC75B5106BE2DAAA841C0BA25B4D90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_220553_998207_9CA26A7A 
X-CRM114-Status: UNSURE (   8.10  )
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

The sched_clock_register() is widely used by clocksource timer
drivers. The __init prefix forces them to be initialized using
macro TIMER_OF_DECLARE with __init prefixed function.

Clocksource devices can be consumers of some external irq, clocks,
resets, e.t.c. Such devices can't be correctly probed if this
dependencies are provided by platform drivers. Because of regular
platform devices are not probed at this moment.

We can convert clocksource drivers to platform device drivers to
fix this issue, but __init prefix in sched_clock_register()
prevents it.

So lets drop __init prefix to allow platform device drivers to use
sched_clock_register().

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 kernel/time/sched_clock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc15fe293719..07f28e0e2716 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
 	return HRTIMER_RESTART;
 }
 
-void __init
-sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
+void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 {
 	u64 res, wrap, new_mask, new_epoch, cyc, ns;
 	u32 new_mult, new_shift;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
