Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C0AC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDC3qEVLm0CNs6riav61eXuOvJQax47OBkwWOdn6crI=; b=TecuQf02nZ2wkA
	WTG/r8GBAF/6C5qCsYTnLcItrUDZiVlB1QKzdVOzWNpZ5wAGtqBn3lNHUBV8YSDpgeyP5jh9TsqYf
	+9DjTlu6CsteksmpjafrObdEV5nQdGFXPSRD9dZJ/Dt1lsPBYg+sSZc4u3N1egE0/kkfoZ/YPT3NS
	RvhqMonuTZNytquYK/1IPPvLiyRnPcdtCPCLS4oe88ngjgXgjGlum6aSrMAT6Vs2rMxaiSil+LnoH
	Eyh9Cc6PkpzYJ9nzz6zr+M22ctYos2ClzAxw6vybVqj9jrjwD2fc+2gwnOufPUhVCjbsFxGdK6qke
	7+X3qcx8T6YfjU1jcEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4r3-00000003dEL-2mHm;
	Fri, 16 Feb 2024 20:30:41 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4r0-00000003dC1-29dh
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 20:30:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a3e05775ab9so56311666b.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 12:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708115427; x=1708720227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pH0qD4eQ9yoqb3qmhmjfrX0mmcBGSF4Iayx1D/NOKIE=;
        b=jq3SIUItUSjvXS4bpdg8a6ZsMSwsYDYd6q9q87/D5uPBTz9EIPu9AcEaioonwxjHkx
         ezBhha8kZ79XT+hq6PYKR0ObQUaX13QiaVj4xd681SXQJ8SU0jqMuSr0Vwtt+O4h3wCM
         J56WX/pZSCfZIi63YD52E3LUr2XksZhdkC8kYu+ksh3WubkJob50HBT9aQYEEbbfSfpc
         2XLkdOQrgoSbtCmDPyOKACCtlwc3si3XKpg8PZrwiclN6KLUkdKm9lIdOvjX46c7G9Fz
         W9WAWQynvwTijvSxq2u4Xw74n+1yePj/5Aq2MlcO0eqDbjCXJezge6EhSCQjDSDcgNj0
         Y31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708115427; x=1708720227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH0qD4eQ9yoqb3qmhmjfrX0mmcBGSF4Iayx1D/NOKIE=;
        b=feM3FWFj4lZ44CmP5juilwn9n1K208dmiOTTdxwVD3uifGw/I+mz+8dXklNbjApymR
         unJHEXuQ61GLC3Hr3jIRg4QwNw5zM25RAxGN3ZpGn5xhLDp0/RU0pr2Rhih34j9ksLHV
         TwH1EXIf6MXdHln7QAfdFnFoyg0C6JSGBsrVtZneuJE4XTOdcjKKGimQhlmewbz7+dE1
         TeZrOZC5A0Td3U385bm6f5zPDuhC69wdCO+y9rF4ABsgYkGyzK3h84yur1Hv+4cx0s/p
         U6hjhuN+PZIzG1PdX6RxyTyV9Sly7W7i3wFYR+zLiBwH89drIv6Sw4lX5NdZn0QTJjyr
         C6iw==
X-Forwarded-Encrypted: i=1; AJvYcCXs6/hZK08o1nQnhIcu5P7sR1ptVCzpaCIbdfrADCgWhLYqA+RUsuSA9CLG0mQVpgds/ZrPxhvOev0vrU3ZqAkV6D0MJfswuUYQeaXFda4X
X-Gm-Message-State: AOJu0YxYIIJWP9khD/2nQ9HrRTVTj62U8P0fCAHKVUYrYnCXfUiLpGCN
	a8AEEKe8HssLvSeTqVQ3qHMllHlE64V2MdTuk1zbY5GzbrroOeVV
X-Google-Smtp-Source: AGHT+IGcDan+MHupoKMtiTLo/p8jVQOdKLMDi8rbZuJ5C8LLozz5mEsLJNFCMX0JHRFnVvXKEDV3eA==
X-Received: by 2002:a17:907:382:b0:a3d:841e:3d75 with SMTP id ss2-20020a170907038200b00a3d841e3d75mr4032285ejb.61.1708115427233;
        Fri, 16 Feb 2024 12:30:27 -0800 (PST)
Received: from andrea ([31.189.39.37])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170907188800b00a3dd52e758bsm312334ejc.100.2024.02.16.12.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:30:26 -0800 (PST)
Date: Fri, 16 Feb 2024 21:30:22 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Eric Chan <ericchancf@google.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] riscv/barrier: Define __{mb,rmb,wmb}
Message-ID: <Zc/F3qB8I+AaN9Wr@andrea>
References: <20240213223810.2595804-1-ericchancf@google.com>
 <20240213223909.2596587-1-ericchancf@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213223909.2596587-1-ericchancf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_123038_600876_182E7BBD 
X-CRM114-Status: UNSURE (   8.25  )
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

On Tue, Feb 13, 2024 at 10:39:09PM +0000, Eric Chan wrote:
> Introduce __{mb,rmb,wmb}, and rely on the generic definitions for
> {mb,rmb,wmb}. Although KCSAN is not yet support, it can be made more

                                        supported, the code/definitions


> -#define mb()		RISCV_FENCE(iorw,iorw)
> -#define rmb()		RISCV_FENCE(ir,ir)
> -#define wmb()		RISCV_FENCE(ow,ow)
> +#define __mb()		RISCV_FENCE(iorw,iorw)
> +#define __rmb()		RISCV_FENCE(ir,ir)
> +#define __wmb()		RISCV_FENCE(ow,ow)

It seems you forgot to apply Emil's suggestion from v3; please do in v6.
(No need to do something immediately, still reviewing this version.  ;))

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
