Return-Path: <SRS0=BHV5=OA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA8EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 08:55:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD672146F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 08:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dbIW0pX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD672146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Q4PHx+pkg8PomU5+zWjwJynckgotvB0JUNnP2WXpCk=; b=dbIW0pX8h1CdGV
	wvYm9uMDyF5ite22kr74QdhQmij43Jahjc0yYVBQ++9kfvFpEJ2Pc4Q5avMRjxf6ET20dzbj0Rf8W
	vqa2zgI3qhfQZIbWvjBFcS3C8qbH89bMGLdMy3yuqywnA3t9muqxQzIzsqv6ErXu4fawLQxBTbUFV
	rUhM9yyXK/+cwHoxC+SofX9Rr0Od4HtZTKEdun9sYPLwzqDA9iH/EAxcrgPTAXUWaGe3DPJcWV5sU
	+0qScENsYyubjXNpaOAoZNlP+gZC4aOe0eVD1QxHUiF6+AAF8sjkI/A/c6cizPHmiXEHeUQxjjtfh
	1r2HAecsYuakNVLmhJWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPOIF-0003XR-Fj; Wed, 21 Nov 2018 08:55:31 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPOIC-0003WU-OM
 for linux-riscv@lists.infradead.org; Wed, 21 Nov 2018 08:55:30 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9658EAC9F;
 Wed, 21 Nov 2018 08:55:15 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: Kernel panic - not syncing: corrupted stack end detected inside
 scheduler
References: <mhng-a200fe90-01a6-444d-9f76-0b00c22249e8@palmer-si-x1c4>
X-Yow: What I need is a MATURE RELATIONSHIP with a FLOPPY DISK...
Date: Wed, 21 Nov 2018 09:55:14 +0100
In-Reply-To: <mhng-a200fe90-01a6-444d-9f76-0b00c22249e8@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Tue, 20 Nov 2018 09:29:48 -0800 (PST)")
Message-ID: <mvmmuq2lsi5.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_005528_942791_43713EB3 
X-CRM114-Status: UNSURE (   7.27  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181121085514.knCCfOJCw8gTXp5nYQ4IP_gr1OAtCjKa09hV85CkFiU@z>

On Nov 20 2018, Palmer Dabbelt <palmer@sifive.com> wrote:

> Do you have a better way to reproduce this than to just hammer the filesystem?

I don't hammer the filesystem.  Most of the data is on nfs and /tmp is
on tmpfs.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
