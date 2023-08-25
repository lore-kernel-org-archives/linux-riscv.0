Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C0C3DA66
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 19:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnaCbpJbJnqO4rlKA41SwkGvaDsIFyIepPTx1ccscFs=; b=MjjsIFiDI61UVz
	KU/6MmUMk3jlwSHl9DcKpwX3iDX7t1DD8G9t3FkxhFGyE82HRfibvNXVH4NZuKgxHXyeGQcB1SisY
	No8Cr1Cq0p4zPuwcFsHtm/k6OlmB6oWK/wWyIRvu/O/w0xVKcEgMBVIuGXcmopSnmCukhzzeSIfE5
	J3AUs7rjqs6KepjRSjHT79cRsm3vYRfFN/pXWQP+EywjM+L+T39RhWnj9e/yYboGeOGHE73rvMD+Z
	0cJ4Smfvgn2NxHXbicBvuieCPuolVE8qCdLnGFkr3qPrWCY+VrBo61l9qNrpuc8Z+Icyh1WYiC6WP
	8jw+ZcxrIoKUCc93zqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZcDU-005vPp-1U;
	Fri, 25 Aug 2023 19:11:32 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qZcDR-005vPP-1T;
	Fri, 25 Aug 2023 19:11:29 +0000
Message-ID: <a5d07fee-b950-ea48-c480-dd5a8a575969@infradead.org>
Date: Fri, 25 Aug 2023 12:11:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20230824223606.never.762-kees@kernel.org>
 <21193a52-0425-f5ae-90f0-10e4c578ae90@infradead.org>
 <202308251119.B93C95A3A7@keescook>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202308251119.B93C95A3A7@keescook>
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



On 8/25/23 11:20, Kees Cook wrote:
> On Thu, Aug 24, 2023 at 05:04:02PM -0700, Randy Dunlap wrote:
>> Hi Kees,
>>
>> On 8/24/23 15:36, Kees Cook wrote:
>>> Doing a "make help" would show only hard-coded Kconfig targets and
>>> depended on the archhelp target to include ".config" targets. There was
>>> nothing showing global kernel/configs/ targets. Solve this by walking
>>> the wildcard list and include them in the output, using the first comment
>>> line as the help text.
>>>
>>> Update all Kconfig fragments to include help text and adjust archhelp
>>> targets to avoid redundancy.
>>>
>>> Adds the following section to "help" target output:
>>>
>>> Configuration fragment targets (for enabling various Kconfig items):
>>>   debug.config         - Debugging for CI systems and finding regressions
>>>   kvm_guest.config     - Bootable as a KVM guest
>>>   nopm.config          - Disable Power Management
>>>   rust.config          - Enable Rust
>>>   tiny-base.config     - Minimal options for tiny systems
>>>   tiny.config          - Smallest possible kernel image
>>>   x86_debug.config     - Debugging options for tip tree testing
>>>   xen.config           - Bootable as a Xen guest
>>>   tiny.config          - x86-specific options for a small kernel image
>>>   xen.config           - x86-specific options for a Xen virtualization guest
>>
>> ISTM that you are missing the "why" part of this change in the commit
>> description.
> 
> I want to see what fragments are available without needing to know the
> source tree layout for their locations. :)

Why?  :)

but you don't have to answer. I acquiesce (i.e., give up).

>> "make tinyconfig" is the real target here.  The other (tiny.) files are just
>> implementation details.
>> We can't put all implementation details into help messages and it's not
>> difficult to find that the (tiny.) config files are merged to make the
>> final .config file.
> 
> Yeah, this seems true for much of the ppc stuff to, as pointed out by
> mpe. I'll go answer there...
> 

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
