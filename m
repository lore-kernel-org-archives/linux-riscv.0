Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492F7CA5FB1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+tDohy8Yh5lUGmRAODaz9tfrHg+MXqqOVdZLhxCKjM=; b=KX7NG+RC0xIdJh
	DHADBEzfuq9FlQ/WIAQfdI6l0BfSsjS1QW9cyfre8GLkqBAyGg3cOQ24VoRoB/H+3yrBMxUM+Uc74
	evErhJi1/6USj3svOhy9FQZm2R7uqLh49OlmkodYs7KJ1gBZDwMx54q5fC3pHxztXQ+zwtJS6RrOV
	+tfKpLXGu1O5fsBFOK29C+WblV72Pq7m43veWEU1YvSk5gs5JXzfeztu2f8vRP5AWi0GYuo2ABRh4
	RFwLbP4t7WkeyJXEAkFQsyQjsH+jvFXiaMxRLcvhUAEgQSYhB4NVB52mio9dAbrxifqOxSYdMV6td
	/9jAOAu0Luh3aS4HMKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMNK-000000020fz-01PA;
	Tue, 29 Sep 2026 01:11:18 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB29M-0000000HGdL-0IJa
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 03:35:33 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4htRlZ30KZz58fdG;
	Mon, 28 Sep 2026 11:35:22 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 68S3ZHeT002821;
	Mon, 28 Sep 2026 11:35:17 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 28 Sep 2026 11:35:18 +0800 (CST)
X-Zmail-TransId: 2af96ab9e076ed4-cce08
X-Mailer: Zmail v1.0
Message-ID: <20260928113518331HR61sfVYm8Lrb44vgAEuk@zte.com.cn>
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
References: 20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn
Date: Mon, 28 Sep 2026 11:35:18 +0800 (CST)
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>
Cc: <mikey@neuling.org>, <jiangfeng@kylinos.cn>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <zhang.yue5@zte.com.cn>, <david.laight.linux@gmail.com>,
        <qingfang.deng@linux.dev>, <aurelien@aurel32.net>,
        <troy.mitchell@linux.dev>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NF0gcmlzY3Y6IGxpYjogRml4IFpCQiBzdHJubGVuIHdyYXAtYXJvdW5kIHJlZ3Jlc3Npb24gb27CoGh1Z2UgY291bnRz?=
X-MAIL: mse-fl1.zte.com.cn 68S3ZHeT002821
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 28 Sep 2026 11:35:22 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AB9E07A.000/4htRlZ30KZz58fdG
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_203532_285727_5530EBB5 
X-CRM114-Status: UNSURE (   4.30  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 28 Sep 2026 18:11:13 -0700
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

Gentle ping on this one - it has picked up more tags since posting, and
should be ready to be picked up:

  Acked-by:     Michael Neuling <mikey@neuling.org>
  Reviewed-by:  Aurelien Jarno <aurelien@aurel32.net>
  Tested-by:    Troy Mitchell <troy.mitchell@linux.dev>
  Suggested-by: David Laight <david.laight.linux@gmail.com>
  Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>

It stays a minimal fix: only the two boundary-computation instructions
in the ZBB path are replaced (18 insertions, 2 deletions, no new
registers), so the scanning loop itself is unchanged.

This one matters for stable - the regression is in v7.1.10+ and v7.2:
strnlen(s, SIZE_MAX) returns 8 for any 8+-byte aligned string and
truncates names built through FORTIFY strcat/strlcat (device-mapper's
sysfs name "live-base" becomes "live-bas"), which broke blivet/anaconda
installs and LVM on RISC-V systems.  It has since been reproduced
independently on a Fedora 45 riscv64 image with ZBB enabled, where the
fix restores correct behaviour.

Cc: stable is set, and the minimal form should backport cleanly to
7.1.y.  Happy to rebase onto riscv/fixes or adjust anything if needed.

Thanks,
Shao Mingyin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
