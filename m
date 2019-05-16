Return-Path: <SRS0=H4VQ=TQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAEAC04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 21:53:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF5192082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 21:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbojleAe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Ej9cKsPY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Ej9cKsPY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF5192082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhDoAdZ2LLFeZvmnSqGEazKHErq88v66BzqDaO/PbM0=; b=HbojleAeRn5S6+
	2np2sm6n7j4cwwh6QQvXd7ibMblITU+EI+3uESfLKlSCn+MxU/atCwR8xVtHbMeM93s5Rou5Yao6F
	LOCeZ34mQMHqQ6H/XMuXmejOhXQfcV1HQkenHWQolxw7IWILLKLW/YmmzLvxJ0u3cVwAmL0IFZv1l
	pMB/+x8eXFVILW9DcQri90LstqCLj3iFZOUhJ0N3ElUM9H8797F2hyjnChdN4mD6UvRzwWzy/AhuN
	OvF5F0akfXLHWP2aWexqT1wX8Gm3uJmhHeKlcrX+tK55ZiZ8Jp/ppdA7iAVrzNanddeHDbgWxXxR2
	19W2XUUko3ZvD4GNcTWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hROJz-0006A1-Qd; Thu, 16 May 2019 21:53:51 +0000
Received: from bedivere.hansenpartnership.com ([66.63.167.143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hROJx-000694-Jo
 for linux-riscv@lists.infradead.org; Thu, 16 May 2019 21:53:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 89A8F8EE109;
 Thu, 16 May 2019 14:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1558043625;
 bh=jjQxK8gG30fC8ztphEl/+NchX6EWOkygL8i2PMuVq9U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Ej9cKsPYRiVs3hKWegxKZYbVTyWhjFJDipWtVAXw++pT/OjiGnooSR170YcM1C3Iz
 irU3Cw8B+qD/zqpfXRluw303d1dzUV6uSi3lTX61vTQE6bXvJQPFT2Tle/T2YDMksF
 mqPFgSEU19WymQeFDf8Ozh3PxPh0zTcNc03cylqg=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id mfCEGp6lPT57; Thu, 16 May 2019 14:53:45 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D48728EE062;
 Thu, 16 May 2019 14:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1558043625;
 bh=jjQxK8gG30fC8ztphEl/+NchX6EWOkygL8i2PMuVq9U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Ej9cKsPYRiVs3hKWegxKZYbVTyWhjFJDipWtVAXw++pT/OjiGnooSR170YcM1C3Iz
 irU3Cw8B+qD/zqpfXRluw303d1dzUV6uSi3lTX61vTQE6bXvJQPFT2Tle/T2YDMksF
 mqPFgSEU19WymQeFDf8Ozh3PxPh0zTcNc03cylqg=
Message-ID: <1558043623.29359.44.camel@HansenPartnership.com>
Subject: Re: [GIT PULL] asm-generic: kill <asm/segment.h> and improve nommu
 generic uaccess helpers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann
 <arnd@arndb.de>
Date: Thu, 16 May 2019 14:53:43 -0700
In-Reply-To: <CAHk-=wiH=vGjsW9MdWFGsgto2W+71sA4XJ7CSubpXkbpC_bGKA@mail.gmail.com>
References: <CAK8P3a2+RHAReOZdo8nEvqDeC1EPj83L2Ug4JuVRiUh943AuNw@mail.gmail.com>
 <CAHk-=wgiv5ftb+dq7N8cN4n2YX3VkyzeQccywn07Xu9xhOLTSw@mail.gmail.com>
 <CAK8P3a2EEuxh3uhsqauEC_vROZ7tQHhFwxgiLUnrgtpMdb3kuA@mail.gmail.com>
 <CAHk-=wiH=vGjsW9MdWFGsgto2W+71sA4XJ7CSubpXkbpC_bGKA@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_145349_667026_3321834E 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 2019-05-16 at 13:59 -0700, Linus Torvalds wrote:
> On Thu, May 16, 2019 at 1:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > 
> > 
> > I have reconfigured it locally now and pushed an identical tag with
> > a
> > new signature. Can you see if that gives you the same warning if
> > you
> > try to pull that?
> 
> No, same issue:

The problem seems to be this:

jejb@jarvis:~> gpg --list-keys 60AB47FFC9095227
pub   rsa4096 2011-10-27 [C]
      88AFCD206B1611957187F16B60AB47FFC9095227
sub   rsa4096 2011-10-27 [E]

Your key is a "Certification key" and you have an encryption subkey but
no signing key at all.  Usually you either have a signing subkey or
your master key is both certification and signing ([CS] flags). 
Certification keys can only be used to certify other keys, they can't
be used for signing, but I bet gpg is assuming that it can sign with
the master key even if it doesn't possess the signing flag.

You can make your master key a signing key by doing

gpg --expert --edit-key 60AB47FFC9095227

Then doing

gpg> change-usage

and selecting "toggle sign"

Or you could just add a signing subkey.

In either case you'll need to save and sign the changes and then push
to a keyserver for the rest of us to see it.

James


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
