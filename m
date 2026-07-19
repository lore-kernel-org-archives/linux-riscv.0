Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02A5C4450A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n40gkZsTn8nYZMZKQSfhDf9hw61R8XmI6mbtyiw7IsQ=; b=1tMD5bizRoh0cU
	MA9DdfDM7hgTm5HfOwFTUc7WbrEhmQsPLWIWf2Agf61jaZxqw5Bx+6sPWSuV4figCvH7kzeDoVt8Y
	hjtw1ow5bByQN+Jj8dUDUrYUmUdQVDaVOXqbR0PXuUtrwpF2gtFD9J/9fFwv8PQJrHpoS2Odr5sAA
	EF2ZJ3Ww+7nOWpvOui610XbJC4YuqeK0nKPAxzIdfGmmKa5IWPKba5viS2lesrdGx++YwFQz9Afz7
	YZH3Eq5tJm72XPvPpHLGdK7hpgwreLNd2v+eoYzSPMYBEv8UygvJUfzNiyhxg+IWeuNs70HVBxUWK
	+PyNEAt4M5gWKCxlfWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU2R-000000058xa-3VIO;
	Sun, 19 Jul 2026 16:06:47 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU2O-000000058x7-101H
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 16:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1784477180;
	bh=Q8iDxIG5rzBraxaTwXCs8qargwBew5IqNBt/AQGfd0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ahtVlENi3Rsd0F4VNPQMMXB9sLLN28kd2elgVRrmhkB9g7RXYfZp8nFyqLYcF0Mxr
	 w8Lrn6WtqDPO99n/b49BKEjdhP7RxtpA+Noy14wUeqJJ0fkTJmtKzeRccNzRifzx49
	 Gn0YT1oulm9eSg0gIvqd6mQKF21pO9QhH7VtSvEUuK0UR1/E1xnIa2b40zc+rRaAVw
	 A0RpTReWQB4+zo8Z/a192VnEKPG0vYfmAXZlRzph/f5Tb/hYzbgOvrOARkOujuhKHS
	 PIMal1dWGyHKfgiHNRdQI2BhfqYvLw5qzzn7/lMiMimau35njqDh7Kt7if4smwXg4y
	 tz115qnfFqjyA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8E1AEB2213CB;
	Sun, 19 Jul 2026 18:06:19 +0200 (CEST)
Message-ID: <501b84f5-ca7d-441d-818f-eb78dc202983@freeshell.de>
Date: Sun, 19 Jul 2026 09:06:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
To: Yixun Lan <dlan@kernel.org>, Andrew Rembrandt <kernel@rembrandt.dev>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork> <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork> <aikmOfazxdrhpty7@mcmanus>
 <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
 <20260710022551-GKA106000@kernel.org>
 <738ce6b8-798b-4689-a0f5-791fe85addbc@freeshell.de>
 <als2a8ra4PB6Y1t5@mcmanus> <20260719102857-GKA8523@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260719102857-GKA8523@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_090644_754247_2D8A4F70 
X-CRM114-Status: GOOD (  16.34  )
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

Hi Andrew, Yixun,

On 7/19/26 03:28, Yixun Lan wrote:
> Hi Andrew,
> 
> On 11:07 Sat 18 Jul     , Andrew Rembrandt wrote:
>> Hi E, Yixun,
>>
>> On Fri, Jul 10, 2026 at 07:34:34 am E Shattow wrote:
>>> On the topic of this ethernet TX timing thread I don't know what
>>> this does? Is there a test situation I may try to know if it is doing
>>> anything? Thanks very much, -E
>> Apologies for the slow reply -- I've been swamped the past month.
>>
>> Thank you for taking the time to test this; your results are what
>> prompted me to go back and re-test properly, and it turns out my
>> original premise was wrong.
>>
>> The non-functional TX I originally saw was not fixed by this delay
>> property at all. An unrelated commit that landed between v7.1-rc1 and
>> v7.1-rc7 is what actually fixed the dead TX on my board. While
>> developing this patch I'd inadvertently picked up that change, and I
>> wrongly concluded the tx-internal-delay-ps addition was what got traffic
>> flowing.

I guess this refers to commit 3ea695eb111f ("dts: riscv: spacemit: k3:
Fix I/O power settings") pulled in for 7.2 and with the fixes tag also
applied for 7.1 prior to 7.1-rc6 tag. That was confusing for me until
having the benefit of an explanation by the Fedora RISC-V special
interest group discussion member(s) highlighting that patch, as I was
experiencing three distinct problems for that network interface. My use
of debian-installer just happens to be a reproducer for all three
problems. The Fedora RISC-V SIG members did not have difficulty with
their distro development processes on two of the three problems I
experience which led me to identify there are remaining problems not
fixed in 7.1

>>
>> To confirm, I re-ran a series of iperf3 tests without the delay patch
>> and saw no transmission problem whatsoever -- a full 1Gb/s in both
>> directions with no errors. So this matches exactly what you and perhaps
>> Yixun also observed: on a current base the property makes no measurable
>> difference, because the TX path already works without it.

Andrew, there are remaining problems of de-assert delay [1] and
rmmod/modprobe cycle failure [2]. I suggest you test and validate the
proposed changes so providing another data point of [1] the minimum
delay that is successful. The rmmod/modprobe cycling workaround [2] can
also benefit from testing. In the case of Kconfig with k3 networking =m
as modules, or =y compiled-in either way it would be helpful to know
that your use of networking is not disrupted in some unexpected way with
the expected fixes.

Yixun, are patches [1] [2] expected as fixes for 7.2 ?

1:
https://lore.kernel.org/lkml/20260710063314.1030249-1-inochiama@gmail.com/
2: https://lore.kernel.org/lkml/20260712045233.800748-1-inochiama@gmail.com/

- E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
