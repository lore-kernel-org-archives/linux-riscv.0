Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098ECCD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZGY2uMIr4rvWfa4fNBLuzT59+S5FRqcd7Ug2aXvKKc=; b=H0IfJLM4+doMdP
	0tAl291wyYuqdUT+GZW48/GHbetP2WijaJrURsTbapZAchf5SOBC5gcrrzKCweGhwSoCdhRWl9Ksu
	xeDdBApQUCGqSWYWnq1Hp9NcI72cYroD6McBf2q8zItJcnIrZyCHejMY/nJoo/x+0TFh/Gk2QLzeQ
	24EYqkl9k+Uu6zH4c6y0E3kZXdpsbeANxNFrYW4bTPDxknksMI22q5p99nFRkF5KseBScWQ/uUTlf
	H8HMMLeaAUg5PkZ5/TYSqUgHmwsmTC4U+5vHV3aUZr1lUvJVBjCegyBlo7i3G6k4R6YF6kdM3Gf10
	xLctuwF3tjWFjckGwgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyHT-0000000AOwr-2VBA;
	Mon, 01 Jun 2026 08:45:55 +0000
Received: from out28-103.mail.aliyun.com ([115.124.28.103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyHP-0000000AOvL-3uxt
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bosc.ac.cn; s=default;
	t=1780303546; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=1n2+ipqM3e8+vxn9kaB6VbQ8wefScd0Kh0wlomEGpLs=;
	b=rrQL9peXM+nEe6dxiOz7/u3zqVSeuUm7ZWJExsbErl/wxf4IF/PdTelnJp1CNc/iHaj9lf4UpeCW3bmUoTHkn5qKSB/K1hokDhxgb8jED8Uzf/c+3FpuoqrdS25yNaw48bJzIgnwRpuWKqiDgsF5DWIQzKF862mt4ZaERaxTr14uqIIEvRmRr3G5/r+pOsXu+NJfGDR4rdlcIRsiOLtWnMvN9Hg60j6hrTdR4QETOt37nzYLb2cZqg9tUWc0bsl0LFWXeX2Uda/WaBMAb6OIPUdYpVJ65+Qxk7oOeFnKIuTTV0SLOmU/CF2eQGVgU7nH7kl42SAYLInKsem5AZrg9A==
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08405478|-1;BR=01201311R121S60rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0544653-0.00359158-0.941943;FP=10805633012820484158|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033023018039;MF=guoyaxing@bosc.ac.cn;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.hm0Q-2b_1780303525;
Received: from guoyaxing..(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.hm0Q-2b_1780303525 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 01 Jun 2026 16:45:45 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	guoyaxing@bosc.ac.cn,
	majiuyue@bosc.ac.cn
Subject: Re: [PATCH v4 3/4] riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
Date: Mon,  1 Jun 2026 16:45:24 +0800
Message-ID: <20260601084524.34584-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060125.139416-4-alexghiti@rivosinc.com>
References: <20240717060125.139416-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014552_476364_6E9CCE3D 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Alexandre,

We are looking at commit 503638e0babf ("riscv: Stop emitting
preventive sfence.vma for new vmalloc mappings") and ran into a case
that I do not think the current early new_vmalloc_check covers.

The commit removes the preventive sfence.vma after installing a vmalloc
mapping and relies on a later kernel page fault to run
new_vmalloc_check. That works if the first stale-translation fault is
taken while sscratch is still zero. On our core, however, invalid PTE
results may be cached/prefetched before the vmalloc PTE is installed.
Without an sfence.vma, an old negative translation for the vmalloc VA can
remain cached for ASID A.

A sequence we can reproduce is:

  1. Before the vmalloc PTE is installed, the walker/prefetcher observes
     the VA and caches an invalid result for ASID A.
  2. The vmalloc PTE is installed as a global kernel mapping, but no
     sfence.vma is issued.
  3. A different task/ASID B accesses the same VA and installs a valid
     global translation.
  4. The same hart later has both the stale invalid result for ASID A and
     the valid global translation available for that VA. Which one is used
     is implementation-dependent until an sfence.vma is executed.

The failure we see happens in ret_from_exception while returning to user
mode:

  ret_from_exception:
      REG_L s0, PT_STATUS(sp)   /* succeeds via the valid global entry */
      ...
      csrw CSR_SCRATCH, tp      /* returning to user; sscratch is now non-zero */
  1:
      REG_L a0, PT_STATUS(sp)   /* hits the stale invalid entry and faults */

The second load takes a kernel page fault on the vmalloc stack. But
because sscratch has already been restored to tp for the upcoming return
to user mode, handle_exception takes the bnez tp, .Lsave_context path and
does not execute new_vmalloc_check. The fault is then not converted into
the intended sfence.vma + retry path.

Our understanding is that this CPU behavior is allowed: without an
sfence.vma after changing the PTE, software cannot require the MMU to stop
using a stale invalid translation result. Caching invalid translation
results can also be useful for performance.

Is the delayed-vmalloc-fence scheme intended to rely on stale invalid
entries not coexisting with a later valid global entry for the same VA?
Or should new_vmalloc_check also cover the short return-to-user window
after sscratch is made non-zero but before the final sret?

If the latter, would you prefer a fix that delays writing sscratch until
after the last access through the vmalloc stack in ret_from_exception, or
a fix that detects this S-mode vmalloc fault even when sscratch is
non-zero?

Thanks,
Yaxing

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
