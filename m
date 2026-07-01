Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D949C43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7q/GNur7anHHJaer4njHpknW9RkemEeJT4bVdDKcvwU=; b=Cwa7iNUJxJvkvM
	YlFWaPWAkatk9HFd2J0fGmKNtxtjEDGpCQwq6gP68itXZFgAcjqs3mGfOIfZM8mdRbHCHXWB8FaCY
	5ue7GGf/udiHkPcW/M0fSHcvGqhOL73C2+1eXuM5N7ZBy62ZocFbNOag9BzgtcGK3aYRfS3euk69q
	wiNqaGyBDE9QwNiDPDOrKyreWmAediOUFi2SnVjYOVuGQeOOql+vsSyttaAq8lFYZNKku19i+P/Oy
	KT5z1cpnfcVGdCOzS1y2Q/rufe7vBQtLnB7QYcpCzuQDhjlmZTNf40ayLgbSRLbaPuQyA7Ee1BE3d
	LaM02mlRsFQyRaHrhM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqeq-000000017W2-0N1P;
	Wed, 01 Jul 2026 08:51:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqep-000000017Vk-1oIj
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Sq6xhPxioPByN8YmUNTYsI/Wb+4488jJwlA/SYfNZdg=; b=GNqNYNJkhDQeguVSQjyzYeuiVd
	0DCitKHn0dosGTOgsgRZ0myUGu75goZra89L5mnbqps42mbNqFsSGrKCrGhSsTNrYzSnWvadBpWLj
	sav9HzB35bhZVxpcbT5q45UyNpMmqB+7FPkic/HsqzNt5c0AEzYrwK8M+OYMvOMu4Anig2o8ZcpHo
	WRHQpX4mCCbTSE+f4Pyq3v5PNkOb5zY3pPRg6bMBFFgfzQojg0oUkIM+ScVSkZqLOmsiOJ1Sqdv0E
	ymZTrx3Zqo3KI7M4C9G7vrwnzfZ8lG5ZAoFbx9aRlBVI8j+8lvf9XJcEvTMDAKxxoM69Su7ntfGC1
	Xa3Zaq8g==;
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqem-00000002XDe-0rWj
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:50:58 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-37fd7db8cf1so208864a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782895853; x=1783500653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq6xhPxioPByN8YmUNTYsI/Wb+4488jJwlA/SYfNZdg=;
        b=ezz9Mcb6n03087Gi41sj7vOxsbLvZh/Nl5o4XT1BOQXSAx04zw8Lip8UYlHQVIwvIz
         vUdDjj9u1HBEfp4FkagWAD081ayPHgshHFzEjsFCG3XNaYcVz/yT/mcS975DcP+7w/kx
         RnoWQoAmf3Mx0Wj5SWn8ArU5qAIUVK1XdPdJYxR6g6xgLDBaxEqojCQMoRGkt8m1eSHw
         vj7uQAadwAwAUXG4ZhtgE2AozFQuZ7cQGhgOTFl8eyCSwQyz5OtrJqNIe6O1aWcmQkfi
         aJ6qus4cUGknsLbOV47P3cXNNWo0lzglsSNzrTjwykY7eVbE/63U6uL/TZ/TCJ1tOmGD
         RPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895853; x=1783500653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq6xhPxioPByN8YmUNTYsI/Wb+4488jJwlA/SYfNZdg=;
        b=p2MgCY0Y5qO4ASEpFrfR9Mwia0VsEc1o7MJ3NVeJTJvh1bZo31x7GhTWv8h3j20F10
         U7ngQtp1lpIRMC2E7JnNJEY1nDI7udG5WWFqrBzt+demmxch0jXKJlZAfWNWnjfhP4A5
         hjY21PfrbfbVi1n9MMQE/QuirI3aOHzl1dWEUbZ7O2JkZzyll0aTf3Z1e5oxe5Kx8280
         QTCq4c0/2qVu7PBRR85GY7Yp8Bi1e/pz3wjSe1ESdZK79qRVDrDvirhvXcvQiEYsQimT
         24246AOUq9j2TWHpTUuRK96nRqYyD9/QlcHUYvPMpLDMxN+gONujK2Whv2t+zdJMfxJM
         bYBw==
X-Forwarded-Encrypted: i=1; AHgh+RoJ87VmSEV3+TkBaHvZG2mAJe9xKdUzjgprl06yC6KYwtCLWE+qJDnDjcyotHkMy7WjcnpftUs8BNYcHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8U3aK2T2d9BdJkPM14IqaykZO6/qp+lxSrF/4fB8XSLdq16v1
	64f2T3v0nl/DlKnj0fAPU0uHEb1jRbqOaMmwTwiDEPcXhhIRoi1D4T4P
X-Gm-Gg: AfdE7ckAqVJNeGNVivmMGp8p4mCbFWQ848tedaV1+4ouQjOql3+n3uIQHTskVJlx6M4
	YUdopusixUIzMhXQRqczlLrZesaHJ3qKyXpk80t3bogrIVPAq027gMYH7PmojZqRdJxZo7fDY/J
	0IeovLiWo8Hu/Kew03ObWyeJNFic7yd9FcgxHrh2LGywWj9OR8INslwoxxXmCIc5H+/K3y9nGdQ
	K/C7N6/GQAUlsTF/XmNmtGZFnJptpva+u3j9mMKp4txh/KLHV2kuQYUyBeWS70C9gVt3SnybE9J
	RWUDf+3fF/3YXLrarT4PmqFCUgi0dP0eBikfuV1Mie+VU6yvW5FYGbsLf/6N7naZHzOKFwV25rH
	XaYWe6UDvKn2USCQhrYzmRK0Dd1tfIUIZtar3PDDXNbnlIBmlug2iywlP1jWlwF7x7rbO9piLbk
	c5SmeKsVyPOA1+/d2oZ7I0
X-Received: by 2002:a17:90b:562c:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-380aa20e0cemr685220a91.32.1782895853475;
        Wed, 01 Jul 2026 01:50:53 -0700 (PDT)
Received: from wud.bbrouter ([2409:8a1e:9473:9f10:5de9:783b:c249:18c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097ba48d0sm550782a91.1.2026.07.01.01.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:50:53 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	anup@brainfault.org
Cc: alex@ghiti.fr,
	atish.patra@linux.dev,
	zhouquan@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH 0/2] riscv: ptdump: Refactor for KVM gstage ptdump support
Date: Wed,  1 Jul 2026 04:50:28 -0400
Message-Id: <20260701085030.124579-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095056_525762_5C58F931 
X-CRM114-Status: UNSURE (   9.00  )
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

This series refactors the RISC-V ptdump implementation to support
dumping KVM gstage (stage-2) page tables via debugfs.

Patch 1 moves the pagetable walking state and level definitions to a
common header (arch/riscv/include/asm/ptdump.h), updates the attribute
parsing logic to use per-level bit definitions, and exports note_page()
so that it can be reused by the KVM ptdump implementation.

Patch 2 introduces KVM gstage ptdump support, registering a
'gstage_page_tables' file under the guest debugfs directory. This
allows userspace to inspect the gstage layout and permissions, which
is useful for architectural debugging and memory management audits.

Testing:
  - Booted on QEMU riscv64 with CONFIG_PTDUMP_DEBUGFS=y and
    CONFIG_PTDUMP_GSTAGE_DEBUGFS=y
  - Verified /sys/kernel/debug/kernel_page_tables output unchanged
  - Created a KVM guest and verified gstage_page_tables output: 
0x0000000080200000-0x0000000080209000    0x000000010c94e000        36K PTE   ..   D A U X W R V
0x000000008020a000-0x0000000080223000    0x000000010c9af000       100K PTE   ..   D A U X W R V
0x0000000080229000-0x000000008022b000    0x000000010c978000         8K PTE   ..   D A U X W R V
0x000000008022d000-0x000000008022e000    0x000000010c844000         4K PTE   ..   D A U X W R V
0x000000008022f000-0x0000000080232000    0x000000010c846000        12K PTE   ..   D A U X W R V
0x0000000080234000-0x0000000080238000    0x000000010ca13000        16K PTE   ..   D A U X W R V
0x000000008023a000-0x000000008023f000    0x00000001083bd000        20K PTE   ..   D A U X W R V
0x0000000080242000-0x000000008024b000    0x0000000106975000        36K PTE   ..   D A U X W R V
0x000000008024d000-0x0000000080252000    0x000000010cb54000        20K PTE   ..   D A U X W R V
0x0000000080255000-0x0000000080258000    0x000000010c164000        12K PTE   ..   D A U X W R V
0x000000008025a000-0x000000008025c000    0x00000001036a9000         8K PTE   ..   D A U X W R V
0x0000000080260000-0x0000000080275000    0x0000000107917000        84K PTE   ..   D A U X W R V
0x0000000080276000-0x000000008027e000    0x00000001078ed000        32K PTE   ..   D A U X W R V
0x000000008027f000-0x00000000802bb000    0x0000000108986000       240K PTE   ..   D A U X W R V
0x00000000802bc000-0x00000000802c0000    0x000000010762b000        16K PTE   ..   D A U X W R V
0x00000000802c2000-0x00000000802d2000    0x00000001083fd000        64K PTE   ..   D A U X W R V
0x00000000802d4000-0x00000000802e0000    0x000000010790b000        48K PTE   ..   D A U X W R V
0x00000000802e1000-0x00000000802e4000    0x0000000102f74000        12K PTE   ..   D A U X W R V
0x00000000802e5000-0x00000000802ef000    0x0000000104b9c000        40K PTE   ..   D A U X W R V
0x00000000802f1000-0x00000000802f2000    0x0000000103778000         4K PTE   ..   D A U X W R V
0x00000000802f3000-0x00000000802f9000    0x000000010377a000        24K PTE   ..   D A U X W R V


Dylan.Wu (2):
  riscv: ptdump: Move pagetable definitions to common header
  KVM: riscv: Register ptdump with debugfs on guest creation

 arch/riscv/include/asm/kvm_host.h |   6 +
 arch/riscv/include/asm/ptdump.h   |  42 +++++++
 arch/riscv/kvm/Kconfig            |  15 +++
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/ptdump.c           | 178 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c               |   5 +
 arch/riscv/mm/ptdump.c            | 102 ++++++-----------
 7 files changed, 282 insertions(+), 67 deletions(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h
 create mode 100644 arch/riscv/kvm/ptdump.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
