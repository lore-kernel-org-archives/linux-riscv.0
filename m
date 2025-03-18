Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E99C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/eZtrLEohz1qqA0k8/1r0BannBLPczEtgxbqQzQYzc=; b=c2OgsHQjThyTSj
	mNaGkC20Atn2DTtv0DEnBNFrKeV8vgjt8hRRC5IkCD4jsRy0FUAccU5L135i8nSi7VRPjrZ8GPnHV
	DAbJcy2jXqyJstog7odK0jDXezZn9svLPr30k4re4z+z1cE85Lt1mZzWpHRhWIplPPaA+yX0XTS/T
	TMx7iHSnaEwa+/00ZCJ7V+46CUl/q++h/VbFeC1u/7r7Uyi+8R+i8lAldKgPyIz2fsEA/MllQIISN
	PCq+/E6BBIw2CABnH4PFGZNyrOWa7Xzv3+LAFZbmWQBfqdOuRrErD2bVyl5ttOj7i9qBeJA4drd1m
	DShQcCkmS4iXColSRuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVtf-00000005rUv-1IMe;
	Tue, 18 Mar 2025 12:18:15 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVqN-00000005qo0-0cnA
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 12:14:52 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6ff37565232so45292037b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742300089; x=1742904889; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1/y8nwDFP5hJBBvbUUG0QfBtnCqzgdSuPLHojeq2gsc=;
        b=iGv95z5Tzw0picnVjUDiUEd8t9oDcPr7Kn5fnSHZDwyyIFLWVqSV4tSh8D5ISwA763
         FiCxQeoDSDO+tuLn3m6ZdC725WLKRS5UjOYlpP5wJdxxZUID/B33YwvFifDQNIFd0ydG
         I5aP7reKjpxpmoM/+eaZQyfPgll+gaIGj5RNBAi/yFGCUhq1KZZMiAUisOzyMruJO5FM
         BHuuSoloa4qBDcS9vnqiXczd60dnqcGrTd0Zx+QtghGp6ZZcPF1TtjKEU/m6l4bUiYYn
         ZIXvBS+G923sK8jREGAfvbvys3qh1901i801tyJEWtAirZfR9H3be5fgSNkjBQrxjqUc
         jUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300089; x=1742904889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/y8nwDFP5hJBBvbUUG0QfBtnCqzgdSuPLHojeq2gsc=;
        b=B7t0U7X0UPr4TaLNYYqBVIw0Dfn4cmPdXLGTDgYfIrx5I/G/qkGTb52GaY4LjiLVg1
         if0k/ldCdePGG67r+ymxlXdP0drQBKyNgx488vwAJI83wSe2eE0ftKjDp7dch/keLjqz
         S2mcXllBNtoFrsAQJwNOO1PBAn61rxB29QD3nPfeFO1VSRWDblzpx5Hr+easkKiXOtnX
         eaPbC4xN9iG8DDiK6jcki+eSAvpJx4oJ4tPDVeL1rII3ItY6jQCabgFqY8chCIrGdB8C
         BfJUP8RlinRP3v9mNrvACn39HeBP75z+fLMOmguTKQ6xUv4sc3rVcMNEB0hCG1hZCuRB
         tyuw==
X-Forwarded-Encrypted: i=1; AJvYcCUVBCpol9/orfA0mGazQJP3TLWL02tz2SBd2ZDKHY6yWmlev/tUD3ctpJT0FBClCmF5caxZnbsNKTbeIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7V5921XsGC3qCMRIgwFHJGzvMfQyoWUphDLl39kYss6uqkEMb
	5Q9sm4XkPi4OdF2jF60bfqON4mI/S2M4RtP2IBbK0mdUaWhRu6qYLtsjz77T5cA78YsVxI+2QYT
	2y9rNAgVsmOobFMzjnoOSnDxF4umParFCUug8Rg==
X-Gm-Gg: ASbGncvh1tudiv8ut5SeooIbWn/WWV7hwZGGRsTzTSn/iGuJs2sUwi1qysTdAsRXp7D
	ILTJhF/y+sSm1SqrN5PpWGXLCREopJ1fsTJJANkS+5f4TwkGARfStvCA+lodTIK8nYlNdy8aa7B
	6p42Wja08Nssz2ajbix8Gnh2rbLNY=
X-Google-Smtp-Source: AGHT+IEb+NzrbCeNRdPzm3xEMtkofIje/IsnUYw+kILlbfLc0DlZPY9+TQaCk80CJVoK/tOOND9xyncng+d5HjDNmyU=
X-Received: by 2002:a05:690c:6ac4:b0:6f6:7b02:2568 with SMTP id
 00721157ae682-6ff460529d9mr218205717b3.32.1742300089569; Tue, 18 Mar 2025
 05:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
In-Reply-To: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Mar 2025 13:14:13 +0100
X-Gm-Features: AQ5f1JqEJzBTaaSWFDJFRns2Qyn4YifFIkvKDJuCkDwbsG7HAzOkL1ON5MzrQiw
Message-ID: <CAPDyKFo8hyTJHZVLTAVXe2EW4FCPPLm39WWwpjOCqzUQnfNJ3Q@mail.gmail.com>
Subject: Re: [PATCH next] firmware: thead,th1520-aon: Fix use after free in th1520_aon_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_051451_205763_3273C28F 
X-CRM114-Status: GOOD (  14.95  )
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

On Sat, 15 Mar 2025 at 11:04, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Record the error code before freeing "aon_chan" to avoid a
> use after free.
>
> Fixes: e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/firmware/thead,th1520-aon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/thead,th1520-aon.c b/drivers/firmware/thead,th1520-aon.c
> index 4416e9bbf854..38f812ac9920 100644
> --- a/drivers/firmware/thead,th1520-aon.c
> +++ b/drivers/firmware/thead,th1520-aon.c
> @@ -203,6 +203,7 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
>  {
>         struct th1520_aon_chan *aon_chan;
>         struct mbox_client *cl;
> +       int ret;
>
>         aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
>         if (!aon_chan)
> @@ -217,8 +218,9 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
>         aon_chan->ch = mbox_request_channel_byname(cl, "aon");
>         if (IS_ERR(aon_chan->ch)) {
>                 dev_err(dev, "Failed to request aon mbox chan\n");
> +               ret = PTR_ERR(aon_chan->ch);
>                 kfree(aon_chan);
> -               return ERR_CAST(aon_chan->ch);
> +               return ERR_PTR(ret);
>         }
>
>         mutex_init(&aon_chan->transaction_lock);
> --
> 2.47.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
