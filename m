Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447B5C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 07:47:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA52861107
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 07:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA52861107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IHTCefjQzMGKYSPZ4sfKOduZvQwtvoetrvVL5Az4YmY=; b=ahXiE1Q0EsMKaQ0BPIuhdux3t
	ktTNLoQwIbOisLSYJAIYcEf7X3UniAMqA9tMIJN2VZace7DA94XFHBFWteC/5FKj78QDDitYAz4fj
	5LqvSUumpjr5GXSYSl0CilL8dOmp/NlayPPYQN37fWqCvxy4evDwIqizM/GiWUxwbzwba0OESQRkU
	nLHBDJvZ257d9x4SSmDTdwVjt3U8Yj7n1fj7K2aDF6s66S3Kan2f3QCyeIpfR1+hPY1fUKdwuw2lu
	djzTKxw4IJ1q2ClvEgQJTAcBfPjgrJM5uFUwZzQKaVa4nI9xJVQpM2R8HNfUa8mJbGF2UtsvBFz+t
	BhybiD2dQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXJC2-001EZA-8N; Fri, 16 Apr 2021 07:47:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIs6-001BVz-G4
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 07:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=pWF3epp7YutJ/t+GoWbCCBSIGjKXozCEgJFJHqcrWk4=; b=2WAhyKpu4HxqyEIJCyfZ7WOnJN
 9evCVBTYwv64jrGxkipXs2uVdWYlLqZzDstF0BbRqrroPibK8eI8VMLWGwWQ6waywRYcZ25eRqt2/
 GDwW18aABPD5MAyW9EFEvcGTcMWDulQ6BiuPzvAqW/25JLE80WUlAq0Yde5lQOeyBJb3YNCGOa0ns
 LeoupyvrCBuSWU/jwvsYESxbySZF/nyk3Jc1xONHeJIf0/3lneUYZg25utlmncP4gTjNwU8Sbv6Wm
 8qYqR6oyGaacWrEIEkRHKT7t1Cxud/2ZHCofRDZiDGCFKNxERy+ydeSjReZVBaksQsE9xZwvd6UFY
 C6Gz4BKw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIs4-0099IO-0p
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 07:26:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FF2C60238;
 Fri, 16 Apr 2021 07:26:29 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 "uclinux-dev@uclinux.org" <uclinux-dev@uclinux.org>
References: <BL0PR04MB65148D80C819A7E3B8365242E74D9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <mhng-61cff5f4-32a0-417d-9a2f-eb6d052cf802@palmerdabbelt-glaptop>
 <20210415055605.GB8947@lst.de> <YHjYoDA2JPxSYVu0@zeniv-ca.linux.org.uk>
 <BL0PR04MB65143E710571C8CE7E7F0FB0E74C9@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <f407de5f-7799-3e47-c68c-38a2428533aa@linux-m68k.org>
Date: Fri, 16 Apr 2021 17:26:27 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB65143E710571C8CE7E7F0FB0E74C9@BL0PR04MB6514.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_002632_114281_60747186 
X-CRM114-Status: GOOD (  18.58  )
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


On 16/4/21 10:26 am, Damien Le Moal wrote:
> On 2021/04/16 9:22, Al Viro wrote:
>> On Thu, Apr 15, 2021 at 07:56:05AM +0200, Christoph Hellwig wrote:
>>> binfmt_flat tends to go through Greg's uclinux tree, adding him and
>>> the list.
>>
>> 	FWIW, my involvement with binfmt_flat had been pretty much nil -
>> the least trivial had been "binfmt_flat: flat_{get,put}_addr_from_rp()
>> should be able to fail" about 4 years ago and that fell out of hunting
>> for places where __get_user() had been used without checking error values.
>>
>> 	It's in fs/*, but I've no way to test it and I have pretty much
>> zero familiarity with the guts of that one, so I can't give any useful
>> feedback on that series.  So consider the Christoph's comment seconded -
>> you want it reviewed by gerg et.al., and it probably ought to go via
>> gerg/uclinux.git tree.
>>
>> 	I'm reasonably familiar with binfmt_{elf,misc,script}; anything
>> else gets touched as part of larger series and only with sanity checks
>> from other folks, if the changes are not entirely trivial.
> 
> Al,
> 
> Thanks for the clarification. Would it make sense to have an entry in
> MAINTAINERS file pointing to Greg and the uclinux tree for binfmt_flat.c ?
> Greg ?

Yep, looks like it does need that.

Regards
Greg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
