Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5853CC28CF8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 15:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D99B2087E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 15:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EXhVQd7n";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="JAIvCevJ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="JAIvCevJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D99B2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TI7IbYY0br+eISzgHebXVFWpX7mV4o25WhwHbAiD+ts=; b=EXhVQd7nhSAahCRgGqekaBzx0
	bOX80DItFLaj0Bp5ZsJSwwiSuwR5UmesfoCqkKbjFfngET4dAQzGXBnYFnSqDAXXPievIOsd1glji
	rV5OzB3TuVjTeXKCR8OrgMhLS0R4WxN7OEB6d1f10CEdT2Sh4shpMwt6nQIP+H4gXLO1C9E7DSzhr
	buETtgDVjDjZOT9ThmtA3oQ40eosQUIu3NGg2h1bWX4bhdoniPcU+1Sbd0VhNTgDu7rVZfR8WTZsL
	v9cqnyTUJFFIQNdhth2aSQm0waCEcwtq4uL2qBhd8mK8CQBF/uGeXKZ+rb3s9yTnF4sibt4O2So8V
	Q0guzjhnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP7x9-0002H4-G4; Tue, 20 Nov 2018 15:28:39 +0000
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP7x1-0001tn-JL; Tue, 20 Nov 2018 15:28:32 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id C35786020B; Tue, 20 Nov 2018 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1542727700;
 bh=m0p22JJsxKd1q1uJL2YmVOjRbHzUu7zoN5ew8++y+/4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JAIvCevJmrHjMXj8BdPXVHS/bVRpbtJsXKq1GVCKoHj4mn/j+ow3kWXvVLl4nfohk
 nGxgN4NtSQMLluzPLxiVLNcMe7raLg2wijZ0uq0sGAZ2eI9uAQyznjaL+A9AJiOLXx
 O9OVQEDPAxpaxlCTo3hlI4Dq7+brXM1EyGbPsi4E=
Received: from [10.226.60.81] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jhugo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D04B6020B;
 Tue, 20 Nov 2018 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1542727700;
 bh=m0p22JJsxKd1q1uJL2YmVOjRbHzUu7zoN5ew8++y+/4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JAIvCevJmrHjMXj8BdPXVHS/bVRpbtJsXKq1GVCKoHj4mn/j+ow3kWXvVLl4nfohk
 nGxgN4NtSQMLluzPLxiVLNcMe7raLg2wijZ0uq0sGAZ2eI9uAQyznjaL+A9AJiOLXx
 O9OVQEDPAxpaxlCTo3hlI4Dq7+brXM1EyGbPsi4E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D04B6020B
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [RFC 0/3] Unify CPU topology across ARM64 & RISC-V
To: Sudeep Holla <sudeep.holla@arm.com>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
 <07d92dd4-f943-47ee-e168-46bfaf4ed755@codeaurora.org>
 <20181120111146.GA6497@e107155-lin>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <35b92f83-dbbf-fad2-561f-49b0933ffe19@codeaurora.org>
Date: Tue, 20 Nov 2018 08:28:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181120111146.GA6497@e107155-lin>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_072831_672158_43D8F289 
X-CRM114-Status: GOOD (  19.24  )
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
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 Atish Patra <atish.patra@wdc.com>, robh+dt@kernel.org, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120152818.zd4Vz2mNt4nHbe95XyH0xaQo9zC7AKqGv9jeonbY3Ko@z>

On 11/20/2018 4:11 AM, Sudeep Holla wrote:
> On Thu, Nov 15, 2018 at 11:31:33AM -0700, Jeffrey Hugo wrote:
> 
> [...]
> 
>>
>> I was interested in testing these on QDF2400, an ARM64 platform, since this
>> series touches core ARM64 code and I'd hate to see a regression. However, I
>> can't figure out what baseline to use to apply these. Different patches
>> cause different conflicts of a variety of baselines I attempted.
>>
> 
> Good to know that we can test DT configuration on QDF2400. I always assumed
> it's ACPI only.

It is ACPI only in the production configuration.  I suppose we could 
hack things up to do basic DT sanity, but I expect it would be nasty and 
non-trivial.

> 
>> What are these intended to apply to?
>>
> 
> The series alone may not get the package/socket ids correct on QDF2400.
> I have not yet added support for the same as I wanted to get the initial
> feedback on DT bindings. The movement of DT binding and corresponding
> code should not regress and you should be able to validate only that
> part.
> 

On a cursory glance, it looks like some of the reorganized code would 
also be used in the ACPI path (things that are common between DT and 
ACPI).  I do not expect problems, but I still feel its prudent to do a 
sanity check on actual hardware.

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
