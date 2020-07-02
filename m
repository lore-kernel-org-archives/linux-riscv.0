Return-Path: <SRS0=rvuQ=AN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D82C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 22:01:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9284F20885
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 22:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DjA4iF3O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Y3AiYZMl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9284F20885
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Uc8hPatvQGufjVotICbTTA3Eb59VY2lFtKvNEOXSI4=; b=DjA4iF3OVm6LaFQfgMILQ6Rmp
	9FG8uoQUkG6uPVZ9tBVvhTch2tPh88Z7aKTeaARRL5I4YHUHkTa1jUSvdFBEjYeN4OMPJYfVU1yl+
	69k/UC081le81t7UfaP+sQPYdfxroiwKICAdhrgmOhQuQDHINVz2drjDjOXg9z3kJ1sZR3ZLH3UhB
	IBeKlG2WTKNeEoULSx1t0wiGKrb27wQSp2VlOkxxNZT7GEen1WG57MY4EcrISOookDxXt695YTRRP
	w9RtK0Bprfn4MTSx8p53v+VVrsKj38qIYamChh53gDHpPpMLBXtUVDsx/n0XLGOw3z0r/WSRJZ6oX
	MS9VbCoFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr7GP-0008R7-6Y; Thu, 02 Jul 2020 22:01:01 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr7GM-0008Q3-Eg
 for linux-riscv@lists.infradead.org; Thu, 02 Jul 2020 22:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=EmR9IIeqO0sBkjE86oT8IkC8HTrgYJIkjkGuM6Uiq9I=; b=Y3AiYZMl5nbyoHunXY9hAad9jI
 o+c4lAta6Uzzkpr1dVWwNOicRTbEGtr/BKk3Unz6e3Af67/R5dIZcgP5ERYRhq0t3KtDOph1Q60Ul
 f1+lege7JbBw1r1k9WAqKr7s4+dvEcZqHMI70PHgdqF+Xs8HLAN7DqSHpONE87dDldaNRZyrcl81a
 oOoF+FZzM5W2QLRoyX2BbA89uU35GcERftdGCzVdO+6oicp/QZfaRBnAtOSJGbCxAgbVHjlYh0N50
 NYt2TRYzKxXKKb/Smy0Su6YEH9Dn9mxvYWHTzs8sLqT9OT3lsXQUY+CcMdYhrO4y61Bu+Ef/q7A5h
 4MJGOTFA==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1jr7GA-0004D6-F4; Fri, 03 Jul 2020 00:00:46 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94)
 (envelope-from <aurelien@aurel32.net>)
 id 1jr7G9-004zJY-NP; Fri, 03 Jul 2020 00:00:45 +0200
Date: Fri, 3 Jul 2020 00:00:45 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: syzkaller on risc-v
Message-ID: <20200702220045.GA1187627@aurel32.net>
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmlfk4n1mj.fsf@suse.de>
 <CAEn-LTqVR4CXk-q=7zwFKvgmHEZpP+AO0XiycKf9mDAHS60_yg@mail.gmail.com>
 <mvm8sg4n0ja.fsf@suse.de>
 <CAEn-LTq8cxT73p29hCx5_B9-b_J0khTFgEJAPwFE8zesktNE1A@mail.gmail.com>
 <mvmzh8klld6.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmzh8klld6.fsf@suse.de>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_180058_598730_C5176693 
X-CRM114-Status: UNSURE (   5.46  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 =?iso-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-06-30 15:43, Andreas Schwab wrote:
> On Jun 30 2020, David Abdurachmanov wrote:
> 
> > You seem to bootstrap with gccgo, which will not work (tried it).
> 
> I consider that broken.

I agree that something is broken. Here gccgo is broken, not Golang. 

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
