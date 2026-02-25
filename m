Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF2AF5544C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eyV1l2s/bIBk7B/4lioTZrDZclJin6t6R5XIR8UFPQ=; b=dn/1sO8Y0CyZCb
	IU/nGl013PooNdId90e+o7+s8w2uBW5VLInMg1Z+smlEoStOy8mE84zJfoUfBzl4yhSUijUPdkZfv
	h9npqy8G5KfOFoIhTRvRy7nnrM5gcvX1UX2/whSyEh4Pq1D1atsowksqE7Npkxv1dzyc67yTyCDZy
	cFEitAmXmKSzfEhPdaxaIfU008mR86Ez+EC3+p+XspKjGkPtN6Tf//z44Fi7k87niJwx8X+OSoayQ
	g90814nM78AvqXxcqa/L0Sjuc7oU/O5YYb8ukMjKgsaeO+ExC8EGeKGDyqq7GeOZFkSnvWDEihHgA
	EMEt5gQU5WD7Dc67b9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv5Vn-000000039HZ-09Vg;
	Wed, 25 Feb 2026 03:24:31 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv5Vk-000000039GS-3790
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 03:24:29 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35691a231a7so3759621a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 19:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771989867; x=1772594667; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2erXaSzxqouJYHAI7iQgk06x1aOTRy7Rez7nS+35Gsk=;
        b=kTnoXGCg08QYCtnNF7EmK8W4fO2ylVtXv6x28+YCJgKsanzlW7bQhib+ldKOa92skH
         79Z+Pj3Bm/7HizEloJdNSJwTdIJ04GrxA+TH1kg2rjlgmeww7pxkhLvUuUPBvFqEh1nG
         nGJKf0+5Qeo2afhcvrVv3neINiKcijUiskEDHFmBaoOyMPY1W72AhCOVoL02Y+mj6dMb
         ESRK7HQOKE8OWR8Tz/FDzS7RzA2vlc9B2NnH8GaX/Sklp0shGheC9a+ROxJVcOQSPUOk
         F397RXuWmBS5IdIuTIWcUSKvRfhacoHPIf8EsWTgIBiHH+6HmVnCXr/vcvzmnh9lM37g
         561w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771989867; x=1772594667;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2erXaSzxqouJYHAI7iQgk06x1aOTRy7Rez7nS+35Gsk=;
        b=A7HBDUt4FOMW0OER92S0TefwYHPEPkorxu0w9Mg9GpwQDVFXcs5OXhyWBF00omxbSH
         fQ0gkVRuDJpz6visymyemHO2XgwEk5My7XtqymkdJWt2W+My2r8Fp7WXViF2PN0PWUqH
         q/SvlZTShI4xJ9duh0fPJuvLPyDxpuJdxgF6PUiveuXSZ1/CdvpXhXcDaULtwA2YjMmk
         CUKNB43bgeSXTb4P/XpytLYXgZfMzrx26uAmy6MqGKAdQg1Mpn3VGpbaBk5fkD5pFC4x
         ItiQkH9pIMzT0zl/qxTaQeSTtwknPxJng/f1md82qUNQp8OFB3UfKJ6rhqhBGntgF1Y0
         mfjA==
X-Forwarded-Encrypted: i=1; AJvYcCWE2c+j83xudzkfmIuP2IIs9EcM89e6aihJ6ppUOWN9lbFhwCRrQrEDm4m/HC73QOfGsOkAC2LXkZwZfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXb/lzKK4COH/EjroApMLIa7h6CUqCEwaWxCqn2A6YAqnBBfet
	h2lShZzSmostPs2oPyCmP6xeU0EBI2p7GCvpE3FBCLxyZWgveryge2Uf
X-Gm-Gg: ATEYQzxBan1zNc5umW+5Cw0S2Qo5Ycuuhwg+H19M2x/W1vW2Jz6V4JfuS2oKFoNbDgq
	Vqt/Km4SUFMPkeXWW5zgTtXbh78PyPKU4BBJmlf7DGu1EDpHSh1hpgnGI8ipDhPF7eFAhrVzzdR
	dVZ06wUimJTDwS9cQH0xANhh5IJ/DIxm0oGfORTtYcc+p5UIdtnb22D+cs+/Ofp97Btbo0hg9kZ
	K8w8S/ujs6XDbS00q0hvurvAnYRtaGaxVRWX0VY1hjtrYFTn4LSdCmsbvoyEvqJxGRjd0wzb2T2
	JKofgfKPBn+gAxItHOitsg+n8yWszHcijLAIgt8FCzk2qNpkuET6+MGIw65Is2icmWJKtsfgsPk
	Kn2/NeF77uIVrgsHeIjZ5VbR448SX1K0TrZoFH7WNUZb4i88pv5QjnbKXro+8tYUHuHnL0eKl25
	rrNXzLCUBJW0Moce2w8w==
X-Received: by 2002:a17:90b:2cc5:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-358ae7c5003mr12522694a91.4.1771989867018;
        Tue, 24 Feb 2026 19:24:27 -0800 (PST)
Received: from dw-tp ([203.81.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037afe31sm1092824a91.16.2026.02.24.19.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 19:24:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net, skhan@linuxfoundation.org, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org, 
	bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, 
	pmladek@suse.com, dapeng1.mi@linux.intel.com, kees@kernel.org, 
	paulmck@kernel.org, lirongqing@baidu.com, arnd@arndb.de, ardb@kernel.org, 
	leitao@debian.org, rppt@kernel.org, cfsworks@gmail.com, ryan.roberts@arm.com, 
	sourabhjain@linux.ibm.com, tangyouling@kylinos.cn, eajames@linux.ibm.com, 
	hbathini@linux.ibm.com, songshuaishuai@tinylab.org, samuel.holland@sifive.com, 
	kevin.brodsky@arm.com, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
	coxu@redhat.com, liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, 
	jbohac@suse.cz, brgerst@gmail.com, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v6 1/5] powerpc/crash: sort crash memory ranges before preparing elfcorehdr
In-Reply-To: <20260224085342.387996-2-ruanjinjie@huawei.com>
Date: Wed, 25 Feb 2026 08:45:56 +0530
Message-ID: <87wm01h5sj.ritesh.list@gmail.com>
References: <20260224085342.387996-1-ruanjinjie@huawei.com> <20260224085342.387996-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_192428_821648_6CF65D7C 
X-CRM114-Status: GOOD (  14.21  )
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

Jinjie Ruan <ruanjinjie@huawei.com> writes:

> From: Sourabh Jain <sourabhjain@linux.ibm.com>
>
> During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
> the removed memory. While updating the crash memory ranges for this
> operation, the crash memory ranges array can become unsorted. This
> happens because remove_mem_range() may split a memory range into two
> parts and append the higher-address part as a separate range at the end
> of the array.
>
> So far, no issues have been observed due to the unsorted crash memory
> ranges. However, this could lead to problems once crash memory range
> removal is handled by generic code, as introduced in the upcoming
> patches in this series.
>
> Currently, powerpc uses a platform-specific function,
> remove_mem_range(), to exclude hot-removed memory from the crash memory
> ranges. This function performs the same task as the generic
> crash_exclude_mem_range() in crash_core.c. The generic helper also
> ensures that the crash memory ranges remain sorted. So remove the
> redundant powerpc-specific implementation and instead call
> crash_exclude_mem_range_guarded() (which internally calls
> crash_exclude_mem_range()) to exclude the hot-removed memory ranges.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>


I had gone through the generic implementation v/s the powerpc specific
remove_mem_range() implementation, when it was posted by Sourabh
separately. And it make sense to use the generic implementation in this
case, rather than keeping a duplicate powerpc specific version. So...

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
