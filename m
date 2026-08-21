Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E666C5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 02:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8y3GVQFpbaTYxryc25IK3nNuEyc6jj6k8Nx33uPk9gc=; b=f29SefOUjB2hpH
	DdPF+KEJDHZlffQ+CyJxdtCjLmgDGJJWR39S4E+MPCIE/ve73RjVlsCJn05j8nw94opf/FzpE6IBY
	8di1cCO2Rysrdk6LX6Yj6BEfMk3MMWoRbYuyY7lkedSC61iR742h6VFyUh67UAwdOojcEgP0Hx9sX
	WEWivwPzE7WIohvJiWTHJf3H22BSrk/MD+wTvvYFJP50gRfLV0sF34hEo5ynvPBUlNKm+si+fLmvQ
	WME7cvJoictUzwS9/PmYqp+5EcF9djR7bsspAEAjqj5qgyvE1qwbWmNtFjP+U0YNloxidvmMvzva6
	unEOTgHcNRetwmNfOwwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEjN-0000000CRWD-3YBX;
	Fri, 21 Aug 2026 02:11:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEjN-0000000CRVu-0Eln
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 02:11:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B61342339;
	Fri, 21 Aug 2026 02:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D414E1F000E9;
	Fri, 21 Aug 2026 02:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787278300;
	bh=OEG0v2HGsE+hywve2JgEKb25loMOtaO4622dEMT+sgI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=jWiA18cgAochHeVvRo5YIRh7lP5+9ftZAJXSgTXrPUOTCCq2HuiL1E+YSZaGSeHMv
	 YVlWcjiJXCIXWI7D3s3GgPBC0JdkF1vuttv74XqYA95fPjD0aMyvBS5NPSRgs75YQn
	 9Tlt1it1n2WoGJ/bRP8BFLTMoUVXb/ecBPuGpaTJds6kkN2c8PH0oCMC2sE/29im1b
	 O8Xfkm4j7Bm2sUAaHhT4IkM+mgTCZxy94hFDcaUKZgK1jpxOig4ri+pOIQUxqWQ2Gs
	 mT8odKt+3o0Fmq6CXkM/4Bya/c0dEOjI79Q6M9I2wKUY7qZ9DV06wlhlM6AjoJQuVX
	 KtxOW+Ibj86hg==
Date: Thu, 20 Aug 2026 20:11:37 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Evan Green <evan@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
    linux-riscv@lists.infradead.org, bergner@tenstorrent.com, 
    kito.cheng@sifive.com, dfustini@oss.tenstorrent.com, 
    greentime.hu@sifive.com, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
    Deepak Gupta <debug@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>, 
    Yao Zihong <zihong.plct@isrc.iscas.ac.cn>, 
    Jingwei Wang <wangjingwei@iscas.ac.cn>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Subject: Re: [PATCH v3 1/3] riscv: hwprobe: initialize pair->value in
 hwprobe_one_pair()
In-Reply-To: <20260725001614.2578617-2-tchiu@tenstorrent.com>
Message-ID: <48f9d505-b80c-e6c7-1623-b86822393dd1@kernel.org>
References: <20260725001614.2578617-1-tchiu@tenstorrent.com> <20260725001614.2578617-2-tchiu@tenstorrent.com>
MIME-Version: 1.0
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

Hi Andy,

On Fri, 24 Jul 2026, Andy Chiu wrote:

> The vendor-extension handlers reached from hwprobe_one_pair()
> (hwprobe_isa_vendor_ext_thead_0() and friends) only OR the present bits
> into pair->value via VENDOR_EXTENSION_SUPPORTED() and clear their own
> missing bits; they assume the caller has already zeroed pair->value.
> 
> That holds for hwprobe_get_values() (it zeroes each pair) and
> hwprobe_get_cpus() (it re-initializes its scratch pair per key), but not
> for complete_hwprobe_vdso_data(), which reuses a single pair across all
> keys without re-zeroing. A vendor key therefore inherits stale bits from
> the previously probed key, and the wrong value is cached in the vDSO
> all_cpu_hwprobe_values[] and handed to userspace on the fast patih.
> 
> Zero pair->value once at the top of hwprobe_one_pair() so every handler
> starts from a clean value regardless of the caller, and drop the now
> redundant zeroing in the *_BLOCK_SIZE cases. hwprobe_isa_ext0() keeps its
> own zeroing because hwprobe_ext0_has() calls it directly, bypassing
> hwprobe_one_pair().
> 
> Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing")
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
