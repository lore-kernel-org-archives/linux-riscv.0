Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A52C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 23:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjPR/dc1w671JH5vasGB8r2OborERKHcpd/WlrN6fH4=; b=uH39pvTTDXpsMc
	+74a4r+OF+yf73+HBjuWhUlg771Z2y4aI7h21hTgeldoN5qhDCqEE6Rd4pz40iUc28l6YaPtYE79S
	0jn8//2XQhXGpVLqMJW5tLvZKPR4mK7VBoUr87XxQOIqzZ2pb88rM3+7q2pxfGaN3i7780G9UIlaE
	IWmAtzAtbHYQ0aNa5eO4p+iOCfZcUUoMDyL4S0N5a2X9OIKcZhK9kLw673NqPzf4+76oBItfwvapy
	9VQrT14rew6d6mNzlWG4pt7cd/CnszaH3Nr3Y3qGJxMp6X/Q5MTTCBWGgMJ3HE7SIOsyJ7NqRdtma
	w0a5zU1p4Asl8EE6MBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBltN-001urL-P9; Sun, 23 Jan 2022 23:03:25 +0000
Received: from m228-4.mailgun.net ([159.135.228.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBltG-001uqq-Rh
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 23:03:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1642979002; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=y1h7LZQUH/315cUWgICxYsfKN2rIJtSAVtMI/BEmfGM=;
 b=YWFVLPy5LVrQ3UuddiTko/AzjVCyfGS1kCJV7d2OG6XQNt7RqcgbHLkPz+JxddYw9KUqunRA
 0wVUQzL6J5YtRv1N3qRpuV2byYTvcjTJ52xK455I1cCnlX4+NzZWmTqbxxdqbGvlgq5byklb
 ZqB0hlZjYNZucwFxWbtvX+adeTA=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61eddeac06362278a1d42f30 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 23 Jan 2022 23:03:08 GMT
Received: from [192.168.0.104] (cpe-173-88-115-50.columbus.res.rr.com
 [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id 0870040118;
 Sun, 23 Jan 2022 23:03:07 +0000 (UTC)
Message-ID: <5dca7098-0986-1e2a-1452-124c506b1241@michaelkloos.com>
Date: Sun, 23 Jan 2022 18:03:07 -0500
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
 <c184c65e-c960-8ecc-7cfe-d58af1cde0a3@michaelkloos.com>
 <228cbdb42a5c4c2f9d7214d2685fcaeb@AcuMS.aculab.com>
From: "Michael T. Kloos" <michael@michaelkloos.com>
In-Reply-To: <228cbdb42a5c4c2f9d7214d2685fcaeb@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_150322_677090_AC325532 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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

No problem.  If you have any other concerns about my patch, please let me know.

	Michael

On 1/23/22 17:35, David Laight wrote:

> From: michael@michaelkloos.com
>> Sent: 23 January 2022 16:54
>>
>> No.  It only uses tabs.  The previous version used spaces.
> Ah, it was the old one that was wrong.
> One of them was.
>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
