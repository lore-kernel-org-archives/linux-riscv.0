Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306EAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 10:32:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA7372171F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 10:32:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OzMFA/ey"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA7372171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HKTjN9PMRfDi86ph3AeLhHDxmVbHA3qhar12e2lsDDM=; b=OzMFA/eyvpQuw9
	3DrwJ4fBHAYCYzfp//+lGwP62b+DYxvrRldFgyr47ZApUAm0sg5Y6O8ZMy3SKahWmgAPs3gtNSKVS
	fguThJZWDNxKw118DG+h0GrSk14MUaHP2mYVFe4xyk2Xg56jXjeP7ESN6GzkYSrbVhBJoVKkDlHzO
	JT4y+OvwhyB18FkRwWThq4AM7QBWHNmIfUC6rygCoHp18eGNzF4BCct2VW/h0R0VCROSUdJblcIZc
	n/rfH95nZrmtExa7ICO2+cllHAiKHAVkaJ0BXKjzcDOyJkUQaguM0ZkmtiF4QKejLE3Wqe2scYUUf
	1ltS91ngFaxyyY2RQvrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzIz6-0000jU-MF; Thu, 28 Feb 2019 10:32:12 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzIz3-0000hv-Ia
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 10:32:11 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x1SAUwQJ086776;
 Thu, 28 Feb 2019 18:30:58 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 28 Feb 2019
 18:31:36 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>, <ebiederm@xmission.com>,
 <jimw@sifive.com>, <arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] riscv: Fix debug instruction check and support trap-based
 WARN()
Date: Thu, 28 Feb 2019 18:31:28 +0800
Message-ID: <1551349891-22683-1-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x1SAUwQJ086776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_023209_879994_34860535 
X-CRM114-Status: UNSURE (   4.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vincentc@andestech.com, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The handler for the debug exception will call is_valid_bugaddr(bugaddr) to
check if the instruction in bugaddr is a real debug instruction. However,
the expected instruction, ebreak, is possibly translated to c.ebreak by 
assmebler when C extension is supported. This patchset will add c.ebreak
into the check mechanism. In addition, BUG() is currently unable to work in
the kernel module due to an inappropriated condition in is_valid_bugaddr().
This issue will be fixed in this patchset. Finally, this patchset enables
WARN() related functions to trap the code to help developers debug it.





Vincent Chen (3):
  riscv: Add the support for c.ebreak check in is_valid_bugaddr()
  riscv: Support BUG() in kernel module
  riscv: Make WARN() related functions able to trigger a trap exception



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
