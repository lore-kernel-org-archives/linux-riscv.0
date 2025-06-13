Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D4C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 02:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yb/FPWRXKFuxN4NWgjTj+ff5WnQoJtjBjmqSkvEfA94=; b=adVGOWMA2NtKDc
	2NOaWJIGcZH8EiLrljhkozeLhgS9wl5w8G3tgJM5BifY2xYUIsG/K35XyVs6yUjsP3OiVe8ahXLCT
	ZpxTQIPrP43LTHj1phlWfnKzOZrkVTMWg3mHHVuJtvqsfAzuYxrX0EqK62WVkiAJd+PRJ1rPH9MQs
	o+lfBxv5nnR7GtV2l/gXkHRq+Coq2eYuogjR59LarUiqHKsItjjtcjV260mGU14yOquqz2iSMPi4H
	lGhLzKN/t1ghhjzd9SxDfcp2wS5jIs0KKq9fd7q8eXq7VT6FPySxqfeIdfkOObULIytirvNrr90ri
	byXIRghMK14rWDmqBpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtty-0000000F7RO-38HO;
	Fri, 13 Jun 2025 02:12:18 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPttw-0000000F7R2-01MF
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 02:12:17 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-b2f645eba5dso2051627a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749780735; x=1750385535; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hna0O+LUaLx+0oktXX+K8llS+HEe3f1PFlR9cMiAfc=;
        b=da+QsulcGGE+fIMR62XZNfwqA3qXjDYc8zU4o4/jMs7gJ8Ywt/EKgDzm9q5ypyO1Ta
         aQBazYlCVScQyKOGZXKyPc1FpRdEwQIez9Iq49PC+4MzKl548EQFXlUc24/SiSUs51mh
         6/OlFoXrroYkfp/vM981OyFRgpzliBRdKtbO/1SGqWPZwDRHyLZQ1aOAQxXgfmWxB6zI
         oMy3PcVWyRbv6tZ1lqIE+buGhqSgTgYFXeCguc1m5QQKO+lDq2tVtfmwc8d85WIfwAV4
         qwm+miBV4QG4eFS5YWtvY/pffDZ+KPdiyZ5mTSZ0elS0+GHouWI2LVMGFtCJASTe+dbv
         +xPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749780735; x=1750385535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hna0O+LUaLx+0oktXX+K8llS+HEe3f1PFlR9cMiAfc=;
        b=LTiTZ6Wtl7r+fZrNrPsPr4wnhY/eK8B8TmsIiku+jgYTigsAFrrmsTc41EjZDxhiCF
         6DT9fWbK/KOavDbOA0D7Rjw5ER8WRE87SbRZjgYr/BEzNeQUymi2Ky4ZUWmIAMif6DtV
         RMwAnug1H0QywEMZagX9GhYFduRgRW/zG8xRqUHcsPsP/iAwntok9vTWDgPuPq1vDlot
         hAu4F7rpDc5AEZBzMlCDp/gNXQ92Cg5IzIHiqSde9dGDxafGCsCn1FkRwBMcds26/uzo
         NYaGFhjxpVVE8WH2yxNqKwnOIeBQpJyycUPPtFgGzUYEVW12KkPekU/YRRbua/0gOLRf
         G+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUBWSUssYMYPquiVXIqqNfezCWqLaQa+vObi/Pq672kQKszZPArbJ95LRNWMzYKHYXC/ZbOK+xN24tGag==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBKgBExzMuEF4V+CGcZvMrf6wbJaEno2vZa1Qv9uCmGWuOGodq
	qIloUfUy0lSfOswD5MpipXEJn0LLGzl988XOR4vTTTcs0fpd18zXRWih
X-Gm-Gg: ASbGncvplSql+8ToW2Ryawvr75R8gtbl1ELzer8n4zY/mshrA3Tt6pJVWkms8iprAQu
	JrTdMJ6AXgLujVZgs83ZxOjXmBSJ5NvjG2bjqZhmzL6qeq0ROQrkmuruuyaz03TfccW6JvV1fLC
	JnpYDeGtDjLM6VsUpx7Wf+DpewoHzgLUK1LY5tasRQHGAWyX3maUGGSY6KSht+RrcNNMG9VNF4Y
	3ZwJTBUtTCLB7H3SWeg/nO4kQCl2hbi2H8Wyr6+BvcKYWvYEVQc+KWKi0lzyG3mPaWWD7w0fzC1
	TMBHdecMrSUKuGyaWjF62ycq6P6W+qq2E1a+fU29dPwzq9biQ43Gnw==
X-Google-Smtp-Source: AGHT+IEn+f3gutrZsuGdkCNgFErV5PdSC6Hef2d/nsG5l9WFwb349LMISTX9gwCyLloUOhY8JzqgdQ==
X-Received: by 2002:a17:902:ecc1:b0:21f:5063:d3ca with SMTP id d9443c01a7336-2365fb3dde4mr12310335ad.16.1749780734677;
        Thu, 12 Jun 2025 19:12:14 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1639e5bsm403153a12.2.2025.06.12.19.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 19:12:14 -0700 (PDT)
Date: Fri, 13 Jun 2025 10:12:07 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>, andi.shyti@kernel.org, dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: linux-i2c@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH] i2c: k1: check for transfer error
Message-ID: <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
References: <20250612225627.1106735-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612225627.1106735-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_191216_040862_065DEB5E 
X-CRM114-Status: GOOD (  25.77  )
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

On Thu, Jun 12, 2025 at 05:56:25PM -0500, Alex Elder wrote:
> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
> complete, or if the hardware reports an error, it returns a negative
> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
> 
> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
> which is the i2c_algorithm->xfer callback function.  It currently
> does not save the value returned by spacemit_i2c_xfer_msg().
> 
> The result is that transfer errors go unreported, and a caller
> has no indication anything is wrong.
> 
> When this code was out for review, the return value *was* checked
> in early versions.  But for some reason, that assignment got dropped
> between versions 5 and 6 of the series, perhaps related to reworking
> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
> 
> Simply assigning the value returned to "ret" fixes the problem.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
> ---
> v2: Added Troy's Reviewed-by
Hi Alex, you added the changelog, but the subject line 
doesn't have the "V2" suffix. Is this a mistake?

            - Troy

> 
>  drivers/i2c/busses/i2c-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 5965b4cf6220e..b68a21fff0b56 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>  
>  	ret = spacemit_i2c_wait_bus_idle(i2c);
>  	if (!ret)
> -		spacemit_i2c_xfer_msg(i2c);
> +		ret = spacemit_i2c_xfer_msg(i2c);
>  	else if (ret < 0)
>  		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>  	else
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
