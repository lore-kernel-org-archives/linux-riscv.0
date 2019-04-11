Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240BFC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 07:17:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20FD2133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 07:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EhEiLakY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZKT4jGVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20FD2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ik4Ue7tbfkOz1fgttP7Z6A8+OEXN3kTYNXaz2ZTtbwU=; b=EhEiLakYGG61QEVTEAw6z9epT
	Ha2QsoAQNTBR09W6W5jrEwERxqArFOKRXOybMKYX8hcYZINLQBC2lRYXZnhAn1mM7BDLUWfaKmYb5
	I6jTI/qi+a3vmPHHsk2TC7M8mnTQGvlfFxF+fKZxyuwuFtVHvj5F5HVwG9HYNGv4sOH7Mv10mFTuG
	K+wUuAYbEtgBNzYPi6Xp5/3G2GkaAg47JeZJ647YLRQYv4i+k2dmwj7ObY35Ssa8TtgLuFVYQsEWN
	l0Dji/gBI8HW5yp7AC+gWT1iU/EoSafWuRz/Oj8E74nuWyyPtMVuLm07c7SFHkxv40kH031qppC59
	oQE/mJyTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hETxy-0001Is-B5; Thu, 11 Apr 2019 07:17:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hETxs-0001C3-6F; Thu, 11 Apr 2019 07:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r2zr0dkkseZ4YwG+4x5cG1AgJqCY9BJpepDcOBgMdDo=; b=ZKT4jGVhbhuO/2V2/N3ttaXPBX
 Yhq3Ff9CJex5SKZbnVQzX+hvE91DDADq2GbkqDqOirsCKEji0RxNmX+VnxN9qyzi2F3Obr5zbqRni
 lHv1Da+VZWJSt4qYLtqCsC+uX4HKErxo5BG4McQc7TghmrJJKuomgK+SP1mTzYx2gF7Y/qmS5edJ+
 3+H8I3vEo7DrzhJJQtsTE4QZ3aBjLHvrg3qr2olVBE4vCxfJyJeG+jPUZmTDVLKaAIUicAUSj+OyO
 2jZWZOlcrSnXg9nDRnMkq1E7+Kj7LmzgOMui2FTn1rQ/D1LTbXXOP8unKNomXxBe7rjveYYXgqgHH
 ZzoEQCSw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hETxp-0004Ai-4n; Thu, 11 Apr 2019 07:17:38 +0000
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A0D7EFF80C;
 Thu, 11 Apr 2019 07:17:05 +0000 (UTC)
Subject: Re: [PATCH v2 2/5] arm64, mm: Move generic mmap layout functions to mm
To: Kees Cook <keescook@chromium.org>
References: <20190404055128.24330-1-alex@ghiti.fr>
 <20190404055128.24330-3-alex@ghiti.fr> <20190410065908.GC2942@infradead.org>
 <8d482fd0-b926-6d11-0554-a0f9001d19aa@ghiti.fr>
 <CAGXu5jKt8f7=DKrvcPg-NUJGbc-vanMNojfDsEiBt3vP05G4oQ@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <4c498b2b-e916-3389-209f-aa4cc7b523ff@ghiti.fr>
Date: Thu, 11 Apr 2019 09:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAGXu5jKt8f7=DKrvcPg-NUJGbc-vanMNojfDsEiBt3vP05G4oQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_081737_259585_258D695A 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Paul Burton <paul.burton@mips.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 04/10/2019 08:27 PM, Kees Cook wrote:
> On Wed, Apr 10, 2019 at 12:33 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>> On 04/10/2019 08:59 AM, Christoph Hellwig wrote:
>>> On Thu, Apr 04, 2019 at 01:51:25AM -0400, Alexandre Ghiti wrote:
>>>> - fix the case where stack randomization should not be taken into
>>>>     account.
>>> Hmm.  This sounds a bit vague.  It might be better if something
>>> considered a fix is split out to a separate patch with a good
>>> description.
>> Ok, I will move this fix in another patch.
> Yeah, I think it'd be best to break this into a few (likely small) patches:
> - update the compat case in the arm64 code
> - fix the "not randomized" case
> - move the code to mm/ (line-for-line identical for easy review)
>
> That'll make it much easier to review (at least for me).
>
> Thanks!
>

Sorry about that, I'm working on it.

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
