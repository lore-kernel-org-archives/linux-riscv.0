Return-Path: <SRS0=huAv=DA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA46C2D0A8
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 17:10:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43789205F4
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 17:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IpfG+WM8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="XQMQHr5Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43789205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XIOhvg9nWivixf9Oaw1fEIQhT+WlH6U6A745DOufVpA=; b=IpfG+WM8p3p8FjTkY4pKDs2Ct
	FEhX92e18t7HS02gxK5Z9gJt7Ia41HKoiu2etrYxDS3m+3HABqlcIgTEcoMEwXJahlzZQY4HPgTDO
	tIVpl+2y4qST06ST6ItVQgJyCPCIPST/gnutyILGgLOpBbdS9P3axosV9rIcARtj2RcOtCFWgUJsn
	7wOJ+qpWEg7Na35Vyu6jQZdWDfrocZHuszTvSemTET91IKdViiWZkePdiVXb/98VQuyQkHsRHbpLI
	j+8t9xNUE1rcISXSd2aUQ8ICiDEpT4KMJr0wuomZ0FI27T9MyUKhqeen51H21aBcqoExr3TZpJ3as
	2OVlJKbQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL8Hi-00026q-N1; Wed, 23 Sep 2020 17:10:26 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL8Hg-00025k-1C
 for linux-riscv@lists.infradead.org; Wed, 23 Sep 2020 17:10:25 +0000
Received: from zn.tnic (p200300ec2f0d1300d32f22708559be5e.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:1300:d32f:2270:8559:be5e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E9AA81EC0354;
 Wed, 23 Sep 2020 19:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1600881021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=6F9YvtxHG+c2cZaGVC+//+2V2p0AzAkNmUeEjK15LHA=;
 b=XQMQHr5Q8a40hjhYW6qwvs1J2ZBWNLDfOBK11zYoCN1YvZ/7agCRQq+bnb40fVAmhathTw
 EXtmab8xX6/sSpEfZInNfvARusehabBa/PdUpoKXf913rhjRPbgeidfAcT/3Pwu/mRJqzc
 blDSfjklSbvjtjgPzdH7VyVaHb6dVJg=
Date: Wed, 23 Sep 2020 19:10:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 3/3] EDAC/sifive: Add EDAC support for Memory
 Controller in SiFive SoCs
Message-ID: <20200923171013.GS28545@zn.tnic>
References: <1599457679-8947-1-git-send-email-yash.shah@sifive.com>
 <1599457679-8947-4-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599457679-8947-4-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_131024_203620_AB549547 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 james.morse@arm.com, linux-riscv@lists.infradead.org, mchehab@kernel.org,
 aou@eecs.berkeley.edu, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 11:17:59AM +0530, Yash Shah wrote:
> Add Memory controller EDAC support to the SiFive platform EDAC driver.
> It registers for ECC notifier events from the memory controller.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Reviewed-by is usually enough and stronger than Acked-by. See sections

12) When to use Acked-by:, Cc:, and Co-developed-by:
13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:

in Documentation/process/submitting-patches.rst.

With that addressed:

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
