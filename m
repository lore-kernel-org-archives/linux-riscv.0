Return-Path: <SRS0=E47g=33=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC0FC04EB5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2020 14:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7BF520720
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2020 14:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ObpUd2ID";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FRD4Pft/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7BF520720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34VvtQwiNYO+acjPMUqFAU06ebca92jkkPZSK9T+4vM=; b=ObpUd2IDum/yydAZieLReIz0+
	GeuF1LMzfIJi01T49BRNCmDW9dahGPpbKUVWqZv4n77WsappsrpXyDveyw7ZW7sVf5q5tts0yITZg
	8rZKn2lTrs2jOexRwX7h5nzPThWLP4B3IC1phw7iTZLK5UCvVc/HYfmkrchVAAMm2ViGQaPs5yHF4
	c388RiC5UUDRGGBp/TlxRNaX1ESiGteKT4XDbHozk/rtsEhYqPc5xblaKLXSRLvAkmMfGYgg6dfm1
	4pS4XxeDLlEMxRKQSlQz+HkLesGtCj7VACAYpy6jWwpsXMUGuuQmGKJtVaYaynsoU5LVAnjsfBgY/
	Da2sB/ruw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j04nh-00029a-7C; Fri, 07 Feb 2020 14:40:09 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j04nd-0001Q9-R1
 for linux-riscv@lists.infradead.org; Fri, 07 Feb 2020 14:40:07 +0000
Received: by mail-qk1-x743.google.com with SMTP id b7so2374667qkl.7
 for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2020 06:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=34VvtQwiNYO+acjPMUqFAU06ebca92jkkPZSK9T+4vM=;
 b=FRD4Pft/GUT2cP+cJedbkj/CWd6Ew0CGaQAs6Batwh2ZIywqOhDq0fpKlr2S2+pDZ7
 JEm6aqmbGMYijWNrl27kC1KjZuDVZ6Hqe5tNlohU1k0xQmTmlIxrwZdoQ+rrtRBwWQ3D
 yP91xeI9i77jeqrXv8IeuuhiI9bys4v04yNmOwKeBST4opgnoaEuBHCfPn0JlRVAQx8x
 9fdmJRWtnUu1QxAH/weUk+7NvEeNTguVoDzGxjH97lJSR8nyvp5wt1PEB5IC/n9YpW2E
 0BbNMLkew0Ihee0x+3IIPCXl8SDnGeNyEryPW74F65+MRaSlp0s47o03md4a4gKdHIFh
 H+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=34VvtQwiNYO+acjPMUqFAU06ebca92jkkPZSK9T+4vM=;
 b=hzT3fsm1UJA69gQfckk04C5rOppWl85YFYG0BiV1bsRudH9K0j004zjbskH2XtTBPq
 T3rRxY51IXv9pFtK8jfywxUk0OfYWHIuNMsqan2MWj01i0+zKK/gK1kQJJ2P45584BN3
 yRUP1H3rdZULQ/LlG5vC83YW8PLDKNIw4MQ4t2t0eY1hH3ycZ/uSokI892H7lBFOWn7+
 pUUqTnbvBaVjcVK7tJ1rBN2hRZNBZJHEBQZtoBJKlmB9HtD0l+fs7A+CvlijrTQ9vTwj
 dqSXweRI8J7bdI9IObAFSAdx0Vc8swbmXXCNovi+nStjnwx1oKjixfeKDfe9ynaBEZv2
 MWYA==
X-Gm-Message-State: APjAAAVSVBrg0p07sP3wIuH4dnrcP/zQDiMcLGvSoDanDRNs0usBs6dQ
 dYQ2mSyUs+aWdpRUXQ6R+3TsMXDniXdqJY06V/urDQ==
X-Google-Smtp-Source: APXvYqwsk11BJiAw+96oJFsnVDJEDzPUpTBlHuJM2Rk7mV7EDjkmswkhAJm1f3fGt19nOXr5BzjLM3K/9T5pc/RVKLo=
X-Received: by 2002:ae9:f003:: with SMTP id l3mr7553554qkg.457.1581086403891; 
 Fri, 07 Feb 2020 06:40:03 -0800 (PST)
MIME-Version: 1.0
References: <CADnnUqfhxWN=cyyr0QQyKrrO13LuDFS9NTqOLwm10CnwB3sDXA@mail.gmail.com>
 <alpine.DEB.2.21.999.2001300259070.23963@utopia.booyaka.com>
 <CAEn-LToMfm=G80TmGQZefpmKhKvpGy_=XOoBLGU0a_77ahY+_w@mail.gmail.com>
 <20200131201118.GA4121429@aurel32.net>
 <CAAhSdy03C==7PmuXE441BtDJH8H07rOH-u+-_sZJG70tbTrJcA@mail.gmail.com>
 <d868acf5-7242-93dc-0051-f97e64dc4387@ghiti.fr>
 <33c9a276-6212-115c-c7c9-e62244f13c76@european-processor-initiative.eu>
 <CABvJ_xiWDZfO6fOd4Roiy-yaUVFKrGEcBDBSWsvj2TKGGMjy0g@mail.gmail.com>
 <CA+ZOyaj16M5q-g4wZ60MuUs4q1AfCB48wd+AN4TTJNu8K4NZRA@mail.gmail.com>
 <68bb87cb-50d7-5e85-37f4-ad2cc44865f1@ghiti.fr>
 <CA+ZOyahEPtuNqgSUHVcZpZp3WP3oX4jFOiqJvO827ye4+1DT8Q@mail.gmail.com>
 <c12ed63e-c717-9fa0-7a6c-74d6d4a83a04@ghiti.fr>
 <CABvJ_xiBVQjfJfZU0Dfp0fc9n_zAoc=DSHPFuDMKu4k5n0qJtQ@mail.gmail.com>
 <CAAhSdy2gEK++MtyV9=o9r_-6CkaWMsQ0YZwB-TAkCCe3B4qTFg@mail.gmail.com>
 <CABvJ_xjc+ojwqgMhxZ2a0Q+BvxzxUR6ab__+8iA6zx65GMKkxA@mail.gmail.com>
 <a55f265e-71b2-5ebb-b079-6345007a442e@ghiti.fr>
 <CABvJ_xjVLJEebCac_sb6-Yd_iHU1x8Daqw-iFqcGn11YKktm8Q@mail.gmail.com>
 <MN2PR04MB6061ED6ABC668B59A7A544CF8D020@MN2PR04MB6061.namprd04.prod.outlook.com>
 <CABvJ_xg_+XHhND-_8mq8gUN_yN-abMjDOWGg+MFVP0gwSAhxtw@mail.gmail.com>
In-Reply-To: <CABvJ_xg_+XHhND-_8mq8gUN_yN-abMjDOWGg+MFVP0gwSAhxtw@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 7 Feb 2020 22:39:52 +0800
Message-ID: <CABvJ_xgRE3P0uVhx9zyVZOzMjNYewJQK-nyhv8e5cfpNweLAGw@mail.gmail.com>
Subject: Re: Error on loading some network Kernel modules
To: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_064005_958516_1BC9E4F0 
X-CRM114-Status: GOOD (  11.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Carlos Eduardo de Paula <me@carlosedp.com>, Alex Ghiti <alex@ghiti.fr>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <anup@brainfault.org>, Zong Li <zongbox@gmail.com>,
 Romain Dolbeau <romain.dolbeau@european-processor-initiative.eu>,
 Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul@pwsan.com>, Aurelien Jarno <aurelien@aurel32.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> > For point1, we don't need a dedicated region as long as we are allocating
> > modules from VMALLOC area. Let's avoid another virtual memory region if
> > possible.
> >
>
> Your comments inspire me if we can know the end of the percpu data
> region, we can dynamically calculate the start address in each module
> allocation by "<end of the percpu data region> - 2GB" if needed. I am
> finding a way to derive the <end of the percpu data region>.
>

In the implementation of the idea, I found that I did have some
misunderstandings about the mechanism of accessing static percpu
symbol. Currently, I think this issue can be solved by modifying the
module_allocate() to the following.
#define MODULE_START max(PFN_ALIGN(&_end - 2 *
SZ_1G), PFN_ALIGN(&_text + 8 * SZ_1K - 2 * SZ_1G))
void *module_alloc(unsigned long size)
{
return __vmalloc_node_range(size, 1, MODULE_START,
VMALLOC_END, GFP_KERNEL,
PAGE_KERNEL_EXEC, 0,
NUMA_NO_NODE,
__builtin_return_address(0));
}
After applying a similar modification above, the kernel can
successfully insert the test module provided by Romain. Any feedback
is welcome. If someone is curious about the reason, I roughly
described it at the end of this mail. I am sorry if someone was misled
by early discussion.


As mentioned early, kernel pre-allocates a memory region for each CPU
to place the instances of the percpu data. According to the
declaration type, each memory region can be divided into three chunks.
These three chunks from low memory to high memory are static chunk,
reserved chunk, and dynamic chunk.
a. The static chunk is used for the static percpu symbols declared in the kernel
b. The reserved chunk is used for the static percpu symbols declared
in the kernel module
c. The dynamic chunk is used for all dynamic percpu symbols.

The order of the percpu symbols in each memory region is the same and
is recorded in a symbol list maintained by the kernel. Therefore, the
address of a specific CPU's percpu symbol is "The address of this
percpu symbol in the symbol list" + "The offset from symbols list to
the specific CPU region".
a. The symbol list is created based on the ".data..percpu" section. In
other words, the start address of this symbol list is the start
address of ".data..percpu". When a dynamic percpu symbol is created or
a kernel module import a static percpu symbol, the kernel will follow
the above chunk rule to add this percpu symbol to its suitable region.
b. When each memory area was created, "The offset from symbols list to
the specific CPU region" has been recorded.

Back to the issue, according to the rules above, the kernel will
relocate the ".data..percpu" section of the loaded module to the end
of the ".data..percpu" section of the kernel image. The end of the
".data..percpu" section of the kernel image almost equals _text, and
the current size of the reserved chunk is 8KB. Therefore, the
appropriate range to place the loaded module is [max(PFN_ALIGN(&_end -
2 *SZ_1G), PFN_ALIGN(&_text + 8 * SZ_1K - 2 * SZ_1G)),  VMALLOC_END].

