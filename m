Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8832FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 18:34:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4588C60EE5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 18:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4588C60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=geu5OEkkfpNH/2ktnv8pJHRBdyZelfbSAVSMZcjuDEw=; b=hFyAtqjCuK3UJG
	1nZLTeQI7DN4Yr/mlO+PXO16xkvyJF74NOkgCgqrA7oqFQLi+YXEaG90Hlp/hjkNnZhE/v6YQh/cY
	FYi3P/qylBwIEPMAnL8CQrzkoFvb9fHw2Rw6Di9cbJBwkQ2N0BWd423zLAMKq64P0MQ8fekWWtyDx
	CgIiVEpwolKSpS6scqS+Ag0qhjtkDUpuEUJoClpR8h2QiZDaPQLqHDM2h/byVVd/2VcnZW2pZpEK3
	S2X/jeSlz/io9ElPBhhVta6cODqbevgfno0JuTtWVBPdq2fT2AcByguhyOWxoAscAdwCx3KPOXmey
	lsCZNGv5Di9hYQj/SGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maMbP-00DlA1-7I; Tue, 12 Oct 2021 18:34:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maMbM-00Dl9I-HQ
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 18:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634063649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nbgsOsSSo9Yem7q4TZdpOJzLhRx02NYo3rwP+kVjrbw=;
 b=ROtoc75WLU6VM+9tY6t6T4yjKQWC4ysVFGeVO5T1BjnJmbAYY6vR63qYduMiuUDzamwjzk
 Uewec1AdFQnYTdB8UKQMHlum/q3k3Hf57BqYBvYOJKNA9MhBSSd1+GAu6SlgoapkvyU03q
 dYaDjslvt/Mj8KQ+htbnqDFEdY12NpE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-6XF0NAdHPYmSVyUTsBQwkw-1; Tue, 12 Oct 2021 14:34:08 -0400
X-MC-Unique: 6XF0NAdHPYmSVyUTsBQwkw-1
Received: by mail-pj1-f69.google.com with SMTP id
 41-20020a17090a0fac00b00195a5a61ab8so238158pjz.3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 11:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbgsOsSSo9Yem7q4TZdpOJzLhRx02NYo3rwP+kVjrbw=;
 b=M2qas3gxTntsLOVGbicJHVcn0jTxznIdbif+M4CJpRUZYvL4VsmUEaqxFt2ypZf+TI
 6BhK8FTdMX5rAlD70r+RdSBGrynD9T/X9rj3cmvbxJpfKRx/Jrun6Ga1W2mRULBOmvZ9
 AKM7kC3CcMr0/d9S2tDixlAojT88WXbZySL5yEXD5+jdfxEOfjTFC/NAqgi39IGd655B
 CMeTdOopp4J/EuASjjSpLw+3phXsSKZc0FYNWOG+AQuqzmQtKfFywyoq92Gs7Ur6fOSV
 qAIvP75sG0GD8wTNnu+wCVikvNyMyvyCIzuO1xOZMpkog3NUMkimi+uwFPZaVZGQ9gDM
 4Iig==
X-Gm-Message-State: AOAM53301MQmP+JCXy0p6k4E+cjsa5q06cSMx1JYuqmqkYlc9nfUniuG
 Q81aPlUZUqAt8PgbNHAikd1zR350x7VesEW2GmyzoffSCRb9W9i5UF1KvR9cPNTRNy5fSD91oSh
 LU8wnn6irk64lcLZFYTowfFT9HGUV
X-Received: by 2002:a63:4743:: with SMTP id w3mr23574433pgk.245.1634063647124; 
 Tue, 12 Oct 2021 11:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYV7ys83DL9nO+JaPOB7MrYoWsFwBT15nWiNWaKVgwPs7OrtAs4HQB9269x7iDVWU1Btmyvw==
X-Received: by 2002:a63:4743:: with SMTP id w3mr23574406pgk.245.1634063646889; 
 Tue, 12 Oct 2021 11:34:06 -0700 (PDT)
Received: from samantha.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b10sm11617706pfi.122.2021.10.12.11.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 11:34:06 -0700 (PDT)
From: wefu@redhat.com
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 guoren@linux.alibaba.com, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 dlustig@nvidia.com, gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, huffman@cadence.com,
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, Fu Wei <fu.wei@linaro.org>
Subject: [PATCH 0/2] riscv: Add RISC-V svpbmt extension supports
Date: Wed, 13 Oct 2021 02:33:42 +0800
Message-Id: <20211012183344.105637-1-wefu@redhat.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_113412_693380_23E25A1C 
X-CRM114-Status: UNSURE (   6.26  )
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

From: Fu Wei <fu.wei@linaro.org>

This patch follows the standard pure RISC-V Svpbmt extension in 
privilege spec to solve the non-coherent SOC DMA synchronization
issues.

Wei Fu (2):
  dt-bindings: riscv: Add mmu-supports with svpbmt
  riscv: Add RISC-V svpbmt supports

 .../devicetree/bindings/riscv/cpus.yaml       |  5 +++
 arch/riscv/include/asm/fixmap.h               |  2 +-
 arch/riscv/include/asm/pgtable-64.h           |  8 ++--
 arch/riscv/include/asm/pgtable-bits.h         | 41 ++++++++++++++++++-
 arch/riscv/include/asm/pgtable.h              | 39 ++++++++++++++----
 arch/riscv/kernel/cpufeature.c                | 32 +++++++++++++++
 arch/riscv/mm/init.c                          |  5 +++
 7 files changed, 117 insertions(+), 15 deletions(-)

-- 
2.25.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
