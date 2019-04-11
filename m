Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A961FC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 14:45:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B52B2077C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 14:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MfWvDK7i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B52B2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUfFE+LtSz1vxT0PsqqfSInsJUQBYxDuOkhNqOSBFEo=; b=MfWvDK7ixJoRZ2
	0aT7eKeH8lWYGZI08P1cjEEoup1XotRFEnp5J0wIEp/LYcHU2UImQWjBwLLzpBESHf8Uynsr82158
	y0RQnpfGliJjw/7aznScLzcnZSoALdKPkdBII7R4JexPtNPg4EbSX72wKw3sSbJc808m3y3EvSEv3
	0RmIcGqVdc5QJlpl7Pby3DhK7snIz5cg76mw2TKSfET+AGHFyek1KGLo6uxVMBvbWS0oogWJobkm8
	xZRwffQucVNYu76tAd0cwROqzfwyXW3D9NSxRB5V9lXlITorPslWbd3R8ipDqfI4OvaOV0ZVwkjHX
	ZbwfvLqXeiL5oTn3HUBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEaxF-0006kV-Bj; Thu, 11 Apr 2019 14:45:29 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEaxC-0006kA-T0
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 14:45:28 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF9F4AE1D;
 Thu, 11 Apr 2019 14:45:24 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 0/2] tty: serial: add DT bindings and serial driver for
 the SiFive FU540 UART
References: <20181020101045.15991-1-paul.walmsley@sifive.com>
 <mvmr2bkxntv.fsf@suse.de>
 <alpine.DEB.2.21.9999.1904110151030.5868@viisi.sifive.com>
X-Yow: I have nostalgia for the late Sixties! In 1969 I left my laundry with
 a hippie!!  During an unauthorized Tupperware party it was chopped &
 diced!
Date: Thu, 11 Apr 2019 16:45:24 +0200
In-Reply-To: <alpine.DEB.2.21.9999.1904110151030.5868@viisi.sifive.com> (Paul
 Walmsley's message of "Thu, 11 Apr 2019 01:54:05 -0700 (PDT)")
Message-ID: <mvm1s28fvnf.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_074527_083868_AEC35B8B 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: devicetree@vger.kernel.org, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Apr 11 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> On Wed, 6 Mar 2019, Andreas Schwab wrote:
>
>> Trying to log in on the serial console causes the system to freeze.  The
>> last message is:
>> 
>> [  115.597858] sifive-serial 10010000.serial: BRKINT/PARMRK flag not supported
>
> Have not seen that problem.

# stty sane -F /dev/ttySIF0
<crash>

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
