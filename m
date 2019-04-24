Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7E6C282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 00:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07856218DA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 00:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YsSjZRhQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Bi8IZJdQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07856218DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mTqUuqwez3EkZuiPmB0G3NO76+p1NoKXANrlDl1URQc=; b=YsSjZRhQFRn69u
	Q8heyNeK+8qiSibiTpFLlaqAdouKsCxxKyDXGyWsL7FCIXveXuvqf5dTfvieE7w6fXt6XOi9keGV3
	O/kDwXmWGZW5zWfnARk8ijlDHeQJHtW1uq7tO1UNFuf6jVMSzD99e9yPrIsieKqXsOV+mg2gc5gsw
	VMFyRCJmhztg6tugtmtiZzoBiVQaD3n7J/n4Rt4v5ZHjagL45qvIju7divlo3ZkPILHg2lnAPskF7
	44b+UxOA3y2l9JsMB+JxUbWpTsFhvASA1NwUpqAaXs+ArdBmSLRdBx2Gn7AmDyaC71NkNrUXaaw38
	lEsgI+/EQSRgIdOO0L3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ5Mq-0006Cw-GY; Wed, 24 Apr 2019 00:02:28 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ5Mo-0006Bk-DN
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 00:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556064188; x=1587600188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XiNEr+PSJjtuVX087I0r7I3Y9FgKCYJ6yrGmyRyacdU=;
 b=Bi8IZJdQkIonJeGlHl4wXa5G0q765pp3yv2x51hT/d8dtPpoMnRoRMZG
 QdanamgS5jtWT7pWbWgb6oSrjMBiVz2pm5uW+xYrg+T+twokXFJyxT8Tn
 fNmECWo+tnKKa2mdqjivP0N90UyDLYh8nX6WxydHoID+LdQ0Eh/zkoay8
 Tu6zqIZ2E6R8ravmggxszE8grRi58BfGJicdG9EUvBnKGFL9tunBomrbZ
 430VCrxRs3K1hs9JkVThD5MKLlisccQVp9FGE+hoW87ewWVHi4GgrvYOt
 xCKL1U/8hk1DXomAnKj8idzTw546TKdlFOxuLSOYZoymDlq7jKL0Zt6uF A==;
X-IronPort-AV: E=Sophos;i="5.60,387,1549900800"; d="scan'208";a="205772510"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2019 08:03:03 +0800
IronPort-SDR: RXLH+jGY3Aj5RtWhKDwU95J5uVc1zbHAYMc64KLu7gWW3OC8Up3So+kRnxEsyboo1JM/jHBGX5
 +rlB+CzW4VyZGstKS7PDYw9b9r0cz+AFdViwtQ4KWSkXJTwsSuHdZRgzHYapPoo8dO4rgEx2lB
 EcFqB0InayXCfckQe8/sUYUojT+z4SyPO0EufodU+szefEoYq44RqqgsPwj9SVFItzqKe9sH7x
 +oy26822lSLQ4miYKW64YRhYuvs3gVkXuSYw/doI2eg4/lvPStZDAqgr7ppdu9yWizgxIKxkOX
 HQz7HCotNZr7ysqGWuz8iXzP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 23 Apr 2019 16:38:54 -0700
IronPort-SDR: cA8mCqTqPppT2Ml7LpCNlgN8VnVzAcqm2YLkAzH55HD0iy1M1KnZmrrmrLvas12gEN/6GRPZ7I
 UPvQPemxtXPqi4Ww+y2kTFbOMTTqaLMrYj9sC1n05Nhg2gBeZCicxelYl58ZCG7R/0o34fwHAb
 5f7Mm0dLGcA7xG+MhDWitbFLEu1oalTouSttCiWzr6YZVbS+YC8/n8imcTtBRMQF/vFLlfQlKK
 f9JhjBEEO/3pYkp+GaD+dmSEMx9SxbfgscZ940tZo50UTh7b9bGU0jd37OWHHoxWRbr63mAj2s
 puU=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2019 17:02:22 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Miscellaneous kernel command line fixes
Date: Tue, 23 Apr 2019 17:02:24 -0700
Message-Id: <20190424000227.3085-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_170226_513339_D260491E 
X-CRM114-Status: UNSURE (   7.81  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Assorted command line option fixes for RISC-V.

Changes from v2->v3.
1. Merged patch 1 & 2 into one patch.

Changes from v1->v2.
1. Update pr_err string in patch (4/4) as per review.

Atish Patra (3):
RISC-V: Add RISC-V specific arch_match_cpu_phys_id
RISC-V: Implement nosmp commandline option.
RISC-V: Support nr_cpus command line option.

arch/riscv/kernel/cpu.c     |  3 +--
arch/riscv/kernel/smp.c     |  5 +++++
arch/riscv/kernel/smpboot.  |  0
arch/riscv/kernel/smpboot.c | 22 ++++++++++++++++++++--
4 files changed, 26 insertions(+), 4 deletions(-)
create mode 100644 arch/riscv/kernel/smpboot.

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
