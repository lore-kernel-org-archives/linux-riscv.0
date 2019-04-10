Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30A0C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 22:50:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD1C920830
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 22:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HXwTDRz8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fWcmmRay"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD1C920830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kX2wFYEFsCIw2ouW5qxn3tT1hkVG1BmKFUn0PJB0SoU=; b=HXwTDRz8408FvhPqaHwBJq6Ky
	HgBsbrfwyjLcj0WGIRds41cTL2Pg6Oi59FlBnCBzFOEt7Je7v6jJ6+LnMdSuQ08A42QzYbFXsyR8p
	zhYSHUcnnHOVaRdLwR/icWxBkhDxQzyFgd9FW2WWo9rhMJnv07F+P/JpGnq9z8oTXIa47jrJ8HcWk
	zmUuOTerQz98tvT0bQUJ1Y4IkMBti6bVcj3ifQS66rDOVExfMHqpPv6XJX80Gia2iqAuyUxzO/Z27
	1xnXEalM9IbRdJDUn7DNWkiP7DK0IKVkRyyTydpRBftboKpplQUfyhocBSD2dKaEQYHAfXl68VXuN
	URzsaryjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEM2i-0005AB-BY; Wed, 10 Apr 2019 22:50:08 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEM2f-0004df-De
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 22:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554936605; x=1586472605;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YfDM8y1jUvGmA5+FC2aYt2d1GKWwr2xeQQzppluCf58=;
 b=fWcmmRayIK1Tk11d6Qv8nNeneHE8LYnTdrKFc5Lz/3MvCnvd/zo18bGd
 3hN0pAdLS0sf2VL/u+4X4oVww6qVsN3J8tt72nngxjFsIgKK4f7Jk5Wqm
 yXKnlDIhC0zvA38/+sefu126+h9htwTLPunzNj95DpCOKUjzOH5H5pA39
 J1GxeDUtcPejrKjGFCzZdWwm5PjqLGFPBwTi9Oy6HiAjAFLtCN5awvaoY
 N4xgbmmYYSsciKMm1+huJPKT1Vd005JxQ74t2n6D3T5oioIdvzzC4hfES
 q9zR4/+NGHoMPRc4qGxf6v2dlFNSMZcihYH9JJOUBEp7xFWj9iwp2ZghF g==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="105470865"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 06:50:05 +0800
IronPort-SDR: tkpa18+BL4tTpkHn25HnMM+TWW9HQsT2LzcMj2K+fvebPq0DwjzFAstVYdZCSrJfcueuIR86aS
 b+FZq2Tq5PTUd4sU3kkGPIM+8RaY7h/u+DegWZKI0P5TtxYPhcRdEJbJWwg1+MKoUGjHN1d8Ox
 XbRpEgnNjD2+l28ejAjYUhF2N1LaEPlL7iFniIZ4xBEnPKX1xS0c+Lg93dA5PoHBhqhsHzZtEJ
 Iz18TKoKDn2xWLAj2wsAVDVWtYChF3tMSjGcnXJvxUNOWtMhBjXhY4jrhobk+Oj/+pCTZzAOz7
 7D1bKcwTceQ2awhbhiAkw0o7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 10 Apr 2019 15:26:59 -0700
IronPort-SDR: 7mSdHEoCianBaHf7rrpda0MqEGGKw/fw+SdX6j1stqwolJRtrx8c8wTjw0Z5OJTcJHgohDh66O
 ar41LAeDakEZlMd4IVjYTkxaBst+HHQuW9vbEP0BiA5i7bAGty1K9+nnC+DFW9AS88o5q2RnDU
 YNje4lZ2k93vmmddcG2XXahNZxr7rFL4JMqHrXe5k7GCDWfwmu3STxRB8lIbXG/H2IbNSmem8M
 HOl5rlCNrpUM4gGGjf1oJrUlnrKKbi3C1Ijs8kkrhPCv4WzR/4PDP1NlR76quB+3upjlx9a7+5
 mLU=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Apr 2019 15:50:05 -0700
Subject: Re: [RFT/RFC PATCH v3 0/5] Unify CPU topology across ARM & RISC-V
From: Atish Patra <atish.patra@wdc.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190320234806.19748-1-atish.patra@wdc.com>
Message-ID: <12c9f8b0-cdeb-2b9c-5662-6c5a08cd0a95@wdc.com>
Date: Wed, 10 Apr 2019 15:49:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190320234806.19748-1-atish.patra@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_155005_512208_ED477FE2 
X-CRM114-Status: GOOD (  25.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Otto Sabart <ottosabart@seberm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Will Deacon <will.deacon@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/20/19 4:48 PM, Atish Patra wrote:
> The cpu-map DT entry in ARM can describe the CPU topology in much better
> way compared to other existing approaches. RISC-V can easily adopt this
> binding to represent its own CPU topology. Thus, both cpu-map DT
> binding and topology parsing code can be moved to a common location so
> that RISC-V or any other architecture can leverage that.
> 
> The relevant discussion regarding unifying cpu topology can be found in
> [1].
> 
> arch_topology seems to be a perfect place to move the common code. I
> have not introduced any significant functional changes in the moved code.
> The only downside in this approach is that the capacity code will be
> executed for RISC-V as well. But, it will exit immediately after not
> able to find the appropriate DT node. If the overhead is considered too
> much, we can always compile out capacity related functions under a
> different config for the architectures that do not support them.
> 
> There was an opportunity to unify topology data structure for ARM32 done
> by patch 3/4. But, I refrained from making any other changes as I am not
> very well versed with original intention for some functions that
> are present in arch_topology.c. I hope this patch series can be served
> as a baseline for such changes in the future.
> 
> The patches have been tested for RISC-V and compile tested for ARM64,
> ARM32 & x86.
> 
> The socket change[2] is also now part of this series.
> 
> [1] https://lkml.org/lkml/2018/11/6/19
> [2] https://lkml.org/lkml/2018/11/7/918
> 
> QEMU changes for RISC-V topology are available at
> 
> https://github.com/atishp04/qemu/tree/riscv_topology_dt
> 
> HiFive Unleashed DT with topology node is available here.
> https://github.com/atishp04/opensbi/tree/HiFive_unleashed_topology
> 
> It can be verified with OpenSBI with following additional compile time
> option.
> 
> FW_PAYLOAD_FDT="unleashed_topology.dtb"
> 
> Changes from v2->v3
> 1. Cover letter update with experiment DT for topology changes.
> 2. Added the patch for [2].
> 
> Changes from v1->v2
> 1. ARM32 can now use the common code as well.
> 
> Atish Patra (4):
> dt-binding: cpu-topology: Move cpu-map to a common binding.
> cpu-topology: Move cpu topology code to common code.
> arm: Use common cpu_topology
> RISC-V: Parse cpu topology during boot.
> 
> Sudeep Holla (1):
> Documentation: DT: arm: add support for sockets defining package
> boundaries
> 
> .../topology.txt => cpu/cpu-topology.txt}     | 134 ++++++--
> arch/arm/include/asm/topology.h               |  22 +-
> arch/arm/kernel/topology.c                    |  10 +-
> arch/arm64/include/asm/topology.h             |  23 --
> arch/arm64/kernel/topology.c                  | 303 +-----------------
> arch/riscv/Kconfig                            |   1 +
> arch/riscv/kernel/smpboot.c                   |   3 +
> drivers/base/arch_topology.c                  | 298 ++++++++++++++++-
> drivers/base/topology.c                       |   1 +
> include/linux/arch_topology.h                 |  36 +++
> 10 files changed, 453 insertions(+), 378 deletions(-)
> rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (66%)
> 
> --
> 2.21.0
> 
> 

Ping?

Specifically, patch 3 & 4 affects ARM & ARM64. Any tests on real 
hardware would be great.

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
