Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BB9C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 13:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8mCfuIIV1q53h+xiYMviopv3m2z/JRzQ/PqEjMmegs=; b=XNhIXr6yuKBsXI
	hU5M3crmJuM6bN0GStpn56uckVokrV69TtKbfQ3LAqBqpp/PpaSd1vZG2rAuoglQceGi/Ygz+QCHo
	4to3idzWgVuaXqT2+PBnHoA6uz5nAOhWz48IgHIYDOJHBDJvgd+prg9u/y8wkQDc78fEbxEca8fWN
	dQFkf85OdXlpt2sqnRtB1WIBrkwSTtJ32RGxZI1RlJYdyqNs0dOAZQ/nwQMGDOuox/YqtmYagGFFR
	8xW5JuziPRUDURVZi4Y/sl2OdQfFMGX776nII7eJQ9ikz4VzXal2yvlRby3H3RU7OrIZvKtUmdssC
	OY0aIIEYoFHzt0jtIcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT08w-00HKQb-2u;
	Mon, 07 Aug 2023 13:19:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT08u-00HKPe-0O
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 13:19:29 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9923833737eso622337666b.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691414364; x=1692019164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zJJrvD/G9JTxhkHQHH1bGUg27rSaJAiqqO5viUJTjQc=;
        b=OubUae7D5dFyrm+J+1BdPm0HxvypQANTVeNS01zzb0cZgE+sfyYY9wgtXLHTnNKebj
         HiTKnTsCd1LsISGObIZzSxRUXP/SapP955hm9kiP4TtOhXr6yDcryx+o5HwqClrlBK83
         ldcp5TqiNMLHoiskun8vvb/8Vx12rKIUTEa9tOLNNRnYZakHYoSvFg9zCyn67jkYk2Ta
         lacmrzynspZ8ZTkZg47TB2xRgMGuskAla0Q+EJV/pVJGSwb0KiVhlWSfxrXzrviejJxd
         Xda/I/2KZX53XxRydUQ6wWlmNXwPn+DAB3ULIpR64dry/Zhanqosa1d2Iie9To1oZQ/L
         QCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691414364; x=1692019164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJJrvD/G9JTxhkHQHH1bGUg27rSaJAiqqO5viUJTjQc=;
        b=dyrFmTLDQ7PPS6+Cm8LrpKtUpAUv9eFmVe9MU8T0d2ZznUxlMxo8nr/ZZSGVgsbRtU
         PKuKfs/fxHPNFYQGxZ4BbQDeCtJ1DVUTHZ/o8mnYah9pgZzqtyA/xqtluyQVz9oW8TNG
         BZGQtez3SeFp55Rvg6drkaVCfP///lO5SjxpPkiejuSxVNoNua4+d4IcUz2CgSS7MQRB
         muDFvM9AeJkzaR+Trlnp/J9RZUu+TmlkOsosxPvYDUZJ+IKOaGNwXGbWVK7KZ8pJSMIS
         eB92H+/pP7cm07KGO3Q7jXnPWEGJ+TFLBwm6eqQWFZztY4G1CzhP9W7Vsn8hcPkKNBbx
         GUaw==
X-Gm-Message-State: AOJu0YwLfDe4NlMNaESbMgfuv7zviIxNNjjBSOSgS/T7CWpWMOIj1s3V
	pNM5FfrrWhavX7encwbA0ms=
X-Google-Smtp-Source: AGHT+IGexcOw9OTpTSxtU/vNVu0HkNeyOnSx4BEJl7C/iVOA+SPKFlbwi0l/WdKJIbM6+humbhvVPQ==
X-Received: by 2002:a17:906:538b:b0:974:771e:6bf0 with SMTP id g11-20020a170906538b00b00974771e6bf0mr7141044ejo.56.1691414363798;
        Mon, 07 Aug 2023 06:19:23 -0700 (PDT)
Received: from andrea (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id bt20-20020a170906b15400b009929ab17be0sm5152584ejb.162.2023.08.07.06.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 06:19:23 -0700 (PDT)
Date: Mon, 7 Aug 2023 15:19:18 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Message-ID: <ZNDvVlbubtOoto0p@andrea>
References: <20230803040111.5101-1-parri.andrea@gmail.com>
 <ZMvLoI6PxLR8RJvR@andrea>
 <4bf79f06-4593-134a-04dd-b8f89e96a1b8@efficios.com>
 <ZMxDe0gXKYbY5jgt@andrea>
 <65350c17-3fcf-a057-a280-f6a5d36dcb21@efficios.com>
 <ZM0STfpkRSfNQBt8@andrea>
 <ab562167-e4a5-4a7d-7722-a4f99848d63e@efficios.com>
 <ZM1OhJY8/PZ/osTH@andrea>
 <e17900b8-ad20-e5c1-2443-0f9559f1fdb8@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e17900b8-ad20-e5c1-2443-0f9559f1fdb8@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_061928_159017_4587772F 
X-CRM114-Status: UNSURE (   7.29  )
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

> One more noteworthy detail: if a system call similar to ARM cacheflush(2) is implemented for
> RISC-V, perhaps an iovec ABI (similar to readv(2)/writev(2)) would be relevant to handle
> batching of cache flushing when address ranges are not contiguous. Maybe with a new name
> like "cacheflushv(2)", so eventually other architectures could implement it as well ?

I believe that's a sensible idea.  But the RISC-V maintainers can provide
a more reliable feedback.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
