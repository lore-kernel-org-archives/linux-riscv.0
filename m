Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879B1C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 18:08:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0FEF619D0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 18:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0FEF619D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:In-Reply-To:From:
	Mime-Version:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9lRpDzV/J3HAZSakERbzolYHYnd2uK0zKnXVxje99sA=; b=MIdMImlIf8LGipRAHlDANHn9D
	P4snWs9gakjqYgRTlrlcPaoMM2xTput4U6ImH4ZtHNoRf9wqfdKRyUcLPz62UFn4oxJ3BtEh7pKmO
	oKmme1AqQO0RTME5ulJvFk9bNVYwaqKxyEai7nVnQ1RHSd6zDdu34LTHUWC6uHS5DD1AdRZQuEebD
	hFteZ5Q7TXIxH9YNm6ynYPRwk+DJ/cSAvpKrCOoSAJQEkUkxeJEOmKbTaJPFdJbNZ+O/7crjcVsoY
	BghHvtQrrZNkakLkOhjAhSSiIw5TVyZL/UPJ/R2nKy/BJdFiyMsBss7vqRZLswV6fnZVldd0aGJxo
	EnJDRZkTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRImh-004Xoy-1v; Tue, 30 Mar 2021 18:08:11 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRImS-004Xn1-AR; Tue, 30 Mar 2021 18:07:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1617127652; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Eyq7UqYoQqaEh0TMUnq5UzdsBNGHStBafdmSxV9W2kisa22bG7lmyAywbGT1XJNba7
 eioohjWH90m+ApCCaLfIJxxrR0fQOvTVZ+fpgqmhqIMk/mcG5vvv755Km5wHzjfz85eD
 AIodf4KHXJpzky4K9Aqs3tShThestACt/nWf04t592qQQCRQl6j3BZfA4sQbOP2xon7H
 CO2OSrUFpfKhmJRWkNPpKptwmAM6sMygUV0eEVrdYDzhUtLa+wHtAn+mOZEsc3EVuVuK
 I1WEqmTMsSz6bLFh8xF0oI/lJJm26GPzvsu8uvlw+eAR9YXciV1S+X5IXCmUg1qJUIug
 fnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617127652;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=TBtxdLUkTjgMvDEB4mRh0JBbXrVFmzYUj0lLVMFFsdA=;
 b=iDxuBxBtN4zGXwH2FsNDucbzs44++UuByW9OubNfPa+SgIUVYehN+9wajhoPfWf8ne
 AJBeDpLzfO9gvPi1AhT0jxBhUc3mkrU3McdEHDV+b0zDo5wFvykL3ipqabsAzZU6O7uz
 is7TqCigWd9ZbgrEsfGbT107MDunzyDPutsq+PzsCSPNZocW9LxvOzLbkyCPLhoBlc7/
 oipum/qvWNjCcVAwprWos80uz+EPG1wDUnbl2HlPeD0LPZubEv85OlwKgkt04b/wC3ze
 Q/YiSR5IF99tHUC2aAp+hTj0JNzGcOYR8WbAB/c0XCz3bibgnOfYzQ2C5UX/ZGASRCMW
 /9Eg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617127652;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=TBtxdLUkTjgMvDEB4mRh0JBbXrVFmzYUj0lLVMFFsdA=;
 b=mbDZevjFp2b5R5VUle8FDC8MwkfYJzBYGCwkaBTe2ybLg6GWxZEJsH5woKenUz96DZ
 HLCOwfabBd5h1GPxw3d1/qdKw063SU3JfrMvJjSZc4etXqVgZ2OuBchcRp0XGZjLqw0Q
 XI9sVLA8HjveKwrt594YK3I6FiUVUxeNeTlYhNwAe6WYcF1jzcOR6pVtqoJP9uP/xZ/D
 Syv6uzaw6Ma5RlMrYSJzO01MZ2ln4j1+WzqLWaT+SnK0MZvUpV72FVIyBP3MJRqqvVES
 dGUeryXh/+ZW1PiQ4IEXCAuRPM4Xx3PnN8Xk5C5+DltqN18M43BTURpT9dF2flHnmD8l
 liYA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAjw47t884="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.35] by smtp.strato.de (RZmta 47.23.1 DYNA|AUTH)
 with ESMTPSA id h03350x2UI7VJS3
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 30 Mar 2021 20:07:31 +0200 (CEST)
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210330172714.GR109100@zorba>
Date: Tue, 30 Mar 2021 20:07:30 +0200
Cc: will@kernel.org, Rob Herring <robh@kernel.org>,
 daniel@gimpelevich.san-francisco.ca.us, linux-arch@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 microblaze <monstr@monstr.eu>, linux-mips <linux-mips@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org
Message-Id: <D8C1FBF6-E5C0-4233-BCB8-694274EA28F9@goldelico.com>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <20210330172714.GR109100@zorba>
To: Daniel Walker <danielwa@cisco.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3124)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_190756_472273_3A9D29D8 
X-CRM114-Status: GOOD (  18.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


> Am 30.03.2021 um 19:27 schrieb Daniel Walker <danielwa@cisco.com>:
> 
> On Fri, Mar 26, 2021 at 01:44:48PM +0000, Christophe Leroy wrote:
>> This code provides architectures with a way to build command line
>> based on what is built in the kernel and what is handed over by the
>> bootloader, based on selected compile-time options.
>> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v3:
>> - Addressed comments from Will
>> - Added capability to have src == dst
>> ---
>> include/linux/cmdline.h | 57 +++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 57 insertions(+)
>> create mode 100644 include/linux/cmdline.h
>> 
>> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
>> new file mode 100644
>> index 000000000000..dea87edd41be
>> --- /dev/null
>> +++ b/include/linux/cmdline.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _LINUX_CMDLINE_H
>> +#define _LINUX_CMDLINE_H
>> +
>> +#include <linux/string.h>
>> +
>> +/* Allow architectures to override strlcat, powerpc can't use strings so early */
>> +#ifndef cmdline_strlcat
>> +#define cmdline_strlcat strlcat
>> +#endif
>> +
>> +/*
>> + * This function will append or prepend a builtin command line to the command
>> + * line provided by the bootloader. Kconfig options can be used to alter
>> + * the behavior of this builtin command line.
>> + * @dst: The destination of the final appended/prepended string.
>> + * @src: The starting string or NULL if there isn't one.
>> + * @len: the length of dest buffer.
>> + */
> 
> Append or prepend ? Cisco requires both at the same time. This is why my
> implementation provides both. I can't use this with both at once.

Just an idea: what about defining CMDLINE as a pattern where e.g. "$$" or "%%"
is replaced by the boot loader command line?

Then you can formulate replace, prepend, append, prepend+append with a single
CONFIG setting.

It may be a little more complex in code (scanning for the pattern and replacing
it and take care to temporary memory) but IMHO it could be worth to consider.

BR,
Nikolaus Schaller


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
