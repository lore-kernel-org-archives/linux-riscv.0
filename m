Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF033C433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 01:02:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BD2922CA0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 01:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ls69UP/x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YzaOgEgb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BD2922CA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SB7zbWmoMdqTa1Fqcuw7Z24myiPRZF/hL/Xw6WHSIX8=; b=ls69UP/xwMgAGhMgLMOJlAL4/
	ZTg9lQN+l6dhzHMSqigDekQe0pAC3xLu/xbYekLdQIBY1fvWoVli4FnKJNs2LBg+0JE7qQjTqUVDr
	WVBpWy5xM/zwQMoTLhTsMHMYCQCCdSFCBgWlvQn5bGMDYSDQYoQIb7urTn9wViUVo37RWo7DRYyLs
	i9NK3Em+aldptwFaaL7OBUaQM+gflPXAw06lvTSVa3+2eqDMomH3aKoE7MWv1iLuNF3y1Evq8bo77
	NtqcFBhXA4PN58IBq+dsjTlSGNpH3BpGRkXnpTOA2gLuXc5OZVjJEfGkPzghZPvkAS7uKuW71FJlp
	mqatxMbOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxKCF-0006xL-MT; Mon, 20 Jul 2020 01:02:23 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxKCC-0006wm-5C
 for linux-riscv@lists.infradead.org; Mon, 20 Jul 2020 01:02:20 +0000
Received: by mail-pg1-x544.google.com with SMTP id l63so9504277pge.12
 for <linux-riscv@lists.infradead.org>; Sun, 19 Jul 2020 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ca542pBq1PPBrcky+qLS22aaKt8lZZIIoQ77Avc1ldc=;
 b=YzaOgEgbtBPVqDtWpGiyWNmcJ66bxJmMjPQMr3UnEZOhDky155ZHGk9RRisYxhz/I5
 97TKRnm1fxj3tsqkU8Izyt9H/tXdMDUzVeIf99ZqLAr7IU18j4BKDOeHR3+r2oZKPELm
 /eHC+MWkWbdfhoy+wgkea6V8T0X5IDrP3NQiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ca542pBq1PPBrcky+qLS22aaKt8lZZIIoQ77Avc1ldc=;
 b=HXoeBH0Z6qqVRfy/4HN5ixM8MyCm23434V0ESVZqacBogNHRuTUIvoJtmMhnDTydIm
 KwNgM+U6+DG2T8m81DLGUX/epCoHFuhw+XAPUrMjX+/JsabMe+HpLAXcIRnksqgoyF+U
 d0GsYsjmK/GzYJFDLHdLavOcwMkiqfZkBDrioIkX9oAvZZWzYzguqAdq3EGTlZtCri9F
 1Gfe5Foi2aOROaVW/rbu9AZCWxh+F0/DDiVPtzzM6APCILxiqGYWCGb0PCXhleP/mEbk
 DQn5YwpKooWkmurE+YMuopBlv5+E/IAWHZGp+bGHE7AlsK8ZNa3HVLU7p83VZ0yq9YxX
 lGNg==
X-Gm-Message-State: AOAM533BTjQJmEMKMo0aGpZeXKv6IcN+9fpxnY8ahoJEcKXUuwBwhxGz
 PnvkR25uV82Pn5vmgqFg3AtVVw==
X-Google-Smtp-Source: ABdhPJx2hZirPwk7iOr7nJlIJXs1ZDJxJ6ysBFW4SaOThhgRb0LDF31Sn3KaNJMSoLmldg34RyThAQ==
X-Received: by 2002:a63:cb03:: with SMTP id p3mr16640113pgg.444.1595206936363; 
 Sun, 19 Jul 2020 18:02:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r2sm14441026pfh.106.2020.07.19.18.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 18:02:15 -0700 (PDT)
Date: Sun, 19 Jul 2020 18:02:14 -0700
From: Kees Cook <keescook@chromium.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: Re: [PATCH] docs: process/index.rst: Fix reference to nonexistent
 document
Message-ID: <202007191802.E3B03B06B0@keescook>
References: <20200718165107.625847-1-dwlsalmeida@gmail.com>
 <20200718165107.625847-5-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718165107.625847-5-dwlsalmeida@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_210220_236282_AF1AE18C 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, steve@sk2.org, corbet@lwn.net,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tyhicks@canonical.com,
 clang-built-linux@googlegroups.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, jkosina@suse.cz, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jul 18, 2020 at 01:50:59PM -0300, Daniel W. S. Almeida wrote:
> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Fix the following warning:
> 
> WARNING: toctree contains reference to nonexistent document
> 'process/unaligned-memory-access'
> 
> The path to the document was wrong.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
