Return-Path: <SRS0=Dbhb=XM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71A4C4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 15:21:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD222171F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 15:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OpZPJq2B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NIs3zdhO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACD222171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6W+7VUTWR+HWqtBNJ2rxJ6rVoFlQtk7C2fE2iHGpncc=; b=OpZPJq2BpWSRtu
	mh68cesndIgZWmV0labycwvwgW8O6CBpEtmiDyk6eYqAdoCZvSlwGQkrpFvUUuoRn39UtG0AGrOuV
	YcJ25wBeO5UrmB6pF1Ydk2dPqd65YKUZQVbaPIrJF2ri/8GdMgoqffDsp26tsdd3wdSr3VLDckKKA
	Hn1OClNP77SOqgC7PEPLU5MNjSlNMTe0AgTxgtVQTp0VD+dVNulHP3F693FKM+XC2XmfajGePp7NW
	zFdhxJG0/8pTKIYJF42i8AX0pPX/WJ48CBXtJxXXjq/52djt/XLH0wHtj/2xZZzmsPj5pOE3J40Rx
	W7awvQgYRI4pTp0buu6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAFI2-000499-3g; Tue, 17 Sep 2019 15:21:14 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAFHy-00048m-Lm
 for linux-riscv@lists.infradead.org; Tue, 17 Sep 2019 15:21:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id b24so3667320wmj.5
 for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2019 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=OjulAGrUuGemM9gSZfSlGAauZMenX7YjWl3lxcSoow0=;
 b=NIs3zdhOCngBnuBHO1LbLej0XYA0fx3pJvBb5LAq9irsW8UeUktgNHXZMnDZxyaaOr
 2k+bvHUE/fHLZ7lf9Kul73T/QwVd+bmEflgxCK0SnHStHOhQnALmk8nuUmXyAzCWPul6
 tMU6PN1gvdxlyq/5hh21ijiyxq8ZglCxZeGrVjRnZhCGhY5VeaZ2hh7BtJOh1HISOtA8
 1CVnUwBkgaQ0rUpkQ3ZI8DTPHPTiJ4vJpGCsUBPhH185EKUvoa7BkmeUtt0yYJ9bTDs6
 u780dgRKf+UcHeceEUe9nq90hYS03wwSc0u8KF7NyWXCV7loB9k1CStMmQLhcJ1cU7zh
 34og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=OjulAGrUuGemM9gSZfSlGAauZMenX7YjWl3lxcSoow0=;
 b=OvuwRnCSuhZG2uvmtTG/rVIGxtmJMbARzW5YRKWB2qJf5xekOGAci4XjUh0ovPDkBU
 wcGNP6dJfe4sy7mMU/QjFN3jV4RLBeoTYbwEzEzdOmgON1W7yW+qJbyKiILFE4TUVa0e
 dN9NO91dPNLknXDyGSAIWDBoWzoYk+TCIP0SXZTMJZjH7U5gW2MuRxLaoecLXKI1YNZP
 UjX9wg78w7HwsAJ8EDHutMSZsZjpFXpbYrYqpn/fsOLTduVT2AxSH13FRSAW5ixy2vnk
 2XOw9iCwqiOVgrCk0jBoogGN6XaUMfKlSiZ0Dgx3vJ8ma70+sUWgTfIhKfpMLsWcHMQq
 ofgA==
X-Gm-Message-State: APjAAAXQQlhRo/FSFjYOZ/QK450xdeqcKvV7i7K7y0VaNQctIkmkvAXl
 YYyKcK0xc9qbD3YfwnU7d6JaBw==
X-Google-Smtp-Source: APXvYqwbUAYfuqjAyAa/Lkp2LToXiaq5d9pX178q4XtabOWrIVPxdsT1Xyr0gfOYq00MaiHPBKzAoA==
X-Received: by 2002:a1c:9988:: with SMTP id b130mr4310361wme.164.1568733668324; 
 Tue, 17 Sep 2019 08:21:08 -0700 (PDT)
Received: from localhost ([195.200.173.126])
 by smtp.gmail.com with ESMTPSA id v8sm3712084wra.79.2019.09.17.08.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 08:21:07 -0700 (PDT)
Date: Tue, 17 Sep 2019 08:21:06 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: Re: [PATCH] spi: sifive: check return value for
 platform_get_resource()
In-Reply-To: <alpine.DEB.2.21.9999.1909170709070.8198@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1909170820470.21451@viisi.sifive.com>
References: <20190917085627.4562-1-mail@aurabindo.in>
 <CAMz4kuJczzjTPSohQ=kbZ0Pr7U_9-hzXk-jPgKk79PENOM1-dA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1909170514130.11980@viisi.sifive.com>
 <ij_UksEXUomr_L7KQam02lHBryAppgwKDjG90VbVcRRUeXlKU8TAiBWc3aU8vt20Wvlwt_6NDgz5fuMSwwP1mm-1eP6GYWoR1Kbr0y0ElRk=@aurabindo.in>
 <alpine.DEB.2.21.9999.1909170709070.8198@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_082110_776308_8B70EB3D 
X-CRM114-Status: UNSURE (   5.14  )
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
Cc: Baolin Wang <baolin.wang@linaro.org>,
 "palmer@sifive.com" <palmer@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


I just recalled that YueHaibing already posted a patch to do this:

https://lore.kernel.org/linux-riscv/alpine.DEB.2.21.9999.1909041520130.13502@viisi.sifive.com/


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
