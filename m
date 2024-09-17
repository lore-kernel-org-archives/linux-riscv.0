Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3503DC3601A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 14:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLGnhM/SSPRBwbb1e4jzvE1hkALHk/MjPR8AZuU9Eu0=; b=nSDhb4QTHzEZW+
	keZlod6gTaEv+aHOwUCICMfhZW5kXxIFWuhOUih+RezusAUH6GegQFUMSAPXNpXw2ctgbCOPZ5U41
	iipasXUuFZCk6KDE5QPxL8W/vGIRa3NSiOJ6pO4JmXY873IHXzLrNigi6DactPml61pLSeM062smt
	AnKLIOz8GhOQQKWS4lssIwUIM/DMJjsryucOVNSbo7pZb6iA5BZuJB7R+Jw45IPPt5IUKelMfjZWk
	4F6hJS/9sIwreMvjnlmp7s6VZ4HYmHnoCSlx0U5lc5DOiyWhVOeX7eNxQc/kXLM4WKJJgNuAnIENp
	d1HT31xoGKrTJEohBFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYlz-00000006H7B-2bgy;
	Tue, 17 Sep 2024 14:01:43 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYlw-00000006H6Y-1bBr
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 14:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=f+3PEqy3eVzR5SLTyEyR0t5SPJ5FLNpYsuvhkC3ogdc=; b=E0nIo1sg0OQyCNJQqEMdZUzwHG
	+RHkx90nnvmEbr68KOFgz4gBl3AOxDalLhYC17Jp72vwnGSEczQWQVDfR6GCrjuMWZfTf/oe9mRTI
	AWCOG2LfgZOsxcpgM/qM9MRCsYlkE+V1mmi8jTaOrh8S/170dVUxhPBlqhIkSk71Q2Jr6kXQofbnl
	ZARxfjcQiq7V7l8uHSicmtFsfdo4/9fI3ul2D3CsIBhZDXLI5Qyrjyx45FBtJ9iVVvuVH1kgA6sBK
	+yZEdQ8lhBoxRgg4kpzSnEZpu6afMzL00aCm9NdVibynTRioiqtfIaCSIsNLYw1sv+QfSlzrAFy9o
	iMXGMY0Q==;
Received: from [83.68.141.146] (helo=[10.136.0.254])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sqYlr-00BSfR-DO; Tue, 17 Sep 2024 15:01:35 +0100
Message-ID: <bab6f17a-3e39-4be4-a20e-bbdbbc2e81f8@codethink.co.uk>
Date: Tue, 17 Sep 2024 15:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: extern illegal instruction trap and trap RDCYCLE
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
References: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_070140_542192_4CF3B8F1 
X-CRM114-Status: GOOD (  22.28  )
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

On 17/09/2024 14:46, Palmer Dabbelt wrote:
> On Tue, 17 Sep 2024 06:08:50 PDT (-0700), ben.dooks@codethink.co.uk wrote:
>> This is a RFC series to change how the illegal instruction trap
>> is handled and then how to trap RDCYCLE and emulate it with RDTIME
>> instead.
> 
> Only 1/3 made it to lore for me, not sure if it's just stuck somewhere.
> 
>>
>> I did this when we found multiple libraries using RDCYCLE and
>> upgrading multiple runners to newer kernels caused many problems
> 
> OK, so I think we're kind of just stuck with RDCYCLE then -- it was part 
> of the base ISA when we merged the port, and every time it disappears we 
> end up breaking userspace.

Yes, it was an annoyance, we managed to track down all the users and
patch out.

I thought this might be a useful idea for more generic type, so might
look at updating to have a table of instruction masks to call.

> I'm not sure what exactly the right way to do this is: IIRC there's some 
> perf-related hooks for this, but there's also systems that just don't 
> implement the RDCYCLE instruction at all and thus we'll need some sort 
> of emulation for those.

I couldn't get the PMU driver to allow it, not sure if there was an
issue higher up or some other issue?

> So hopefully the other two patches get through the lists at some point, 
> but I think in general this is a reasonable thing to do -- or I guess 
> maybe a completely unreasonable thing to be stuck needing to do, but no 
> way around it ;)

I'll check back later, currently as OSS-EU

>>
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
