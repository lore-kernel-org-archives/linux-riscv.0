Return-Path: <SRS0=VX3L=XF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937C9C3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2019 06:57:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B1A21019
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2019 06:57:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PHf8vcF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B1A21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oinkBchfUDYxpJrkGGn1DqvhuwMdw5LzwrDsJD2F7IQ=; b=PHf8vcF5yP0NyY
	lMvCKrIodIaxjCmudPSyWXqpFWFoExYLC2QpgKGMy5xLfQGctFUnOcZmi6XM7TgbrE9y5O5DbUoBs
	iQV9LGNNiRZqrWuOhvUEy0ka14mGuhB+XWxnBrm68vBIvsePsBVGr2L5mZ1cEpJwrj+AeMekXtsdE
	VR+eVUjwiqaoe6wZmZjgjufBGS98CdwYdM0F9CkwMpaWo1FYmoQX30krFNKDoUV0EBGjj7q1Q5yof
	eaijd45/GOu//bfWD5q2qOHCg3K9RWdi5TLjQPq5Idzvl0ynefmxMv42V2Tdivl2QXjCY81hSIe2p
	AgftCLQxvQCQqyj7eKFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7a5z-0004N4-Oc; Tue, 10 Sep 2019 06:57:47 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7a5w-0004Ls-Np
 for linux-riscv@lists.infradead.org; Tue, 10 Sep 2019 06:57:46 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE142AC18;
 Tue, 10 Sep 2019 06:57:38 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] serial/sifive: select SERIAL_EARLYCON
References: <20190910055923.28384-1-hch@lst.de>
X-Yow: My EARS are GONE!!
Date: Tue, 10 Sep 2019 08:57:37 +0200
In-Reply-To: <20190910055923.28384-1-hch@lst.de> (Christoph Hellwig's message
 of "Tue, 10 Sep 2019 07:59:23 +0200")
Message-ID: <mvm4l1kskny.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_235744_927389_5A07A2B8 
X-CRM114-Status: UNSURE (   7.19  )
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
Cc: gregkh@linuxfoundation.org, jslaby@suse.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sep 10 2019, Christoph Hellwig <hch@lst.de> wrote:

> The sifive serial driver implements earlycon support,

It should probably be documented in admin-guide/kernel-parameters.txt.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
