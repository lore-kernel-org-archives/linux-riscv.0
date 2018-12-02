Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DC5C282C8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 12:10:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0868F214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 12:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Go1Ya9kH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0868F214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zkZNd/vkym3iJXexlM2cRR+ZifKOBPIf3Ar9RST7tg=; b=Go1Ya9kHYMmKSj
	tkMETc2A3WKZNTii5psd46yKKslvYgo7R7yJJxDGavD1qaVtrgVNv/38dd7aIb5s+GXm3/+QPAjxO
	CowCcdwLtFOmTYqLmXI/7IoO2CAPX2JU+lXmllWvyggLXBN4yjRs7ejYnFUKVg4DkiERzUAoH0xP4
	3G+pxq5rshIfNqeVD5U/hodcg+WmhMM71Ciz8vsupCpE2HgxTSLoulzjsbTPCYyEOl+CWNNxnqRbO
	GAxq4y0KUPkxzc/6Y+hmYgTs1AsdVHuJ8BOsAHXe627dDZwKx409m6njGRezeXIE80ANmn2MZG3gG
	YJbQJqklJrLgNOOehrLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go5kK-0006wd-NL; Mon, 28 Jan 2019 12:10:36 +0000
Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go5kH-0006vb-Ck
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 12:10:35 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id wB26Isir012831;
 Sun, 2 Dec 2018 00:18:56 -0600
Message-ID: <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
Subject: Re: [sw-dev] SBI extension proposal v2
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Atish Patra <atish.patra@wdc.com>, ron minnich <rminnich@gmail.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sun, 02 Dec 2018 17:18:54 +1100
In-Reply-To: <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_041033_819780_5DD4244F 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, "agraf@suse.de" <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2018-11-10 at 19:58 -0800, Atish Patra wrote:
> 
> I think the larger picture might have lost somewhere because of the 
> verbosity of the proposal. The idea of adding vendor extension support 
> in SBI is to allow them provide a standard mechanism to facilitate this.
> In absence of that, vendor might adopt different approaches to support 
> their feature leading a lot of chaos. Vendors can not go and add 
> anything in the Linux kernel(just a example, SBI is still OS agnostic) 
> as well.

The concept of vendor extensions to a userspace ISA is so fundamentally
broken to begin with, this FW proposal verges on utter insanity to be
honest.

Calling FW for things so deeply ingrained in the kernel such as context
swithes, isn't going to fly. The performance will be ridiculously bad,
among other things.

If Risc-V wants to avoid fragmentation, it should simply keep a firmer
reign in what is allowed in an implementation and keep a lid on such
horrid ideas as vendor specific userspace ISA extensions.

Cheers,
Ben.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
