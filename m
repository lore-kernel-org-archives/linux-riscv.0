Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB721C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 14:16:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F89D60E90
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 14:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F89D60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zBbq0BGqntyCrUruJi5CMx3zb8mrPSMFPzmVluxdDbk=; b=LjjdIw/CPysirs
	506AXNTG7jpj/+vMrHo9VpTKBwmNfOGigZctLu8ajS5d2uvrKSLMYLRDFlT8GZMha+PzGuhw4pLBz
	LGG59lOz67xwKsDNNWnH9+9P2NxqZ2MURFvWbmwGLRC9qA3N87OPOPyGlPe3JIfZxsFr17wFUWEKm
	+5YjXLf7crT8jRKdSOcs7AAkbe+X+gwnIXwrsYVWDKquRrBfHLbrAx9MbXRrQOiPNNxrMRSXoE/HT
	4HNUzrEXiPOt6UmJFzRFKox8K+zXBnw/ZDvD6ugMpzpcR3pzlRUQAeWPEvLomm/466DJzkk4TER48
	MAgtmlt/qYqsMGUhhH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGAw-00AL8A-R0; Thu, 26 Aug 2021 14:16:14 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGAq-00AL6o-SZ
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 14:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=1D5mqM7j5AlUyq4PwMTMn72pNxWZmjR/G8aqJKeKLmo=; b=e+EhbQtUU8vG/
 ItzK+tMjN9L1qz4EdRqkvE5wGoKA9fOFsY5l0TBSu6+rFItcARb+uuYYSLqJMWlH
 kaIaNs77nAEZ2o1dbF4NQokCDfCdm3KOkqP3q339unFwiTg5v3tPPvXHfdMYlv0K
 iPoTxdfnoonV6mF/QTF4FrwscYIJF0=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBH+PwnoidhaKPGAA--.59140S2; 
 Thu, 26 Aug 2021 22:16:07 +0800 (CST)
Date: Thu, 26 Aug 2021 22:09:52 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: improve __ex_table section handling
Message-ID: <20210826220952.77a68a9e@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBH+PwnoidhaKPGAA--.59140S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5G7k0a2IF6w1UM7kC6x804xWl14x267AK
 xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj
 6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gc
 CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
 r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87
 Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2YiiDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_071609_391801_7E9EC10F 
X-CRM114-Status: UNSURE (   6.77  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Enable BUILDTIME_TABLE_SORT to sort the exception table at build time
then move exception table to RO_DATA segment.

Since v1:
  - Only enable BUILDTIME_TABLE_SORT for MMU. Thank Palmer for catching
    tinyconfig case.

Jisheng Zhang (2):
  riscv: Enable BUILDTIME_TABLE_SORT
  riscv: Move EXCEPTION_TABLE to RO_DATA segment

 arch/riscv/Kconfig                  | 1 +
 arch/riscv/kernel/vmlinux-xip.lds.S | 1 -
 arch/riscv/kernel/vmlinux.lds.S     | 4 ++--
 scripts/sorttable.c                 | 1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.32.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
