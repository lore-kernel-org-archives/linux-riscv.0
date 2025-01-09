Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B48E77199
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jt2QjcPVtafwMdo+WAu7zKFmdumguuv3psVrdP+hhQ=; b=rYFfwDMrcGOt42
	moV9PLFigumVTe5qaYX7xKIel8YKF8PRPp43V8af2exrvUzmtpbNKuVuxKgzs/ag0rh0dzyyhYxtE
	alDV0G7YzoHmyGbrcOWFGroAqFVDQqACiGNp6cigXBWItoESQIUG4+ZRMWWGHtwWpPqEHjdgmdW9r
	kcEv8at/J30fSvAM2MKmg603ntOC3/+P84E4VO5vHW0MS6U0+3+qQ3314GVd7jDwUq+O/qmZapLkL
	k9jPLVr0kOGg2R3/fE3u2OmKXodnwqQc3OMSRFaRF7nXcD+ZWJsk5gIwKace0w288ThL4ImICFmGK
	nWy3Zc4IHqjvSqiODWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVukI-0000000CX36-2X0t;
	Thu, 09 Jan 2025 15:46:54 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuj3-0000000CWf4-3fMw
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 15:45:39 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7231e2ac9e4so80756a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 07:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1736437536; x=1737042336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
        b=V+xIZFRRXjjkjXNKCh/p6QquS7JPNASpAxp2k58+8qW6xMRQDkpnj/0zlMvpzyjPZU
         jaGBWj9HbUvA2uDBQ6XsxiHJtOfikcZRTYbIIBE9i2OO011yRosjTs+oGDHxEs3PsjAS
         zIoAjOeY8/Wh94XNNfFQipFw3jwA53msoo7BxQsStsj3FSeGxDL0Die/gaehMiS6gUgU
         ZGeBBtzDxtoYT9xQQSJcxLcjF5lhTtF7Di+8FdbFdnQaLnQcr7YU19iRV+1EbOvECIpB
         IMb49r4V3kPn/cIMkuzrvg10ciYGYtQJBimtCVZfEEEmtcIBLOMjF+niuMRV2+Ou72iK
         43bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437536; x=1737042336;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
        b=qNSUFZoxLHIpicuoVjOH4MEmvr3obazNnBwTh2EKg3oacOnsi7H+URVfJ9iLjAS84d
         U6LUrjcy6Y9dBEIS4tSJ+BuE+AU/L2bKdQt+fa1iZ1IBSmlRHP/6aZDAn7VcxIq6EWYe
         +0yN6C6IBpzAJyVgBWvQNoGD+RjQkNc4YQr1RydI/qT7r9PmvcIa1vPiOkqhdCg/XzzZ
         qboXsa2nTzv390IkMpyP0FTHUKnOccmQRgKqk/tzjNXDl42z3tvAdv0G8VJ4tEBiOTQU
         srOutxo69Bot+/jOkT1Y52T9GV1vMFUSS+U7Et02t3JxJsdI/kyJEbR6wYcpYqeIS/dM
         +xKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHzhyMb3Y8Vmvj5sb9qCjAQ+AuZ9DFI0f8C40f9xw+v4Q/toi8Zo/OfUjvTlHsRec+3uwkiyAuWCKAbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5tCZ3wNgJqG9qB8nUrOD94Ku0J6ATQOug9dlHFIRhIGydCEqK
	gViIt8wm4WoME3O8Kzr8c9jia1jS6Z3FF1sMFL3CW8fMXuhozUtWqvspxRcw2KU=
X-Gm-Gg: ASbGncvDWBq84Go1mL9jdq8RdEHKkwJk7YowbwZHxmxJZdOn5/RtkYTOSjFz1/86EvT
	Ns0qWKrSf69xUecLEN4pRY2CH54+Ju0v86mv7gXkq0ht9c60IcgDT7eU1L1GreRn4HQbqt2kt/a
	P5IwXPmgciKCY6KfZ5A1ZHvM2VLlLrNuzGCcc2VsX3py6+lgJBxifYqmbqkVP9/R5E9093Tenea
	tvoHWHMeAzXWOl5fs0qNmeoVNpVhNljtMbWIt8OT21+noDDju2up+BXN8uM
X-Google-Smtp-Source: AGHT+IHELUnxP9ZvL+e2Ztemz39I9ORoPYZLTVwEa+XG73J5uz7w7yM0cuXu9KZqTaUsGk+1/+jmGA==
X-Received: by 2002:a05:6830:6610:b0:716:a95d:9ef with SMTP id 46e09a7af769-721e2e000d6mr4949630a34.2.1736437534534;
        Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:9076:47eb:1e0a:16fb])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882625f0esm386258eaf.9.2025.01.09.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Date: Thu, 9 Jan 2025 09:45:27 -0600
From: Corey Minyard <corey@minyard.net>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org,
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
	io-uring@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
Message-ID: <Z3_vF3I453flXoZv@mail.minyard.net>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_074538_128269_049F80AD 
X-CRM114-Status: GOOD (  13.06  )
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
Reply-To: corey@minyard.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2025 at 02:16:39PM +0100, Joel Granados wrote:
> Add the const qualifier to all the ctl_tables in the tree except the
> ones in ./net dir. The "net" sysctl code is special as it modifies the
> arrays before passing it on to the registration function.
> 
...
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
> index 941d2dcc8c9d..de84f59468a9 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -650,7 +650,7 @@ static struct ipmi_smi_watcher smi_watcher = {
>  #ifdef CONFIG_PROC_FS
>  #include <linux/sysctl.h>
>  
> -static struct ctl_table ipmi_table[] = {
> +static const struct ctl_table ipmi_table[] = {
>  	{ .procname	= "poweroff_powercycle",
>  	  .data		= &poweroff_powercycle,
>  	  .maxlen	= sizeof(poweroff_powercycle),

For the IPMI portion:

Acked-by: Corey Minyard <cminyard@mvista.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
