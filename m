Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4305C4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 11:53:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42010246CC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 11:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JsRhgvGx"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nfJEIjK/dqgV456FVoe/egjgpHW4dxn/fsYCQMCz3Ew=; b=JsRhgvGxIG7FZYnzrdyereyfy
	V41KR1GOY08q9qRgRgB7bN6a03UOBx3NfLKKGi0iuq3tneFAZ549+RcmQyceYHvsPKUVlJxUyFI0J
	oiiNWNIOYfej6kAkKV7z2lQGmLp2DRl87hsztaPf7DtRvEHKn+hMT5lAKrWuvjvihw4Y9XxPrZkbL
	QU660y0SwxOo23nCmcAkiHb0dx2Up68vhiWLWRoFf8rSrXDE4C0Xhqoj4c68uyfSL0qytDbPJGTJA
	bFgvF+gvYxOQTRy6FFUUJuT5qAJWqAHlZIwY0L6T086Xz4ocmHCnHPmoPC5elEsW7hBt8zmQxMAMv
	QKn9DLwMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXk0h-0003lF-Bk; Wed, 28 Oct 2020 11:52:59 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXk0e-0003jz-Vy
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 11:52:58 +0000
Received: from cpc98990-stkp12-2-0-cust216.10-2.cable.virginm.net
 ([86.26.12.217] helo=[192.168.0.10])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1kXk0c-0006z7-9N; Wed, 28 Oct 2020 11:52:54 +0000
Subject: Re: Linux kernels for Microchip Polarfire Icicle board
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
References: <1e50d459-efc0-e8ba-bff9-21c981d04554@codethink.co.uk>
 <CAEn-LToxmqnLWPk+B=+yQnxa0b8OiM-u+=+N5W=qE5fQGUdVyQ@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <0fa82d09-dbd9-41b3-4cee-ad0e24f86697@codethink.co.uk>
Date: Wed, 28 Oct 2020 11:52:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAEn-LToxmqnLWPk+B=+yQnxa0b8OiM-u+=+N5W=qE5fQGUdVyQ@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_075257_071283_DD43BF7D 
X-CRM114-Status: GOOD (  16.20  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 28/10/2020 08:47, David Abdurachmanov wrote:
> On Tue, Oct 27, 2020 at 4:59 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> I have been looking at running a new kernel on a Polarfire icicle board.
>> I started with the Yocto from Microchip, but was wondering if there is
>> any other work around this, public repositories or anyone else working
>> on it who wanted to collaborate.
>>
>> I would particularly like to get PCIe and USB working.
> 
> Microchip is working on upstreaming the driver for quite some time
> now. The drivers are posted on relative subsystem mailing-lists.
> 
> PCIe latest version: https://www.spinics.net/lists/linux-pci/msg100789.html
> Clk latest version: https://www.spinics.net/lists/linux-clk/msg52244.html

Thanks, I will go look at the pcie patches and see if I can get any
further with getting PCIe cards detected.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
