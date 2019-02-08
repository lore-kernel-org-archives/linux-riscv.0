Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD78C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 17:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D9032146E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 17:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k8BHTe1L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TYL/031g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D9032146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=KkT8otl+rBAFNte7rUcRaMHzITOc/lD3BLv1DcCV87Q=; b=k8BHTe1L88P9j1NILeH4noxBp
	Dl8H1nlKXzh9BJs9eaOINOlJGDLghDoWGu7w92wHVPh/qyFf0HhawUixcZmwWhqWSdgq6lHogCYdV
	5Ua9IxdOp1KetGUycyBVdWgvXUgza/mPAa597zTm7Kg1bS65I+p1ZFPKRkadBmzbu8Wz1QmPhxxF2
	p+Xx1b5Av0HdrshNJM35vLW0DajLJMAzBWP12T4pQtWPoYPA7O/fAcYsXlSV+ZgrzdcSs65WljMZU
	vlAT0EunfsB7/YQqjPVckN1Q+AIfsGOn6gTS62dgroCYYb1dwvrBxkG6wd+Q6b9+yRnzgrVmQwf3e
	7GMZ0li5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs9xY-0003mU-UL; Fri, 08 Feb 2019 17:29:04 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs9xV-0003km-DB
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 17:29:02 +0000
Received: by mail-pg1-x543.google.com with SMTP id y4so1846396pgc.12
 for <linux-riscv@lists.infradead.org>; Fri, 08 Feb 2019 09:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3LLvxZB46ROoOXA4esivqLovjmcRPan4uyd2Boiz2IE=;
 b=TYL/031g8l6yTeB7NdxBbU82v/1uO90oZYyoh+wgCZjy8xf9aHUdnkaXAH/xLBy3+u
 Lpv7IU06GFUxcgARl5FBTMGjWepOhq5Cgnz2H2T6zgIGFPzMQc8j7TmMFGMj77v6k6uf
 JIbFAKHdCKY3ALgXbxT7kkgIYbVcVyR3IXCTgft4VkPS96oiO8pyJob/saacGSn4tNkf
 ffz/HEJG7Ng7Q4EjM3B4sPMcTuxkmXy4qrWMlyB9YS+OpsU/fSQr8f7dzluC58EHXvgL
 odemPqAmu5CG0BlcuQEYp/VIyADAnIFSH9O2PV6A+U/+JqxtZsJnLpw33vJgqpxcgAzQ
 G/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3LLvxZB46ROoOXA4esivqLovjmcRPan4uyd2Boiz2IE=;
 b=HXKF6tRNB3wb4KKpNhaloTbYA27/MiabmDQchvm2gDA4DGublMe3FGL2+c2zLy33Kv
 egdTQjdpA/s0L3TQL1I8af1m9zAZ8ISyVOMh1BJew9EmhmPlcpcmKR3tDa98Jy5N2vLX
 sCELrZg1lXLfClj9S+ATQFGwJSeWZgdgb8uFOn4a2uONNUC9KsC0dzHvkL/y8Vl7dwde
 e12U4tk0XGMkdSzJCgSO7g0AJuLao/MZqU8hP6Qp2v7e/Is/ZbLXUTSZ2tVkgoVBhzAt
 G8nJf6ux7npxGmlHUHuSKIbGGH7lxS9oalEMahIBV5zTW0AH9b6bxTMf+IQauvVcEXFY
 AxOg==
X-Gm-Message-State: AHQUAubbAJoPDGUivEzSyD5ZdJc0DALRKPG8vFf7mWL3lAlc3wBJXI0+
 K0YemUl5wKKa1KJEorqwZGdZ5A==
X-Google-Smtp-Source: AHgI3IZCmEoEqGfVHNJ4sX74yuQm3LzJSwwmR6x3RHmZ/VVBnf+5TzZi0w0Hlv0qKOe3Ee/SpoFG3g==
X-Received: by 2002:a63:fd0a:: with SMTP id d10mr5474338pgh.164.1549646940728; 
 Fri, 08 Feb 2019 09:29:00 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a90sm6095790pfj.109.2019.02.08.09.28.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Feb 2019 09:28:59 -0800 (PST)
Date: Fri, 08 Feb 2019 09:28:59 -0800 (PST)
X-Google-Original-Date: Fri, 08 Feb 2019 09:28:51 PST (-0800)
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
In-Reply-To: <CAAhSdy3im4i0PJvKqDAfq2iDFvTA2O3ZsxjM6wSgdnFUU1eVcw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com, anup@brainfault.org
Message-ID: <mhng-487587c1-cd66-40f3-86fc-aa2f034f5028@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_092901_446039_6BCCAADC 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, Anup.Patel@wdc.com, schwab@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 08 Feb 2019 01:17:00 PST (-0800), anup@brainfault.org wrote:
> On Fri, Feb 8, 2019 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Fri, Feb 08, 2019 at 02:32:51PM +0530, Anup Patel wrote:
>> > It is a bug in BBL because it is not keeping sufficient gap between
>> > Linux kernel end and DTB. The change pointed by Atish actually
>> > reduced flat kernel binary size by almost 1MB.
>>
>> And that is all great.  But it breaks peoples few existing RISC-V
>> setups, which is the best way to frustate every single of the few
>> users out there.  And that is best way to lose any interested in this
>> already hard to use mess.
>
> There is no issue if you are building Linux RISC-V defconfig.
>
> The issue starts manifesting only if you more drivers enabled.
> Again, with growing kernel not everyone will see this issue because
> it will only show-up only when gap between payload_end and next
> 2MB aligned address is not sufficient to cover BSS section.

I agree with Christoph here: we should revert the commit.  There are various 
versions of BBL floating around that are a big headache to update, and since 
all the patch in question does is reduce the flat image size it's not worth 
breaking existing setups.

I also don't like the proposed fix, as that just statically sizes a 16MiB BSS.  
While that's fairly large, it is in essence just kicking the can down the road.  
The kernel on my laptop has a 7MiB BSS, and it's just an arbitrary smattering 
of the drivers I happen to use.  I'm not sure what the right long-term solution 
is here.  I kind of want to say "just use an ELF", as someone has already sat 
down and figured out how to put everything into a file that's required to make 
a binary run.  I feel like doing anything else here is really just going to 
involve re-inventing the wheel.

That's a bigger discussion, I've sent out the revert and will include it next 
week unless someone has an objection.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
