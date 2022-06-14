Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B993C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11WdZm/eSM+7xkqNiuqEyrJ0T2qcYEEv9uutaPmPOic=; b=krVfNi/LFMhuwu
	4M+2ltGuvG90UyBEpepfT7jeP6lVAeFmO8jHA89SUCzcMjg0vHuQFrwI2GipbETyh0Umrn3Rnafhu
	8p0e1UNeunNnXOHZSTervCPKfG5tpk6i0gWBU1+a0h/EnprjuJXWUKdxLCUr1XVfargr8lZ7dftR4
	nA6kIQJ45CQU2485FSMMQfEy8fh9jYUtJT/6Wn7lr3ZFHh6yq9a+K2LSzqXeXJtR21tYrMGc1QL/m
	fathSUr0S6AsiE/aJ5T0Kd71iNS6oX7EQHvWsBPnM+P3VxLM3dkasPR7NJi9o2fuuZgTEZxWvMHSc
	kcQ5MThe5OVF/gfm+n4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18tL-00AF8e-6x; Tue, 14 Jun 2022 15:55:43 +0000
Received: from mail.efficios.com ([167.114.26.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18tG-00AF4A-3s
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 15:55:39 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id D08E63C7BAE;
	Tue, 14 Jun 2022 11:55:27 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8xBpgvQspl98; Tue, 14 Jun 2022 11:55:27 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 5A4993C7BAC;
	Tue, 14 Jun 2022 11:55:27 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 5A4993C7BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1655222127;
	bh=OVVX77NJaKEpiz2cL6LOuhjWgBAIf5s6dwOHqFP2faw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=uUX8WbvpTCfa6qRtpQrg4oPYh6zVIAqKr6eJ9A6oZz+ZgTbkiLNTVYX9AqBa4i5XP
	 ZVzM3rmPV4y0iA5TFnCJXX6ymqSMahx4xD4cQvsTZoV7EkeFwMzRSDjkJ4cKi8oaxc
	 rBd7/oKdwV1PkjVybO778Rj822QLmHsyg9y8t5eQo/CMt9VTqUAHT+lZz3oDaupJgp
	 1y+xR4RqbbKjUplhxjuLbM5GwQbD01Dpq2hT12ZsqUr1j3RfJzPNOqzXEatvjY8TaB
	 FjOq7gd96bPvkHYj8QqA8C2u2AplVc1HykR8k3JIkyNcxmN3sUqZ8c4qC8yRZtGCm4
	 esJfqJM4R+JEA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vT9p9F8JpKWN; Tue, 14 Jun 2022 11:55:27 -0400 (EDT)
Received: from laptop-mjeanson.internal.efficios.com (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
	by mail.efficios.com (Postfix) with ESMTPSA id 101D93C7AB7;
	Tue, 14 Jun 2022 11:55:27 -0400 (EDT)
From: Michael Jeanson <mjeanson@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Jeanson <mjeanson@efficios.com>
Subject: [PATCH 0/3] selftests/rseq: fixes for RISC-V and Glibc 2.35
Date: Tue, 14 Jun 2022 11:48:27 -0400
Message-Id: <20220614154830.1367382-1-mjeanson@efficios.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_085538_274744_3F863C74 
X-CRM114-Status: UNSURE (   5.07  )
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

The patch series allows running the rseq selftests on a Glibc 2.35
system which has rseq support but no RSEQ_SIG defined for the RISC-V
architecture.

The patches were tested on both Glibc 2.33 and 2.35.

Michael Jeanson (3):
  selftests/rseq: riscv: use rseq_get_abi() helper
  selftests/rseq: riscv: fix 'literal-suffix' warning
  selftests/rseq: check if libc rseq support is registered

 tools/testing/selftests/rseq/rseq-riscv.h | 50 +++++++++++------------
 tools/testing/selftests/rseq/rseq.c       |  3 +-
 2 files changed, 27 insertions(+), 26 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
