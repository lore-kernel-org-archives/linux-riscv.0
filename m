Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D0EC636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lImfximAsZAagvswRJmO+GG3IanRh72PYQjgFv7L4U=; b=oh/Htl4Wq2FVw1
	iwzCiU4zlvcQh64Nc9+iOur/dWIqmBh+My2e1UH0//wYMCIaxsLscToxPjA+bE29EO0lakjz7Dboc
	PYwr19RgtE3/oGSoW+l2vVWV2a2EfdiB8vQVsqmV0bBaSOlY51COmNyMOwZs0MRax6d5HVJdlefps
	MlVL9qQw4olWoAA4uYCy0TMPV+qq9iSvs8pMb1OwknVnE4B6ESQrrDifJYbP5uraP4NqRa+kXFP+N
	udEUZW6a68XYen4F79cGKylF1+WwzQgPuQa/nCgrnSDnKd0kZb/5reOEtbv7dA1wfGlqLCGs+QwpG
	XfmXQ6moHn9vQo5q/JiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pReQn-00G0In-UV; Mon, 13 Feb 2023 19:24:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pReQl-00G0HM-U8
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 19:24:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 17A8CB818EF;
	Mon, 13 Feb 2023 19:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E535EC433D2;
	Mon, 13 Feb 2023 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676316239;
	bh=CTSdoKNWKzxTWibhjYR8Qm7nmbkyRBxtlTLLuU1/FFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa1RVCe3GAt898JqU32CzMCwYqHhf1d10eRmGfBfJeq3gqxchYweQo2CMC0o0dtMP
	 hgEw4nae9wWqGH6ylurzbyfnly7TLBtJ9a+ttl2+bqKsAQd0AarDsaoXgfbqT3f+Q8
	 jdxh2LTeaOGkRCvXAHqBBNG66etha5szFJlWBj7Uxok2l72hsYNke3HQ2MGcytCcjm
	 Axe8GY+dF1B1cGxnQtz8qSgjujARGYZ0jxKNEkpADo9zrjVfLWyRC4Hb2RqXH4Wt2h
	 aXTOhc48WPSA9CcKRz9+9n3q8JBsWx5l8BmSBmIq+UsEwcB+RqZHFHlRcVH+1OQjYl
	 ozC4JJ9JI/xXg==
Date: Mon, 13 Feb 2023 21:23:55 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Nick Alcock <nick.alcock@oracle.com>, Conor Dooley <conor@kernel.org>,
	mcgrof@kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 8/8] kbuild, PCI: microchip: comment out MODULE_LICENSE
 in non-modules
Message-ID: <Y+qOS9fx9B3Y3gd6@unreal>
References: <20230210164749.368998-1-nick.alcock@oracle.com>
 <20230210164749.368998-9-nick.alcock@oracle.com>
 <Y+aMh5e9bWaTphiZ@spud>
 <871qmx1fv5.fsf@esperi.org.uk>
 <Y+akw9VBjg9oZ7QV@spud>
 <Y+kx3fb2Lzlg+u5+@unreal>
 <87ilg5mq0r.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ilg5mq0r.fsf@meer.lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_112404_145401_394BE5A1 
X-CRM114-Status: GOOD (  18.53  )
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

On Mon, Feb 13, 2023 at 10:30:44AM -0700, Jonathan Corbet wrote:
> Leon Romanovsky <leon@kernel.org> writes:
> 
> > It looks odd to me too. Please add SPDX tag in modules which don't have
> > it already, instead of commenting code.
> 
> So I'm just a bystander here and should probably be ignored, but ...
> 
> From what I can see, Nick is attempting one of those cross-tree cleanups
> that's painful enough to do on its own.  This request is asking him to
> perform a different, unrelated, and potentially fraught cleanup that the
> maintainers of the code in question have not yet managed to get around
> to taking care of.  This will impede an already prolonged process and,
> IMO, unnecessarily so.
> 
> Wouldn't it be better to let this work proceed while making a note
> of the files still needing SPDX tags?

Please see a note from Nick, who said that these tags were already
in-place for most of the files. If it is hard for him, he can skip
adding new tags. However, the proposed solution is to comment code
and leave dead code is not a right solution.

Thanks

> 
> I'll shut up now :)
> 
> Thanks,
> 
> jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
