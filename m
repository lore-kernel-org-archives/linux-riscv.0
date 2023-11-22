Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0058C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wP710KOtUKnEz4IHDwKg+DmMKduzWuavt6lUbjeBnAY=; b=Dm1nCo0HWaYSTK
	dtgTE1HqUs9dQRR+xziof9B6f70fym5Yw1mve9iCQ7m8e4ECtaY057vqnFeldV2HsBQWkflxeKo/v
	aLduvh3QZAWE0oXACoO/2NSiC6tKP1pr7NY+AIPwjdrD/51ttLsG/lpFTGYMwH1sfwcSRzVqyvH+G
	ma+fbH5rWXoAE38q3MYjwZPcvVt4F4Ur+kRJEgN+Xht09tBjxtclSayMQRTVYEmI16MZms8mOMAso
	7P1InPOeamapbSZ01gszzSQZBVyVJZ54tZCAu9FnmFM18Dr8wscyA1qBWB9zZ9tlk3hscwIL5dhCm
	XDJ5JTVZ/Ow8fqeoU73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jaT-001Di1-29;
	Wed, 22 Nov 2023 09:32:01 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jaR-001DhG-24
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 09:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JvsFSsDdVFDKnkvbJ955yEBRkTrxtPtYP1pOe/StveY=; b=INTCEKHHxC5RAskILlYK5iOf5o
	QG2elpVH+HmItZ0DrBbbBVUmd1bmaWio0sdwmYkwpA+1D8cL8pVJt/BywUinMeBs3jecwymR2UUkE
	kiGNkEpXqiVsHjNNlqMWWdjxUvrT3NND16rpw3ab5SIwQIpO7A8Qxv1DTThSXA4FkYXa9CdqCDOuf
	VEqgQPthF4pC1E11o/yELz4DcbvjaHVMUETXBNz3XtLtJYjCXSlJpvlDAwGFqCWMHXE09E+DqlJc/
	iRk/65gXY8mwNDcQ6isA8BmXKnx6iy0FMH919Od+ivZXIriCOHXNyXG7GJVUgbP2MsdW69ErBexa+
	VgUPmW/g==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1r5j8V-004BYE-Cs; Wed, 22 Nov 2023 09:03:07 +0000
Received: from ben by rainbowdash with local (Exim 4.97)
	(envelope-from <ben@rainbowdash>)
	id 1r5j8V-00000000nGC-1CGd;
	Wed, 22 Nov 2023 09:03:07 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: make unexported items static
Date: Wed, 22 Nov 2023 09:02:55 +0000
Message-Id: <20231122090255.188851-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_013159_765204_4F7139C7 
X-CRM114-Status: GOOD (  10.10  )
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

The relocation_hashtable and used_buckets_list are not used
outside of the module.c file and therefore should be made
static to avoid the follwoing sdparse warnings:

arch/riscv/kernel/module.c:48:19: warning: symbol 'relocation_hashtable' was not declared. Should it be static?
arch/riscv/kernel/module.c:50:18: warning: symbol 'used_buckets_list' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 56a8c78e9e21..b5109a3889c9 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -45,9 +45,9 @@ void process_accumulated_relocations(struct module *me);
 int add_relocation_to_accumulate(struct module *me, int type, void *location,
 				 unsigned int hashtable_bits, Elf_Addr v);
 
-struct hlist_head *relocation_hashtable;
+static struct hlist_head *relocation_hashtable;
 
-struct list_head used_buckets_list;
+static struct list_head used_buckets_list;
 
 /*
  * The auipc+jalr instruction pair can reach any PC-relative offset
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
