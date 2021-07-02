Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E4FC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 14:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA48E61424
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 14:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA48E61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtWDAzE7pkO1rKiskCIh4ntPioeyfyjgZTuve7/Dc/w=; b=fJ/bp1Cn8JPIOc+qxVxXDIwoCK
	rx/k2ucAPQpHUjQK0ct/ID3l7jIDJl35AqVocp5ZydcLC2N37CXBz0NltfSXf3X24NmWw4CiND4hE
	vunCxrB3Z/SRwdy7AAYIE6khSkjACELsEGLbHwGKBekhvyqUP8qNJ4LJv0L2kv9XwIMSxM1YNUUFj
	cvCZspfBYGgCmZjda7IEZ5w1k0fyklajGwfRw+LdmspGpt5u8kTCsXhwdIXYYJESCvZ1VZcieu+iC
	dG68NNegCrj70SnLY2BSAK7Idh+m08vo9fKdt8tqLv4Pi6T4YHThhTYtB472tx7+Zxp6EP4C2yLqn
	nuix4O+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKIN-003H4r-H6; Fri, 02 Jul 2021 14:37:31 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKIJ-003H45-1t
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 14:37:29 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lzKID-0007JQ-2I; Fri, 02 Jul 2021 15:37:21 +0100
Subject: Re: [PATCH v2 1/3] lib/string: optimized memcpy
To: Matteo Croce <mcroce@linux.microsoft.com>, linux-kernel@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>, Guo Ren <guoren@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, David Laight
 <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
References: <20210702123153.14093-1-mcroce@linux.microsoft.com>
 <20210702123153.14093-2-mcroce@linux.microsoft.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <0e0fa030-8995-b930-5e22-954349a0b82e@codethink.co.uk>
Date: Fri, 2 Jul 2021 15:37:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702123153.14093-2-mcroce@linux.microsoft.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_073727_161528_B1EC811D 
X-CRM114-Status: GOOD (  16.01  )
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

On 02/07/2021 13:31, Matteo Croce wrote:
> From: Matteo Croce <mcroce@microsoft.com>
> 
> Rewrite the generic memcpy() to copy a word at time, without generating
> unaligned accesses.
> 
> The procedure is made of three steps:
> First copy data one byte at time until the destination buffer is aligned
> to a long boundary.
> Then copy the data one long at time shifting the current and the next long
> to compose a long at every cycle.
> Finally, copy the remainder one byte at time.
> 
> This is the improvement on RISC-V:
> 
> original aligned:	 75 Mb/s
> original unaligned:	 75 Mb/s
> new aligned:		114 Mb/s
> new unaligned:		107 Mb/s
> 
> and this the binary size increase according to bloat-o-meter:
> 
> Function     old     new   delta
> memcpy        36     324    +288
> 
> 
> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> ---
>   lib/string.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 77 insertions(+), 3 deletions(-)

Doesn't arch/riscv/lib/memcpy.S also exist for an architecture
optimised version? I would have thought the lib/string.c version
was not being used?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
