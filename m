Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DA9C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 21:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5647420831
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 21:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="neZRFzch";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1EGTIqaM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5647420831
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrpGx3Pv+6fDZTo1E+PgG0/nE+wbk6pjJBCtSIAQtAM=; b=neZRFzch1JkBmD
	Ko7caKLaGc31Eq+vPNrK/HtDIEVTmXwFruujqxTIpA6zrvcd/9YKVtGWl1m60hj79HW3qEm+Dgmnh
	ZsUxzWrygRlvGz1elo/6PlslJpRIVQuide1DBDxhH72+unlGorBBpnHdSz0+wdtSr7k07miHgL0ND
	M08IF42K81XWeuLu/ZjUXvnY7SW1IsQpHv+p0Hzvv4bhq3Jo/NdbBFWvpnG59zHXiG+pfM+QEXxf+
	tcMYwXX5d4Mx2uIesW4fH3q6kcAIOqEmu3/t3PyF2f99x2qxvf5JnXqO8Jn8b1+tunS07qpPFwsk9
	XZXv0mytoNw82zcHjljw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIggO-0006D1-Hj; Fri, 02 Nov 2018 21:08:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIggM-0006Bs-3K
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 21:08:43 +0000
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEC7420840
 for <linux-riscv@lists.infradead.org>; Fri,  2 Nov 2018 21:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1541192911;
 bh=okCr7TtU05t1jfc0bpOXfrSTGbI/hRDPuk9ZzZjNq3M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1EGTIqaMnZ20WvwhrK5HJyKVXq+8oGrclAwcKwhe6KGPk/tWCDuXruwFjHJMHl/mC
 zec748CUpp6hh3JnYmZikYdQslK3KRiciR4vtCM2g06v1I8yLGkzTPOSrH8/Tra/wr
 AXGhHX6wcfzkqRuZ67Blfq0324kiMHAonhgX0+4E=
Received: by mail-wr1-f51.google.com with SMTP id d10-v6so3294443wrs.5
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 14:08:30 -0700 (PDT)
X-Gm-Message-State: AGRZ1gJddC6l7x3jWpVpD/eEoicTmPmEtxNVpR/p2NMW+2Oo6skzblFD
 B+Z5OgY8NlGq9RgSbAPDqmnm/V+jkX2pCMsoi9lDBw==
X-Google-Smtp-Source: AJdET5e7Yccl7fKvI7Tx3fYJeOCwlXKiHRRXThPjUIIWEMgfJ3Y2vHTkvYMlscJuR+Hpjo+pS0Aj4GjdMlg9Ea+NhUE=
X-Received: by 2002:a5d:410d:: with SMTP id
 l13-v6mr11379896wrp.61.1541192909398; 
 Fri, 02 Nov 2018 14:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <20181102133100.GA13130@e107155-lin>
 <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
 <20181102155038.GA21067@e107155-lin>
 <0c94f752-cc18-ae0c-36e7-7e0dd6b1d307@wdc.com>
In-Reply-To: <0c94f752-cc18-ae0c-36e7-7e0dd6b1d307@wdc.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Nov 2018 16:08:17 -0500
X-Gmail-Original-Message-ID: <CABGGisyMM1hrRp5Cv5UPx6U+m5cQGYmDUTHJ0PeA9nE7vLqyLQ@mail.gmail.com>
Message-ID:
 <CABGGisyMM1hrRp5Cv5UPx6U+m5cQGYmDUTHJ0PeA9nE7vLqyLQ@mail.gmail.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
To: atish.patra@wdc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_140842_175541_B5D5A2B0 
X-CRM114-Status: GOOD (  22.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Damien.LeMoal@wdc.com, alankao@andestech.com, Zong Li <zong@andestech.com>,
 Anup Patel <anup@brainfault.org>, palmer@sifive.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, hch@infradead.org,
 Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102210817.leB6omYOGCqDf_ZDHUx_RpgFd024AeEZx2vSMi22pyE@z>

On Fri, Nov 2, 2018 at 3:53 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 11/2/18 8:50 AM, Sudeep Holla wrote:
> > On Fri, Nov 02, 2018 at 10:11:38AM -0500, Rob Herring wrote:
> >> On Fri, Nov 2, 2018 at 8:31 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >>>
> >>> On Fri, Nov 02, 2018 at 08:09:39AM -0500, Rob Herring wrote:
> >>>> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
> >>>>>
> >>>>> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> >>>>> But it doesn't need a separate thread node for defining SMT systems.
> >>>>> Multiple cpu phandle properties can be parsed to identify the sibling
> >>>>> hardware threads. Moreover, we do not have cluster concept in RISC-V.
> >>>>> So package is a better word choice than cluster for RISC-V.
> >>>>
> >>>> There was a proposal to add package info for ARM recently. Not sure
> >>>> what happened to that, but we don't need 2 different ways.
> >>>>
> >>>
> >>> We still need that, I can brush it up and post what Lorenzo had previously
> >>> proposed[1]. We want to keep both DT and ACPI CPU topology story aligned.
> >>
> >> Frankly, I don't care what the ACPI story is. I care whether each cpu
> >
> > Sorry I meant feature parity with ACPI and didn't refer to the mechanics.
> >
> >> arch does its own thing in DT or not. If a package prop works for
> >> RISC-V folks and that happens to align with ACPI, then okay. Though I
> >> tend to prefer a package represented as a node rather than a property
> >> as I think that's more consistent.
> >>
> >
> > Sounds good. One of the reason for making it *optional* property is for
> > backward compatibility. But we should be able to deal with that even with
> > node.
> >
>
> If you are introducing a package node, can we make cluster node
> optional? I feel it is a redundant node for use cases where one doesn't
> have a different grouped cpus in a package.

Certainly not. A common doc can make every level optional and each
arch can define what's mandatory.

> We may have some architecture that requires cluster, it can be added to
> the DT at that time, I believe.
>
> >> Any comments on the thread aspect (whether it has ever been used)?
> >> Though I think thread as a node level is more consistent with each
> >> topology level being a node (same with package).
> >>
> > Not 100% sure, the only multi threaded core in the market I know is
> > Cavium TX2 which is ACPI.
> >
>
> Any advantages of keeping thread node if it's not being used. If I am
> not wrong, we can always use multiple cpuN phandles to represent SMT
> nodes. It will result in less code and DT documentation as well.

It's more consistent to make each level a node IMO and we've already
discussed and defined it this way. I don't see how it's really less
code or documentation.

BTW, powerpc defined threads with multiple reg entries in the cpu
nodes. You could do that if you wanted.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
