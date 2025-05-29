Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B077DC54FB3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAIVGPOg341J59Uz9YEyVkzQO/qOCIFcJihPtq4mTns=; b=MbLcY79q0qfqq5
	j4bWrFzm5FfLRMyvoG3IJFEiNkzvq7zxqym5xHfuGWTFNk3CVGIUTFBxInqncujd7maimjvibdx8U
	SIQmQ9Sv0oXq4yDlTLBGki1v106I3lp+903Om0v0JPydaAJd/bqbpNBCASaoeV3gWmm2f2Q0iTo+M
	Q/fBYiV8UlWqrr9FUTFMpvFu/CRFp8DkvWpN2eKKFuPaawgPshjrSmdXtv1A3e40GI2KlZFQHWYjE
	cERiUtrH8Uvl4M495ifjVNlQAeoG8THsn9O4IBPSX/Fyn3pPk9EpevRKnY0xZa1ufvK5iyaLPIZEu
	/Feypax+Gqm+cDMg5FSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfGe-0000000G57Y-2K9D;
	Thu, 29 May 2025 15:34:04 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeiU-0000000G1NE-0b95
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 14:58:47 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-742c46611b6so1197107b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748530725; x=1749135525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62giXWg7WsEB0ulrJR1t2wvmt+DLs2PIJk6M7yXmcBE=;
        b=ZBJkRqtXUGwiHduL+TX5ZX/RL7yNQBye9qHBS3rg/h8liVwbnrI6K4UD0xODSlW2II
         +EgjMzwuEHWMt2PUNbKq8TnLErxHEG7iH0tJTuUB9+9RgHPJQ3T2V0fL3DmT5wFKL1wa
         chY4p/3FqoyYyK/NyeNakelGPbyYeoI4TRnvGI94XN3NOH8VY4/xZw8neWGOrdG2h+8c
         Jny2sVBWZVdqxz8ZIQUW+3i0gMdFhlEkpoF/voA6ye1xyD1HKsqQyb/62xMqh/DPqMk1
         ttOmuxCYBig+m3R/UFt+3iJLxAr1BwJqCPf2O6a3KX+ByZX4aS61xN8e7HIOMGyb9kA8
         1fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748530725; x=1749135525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62giXWg7WsEB0ulrJR1t2wvmt+DLs2PIJk6M7yXmcBE=;
        b=sufU5BpGT7Q+HW52OMx/nsJh8rvTVvKDgJhqP/MQHP0czeJNWrHdihwNt7q44rdlvf
         BZTCKQLH+OcZTYMzUnSFYuuI9AKRVWiRNtH/pXLLQmB08TdLcl0Q9EQdAZI8ApIHqasA
         ShxrQ7lQrTrp3rEHDWziHUMBB3hN8Bof1QOinnPlu19EsvEuNI/7E/VHgtW4iO4tzqGU
         XyENtS40hFUvJG/2UX7ikFx3hIrieuUC3gTG/QSSi2IrpMwfBLGPrZ/iQDwFkLf7QgAJ
         77+7abaFi4adrZbdbOPv7Gc/7lTE3AkhwiPPm4DQFUOaXSnJ+pYGjZMZJMuMiBQWvUF8
         f85w==
X-Forwarded-Encrypted: i=1; AJvYcCVcF+Z8Za1f4UuMZO+6gReaFwWlpos6KqYkOv/H0SMvRse0PzXfzTAL6Gk1Jogeb7RRdjb979ebhXLkXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuIqHJWav3QoOR0sgYqXTEN40JZkegl2wjN6GvzVA78ou8GoAh
	dIfPMdm8b1CMoLhu3VBfnTSYI0CPg91por2LQJApFcgJ3dOkDQiE/u6XkAYsAiDWxuWTDA==
X-Gm-Gg: ASbGncsyPjhK3FAjZLBlM2bLLWLf1rEObLRkVCz7c+lsjRt446VBSPAXVvUuguUBU26
	2qEodB76TzvOWjySaa102MNU+L6KIh4qgtFRP7n7Qq8xpEBkow17X/XZ3mT3VflZjCGK4gCe5II
	OGyanLjQ1vKsGkyXY12+ted1gFpOcODekq/DpDvfT0qbrxTlmng014VBUcBEJPPw/UCaHH0R1sg
	6U7hya+VoThYcq4Mp+6ELBcy1UU957Z3flhi5BSRq7D2jeJPz02A48bdJYF8huSsFr/n/vFee2g
	TZZDbwl6fGhBM25gEP0pl3sFKyNxnRjLMN93HoiO0G0=
X-Google-Smtp-Source: AGHT+IGYOhDLZwULgZl6IXzdoOY5xQYtIs9vHAaR3rtKYgby02EA6jBpe6c7R8WjaS7P9RLaVvFF+A==
X-Received: by 2002:a05:6a21:7a47:b0:201:b65:81ab with SMTP id adf61e73a8af0-21ad95ab750mr91459637.23.1748530724635;
        Thu, 29 May 2025 07:58:44 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9d672sm95547a12.60.2025.05.29.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:58:44 -0700 (PDT)
Date: Thu, 29 May 2025 22:58:39 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>, andi.shyti@kernel.org, dlan@gentoo.org,
	troymitchell988@gmail.comg
Cc: spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: k1: check for transfer error
Message-ID: <aDh2HxnGVez6T1Zc@troy-wujie14-pro>
References: <20250529122227.1921611-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250529122227.1921611-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_075846_183495_51A6BAD2 
X-CRM114-Status: GOOD (  24.42  )
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

On Thu, May 29, 2025 at 07:22:26AM -0500, Alex Elder wrote:
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
> ---
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
Sorry this is my mistake.
Thanks for your fixes.

Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
>  	else if (ret < 0)
>  		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>  	else
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
