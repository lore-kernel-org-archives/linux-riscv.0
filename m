Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60872C98318
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RX0d4VXIU8jVNbMzHgonp+ToTgIf/E58bFATr5ylZcA=; b=mnEPQKbnOFHGGy
	N9W1AO6IvlvIkIku9V5NtulcaeAFwIMlNL0LT6C0269NVvb6AanppAqKdijSynWg3aQgChXtGIlIW
	0ycDXwyTGKkWhyCH9xtEsSCSpxVpgmCB9vqEeC29CsqEjlCOewH7VSp/NLERb2cCojKJGbCibWDOs
	weiBBq/+l/2B+VJSq35Vb+ShEN6EpQSh7Pfrew2t7LUgLzIcB2w+2jXaw6my1nEtamuA5l0YEy5pI
	nC3eXz8G03W/cJKuJS5fS7hR/W0IAkDXLhmzmOjjLJ9DdqlB+QhNKriG9PJKotBuTLMP2yAFiIJTM
	UWqAuk8XEhTAiD3FyzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mSf-0000000Bcea-1Bk4;
	Thu, 24 Sep 2026 16:38:17 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mSa-0000000Bcc7-2uMf
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 16:38:14 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-530280b8234so211581cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 09:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790267891; x=1790872691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=XfMocC2DgEmjyjTRdqpIn3n6OX5bnCO34fAWZoMacwOQJevxK0YkPX0YYJe6qqogX6
         fb6Rdw03TglLfViT5aHzariRazGroyHnIJiWX3HGOCezw4QbI2l+9QLv8aqcVo9rXDzd
         cY1TbiZCqYkqwUp6s7bwUYfMDtPtfnWFnaofg3YB0peUso8u8GYJSwR9UGZoMNUtSEgy
         FFT31SJF349+p7x6psHziEYO+H41ESiEomQGatL3FreGiNdlyb3MD7UTTOJu5PBV6IRp
         STWtP6P2rPi8Rmd91uVc6/AYFTPDWoDudveHT6xedXyB8c83CssFIUFqFUxHMM/NgRjs
         /KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267891; x=1790872691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=dLl+ewo9tanUmf0Na0s6DuEk5ELotxkQiEhc7BJyDnHCLYbMu2KHM7VvfFVvcLXPZt
         SvqjTY/ZWMU/zNum8y6761yZmo4wQROmWYqsXPSg2WhHyajA2Q9WN1bmR4HvPAHFIz0/
         EcYyV2LYJa71oOATWrBxc7AYEtyY4ma+lbT5rSZ+uBcfDs8A6x58rh8WCWZBEkQ7GG5H
         8Fy9lK6sVk464PUZhKpRClwzpvX+zz7z7rh/dwvRzAzkkxvH44VAAwwcyRqdoi4jdXn7
         KyhdUGmZbNDK2bgm9cCtzKfWkvKNp05n7fegjz9PQlJbTHJeco2808CNFiWdzcX6tAGq
         2/Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwbreIEYIZZ8pJcsEQa51oHn9ActQPVjlQJFslmnFhnyH3lMx01Yz0OXwpUDvjB8ovD0gTtrUMDc6GTiQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l9rvlb3hbgJ68Jf98Tvvx7APZooGTZmjjs2kMtd0elCGcjsXJ5
	nyABw084KWWJMMRXmLfitUUUONM9d/pb9SN7UAJcHOhoQCcQqgEkheuMzR4P+c1F934=
X-Gm-Gg: AYBFou03q6gWrw5eRWgWddUlMlQNn2H9C+26uWffOl/MftW/f3dXi4Q2jJ0WuQ+isDz
	oJKxAVczhH+NzvuLwM56zvdkXbRp1QeWvpqGJ9uMaUCPHqX/W5mEx+hX2hezRDU29hBMh7xXCgq
	oqjlmuf8Q7w6zfmqIMF2eNh+qqaCa3nlf2rzvo7PwqzmlOsiua8c93OuVHE4Nxo/Ubxbrwan3yF
	neT07xkABseazJ9R+opE1qehyfYhoay8dY57r7GI1ZZ/1eownqp6+axNUPnDzba53aoTQQk1xiv
	58qVbX8YRwUvhnkv5aFOn6ACCjlmHd92khMlw06YuMXxSKOKCr6pfxSZVvEhIj6d56krJKNeoct
	NvN/Ie1EaaEjMQKYyiBjSywsbzVW3hwWmwAWMH9weA11f67D1GmxnZYS2rchre43dFOP16WGtps
	AWaL8xnMycAihDqEDFujZGzVVvyRj4GPpOnxwMVAhnZgD3JT0mQgj9wvpb3o5P0NGWMBuqumUSj
	NkBCfhJ8beAOHpHu/WfsXZGybaILoCb9Tq3sUyu1rKIbt5ANv1IveY=
X-Received: by 2002:ac8:5743:0:b0:530:d860:ffba with SMTP id d75a77b69052e-532fe9f05bamr29797891cf.6.1790267890993;
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb32f6aasm45064551cf.16.2026.09.24.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:38:08 -0400
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
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use
 vma_[flags_]can_merge()
Message-ID: <arVRqJZkql6sGunt@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_093812_739147_1EE656AD 
X-CRM114-Status: GOOD (  10.49  )
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

On Thu, Sep 17, 2026 at 05:22:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> Replace the open-coded VMA_SPECIAL_FLAGS check in the VMA merge logic with
> two new functions vma_flags_can_merge() and vma_can_merge() and update the
> merge logic to use the former.
> 
> This abstracts the check and expresses it in terms of the desired behaviour
> rather than an arbitrary and confusing VMA flag.
> 
> This also lays the groundwork for making further improvements in VMA flag
> usage.
> 
> Also update the userland VMA tests to reflect the change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
