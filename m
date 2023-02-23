Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526E4C636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/UWkwUFKSrNT570OURB3mI7Z8KO54FPr7KHWhKv1to=; b=ULv41FipXBmzP+
	4ngzr3i/ZvRY+U6I8Jwi6CrE5TJj+Rdfgl3hdbr7LwH/pWwi/Yr+Cd8HY8KuHb4bxLSOnoETYHKok
	fWRigyRchemLchn7CXrXljhVRL9OzacMnrokGxB1d3nrtHQAoUigo/cExrzvSGFWO7FijeTVv+tbR
	G+TsqVdPX6VZgrwR2iKFy6lF8WpcFp4c8YDokI4cSAhDa7cpzl9VYadUAyRbsYYk+GoZQD34x2iGs
	wOndd7Sq3b2lz4mdGwPiay1ZXJ8S0+2d9YczVp/mBWWfm6DeB1si2+x27ylPum2wvPlfquBmNr/ah
	MkOZ5A0ceKLKUIKy5tug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8Gf-00FmfU-An; Thu, 23 Feb 2023 09:52:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8GU-00FmcR-VJ; Thu, 23 Feb 2023 09:51:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 666E5B8198D;
	Thu, 23 Feb 2023 09:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE07EC433EF;
	Thu, 23 Feb 2023 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677145908;
	bh=00vV012v5IGFYupEfY8cRFX6H7hj6D67NRk/FGmf4tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKN0HiTB8aCX3lOBp4YzZBOc2xpCFZlbfBq3sS4elxzCo2DgNpiZvRfAWw0EEZPsY
	 1Of0ObePM7oOGZSXHavj/fw/9VtCuHNTRtjKVOIOkZsnPDjlBnZOMH/qYnzeemOMYn
	 QCvYeMdiLvlizuKv6Sq3UBy1YChubHjmOCkJD0iI=
Date: Thu, 23 Feb 2023 10:51:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tom Saeger <tom.saeger@oracle.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Rich Felker <dalias@libc.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 5.15 v2 1/5] arch: fix broken BuildID for arm64 and riscv
Message-ID: <Y/c3MSvnN4DcvzSx@kroah.com>
References: <20230210-tsaeger-upstream-linux-stable-5-15-v2-0-6c68622745e9@oracle.com>
 <20230210-tsaeger-upstream-linux-stable-5-15-v2-1-6c68622745e9@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210-tsaeger-upstream-linux-stable-5-15-v2-1-6c68622745e9@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_015151_183251_07DC86D5 
X-CRM114-Status: GOOD (  16.72  )
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

On Fri, Feb 10, 2023 at 01:18:40PM -0700, Tom Saeger wrote:
> From: Masahiro Yamada <masahiroy@kernel.org>
> 
> commit 99cb0d917ffa1ab628bb67364ca9b162c07699b1 upstream.
> 
> Dennis Gilmore reports that the BuildID is missing in the arm64 vmlinux
> since commit 994b7ac1697b ("arm64: remove special treatment for the
> link order of head.o").
> 
> The issue is that the type of .notes section, which contains the BuildID,
> changed from NOTES to PROGBITS.
> 
> Ard Biesheuvel figured out that whichever object gets linked first gets
> to decide the type of a section. The PROGBITS type is the result of the
> compiler emitting .note.GNU-stack as PROGBITS rather than NOTE.
> 
> While Ard provided a fix for arm64, I want to fix this globally because
> the same issue is happening on riscv since commit 2348e6bf4421 ("riscv:
> remove special treatment for the link order of head.o"). This problem
> will happen in general for other architectures if they start to drop
> unneeded entries from scripts/head-object-list.txt.
> 
> Discard .note.GNU-stack in include/asm-generic/vmlinux.lds.h.
> 
> Link: https://lore.kernel.org/lkml/CAABkxwuQoz1CTbyb57n0ZX65eSYiTonFCU8-LCQc=74D=xE=rA@mail.gmail.com/
> Fixes: 994b7ac1697b ("arm64: remove special treatment for the link order of head.o")
> Fixes: 2348e6bf4421 ("riscv: remove special treatment for the link order of head.o")

Why are we adding a commit to 5.15.y that fixes an issue that only
showed up in 6.1.y?

We need a good comment somewhere saying why this is needed...

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
