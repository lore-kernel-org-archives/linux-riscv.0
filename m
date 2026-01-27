Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D8CD2FED2
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 18:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2dNMs1pLXAr7eY5+akeDlIONkhHCUVeIYyVh8QnYbo=; b=j4wA4QHwJ2qUTI
	0Ac29fgkabRTR3Nv+1Yo3/KpWVOp+sMWRFnc8WM8zwIdY/viSlrvheC7DhUT+iwtpQ3QhzfMzrk9s
	7lXKyCDjN1hrtIv36Q6ok39OHlwp4VFaV1DXnLyNkq/5+G4grsIJCQWFvRTzdNm/GnGOS7f0WuS0R
	4sV5ZG+GOl0UwVs1zZ+7abO6DLP+IOIr+oGpiSYY042L62IoJ1xN4606lAYlSrdHgtc8rUHPVWKZl
	C67UqPmmwrrtVrX1NlLz0BwBxfz1j8VH8R0pCZ/lu91kJhmhNmMn4C/B5uemdEUVi6tn0pXhOE4R1
	AA0gp7ZwCOD7r1fl7QqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoG8-0000000Ery9-2caj;
	Tue, 27 Jan 2026 18:57:53 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoG6-0000000ErxP-185d
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 18:57:51 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3927125f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 10:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540268; x=1770145068; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdwQ2scCPfsVRQpzQa7WUXDRNsFh0xJvA20rZizqUQI=;
        b=NL/WTvHYZVb4rtOTeOGLuqQvF2cMQzuwIQtgMUkXkCwkctPWOUHzYqRKB/gy6hzwrs
         3bfzsDvvU18m2omDOwK97jc6cllMiJfLJT/TYfAaccmzNKEnLCFM6Dx727CLGEh4Qla6
         Jx9GmvN+56StZznTGj78gICcqcCsckDKeaeogOTzZsvD4W+4BZ30QtB9l8AfgISeWNR/
         exBqDxWfe5E4YFcabFWkaVU5iCmcgMxiotliTWhRxCKTId9WYqHgKJhD42yy8bLS5cly
         JxKLyEfaMMA1Xc9aXh/0R7MDGI6r499Gb8Ecj0P5MqKL4z1Bux7ofMRXxa9Qaq0DFJHx
         PnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540268; x=1770145068;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdwQ2scCPfsVRQpzQa7WUXDRNsFh0xJvA20rZizqUQI=;
        b=Jtb7/tIdGknHsxS82ZdtePVPjhSWAlJkdoaOvCxOsBXx/RcGn8CNjqBEYAcacgEJLD
         sF3LerMYvSpTfKfsmH/SHEeGVlTZqZhT7OCkrFcqnVCxJczeEvmZFJpTMamvhDYCwW82
         nZjCh9FaysJyrtMzlxLAveo8LiR2FlZYDHa+pn25CTJxItHzLoWg4eQLRokkSq3XUYSX
         jpFPo6IeCx7/rCd4kWgJ0ak8GxG3d96g435KXiqQsQ64A3IF3xg7FLlhKoHBbk92R1mN
         mcPKiBxBab5VskGyiU8S65k0AvM09IPDNZG5uku3V2GztM64+5AVZqWQYvqiXtPdwWhL
         W0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVLpH4b2i9BXNfQD2aqhnJTbaCvGnfYL3TT7L/e+jduUMEJAJE0X2aCDCd4zCIjR8EtHcWchv6NE8rWvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHkymdR1n183xFL8Hs/soLVHV2seeZeYwfNV/K3b6/qqIkufZb
	X4o8X7mkCRsRYcAsh42XnmX2h5GzxfEa4qS4Jl3p/aH4rCgaEvPTiT6E
X-Gm-Gg: AZuq6aJaMUh8XQeUivaNyJhsjmjXCpsyX12UklNZPvEZ2hJnFVcEVwDUq8nS8/4bxBK
	Hp2xRDJe/Wvt/5+l1Qk5kabVQfz3wXi1oRGSFKwEZQoVWgLbxxULGIOCuHlpxhSaulsQjABMmQm
	vlq0RhV4AZFt1eJsU1q7u/P/X6XT11sy3L2IuwLwkHwXf4rACnhLGMzpLESitHmUgnXupPVV8lm
	KLLf68Zm7vYMO0GBhiBC9k2AZ1Z20fxEwPQho+TKwVSm6niWp5K3RJNTDGq1y10P0v2zLgjnfzM
	XjpcHx9+AfmyS3TbRnRai898jAHhi6TCAxXwBM3/CjJ2IqbVxwqEWRSSC0p2sQRQR4eGwdPOX0S
	lmV637tQQzyLt+9X4jzIQm1aAt4ZSqdRZNWVUw6hgO5TpFpM6Upnh/vQoE0z8NzzEQqx+HY8PfD
	TJQwPdLsR8cD/BuLPfGvsXu8JVnoZ+FpsrkhmBUDde/SuQXq16PFXPNkM=
X-Received: by 2002:a05:6000:2885:b0:432:86e1:bd34 with SMTP id ffacd0b85a97d-435dd1c0c54mr4243073f8f.39.1769540268233;
        Tue, 27 Jan 2026 10:57:48 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353ac2sm785036f8f.38.2026.01.27.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:57:47 -0800 (PST)
Date: Tue, 27 Jan 2026 22:57:43 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Message-ID: <aXkKfZDyG1uxDsD0@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
 <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
 <6f1d8478-c2b6-4966-b339-47c4d55fe7c8@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f1d8478-c2b6-4966-b339-47c4d55fe7c8@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_105750_321909_0A909563 
X-CRM114-Status: GOOD (  13.51  )
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

On Tue, Jan 27, 2026 at 06:49:14PM +0400, Mark Brown wrote:
> On Tue, Jan 27, 2026 at 10:48:07PM +0400, Anton D. Stavinskii wrote:
> > Add comments to cv1800b_dac_mute() and its caller to explain how the
> > overwrite mechanism works and why we force it off before playback.
> > ---
> >  sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.

Sorry. I was relying on b4 prep --check. Looks like it was wrong. Should
I resend as v1? 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
