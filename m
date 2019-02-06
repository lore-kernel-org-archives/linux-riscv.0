Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E8BC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 09:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3183D2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 09:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jNDlh8c6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3183D2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSo5lNApA8v9fsUdp6dCB9KAvHt1vVD8YkkExPmoCGE=; b=jNDlh8c6ZElyF+
	P2TTEmfjhzl0FVgY/BjTh0AZcqMZ+sH7VoJU+PnOs6quGoCG3/tmTPE7WtZ+8Yimkrprl27N6GpDV
	e8ZhGZuCUVAWQvU2pWAIG2gocvRxbegOl8nMfA/QtNtEJUf2frhJ4TUCgyrpEO/K+HWVuufRM9RJw
	nKrBHdOLnRVsGX6CDafUKsi8RMckqje6ZFNjlKu/GMsAtA7hKsk75irbkzi/gOeC+mi3fizF3/T9Y
	npgM7HzJ+7E9czrM4y00i/oFuckopJF+KuCJlWKJ1px5Q2VZUmRq0nFXIux1ihSgWeTq30qi9yv5E
	eVh2+nKZYvM62AxDpyjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grJK6-0002y9-Ho; Wed, 06 Feb 2019 09:16:50 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grJK1-0002vJ-9a
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 09:16:48 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85056AD7A;
 Wed,  6 Feb 2019 09:16:42 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: Boot stuck at "smp: Bringing up secondary CPUs ..."
References: <mvmsgx22r3u.fsf@suse.de>
 <F77EA382-959C-4142-9A00-F1EBB58D37F8@wdc.com>
X-Yow: How's it going in those MODULAR LOVE UNITS??
Date: Wed, 06 Feb 2019 10:16:41 +0100
In-Reply-To: <F77EA382-959C-4142-9A00-F1EBB58D37F8@wdc.com> (Atish Patra's
 message of "Tue, 5 Feb 2019 23:50:11 +0000")
Message-ID: <mvmtvhh1dl2.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_011645_655191_F587A834 
X-CRM114-Status: UNSURE (   5.56  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Feb 05 2019, Atish Patra <Atish.Patra@wdc.com> wrote:

> Are you loading Linux from U-Boot and openSBI ?

No.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
