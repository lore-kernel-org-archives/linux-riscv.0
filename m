Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B37EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 15:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C652082F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 15:51:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeLwGdLM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C652082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TROEri7cnLHCQJ82+y2BTwKswj8UCAZHzY5jDasnORs=; b=MeLwGdLMXQb7sX
	I5eUQ4YRnIpLCpmD8kG+H7lwFQZmmWY7TpA6SXCDQ3MtO6ARFfER4wPvKLY5CofJnaKdMbDAT8Ywx
	dD5svMwTnzmgjUMAByqdmFx1U70isfj0ZOn5MDK/J0Rt70TCoAwebq4a+h1mJ5o2EejpM35jMeGx7
	lflxCUZjqIDpTfw2K59YkK/nU9aJLwBQQUxXmQAE4OCszjE7o+cSscM6bVU7fVXR7pK0YqMRnphRc
	r4wozN7BQ7rtCkpL6jfjVtJVte5aEtqF3akLYkKHi/Un7VJm8BXLm87FeKXMdQYmYZEdQq/oVyMeo
	Jrel/APkjjGHbwLBifLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9XJF-0005aC-I5; Thu, 28 Mar 2019 15:51:17 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9XJC-0005Zj-N7
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 15:51:15 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1h9XJA-0004Qj-4B; Thu, 28 Mar 2019 09:51:12 -0600
To: Mike Rapoport <rppt@linux.ibm.com>
References: <20190327213643.23789-1-logang@deltatee.com>
 <20190327213643.23789-3-logang@deltatee.com>
 <20190328114924.GD14864@rapoport-lnx>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <863cb31f-cdb6-7d1b-335f-ed11157b8687@deltatee.com>
Date: Thu, 28 Mar 2019 09:51:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190328114924.GD14864@rapoport-lnx>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: hch@lst.de, linux-riscv@lists.infradead.org,
 sbates@raithlin.com, linux-kernel@vger.kernel.org, palmer@sifive.com,
 corbet@lwn.net, aou@eecs.berkeley.edu, rppt@linux.ibm.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 2/7] RISC-V: doc: Add file describing the virtual memory
 map
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_085114_797363_3E909721 
X-CRM114-Status: UNSURE (   7.40  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2019-03-28 5:49 a.m., Mike Rapoport wrote:
>> +
>> +The direct mapping covers as much of the physical memory space as
>> +possible so that it may cover some IO memory.
> 
> Please move the text before the tables, so that meaning of Sv32 and Sv39
> would be clear.
> 

Ok, thanks. I've queued up this change for a v2.

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
