Return-Path: <SRS0=cwjh=T7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D962BC04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 May 2019 05:05:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A17263E6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 May 2019 05:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="or1gOdkd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A17263E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EYMPphQvaxCIITsB9RKHSCkjDbj0ARO0I6W+uoEolNI=; b=or1gOdkd3Q+ccTh+OvrkKC8Le
	oyi9WBJUQEh3lpPzc6tYaaETfpE+EzhyL3JIiwyq55RCiXWvYG3nydGByiJevXwVXEpygXH6r940F
	CuDt7LAduP7vHOCbannSMQ/oDN6fVse7SiHF2ZEc2KUGZm583XLVzLK057kgKLMI8XiC58QvOscK4
	gmhIJDlgebn4RVPifs/78FupwikoG+SGbgaYDMiDhP2kKqmhuEAPZqieMDOgUcaSB5gg67mMNUgLi
	epMrSLw7QQSbWsGrWr4OUfcWPqNgcIwW1t/a/MWY5yUYksTGH0B15Nc+qrJ5S13F6XhuJuWiXjWOn
	Sbh1aLMag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWZjW-0004ZK-J3; Fri, 31 May 2019 05:05:38 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWZjP-0004TY-1N; Fri, 31 May 2019 05:05:32 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.12] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6BA8020002;
 Fri, 31 May 2019 05:04:56 +0000 (UTC)
Subject: Re: [PATCH v4 00/14] Provide generic top-down mmap layout functions
To: Kees Cook <keescook@chromium.org>
References: <20190526134746.9315-1-alex@ghiti.fr>
 <201905291313.1E6BD2DFB@keescook>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <d4e04178-e6f3-6d11-4ab8-9be7cf8ae87a@ghiti.fr>
Date: Fri, 31 May 2019 01:04:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <201905291313.1E6BD2DFB@keescook>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_220531_240199_B54FD19E 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/29/19 4:16 PM, Kees Cook wrote:
> On Sun, May 26, 2019 at 09:47:32AM -0400, Alexandre Ghiti wrote:
>> This series introduces generic functions to make top-down mmap layout
>> easily accessible to architectures, in particular riscv which was
>> the initial goal of this series.
>> The generic implementation was taken from arm64 and used successively
>> by arm, mips and finally riscv.
> As I've mentioned before, I think this is really great. Making this
> common has long been on my TODO list. Thank you for the work! (I've sent
> separate review emails for individual patches where my ack wasn't
> already present...)


Thanks :)


>>    - There is no common API to determine if a process is 32b, so I came up with
>>      !IS_ENABLED(CONFIG_64BIT) || is_compat_task() in [PATCH v4 12/14].
> Do we need a common helper for this idiom? (Note that I don't think it's
> worth blocking the series for this.)


Each architecture has its own way of finding that out, it might be 
interesting if there are other
places in generic code to propose something in that sense.
I will search for such places if they exist and come back with something.

Thanks Kees for your time,

Alex


>
> -Kees
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
