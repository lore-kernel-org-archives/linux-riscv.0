Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D638C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 12:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED5261B39
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 12:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6ED5261B39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KCqOyiJA/i4ilZm9QZcMzwjZIF32mQESZ+Ex77Xv0K4=; b=ADlwzLB0MfzWD5
	5Wjtn3le98a/rx9xPA5p6cazbR+b7DcuAfxViEFGdAormc9THtpSPnhgMRMwIsT40sNykPF+iQ0HT
	eJwtlto0yA9I1NFGNewVx8MI9BSaUP2uWHMvGbzUjTwphvcrTCDACkUVpRlckXCw5QZGIEOw/CB+r
	bhhEVrwaV6IKK+8RuRzU+ZU8wZS0dLsV8Mv4Y3dlTWrdvK2j22LSxdaUzrvVmK8zC9iOIW0dZ0oM8
	LE3KZc/hLp4Nvr2/tQnji5L6UsBiX4ubOMvgT/+l/ugaW9R+bljh/zzISaAJxDlxjkFQdUBlLti1M
	YNeJzC/nplkKBOhCbFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmxJG-001ggB-0B; Tue, 16 Nov 2021 12:11:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmxJ9-001gbC-AL; Tue, 16 Nov 2021 12:11:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CED3F61B3F;
 Tue, 16 Nov 2021 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637064686;
 bh=vq95HKLfHO9piwN5lsf/MCq9657Jh2pFENCGhyxmjLo=;
 h=From:To:Cc:Subject:Date:From;
 b=SGZM9xNJKSSd9zG64wbGKiexBM6w+eZXR08apIpufSrM9cni6UGZ7lPrrHiB75CeL
 rHJb+z39/th7FCQuXO5pPiitXv0fw12QpxOsxiKREduVjglCmDJgitnVlnmSBRLw/x
 us3Sy7Hnu2QaYoNqizRvyAP22VcHW1DCdSQxQ/jdqnRn859aNByM6HQAl5TXZbZKcl
 8WoeJoRFFXs6EbSE/a1jePnDacyUUKxLnbXmh5WMn1vtB5AJCH9cBk4duqW6cRERv7
 J5C5zQM47FcF0zSNe/lN8hjKpBpmtjpQSDKeLh3GtuB+CXQ492809BlXN9w9JOnBS6
 BEURxXLKLvNnA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mmxJ6-00A9LO-AD; Tue, 16 Nov 2021 12:11:24 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH 0/4] Address some bad references to Kernel docs
Date: Tue, 16 Nov 2021 12:11:19 +0000
Message-Id: <cover.1637064577.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_041127_473794_FF764556 
X-CRM114-Status: UNSURE (   7.83  )
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

Hi Jon,

It follows 4 patches addressing some issues during the 5.16 Kernel development
cycle that were sent to the MLs but weren't merged yet. 

They apply cleanly on the top of 5.16-rc1.

Regards,

Mauro Carvalho Chehab (4):
  libbpf: update index.rst reference
  docs: accounting: update delay-accounting.rst reference
  Documentation: update vcpu-requests.rst reference
  Documentation/process: fix a cross reference

 Documentation/admin-guide/sysctl/kernel.rst  | 2 +-
 Documentation/bpf/index.rst                  | 2 +-
 Documentation/process/submitting-patches.rst | 4 ++--
 arch/riscv/kvm/vcpu.c                        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.33.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
