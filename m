Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A19C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeWD/iziLPFxQvBZNO0pKM7/tLznrObp2Dm3ckIKBRE=; b=Kiv4yeJgKTftdo
	2A/KNMOc/YUjFjoiYSlaHpZCsPNrxsphQFsTRhRDhzsoiOC6/YKVo6kVTn2fmJ7t4USR4tcv/SPtA
	T4TyCF1n1i8IOXaWf0++UorjybXHfAHai0eUQ2cZnSYmx/agVV6rAmKRXXZSc3EIdHFNplKzYG0Aa
	4AdAzGXBKZvT3p2pD3fIxPN0QfUjJXJuKl+gHw2M4pZfOUQK0oEIdy5kcmgw3GlNiikAZZ6pPr+Cc
	6C51FDJJ5ZNjz+yQJsczT8Zyb88wzOM6WA7mb5nS69r7KW9azMraoPm+kjdLhTxYM4Grfb4zIaDC3
	moebNIe+zu9Cjv7Y0Gxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJ4R-00000000HlT-1mrW;
	Fri, 12 Apr 2024 15:44:07 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJ4O-00000000Hkc-1KdL
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 15:44:05 +0000
Received: from cwcc.thunk.org (pool-173-48-113-2.bstnma.fios.verizon.net [173.48.113.2])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 43CFhg9b021405
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 11:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1712936626; bh=hNR9hJ5imm7pvcdn12hJQLsjPCdfcIBeTF5ThDzB0+I=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=fBcd5A1Gip2tvL3Hz8hd/OCcm4kh0QbVReEEeSxMB6gN7sXjwlbNkLLOsJICUoTjf
	 n78kpNa42Efu5x5posRsHr3q3XsjA7UJBxmtGbm98Hm17gLYmVo6FmWcfWZOnz/9Vg
	 n8oLYZ5FC0jaFQy8+ve4Vx0ua+k08ctd5jwXwCeVVzJWter0l+8FW9e+C8Td99ZpGi
	 wGM0TpyYXT3dFiJ9NXgSemr/U+cfBA/t2GJ5Fy5+MC/AnlpxdZvRb0auFAL550oGec
	 hFuGDfTviPwo/nUQnGw3aIiBxP2X6xP2R3NIe1GomQi+qSRtPmDfKRMScryidg4KAu
	 iVCG5vGDFz0ww==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 4A4FD15C00DE; Fri, 12 Apr 2024 11:43:42 -0400 (EDT)
Date: Fri, 12 Apr 2024 11:43:42 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org,
        Conor Dooley <conor@kernel.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240412154342.GA1310856@mit.edu>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_084404_712492_88895288 
X-CRM114-Status: GOOD (  12.04  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2024 at 04:57:08PM +0200, Bj=F6rn T=F6pel wrote:
> Hi!
> =

> I've been looking at an EXT4 splat on riscv32, that LKFT found [1]:

I'm getting a "page not found" for [1]?

> This was not present in 6.7. Bisection wasn't really helpful (to me at
> least); I got it down to commit c604110e662a ("Merge tag 'vfs-6.8.misc'
> of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs"), and when I
> revert the commits in the vfs merge the splat went away, but I *really*
> struggle to see how those are related...

It sounds like you have a reliable repro; is it something that can be
streamlined into a simple test program?  If so, is it something that
can be reproduced on other architectures?  And could you make it
available?

Thanks,

					- Ted

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
