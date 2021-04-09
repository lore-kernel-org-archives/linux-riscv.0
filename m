Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFFBC433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 03:11:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6FDA600D1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 03:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6FDA600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gYBC2zu+nO/XjZpGwvffQD1EUyUxKnGAIp9j+OVJsMg=; b=n063LcuN8vfN8LBHDHAJZw3IZ
	FBHOCp0K+QfKyD5cLTD+XtfAow2+XMmYQoACD41JbwpKZtQ1vbNgp9BE1QXtLRl5vIDA/dlaohhos
	bQBRx5/qFp85PKTfMehlbGrZeMzDSIXBqJeVxTwEeMvC7NByOHjrK3U4xoFMKw2Brw6WBL25M0tU6
	+uicj5Yfw3YpXSFSyoPnCl3xl1jerCAPUdeuYczefnLO1OAQO/84U2VgrdI74MIPeYZwfkEVEbHI0
	L7Q7erKjkt4Dp1ErjzJYVeEeMDRBh5LmQm1obh9DT/H9y1AcwW9AIrM9vkkviDnlo2pVkcnndxGQ0
	QTnOAUxKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUhXr-009nbu-JY; Fri, 09 Apr 2021 03:10:55 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUhWV-009nQx-AG
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 03:09:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id 11so3280713pfn.9
 for <linux-riscv@lists.infradead.org>; Thu, 08 Apr 2021 20:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pzLF/lHRMx9vgkoBZHdk4xI+EiBYL1/uNXhLwkRFSmM=;
 b=OeE7IznlXSfWWKdviytwQM4KbR437rKzj4xvPdc79uyd8F6aLYSHLkWOqPXFjy4EB2
 MLVDrO4ox7QQmpuK7akGQCenaMTw+6qzkwzzH3MzzPZlkTMvC+rlWdCbkkyj2Tm2iYE5
 qTfb8MSjfgJpWsFlIBS2I9A8P0/njmb4fctms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pzLF/lHRMx9vgkoBZHdk4xI+EiBYL1/uNXhLwkRFSmM=;
 b=KR8YxDw77xsmKP/OoitUsQDDm2gYtOigYRh/aMpIMzoUTSGugzy8erZlbepSZsVcO3
 BgyrwdsMk6PYNJ22S3wQFGj9TCi+qreOkV0f61ge3a+k/LAk7hza6FUAVRayYElyXWpR
 WWfMt5sdzznm//6ZYMG6ct6Tof2Q0YDpeXkSLg6bfMOeZhhkYAg02BBySfyqScMzkNeH
 YnYVLbd1gpE5KL0MGf4f72aN7U6HEbp7hD6qxswfRiVgjQuEyHyCg8og7Brm6E4Ndtch
 4q5ahyBWoJAzcfjZQAGvmp9adD1K9wLFxemxdE/YSSGuMYT08vmyvGVF55jCwgp2cG0s
 oqGw==
X-Gm-Message-State: AOAM533oiDvHiGzTtejtcqLg8QUbJm2QFQybv1jo9YkqsKJsIiHN/bx5
 3Yp2AtC9tJO0zK146wZZ42tYZw==
X-Google-Smtp-Source: ABdhPJwwy6+mv9pUNr/1qqHuXXu1m6bi5wMnUF5/No1rulmymNz/L6yikGAtpzQlqI7ckzUJ+zOkHw==
X-Received: by 2002:a65:6415:: with SMTP id a21mr10976731pgv.417.1617937769921; 
 Thu, 08 Apr 2021 20:09:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h16sm667691pfc.194.2021.04.08.20.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 20:09:29 -0700 (PDT)
Date: Thu, 8 Apr 2021 20:09:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 08/20] kbuild: riscv: use common install script
Message-ID: <202104082009.389521C4ED@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-9-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-9-gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_040944_891961_7335BD45 
X-CRM114-Status: GOOD (  10.67  )
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

On Wed, Apr 07, 2021 at 07:34:07AM +0200, Greg Kroah-Hartman wrote:
> The common scripts/install.sh script will now work for riscv, all that
> is needed is to add the compressed image type to it.  So add that file
> type check and remove the riscv-only version of the file.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
