Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CF4C27C75
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Rre56xIfmb9nszwBuLJYZYBRn4bWUb4Qgv4+NWNyvE=; b=WWDc/et5kP48gT
	2j2hUlIXK7eGnCwVUcMVLA8x/iL/oKphjp7J9i9i88RvoASV5ZM0fGR07dzonJB/+hj7vIYgwfbiw
	pKstPg0zmEPyMOrz7f5zZb/U79bO968LfsI+eZLcLIQKHF9FzCPmGzuuDz2Kl1GNcTMmgD7+R+s1O
	2+MqlBN93aRo9sjrwj3AabWge53yvWxpeUhaaxybooCC+XjcdUlFCpovPsmTucAITUkYsQbJTrzpO
	lctuxuPA+Z80wdGH5cPvQwOpjIrqHA21APjNYW1rX2fT6s33yv7deCzcEkmiVegS+wg4E6vYWePeu
	9CT7oVe23gF0VtUbuvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5sQ-00000009mm3-3Mk9;
	Tue, 11 Jun 2024 18:05:46 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5sN-00000009mkf-2ako;
	Tue, 11 Jun 2024 18:05:44 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52c84a21c62so3123582e87.1;
        Tue, 11 Jun 2024 11:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718129140; x=1718733940; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUohe5I/U8iYfjovsxU/qvXwQ8UTe5baG/sBR7a+0qU=;
        b=X3wwojfymeGwEk0HtdEbcKORrs1OwUGXOc8UDc5TR5uH1yas/q4Cu1r0CgHb4HtBPs
         WrxggbZ/z/deEFL/lpOVe4EyDGGTlQziR5xSbMTEsB6EUcAMZTToqSwqedptaFjV3Eod
         rRX4XAgxkFSeMBaCn+GeJ1i+95Wl7x9TdCg9VHeNF+vwKdsvx8rxtzDMjpft/hPvqxOo
         MaezD1oeWoYzf/JuFntrGSR4TBCtyQt8uwlTHzO8ER+8oSGqsEVKCR41DqqPmZdvW7d0
         EPZvAAS2MJFcorhfHPn/ajhecjuGN2+X5l54aE3Ie0Xb0w8xuvcNWeSIeIhR6cHEo1u1
         ityg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718129140; x=1718733940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUohe5I/U8iYfjovsxU/qvXwQ8UTe5baG/sBR7a+0qU=;
        b=BLZP35EndrtAh6PGSHwJT+mYL/c9INpL1pb9jKzOtaEr4er1mguwBRCHhJD3ueUkg5
         H3dGSz2KzzNMYWuVay1Rk+A2zW1Y7e5YFWLJThWymigqxM56CpjqBOxfxZowoOrAcGRn
         ouLpOGWe5xvpIxXwHAlMs/4mFwu3FyBicpfD4II/IJDYm5h+BuMaWYL1LZ52vGEF8ntO
         LUYPDonGvJGlAVR9OBjfW4BNOOzBZUgIDjh8jwuHO0T2khptO0lGxOgL1ZWOj/wNCV5o
         mzWnj+eCF3YpDdvixezsNQE67ZEHyXIq3KnPOy1G1mZ5eWhqT6DgS96MALSEw/Ba2ezM
         Yuuw==
X-Forwarded-Encrypted: i=1; AJvYcCX1RV7zOxIp8rwA89JGmwbpJ4tVtXMpp1Rmhm8ZeRsVa+aJBB/Ko1FsPBsKyf6F21Pocv+PN9IfsttgSmNeg6NkuOw9ckVtE9CcvxEDL2wyZCr3dVI8oEIZApuFJqFttqa4Gs4tvpO8t0QLNamOLdbNNZn1O1E=
X-Gm-Message-State: AOJu0YzHJsLHxIRbVVir1MJ0FrdN67p76Ioo+2nRM//7uYMs3kmhDZIl
	ZNomXkKSMZtgJU8cv+y4Ay6cmFAtPBXhqto/+p99QA+rfuBZOOse
X-Google-Smtp-Source: AGHT+IE2qPhlRsFkwXDOcSqAcYHE6TUAlN0piNN/sxB8v9XWqfk1bNSlBYNdXHQRf5+2ZR64HQJHIA==
X-Received: by 2002:a05:6512:70c:b0:52c:8a4b:f972 with SMTP id 2adb3069b0e04-52c8a4bfb11mr3484974e87.34.1718129140051;
        Tue, 11 Jun 2024 11:05:40 -0700 (PDT)
Received: from pc636 (host-90-233-193-23.mobileonline.telia.com. [90.233.193.23])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433e22bsm2217192e87.287.2024.06.11.11.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:05:39 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 11 Jun 2024 20:05:37 +0200
To: Shubhang Kaushik OS <Shubhang@os.amperecomputing.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	"ampere-linux-kernel@lists.amperecomputing.com" <ampere-linux-kernel@lists.amperecomputing.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"cl@linux.com" <cl@linux.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>
Subject: Re: [PATCH v4] vmalloc: Modify the alloc_vmap_area() error message
 for better diagnostics
Message-ID: <ZmiR8STlyXEahzqy@pc636>
References: <MN2PR01MB59025CC02D1D29516527A693F5C62@MN2PR01MB5902.prod.exchangelabs.com>
 <ZmgiPTHGy-kHNe5x@pc636>
 <CH2PR01MB58942C3696E4FD0181782F4DF5C72@CH2PR01MB5894.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR01MB58942C3696E4FD0181782F4DF5C72@CH2PR01MB5894.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_110543_664104_1BAAFDB6 
X-CRM114-Status: GOOD (  10.88  )
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

>
> This is intentional.  When 'addr' equals 'vend' the overflow path is triggered, but then the 'vstart' and 'vend'
> values are not carried in the overflow path - making them point to no address. That is the reason 'addr' is used
> in the warning message to specify the restrictive range - that gets assigned to 'va_start' and 'va_end' in the ideal case.
> 
What do you mean when you say:
"but then the 'vstart' and 'vend' values are not carried in the overflow path - making them point to no address."

From your commit message: "With the update, the output gets modified to
include the function parameters along with the start and end of the virtual
memory range allowed."

i see that you would like to print an allowed range. Thus an allowed
range is specified by "vstart" and "vend", i.e.:


      vstart  vend
<-------|------|------> vmap spase

an allocation must be served between "vstart" and "vend". So, according to
your commit message that range should be printed in case of error.

Now you print, "vend" address and "vend + size" one. I do not follow why
you need it. Could you please explain?

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
