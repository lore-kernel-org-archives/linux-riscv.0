Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A44C32772
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkMxX3qsiwfkZhVWEwmRDaY9ZoWwzzGuukEisV/tz4o=; b=ntr7VpvpGmwEf3
	ZbyRJ2l3BJF15uNvUH30iKTc9fqQZagXzfrk5wcVe3SrDJszntqwPQySqYjIx6pZfz5ejLbXba7yX
	DlAPFYi0EaUwQSqTWrtXuhbv0SEkUqzpMgDIHyIFCoSKvbDjwmSFBN7lENQ/3hXI+1NBtsKZRqdyR
	7NuKhqMZToCKaRFajLNOrhVAwBqUJZyeBOX4o6UC4ZgIAaLcW+y7S7oGmh1cnGwEHBBXSi4bCdS+j
	xA1bVWKKTE34k3pBvHnr9NaaGpabsIpufzejTNN3I7pt9fA82xH6s4iMc7Bawgd54cavF88Fz9Tu4
	q00vzfmzfTjU9W7IDAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsdJ-00HXlK-N3; Tue, 16 Aug 2022 09:13:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNscz-00HXUx-Nr; Tue, 16 Aug 2022 09:12:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A34AAED1;
	Tue, 16 Aug 2022 02:12:47 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81C5C3F70D;
	Tue, 16 Aug 2022 02:12:45 -0700 (PDT)
Date: Tue, 16 Aug 2022 10:12:43 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com, gregkh@linuxfoundation.org
Cc: palmer@dabbelt.com, catalin.marinas@arm.com, will@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, atishp@atishpatra.org,
	Brice.Goglin@inria.fr
Subject: Re: [GIT PULL] Fix RISC-V's arch-topology reporting
Message-ID: <20220816091243.apz7p2rb4wbxdh2t@bogus>
References: <4849490e-b362-c13a-c2e4-82acc3268a3f@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4849490e-b362-c13a-c2e4-82acc3268a3f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_021251_205227_768F6EE9 
X-CRM114-Status: GOOD (  14.29  )
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

On Mon, Aug 15, 2022 at 10:14:55PM +0000, Conor.Dooley@microchip.com wrote:
> Hey Will/Palmer/Sudeep,
> 
> Catalin suggested [0] dropping the CC: stable for the arm64 patch and
> instead making it a specific prereq of the RISC-V patch & making a PR,
> so here we are.. I was still up when -rc1 came out so pushed it last
> night to get the test coverage, but LKP seems to not have reported a
> build success since early on the 13th so not holding my horses! I built
> it again for both ARMs and RISC-V myself.
> 
> I tagged it tonight, so it's on conor/linux.git as riscv-topo-on-6.0-rc1
> with the prereq specified.
> 
> Not sure if you want to merge this too Sudeep or if that's up to Greg?

I don't have any other patch(other than a fix that I requested Greg to
pick it up directly yesterday) and since you have tagged it already, may be
Greg can pull this or patches directly based on his preference.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
