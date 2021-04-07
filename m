Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BC7C433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 14:14:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7228F61107
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 14:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7228F61107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6R/ukdUajWvOjoATKDn6XREzQoBDVdtX74UKEYneNXI=; b=IYDKpvgv/z48YD45EEy6GfQzV
	pB6gah7oGfqoYgz9EZw1d8VqSKuUUyRN5Y3AvaaVm0CeTFxtiPI2H2uW+PqaYqb2y6Ft+QZtT++q6
	VUD290o3sPsJjJfARIb8Pimkvxx91HDZaor/Rd8TRm3r7VrDRBzIGvlAt9cVC1itjlRBvIP77y7c7
	BGU1v/PqnHMvRerzRDSw1nucqgS10FgKXd4VBDi5LIvJJD0jajBg0PNObBb16GJtLlmhRb1y1/h2w
	G+vm7yfNBbHGmaLAlU0NOikq82Sdd0zlT6eTostvnyeSUq6fHD+hfVw4OaeaXiGTPETdr4dARVArN
	qB1jFNQCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU8wl-0056PB-R3; Wed, 07 Apr 2021 14:14:19 +0000
Received: from verein.lst.de ([213.95.11.211])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU8wf-0056MS-Ui
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 14:14:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3A0CA68C4E; Wed,  7 Apr 2021 16:14:00 +0200 (CEST)
Date: Wed, 7 Apr 2021 16:13:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] binfmt_flat: allow not offsetting data start
Message-ID: <20210407141359.GA19843@lst.de>
References: <20210407115638.1055824-1-damien.lemoal@wdc.com>
 <20210407115638.1055824-2-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407115638.1055824-2-damien.lemoal@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_151414_171188_71A0B0E5 
X-CRM114-Status: GOOD (  16.94  )
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

On Wed, Apr 07, 2021 at 08:56:37PM +0900, Damien Le Moal wrote:
> Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
> the data start"") restored offsetting the start of the data section by
> a number of words defined by MAX_SHARED_LIBS. As a result, since
> MAX_SHARED_LIBS is never 0, a gap between the text and data sections
> always exist. For architecture which cannot support a such gap between
> the text and data sections (e.g. riscv nommu), flat binary programs
> cannot be executed.
> 
> To allow an architecture to request contiguous text and data sections,
> introduce the macro FLAT_TEXT_DATA_NO_GAP which can be defined by the
> architecture in its asm/flat.h file. With this change, the macro
> DATA_GAP_WORDS is conditionally defined in binfmt_flat.c to
> MAX_SHARED_LIBS for architectures tolerating the gap
> (FLAT_TEXT_DATA_NO_GAP undefined case) and to 0 when
> FLAT_TEXT_DATA_NO_GAP is defined. DATA_GAP_WORDS is used in
> load_flat_file() to calculate the data section length and start
> position.
> 
> The definition of FLAT_TEXT_DATA_NO_GAP by an architecture also
> prevents the use of the separate text/data load case (when
> FLAT_FLAG_RAM and FLAT_FLAG_GZIP are not set with NOMMU kernels).

Please make this a CONFIG_* option selected by the architecture,
which also allows to use IS_ENABLED() to error out early for
your check.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
