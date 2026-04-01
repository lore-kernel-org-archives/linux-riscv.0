Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2599510F92EC
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 02:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iy7bql+1WC2yqZfLYFA3E1wGkW+uyL07ARUAA+z41DQ=; b=HTid4Y1EdV7LC2
	b8BoznmklVZr3I+MEv59NwkJPFAVFxJXG6pfUIEc96pz3YpyiP+xmLVVHHNvgf0DsAzTSCIUaISOL
	e169Ev/HfV59zSfOD0I39whftOKddyaZjrTLl0veatVC0Lb+UPcfmKPuPoNqBRspCIaJ3k1To6LSj
	oFpT9VxWRc82JZyRhEQTqWuZo+B+l6UEssWMqCJiRyfTffUfvxazFkD0hoeX70TNFzqXFVZl9lzwK
	4tzb1hKpg3mN7DsZRYc2XgGDmbemYec62k4xAiuhm/oTqwPSUDLnmXz3X1FmViK/x/6IB8n1PF8tz
	KObRmBb7RZIvd4tFbspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lNG-0000000Dqjl-0HqR;
	Wed, 01 Apr 2026 02:32:06 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lND-0000000DqjA-0PPW
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 02:32:04 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 6312UmNv071240;
	Wed, 1 Apr 2026 10:30:48 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 1 Apr
 2026 10:30:48 +0800
Date: Wed, 1 Apr 2026 10:30:41 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH 1/7] cache: ax45mp_cache: refactor cache driver for
 generic Andes platform support
Message-ID: <acyDUU3FdAAPWfnS@atcsi01.andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-2-minachou@andestech.com>
 <20260330-oxford-chevy-5f5a6f0a5be4@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260330-oxford-chevy-5f5a6f0a5be4@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.32]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6312UmNv071240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_193203_476820_6F8F6408 
X-CRM114-Status: GOOD (  11.44  )
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

Thank you both, Krzysztof and Conor, for the detailed review.
I appreciate the feedback and admit this series needed more work
before sending. I will address all the issues in the next version.
 
A bit of background on the motivation: the main goal of this series
was to prepare the Andes cache driver for a SoC Allwinner Avaotaf1 V821,
which uses the Andes A27L2 CPU. We wanted to share a single cache driver
across different Andes CPU variants, which is why we tried to move toward
more generic naming in both the driver and the compatible strings.
 
We have two questions we'd appreciate guidance on:
  a) On compatible string naming: We'll drop patch [5/7][6/7] and won't
     rename any existing compatible strings. But we'd like to confirm
     the preferred approach for A27L2: would it be acceptable to add
     a generic compatible (andestech,andes-llcache) as an addition?
     If so, would a CPU-specific compatible (andestech,a27l2-cache)
     still be required alongside it?
 
  b) On Avaotaf1 V821 support: We are not in a position to submit the
     DTS on behalf of Allwinner. However, we would like to add the
     corresponding compatible strings to the existing binding
     documents (andestech,andes-llcache.yaml, sifive,plic-1.0.0.yaml,
     and riscv/cpus.yaml) in advance, so that the bindings are ready
     when Allwinner eventually submits their DTS.
     Would it be acceptable to upstream binding-only changes without
     an accompanying DTS at this stage?
 
For the next version, we're thinking of keeping only the changes
needed to generalize the cache driver, and dropping the improvements
for now to keep things focused. If you have any suggestion on how
to approach this, we'd love to hear it.
 
Thanks again for your patience.
 
Best regards,
Mina

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
