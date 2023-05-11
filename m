Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194D0C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=655XJWPt97mA7btP7/iiM8ZKD+baUXUDeV1Gj6wZ0is=; b=lMMN3Ep/p/KGbx
	Fxo4h1lZ1F2DMUHWHrEBvDc/Nl3LvXjsFE9twkfyo4568txGuTfAOndZTYFaBpjk4tupRk36Bb8wu
	7U28lHO3qNc/pG+1B9extSwElMCf4TOJCgOklZymNwHbYabblaTNcENy8Zhcm76bFYVHDpk57UhWP
	0k3zNXedQi6PYOPeEEWe9ZR33eZh3WuHnKw8T8JgzfUy01RJMUmlr1kEgkha+RhOqjuKLbNQKrttn
	tZmH7syQLl50tmkK8yYCdHwM7z7T0nNSXOBfUG5OXSu8qN6ICJ4Vm8EHAGqq34V/DgjliamSvKKfb
	G4eg1t7PnPRL9zZ9woCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6tL-008xd9-38;
	Thu, 11 May 2023 14:03:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6tJ-008xcN-1u
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 14:03:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7CFF661A7C;
	Thu, 11 May 2023 14:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACD7C433D2;
	Thu, 11 May 2023 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683813811;
	bh=NvgptMXhoibVUzwMhVycsWLnIvK3fc/9CTGYWKNunNM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T2vpb78EXlrqTCLfdpy7FD2AruqhHuzlgr+rxt/4McJyAgp4jjUrdObAQWTHkFYN/
	 ak8q1lPAjB/dZ5msC10PFGQbxFfz5zqP+w2tFkw13wnj+WrJNRYdu0FFXXnFz3C7w/
	 FW5F96WWEkN+VJhqJ4yF17WdKwyjStqQ0eR0EzISDzxzMuWuUrsyg+35dCvtVSWuur
	 omqEGMbhrQ+w9wURS5faW9/pzGwRpaLqTsiQOHvYhUiV4jRliO7HK4dwQUASflE/wL
	 JfaU3ZyOa5WeEOwOhY5uqUIyzugJyZR/Xf19UkfPlD2TLTXU7692ZwleCUEzg3Bg5j
	 1r+JAhOFsn2ng==
Message-ID: <97dd1d05-cfc4-61aa-ac3e-cc1a662c63ed@kernel.org>
Date: Thu, 11 May 2023 16:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: cdns,macb: Add
 rx-watermark property
To: Pranavi Somisetty <pranavi.somisetty@amd.com>,
 nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 palmer@dabbelt.com
Cc: git@amd.com, michal.simek@amd.com, harini.katakam@amd.com,
 radhey.shyam.pandey@amd.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230511071214.18611-1-pranavi.somisetty@amd.com>
 <20230511071214.18611-2-pranavi.somisetty@amd.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230511071214.18611-2-pranavi.somisetty@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_070333_697445_2ED1904C 
X-CRM114-Status: GOOD (  10.52  )
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

On 11/05/2023 09:12, Pranavi Somisetty wrote:
> watermark value is the minimum amount of packet data
> required to activate the forwarding process. The watermark
> implementation and maximum size is dependent on the device
> where Cadence MACB/GEM is used.
> 
> Signed-off-by: Pranavi Somisetty <pranavi.somisetty@amd.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested.
Please resend and include all necessary entries.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
