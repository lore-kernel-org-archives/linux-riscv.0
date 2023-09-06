Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBA7EB8FDE
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOZTDx9F1gFK/iJZIT77zvB5ySae08M6O+b7WkW4j7A=; b=SWF9J3o7+RXsHR
	h7vpWt+y7HncUZip0jfWL6vCtaBM2l/A8Gj2ToLjyUJYwf8Zs6o8EFMgqK8qq1VmdBDZ9dwKVAhV+
	/EVmewysbjRw5Dl7outHUhwvj1fVDI0/ULh5QjhxO20aWrhBNj7ywlfUyBOzMGH76YNsTqdEBqr2R
	jjGvfTrp2Vs06OjKIz/UZwSc3EEfcr0AxOIQnmJWrfD4MQDO2BeGkKDtAgaixKoXabbGaWf2SOb/+
	08yF9dZFtV1euxA+v5l5VZrwDljUTpD+prYwGS1zMDr8b3Y2pBccyetySU/mNar0WCYDeve187QwX
	kmVoocj7bhqXHiJx1AkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdtmO-00AIyD-1l;
	Wed, 06 Sep 2023 14:45:16 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdtmJ-00AIwX-2t;
	Wed, 06 Sep 2023 14:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694011511; x=1725547511;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HKIKo8gJxS6xNqAxkMxzWOKQ5+W7pcHDwu58cyKSvBQ=;
  b=OOuPPinN4LxTy7L0QxtKdAySp8/EiQe3KsxeBqvNZ4pYOObCfFXJVc9B
   dZpxbTWTNjEh0PvN54sMULJmc6lXBdVHI5ZCSP7Y+sOT4KCxglAK2kGZF
   2HjQPUsmgsj/ZyUdu4sTIBAq5BqFSKE36RpUoHFrymA8gfaxlSTmq3sYP
   67uid6ayaMNcqgpTyvDH8+zPoXChcIS91y5fJPCZS9mK1d8Gw9+cqt2uv
   BA4bipRwXIQ5N+I/RKGea4iyuSLtJijMhobzHfNDLH0wH0CUguIIGn8M+
   nv+ZjiKqlkt3I/IecfWUxJPpwWkYlTuQN3CsWxEV2sAUFA9Kc+Ihd2CMM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357393651"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="357393651"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="770777884"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="770777884"
Received: from lmgabald-mobl2.amr.corp.intel.com (HELO [10.212.242.149]) ([10.212.242.149])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:45:09 -0700
Message-ID: <d0d30ad4-7837-b0c4-39f4-3e317e35a41b@intel.com>
Date: Wed, 6 Sep 2023 07:45:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/8] arch/x86: Remove sentinel elem from ctl_table arrays
Content-Language: en-US
To: j.granados@samsung.com, Luis Chamberlain <mcgrof@kernel.org>,
 willy@infradead.org, josh@joshtriplett.org, Kees Cook
 <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
 <20230906-jag-sysctl_remove_empty_elem_arch-v1-3-3935d4854248@samsung.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230906-jag-sysctl_remove_empty_elem_arch-v1-3-3935d4854248@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_074511_973708_74157F0A 
X-CRM114-Status: GOOD (  13.04  )
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

On 9/6/23 03:03, Joel Granados via B4 Relay wrote:
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel element from sld_sysctl and itmt_kern_table.

There's a *LOT* of content to read for a reviewer to figure out what's
going on here between all the links.  I would have appreciated one more
sentence here, maybe:

	This is now safe because the sysctl registration code
	(register_sysctl()) implicitly uses ARRAY_SIZE() in addition
	to checking for a sentinel.

That needs to be more prominent _somewhere_.  Maybe here, or maybe in
the cover letter, but _somewhere_.

That said, feel free to add this to the two x86 patches:

Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for x86

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
