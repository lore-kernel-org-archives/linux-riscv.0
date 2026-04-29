Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F244FFF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rE1kSZRAUEb0CXrMGh7xoHvxcKGgMQMSaFGr9QFCOcY=; b=4eSuxf8Mc7u5OJ
	HXYB4t0uMOG3hFW/GKludbJ+KDHUEXDNhhRIe6PomEr6vycpDAJqu3lRe2wiJsh1R4j8IuvA6cIVr
	jUHyfmwtTTu3rMVnw+zOqrtBuwwqUaH9fVKwjp3WGWBRGhbFgTQ90dN8JBpTJuHNlpu3qJNxi4lcH
	9HBBGRXTbu4qqx3+5w27AgZOVYJT1fM/1ogwp/9J7BYXO354C5uZDL1Vi0WEZgdUfOxgDFcUe2ObZ
	TC33AaWd87zVawEc7m050YZoDTHGGYWRJ/Dj7ReurQmBRwA1tKc641COQ9MBvqh501lr/YtLpb0rF
	8c84X+Ci52oeceEZTCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtc4-00000002i84-1nRE;
	Wed, 29 Apr 2026 01:21:16 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtc1-00000002i7W-2PMM;
	Wed, 29 Apr 2026 01:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777425671; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7LnoYXtUgcLK+iuuo/ay/+wU4q11Fd3/PO7qvUkxaPc=;
	b=ietmYhrIthf4zgEGsMHAYg+ZxgGqEnenFRZYf81CFJEJcpZm9hXaZJs1CYDQWaNnX0fi7hxRgFdTrLe3HnVwLfSqCVVRn4H1ZstM/VifV3tFP/U7PZ/nEe2MDQ+7zg66FnsHgpyT7WedhNEnovCXfMpgiAyZYTEGhC0VbKg05oc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X1vuGUZ_1777425666;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1vuGUZ_1777425666 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 09:21:08 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: [RFC PATCH 06/11] iommu/riscv: Add domain_alloc_paging_flags for second-stage domain 
Date: Wed, 29 Apr 2026 09:21:06 +0800
Message-Id: <20260429012106.63618-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428133501.GE849557@ziepe.ca>
References: <20260428133501.GE849557@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_182113_817205_37465526 
X-CRM114-Status: UNSURE (   3.37  )
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

Understood. I will rework the flags handling to follow the switch/case pattern
used by other drivers, and remove the dev_err() on the failure path.

Thanks,
Fangyu

>Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
