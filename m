Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15040C43461
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 07:57:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD926139A
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 07:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD926139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zft25BshH0kJNtsumjlIJb50TQDBiPqaRYFYQXlnXJ0=; b=QkA8RVol3iwHObKJJO3HkGlDl
	maECk3Z+YCgDWkFSvj7YtxLwJDle+zPRzDFdrczGuEikCkZvkBzYI9oYea+XYPt4ChQP66QC9wAgp
	NMITdtlLctaVZzOGLXHqivHzT8l1iRP5lwp70yp0CRZWC1bSrKxF6M+zkg9OoGLiQIiRV3ChzcRCi
	dG96DJTQY/2G9sCsQ+rCL9xXU9Hs7Env0CHmGJ0J8J9xkh4FD8eNaDx/UcPc9DzknWIs1ENPJBKBz
	L/qhSEKEPCFiSltR5N2Gl2zTtnSUeMZ875t+pRYoq9NJjpql0tx6ujjL0Yq2qM1qqPib+HvRQsrHn
	fuoP9mOpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldpvi-00FfZH-Hj; Tue, 04 May 2021 07:57:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpvf-00FfZ1-4J; Tue, 04 May 2021 07:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=bLDEv2wOrA1lHvigJ91Fx+/x8da5x/fzOZH4IAXuW20=; b=UWREQ7UcCuHr4s0yD34bivvbB3
 aMJ+jxg1RVwX4WGJoqcUNziK6H5OMVZuBjH2u9qRZhlfGaxaCsVjvPbb6m1MVbxVRulq8gN47vzm8
 7xsS31m0HqavV6eLZzjgYCSd3hyWDkdFS1beycePky3sWhdygCkSbWn4jNM79NVzQM7Njn6ADjIL/
 EQQJN3P4bpLTu+OKRcnGx6c8i0lb22fpZVIAKmHW8TcHlEJfiCJoB+NXPAIsse2guNrmnL7+KVE7p
 cGtZNJCsWboL5OMCHtXHUHpuAuJmGyoT7UnHu1Nx0skrDNQb9PPhN4AjNJHECeBNPO9QH4yj7Rtmm
 DbUcFSgA==;
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpvc-003mko-EF; Tue, 04 May 2021 07:57:13 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1ldpvR-0000zx-0F; Tue, 04 May 2021 08:57:01 +0100
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
Date: Tue, 4 May 2021 08:56:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_005712_514844_9CB8CE5F 
X-CRM114-Status: GOOD (  15.18  )
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

On 02/05/2021 03:41, Joe Perches wrote:
> On Sat, 2021-05-01 at 17:52 +0200, Miguel Ojeda wrote:
>> On Sat, May 1, 2021 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>
>>> More cleanups will be possible as follow-up patches, but this one must
>>> be agreed and applied to the mainline first.
>>
>> +1 This will allow me to remove the __has_attribute hack in
>> include/linux/compiler_attributes.h.
> 
> Why not raise the minimum gcc compiler version even higher?
> 
> https://gcc.gnu.org/releases.html

Some of us are a bit stuck as either customer refuses to upgrade
their build infrastructure or has paid for some old but safety
blessed version of gcc. These often lag years behind the recent
gcc releases :(


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
