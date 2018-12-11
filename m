Return-Path: <SRS0=hxTO=OU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5679EC5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 00:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D972084E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 00:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="meTitPGu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="gCuyZUBI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22D972084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dh7jHLD3kQgS+pmg6wLKm+3SLAfi1vM6vPWuJAcQ2Eo=; b=meTitPGucVB6tkgN8mH2BjTgE
	iwpn7brqBima0yF7C7Jh6Z3BWZ1ATFMB2P1RQ6NnhHyacO7VkssUJyD3nzZrU58fehZpZM/Y+Zk2K
	o3Tm5qNZxQbFc5apWsI+rRJzuipNhJ4h1Giwr7E7+uf1mt4xHsXBnM/sw7fgiTSEUhgCPSrMnB513
	zTuS+6/Hc3gDO3g3jWtBJCDT8+zJ99L0QydjxAcXehPQ6IinKCG0PSO7MD+IxeSnXxpIq3oFCpv3p
	YbyNLvoAiQUqz9K8vAXza7ZJ5V+KoJkwkfILDO9AKy+CWXuGrm7cciZL9TdVwjZRg831qhgkhCWiX
	QyzFVBzxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWVeG-0000z5-Ia; Tue, 11 Dec 2018 00:11:40 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWVeE-0000y7-9R; Tue, 11 Dec 2018 00:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544487096; x=1576023096;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yOAXje27PgeYE34HSOVYaOHf47IeAXxcPCAr+k9KhTU=;
 b=gCuyZUBIWMXP8gGw2pVc3eZamE3/kPty2ompKEPE8QzJal0NkEVqG/mQ
 V7UYpXNr02hUktRomfTRRwPvfNdBXDl2gWV/iOT1A2XNxvVEKxKsyTUeq
 CEGyQwbQ47eUcFppl7w8yyDMwrLFoRmY4C7UJq/LovPvbAk50U98uFJkr
 Llb3eEyNiaSHNoK+Vx3B4VaDd/x0PKJArSlKWGy8EiXrR3FW6kcYIXrO9
 wmBUppvKRVveTpWOe9vmJZfAT+xQUNgUY7SUMpXHpL8ZaK7cyZEAgFn35
 oBeJaAoPRFpy4JMwEM8kTvabhi+hUFrJwO3N2xpgTPi6iMJsmPi/P+z2G Q==;
X-IronPort-AV: E=Sophos;i="5.56,340,1539619200"; d="scan'208";a="101172450"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2018 08:11:21 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 10 Dec 2018 15:53:08 -0800
Received: from colley-l-lt.ad.shared (HELO [10.86.57.118]) ([10.86.57.118])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Dec 2018 16:11:21 -0800
Subject: Re: [RFT PATCH v1 0/4] Unify CPU topology across ARM64 & RISC-V
To: Morten Rasmussen <morten.rasmussen@arm.com>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <20181207134509.GA5913@e105550-lin.cambridge.arm.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <dffd0d6e-bebe-ae31-548b-1778d08a3285@wdc.com>
Date: Mon, 10 Dec 2018 16:11:21 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181207134509.GA5913@e105550-lin.cambridge.arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_161138_339102_4C8EFFC1 
X-CRM114-Status: GOOD (  20.79  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Juri Lelli <juri.lelli@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/7/18 5:45 AM, Morten Rasmussen wrote:
> Hi,
> 
> On Thu, Nov 29, 2018 at 03:28:16PM -0800, Atish Patra wrote:
>> The cpu-map DT entry in ARM64 can describe the CPU topology in
>> much better way compared to other existing approaches. RISC-V can
>> easily adopt this binding to represent it's own CPU topology.
>> Thus, both cpu-map DT binding and topology parsing code can be
>> moved to a common location so that RISC-V or any other
>> architecture can leverage that.
>>
>> The relevant discussion regarding unifying cpu topology can be
>> found in [1].
>>
>> arch_topology seems to be a perfect place to move the common
>> code. I have not introduced any functional changes in the moved
>> code. The only downside in this approach is that the capacity
>> code will be executed for RISC-V as well. But, it will exit
>> immediately after not able to find the appropriate DT node. If
>> the overhead is considered too much, we can always compile out
>> capacity related functions under a different config for the
>> architectures that do not support them.
>>
>> The patches have been tested for RISC-V and compile tested for
>> ARM64 & x86.
> 
> The cpu-map bindings are used for arch/arm too, and so is
> arch_topology.c. In fact, it was introduced to allow code-sharing
> between arm and arm64. Applying patch three breaks arm.
> 
> Moving the DT parsing to arch_topology.c we have to unify all three
> architectures. Be aware that arm and arm64 have some differences in how
> they detect cpu capacities. I think we might have to look at the split
> of code between arch/* and arch_topology.c again :-/
> 
> Morten
> 
Thank you for bringing this up. I will send a new version and make sure 
that it works on arm32 as well.


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
