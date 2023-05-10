Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56686C7EE26
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfXTi47xfmPsNHXCj3abl4sODBZZLBBDereP5DjiNw4=; b=NtCaquw6M3IxHv
	IZpZvt0GAG9ohfbZoULKiRXVRhlsUjpxuHyj7No6/8MkxbuSMqZeAwZYxsIV9vbLHAUN1Erfdd0jf
	dNcC4yGxzbeJH64OZCOVwuTPce0VlHFh+/A8reER1x7sDvtYr1zduqhJMb13RBXdx5/SCcF0zX9y3
	6RAuMdWBTfvshL5/ySoR9buEiWs/de2EjKL1aXBADhKoZ5k3MzqHn2+hKi4qzn8OZR91PNZFSYHoU
	ZeFPPnee8Bu7Gb+IRElc8x81tDMi4BCFM5AsB0j2Qed8XjKDmlgr/s4gO0vZb4ORZyS7Cf5aogeAf
	sBTgmTgVTFwcn5EuGu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdmP-005KEc-0O;
	Wed, 10 May 2023 06:58:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdmN-005KDR-0y
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 06:58:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f417ea5252so29979235e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683701903; x=1686293903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ySej+k1OrwGyl4PfPNb9doHlUnZpL4SVS/pqSYTOh0=;
        b=Y3ZUM6/klFrxtnyfnYxwJpiffgTkxBnxOY1lh2I2gVmZW2LJ2A8Sje6gKprk1d78oX
         h0Bt7xX0rWu2sGtU4/WqTFeRSMqoyuyXnpWQ8BG1LfdlOce4w0Mj+5gTMbyWNs3fuu1J
         62yvFCfJMM0xBzIoqyWKMdifnBn2j87DM2Mq5AO5mW0EkgXz6dtgjZO601iJp7mABDDs
         KK05Q/vrCImCX4MK0IAg+VzdznSQ0eO20Ov4lrn9TC9oC6G/CaKoYVApqRp0/yf8UDFB
         EAZOzrTy86klGrFdmTtlL9rxIVArgrtHpgppPltxrPVzEXFbLg7gEIFb5lly/5Hi3a62
         5muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683701903; x=1686293903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ySej+k1OrwGyl4PfPNb9doHlUnZpL4SVS/pqSYTOh0=;
        b=dl6Nv5mb0w1fkAfCjbp9kcirOh9AGx9uLvdeQHAw1JJY9EBbNYFdi5FGxF1LzNvXmZ
         ohSlmqjVAmyDGtQOBnGXz0/5WwmQFwPYLFaKrxdo3nCFHD1XC59r0tlm88SZXECFlmdV
         dKOq1zsfsACkSBXORJYr7JrD6u1TD6payBvB3WyB6QZ32nmSpVdgq8WwR2ubesZ/cQWM
         VDUmLv9C/bcumqIbiNEfCQkWVllvthAgzeQJw5VlFApwIMAHAABs056+fMOl3Ghs6wZp
         UqhNUtOqdJ0v/QSZ3hL1MPgQn/Jvyj7/KT99gGZB618FmvKDNRq16xjMV6m6pz7ZEsuS
         AVxg==
X-Gm-Message-State: AC+VfDzyN657JX0gXooBrjdgrnxT/T0ROfJHwhQ4dti5CWjzM6iC/NBD
	jis/fHp6BFgiQ4CY1L+hHF8JuQ==
X-Google-Smtp-Source: ACHHUZ6KTb6byTXGvgEtMzdoJn2BLJMZzTAREtlkqjSN+GSQs8r5cplAd7QJH7ZpD82g4DevcJ3QeA==
X-Received: by 2002:a7b:cb53:0:b0:3f2:53a5:d308 with SMTP id v19-20020a7bcb53000000b003f253a5d308mr10828292wmj.6.1683701903584;
        Tue, 09 May 2023 23:58:23 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h5-20020a1ccc05000000b003ee5fa61f45sm21779754wmb.3.2023.05.09.23.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 23:58:22 -0700 (PDT)
Date: Wed, 10 May 2023 08:58:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhangfei <zhang_fei_0403@163.com>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	zhangfei@nj.iscas.ac.cn
Subject: Re: [PATCH] riscv: Optimize memset
Message-ID: <20230510-0adf0b2a2956ca1cd426a2d2@orel>
References: <20230509-b0dc346928ddc8d2b5690f67@orel>
 <20230510035243.8586-1-zhang_fei_0403@163.com>
 <20230510035243.8586-4-zhang_fei_0403@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510035243.8586-4-zhang_fei_0403@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_235827_339740_AB264AD2 
X-CRM114-Status: GOOD (  15.77  )
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

On Wed, May 10, 2023 at 11:52:43AM +0800, zhangfei wrote:
> From: zhangfei <zhangfei@nj.iscas.ac.cn>
> 
> On Tue, May 09, 2023 11:16:33AM +0200, Andrew Jones wrote: 
> > On Tue, May 09, 2023 at 10:22:07AM +0800, zhangfei wrote:
> > > 
> > > Hi,
> > > 
> > > I filled head and tail with minimal branching. Each conditional ensures that 
> > > all the subsequently used offsets are well-defined and in the dest region.
> > 
> > I know. You trimmed my comment, so I'll quote myself, here
> > 
> > """
> > After the check of a2 against 6 above we know that offsets 6(t0)
> > and -7(a3) are safe. Are we trying to avoid too may redundant
> > stores with these additional checks?
> > """
> > 
> > So, again. Why the additional check against 8 above and, the one you
> > trimmed, checking 10?
> 
> Hi,
> 
> These additional checks are to avoid too many redundant stores. 
> 
> Adding a check for more than 8 bytes is because after the loop 
> segment '3' comes out, the remaining bytes are less than 8 bytes, 
> which also avoids redundant stores.

So the benchmarks showed these additional checks were necessary to avoid
making memset worse? Please add comments to the code explaining the
purpose of the checks.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
