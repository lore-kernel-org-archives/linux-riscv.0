Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D7FC433DF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 01:21:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 353102070C
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 01:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Fb00KjX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F4CXDtLy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 353102070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=17t6+VsZLjanfDDZKufGZiOza2M0o1kkVXgCVjnRSAg=; b=1Fb00KjXhp4iA3bth3m/czytd
	z2kXWgYPbWcQMd8QWMH/Z86uasTVqCwPmkj7lOeTHNIZY9byYBAZqnnnOuJG98Oo3wuTyfVXQX3uX
	2yoxfMFkMmVQrtTEzMJ7ocsrrZE0apOLvuJWzl0e8ER3SvlwaiKj/Fa5cn7hy4nxuY79a8tDq3x99
	qbyCwxr3d85SkRxW2pSV+Jd3kIEu0teqAGrdqstM1ciQGSR2SvQ4AbDt9rZa6EHlCKWzdtLBt1V7k
	wzRZbRIYJUHpt7/tq230tZuUWgXy5nQXr/VWi/yu1nl6haOo8ax2icN9wBfP5LPZitFwhmgt5Oz8D
	Dm1UB4x8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsFpK-0001xn-12; Mon, 06 Jul 2020 01:21:46 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsFpI-0001wf-1A
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 01:21:44 +0000
Received: by mail-pg1-x543.google.com with SMTP id l63so17612583pge.12
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8yvQ48jePvSkpNEOiKywOlcwgJYBDKGMGlLh7bQcbxY=;
 b=F4CXDtLy5SDTAqh+FkUui2v2kyxo6W8b0CK2JM9q/ZhluIHz4NdY3uuU/a39UbCpq9
 +mGWMUF4RxHkOMVo59KHhJI0O1d3+/IulpLFBNzxLysv74yl/AACzAi7ptOpuBxrIUBS
 yPa303MHMZuFP0EpmuF1Db9zI3LVAp0BCyIL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8yvQ48jePvSkpNEOiKywOlcwgJYBDKGMGlLh7bQcbxY=;
 b=kdfq/oKF9iMDBFQE2hSAY5MP8gZUbCCTzTpHIhb1+lIgHtfLIPQgPmVHfINpjeXF0u
 gfxhHDYcvmZ/7ssEWwP+mlvHKpcpKsSV/3iGTfLFVlwqNDSPsMneatDs/z4AUNwe2cEn
 vde/xuTJw9i4Nq1m0PqW5oujlJhKGrjep2NVVfipMkhLFYzttCJYNuOOTamM9ale15im
 ngNI4ci9uNthCmUKQVWQcIxxvx8UUiDASBOhYNUrrpUFSTRou00l2lAvSMSuXkCRscXm
 fsR0n1+WiyePXNcC047mBw0cmvBXcp4s7pFKD6f6JMHiHWF3h2JzEAlk/hwCXvAeinnE
 JxKA==
X-Gm-Message-State: AOAM532CgQzS+jyWyWGWE09YUW2veY+b9tJ/b8zfYYIVPI8vdrG/sZm5
 CIcMIW3oS2nxYaOvpDNYWwZ/HA==
X-Google-Smtp-Source: ABdhPJw2aS5EG4tZqSfuBN9OitoGgrKm2rWv1SK6aPwvfZgPjFkoOEENMcwFcvlj4KcxXQ5msr5oNg==
X-Received: by 2002:a62:7f55:: with SMTP id a82mr33627421pfd.61.1593998501873; 
 Sun, 05 Jul 2020 18:21:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c15sm17344475pgb.4.2020.07.05.18.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:21:41 -0700 (PDT)
Date: Sun, 5 Jul 2020 18:21:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [RFC PATCH] riscv: enable per-task stack canaries
Message-ID: <202007051820.DABE7F87D7@keescook>
References: <1593958397-62466-1-git-send-email-guoren@kernel.org>
 <202007051336.C9EA0ECF65@keescook>
 <CAJF2gTR5Fc1wpjr1ZYZikS=hCP9rbjJVsH9b-z2nBxbBcfBoCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTR5Fc1wpjr1ZYZikS=hCP9rbjJVsH9b-z2nBxbBcfBoCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_212144_095871_60ED39DE 
X-CRM114-Status: UNSURE (   7.67  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 06, 2020 at 09:01:51AM +0800, Guo Ren wrote:
> Yeah! :) I just want to show you, how about the format: use tp in gpr
> to do that. The format is similar to arm64.
> 
> tp is the task_struct point in riscv.

Sounds good to me, yes. Thanks! Is there anyone looking at the GCC and
Clang sides of this?

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
