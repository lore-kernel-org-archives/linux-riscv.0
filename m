Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C063BC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 03:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGeFQcVxk4ZLmJ57tArEga08+z1aTt1VxVuKqWuPygc=; b=4bwL0u2lmSV+AW2biTs1KENu58
	24bpidi6lckpnuRSp5DBmVDIS78vudj1sOlqz5OpaRKKrsveDoSvpBSBA/FdACPjkHLFrAu0htvkZ
	P+5YKKDcz2i8SdkxzZdZfEea7Ow6ke01G1kdbBj/KzACtS4fUrNPXoS6cOJAQR09u8vcDdoOizpcX
	ElQ0X1Vv94Jb9ParT3QQCApSgySkaN+LKnOigbYmOd/KvqR+mu0CKaWiWxn4htwsCWPKYBPnsGR4s
	enb3ZULET4CK9mi+YinPBaXlbYrJL6iHqbgbz8hjPUgZnhD2Y2z9moweT0NEMqLdMDS7VAGpHq/lt
	n7d6QKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2NVE-0000000BL1D-2NIU;
	Thu, 02 May 2024 03:53:00 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2NVB-0000000BKzf-2dQB
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 03:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714621978; x=1746157978;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ufokDlLyeYAEJkn0qhb3kYYK+asNA6o0QGc5jorczJE=;
  b=PxQ4M5vlmg032yFN/ZqCFNCZiSAer7DavAsizPaLbQOwU9DWYX808ASb
   wL2wwWbcbtbPW90v/5XmQozx1Y2jMgPY6vSdkcEz1m08b6v3a3LyB7gX6
   dT0JC6T7oDWGna43cur5zxTgWMcQdjTCJALkR1plMwnVS8G2i4qUyDERn
   Z9SYnrq1sUSBEfxLbIq6QBE9aMMU36odlbyMs6EPZ4Lfumacuah7wiT4w
   LtV8Rblb5QITBZls46d+IsOgVM/g5ab4gpakiUCfOOOOrpC8rGkjy9SE/
   JNZPwpvDReSKX2fbewcchxi734Kof+T98akHDiJmeaHguJXGwsGT0p9CX
   A==;
X-CSE-ConnectionGUID: uRhAGicnRPWJlUZvhp0wxA==
X-CSE-MsgGUID: ZQ4HCsYiQrK73u07wfP6qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14196422"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="14196422"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 20:52:58 -0700
X-CSE-ConnectionGUID: FFGWb+U4Q4Sbss+D92Yhvg==
X-CSE-MsgGUID: kuy6D+XUTs6pBANWIhlM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31662031"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2024 20:52:52 -0700
Message-ID: <1eeed328-fd6c-4740-b1f5-339aad559997@linux.intel.com>
Date: Thu, 2 May 2024 11:51:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] iommu/riscv: Command and fault queue support
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <fbf49cba213b03d42aae398c1b48da06e3f6e1b7.1714494653.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <fbf49cba213b03d42aae398c1b48da06e3f6e1b7.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_205257_755652_643DBA99 
X-CRM114-Status: UNSURE (   9.88  )
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
> Introduce device command submission and fault reporting queues,
> as described in Chapter 3.1 and 3.2 of the RISC-V IOMMU Architecture
> Specification.
> 
> Command and fault queues are instantiated in contiguous system memory
> local to IOMMU device domain, or mapped from fixed I/O space provided
> by the hardware implementation. Detection of the location and maximum
> allowed size of the queue utilize WARL properties of queue base control
> register. Driver implementation will try to allocate up to 128KB of
> system memory, while respecting hardware supported maximum queue size.
> 
> Interrupts allocation is based on interrupt vectors availability and
> distributed to all queues in simple round-robin fashion. For hardware
> Implementation with fixed event type to interrupt vector assignment
> IVEC WARL property is used to discover such mappings.
> 
> Address translation, command and queue fault handling in this change
> is limited to simple fault reporting without taking any action.
> 
> Signed-off-by: Tomasz Jeznach<tjeznach@rivosinc.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
