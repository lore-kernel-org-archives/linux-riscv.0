Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BC3C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 21:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50774206C1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 21:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5lWIYWy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KTG55VPp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50774206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zZDOT4eaGrQsMgtyy3cNOKu7Td+btRNQuGjWZvjb/po=; b=c5lWIYWyzTTrheRtpTC4DGFlR
	a4B1lvMmKkId43/exGSdhOx/fDCNfMzQ00DMZsf8Uo4ZiYi8j7+vJQN6c0o0+7bCwOd2gd5byHePh
	vWqwBNb6xq5G0MBQqury/g9IsLNjIXnGptrQ3mkDZvejUU8Tj+sOFpKJWHA/0h0zGcF06/H/4kDNb
	/Yt5YXwFiUaCkhP9sugSD5BznfXUDddSu7Dk+TJ3NqBK7fsl/OVVgUeW6B07e3q2+z9a/o72STrCo
	eArfxsrnwsv6kKmEvdIOibJMwBxzsXT8hfLvlF0HDbXqXaf1b9QR1rIUDTxkQO8jmftjwlBIZBa81
	wJ4QzA73g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJmNg-0000IE-7z; Thu, 25 Apr 2019 21:58:12 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJmNd-0000Hr-5m
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 21:58:10 +0000
Received: by mail-pf1-x443.google.com with SMTP id g3so594326pfi.4
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 14:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9iuNAvqoIPls3GEhgMpIW2t7NQxDowZNuThKPTYnUqY=;
 b=KTG55VPpJulqMoRzwGtOcKWWwbkFcWgTGoJlWso0BeoQFiEU3vBRZoL0LSxH8GPPYL
 uEqcggnUYMtITsWSwaCFUmFVvBk8/ejka5YAFpojX0Ogx6qGYco71QM3Ry05rWmiy4QQ
 srQXA0sCkBsC/ZlMHafQbfW2itGjtyqm9o42oFK3NB0n5CQwDWi9Pr5ZkQgB9UaweiQ7
 aOGEgOrl8gp9qLIM+17YGcC0kQYKlMm2vkBvB7HQJ3oiHAFe66Qqs43L4MY+xPBXY9cx
 CSyFTEiIhjWHoWrPsvnu2cSKmW3c75sRzcUX5HNiHuWwySvctGXWG7AwCG6MJi+1Uwj7
 wopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9iuNAvqoIPls3GEhgMpIW2t7NQxDowZNuThKPTYnUqY=;
 b=LUMrT63z9my1ce/PbWg9qzB5i8v0tL/1O+mx6RbxfiIkIYNuBIWQfBqfJuStjONooG
 RoJoih2Pyk/VUco6hSKrOZRE0gJFMG9rWc1N1F0wBRbJPTqrs2jt54M+YM8Mb2npcgWx
 b3IZi0m1LE8d7haXkQNS21c9yuARHmnla0UB2cWgRboRGpkQIFo7Rs9a3Gr5Js/qhLIf
 wBPYRs7Qtd34Z6Og0XDC4MhdvNZQkIhPZ3omrP6SINcezDkzFbCRbNVOHVatc1C+X/b5
 XlzwzSH1v0zZ5kSDP5JTJv12FMpVRyOx2BUJuvwDR7vdTEGWJbnv6jU/wDQQhlT5XLKx
 Tscw==
X-Gm-Message-State: APjAAAWUWB1PmkAywJ9+8+GJ/Pn+jzBrcN+dvCHOh7c04rPmfUhD1ers
 w3gwJT4RqtaHQ5A4G17imR5qvmck7rI=
X-Google-Smtp-Source: APXvYqwbUhtPb2IwCweFRxEDw4lyWwQ5GoI4bTrrEkHG1KF5i0vAxu0QMXWZe/FQGbYbn+T4pxKclw==
X-Received: by 2002:a65:5046:: with SMTP id k6mr5891764pgo.325.1556229486968; 
 Thu, 25 Apr 2019 14:58:06 -0700 (PDT)
Received: from localhost ([134.134.139.92])
 by smtp.gmail.com with ESMTPSA id h65sm73702658pfd.108.2019.04.25.14.58.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 14:58:06 -0700 (PDT)
Date: Thu, 25 Apr 2019 14:58:06 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 14:57:05 PDT (-0700)
Subject: Re: misc cleanups v3
In-Reply-To: <20190423082328.GA14788@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-333f8912-2df4-47fb-8a39-b01833c03faa@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_145809_248932_D2E8F827 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: mick@ics.forth.gr, atish.patra@wdc.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Thanks.  The all look good to me, I just dropped them on for-next.

On Tue, 23 Apr 2019 01:23:28 PDT (-0700), Christoph Hellwig wrote:
> Any comments on the remaining patches?
>
> On Mon, Apr 15, 2019 at 11:14:31AM +0200, Christoph Hellwig wrote:
>> Hi Palmer,
>>
>> below is a number of small cleanups and improvements that started
>> piling up during work to support the RISC-V kernel in nommu port.
>> While that port isn't quite ready yet these patches should be useful
>> on their own.
>>
>> Changes since v2:
>>  - drop the patch to remove the non-framepointer code, it turns out
>>    CONFIG_FRAME_POINTER can be turned off on RISC-V after all..
>> Changes since v1:
>>  - fix up a few patch descriptions
>>  - fix the interrupt cause patch to actually compile without further
>>    prep patches, doh!
>>  - remove dead code related to non-framepointer builds
>>  - remove another big endian ifdef
>>  - add another patch from my nommu stack to clean up the parse_dtb
>>    calling conventions
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> ---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
