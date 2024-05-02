Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97722C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 02:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1KmK7z524LsZx/PoAN4R8A9kv4JNoBryeexta/ISs8=; b=CQW3EIrpq6QFXs3IaPbLe9NtA1
	4Yv/BN5847E4rZJRMTteiOgo8GGG8SiNlvFqQjU3nsK5qWpETbUUW0H2277GvuLgNukkY7p3tdycQ
	/jzAKRJoP3jQ0K8zsAonr44H28O5PS/KbjEmZlkJClfP21pvXBlPQrY6tgzcvkkfGC3zQetJw5l2x
	p/pLiWIWTm5wfrz1oSf//GAywxNK6gDj1nakfZsLBwFP2Uy4w316hClxq3fAYiZ1L00DbQEfXcFEV
	Miub2ylD8uz+qN7UHMGfIA+jyvpq2cXsAs2BD7HP67TVp5P67IYT07+V4tzyKhfeQNKyQleqMQeVS
	K0YngOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2LrS-0000000BBPd-47pC;
	Thu, 02 May 2024 02:07:50 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2LrQ-0000000BBPH-24Wk
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 02:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714615669; x=1746151669;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QF8d4nyVCR6eb4ifi8sajRySGMaCZfYzZt/syNMLUxQ=;
  b=Uc2+g3Yb4M2lY3XuZNGCkFisDu2gwhb5RqTweYnRzLNNfjzTzmoyEbJR
   7QN2PazBqqvqeTHuwppG81FOhPDpMpX7XabCNp2Yp/aZOyAJeuu80f5eK
   2vnzVj+XgeXt0hTYPDBbycWxnoshu/yXPNJJT9CITA7Zx7o6TLJR6cUyl
   +8ueRORmMlcK1fg8KGK6vXKXwNPtsyLfMqMoJDmmo334VIT/QqsMlbkeW
   0AQ0vwwKuQjxDf/GdR+qkJAeEmWVhp1CjpyUatdJLTrqEa3KtzHKMMNMN
   nm7bqerNyZQDK/hUo1lY5CvqyMuKr0HtcP8VfunQidP777e/ZmyOkzZzt
   w==;
X-CSE-ConnectionGUID: vkqJ5dIUTVCfl2+WTBHtZw==
X-CSE-MsgGUID: YbxyiBURS4WKLVaAp+o0rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10299076"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10299076"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 19:07:48 -0700
X-CSE-ConnectionGUID: fX9D8ukwTxa/swG0AAI1Yw==
X-CSE-MsgGUID: Hh+UrfrCTWu4AZjS27jUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="26942419"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa009.fm.intel.com with ESMTP; 01 May 2024 19:07:43 -0700
Message-ID: <ce55d297-ea61-470f-b979-69fcfa743f8e@linux.intel.com>
Date: Thu, 2 May 2024 10:06:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] iommu/riscv: Device directory management.
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <ce3b82a20db0b776685269674ce9b7a926d5680d.1714494653.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ce3b82a20db0b776685269674ce9b7a926d5680d.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_190748_622975_957995F8 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/1/24 4:01 AM, Tomasz Jeznach wrote:
> Introduce device context allocation and device directory tree
> management including capabilities discovery sequence, as described
> in Chapter 2.1 of the RISC-V IOMMU Architecture Specification.
> 
> Device directory mode will be auto detected using DDTP WARL property,
> using highest mode supported by the driver and hardware. If none
> supported can be configured, driver will fall back to global pass-through.
> 
> First level DDTP page can be located in I/O (detected using DDTP WARL)
> and system memory.
> 
> Only simple identity and release (blocking) protection domains are
> supported by this implementation.
> 
> Co-developed-by: Nick Kossifidis<mick@ics.forth.gr>
> Signed-off-by: Nick Kossifidis<mick@ics.forth.gr>
> Signed-off-by: Tomasz Jeznach<tjeznach@rivosinc.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
