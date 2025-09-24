Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC21ACAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ho2xw0MTHWUfYbYpz3rOBZKcKGF6GLeszJ+G96zBJQ=; b=nwYgibYiDU9Rhj
	KY+hNkhnf1XDIJwkMLgX0WQxF9cZVFrCTnyXgV5NmHCVB5XcOFGP+Q0VWu4TyOW5KuoinrFzH6Je8
	fFXX/6RiOuZIBwC5XkdWHjKlrZCICQZyDJRpsrz8qBYNgxaiS5WEkpl041NAw1rhC1H2nESu/a78H
	+JDnvnWQ34D4uwddpp+XzRN1iXJVQ6wWmsJ2wcgYodjW6/rmGFBD8eEoQTerJ0pC/HbDW2MfmJSaQ
	tix0tOt1HKEF8EixT6yBX88dilOClLa3m8NwVff/fX1Yyit4tZ7QG8TFOkst1FgPY9NWgBQE0WUtB
	7qKVXotKQcHJyAu0e0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Sz5-00000001zn3-49HS;
	Wed, 24 Sep 2025 17:08:51 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Sz3-00000001zkx-0t47
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 17:08:50 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-425757c5f84so227195ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758733728; x=1759338528; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u9YvycGlNJV4Q2DejLBsM63fTc6nBtT2JcHZL2ev/Ww=;
        b=jZK+/s2FeHbKOzb491SaKSDslU1l7YT19b9yPF/KjWm1Jnax+ylii20vBj4yYFwhvs
         lAGmPN4GNz9LMxPt9oxRK/BCU0k98cNF7pRtQzNtm/BEGDuI4FvGlWl114X/1ubi9+PG
         xleBGdOLsKVuvf8UsVetFLrpjdEWCPWc32GtW2GBnavZ7PJrEE12hIXjjD9sIJsplArN
         ybIBINOWQ86EOBA4/jSWZnszWQVKU82X2Ytv3Z8V1Wy0DLSdn4HlrjRBUJ2ImWuJkPgy
         95Zf4bbTV/P/KCmxZ0Yg4ZjIy4xEsaA6tu9yIFYUnCzfQHU3eomFT+BDRJh1uSO2zoRO
         SeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733728; x=1759338528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9YvycGlNJV4Q2DejLBsM63fTc6nBtT2JcHZL2ev/Ww=;
        b=oZ9GjqyORGXHbFy7XGZOHrDX8+8oK2Gr3FY/1ieDjaLBOBmVCSNs3hp8G2gJ7Iln4J
         0PBhUvChbYyGSm96wfGxq+/+JfwCLnZ6mqwSzJ/TehMO6j0761w8HCquZTD84aj2l+lB
         3/rNAtPQRojqauGJ4bKVI0VaQdgsLDqLHZuoT85G0dB/8C0pULfVt4wmg1Ex61lbT+p9
         QuWSNUmQR4ZH1WV+KjqDilEtAkiCqJ9y950tamxeAZhgV/HqbQvU69gPk70Ew6dCXnwr
         6qQp13CjPEeMCZjT/nFYRXQP90kFsNFEFNaBvGGIt3FhNjfi+Jzy6gEL6mplIoWIYUck
         rg0A==
X-Forwarded-Encrypted: i=1; AJvYcCU00Nj7i1ukpRFYrvfAvswVgLk1mOS0NR+WCvIRWX4ou/Is1c73lANaIQcJRYe27CtDKzpLj35+qZlG6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLCKeLP1kuzDxhRul1oWRqstg3LW3KIRAil7D5k0w45NLkPGW
	IsJEqRaK4CWvl5PUqsFIYjxp3duSc737ViO9B4RmkJvPGN9i9Ex0ag31uYrovpuaBfg=
X-Gm-Gg: ASbGncvIqBlFk53xj/CRXgmITmvfjqsFFSBr+ezJRWRXhfMRB5Ll+7/STHtaALzm5yU
	kHfgdN66r6+DYHe560TNZYRNkDEUBchjxsilrqytLbOH2/20jLFAUxwgHYBthNTHk0mCeHwTrfa
	p11uHE/mfzyJEO/UwhD8OkCday0QzTGn5pI4oyvVPwf+irArfiTLPdlWy3vafc5eZtp2OVjwisl
	1AVmZFekgFip4z9D/+Sc5siU093ekc/qaq37uOD7ZJjSyFNypspNMn4xjAzX6kD2gIIN2EZWOxZ
	+phwsUwnP6D/bQFT8LOrlD9eCpcr1IVRuVpo741kcDqfjLHub0bNPQE7x+n1QL1IHaJx5RKtGdK
	/oGVTVQwDmVmfL9zd1+Xc4yRa
X-Google-Smtp-Source: AGHT+IGI2XTu1luL1W07izdN35I/CB5PQt7LugDhcv/pXBGWRBL2UtisiXkcMiabO518Q3HGRFAjrA==
X-Received: by 2002:a05:6e02:5:b0:425:7afc:b84d with SMTP id e9e14a558f8ab-42595660be3mr5073975ab.18.1758733728037;
        Wed, 24 Sep 2025 10:08:48 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42585a701eesm18122715ab.7.2025.09.24.10.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:08:47 -0700 (PDT)
Date: Wed, 24 Sep 2025 12:08:46 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux.dev, x86@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [PATCH v2 10/21] riscv/paravirt: Use common code for
 paravirt_steal_clock()
Message-ID: <20250924-8189d2caf8323e5f6770f429@orel>
References: <20250917145220.31064-1-jgross@suse.com>
 <20250917145220.31064-11-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917145220.31064-11-jgross@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_100849_260103_20BB313F 
X-CRM114-Status: GOOD (  11.73  )
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

On Wed, Sep 17, 2025 at 04:52:09PM +0200, Juergen Gross wrote:
> Remove the arch specific variant of paravirt_steal_clock() and use
> the common one instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/riscv/Kconfig                |  1 +
>  arch/riscv/include/asm/paravirt.h | 10 ----------
>  arch/riscv/kernel/paravirt.c      |  7 -------
>  3 files changed, 1 insertion(+), 17 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
