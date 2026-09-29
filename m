Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F35BC9832A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJXApMhtamMxTVMqnaKkF2WhwJthY5UfdZ//5+RdDYw=; b=kb+PZZSvyJVw6T
	5JdjeuMagjdETzRBuL65OyDSVRb5fc4sMFesu7ou5NEfTsH1Xg+82U9F4K4rFHgG+/cHATeYv26Am
	Oc7JV3aOh0pWJ/S3R7i/g+0lc1c6hM88MRHxljwoojnGCf4NHy/K2y8UI+6T/XIfjMFEOlYgMyli1
	A5PPkLHv3Ib4L0eZrlHVQ2dLyX+X8UFlysmqS7xJdaNXtWXCw0EMw7oAB1wr6OXEq5MwrwykOm+/W
	t7zq1H5fFe5B+TlNwHbHkZD1qk3tFR6XobdvgRNJbdgSaJ04TkifcQ+vJOYQ/W/r2914wdZZoO+fE
	2VmOXWpIRwZo9zvdJfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaEm-00000003zjy-3lcF;
	Tue, 29 Sep 2026 15:59:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaEl-00000003zj9-3m4z
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 15:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=; b=d//qpOWXeb+YBL8Ru6IXeSIzHY
	WruOCpTV6bW060Gm6b2FcmitkozXvSHNkWM7+W/5CK0AzBt6w1EZKG0IO+j2n0h2S45HYG5u8+On8
	wFo+orgg15pSzgFB95g8L75rjMTgHPt94u33JCJGbQpOMTAaAIiCDemhNEeNZGMlCmF3mNqppfRUF
	d9jdz0TxPBoJ3L1Og9h+zzANUmnDKYjxQEPvQvL5isHee9tbkg0fbzZQx+7QOqcpCICHfQ0SoUfYt
	5xQCBYRCffyAb52UdpQTqcCfdvG+IwTSOh/ku8aBUJLBxrDCYAYj5FGK396LwhDNj9YeYW6AGdmMf
	/M1Nt2bw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBaEj-00000002pCl-0Ins
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 15:59:22 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e66390995so24796375e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697560; x=1791302360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=a9AyBOA0qUBKFP8kaZRahYjiDQ4/UVNoPCZRXEb3X4MjeSbcYDjFt684jY8f83tklr
         Zv/FXBquOQ0VadIf3F0LuDpASywXJmKMfH4E2nCxxsU1kiGmAGlaaccq6bd/GKO/Hsj9
         FUgvlSFpP5NNi8MJ8Uvtsu7IhiSNiRO5UyoBNJXfYa4MJn1RZ2el9UXgw8t2RLHMJLrm
         LqAh7aH8/qErXZFH9/5Z4MWdn1HPRvl1kQyX0zZ64ZHyBzkeiem4LbmpmGgAlqyPfl9n
         G/g+rjsQT1/Bheud2UmMnT9+ie5hckEEOCZMvq00zj21kPquDPkUFOlrTGFYrSDUr88b
         NpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697560; x=1791302360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=ueHLsV/It0YMM4SrmzTcTDH7EHQvrvl//9o+iby7YVjk975R8yN51hwIxK0+Yx7cbR
         OScyH2EPM8rUwJtUjlE46hH/u7Rt+CJJUj55drB6QUIhhp3FlcBJBWu0Gswf8joBe2MN
         II+KZHRt0JOMfi3TOPvC1huz01HXaIPF+uZ8i5jCCxaxzCc/cLkEi47i2+ekgVghlCY4
         HnKI3h8zNNt7u1ITOuuyppZ42v+77SCNO4PR4vnaHgHDCxxyWYTbI/QTnIk2+IxeIrvY
         e+xYMPRRJBV56tteMnZezEkMG9q5KoApxhZ66wm1bgmCGvy+9WlRi/m7Cngsg9oUWqED
         qgWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHdJKeOZZphXOsUIy0kYs2jcSeHVZQ0xLkBhrCCdIMUUXe+10PacRlVZdu7g04EfAdq/Xe9D51PfxVvw==@lists.infradead.org
X-Gm-Message-State: AFuF++nZUsNwnoVIPOhQ8F20fXiEyNGK0Jwy33sLHWp3Fy7Saca8Pv/L
	YipCwEjCLZzf5GLWabSZUPaPec7fdj4dt2QD0gfGrCmRU83ETjKoIXx++20bJZ9cP3g=
X-Gm-Gg: AYBFou3Wf3i+vQ9RT5yA53D8eHeIv6I7OHMGEIWbtwzTrpPNw2Zr3Xq/iOZSLumysLH
	+FVUiqZzHiYokFb4OJ+ku7XuAlMgA1UZM+9pZlXy5Pjf4X0LpU4djWVUFcYLzTSqNy3fj1nEUSO
	F87lQzWsMU7roYLjE6dwdkGPjfIgkR+9Qn1AoNFzR4W0UipNdVhJuF/WR8gqDgC1dic8ql+e7Wa
	PM/fbc4fBAnF+3DlK7M9kug4CNp8jilC4aZW4v/BD3ME831uDtsqHgs7EVKytrEy44fbdQDwRsz
	C3AyXjIrcGQAGzp5jLLFD467mxLJuIwPWY+nqCzThZRGb4dxhgksJMzr84hEG7Q7Nt+1pMfdTTk
	+EYNmw2eCCTxA34FWWGA4622VEo1kdRQIRIzOjZcLeJqUaQUT/597U5tJvaF531uGF10O59ZE3n
	FEjzo08QO/UF7RiVlMG0GevP0fZ9189yMwNdYicRnmBYCI+jsT+0joOewivrbZIGh3ow==
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-49ff06f839dmr227620145e9.33.1790697559827;
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c6f295sm7062155e9.0.2026.09.29.08.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:59:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 07/40] mm/vma: tidy up map kernel pages enum values
Message-ID: <arvgNTUgcO0nPh-V@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_165921_206861_A68A83F2 
X-CRM114-Status: GOOD (  11.10  )
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

On Thu, Sep 17, 2026 at 05:22:16PM +0100, Lorenzo Stoakes (ARM) wrote:
> MMAP_MAP_KERNEL_PAGES is a mouthful, discard the MAP_ as that's implied by
> MMAP.
> 
> Also while we're here delete useless comments for mmap actions whose names
> clearly indicate what they are for.
> 
> Also update the userland VMA tests to reflect this change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
