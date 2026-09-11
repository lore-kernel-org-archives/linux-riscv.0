Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2030C982D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 23:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6iGd5GxDtzVE2TsTDa6EgbTT7L8lRwK0C6eq2M2uoM=; b=kPHZ+UmKtnycJO
	92Q2nnhiDK58veHkqmSFcX0rWevbO8xH9E1vDwKv7IjvBOjkMaLkJ3ssBEwUWyMW6Z2Ck+q/FQOyb
	CS/+11KnscKpeAZRlw+Cz9SDeqpmMgdgJXheTYcxiA+6M2Eyf8iE4RhHf2bTkAG4HH8dO4BXBsV8z
	y3pzIG1N4zP0aFYi1VNob0OwJqLpfTi4Q5DYXUw2X1cpWOw3MmgU/yOI4dgWLkFrMG0j8QhtH9UMN
	W8xgtsk5Qv4p/G38qAHA6gBcLXfQi0M8uafSiN9ekVn74Pda7e8+SLSZsE6P6KsYD/vSjWkNzt7zm
	iuhLkDtbjLpNqj4Uo1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Lg3-0000000Coey-2AGX;
	Thu, 17 Sep 2026 23:38:03 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rIP-0000000FjXY-3090
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 02:47:23 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hgzTw1N8Gz5BNRf;
	Fri, 11 Sep 2026 10:47:16 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 68B2l7ge014254;
	Fri, 11 Sep 2026 10:47:07 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 11 Sep 2026 10:47:08 +0800 (CST)
X-Zmail-TransId: 2afa6aa36baccc5-afeb9
X-Mailer: Zmail v1.0
Message-ID: <20260911104708495mqMlpf35iUZHINWhnesfL@zte.com.cn>
In-Reply-To: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
References: 20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn
Date: Fri, 11 Sep 2026 10:47:08 +0800 (CST)
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>
Cc: <mikey@neuling.org>, <jiangfeng@kylinos.cn>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <zhang.yue5@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gcmlzY3Y6IGxpYjogRml4IFpCQiBzdHJubGVuIHdyYXAtYXJvdW5kIHJlZ3Jlc3Npb24gb24gaHVnZSBjb3VudHM=?=
X-MAIL: mse-fl1.zte.com.cn 68B2l7ge014254
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 11 Sep 2026 10:47:16 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA36BB4.000/4hgzTw1N8Gz5BNRf
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_194721_920460_EADA83FA 
X-CRM114-Status: UNSURE (   4.03  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 17 Sep 2026 16:37:31 -0700
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

Hi Paul,

Friendly ping on this one - just checking whether there are any comments,
or if it needs any changes before it can be picked up.

Quick recap: commit 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading
past count boundary"), released in v7.1.10/7.2, introduced a regression
where strnlen(s, SIZE_MAX) returns 8 for any 8+-byte aligned string:
the wrap-around boundary (s + count - 1) & ~7 folds back to s - 8, so
the pre-loop guard always passes.  This truncates names built through
FORTIFY strcat/strlcat - e.g. device-mapper's sysfs name "live-base"
becomes "live-bas", which broke blivet/anaconda installs on RISC-V.

The fix stays entirely inside the ZBB path - no fallback, just 2 extra
instructions - by saturating the boundary instead of letting it wrap.
Normal counts are unaffected.

Verified with a dedicated test module (all cases pass) and a 6098-case
semantic simulation comparing the original/current/fixed variants
(0 failures, 0 faults).  Happy to rebase onto riscv fixes if preferred.

Thanks,
Shao Mingyin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
