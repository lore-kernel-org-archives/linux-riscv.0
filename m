Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9098C25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 14:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ltFbP6YjPN1hTSJyXhE+7EGkiZPUk2U0QitU5IjHdY=; b=iqxzfMpQtnzyFs
	hcjYHJlGJevIMjPaPRN9D5xtmPaD4FIT84hzh8Xh1aEEVeRjZ7qxmW4MCzWOJOeqwphz7qqYrIxYl
	MzrJxiHyN09MF4/cQ2wkK6aQ9x1kZaztFsmboGyDAuOWZs5dHXB/Tz6IkenTWdS6N2SCVBxkgk0pC
	7OJJ+Z+AyLbZzWiFnBjW/FRuwmp2UgJbGVzLXrS7reW1MF/uY5929zS9/mven63n/w7x7KVLyGBxd
	QKp4uizAnAlkC/g9fzbOd15UwXYb3bhiHfmYTHn9tiNMu0c1H1JcImTzYfcqVVw6wd9N1biluweBm
	RxksS1tL4QDdtArpThLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Fru-00000001rGR-1DZp;
	Wed, 15 May 2024 14:44:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Frq-00000001rE4-3rC3
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 14:44:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42016c8daa7so22264875e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715784268; x=1716389068; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMIK0NQemQWzzjDGIwmh1trz/io3IdAU24yfPO3k8fI=;
        b=lRkXOa354uw0rmNa2ahw/riuVKc9RNUzrWKABrBCasaQshnpjVMOQtG3KTwT+VAJcE
         ShSZnrd/u8st55/Vz3L6B9s+cOoPHdB9DUnlEX8NH9aiwOJE0MCmIRBOGV6ye/bb5OMM
         4N49Phygbvs63CKqpN5diimVD8Ma0Ud40yQYYebGhuJ0Je+UN2jqdPKoIvSVbERUUruF
         xgr+ivS8D4DYBaeGJY89VCdxXVKamCM7XTgADWp+eyXVo++57hvR5f4hM6jztRJrdFyy
         n3u1qtfzjAfYzvchRGvcBS0grAyECEcR9fZtviQ9zkj/ZQ/sP3SGZwP3zuQAughw2UuJ
         deQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715784268; x=1716389068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMIK0NQemQWzzjDGIwmh1trz/io3IdAU24yfPO3k8fI=;
        b=j6haKW3T92W13PDxSHV9lPwBX5mi82sdCeIrf/wz1YmMQbug2Xr6vkROb+RAeT+qIF
         yJkUDvRT53z4dt6uEWvwwSpR3E4h/QecPzROxc2VVFgAplU4FcbsLk0kLJEovw8fIRdX
         m+y8pyTNBRCAUUmVRt8LVSQg9hkLLlPsj0SlhmHguLb9PeOuvMiCaKGAQoRWBT3npFv+
         DkiXoM8wBXOgdWicvVcL7Ltq1LAmuV8jSOwol9D2v4RopAbFQ0JrX6rysT4JuPayN8XA
         f6e/cWVRihMJKtn+MNxUxCjspaxHTiD92yA+T3pDd0f8TIu+mhhYiLKNDHoWwxBxghmt
         P6TQ==
X-Gm-Message-State: AOJu0Yy5OvGWOt9YkBlIrRZNzlFGubeJs7bJZ+OjHwOLwv6zWq8gDjqn
	d/n60sHSqhqOhYQMAwxFmulRBziGCjXcH74HIbaOGJJnaBq16u2PJtn3W+/kdMg=
X-Google-Smtp-Source: AGHT+IHU0jEE+jRRMoojb2vcpjR5IdcbD+9YnNlRVXV0c5cOfgwkSmGkSAgkG/zEMA1irkOlP7fcog==
X-Received: by 2002:a05:600c:3b26:b0:41c:73d:62fe with SMTP id 5b1f17b1804b1-41fead7a82emr94966095e9.41.1715784268570;
        Wed, 15 May 2024 07:44:28 -0700 (PDT)
Received: from localhost (cst2-173-78.cust.vodafone.cz. [31.30.173.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee9673sm237195135e9.33.2024.05.15.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:44:28 -0700 (PDT)
Date: Wed, 15 May 2024 16:44:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com, 
	apatel@ventanamicro.com, greentime.hu@sifive.com, vincent.chen@sifive.com
Subject: Re: [kvmtool PATCH v2 1/1] riscv: Fix the hart bit setting of AIA
Message-ID: <20240515-354702b661f7e6351b92cb21@orel>
References: <20240515091902.28368-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515091902.28368-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_074431_002791_8FF34621 
X-CRM114-Status: GOOD (  21.35  )
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

On Wed, May 15, 2024 at 05:19:02PM GMT, Yong-Xuan Wang wrote:
> In AIA spec, each hart (or each hart within a group) has a unique hart
> number to locate the memory pages of interrupt files in the address
> space. The number of bits required to represent any hart number is equal
> to ceil(log2(hmax + 1)), where hmax is the largest hart number among
> groups.
> 
> However, if the largest hart number among groups is a power of 2, QEMU
> will pass an inaccurate hart-index-bit setting to Linux. For example, when
> the guest OS has 4 harts, only ceil(log2(3 + 1)) = 2 bits are sufficient
> to represent 4 harts, but we passes 3 to Linux. The code needs to be
> updated to ensure accurate hart-index-bit settings.
> 
> Additionally, a Linux patch[1] is necessary to correctly recover the hart
> index when the guest OS has only 1 hart, where the hart-index-bit is 0.
> 
> [1] https://lore.kernel.org/lkml/20240415064905.25184-1-yongxuan.wang@sifive.com/t/
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
> Changelog
> v2:
> - update commit message
> ---
>  riscv/aia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/riscv/aia.c b/riscv/aia.c
> index fe9399a8ffc1..21d9704145d0 100644
> --- a/riscv/aia.c
> +++ b/riscv/aia.c
> @@ -164,7 +164,7 @@ static int aia__init(struct kvm *kvm)
>  	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_nr_sources_attr);
>  	if (ret)
>  		return ret;
> -	aia_hart_bits = fls_long(kvm->nrcpus);
> +	aia_hart_bits = fls_long(kvm->nrcpus - 1);
>  	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_hart_bits_attr);
>  	if (ret)
>  		return ret;
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
