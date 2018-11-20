Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1621DC41536
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEFED206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gefmn5e8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WvNsmnGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEFED206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxhSTrjEriGE0RYDg52qexEIJ6y81ACEVLFsy40yO4Y=; b=Gefmn5e8X4RYYm
	3rA149VxNBWx4p3iziR34u2ZLQvzlSYCyjVr7BlNdSN+i5xx3NUBIoYNu4Cl2F9Gs6mqSZsOKRf/+
	UeReYsKu7IWJCO3SkrwWm0hjuT4RJSo6KrdLrQPsujn1txdklCdwhpcHCOIABRfhk5KWWMAv+NdHN
	rhSWAwA8mEIJsgB8K1sN9mXy7LzUAvLjF7qqMk1Ud7ViqrfHKOoF4xH7jQyPNBrLymeCkjIL/3Zpa
	44tYNViDXe+ZYdpLWVguwLV3dSuirdL7LpbdTr1fAzBLceisbmRTIZRLX5t4Q6AczJMXsAmE3Kkkv
	W1hK9ix5rUsxrl8ba+Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP8UB-000848-Vt; Tue, 20 Nov 2018 16:02:47 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8HC-0003nl-KU
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 15:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=74q9uDQjAXYHXuBE1tgXhgtKwry9hENawp5LvfrG424=; b=WvNsmnGbZLZNw3kRHlbdxD9rE
 IoaVIulBBYjfmivazhS0+E4GPFtotIc9tyaFyQXq1e9ZE7lnuvRRgsTUOSdj5Avq89vUlfkanne5M
 t8NWZsxxVi8p9ehy1mQgqqMIbuvN9v/iV2DBRBASJsuzBlT6WfRNDOM51lZPISpfBMkD+jRYiQjA8
 I7gCVHiZQ6c4WuyPUsg5B0ppuqXt+GCMBp2uLj4n9qbgUlUhnjbWZE2cKCeHF3qQoCNqLqjA+3QfT
 yPf+xJvW6YAZnHlXovNVvAXRprwh3vRYQ5GFqwPdSk+nKm7ztmJKV6qxtHEdyPmXJrVMUtz87VS5p
 jV/DH2ekw==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1mB-0005VM-Ud
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 08:52:57 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74397AE56;
 Tue, 20 Nov 2018 08:52:43 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: Kernel panic - not syncing: corrupted stack end detected inside
 scheduler
References: <mhng-ce3ee330-9ac5-41c3-9890-ee9d6dabe105@palmer-si-x1c4>
X-Yow: Yow! Now I get to think about all the BAD THINGS I did to a BOWLING BALL
 when I was in JUNIOR HIGH SCHOOL!
Date: Tue, 20 Nov 2018 09:52:42 +0100
In-Reply-To: <mhng-ce3ee330-9ac5-41c3-9890-ee9d6dabe105@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Mon, 19 Nov 2018 15:46:37 -0800 (PST)")
Message-ID: <mvmftvw9llx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_035256_138930_DE6B1465 
X-CRM114-Status: UNSURE (   9.57  )
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
Message-ID: <20181120085242.IE1n8ZdwIkEDlUMrjqVXswKqGX0Fz74eABbvwnfGaTI@z>

On Nov 19 2018, Palmer Dabbelt <palmer@sifive.com> wrote:

> Sorry I can't be more specific.  Does this require hardware to manifest?

This was on the hifive.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
