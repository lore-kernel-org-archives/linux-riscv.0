Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503EFC9832A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YELyPG00TipxWQlAYfkZfpOnZAAnGMKnICJ/s72sUnQ=; b=UMg/Z8pjbqtmkO
	/jwqlmtOGHM86tO8Q8tBgzNlbk5eG4rQ1gCsmBL55QfRxqAVABWDyqXZYY1W1fQeoOb1uPjLKLx3h
	+xR6YicllOKm5rkphtV2HvZ3JyvkSoM//qXYvC0X/8m/DEJcTMIXIoe3dU0S6YyJY/Qwi278r7SWS
	PkjZvdn4JVdXEflt1zc9QwLKQQ0Qlww3tOc5jaqW8NC+NyW7nmcpr3SEJYzgDtfLWdnsjUt1v5GDc
	5RH8Wlwzi+slz3QxH9dzpDIrhjZApaL41RngiCd6opv7NiIjNZcVR/h3ilA2UEx/iewshdtKlC5iG
	N71w7dgkFquFVpHwvpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaDr-00000003zYS-1vHa;
	Tue, 29 Sep 2026 15:58:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaDp-00000003zXi-2vsW
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 15:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=; b=XgCKIIE8p5VUyE4aOMC71ALpfG
	0ccG2Yn9sj7sugTUUAbK7BxPuuVFIhKEf9uLipOFEPk1tDK5wZSzymVXF8abs0kQCGxekIHiUClHy
	qHxJLdyTRZJQH783+/4YLRQiQkAOeSaOihW1NiftLF6bi9i0m3G/djYLs1CglpBm4/szdQ8ApTg/1
	jY6Hyh/kgThkqvKgZk+SCMGb9XgRwUOxvy1EOHmo6VNr5vKPYrx3Mm1O2ydn2VfvBgzeFaCQo/xHR
	hXk4tT8OxzYVzKREwZgSKNUsTsPCayWG0VPb5qp7DW4OjFyl8xFloxJvS08JuHUWfmN+eVj4xMkKO
	TZRAmehQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBaDl-00000002p7a-2BJ7
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 15:58:24 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3931so33268295e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697499; x=1791302299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=WyeQ18zT+sX1yxCCH++cYyWkzgLUvgfmuzud5LGJphcQwfuhinMHRKtDEct/Z05aL9
         ntOur+cZBO1llGyKNY3Vkp/bUlGci1eOMfvxRDKkab8XcktrgMs+wtXiaxjrP3Fb6Q2q
         KxDGoU0NkFzBzLgXw61SQoFAHm9vvIkjgJl7pTvXxdQ13p7U6Af2K3jIcD0Asaciu797
         ajacg25qt9dAppg3r4X4dAomkLuHljwlml044yzzsgsWn2pVwcvvfgQkcSXfuVofUk+a
         2HJJkvd9T7IU5ZSB64rBvfa/1rJ3GVx+sBYjwaCZsGEappcsNiRq2aFSRt6DnRwoBR8M
         CoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697499; x=1791302299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=o7js/1rREHkGNupdtE9MUswu+oAi3+TUg6TvOZwePu4rrPfqWDf2OJmA80px2tDVOX
         05T9t3xrqH1FKBPckVygPLtqk4rdaTlIZ+TM6xKRdgKOq5LsE+SVZXmFcAucdf4QcXoH
         oSHzJn0Gcs9IKPGvZqNJY3jVHh3ktfFOlu5Lz8C/YymIiCRihSADzVmBn00gb7uVNX+f
         ozQV47xjdjH4RPWMLUEp4Q4l7Hl516RXI0fcBfLGr3QlyOFe2CLzQw2GOsnU2HD3JGQJ
         /VqnR/W6ecsA0OE7VIQ/e0DMd1V+mIP8/EvN7I+IPDGcrIIcYZjyeRO/d91CZhNVwv3e
         oKYA==
X-Forwarded-Encrypted: i=1; AKwUvByiDP9PXmomp2dQkFBKY5RhdZ2q8oMHtcVJabbRNEkAklAusXdeXQAUiFF9V0R6J/ben+xG9pqCcvqpLA==@lists.infradead.org
X-Gm-Message-State: AFuF++kpeICIlE+elrvpO1b5Abn5T9L2WEpznMMl1BVXZSuQbHCjdEfF
	9zd4yRGFIfX1YMQRm59+dPEwEGcsepoDaFgY7KA0c4YEKl+9CyQ27Gz1bLVzujyRu0c=
X-Gm-Gg: AYBFou1w8dn5123MqEk6H/uP6xdpF5S1VVqzOFJ2f3XqNO1Ssb5R7ljZ3jwJb5E37GX
	ci3Knbwki4R1yQ8Jzyf96KiZcqfPWY9e77zVcpBYnWnTYKHzPr7AsewSZwuoFAjPtg41deF3fyP
	BrbDuSrlg7u9YUK9dXLhhXMoheQIxpWwi3q22tBxYs/MFFmkAqhypE7W9aWknSDdw4EHtXTUGx+
	Inbej2f5BF5aPIyJzzzVp6GYG4VxmNs3UKbOrrxLON5/WZj/lAlwE6WVkfH6LbIcbIWvy0L7TLw
	1RAwjDYsa+BXUPgSAd2lS8GA+H1i+V8lUQoZF/B0H7ftU/XQOsYHquTEfQSeM2ecrd2IddKDo8+
	iwhPpuPe8fSTIn8oaoP1nAi8F9pBKb+oakQbQxQ98DpcFYueBelVf9L0DfaCduzCoCw5BK3XmcO
	YPEgdZIe2k0xDUrm6hP/5CinafV9/GXx47e64CR7NOFkWy5ls+CdbPI5QPYjEpp/W6/K0uI19mj
	kzY
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr284330975e9.3.1790697499193;
        Tue, 29 Sep 2026 08:58:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm127631095e9.1.2026.09.29.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:58:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:58:16 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
Message-ID: <arvf-dEnIzsXhzkL@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_165821_646405_820530FC 
X-CRM114-Status: GOOD (  12.13  )
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

On Thu, Sep 17, 2026 at 05:22:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> There's no reason to export the symbols for these functions which are only
> called from internal mm logic, additionally there's no reason for them to
> be declared in mm.h.
> 
> This patch therefore removes the exports and moves the declarations to
> mm/internal.h.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
