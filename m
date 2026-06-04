Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852F0CD6E57
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 11:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MbISz+8tgmeP6rmiLHpJK73b0+WUD1oqV/5c4QjrmYY=; b=v32Fh1pbLaQxGg
	QT8cPDN0uY1sBpwwCfbVYkgJ7LR7yCj7IuzHKqaETdjr6sViYUpmigqmRT3S0hEragnGUoXwcSMuX
	HKybEM8Nl6yjJgoZhoqyyr/tBS4fCIIWXpY+z32IKoy1nHhX2FaoFY8wqCjyBCZUU5BpeUb6YIFfO
	6r5DMJfGkLMy5lst7D+5MoksfyJ20xAYltI3YeuRsjjUGF1IrpH73aaL3JQ9pdvpZwfQ4STVvGuXn
	M/NhlFab3SwCUYAN68EYulK4KdGkKNE7RJUbLzwQBYP/KCCEylBfeVGtutpHpT2GH+o2GPd7fEox8
	ItDIc1ACM6zQFuJjsXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV60T-0000000GcTp-2Ge8;
	Thu, 04 Jun 2026 11:13:01 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV60P-0000000GcSh-1rrG
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 11:13:00 +0000
Received: from [127.0.0.2] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowABX+tKpXSFqnS2YAA--.469S2;
	Thu, 04 Jun 2026 19:12:43 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH v2 0/2] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
Date: Thu, 04 Jun 2026 19:11:53 +0800
Message-Id: <20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH1dIWoC/42Q3U6EMBCFX4X02iEtCFuIMb6HWZPSDm5dSmv/o
 iG8u13WCy+9PMnJd76ZjQT0GgMZq414zDpou5bQPFREXsT6jqBVyaShTU+7pgMj/BXEHNFDNmi
 McOCsS4uICD2f1GmgvB3kQArBeZz110F/Pd9zSNMHynhD/jY8fqYyG+81MomAIK0xOo5VPtUMv
 GRv235rGwxBHEpj9XQYtbSFoqkWhOuMq0Rw3sYyAMElr20KMIu0RMgNUJg5VbztHouketFBilA
 LWcv1mdzsLjpE67+PV2R2yPzr6syAAfYDV7wbJsH6v2hy3vf9BzfYnjxmAQAA
X-Change-ID: 20260525-mark-after-vmemmap-populate-68bd790839c9
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: qwCowABX+tKpXSFqnS2YAA--.469S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4DGr4fCr18GFy8Kr1fXrb_yoW8Crykpr
	W7Kr43WrWrJw4Igan7uw4aqFW7G3ZYkrWFgr1jk3yrZrWjqF4UZan3Kw40vrW3Xr15Ga4v
	qrs8AayrCryDAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_041257_868696_FB097BA4 
X-CRM114-Status: UNSURE (   6.06  )
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

Patch 1 adds a hook and should be no functional change on its own,
whereas patch 2 is the actual fix, which depends on my earlier kfence
fixes for mark_new_valid_map() [1].

Found while testing AMD_HSA/ZONE_DEVICE on SpacemiT K3. Using
ZONE_DEVICE requires another fix [2].

[1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn
[2]: https://lore.kernel.org/linux-riscv/20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn

---
Changes in v2:
- Split patch in two, hook point and riscv hook 
- Explain hook necessity in patch 1 message (Mike)
- Make hook #define based (Mike)
- Call finalize hook only on populate success
- Link to v1: https://patch.msgid.link/20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn

---
Vivian Wang (2):
      mm/vmemmap: Add a post-population hook for architectures
      riscv: mm: Avoid spurious fault after hotplugging vmemmap

 arch/riscv/include/asm/pgtable.h | 4 ++++
 arch/riscv/mm/init.c             | 6 ++++++
 mm/sparse-vmemmap.c              | 8 ++++++++
 3 files changed, 18 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260525-mark-after-vmemmap-populate-68bd790839c9
prerequisite-message-id: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
prerequisite-patch-id: fdc42f2647e21d111f44a6532887a6705cd470a9
prerequisite-patch-id: 096fa339c84c36643ae4311fd8362dc63e23d950
prerequisite-patch-id: 305c876a5f4a23a840a8142aea79b796ed297545
prerequisite-patch-id: d78cb55d6a616b1170f06a401c8fd44acd11e5d5
prerequisite-patch-id: b02b4a76e94f3e2821291d4c23b46f6e5ecf5203

Best regards,
--  
Vivian Wang <wangruikang@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
