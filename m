Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD10C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 05:56:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C453061439
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 05:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C453061439
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rrxz24Hhr3TMtoWnebFmpUlRrIOtJLWm6BHq2P9z/l4=; b=kxr7rflWk2RXO9qoxRSVPqYJb
	naZOLhW7VSdADOUzVu0FVlbyaDkeB3lorTFtqNOA+TXqnxwgT9NE0VA+IgmCkseV/A0U2sBAOJAzK
	MqEL8HVhhU9Mbgr2b4C1nMtn4lQE2Qc4ZSACF+Prz7MVw/4pCPJKpoTvJf0/ma0jpHQbWOv3bQopq
	IeUsHcB9Fqr9ZXEoItpJsQJ3+5XHrPgYi3MSbwIO0hxMfv+UgCK93TvMJ8zqAk0MK1s+1/m+KgVNj
	5E/qfbgehWXHdVxlnUGLUZNyuHdU0ggLvhzt86ka9nrNXVniVcUaSe0v+1qbzaiOdkUU79Ear4NyJ
	p5r8sNygw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWuzB-00Ey7Z-3s; Thu, 15 Apr 2021 05:56:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWuz8-00Ey6i-0l
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 05:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AVqUgG9+EdjBz95TYYbp1M808BDeTFE/GavaYsJfmZo=; b=hb6Us+yZZB3C1JcbiehCGsRghb
 kBfTzFUUWKPSiuJZ2v7iw2x+r5/e1s9VBfgSAtLxN4UunH0TWTDYLh/NQJPS9nGOEafNCu9T9b/Bg
 eKO2oMBvngkOyaWdD8O8IIW8PIjgzSUaAg5gx5hr8BfdwpCex4At5pjcSrA0zeSiWbUc0nsuhIeDw
 rdo/vAIo1zZ/jBR49ryen/NXRMjSVuDUK1RKP9ht9p9LcRRm7sjFTM1jJ34L6pFaoB/qr6UYNcrb/
 kU3RujOG2QdgFzj60CA3RZ3TKODkqaxknUwZPl3dj7e/yvH0zz8mQ/2THJ2M0MF8VBqXYgFPFfzxk
 6Z0WaNvA==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWuz5-008IBJ-2F
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 05:56:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id F1E3A68BEB; Thu, 15 Apr 2021 07:56:05 +0200 (CEST)
Date: Thu, 15 Apr 2021 07:56:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, viro@zeniv.linux.org.uk,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jcmvbkbc@gmail.com, gerg@linux-m68k.org,
 Anup Patel <Anup.Patel@wdc.com>, Christoph Hellwig <hch@lst.de>,
 uclinux-dev@uclinux.org
Subject: Re: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
Message-ID: <20210415055605.GB8947@lst.de>
References: <BL0PR04MB65148D80C819A7E3B8365242E74D9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <mhng-61cff5f4-32a0-417d-9a2f-eb6d052cf802@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-61cff5f4-32a0-417d-9a2f-eb6d052cf802@palmerdabbelt-glaptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_225611_281133_CF6E70CB 
X-CRM114-Status: GOOD (  20.48  )
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

binfmt_flat tends to go through Greg's uclinux tree, adding him and
the list.

On Wed, Apr 14, 2021 at 10:46:36PM -0700, Palmer Dabbelt wrote:
> On Wed, 14 Apr 2021 17:32:10 PDT (-0700), Damien Le Moal wrote:
>>> On 2021/04/08 0:49, Damien Le Moal wrote:
>>> RISC-V NOMMU flat binaries cannot tolerate a gap between the text and
>>> data section as the toolchain fully resolves at compile time the PC
>>> relative global pointer (__global_pointer$ value loaded in gp register).
>>> Without a relocation entry provided, the flat bin loader cannot fix the
>>> value if a gap is introduced and executables fail to run.
>>>
>>> This series fixes this problem by allowing an architecture to request
>>> the flat loader to suppress the gap between the text and data sections.
>>> The first patch fixes binfmt_flat flat_load_file() using the new
>>> configuration option CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP. The second
>>> patch enables this option for RISCV NOMMU builds.
>>>
>>> These patches do not change the binfmt_flat loader behavior for other
>>> architectures.
>>>
>>> Changes from v1:
>>> * Replace FLAT_TEXT_DATA_NO_GAP macro with
>>>   CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP config option (patch 1).
>>> * Remove the addition of riscv/include/asm/flat.h and set
>>>   CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP for RISCV and !MMU
>>>
>>> Damien Le Moal (2):
>>>   binfmt_flat: allow not offsetting data start
>>>   riscv: Disable text-data gap in flat binaries
>>>
>>>  arch/riscv/Kconfig |  1 +
>>>  fs/Kconfig.binfmt  |  3 +++
>>>  fs/binfmt_flat.c   | 21 +++++++++++++++------
>>>  3 files changed, 19 insertions(+), 6 deletions(-)
>>>
>>
>> Ping ?
>>
>> Any comment on these patches ?
>>
>> Without them, RISC-V NOMMU user space does not run... I would really like to get
>> these in this cycle if possible.
>
> This LGTM, but it's pretty far out of my area of expertise.  I'm happy to 
> take them via my tree, but I'd prefer to get an Ack from someone.
>
> Al, get_maintainer suggests you?
>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
