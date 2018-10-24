Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E62ECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 22:06:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419262075D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 22:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="olDQjSqt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="W3I0iUFh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419262075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=hH5jCZWnSf0dC1xtIP+Uk82BrpWEUfnuT97oOs7nXvI=; b=olDQjSqtsgqVBf7RQ85iPPYXA
	cszEazjOU5jkIGVDpICvMxCp4zX2O3RRS576PVFGYcpdb1F5NJUn83SGKShg/ah9JPyynpXJz6Od6
	nTX55wMM0XJNjNBFFe/KuFlLAvKUfWvGvU/uV2PcbJI7Wqu/31iWJ8oTjvgJe3iinCMvwTopX051P
	MdPecXQ0Yb9sK7hDa5kSS13W33QlPVpapuSf7jJSaEaxQ8IYw7XmjsnysNOwUtDpI6MfYUuL1UF6G
	QuCaOGGy1DV+x5i+bdFiBp08GjbMWrbD+MqQWhYzU7TLgkxnyGwST19Cg4sTK6Pz27bnahjAXO411
	12d6VaHCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFRHq-0001Sj-PI; Wed, 24 Oct 2018 22:05:58 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFRHn-0001Rt-QX
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 22:05:57 +0000
Received: by mail-pl1-x641.google.com with SMTP id p5-v6so2868784plq.8
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 15:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1kBphnAyZczCooAon+quSbWP6ohQnb3omfdsMC00wpI=;
 b=W3I0iUFhNFwfbpq1I1wb8DlCQjefJOEGhHXtQI4fjzl4DtjuWpeA0LSATPwwslKq8r
 JVmP5EkjXvmisE/74lJNFSQRfvAPDada0U/MMCdn0tmqJkp+VKB5Bw0fgsDnN7hDt/uk
 7kTDHLfUtdsP3J0gxxujBAkeidKKqTXjTzXqBTXNyAiPlJiMxq+2r9yPUTXv+R2gxkhN
 gNmFQXPA1VaSFrZITtAAG12drK2uoZyv2J46gq+Bz+47pJu9fAzgmOa4Zw5yMHGWfWfv
 WL/378FUnX5BNI/Ms1E9j1BprzhVD+hiErwqtZRH0EmlYHc1lbDecpLQ7E2iZyKXgzd1
 LoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1kBphnAyZczCooAon+quSbWP6ohQnb3omfdsMC00wpI=;
 b=ULuXkKNNCyjq0heT7Nh9Ux3WeH0msCZg77nZMZUMP4f7mrnGLf2hyxc49BjCHjrFuU
 DOz0Ar03shvhkg/eX/FlN94rcOCh2vk6nW5GjzQ9IRsaYSZZ8aXvnz1EtGmW4IR7Zlvb
 9Ka3VJJnq7MzYPmpvJm0xs2aNwLIYmicdbRIS+YhUt1XtXEm+pF/XbJttDWvHHfBLlC+
 aoPusbcR62o7SYKhXH+JzwkYuZCD6B10+QwKOdewiWWetcnVOWEzLQ0VySLJKFdYnokM
 h3/EheK14fxHxvqonGR6HVco7tjU25Go7LtrPyfZRBgm2zXmLnor/FJ4JAu+tHu8k11R
 oVzg==
X-Gm-Message-State: AGRZ1gLWXzmiQEyynQXrx9hrtcwaAWQuFcdxARZf9aeJ40fH5PHpTU4M
 Vf9TAs9eEkfyrZYH9Gt9q6FjiWecn+c=
X-Google-Smtp-Source: AJdET5di/QtUcEkJAWeaqcXQd8DTAU6jIbsy1GkOcB7ONIvhaPQBlkgtTc4UB4Edmnf+tiuO3MiLqg==
X-Received: by 2002:a17:902:a9cb:: with SMTP id
 b11-v6mr4008287plr.219.1540418744758; 
 Wed, 24 Oct 2018 15:05:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m18-v6sm7527666pfk.149.2018.10.24.15.05.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 15:05:43 -0700 (PDT)
Date: Wed, 24 Oct 2018 15:05:43 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Oct 2018 14:01:56 PDT (-0700)
Subject: Re: [PATCH] RISC-V: properly determine hardware caps
In-Reply-To: <mvmftwxruas.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-fe1ddf75-4f79-4ffa-8017-d9ddae5ef503@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_150555_869620_BE3A5A98 
X-CRM114-Status: GOOD (  15.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024220543.SSJb2X6ztk6iTeG0CN1zPHHEcfLq-jFlQPOuFEC9K60@z>

On Tue, 23 Oct 2018 00:33:47 PDT (-0700), schwab@suse.de wrote:
> On the Hifive-U platform, cpu 0 is a masked cpu with less capabilities
> than the other cpus.  Ignore it for the purpose of determining the
> hardware capabilities of the system.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5493f32287..0339087aa6 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,7 +28,7 @@ bool has_fpu __read_mostly;
>
>  void riscv_fill_hwcap(void)
>  {
> -	struct device_node *node;
> +	struct device_node *node = NULL;
>  	const char *isa;
>  	size_t i;
>  	static unsigned long isa2hwcap[256] = {0};
> @@ -44,9 +44,11 @@ void riscv_fill_hwcap(void)
>
>  	/*
>  	 * We don't support running Linux on hertergenous ISA systems.  For
> -	 * now, we just check the ISA of the first processor.
> +	 * now, we just check the ISA of the first "okay" processor.
>  	 */
> -	node = of_find_node_by_type(NULL, "cpu");
> +	while ((node = of_find_node_by_type(node, "cpu")))
> +		if (riscv_of_processor_hartid(node) >= 0)
> +			break;
>  	if (!node) {
>  		pr_warning("Unable to find \"cpu\" devicetree entry");
>  		return;

Thanks!  I'll add this to for-next, and if there's no other comments I'll 
include it as part of next week's PR.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
