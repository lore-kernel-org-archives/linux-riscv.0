Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D80C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 13:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6DgI10zW9f5CLauR4dmVUA56m8e0mmb6aYo6RnLZqI=; b=0dj/xtuaXy4GGx
	fA+xJZj9MJni6LNeSTnaI58iBI5+IyCaRTewKAWWj8txUplwnY6neYViEi9jA5S4MJAtQCjQuGfHL
	ssG+82slKbS+65wz3+f7fCJobTQce8+vrTZYC+eFYwwPXj6iwSHpzEyOvrkeGVqxfIcMJ5XlNOXVC
	iySN9Dhe39bYIw4YAOxGJIOXTUvcmBhN23F4dwSKP7XYaMFDhRKF+2SEihrnEmxoRAhj4jPUCN9H0
	Q7XBX3XOUMNt15n7VnmbBN34z+BH9EELxuTAzV8z7Kk9rx60mN8EMRmX4tO/E4XEVWRR4C0KcFlSX
	I6J+06407KcL3IqPfQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbiuA-0013yN-RI; Tue, 05 Apr 2022 13:07:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbitz-0013tU-RC
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 13:07:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8459CB81D5C;
 Tue,  5 Apr 2022 13:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA18DC385A1;
 Tue,  5 Apr 2022 13:07:11 +0000 (UTC)
Message-ID: <5b7687d4-8ba5-ad79-8a74-33fc2496a3db@linux-m68k.org>
Date: Tue, 5 Apr 2022 23:07:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Daniel Palmer <daniel@0x0f.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
 <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_060720_058662_21E15A56 
X-CRM114-Status: GOOD (  23.97  )
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

Hi Daniel,

On 5/4/22 13:23, Daniel Palmer wrote:
> On Mon, 4 Apr 2022 at 22:42, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> But we could consider the Dragonball support for removal. I keep it compiling,
>> but I don't use it and can't test that it actually works. Not sure that it
>> has been used for a very long time now. And I didn't even realize but its
>> serial driver (68328serial.c) was removed in 2015. No one seems too have
>> noticed and complained.
> 
> I noticed this and I am working on fixing it up for a new Dragonball
> homebrew machine.
> I'm trying to add a 68000 machine to QEMU to make the development
> easier because I'm currently waiting an hour or more for a kernel to
> load over serial.
> It might be a few months.
> 
> It looked like 68328serial.c was removed because someone tried to
> clean it up and it was decided that no one was using it and it was
> best to delete it.
> My plan was to at some point send a series to fix up the issues with
> the Dragonball support, revert removing the serial driver and adding
> the patch that cleaned it up.

Nice. I will leave all the 68000/68328 code alone for now then.

Regards
Greg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
