Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17492C282DE
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Mar 2025 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+fbbWyJnmHXE2GpBfzBWC/GqOblXByToiWDtwTL+Fg=; b=fW2djdQHWvYAGo
	tSbr1z4a2hP6PnX5HBgNmK+4TycoSUbp4MGO34lFaTeIMGaSfK2FoMcylBMtyxXx9VSUkjOU3SE2O
	/HZ/qa2fIl3eUyUUrjcZhir98b9jo3ErPF8o2FjOyWecODhgU2cNvZlFrRoHhwK5CaL81aVZ7sqXy
	eRzr5C1Lv3oWliBrSUIKYGldz8x9qzcDDLRrS/j3Bh4y3R2UGWb2PGlNwJGYGQDnYHR3C6uNX04pB
	u+vRr8MbfiUZWQNPV6GB/FXOm1MJ3H9pqpRgCwK/lW/jbQv57UsFVnFLsLw+OY4DGkvPpm16SLG1e
	8VgjP+aMdizaHX5Iv5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttorO-00000000GJh-3dJS;
	Sun, 16 Mar 2025 14:21:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttorM-00000000GJN-1Whn
	for linux-riscv@lists.infradead.org;
	Sun, 16 Mar 2025 14:21:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so13463325e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 16 Mar 2025 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742134858; x=1742739658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JUBU31zWgTKBtgMae2gOeiKWDb462tD5YrmtMJoO2xs=;
        b=HtWK2HEZF+gbL5VEyK7ySk6KgzttTVMlntP4HwOc1/KppLReMX4PaD2erBpbiAJsuU
         DazYcxdqYh5HYPLF+eLzUqFRR6WeCKir7VDA+vqhKlt/EXKCT16a71xphM/ahMyX7kf0
         XE/rIuv4+/LVHAZYfZlsZkbPXJP25X+jq7PFb6kedcoiziIXYudFMLtl6nraVEROL2bT
         2JQjs5zhMliBhIi+7XnfxmFLhHuTazF9LLZso1/T1wsxmdpOXY2YSsKFigWNCheVWeE0
         zkoyezJB/6sXmQNCd1EniwinYb9o7GktmxwZfQ7fR2gJw5corgHa182TZp+4amwoCWzz
         g+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742134858; x=1742739658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUBU31zWgTKBtgMae2gOeiKWDb462tD5YrmtMJoO2xs=;
        b=UAmlo8Vbdfn9nx4oufAOzIfF6D60MuvnJYCwSPkWm0KIsjJtpR+/v0nPVbrWeDAyZ1
         OPuWgHawB2H8xUbqk3Cc6qt2jKqXFsZmyFiWRwj0dEqsRpePygS70Kxib8LUgZgGljue
         9RcvqfvmVlRJkh50cM2vHryljRO9qFNesca334ncK/VqmgpOsT5csTd8jkijmvitUpAf
         m53JwBjhDScL8YRinea6oCcdVuutYkGq1LmawDF/tumFkIILX3QF/Ay8NDpf/o5w21yF
         NppNGZlyLMH1gnW20nnJOUYFZw4bFXK2S0bM/eACdTQ+v5nwm8eJQTL+hn9KNUALkSHL
         sIGw==
X-Gm-Message-State: AOJu0YwTlJnSUrQqaajqtVHrT9nJtlkKVWsXtK5RB9Yw3rywHwlfSF/w
	TsRCAREwnfZFeRdY9dk3wVcj01LVl8C4XuuhVY1tqz0lFtbU/dZg83UG8ETCbLE=
X-Gm-Gg: ASbGnctM56L+t6rKLkSrbMeGJSiTb9+NI62OWhsWslGWx75/xC0W3oL/qEIFxrhIFn/
	8YE0se6sMgg+kR9FaPkOC/HTwEevvK7VYJqLqFIh6zfZGNADPK6Nk2OdPd8kPMilTFb1ehAQ7OA
	rLZnw6j1Uv/ZsjOeWtYWxyveOtK5/9ipR956/qpC6GIJIOkHBOmMhCsK2e8yQ/eTx/PQ9TjR9un
	gbf+g2OGiSRFnJ4oN93pcyXsJeVyNuDiHWxdZ0wOiobgFaf5e7rWphybcXFoQxu2VTD7WqtZ9fB
	TM4sxqIGN4cG3RGBfF0nKHmPJFrzNsxsUd2F9MncnmI+cg05SaeFveY3DuwC
X-Google-Smtp-Source: AGHT+IH96kaFw1QLJUYn/w7ubUS3GRAHrcTkVQ5/aTCb0028F1HTQS+Kq49584fZ58voveSQBvqDqw==
X-Received: by 2002:a05:600c:3399:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43d2230311bmr87482185e9.0.1742134858143;
        Sun, 16 Mar 2025 07:20:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1fe659b3sm77842155e9.34.2025.03.16.07.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 07:20:57 -0700 (PDT)
Date: Sun, 16 Mar 2025 17:20:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Drew Fustini <drew@pdp7.com>,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH next] firmware: thead,th1520-aon: Fix use after free in
 th1520_aon_init()
Message-ID: <80b2d3dd-208e-4e2c-8b17-297be797084c@stanley.mountain>
References: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
 <d90c0678-d2ed-4e77-901a-fdbab7dfca71@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d90c0678-d2ed-4e77-901a-fdbab7dfca71@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_072100_434909_07A5BED6 
X-CRM114-Status: GOOD (  11.29  )
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

On Sun, Mar 16, 2025 at 01:05:08PM +0100, Markus Elfring wrote:
> > +++ b/drivers/firmware/thead,th1520-aon.c
> > @@ -203,6 +203,7 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
> >  {
> >  	struct th1520_aon_chan *aon_chan;
> >  	struct mbox_client *cl;
> > +	int ret;
> >
> >  	aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
> >  	if (!aon_chan)
> > @@ -217,8 +218,9 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
> >  	aon_chan->ch = mbox_request_channel_byname(cl, "aon");
> >  	if (IS_ERR(aon_chan->ch)) {
> >  		dev_err(dev, "Failed to request aon mbox chan\n");
> > +		ret = PTR_ERR(aon_chan->ch);
> >  		kfree(aon_chan);
> > -		return ERR_CAST(aon_chan->ch);
> > +		return ERR_PTR(ret);
> >  	}
> >
> >  	mutex_init(&aon_chan->transaction_lock);
> 
> May the additional variable (for an information) be defined only for
> the affected if branch?
> Would a smaller scope be more appropriate here?

There are some variables which should always be at function scope and
"int ret" is one of those.

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
