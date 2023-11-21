Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AB2C61D90
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pqc28jdVODg7blCt5k76FnnlvKpaY+fQC3wM5trITLA=; b=LGfEkcDAnhVKym
	YFbeas5JCvdb6txk0JO3TQzTuXfNnyjnMBpobVgTmiQ2EDCjq8ravIG0OAxH0p99dIPm+HsVj2EWN
	EREAlgdEa8C0vedfjMrK81sgJmOThWNWKrnixsnfkSIX81ZpKoe5O4oWxES2P6bklfDpeWFcgzKd4
	+taVhM7IrBk8X6o/XuYaoBYC7b1YdSSgtbWx+Q+RkaFEe0Xt7iSdLMu+E4llMxdyKOX8UC8AmASHN
	rtIfxha/XnPYXi4XQ+dFxhNYikFff5CU8QEe5N0g9ocxtFVlRl3/wQRI0J+O3F/06CkiXzJPiZemz
	NUPiWRuENHhqESYEoCLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YOO-0007fU-2x;
	Tue, 21 Nov 2023 21:34:48 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YOM-0007eo-2p
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 21:34:48 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-357ccaf982eso19498365ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 13:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700602482; x=1701207282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcSKcdxnUfKBu2d5/g+3TbLVP4zLtrrfABbMZ6ds6hs=;
        b=IyAA3fz7HXiRtogerK1EUB5IVei1ZcnDeh3p5w0oHUZn32qud5qGAjD/iT15DB4ENu
         lSQyq60p8jsV6DAeLxTUrIumqWX63hMkgUpA6oqdhGiudCsvUNSU9h2HEGWuZLuj9ecN
         r2CTWKyT02AlNAvkYnfW/WTNu6uSrpjln2QSJ9u61b+fZl6sYKqPH7hwE1WxIOM3pKzy
         hpm94/Qf+8DlAmNQ01eaSAOgL0oJEB07SLhML+nhMAjmNlOV35JHfBw3MiH/s4DkrXer
         qicfaOl2GSYYRhD1+CHgiDrj6dqcRsJfbVxGscaGQuf2h92Hn2gq0vs0AHzseGtQ6KOo
         gFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700602482; x=1701207282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcSKcdxnUfKBu2d5/g+3TbLVP4zLtrrfABbMZ6ds6hs=;
        b=IfnN5o9jWt+gHoRWszJRla3bI2Rm15CWUnbq4l6euIn+qJN1CQ3kG+IQ6ThigsiGTv
         MP+JS9XFNnVscn53e6PTcR8Y1gYd7MY0WrJYehbuz/wfg1SguvoMGMLBWwG7BdQYT0d3
         HAbXLLEGBgcIZyZNAB6n9r3IkaVO6WKNBkV1mkM9TYXOLGYeQciDOJLZK+A5K21CLjk4
         W4Q5FUpZhv8j7nN0NxZdySZnY7pOP8QHkAyVPvMVC79Wnhcv0OTfjEid/Nk9fmwtcLBH
         Covl0iUJD6/WqquDPJiBJb5GwfutjQH2OAzYTn8+Lh6esU8jJWYX+9sw+Frt+LJsYfV+
         8f3A==
X-Gm-Message-State: AOJu0YwXlFZXzozbofsUC/+75L9XvmaLP7Uxd0f4BMUmZEdjK+wjFNaa
	t3d/bdW8hFTdmC99EAaOPiTLZA==
X-Google-Smtp-Source: AGHT+IGyy2hqdVq+PwIZK0YElPHj6ujvJ1KtZRpYE0Xkab/Kl3wLymNCeMm88RO6rlGDt69JhGf9zA==
X-Received: by 2002:a92:d7c3:0:b0:359:d2ed:15f4 with SMTP id g3-20020a92d7c3000000b00359d2ed15f4mr266401ilq.8.1700602482651;
        Tue, 21 Nov 2023 13:34:42 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:9465:402f:4b0a:1116? ([2605:a601:adae:4500:9465:402f:4b0a:1116])
        by smtp.gmail.com with ESMTPSA id cn16-20020a056e02389000b00359c464b632sm3413438ilb.52.2023.11.21.13.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 13:34:42 -0800 (PST)
Message-ID: <28d68897-14e4-4dd2-941f-2352d1313fa7@sifive.com>
Date: Tue, 21 Nov 2023 15:34:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: implement pgprot_nx
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231121160637.3856-1-jszhang@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231121160637.3856-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_133446_912491_6DB2EF9B 
X-CRM114-Status: UNSURE (   7.12  )
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

On 2023-11-21 10:06 AM, Jisheng Zhang wrote:
> commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
> executable") enforces the W^X protection by not allowing remapping
> existing pages as executable. Add riscv bits so that riscv can benefit
> the same protection.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
