Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40725C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 05:01:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E47601FB
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 05:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88E47601FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ImP0YjTpndObySXW41JlJweBQDmio2tBnZHuMDjNkJw=; b=QdttVjWWUDYGjXiyE6BiquIiJ
	1axlZalO9YKnEZqEBuuhtdknWwJLRk+EJZ87dJ3mJlGhilNw+Udzrr7tgVcscjZs57G7NSxgKaImL
	WlsasmLKFM4qVH4oFGWSpixb1LusLDvXB6eXDy4I6yqvo7/xToBCdIlQqNFvZr64n6AQf4iE3lWTq
	DNFNW2Zqy0q9EcjKsZxwMA0wAwoSy9BkVDgQ9umCHnZU2cq+qTHKJHVgiQOpPXr/mL5UyiV1RD3mv
	RXn/EOKKAKeCNAPOMMFQL/6UrKtaK4BCnPWseko+UeNcEnczV9suxBmAivOr/VTbLbb5C8HWNQi2x
	OMUfmQk+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLfLm-00EuCj-Qp; Mon, 15 Mar 2021 05:01:06 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLf6w-00Esem-RI
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 04:46:14 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12F4jHAt008635;
 Mon, 15 Mar 2021 12:45:17 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from [10.0.12.128] (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Mon, 15 Mar 2021
 12:45:14 +0800
Subject: Re: [RFC patch 0/4] riscv: introduce alternative mechanism to apply
 errata patches
To: Vincent Chen <vincent.chen@sifive.com>
CC: linux-riscv <linux-riscv@lists.infradead.org>, Alan Kao
 <alankao@andestech.com>
References: <20210311034707.GA7334@APC301.andestech.com>
 <CABvJ_xghwbPJPKnd+ksSzAq5N0PkjhGMKKz88pT5smgqKz6-JA@mail.gmail.com>
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Message-ID: <ab1931d5-2a50-4263-fc46-35999f803740@andestech.com>
Date: Mon, 15 Mar 2021 12:42:18 +0800
User-Agent: Mutt/1.9.4 (2018-02-28)
MIME-Version: 1.0
In-Reply-To: <CABvJ_xghwbPJPKnd+ksSzAq5N0PkjhGMKKz88pT5smgqKz6-JA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12F4jHAt008635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_044551_006242_7BEF9CD2 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vincent,

> However, if all vendors are willing to suffer the performance impact
> from other vendor's errata, I can change the framework to "#ifdef"
> scheme. After all, it may need to take a lot of time to accumulate a
> lot of errata to make the performance impact obvious.
I'm not sure if I'm interpreting the alternative framework right, yet I have
doubts about the performance arguments.
Just as the example (CONFIG_QCOM_FALKOR_ERRATUM_E1041) I quoted in the 
previous
mail, in their final decision, the `#ifdef` simply toggles the code in
_compile time_ [1].

I don't know why they chose to enable it by default [2], yet ideally, for
irrelevant processors/SoCs, people should be able to turn the option off
without issues.

Somehow, to my best acknowledgment and as you mentioned, in ARM's ecosystem
(more specifically, the distros), alternative-based errata fixes are all 
enabl-
ed by default, so all the errata workarounds will be generated and gathered
into a special section. This will cause the size of Linux image which 
distros
shipped to become larger and larger.

For ARM, that might not be a problem since most of the IC vendors 
nowadays are
licensing from ARM and few of them are making their microarchitectures.
So mi errata es su errata. (My errata is your errata.)

Yet for RISC-V, we have plenty of players who make their home-grown cores on
the field.
This leads to a dilemma: either to enable all the workarounds by default 
so the
distros could just build one general image which will become bloated or
specially crafted images will be provided lead to a fractured experience for
end-users.

My 2 cents on this issue is that maybe we need to establish a principle
(probably not in a written-down manner) on deciding what goes to alternative
and what shall just be an option disabled by default.

Cordially yours,
Ruinland


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/include/asm/assembler.h#n610

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/Kconfig#n805


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
