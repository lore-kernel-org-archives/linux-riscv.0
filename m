Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DFCC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JYcKlzYSllCkUx5EpA8ib+wedZ1vJ9e9CVrLXxRFiM=; b=CU6VLZIIgRusON
	pPhsodoDei2kqvIS93YsiNx/uQErlCSeAPpkAP2qSu5A1N9Cl8RO2HWanE6/CBLtqzOnhtNEMf0cp
	o/q7m9ijjK5kqI8Ynpe6EMvYrrRG5opgodWOYrb2X1rKTnCb86STfEJDcFNEN7Tpfs7uDPU+9RLYu
	LKeJOoGZAqO0y1A2v2P3wCEQmlw8fI0fiNT22jO8jorzOF0dcidZWzTZLO8Y0nFv6h+TWn9NZNT/y
	Ub5RO3HocqTzYFzkCUNb7F+iLSFxkoLxtW5+TutsKGuD1Ht99H+qazNZQQegpiFAFOIYyjHOb2ber
	hxtV4AM7ZpQgd9T2qv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8KV-00FoJz-PK; Thu, 23 Feb 2023 09:55:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8KF-00FoCH-Kg; Thu, 23 Feb 2023 09:55:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C6AC61645;
	Thu, 23 Feb 2023 09:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBB2C433EF;
	Thu, 23 Feb 2023 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677146142;
	bh=6jNYtTBdruuYIQ1Msq7XzYvT2vPLWW4RkHsct7FIAhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhXwyf5R/buYCiLzNae3C9JyeO6vcP+U/Vevm1E0LKVE0AKb01fv2cNv8vKpT02l0
	 kgkXp04vgF7H7pqsUMiHvnm2i87QwVvTSEZOzZx3djIeQew1z2LQKUZyDFmmd21AJ8
	 uU/cIgStWrPzZGNZCvhV0ZYolwkUaMcjTFaKhg6M=
Date: Thu, 23 Feb 2023 10:55:39 +0100
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
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Heiko Carstens <hca@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 5.15 v2 0/5] Fix Build ID on arm64 if CONFIG_MODVERSIONS=y
Message-ID: <Y/c4G34O0B8zqobt@kroah.com>
References: <20230210-tsaeger-upstream-linux-stable-5-15-v2-0-6c68622745e9@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210-tsaeger-upstream-linux-stable-5-15-v2-0-6c68622745e9@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_015543_742059_15E8A8A9 
X-CRM114-Status: GOOD (  10.63  )
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

On Fri, Feb 10, 2023 at 01:18:39PM -0700, Tom Saeger wrote:
> Build ID is missing for arm64 with CONFIG_MODVERSIONS=y using ld >= 2.36
> on 5.4, 5.10, and 5.15
> 
> Backport BuildID fixes.

I do not understand why you are applying patches from 6.2 that "fix"
something that is not in this kernel (or the older ones).  Please
document that really well on your next set of submissions.

I've taken the 6.1.y series only and dropped all the others.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
