Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091D2C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 03:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8RI7TUMcKnFzZnyYZ8W223BREOHP1GZvsI5lPpEGWM=; b=176xiVx79jXZet
	JIf0MCKI3a/sCsPtyrGq1qEWAeBvd5t/RxVhvoc2mBWm8STquUwtPiN6HatADhMIh9wxDPtekM5OM
	nb87ByKeoksMynH0H9VBNoOQ0Rpxuk8+xjRLm0DcoOWCRj3xJvHvQigWgayWX08bcvprvLBxNWs37
	FT9c1WP4pdGFGRvJHRIG8AP/Z8/7V3kMtt7t8V6mtSjqDkRJiPzqLijd/VPs+oX5FvvRyh3vLLX4X
	1dBW6bJVzgtvIlRu+IYuV1e1/2TJxjzIBtgsFZPEybsiSYGvpMRGko/j/+1NYpxbbb3GUr+JjyEgN
	JPfeaMdsFW7kwC9gRKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwasw-004wsp-2q;
	Wed, 10 May 2023 03:53:02 +0000
Received: from m12.mail.163.com ([220.181.12.215])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwast-004wry-31
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 03:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=I7TmN
	czI3ID1n4Eok3pwJOAtr7gYzF0OUcw3nR5p7IM=; b=P8EQsuvBEeyn8BFGSEXdS
	arNsAWrAhE0doksfZ4lUKxcVrGye3yk7NsaotKrbmKmlLXBtOqpf0TIIMzRnzHbm
	2ITjfXv2aD4bBpST5Q8YNa7ThjuSutLXGKj6dUS64o9kRvVzRFM1ZYTFrz/npAPF
	tblvLjQOOdsl4+RVyE5LvY=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wBHlVQOFVtk+zPWBQ--.60792S2;
	Wed, 10 May 2023 11:52:47 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: ajones@ventanamicro.com
Cc: aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhang_fei_0403@163.com,
	zhangfei@nj.iscas.ac.cn
Subject: [PATCH 0/2] riscv: Optimize memset for data sizes less than 16 bytes
Date: Wed, 10 May 2023 11:52:40 +0800
Message-Id: <20230510035243.8586-1-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509-b0dc346928ddc8d2b5690f67@orel>
References: <20230509-b0dc346928ddc8d2b5690f67@orel>
MIME-Version: 1.0
X-CM-TRANSID: _____wBHlVQOFVtk+zPWBQ--.60792S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww17trykXw4DJF1UAr1kZrb_yoW8tw4rpr
	WfGr9xWr15trZ7G3WfJa1kWrn0qr4rtr47JF4xK348Crn8C3WUAr13Ca409Fy7JrW8Jr15
	Xw45Xw18uFy5u37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2Q6JUUUUU=
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/1tbiQw5rl1c7eVnG5QAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_205300_372379_5BA3D1F4 
X-CRM114-Status: UNSURE (   7.81  )
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

From: zhangfei <zhangfei@nj.iscas.ac.cn>

At present, the implementation of the memset function uses byte by byte storage 
when processing tail data or when the initial data size is less than 16 bytes. 
This approach is not efficient. Therefore, I filled head and tail with minimal 
branching. Each conditional ensures that all the subsequently used offsets are 
well-defined and in the dest region. Although this approach may result in 
redundant storage, compared to byte by byte storage, it allows storage instructions 
to be executed in parallel, reduces the number of jumps, and ultimately achieves 
performance improvement.

I used the code linked below for performance testing and commented on the memset 
that calls the arm architecture in the code to ensure it runs properly on the 
risc-v platform.

[1] https://github.com/ARM-software/optimized-routines/blob/master/string/bench/memset.c#L53

The testing platform selected RISC-V SiFive U74.The test data is as follows:

Before optimization
---------------------
Random memset (bytes/ns):
           memset_call 32K:0.45 64K:0.35 128K:0.30 256K:0.28 512K:0.27 1024K:0.25 avg 0.30

Medium memset (bytes/ns):
           memset_call 8B:0.18 16B:0.48 32B:0.91 64B:1.63 128B:2.71 256B:4.40 512B:5.67
Large memset (bytes/ns):
           memset_call 1K:6.62 2K:7.02 4K:7.46 8K:7.70 16K:7.82 32K:7.63 64K:1.40

After optimization
---------------------
Random memset bytes/ns):
           memset_call 32K:0.46 64K:0.35 128K:0.30 256K:0.28 512K:0.27 1024K:0.25 avg 0.31
Medium memset (bytes/ns )
           memset_call 8B:0.27 16B:0.48 32B:0.91 64B:1.64 128B:2.71 256B:4.40 512B:5.67
Large memset (bytes/ns):
           memset_call 1K:6.62 2K:7.02 4K:7.47 8K:7.71 16K:7.83 32K:7.63 64K:1.40

From the results, it can be seen that memset has significantly improved its performance with 
a data volume of around 8B, from 0.18 bytes/ns to 0.27 bytes/ns.

Thanks,
Fei Zhang

Andrew Jones (1):
  RISC-V: lib: Improve memset assembler formatting

 arch/riscv/lib/memset.S | 143 ++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 71 deletions(-)

zhangfei (1):
  riscv: Optimize memset

 arch/riscv/lib/memset.S | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
