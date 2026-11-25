Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E942B606A329
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 08:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s/JSFNGy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yql/ZTvI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=51KW0RHgZjXmbrAXYjpXDsll68IFROTW7JSLTa/1Qk4=; b=s/JSFNGyB8LWiIaw5v6ppuzpax
	LWrht7ZhrNAHthJ2yaRLOy72Hq3bTjSJu+nOVNx/2PB2LfpvnQ0AoHiaCnflR+xHaj6Av2Hx7PcwE
	MVvYweof/ZSvFOY+p4mETg18KjCWm5UdjAflHlCFSbS4+uy/Ku0jD/q98eB16Zy8yw8oA9y8mC5z0
	CqfAGBUucO+7VgnwvgOxK5h1rNoSUHqj/RCVfRepXBMLLnT41XVpbS7hJ7BBt5MbB/oJlkFQL1AY6
	hyEI/PFA5560i7pTDA67iqXQ1gQWFsdw7vzBJoymdS8fJSqGjJTwpkyFY1/DmZ2FhoDmpR/aWvj/2
	DUye5wAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8j2-00000009Aqs-2vM4;
	Wed, 25 Nov 2026 08:51:36 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8iy-00000009AqF-2tUj
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 08:51:33 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so1085968a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 00:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596692; x=1796201492; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
        b=Yql/ZTvIzk+gDa8Oqd6KCLpI1wiHmBxPycQrlgC3kE/zvu8eMWulTva+qJFBnrU7Yd
         rE2gFuJiaAG95w7csxxBJcCejTrDVrA9mzV3FUHsXh9j5gYxIrFPovtZe1HMTzWEqwEc
         YJjmvhIc1qu7F/JL0KteozSXeKEKcc6i3lskzXD5g4rIRb4xncgCg9DV19scnUDWLPoT
         +JhxGoFgNPFjoeyVwUwME56FYw8m0Uk576s58ieQNW+/fVrrJyrhL4h0b3XkpFb4cWjW
         wSmcvMHMnx28GDLMDO+1GimWe+MgdHzgoWuAZ+aw4EsgaByjjeLBKacBn9ZSJFg4JbZf
         CGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596692; x=1796201492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
        b=ciWkkI+9MNOftPi5SePM9CQyU+KGztAJM+j6IvXJQZucUdRZaHociuPtNyZu+AsYXV
         1CD1Z2/9up0wSjWXUTXsQ7Hy1XOBF4btdHR16NRaMiKJE4NF3gWy/EUqLZbiMZvqGNwN
         w0N4daM3autZZ1ZYb472uGVeNLWvxDwV+xQem0WOXJOXSK0JO9uQMJwsGzQ/LtsXW8up
         tedXr/fvVRjx4qEI3f9IuXdDUEFNQDgLeI0NAcMviHHV6WuKLvgBOvm16h8M511Zg5Eg
         ERwxkD/FZqFsGbEsqaoXe6bfa0ft+4/JMOLraF1/RWTiUx0g09IFr9nBMzfNOqzfWuGz
         kFsA==
X-Forwarded-Encrypted: i=1; AL+hErH18YDvkvibCmHsOhngqmCqJfDIZjRHFYrvJI4eG8Blh23Zdhy49cHEbysFh+Wn/qO1HknABL4X1F7V2Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/UllPKkeWIHvv3/olCI+gkUOrJHV7BbF3HDSasaUAz/kFtsaAV
	A7GgnrCZP2kVq4DFkbYGwddJhlQ4RKwVXtpMBcxJhHrH+8WwVF0x2qKj
X-Gm-Gg: AZFdTZdU84pQ1S8D1tN3AlNE+oeeU2FiuyLmRuj9G2V9e/TyME53Pn7uPBH4bWeW8VR
	C4fvDIEsShAOvkpF3L0tSTAzuNXBFP/DzEBPB1nOMi24BExpP4PxLLc2UC43TqpIMqbCB+tryu/
	c8fXFT6LKX1MBL/yuV4xmzx4dKxxGrajlpmYDK1NaXdzW4+YRtkl/UIp1KYvWvG6XEytspHnesA
	y0WjeyvQBxQNHgme0ZG5pLCHVMvGXTKm6Jiw4IhzTS+Kkr5kzon+ZCxfHEBTXpicr0jdUlNcUYC
	K00BQOBbqTDmdWG+Nrqrq9eVtEM1B27jVuhf5K3br0IaHZTX/NOkPOgOeeJQBbncC0UmLwGIhMI
	vp5QQkWT8zdWLIzEwYA9W8yraZP5PZL+uPMrCNYRlU3+iC0HDLKuvLQMHPl0ipa7SoUcLE/VIpA
	nz2Tho18eViQj3RBSp24B5E7+G7b99hzAyj5aPEmHP+3c1SfeCVndWhepqZAS1FW3+Hb+/CANLz
	EPAHAip3Ce7GuR736Nynl0gYirCxSv2TFUJWzLw5meEi9CuF6CmKldCkQABIOxRUSdGxyoWny2k
	V8Ca6Gb6mRPMx9ImJ0Bi+154Tg==
X-Received: by 2002:a17:90b:55c5:b0:3b4:5b2c:2959 with SMTP id 98e67ed59e1d1-3b45b2c29b9mr11827069a91.63.1795596691606;
        Wed, 25 Nov 2026 00:51:31 -0800 (PST)
Received: from duge-G3-3500 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm26632567a91.11.2026.11.25.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:51:31 -0800 (PST)
Date: Wed, 25 Nov 2026 16:50:47 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <kahf2gbctnhtwngvtwkz7nxg2th2ecisdte66p2m7ukqup7jsj@7tmya5uxzg6o>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
 <awYHAU239WMaqVKk@aurel32.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <awYHAU239WMaqVKk@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_005132_728987_6234F443 
X-CRM114-Status: GOOD (  17.04  )
X-Spam-Score: 2.8 (++)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 10:52:01PM +0100, Aurelien Jarno wrote:
> Hi Jiayu,
> 
> On 2026-11-23 01:38, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Reload the shadows during probe and cache the data for subsequent reads.
> > Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> > other banks.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  11 ++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
> >  4 files changed, 218 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> Thanks for this new version. I confirm the nvmem format is now much more 
> intelligible. The content for banks 0 and 7 matches what is reported by 
> the vendor driver under Bianbu. Therefore:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Hi Aurelien,

Thanks for testing and comparing the data with the vendor driver.
I'll include your Tested-by in v4.

Best regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
