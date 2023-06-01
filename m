Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041D3C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 20:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9lbFTQSFrcbFDuZPcbhA4hc+Z6tdQKWNIWRD0g+EZY=; b=VGyZc5pTpkNSsG
	b87ha4MxPlOFxKofxHDnO4CZB5O/k+wVJ/cjDqCFPuv8bQKZxHFgvwvMlqu0XZM7HM1Wng54ExtRn
	aEGW3A6EUxFJ/1bRRxmiZkZcHcwTaagXLE6s7pEOvLebVvamB9JOeLrWAmsjWOrfUyTqqE3TfHjaN
	65NOrJ5p0EEVqmKUEZEAynUueNIogUh9EpPtQDhxQt5bfyzMrIPvQtgUXUAJ3CB0fBGuzyPqRJtKM
	Twa/gU+bYVNs6xZxa85PhXKC53JfVWwqpGF/P0SL31aeuPbbh+X/RluG9sBm43rkaygt8I9BfUiqr
	NS9sMfJNrJqTq7QUKgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4oxQ-004sCV-0r;
	Thu, 01 Jun 2023 20:31:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4oxN-004sBg-1v
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 20:31:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b041cceb16so11496875ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jun 2023 13:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685651495; x=1688243495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wqcyp4CmxpgYeEHc8GcJ0HoG2EXsHPzXMFxXDEfLsg=;
        b=Q94S1yLY0nWcPU4aftdIP7iFZ+0tnpeB5SKyv2cGl8gHz9JYvwaxOfVnDgn9M0tLwG
         OK17SGHZ99X1XonVvgWbZPqVibIBYqYvGjn/tEKmQBiXW1GG6v7poNVXrOMC3K/Sxi93
         G6DXrPSnRO8r/dgFxY+kV5vZa6c1fWXnC4Mrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685651495; x=1688243495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wqcyp4CmxpgYeEHc8GcJ0HoG2EXsHPzXMFxXDEfLsg=;
        b=lZCZhirpHGquKmg/hU6QY/ytb7n2ymzfukW9y7i99gIE/K/QaqrN8Hn6lC28U8nGdE
         lmo+q/ZWDz+hT/TYIYfLWFahJWb2MWO+QEjkFwleSyvCpSIOF7608dHbyR5AftQFUuMz
         9/VOct52IhklAsv8m+upu/7vv5wC+Ugi6u03eQQrlH3dPUOSFN09RmhY8mS0BIXrULKN
         7mbsfziY4dsULC3h+ev4V4btpLKJL9pNj1vksOZ+H9Ilo28+YDzFSf4xx9J9psT+MOv1
         Qkcjos8RZ1Mkkz6VSJuEvpsbKv+GOBhMGWAjQgx2Pzom+8ln/10kIJWb7SuEOJ7enhtI
         9d+g==
X-Gm-Message-State: AC+VfDwdDs4TqSYcxmKDoyVNiRjCIO3riuVAKrcxBQEBrL7d5CaJVJ9E
	mLh4zkaGkME+MzzX5FdrWYNyag==
X-Google-Smtp-Source: ACHHUZ50FytdpQsyv66+VN0G5nKzPNryGrQhcvOnlh+7piyIN35if31vm6o+E+x5MGd1aTr+6gJlWA==
X-Received: by 2002:a17:903:2352:b0:1ab:253e:6906 with SMTP id c18-20020a170903235200b001ab253e6906mr357438plh.67.1685651494889;
        Thu, 01 Jun 2023 13:31:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o7-20020a170902bcc700b001aaed55aff3sm3888464pls.137.2023.06.01.13.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 13:31:34 -0700 (PDT)
Date: Thu, 1 Jun 2023 13:31:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, ndesaulniers@google.com,
	linux-kernel@vger.kernel.org, gustavoars@kernel.org,
	linux@leemhuis.info, heiko.stuebner@vrull.eu,
	linux-hardening@vger.kernel.org, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, joanbrugueram@gmail.com,
	masahiroy@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com, hi@alyssa.is
Subject: Re: [PATCH v2] riscv/purgatory: Do not use fortified string functions
Message-ID: <202306011331.880AF01743@keescook>
References: <168564402237.2891605.1600418987887898293.b4-ty@chromium.org>
 <mhng-8c6309b5-4ba9-4276-a8e6-2864426e77f0@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-8c6309b5-4ba9-4276-a8e6-2864426e77f0@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_133137_660452_91392CEF 
X-CRM114-Status: GOOD (  15.23  )
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

On Thu, Jun 01, 2023 at 01:17:03PM -0700, Palmer Dabbelt wrote:
> On Thu, 01 Jun 2023 11:27:03 PDT (-0700), keescook@chromium.org wrote:
> > On Thu, 1 Jun 2023 09:00:28 -0700, Kees Cook wrote:
> > > With the addition of -fstrict-flex-arrays=3, struct sha256_state's
> > > trailing array is no longer ignored by CONFIG_FORTIFY_SOURCE:
> > > 
> > > struct sha256_state {
> > >         u32 state[SHA256_DIGEST_SIZE / 4];
> > >         u64 count;
> > >         u8 buf[SHA256_BLOCK_SIZE];
> > > };
> > > 
> > > [...]
> > 
> > Applied to for-next/hardening, thanks!
> > 
> > [1/1] riscv/purgatory: Do not use fortified string functions
> >       https://git.kernel.org/kees/c/ca2ca08f479d
> 
> Sorry, I'd just applied this to riscv/fixes as well.  I can drop it if you
> want?  I was going to send a PR tomorrow, just LMK.

I'm fine either way. I was carrying each arch's fix just since it was
related to the -fstrict-flex-arrays=3 patch in the hardening tree.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
