Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F08FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhuREkxewitTyX1C9vYRf8no7hxkxCCXQOJeyNW9Nz8=; b=Xg9bhPW4650/5h
	LwnJ2cVxsWahMpZANr1omrpwr87JbG8xcIq2Fxituddp4kjFH8WElPGGKkDLbYeTd6K3LaKX77TWQ
	C88gC7bSkqT+tbWG/F9bw8T4VBnHWl3qfTg1Vmk9gQCQYuilUjJbSOgJnIlTMRnSwfSGKvQ3oypRV
	l0WfUs/QfONAVjBbV4zUZoxz6g2jiviieJINZbLvek5tNlF92r8ocMa2mz+cV99Q9GJxs8b19ZiWs
	xOPdYMKQZzMPCTPeA2hbIkdxJzrJo/15j+jM90BJ+69DsXlnJTqvsGm+F+rO7FCHTw1SdiOoyukqI
	yxYkTQQanJk3cGTHGaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBg7V-001PHr-GF; Sun, 23 Jan 2022 16:53:37 +0000
Received: from m228-6.mailgun.net ([159.135.228.6])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBg7T-001PGz-GF
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 16:53:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1642956815; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=IHqd7yX1XGLLOu24CAliRnIh4Fy6X/3R/a7MUMsmKr8=;
 b=HfC8sW/XYVhZSdkCGdFI2J1HRs+e0tJ9Gg7WWjOiBoxBJSdxX8QerG5j2C3snEiysiO/rqau
 EpOac8gPnLbzOBpwO//cir3ZdhtTKoAAmTNfuNgEM2YjiqhWSonxnsf0yB+6jXl+ojeDSQu3
 zEma1dbnHPgsydzmHGgkwREaGvc=
X-Mailgun-Sending-Ip: 159.135.228.6
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61ed880d7e1ee9b1c1ae3a16 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 23 Jan 2022 16:53:33 GMT
Received: from [192.168.0.104] (cpe-173-88-115-50.columbus.res.rr.com
 [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id AD4AC40249;
 Sun, 23 Jan 2022 16:53:31 +0000 (UTC)
Message-ID: <c184c65e-c960-8ecc-7cfe-d58af1cde0a3@michaelkloos.com>
Date: Sun, 23 Jan 2022 11:53:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] Fixed: Misaligned memory access. Fixed pointer
 comparison.
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220123034518.3717116-1-michael@michaelkloos.com>
 <fed7ee473044432180c67b4adc0eb45d@AcuMS.aculab.com>
From: "Michael T. Kloos" <michael@michaelkloos.com>
In-Reply-To: <fed7ee473044432180c67b4adc0eb45d@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_085335_633464_C20A1138 
X-CRM114-Status: GOOD (  15.07  )
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

No.  It only uses tabs.  The previous version used spaces.
Make sure that you are not looking at a line with a '-'.
The only place that spaces, perhaps combined with tabs, appear
at the start of a line in my patch is to align the '*' character
for a multi-line comment.  In this case, tab(s) are followed by
a single space for alignment.  I believe this is correct per
the coding style.  If I am wrong, please let me know.

	----Michael

On 1/23/22 08:31, David Laight wrote:

> From: michael@michaelkloos.com
>> Sent: 23 January 2022 03:45
>>
>> Rewrote the riscv memmove() assembly implementation.  The
>> previous implementation did not check memory alignment and it
>> compared 2 pointers with a signed comparison.  The misaligned
>> memory access would cause the kernel to crash on systems that
>> did not emulate it in firmware and did not support it in hardware.
>> Firmware emulation is slow and may not exist.  Additionally,
>> hardware support may not exist and would likely still run slower
>> than aligned accesses even if it did.  The RISC-V spec does not
>> guarantee that support for misaligned memory accesses will exist.
>> It should not be depended on.
> ...
>
> From the way my email client display the patch I think it is
> using both tabs and spaces for indentation.
>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
