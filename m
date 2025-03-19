Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78974C35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 21:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3d2XaG+2aos4nz872jVU0pMT6hqwVW6zhfYC4X1XhM=; b=wRXasyKCkzAo+z
	/wZTjbsXNcHxddqu7F45LqSTP+ohc45mTxITdfWBWbl5Bz+a2pycwnXSe6VY8RgHciZOvTOjuwNAP
	R02ZIMdEOb/z+rXNzrzqSoSP6LpHVnL1vo6V19XXKeSJrOGwUxXwg0SuCdJZKP36gh7riOwoeh/yb
	XYGQKMnDgt0Z3oIn+bDm//5R3/NVr7UOCqxVq8A6P8KwwK9mkQ+sE7NMRyvYXvT9Y4dcAPMvBNJgo
	ePOczzqYPSJODJjKua9p89wRhAe6nNRxP03bFC+lNRxwtXBrgAkBKnXrc4Sxu7cAfzjHqx7bfb4cF
	gn1cHgiCyQdgLUhHetqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv16h-0000000AATg-1wRG;
	Wed, 19 Mar 2025 21:37:47 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv16e-0000000AAT8-2LZb
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 21:37:46 +0000
Message-ID: <4d45df0c-d44e-4bb6-8daa-0dba1b834bc4@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742420262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDJL+avqyQivSc/tZpy/FsXCVGYKqm0FhSqiAlMXSfk=;
	b=C3S+6VmgvccqvPi6WWbIAzLwx40URVVAjPIg7cGnBwezs6jYObL58WESqdFHc6noSZbSvw
	T8BeUvDq02cwuDDqht1BshGN2tEqjqjUJk4/j7iUm2/puMeQI18QpatopxEuYwoLwKfQH9
	zlWoGkf4sAsp2jUcdW+6W8EdX3MbYggQwNbJCGMQeOsaKKoQqMNeH1TybmawyFP2kQmOxd
	b5dvD+WZT/iyWKgg2uK5ZxD4R8Rl1UHn5qvG/6d9gC+MupWPQ4MJY7v63dnm9BYH8ezMoY
	ryBbwnEgygNU1+VkpyLrSQHK7RtWILpr8Y9p1PMAGFfj6ffADLDxOYcI9WBR+g==
Date: Wed, 19 Mar 2025 22:37:36 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] include/uapi/linux/swab.h: move default
 implementation for swab macros into asm-generic
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
References: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
 <20250319-riscv-swab-v2-1-d53b6d6ab915@iencinas.com>
 <2afab9dc-e39c-4399-ac5a-87ade4da5ab0@app.fastmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <2afab9dc-e39c-4399-ac5a-87ade4da5ab0@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_143744_894238_61ABBFE2 
X-CRM114-Status: GOOD (  12.62  )
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



On 19/3/25 22:12, Arnd Bergmann wrote:
> On Wed, Mar 19, 2025, at 22:09, Ignacio Encinas wrote:
>> Move the default byteswap implementation into asm-generic so that it can
>> be included from arch code.
>>
>> This is required by RISC-V in order to have a fallback implementation
>> without duplicating it.
>>
>> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
>> ---
>>  include/uapi/asm-generic/swab.h | 32 ++++++++++++++++++++++++++++++++
>>  include/uapi/linux/swab.h       | 33 +--------------------------------
>>  2 files changed, 33 insertions(+), 32 deletions(-)
>>
> 
> I think we should just remove these entirely in favor of the
> compiler-povided built-ins.

Got it. I assumed they existed to explicitly avoid relying on
__builtin_bswap as they might not exist. However, I did a quick grep and
found that there are some uses in the wild.

I couldn't find compiler builtins for ___constant_swahb32 nor 
___constant_swahw32, so I guess I'll leave them as they are.

Thank you!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
