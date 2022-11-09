Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB796C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIoWI5P+l8IJQYQGUHaw0bFz2uWlTKELrktd2dncYFo=; b=FdqoH+AX9kOo4F
	2SL5G3NeTGBfUJHyal3n0WvJURnsEiF70vgFmNWNEKe2Vmt0nI5Jqqmuf0yD0W+DtpAQBrKbhndjE
	rm2g4qhM5/lMNiq4SS8MyNcM0yQFOrBN2tPUOUVxE8emgRrUBFhwRkl4BwPaSu3CacA025dyIcd6D
	4Od3DtXxl+I54Le2TQmTNCaue5/42Aasq/8ainHkqKFCrZZQp7HXiwNkFHpMy8eDpgrynrdFCGGPc
	USNPglK5yRN025yzhWrG56jPtwHU9iqbaqyODgJTytEPSxdZ6HjAyq1YVWHT7km0jidkpbA4GCQ6+
	3IpHwIrx50QWpRyqKlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslLh-00DtRj-5w; Wed, 09 Nov 2022 13:42:37 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oslLe-00DtL1-Jk; Wed, 09 Nov 2022 13:42:35 +0000
Received: by mail-lf1-x131.google.com with SMTP id g12so25654881lfh.3;
        Wed, 09 Nov 2022 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldyqt2mSXXrEosQOvqIK5dNWaqrseYntTJhs+D88oGk=;
        b=ex9WzbT962IPus2/cssqm29tzXLBUJLZc40PlJ+tkwm69kc1nFLEifs9mte7yOWvyW
         ihAGElQGpsU8v56l7Prjuaf4i7o5sSuNA77p5+7QCYEWW0zyvUVIJ86otEj69E+RxqNN
         NVZKCiYAJld1YSIWXqJZCHkcGxaS5Vo84LWazoT1VdOdHbaAhzKXLCg96vzmBsa9w0yc
         UPFrhFixcjBUbOV/Jt1BOYPZoZzNCjiHb7/9W3ezznIAIFsl5M8w+/icOYyV+7aJXx1Z
         /A728BlfGK/mf4GU3fqioXMQlIuNIouIe8uRrExFp+PF3rycwcxecboLyaumB/egy/sB
         SFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldyqt2mSXXrEosQOvqIK5dNWaqrseYntTJhs+D88oGk=;
        b=0RY9LBwXCRzwEBgj4eyQFXYQCL5IvfvqfncKZiWXTdTz5zt3jCZuWA7fe7Ya5W0HLB
         tTMSYsRg7SKlyjgzuMiqJRi9KAk9HWpjWF0iMIn7q3B1yEdT1oP0U+HcKiiNTWsdC7NQ
         K81dizSbtdpXNKYeon1XM7O+RY6FNMVFw3Ntw9yBhudveZBXLpOuem2b0T2Aewk8DGvm
         iD20dnwbnGqSZQ8aVpntFt4TmECqtxdXFtGxXU1x7R0uOnAyTggbcxEWUjcgQflI6BAr
         IG4fCZz0fV3drGI9pLqVWpZmSOzlPZabRuG4T6xXMh1YbzfyZG1vSHDJlN6PJzjHj1DC
         ZZDQ==
X-Gm-Message-State: ACrzQf1OL9vN9q/2R8yUH6B4Itbmc6UDQHUVB+Awi1sjuIhk2FwzzLjd
	AUYblyywgGVqIn4ONUyaCOc=
X-Google-Smtp-Source: AMsMyM6vfh+OOlUal4C5kj/cADC/0nT85QcsS9k8WHwaskcuhklUHHIcAci46UikXwl+BVKq0QM+hQ==
X-Received: by 2002:ac2:5c4e:0:b0:4ab:db5d:10ee with SMTP id s14-20020ac25c4e000000b004abdb5d10eemr20180736lfp.142.1668001348804;
        Wed, 09 Nov 2022 05:42:28 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id du9-20020a056512298900b0049465afdd38sm2232452lfb.108.2022.11.09.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 05:42:27 -0800 (PST)
Date: Wed, 9 Nov 2022 16:42:27 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC  4/9] RISC-V: KVM: Improve privilege mode filtering for perf
Message-ID: <Y2uuQ4wH4dU98K2b@curiosity>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718170205.2972215-5-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_054234_709157_CAE1458A 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Atish,

> Currently, the host driver doesn't have any method to identify if the
> requested perf event is from kvm or bare metal. As KVM runs in HS
> mode, there are no separate hypervisor privilege mode to distinguish
> between the attributes for guest/host.
> 
> Improve the privilege mode filtering by using the event specific
> config1 field.

... [snip]

> +static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> +{
> +	unsigned long cflags = 0;
> +	bool guest_events = false;
> +
> +	if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
> +		guest_events = true;
> +	if (event->attr.exclude_kernel)
> +		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;

IIUC we should inhibit host counting if we want guest events:
		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_SINH : SBI_PMU_CFG_FLAG_SET_VSINH;

> +	if (event->attr.exclude_user)
> +		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;

Same here.

> +	if (guest_events && event->attr.exclude_hv)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_host)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_guest)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
> +
> +	return cflags;
> +}

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
