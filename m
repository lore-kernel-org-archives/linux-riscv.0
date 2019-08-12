Return-Path: <SRS0=eWHs=WI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE59C31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 23:32:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA2820665
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 23:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bj7SRWE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CA2820665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alPqZf04YX/1IbHlaEThXzi3AnhTpthqdSs8z0LTW4o=; b=Bj7SRWE45DEQwM
	Ixv/XnCHUglJa0nrM0zV9B4C5+eWO88tJCsO/KkZIoNIznUCjX0qBob6t3AXLE/O/8l7re4RGUTPj
	bgKXuQLfH3ZXeAioVlxnkJeCJhllbL4r804hC2yru4OQGIiSIzhY8fX7ce4smc8WK29428dctpunS
	AjmMTQcTUBvpXqIuIbk5AG5wR/gSCB8EZIloZfE/wlf2k9o7h5mb+ZZJ+EZfwnxQLHRWRQfK0NkBi
	Ou2M4o2sADvBN6RqByaJ/IbOHO+0+BqfgI8LED99l6DftgaJfn6DGBqdeKmFd8r38beujJE3xdYby
	ADGKetzUrs7syqC2ckmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxJo2-0005Zg-Gg; Mon, 12 Aug 2019 23:32:50 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxJnz-0005Yw-GI
 for linux-riscv@lists.infradead.org; Mon, 12 Aug 2019 23:32:48 +0000
Received: by mail-ot1-f68.google.com with SMTP id r20so15805314ota.5
 for <linux-riscv@lists.infradead.org>; Mon, 12 Aug 2019 16:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D0CFZ1Cw7EwOnNhmZTmtz0RRwtC+nMsalp8emT68oCM=;
 b=H6JkfYJDT102GzTBfJvVtqrKMERJ/FN+tOnGZVdIixIyaKd6VWye9lmisbNkKB0/w5
 2uorBpCvT2gY8v9ICGrCN074UKW9hVrGVqAHw3vIrchYqaQneNcJJ/l+BsxNBRuw0Z4g
 NYLMRgUo1gdwDf8606huNNyVsbHfjtUduhyFK66ChzthqJYMxEL2ZoMbT4b0DqNaLydb
 yUiuEwDmJgZ7Slcld8XK2zUworN8at74e/5QUfKY5HyF74X0GmoKCIWp/WcRP2Jsc5cO
 t0wzWdyHOisLIoNgVIbgWL5jlNTJtm6cQCK0EdxgLe0InMNwxflyNhJthk+6px/ilzMA
 LCpA==
X-Gm-Message-State: APjAAAXt0TfKVfVoLMeYxhQs9sB9cVG76QLd8z/k7w9XAkwqkszXHkUd
 l00j0RW5HCWmy06CQyaZbQ==
X-Google-Smtp-Source: APXvYqzuSKoAknR+BRDTeNHhcu7ZdP4VSOsBy/9nJOzGbVO3/DHRkj6QLFRtQKk6Nhe72OKs0FOuOQ==
X-Received: by 2002:a02:8663:: with SMTP id e90mr41002015jai.98.1565652763799; 
 Mon, 12 Aug 2019 16:32:43 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id d6sm22314934iod.17.2019.08.12.16.32.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 16:32:43 -0700 (PDT)
Date: Mon, 12 Aug 2019 17:32:42 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/3] macb: bindings doc: update sifive fu540-c000 binding
Message-ID: <20190812233242.GA21855@bogus>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_163247_543766_7515A50F 
X-CRM114-Status: UNSURE (   7.92  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 netdev@vger.kernel.org, palmer@sifive.com, ynezz@true.cz,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 19 Jul 2019 16:40:29 +0530, Yash Shah wrote:
> As per the discussion with Nicolas Ferre, rename the compatible property
> to a more appropriate and specific string.
> LINK: https://lkml.org/lkml/2019/7/17/200
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/net/macb.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
