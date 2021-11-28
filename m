Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AA4C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 04:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6maAeR999PjTqjW2gYWh6p2gTUiyAQ9YGdSeM79x7Z0=; b=xd4+BzgCmbopOQ
	MFl3l2vkTp/7V6/Sc9cIlFx4lXSbd5UKLpt6VOdAjEJDb+jsr9u403icM43hmGZ9YR6+RNdvBsjUd
	c0H6Hv87JoW9MwuqCx1ZXiB0dmMOwozo4KJ9ztsT9Djw8bsABu6KVIS8gLP/UbaU/Mcz4hbNONOvS
	t8+5TDnI1nq3hY5Ue3MrG8SHORDxwboiuoGgqY7rWOUE9q3UyhTYFz1v//OlgToOo3LeUBaBLNkD9
	tU0OM8DHjhWlBrXC20fah1f02I9+XW4ENHcE8zSOVswoxZwWZu3G4/8liGgV4kK0QHNsJBOJTcg+4
	8lpPwFG/TE8T0V3RkoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrCGg-00F3tA-Fk; Sun, 28 Nov 2021 04:58:26 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrCGT-00F3rs-N7; Sun, 28 Nov 2021 04:58:15 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1wvh31dgzNL;
 Sun, 28 Nov 2021 05:47:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638074864; bh=T0svUg/TJeCaOj3VBZ/3tRgBnlIZMjU65z9Fv+g5zQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nn7s8QPTQ/loie98xkMYWvJAWdNi0ygFbehqQ63G9aASvWbHHSf28+XNOM2IsqPek
 Id9Qk7aFHuFwrGibBi8TresAAu9XqBcHIi12aTTvDPBLXczkWFqaVeOOJqwU7nzdju
 cV9IwxL2w6Fd22ryYwl1Sh9x2PviA4Kf1ikAu3uR5SMygCLmnTRZxshC+MEAGrH0Kv
 tsp5I9URKJw3bR68w4MVuWQ2xdmfd6DgYPrQCMsS55RcJLwTkVCCw/V2t3AdcHjMnW
 QCHQOrGKek5wpaMAmZUhPLRcHZ38Wx/IlUleKYu8VrTTTyi1x1pbkvgBzAZLAICths
 2w9BfRFMcSpxg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 05:47:43 +0100
From: =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/9] all: replace bitmap_weigth() with
 bitmap_{empty,full,eq,gt,le}
Message-ID: <YaMJ7x8viyKyYk6w@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-4-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-4-yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_205813_943778_CC3992C4 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 27, 2021 at 07:56:58PM -0800, Yury Norov wrote:
> bitmap_weight() counts all set bits in the bitmap unconditionally.
> However in some cases we can traverse a part of bitmap when we
> only need to check if number of set bits is greater, less or equal
> to some number.
> =

> This patch replaces bitmap_weight() with one of
> bitmap_{empty,full,eq,gt,le), as appropriate.
> =

> In some places driver code has been optimized further, where it's
> trivial.
[...]

I think this patch needs to be split. bitmap_full/empty() conversions
can be separated (don't need the bitmap_weight_*() functions) and
not all changes are trivial. Besides, gathering and checking all the
acks needed into one patch seems problematic.

Best Regards,
Micha=B3=A0Miros=B3aw

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
