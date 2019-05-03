Return-Path: <SRS0=24rb=TD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73D8C04AAA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 May 2019 19:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90CF2081C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 May 2019 19:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZlFTyWeV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kiSSW7aS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90CF2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9K9PmHcsV4EFiL5d7DO9nbnlyrbh0v6ITmuDLQeQtz4=; b=ZlFTyWeV4xXiYk
	z0+g8EH6MWYYUY99R7Imq7zfpuxlWGXXybE7LOf6cNVSjYOFBazKp2wjtkMTX5Ykhv2Ak3X3Urwwx
	Y4vHwmhCjXE9wI5QQqWiLaQCdFm+OptksUJN9itDvnZ9ZZc7ZBc5IhM4apHcgCkojIqdjts+YxevU
	GMAezcgzfBUxV65FgHn8b1GS+/ie/u0e+EIfcDzwGGh6nsfD/0Zj/Ph55/m279SZIHsbFgka+Pmpg
	n984XGEgiaThYodECpE7StzfdrUFFRHuzYCAqnE3SeuuyEZxFEFaMT+wFBAzkUgsh2lwHSVHqTr5t
	d7mFHE1ql6VivsEGM02w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMdol-0003eY-0Z; Fri, 03 May 2019 19:25:59 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMdoi-0003dl-Dq
 for linux-riscv@lists.infradead.org; Fri, 03 May 2019 19:25:57 +0000
Received: by mail-it1-x141.google.com with SMTP id s3so11022736itk.1
 for <linux-riscv@lists.infradead.org>; Fri, 03 May 2019 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rWmEMhzliXcvOCRw3oQALFdco9XMzYzIIL0waa/gPso=;
 b=kiSSW7aSQ9bW2r5VTe/j9kH3X7KcjLczLQh7LQZXDPHzWSJ2bRleyY4/rcvXuGGtP8
 h0Cyh08fdlQJAzSNhL1YqT2Kxlb/ota9cE18qbPPYJx7iiGOkRnakf0J0om8ImkSUOYF
 UiaS8qsHn/tiKdxPqd/OkpsImAVBnwBKQ93x4A94EW7b2vqPuzVuY/orAVL0Nwxi4qjS
 /OfVwDpBI0F6eq4eBLrJpZlttYqKhnPrAQs7DmJvWzdbTj/Uih6JMX6P50NbB8i3TRtn
 QhggAYwBHI07vJ3JPo7Vf7CDi5UEsDs2p03KvzViTNWxL1wWURERsP9JeoF6XvCAJTQH
 7s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rWmEMhzliXcvOCRw3oQALFdco9XMzYzIIL0waa/gPso=;
 b=ZcmAWOYq0JwRs4/jtlp0qSD5+9Ais1aFO1yJqkjKVkQIKOzpN+mTheG1O+YfE21Tgg
 1g/94Oowifu594Q0JcQAsyezXX7gujy1DMYL8eG5nB4Ctbb0EMOG29lDaidJuhrZfPE9
 mmEtgWzJkM/OO2SnASoagYaOZWg9ZImEqL9aF8d1HmMRWCbmeeX7kAhKrLSMezrTkhIh
 KoiUvUMmXDgZTO41ksHeKH1c6yxFYHTygkuxkhnvIideTtVKkyQTEq0EHUfzLhj4h+Iw
 MIFZSexV/ORo3hZOhbmZ6rCMaD6ZSZtUj1jGQvgWCmwqTs0/0X3bkF5A7if5QzhEagjW
 POCQ==
X-Gm-Message-State: APjAAAWBzE5oUIfhitWSxL/hi4rRmsGSs6LJXMG1IqYIFcplcJ5scPu8
 ugnHNX8VyJ4v+mxdoroAzOa+ig==
X-Google-Smtp-Source: APXvYqxxG9koOb2FwS7bDsvoQXD5LW7BhJWcinIR8CpAmlMsv235RnRXDMhri4HVBO1mTbSuwEB++w==
X-Received: by 2002:a24:6fc4:: with SMTP id x187mr8626527itb.122.1556911554423; 
 Fri, 03 May 2019 12:25:54 -0700 (PDT)
Received: from localhost (74-95-18-198-Albuquerque.hfc.comcastbusiness.net.
 [74.95.18.198])
 by smtp.gmail.com with ESMTPSA id o143sm1538223ito.18.2019.05.03.12.25.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 May 2019 12:25:53 -0700 (PDT)
Date: Fri, 3 May 2019 12:25:52 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: James Morse <james.morse@arm.com>
Subject: Re: [PATCH] edac: sifive: Add EDAC platform driver for SiFive SoCs
In-Reply-To: <4072c812-d3bf-9ad5-2b30-6b2a5060bb55@arm.com>
Message-ID: <alpine.DEB.2.21.9999.1905031206450.4777@viisi.sifive.com>
References: <1556795761-21630-1-git-send-email-yash.shah@sifive.com>
 <1556795761-21630-2-git-send-email-yash.shah@sifive.com>
 <4072c812-d3bf-9ad5-2b30-6b2a5060bb55@arm.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_122556_501216_A8615DA5 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: aou@eecs.berkeley.edu, paulmck@linux.ibm.com, gregkh@linuxfoundation.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>, bp@alien8.de,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, mchehab@kernel.org,
 davem@davemloft.net, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi James,

On Thu, 2 May 2019, James Morse wrote:

> Having an separately posted dependency like this is tricky, as this code can't be
> used/tested until the other bits are merged.

...

> Looks good to me. I think this patch should go with its two dependencies, I'm not sure why
> it got split off...

The split was due to my suggestion to Yash, I think.  The motivation was 
to decouple the L2 cache controller driver's journey upstream from the 
EDAC driver's upstream path.  The patches will go up via separate trees, 
so the idea was to avoid blocking the L2 cache controller driver on the 
EDAC driver review path.

Thanks for your review,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
