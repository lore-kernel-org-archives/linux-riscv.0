Return-Path: <SRS0=AVqF=2S=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26793C2D0C8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 28 Dec 2019 06:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9A420722
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 28 Dec 2019 06:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWqNn40g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mWj/glpF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA9A420722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UHnltpIdmtv99s8Ay3j5EvPeMK+kCV0IwYbjU8qa/BQ=; b=gWqNn40g1k/t5BDWp92ACfDv4
	/b1k26i2e6Us289eLTm10YqoP72RSNOUjhyVJb4ZhMq9E930Y3kNh+V4p6NAYNaPoAUKCL8WOUSyU
	TrLh2iHhOoiMC1hD5vKNUFDN9t98Pg4h6YsD8TtoXo5GSZx/NtAzRqX1lqwuGMSMgTm4v0Da5JzU6
	T9Csz1pJc+jmY9Cutkna+XjoZfcEesEs/VGLvWljhnN6PjxBdVO6NWAud6iZYadh4aeTG0WZjaJ3W
	AZ9PxKNFc5YWGHq9/KX6tkoJEWfmPkUHjGIwWnsQazsoJFM5ifdswK2FDu1INO43cVc46VWaFHE5o
	i+NgZDSAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1il5Cx-0006Gx-6h; Sat, 28 Dec 2019 06:04:15 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1il5Cu-0006Ge-AI
 for linux-riscv@lists.infradead.org; Sat, 28 Dec 2019 06:04:13 +0000
Received: by mail-pj1-x1042.google.com with SMTP id t101so5826711pjb.4
 for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2019 22:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=UHnltpIdmtv99s8Ay3j5EvPeMK+kCV0IwYbjU8qa/BQ=;
 b=mWj/glpFDtAIfwZhhH4CK7iwQXoEUeQIBvq1iA4O1i5vo+04DOIUBSgRBaiXgQhRTE
 sdDT/PcTaE8AiqfD1g3/vvenTg7pK6PphT4jQwBVPge0EJdmtQFNyhM1dxvH5CZZXv4n
 eX4z8hnFHDb8TQhYAXM4JJ98D7nm5Ve0OAafk728w7BWmECRTFgsvx/nsVyfC/QwAYpL
 7LuDtMllYUP9Ym8+JOrpIDVu4V+cCKRU39l8p2J/vAlJh6dfhcnt/422G8Bl2nWfv7IY
 4WQKd1i7AdxedKDZCdCWkZ14Ad9/3Tlp4a6LSqBPYIe9BWVkVKULOZqUYBHqCrbqIV89
 MCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=UHnltpIdmtv99s8Ay3j5EvPeMK+kCV0IwYbjU8qa/BQ=;
 b=j72FEFMChiJI53EF8sdsBniedzmZCaH+LOJ9OYgvnXwHLPAF6yumw4aa6Vd8lu4j4+
 5fBg37mG37WombwDFiv7Q3IePXl+X82xzkvwuzGMsP1TQARwhJ/kwGRl0WRZOCUdR3ss
 +gToLaiIil/HVworPWhAfssXLRTcP+uE7wJQfLvTJlmXPj4uXuJTfUHxOa5SeXTHt63d
 tKrC0Ow1UJoU47J9n/YvX13Qi03I2UuukiP0IgnGNLWK6WdlPOgIWWzBjfT7l6gcNNwL
 F5BZIxD3oJNQyybZiYAHk+IXxT8EC/sn3QPAYLwRkZqigakdXzKmRF7+H+jxiPx4c4py
 xpFw==
X-Gm-Message-State: APjAAAU5Cu5atuQPMMJYd1pP3Fgp9rUZ5KjXQz85o5WCofjlsb2rXaUl
 pXEbyP9bdg14Tc+vp+YyGQd2Ow==
X-Google-Smtp-Source: APXvYqyWdnS9g1IihQlcQOZcv/w+7ACgjVAzwEUEpt8ur/ux93P509B9aen4dTfZpQXXBoiFQA6v6w==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr30393735pjq.81.1577513051649; 
 Fri, 27 Dec 2019 22:04:11 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id q15sm39582730pgi.55.2019.12.27.22.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2019 22:04:10 -0800 (PST)
Date: Fri, 27 Dec 2019 22:04:09 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH] riscv: fix compile failure with EXPORT_SYMBOL() & !MMU
In-Reply-To: <20191222092604.92217-1-luc.vanoostenryck@gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1912272203260.194339@viisi.sifive.com>
References: <20191222092604.92217-1-luc.vanoostenryck@gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_220412_358140_B659D7BA 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
 kbuild test robot <lkp@intel.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 22 Dec 2019, Luc Van Oostenryck wrote:

> When support for !MMU was added, the declaration of
> __asm_copy_to_user() & __asm_copy_from_user() were #ifdefed
> out hence their EXPORT_SYMBOL() give an error message like:
>   .../riscv_ksyms.c:13:15: error: '__asm_copy_to_user' undeclared here
>   .../riscv_ksyms.c:14:15: error: '__asm_copy_from_user' undeclared here
> 
> Since these symbols are not defined with !MMU it's wrong to export them.
> Same for __clear_user() (even though this one is also declared in
> include/asm-generic/uaccess.h and thus doesn't give an error message).
> 
> Fix this by doing the EXPORT_SYMBOL() directly where these symbols
> are defined: inside lib/uaccess.S itself.
> 
> Fixes 6bd33e1ece528f67646db33bf97406b747dafda0
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Thanks Luc; queued for v5.5-rc.


- Paul

