Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEAED149F7
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 23:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4P6K+FTbZ8IVzpPNgRXuiMXgdvn5KaQkTaHocYCWvE=; b=XdmJSiChhV+sLh
	DmtkuDdrFuxVwIBXSxWyPlbV87Ty6eR+bn6Sdxr3cI7bozv2dUdJNRrQNxb2hXi4159Z/7GaZK6cu
	mLqIc2HXUJOPAZfq/Tr2aa9iO3LsKI6FWpFXW671WhJ4+47d7y1PT2Nk0mErY3e6mgtNGqxr/FUk/
	njA9WFbqkA8ck0hCtiRK1o/vl1Fh9lWWbqdCwbdv3Lw83swkcHkLaalhRPNQt/O8syrEqjaQYJ6iE
	VpyuIo2So8IWMy7dB3zBjehCq/9cIKvotdJD7JVaBwfJYFonYA23P/Nme5AxcdkHnkdukMWksOiFi
	WcuTZEn2syx9Hkr0oCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ThN-00000005WHw-48iY;
	Fri, 25 Oct 2024 23:26:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Tfm-00000005WA1-2ZfE;
	Fri, 25 Oct 2024 23:24:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c8b557f91so22034045ad.2;
        Fri, 25 Oct 2024 16:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729898690; x=1730503490; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AUOx9g9Hd29aDPaPnY4OSJGlF1FDFTub05boTsaeB/8=;
        b=cXQ0Vk3DAL4E8rGeNpkycA4IbD9SWfH5sIjG5MmUveJHgA6XmDT52tmrlUzTjUsOBJ
         yb14ZsxWGqz410XFlm7SGhsRLarfLV7rTuijvynMAToeMC4KKOPx1a2dj4/JFi1xCb1O
         loHX77HYtYQcxvKQ6fR+XkcMqhLtayf8vfDxgGU2xM7Wcc6tjzXV6Lw85TSmca6/d6Hb
         5CuEM/t2WN8tPTLJERS7Vs8rNWFOzp/St/t/wwdKqiqwtdfgMbDSYzt/K1qFtsyf2Cmj
         BzIlm7ppUMARP4WprySw6Kp4xbIPGk6Lrup1bwZTAAlLih1qdN5wofYZrFdAIDmyahDR
         WUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729898690; x=1730503490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUOx9g9Hd29aDPaPnY4OSJGlF1FDFTub05boTsaeB/8=;
        b=rMy9sfRMdiJcfGMNUqTU7WtQSoeYFcveYZqTCSiwr3rhVGOdtbBTzRcDsEouIu/f0o
         /rOx3g7Nhg7xoYszw3onZ+wsQ59kTfKZ4kPtjEJb8x2CaEAN6fVtRs6McTIr9/43kIGO
         hFR1SpOD09RLe7GxJuHJdrWAH+XYtamP30l39lSEcajZHz1JNfduN2ON+MiKLqOee/7v
         ieYzLopf8w9Z4YVb6wIknU/Jb7bufv5s+PSvP22IWf3K0GmwrE2paY3mMokG6d0xW26W
         bpOmvkJ3vp6eYcamAWWom5AcjUQj0W5xWqZ5To1j1uxfEF8yjjvdCEp/EDgHkrQ/0u+O
         Jx5A==
X-Forwarded-Encrypted: i=1; AJvYcCW00oLLqdWFSxRCH6Y4bOKnxwVbLOxKMelg6QKedBtJ9LMkFEBzSlL4EynaHZ0boVMZvDTkhS7rnYf4gbtM6C9X@lists.infradead.org, AJvYcCXHdHhjGLgoqSUNwIOeZa0eHTfmBsGrhNHOXlSoBqdnggcXkQfjG8PyLVIjlwBOKSwPaWTLhB+IBwY9cK4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9QtmlQIyasoDLVUnYRmDinBh3SH+tfs1HozkjOLKiZwmJj4fF
	RNtKrSwjKJxp+oHBEoiJCpsoOVwh1SK48d6csTXIXY4De7U4JADC
X-Google-Smtp-Source: AGHT+IFWUkTXqhX/x2uKnWo19NThA/0At3qPgoz/DFagDTJ6IoWaouVLt4TY0P6cRpHC9jOKRPrbGQ==
X-Received: by 2002:a17:902:c94e:b0:20c:af07:a816 with SMTP id d9443c01a7336-210c6c0dcfcmr9231285ad.31.1729898689603;
        Fri, 25 Oct 2024 16:24:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6d311sm14429325ad.81.2024.10.25.16.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 16:24:49 -0700 (PDT)
Date: Sat, 26 Oct 2024 07:24:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Simon Horman <horms@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/4] riscv: sophgo: Add ethernet support for SG2044
Message-ID: <vslmecginak75lrgudcoltoarvi7pcge7qw4rljyo6bctx7flc@xpasjaasdkas>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025130817.GU1202098@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025130817.GU1202098@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_162450_675460_AF11B394 
X-CRM114-Status: GOOD (  19.96  )
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

On Fri, Oct 25, 2024 at 02:08:17PM +0100, Simon Horman wrote:
> On Fri, Oct 25, 2024 at 09:09:56AM +0800, Inochi Amaoto wrote:
> > The ethernet controller of SG2044 is Synopsys DesignWare IP with
> > custom clock. Add glue layer for it.
> > 
> > Since v2, these patch depends on that following patch that provides
> > helper function to compute rgmii clock:
> > https://lore.kernel.org/netdev/20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com/
> 
> For future reference: patchsets for Networking, which have
> not-yet-in-tree dependancies should be marked as an RFC.
> Our CI doesn't know how to handle these and we don't have
> a mechanism to re-run it once the dependencies are present:
> the patchset needs to be sent again.
> 
> Also, I'm assuming this patch-set is targeted at net-next.
> If so, that should be included in the subject like this:
> 
>   [PATCH net-next vX] ...
> 
> I would wait for review before posting any updated patchset.
> 
> Thanks!
> 

Thanks for your explanation. I apologize for missing these
rules. I will change it to the right title when sumbiting the
next patch.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
