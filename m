Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B19EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Dec 2021 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6VQXvE4pgk4Xz/4Yjuc2NQyxVA0CT8nOvD9fO0CNEyM=; b=TdefLw4JIGC9lk
	d7JlAcSH877o4Lvpisxt+pi4luDa86DfdCFFycEdYNriDmAt5cla/by0VebV5TGpScMqTpRrZdOCJ
	pQgzpHh+OxuJ2a4pLt6yl/7R/8SLHT0HgQPAGR6Rpdzyx64Hw3E3+mHD4LPYexf9G6sriDK6hx4Hs
	RmfijPylgRo8f3O4kVoTJKDXBaUvlBMKDF3yW6Tdwa+yLgWEuRQef/mxGe0MSz8q3xMV1K6NJyE4k
	xLYR2LDKsRG22+Fvd0zwa43l1T9sen4aUGec1ru6DJo62+Tn+IqkmhMFf0deMzzgRLwybBl8R1eCd
	tbFkXCeQ4Ap5xe9a1uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2xoc-004hkh-3g; Thu, 30 Dec 2021 15:58:06 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2xoZ-004hjz-T5
 for linux-riscv@lists.infradead.org; Thu, 30 Dec 2021 15:58:05 +0000
Received: by mail-qt1-x82e.google.com with SMTP id f9so22057561qtk.4
 for <linux-riscv@lists.infradead.org>; Thu, 30 Dec 2021 07:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JS+FiKSeT5f12gRyVzfSR3kPguW23wtXqyvRjIMFpqI=;
 b=mY4GeSgx7uJKI8pLh6VENQs/UsOw59UxMLfMIP92SxOTvBd3AtvzG84MJMmKy8rQPM
 l6uOY/iTCJ5208cHc8x/gVcl2Sfw0BXV1It7s/zUrRFRlmpQUba1zuur1jHWnHymD7OZ
 MBFDUhLa5hsEr2NPIoX0oYa6bhi4Wkf+qVCA07asQzJIxyXbsNut3qw0GqiCJcH5NHaj
 Ifb0GyPQq06hi9W5IygEOWdFg+ojHEM61XH9WWkShFe+ePHNwnjGJ9euNw23bsJ+mpO6
 9S04byKVRDWja/EJY9/dDdbIQSpWLz4Evr7ATnRNG6sDycKG1IYtWzvLuo1DSrXyfN3W
 qr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JS+FiKSeT5f12gRyVzfSR3kPguW23wtXqyvRjIMFpqI=;
 b=FWGpT3/sJWCdwxdbJ63RuhwTlrEP0NL2qAsDNTLWOppL5NqxLZSDKscj77xasqC4br
 k5Mu+AmTz6XagTOpc84Q6fEVzCOXSEYitTT5RaJb+Vvfuf+s2C6bk3S3tabDNvLVAXV7
 h8a5tqX+Qq2b6QMIHi/tgLocjsCQLM+xRhrzLdGnjlLUPPZvGm8C11owB/M3DDpCCVXg
 3Ou7eaSK+wI2IDOdHAqOPQPN/gdqJFrXA8MZ6tLZI2X9eJodFrS1tfZaIGoJ++r3teE+
 bwLpSs9OJvBJrWsf/eF70vWkzziwsi9RKYv9Z2ul7yZuYluWjDVVCJqF2BAP3nh/FZVg
 vbKA==
X-Gm-Message-State: AOAM531jL1OrlzmXniglcxH3/MDx6HmeQk3xdPAU7mDcUSBMqxiwzjMa
 2WIjxc2XDIOPw8mJH6QMti8=
X-Google-Smtp-Source: ABdhPJxcBEOdjQ+MgEJANgHQuPK0IPhBHynueDf+BM9DEl4Um31/Zb9ZnZS3E2MR8vMZpjZjYhXWqg==
X-Received: by 2002:a05:622a:3d1:: with SMTP id
 k17mr23980588qtx.335.1640879881789; 
 Thu, 30 Dec 2021 07:58:01 -0800 (PST)
Received: from localhost.localdomain (071-085-241-167.res.spectrum.com.
 [71.85.241.167])
 by smtp.gmail.com with ESMTPSA id k9sm20495402qta.48.2021.12.30.07.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 07:58:01 -0800 (PST)
From: hasheddan <georgedanielmangum@gmail.com>
To: 
Cc: georgedanielmangum@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mark Rutland <mark.rutland@arm.com>, Tong Tiangen <tongtiangen@huawei.com>,
 Guo Ren <guoren@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Andreas Schwab <schwab@suse.de>, Zihao Yu <yuzihao@ict.ac.cn>,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv/entry: fix misspelling of instruction
Date: Thu, 30 Dec 2021 10:57:11 -0500
Message-Id: <20211230155714.1019859-1-georgedanielmangum@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_075803_978045_6D55C892 
X-CRM114-Status: UNSURE (   9.29  )
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

Changes spelling from instruciton to instruction in comment in entry.S.

Signed-off-by: hasheddan <georgedanielmangum@gmail.com>
---
 arch/riscv/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ed29e9c8f660..728c521dcc85 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -568,7 +568,7 @@ ENTRY(excp_vect_table)
 	RISCV_PTR do_trap_ecall_s
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_trap_ecall_m
-	/* instruciton page fault */
+	/* instruction page fault */
 	ALT_PAGE_FAULT(RISCV_PTR do_page_fault)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
