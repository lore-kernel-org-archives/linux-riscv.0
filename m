Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F9C6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7/GuqBoJ+K5GcsJ1pIHpwRWoW7eVDQCYtm2rlD+eXYU=; b=LJOwtOCsfaDfhL
	mKNsm+mCuDfmo7EqVdUBssijgxn/sK5iGYAso3RCzegTPzliShcD5FdLfYud9FeBwqmKKfFwabHUd
	MQZFlDp+jqMEap0VzEETgLUnu6mooCanFnB7RdX1USTtuyN5582RjMLlasOSrVOm+aDoNw/V8lahO
	tLPYEBg02+BDmJOJCtv8DG4eOS/k5bti1ey2D3zRa03It+njO5UG5Vdowv8QiYDv9cRIldc++0wsp
	qFl9mrRkiZ3guMx8T/PIIQGxhov3wPYUX2jQq/tVfP0xkKMsSZOeMtHkPWdwc3qqYrmUpLe/4Ffnl
	mWscY6uYDB7pCr4FeWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeOT-002Rcj-DT; Tue, 07 Mar 2023 20:58:45 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeOQ-002RbC-VI
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:58:44 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pZeOK-00EVE4-L6; Tue, 07 Mar 2023 20:58:36 +0000
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1pZeOJ-005z4S-3A;
	Tue, 07 Mar 2023 20:58:36 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	heiko.stuebner@vrull.eu,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com
Subject: ZICBOM and SVPBMT in same system
Date: Tue,  7 Mar 2023 20:58:32 +0000
Message-Id: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_125843_021580_3282E663 
X-CRM114-Status: UNSURE (   5.33  )
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

It is possible to have a system with both of these in the risc,isa
string and if so they do not work well with the dma memory allocator.

Fix this up by adding a new pgprog_dmacoherent which returns either
non-cached if SVPBMT only, or cached iff there is ZICBOM and thus
cache management operations.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
