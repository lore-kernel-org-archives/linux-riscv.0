Return-Path: <SRS0=n0wm=N2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B42C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 18:32:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA42621780
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 18:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="egllRXzB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="We0OaskB";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="KCuNC0LM";
	dkim=neutral (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="QKu1W79e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA42621780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z9rSIF/2lRSk6Oi8jpvAAoj3GLmHm2VVTU3J16VPf2o=; b=egllRXzBSSlqOGUlfN2lUvpyz
	s/612Yf2o2alvjLaTXKcVf6N2fXWRnL8Aa/k0Hxn4d3jDt1ivJwt4smtlPKFcl0w8zXlVmI6BCAQp
	ae/Qj0OC/carmF8RDrLkSnVgP+R1PzAb9KKur169OG2ngiA2hd2Kf4QN5MZyHY9v3xATCjuJolJH6
	/NicA/+nVFkxH73S+cGa8Dd+eA67wp65oW5WPNMTdenkDRc5Mwl7MfaUJbcAyCDA5uCZnh1BaD86x
	psMPH7dPJMGKbr2Fecfz9tch2WqUbbkGYPReoVl9wDg/NJg6vvDw04guwiQH90ZH9UhMS5KaOxCAv
	WdO0CI0nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNMQs-0007so-Dd
	for infradead-linux-riscv@archiver.kernel.org; Thu, 15 Nov 2018 18:32:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNMQj-0007kf-Tf; Thu, 15 Nov 2018 18:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXw2pducNMEGg8LXDNCXyPXT1w0YwfN9VZ5vMvLas3g=; b=We0OaskBE/MhHEjjVAYYrRwmsl
 qOMfAGNxtLAsmRwnjsZULnNsQS1Mz+o23O6Lh/+QuTMaA6yYvzfUdI4MkUKCF8gQTGY2LaTxya34e
 sRAJ78z7xbYJ2EfkUTxuBMHVLfnemRptamnlL2MtB3MKL8hNuhC8kvMYZTIxxypMGOOMgP9rAQl/l
 4KIfHL8Gg9njYox7I9xrxOURsaxdjXTVtitTFhIrmJo2kslQZ3SrzGTepr/wyIC9fhyK+dcNOw+Py
 td0vFS73o5WKSTWGWCDB9ZUZVmQFi/gj1jEzCqOkI6Sezmw7p/XSWoJHL9KXL1zNpeV8VrMjtoyho
 z0b/f3lQ==;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNMQg-00016a-Fi; Thu, 15 Nov 2018 18:31:52 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 6276E60764; Thu, 15 Nov 2018 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1542306695;
 bh=jpEIkjvcZ8jlQzVWhG3nb8LE1eYiqzJG4XzJilQuduI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KCuNC0LMz7AfCGu/kdvTHh7oblZPtonfPdbiEoVPpiJzyGShTBzNZX2QvIvzHPaoq
 Q/jlFSmTdBpsN/3MuO82Fg+dFlNlhnhFDJzq82AW4FzLL5bV03x8AA4WPZcimFFxxG
 9xKiMOIrZhhNwcB9BnhdRkM6vxS6tu8mVVSOGw24=
Received: from [10.226.60.81] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jhugo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 909E96044B;
 Thu, 15 Nov 2018 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1542306694;
 bh=jpEIkjvcZ8jlQzVWhG3nb8LE1eYiqzJG4XzJilQuduI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QKu1W79eS6Bw8yuhfurqGZFSHwzm/7sD/nYeABUsCmytWancBGfZ6zLl2EvyszIyd
 zX5w9mkzJJaO+prs6AEWlVgKsn1jNkoZ58EchcUTq2w4dwishZ12L2ze90yQ0U3WCw
 pGo2DvmiAn2FUcL1QafDrEo8TfMrYqzA4pmAvftY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 909E96044B
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [RFC 0/3] Unify CPU topology across ARM64 & RISC-V
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <07d92dd4-f943-47ee-e168-46bfaf4ed755@codeaurora.org>
Date: Thu, 15 Nov 2018 11:31:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181115_183150_780883_CE1C4B11 
X-CRM114-Status: GOOD (  25.58  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 juri.lelli@arm.com, anup@brainfault.org, palmer@sifive.com,
 jeremy.linton@arm.com, robh+dt@kernel.org, sudeep.holla@arm.com,
 mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181115183133.ek03hSxJIRLj5o9AG6jdZegEz5z3YxiOH8SFQatTnqk@z>

On 11/8/2018 6:50 PM, Atish Patra wrote:
> The cpu-map DT entry in ARM64 can describe the CPU topology in
> much better way compared to other existing approaches. RISC-V can
> easily adopt this binding to represent it's own CPU topology.
> Thus, both cpu-map DT binding and topology parsing code can be
> moved to a common location so that RISC-V or any other
> architecture can leverage that.
> 
> The relevant discussion regarding unifying cpu topology can be
> found in [1].
> 
> arch_topology seems to be a perfect place to move the common
> code. I have not introduced any functional changes in the moved
> to code. The only downside in this approach is that the capacity
> code will be executed for RISC-V as well. But, it will exit
> immediately after not able to find the appropriate DT node. If
> the overhead is considered too much, we can always compile out
> capacity related functions under a different config for the
> architectures that do not support them.
> 
> The patches have been tested for RISC-V and compile tested for
> ARM64.
> 
> The socket changes[2] can be merged on top of this series or vice
> versa.
> 
> [1] https://lkml.org/lkml/2018/11/6/19
> [2] https://lkml.org/lkml/2018/11/7/918
> 
> Atish Patra (3):
>    dt-binding: cpu-topology: Move cpu-map to a common binding.
>    cpu-topology: Move cpu topology code to common code.
>    RISC-V: Parse cpu topology during boot.
> 
>   Documentation/devicetree/bindings/arm/topology.txt | 475 -------------------
>   .../devicetree/bindings/cpu/cpu-topology.txt       | 526 +++++++++++++++++++++
>   arch/arm64/include/asm/topology.h                  |  23 +-
>   arch/arm64/kernel/topology.c                       | 305 +-----------
>   arch/riscv/Kconfig                                 |   1 +
>   arch/riscv/kernel/smpboot.c                        |   6 +-
>   drivers/base/arch_topology.c                       | 303 ++++++++++++
>   include/linux/arch_topology.h                      |  23 +
>   include/linux/topology.h                           |   1 +
>   9 files changed, 864 insertions(+), 799 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/arm/topology.txt
>   create mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt
> 

I was interested in testing these on QDF2400, an ARM64 platform, since 
this series touches core ARM64 code and I'd hate to see a regression. 
However, I can't figure out what baseline to use to apply these. 
Different patches cause different conflicts of a variety of baselines I 
attempted.

What are these intended to apply to?

Also, you might want to run them through checkpatch next time.  There 
are several whitespace errors.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
