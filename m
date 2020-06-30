Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ED1C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 14:55:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A7C20675
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 14:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPTNRI/e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A7C20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+9pFGK+CgAiauGY+vNT3qmaeQtxD+w9JU4o6Eh0oTYQ=; b=jPTNRI/eiURKwNdKV29bAECW1
	AQR9exQCZWdr1AtPEZfesrv7wodHaXWVngLhmlHAYQ0sGjH/iFBDje4oRTF7fpCAo3yj7m/BmRVwL
	B30Jv+8ZOu6Q2z+FF3zNkS0UZFTtpXOBC2NNljc57EVat41JUoU04fRRUdhuj9yGxUXE6CDnhfanx
	V/K2/Si7XV5KZu7da7EGrO5nSGKHQLJRuY2/BBA/9myfWOhPA1wfj8KPmt6JWbZCalrFCefvn+NMW
	CUCYBDE1Zp0lMyUJ7cExTvLIO+MkMqhCYulJI65aHEYy1kUjxf2Q+X1KX49ivjP7iPdqs0Y+DkpV7
	MN24MxVkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqHfU-0007Nw-FR; Tue, 30 Jun 2020 14:55:28 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqHfQ-0007Mt-DO
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 14:55:25 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB056AB64;
 Tue, 30 Jun 2020 14:55:21 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: syzkaller on risc-v
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmpn9gn1sd.fsf@suse.de>
 <CAEn-LTpDV5QQ1nkYVP9sE9T23YM_6cthT+LNUsLWYeQJ00xy7Q@mail.gmail.com>
 <a0435841-bb81-ed10-23fa-aef323e741b0@canonical.com>
 <CAEn-LToeQXFnuG=Z17nSHKD872+Hmep1DM1bhs1Og_deU9+OcA@mail.gmail.com>
X-Yow: Now, I think it would be GOOD to buy FIVE or SIX STUDEBAKERS
 and CRUISE for ARTIFICIAL FLAVORING!!
Date: Tue, 30 Jun 2020 16:55:21 +0200
In-Reply-To: <CAEn-LToeQXFnuG=Z17nSHKD872+Hmep1DM1bhs1Og_deU9+OcA@mail.gmail.com>
 (David Abdurachmanov's message of "Tue, 30 Jun 2020 16:57:12 +0300")
Message-ID: <mvmmu4kli1y.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
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
 =?utf-8?B?Qmo=?= =?utf-8?B?w7ZybiBUw7ZwZWw=?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Colin Ian King <colin.king@canonical.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jun 30 2020, David Abdurachmanov wrote:

> On Tue, Jun 30, 2020 at 4:38 PM Colin Ian King <colin.king@canonical.com> wrote:
>>
>> I believe I'm also seeing some potential stack smashing issues in the
>> lua engine in ZFS on risc-v. It is taking a while for me to debug, but I
>> don't see the failure on other arches.  Is there a way to bump the stack
>> size up temporarily to test with larger stacks on risc-v?
>
> Dmitry wrote on the original email that the follow solves issues with
> KCOV enabled:
>
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> -#define THREAD_SIZE_ORDER      (1)
> +#define THREAD_SIZE_ORDER      (2)

I think riscv should follow mips and use 16Kb stacks for 64-bit.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
