Return-Path: <SRS0=mVee=RI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F70C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 00:22:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01AD20684
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 00:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pYFBFGuM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E01AD20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOgDBgm050Yxad9UXRxkBqY290nFJMFLgBAIU48KF6E=; b=pYFBFGuMhaW+o6
	tjynbbY79N5zW98nYLXFW1hdolPReH2F7I3QzPGuZi7sFQs/g28Q1oo2kHiWs3Zv9MyH97f4DMVc4
	POg+raClXqQ3+5O0uLlvyqP0eLU1CozYFfQfV4zl3POa2G7XYziperix5ALNaRVR8gTol1sEPFRxE
	tHKvR8o9oqUAuPm7TfdOhBEfTgkhzc1I7HC3MWotvHrw7KCrSEGUgKav4ZCsOR8aPy28WQbmp1/tw
	0SrUyM2jxIJb6C1HCwmJJ5IoGFlnaKNuOpCKXh22Am+zBVvmD5hXhH8etSvA9iXkDfSnQcKmJ55dr
	gurbNnIvd5tWa8pnnkcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0xqL-00056N-AG; Tue, 05 Mar 2019 00:22:01 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0xqH-00055L-FO
 for linux-riscv@lists.infradead.org; Tue, 05 Mar 2019 00:21:59 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x250KMj2014854;
 Tue, 5 Mar 2019 08:20:22 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 5 Mar 2019
 08:21:20 +0800
Date: Tue, 5 Mar 2019 08:21:17 +0800
From: Vincent Chen <vincentc@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 0/3] riscv: Fix debug instruction check and support
 trap-based WARN()
Message-ID: <20190305002116.GA5887@andestech.com>
References: <1551349891-22683-1-git-send-email-vincentc@andestech.com>
 <mhng-76c68381-da6b-4b8c-97c9-e38d503b93bc@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-76c68381-da6b-4b8c-97c9-e38d503b93bc@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x250KMj2014854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_162157_772790_39DD8B2D 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "deanbo422@gmail.com" <deanbo422@gmail.com>, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 05, 2019 at 04:35:08AM +0800, Palmer Dabbelt wrote:
> On Thu, 28 Feb 2019 02:31:28 PST (-0800), vincentc@andestech.com wrote:
> > The handler for the debug exception will call is_valid_bugaddr(bugaddr) to
> > check if the instruction in bugaddr is a real debug instruction. However,
> > the expected instruction, ebreak, is possibly translated to c.ebreak by
> > assmebler when C extension is supported. This patchset will add c.ebreak
> > into the check mechanism. In addition, BUG() is currently unable to work in
> > the kernel module due to an inappropriated condition in is_valid_bugaddr().
> > This issue will be fixed in this patchset. Finally, this patchset enables
> > WARN() related functions to trap the code to help developers debug it.
> >
> >
> >
> >
> >
> > Vincent Chen (3):
> >   riscv: Add the support for c.ebreak check in is_valid_bugaddr()
> >   riscv: Support BUG() in kernel module
> >   riscv: Make WARN() related functions able to trigger a trap exception
> 
> I'm finding this patch set a bit hard to follow, and I think it has more diff 
> than is necessary.  For example, the first patch introduces a new die() only to 
> have it removed by the third patch.  There's also some unnecessary 
> non-functional diff, like
> 
>     @@ -149,12 +161,13 @@ int is_valid_bugaddr(unsigned long pc)
>             if (probe_kernel_address((bug_insn_t *)pc, insn))
>                     return 0;
>             if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
>     -               return insn == __BUG_INSN_32;
>     +               return (insn == __BUG_INSN_32);
>             else
>     -               return (insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16;
>     +               return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
>      }
>      #endif /* CONFIG_GENERIC_BUG */
>     
>     +
>      void __init trap_init(void)
>      {
>             /*
> 

> I like the idea of the patch set, though.  Do you have time to clean it up and 
> submit a v2?


OK, I will improve it and submit a v2 patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
