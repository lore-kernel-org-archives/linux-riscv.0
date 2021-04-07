Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4502C433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 16:29:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48362611CC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 16:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48362611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DB7fqCJ7wNmekww6jut3H+eWCFmlIH3pkcJtmeVVJUQ=; b=RtWXZptuUFS0sNRmmGIa7e9KY
	XgvVz8dcPpIwvf38qxWtEv5A6E+C66jAMqz1TDJwK0souQxGYsR0T2aG3mxrEHao/5tUHe8+B35KI
	IluUnb/DFPtshlRH8jVg4u3TAYIvcptnTReN0SWc1QwwXeiBsKV4OQpTPQcRPwgzXpUPRuEtAvpFE
	naHl2ChfkmqMS/OEISW0TOxelWlhZYXuIxibMhB7CEmmWYLkQI9S2Qvwx3nS7EkB9BTsu6wp6SbIF
	nsCMoztUASWNKl+XSsEA8UyUlQe49Z5Z1IxKRvIhAJ6Cqzg1+7RnJhCL7PZ3QsFFO0liUtli1QEvM
	ERmuu2fJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUB3f-005TMS-Gy; Wed, 07 Apr 2021 16:29:35 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUB3a-005TKe-P3
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 16:29:32 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so18621347otq.8
 for <linux-riscv@lists.infradead.org>; Wed, 07 Apr 2021 09:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ca6aNPrlJllDN40VkjZY0A4uBR3pGPFR8vmQTnzwuF8=;
 b=i9J810heXTXMlwaAjz8RAzM21eahV5LEhK2+Rm9QQe1+o4FMURG3j37aWN6NSMa/41
 9CuDD1ouWRuWe7DUzVvmhSwkwUPozawyG9cu88CKwcV1HZL1OC7fce7XAdXoRJAgZZzn
 sjzF6Q9W4nRjTpLaYCqREac9lQM5JiLdlmc5RVuA2yXrge3Cdu61p0AhEfJZng/L95qS
 TzwnAwZAP9f+a972uvlJQjQt8/sI9O80puU8TUm77KFXEt6s/Y9FLLWZS+9DjlIANyME
 kXOHPgpQ+I96RVXRrwTZQGMO+24r5B3W+O3ArOpHwOMD7mtB27ezsy5gFohIfjlOu1kh
 IBBg==
X-Gm-Message-State: AOAM532ZWP4w22mNzFjTzIq8z68o2cvGU7RYcEjWCI1qdgmv67meWMhr
 rbTOePtM7ffAl49ZU1Z0IQ==
X-Google-Smtp-Source: ABdhPJyUJ0FutOkRHX4vlvMDlp8OLzozptHzeFdA22UUVXU3rpXWjB9yj4eW8vQFBqlU93dUi76XrA==
X-Received: by 2002:a9d:6d87:: with SMTP id x7mr3667610otp.250.1617812969004; 
 Wed, 07 Apr 2021 09:29:29 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 24sm4337505oij.58.2021.04.07.09.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 09:29:28 -0700 (PDT)
Received: (nullmailer pid 3856511 invoked by uid 1000);
 Wed, 07 Apr 2021 16:29:27 -0000
Date: Wed, 7 Apr 2021 11:29:27 -0500
From: Rob Herring <robh@kernel.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] RISC-V: Add kexec/kdump support
Message-ID: <20210407162927.GA3836121@robh.at.kernel.org>
References: <20210405085712.1953848-1-mick@ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210405085712.1953848-1-mick@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_172930_924758_691C0DC2 
X-CRM114-Status: GOOD (  14.30  )
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

On Mon, Apr 05, 2021 at 11:57:07AM +0300, Nick Kossifidis wrote:
> This patch series adds kexec/kdump and crash kernel
> support on RISC-V. For testing the patches a patched
> version of kexec-tools is needed (still a work in
> progress) which can be found at:
> 
> https://riscv.ics.forth.gr/kexec-tools-patched.tar.xz
> 
> v3:
>  * Rebase on newer kernel tree
>  * Minor cleanups
>  * Split UAPI changes to a separate patch
>  * Improve / cleanup init_resources
>  * Resolve Palmer's comments
> 
> v2:
>  * Rebase on newer kernel tree
>  * Minor cleanups
>  * Properly populate the ioresources tre, so that it
>    can be used later on for implementing strict /dev/mem
>  * Use linux,usable-memory on /memory instead of a new binding

Where? In any case, that's not going to work well with EFI support 
assuming like arm64, 'memory' is passed in UEFI structures instead of 
DT. That's why there's now a /chosen linux,usable-memory-ranges 
property. 

Isn't the preferred kexec interface the file based interface? I'd 
expect a new arch to only support that. And there's common kexec DT 
handling for that pending for 5.13.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
