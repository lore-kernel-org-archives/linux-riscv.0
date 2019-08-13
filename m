Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D79C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 19:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C21D3206C2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 19:45:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qGyxhs25";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UDqOhAUm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C21D3206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZkLXPuxkye9bhgZgXnYNk+4OSTTqDZf3yCkq5BjVko=; b=qGyxhs25bf8cTm
	j74qm4gK6USVmJFlI5mJxYir4kfw4cqU8w9Vrkg61MnH7rmIQ1w/SD1X9TY5Ad//v5S8rg+hQoAVq
	eqLgspXHC+Qp64+j92SN0nNwF9mba8pCR+9tQ8uKeS0ADdNTbDc76sHykL+03fOc+EVJa7n2G41oT
	F28E3oJbJBuqmkbDS7OVjK3mAGoJ9BYFUYEk8SVIX7d0Q3V4XWXMXVvGx+WICqH77dAXXh77/PTRK
	dU3EgOLQdbhCnWGjd88QvYUZist33JB0bzKnxd7W5I8MTHI9BikI27k74jPHven7IndlgXLHcwGt4
	rPRPYOgGi7iUKNK7TmbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxcj4-00083r-Nw; Tue, 13 Aug 2019 19:44:58 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxcj1-00083B-JM
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 19:44:57 +0000
Received: by mail-ot1-x344.google.com with SMTP id r20so26983271ota.5
 for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2019 12:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=p47PwVKoksn0liVhm7v0oQg8NrkOxD3xJNcrZ+nyPlg=;
 b=UDqOhAUmWsxhoXM3Ktz/M2KjSMsXOPr0TRyb4J+cn/J1ZPkk2nsiybN6VB6dlTy1Qu
 xlPw+1EubYnnOLk1q0TQiQccVFFTn6lbqGXV0y5z2j6CekxQ8BU4zlYO2vJX51Qfiq9B
 D4XH8+udwtohWS2Pb8UtAWfjji2kY4RhbmVXWL63P+zKi8UDf6EZ2JLlZAFoRMPm9Gfo
 YwzXzQjWpBhY6FY59sgL4lr//33Xb10M3fqmob6QGSk5n08L4RC89BYe/9wySsxYE2ft
 BhMYjioMirs0KltnAjrKfXgPZco2vRqzGlrvwj8ZqxdYEqL5dIVVOtg/uiexfIXYaO54
 hQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=p47PwVKoksn0liVhm7v0oQg8NrkOxD3xJNcrZ+nyPlg=;
 b=rskbY7qxDJGskD4M5NtCYbQKuv32RwXBF1QMBbFJX9zbZtc9TEPpHIjTDqosky5Z4X
 2FjfZDBOnSLqGTL3ahkw1IaXk4IAaFyey/mfcKcsWKi4FiIjTNE84z0CUt8VUMT1ZB3i
 vkNKKi8iPhQkJiHoLj5hTQ7vCjygVE/N0lu7FYrrRyocuvvl0BP8KIMjvuYZgfLdd3wV
 Lnqv8KlfvQj1+5zAuP5ZzFtOrbx6KlNsaUMe5qMs51+duUmnYvNJoEf8URopb2QlNpQP
 yiwOVLrr2WSbcaAaSdpopo5vaiAWwLSgkryglPkjyqmGXarkdKl8rZa7ZaBC8rN3fHp8
 KqfQ==
X-Gm-Message-State: APjAAAXnVipuHMmRELbDYorZjR48QuT9jVM34iFDnZQOVD28gniJbNpi
 wSWmuTF5rpA9D8a2tAkHoCruSqARDAk=
X-Google-Smtp-Source: APXvYqwRLyo8ghmNRoiDA4+UL1VIuVeDBkLpXRbHFQqqPUEL0Ay/P830JUbmn+iLP9nQwqUH74Yabg==
X-Received: by 2002:a6b:fb09:: with SMTP id h9mr22018379iog.15.1565725493314; 
 Tue, 13 Aug 2019 12:44:53 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 r20sm15192013ioj.32.2019.08.13.12.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 12:44:52 -0700 (PDT)
Date: Tue, 13 Aug 2019 12:44:52 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/15] riscv: use CSR_SATP instead of the legacy sptbr
 name in switch_mm
In-Reply-To: <20190813154747.24256-3-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908131244130.5033@viisi.sifive.com>
References: <20190813154747.24256-1-hch@lst.de>
 <20190813154747.24256-3-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_124455_703212_36361CC5 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 13 Aug 2019, Christoph Hellwig wrote:

> Switch to our own constant for the satp register instead of using
> the old name from a legacy version of the privileged spec.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Dropping this one in favor of Bin Meng's patch per 

https://lore.kernel.org/linux-riscv/20190807151316.GB16432@infradead.org/


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
