Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34A1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 16:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD1061373
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 16:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FD1061373
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=39ZazV9kEtOPZT18fdbII99YH9r7dXPGz8813Sp4pjQ=; b=HzjZ4id56n4qTA
	phzbNmiuq5+uD1UbHsevIb4OArdxe3k2mgsroxojRvpAh4K8r44PWo9jPKsCpUcs0PhCRsy4eb3WN
	7H+/ecZYMW/SKYetIq7AHTaCJ5qM1wSKCsiqJ2k2hjwZ+DGIw0bYFmWzW6njRR4T6cZsrgkyjXEoR
	0KMGpC4Rie2/F4XJUcMRtiAOGK49iNayyskzYQbbMnUF6wbJNMCaTT9nvmjvrKrwI41c1o+yWZfbD
	6t5aRhWVpT284zSVzKnoNlgUUiQAG4jvy0SaxRBMpqijzGK2CDLJCEfmqMVYBFi+I8JOOaDopzkuk
	hZsQj4Gd0hICwkQc71nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdauB-008Lrq-D2; Thu, 21 Oct 2021 16:26:59 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdau8-008Lqe-Db
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 16:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=ojZuQOBSTgADKJiIRttyzJLSM9l35UDA4fraSzIPeEo=; b=ID4N2MvHUW+Sd
 Qlu29nygSg1aLzjOJyPFbL0KGD5cgSz1NGmMSLQpV4usZPgrHJZjUWFl//TAUW96
 fEdSToR/89rUYIRDaTy9VZjWsnyt+SyXTuzkHnKAVCyOskZhGRYRsXqNLwKIitlw
 xI8/Hf6WaYgY/RMaRZ7uFNmeNa6bVk=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBXXzvDlHFh_KZcAA--.17034S2; 
 Fri, 22 Oct 2021 00:26:44 +0800 (CST)
Date: Fri, 22 Oct 2021 00:19:57 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley  <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou  <aou@eecs.berkeley.edu>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek  <michal.lkml@markovi.net>, Nick
 Desaulniers <ndesaulniers@google.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: [PATCH v3 0/2] riscv: switch to relative extable
Message-ID: <20211022001957.1eba8f04@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBXXzvDlHFh_KZcAA--.17034S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyDXryDGry7Cr18urW8tFb_yoWkAFc_ua
 4IqF97W3yxXa1SkF9rJrs5ArW0krW8tryDXFWrtr47KrZrCr4UKayqqF4xZw18ZF45ZF4f
 GrWvqrW8tr17tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbcxYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
 80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
 0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8fwIDUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_092657_120568_509D2F37 
X-CRM114-Status: UNSURE (   8.52  )
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

Similar as other architectures such as arm64, x86 and so on, use
offsets relative to the exception table entry values rather than
absolute addresses for both the exception locationand the fixup.

patch1 consolidates the __ex_table construction, it's a great code
clean up even w/o the 2nd patch.

patch2 does the real job.

Since v2:
  - directly check R_RISCV_SUB32 in __ex_table instead of adding
    addend_riscv_rela()

Since v1:
  - fix build error for NOMMU case, thank lkp@intel.com


Jisheng Zhang (2):
  riscv: consolidate __ex_table construction
  riscv: switch to relative exception tables

 arch/riscv/include/asm/Kbuild    |  1 -
 arch/riscv/include/asm/extable.h | 25 ++++++++++++++++++++
 arch/riscv/include/asm/futex.h   | 12 +++-------
 arch/riscv/include/asm/uaccess.h | 40 +++++++++++---------------------
 arch/riscv/lib/uaccess.S         |  4 ++--
 arch/riscv/mm/extable.c          |  2 +-
 scripts/mod/modpost.c            | 15 ++++++++++++
 scripts/sorttable.c              |  2 +-
 8 files changed, 61 insertions(+), 40 deletions(-)
 create mode 100644 arch/riscv/include/asm/extable.h

-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
