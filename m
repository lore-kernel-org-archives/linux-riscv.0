Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEC8D11080
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmlJYMcVuI7D9v3n1l3UIe45CNd+OfQt77F6t1gCaik=; b=OcjJ9dr2AFmHMa
	3DG9OsTDiATQxvpyDCkNjssKngGn2tjbOndhR721CvWUAVLrsG9rtjGEqUVVqKS3xs+bJgu/LaVeq
	/q69NARMxeNQIwl4Q+2Ui22NEvD/3cAslo4SVKvvtW2c14BTzbTCDS9u3ApS36xW3YKafxlF/PPHV
	S8MQKC/7Grj15NZcUlLeUNqorvNDof06Y+VoTMZE5XVg0+Peh6FJoVd5qVvhaDHQrW3gL1HqnbAwA
	42w9oDU9y0Q5Y29+jd9G20FMeqfeSEYqReCwLY/9IeZ42wm7FmH1F5qycoZwU8Nagr59a6tdd6N34
	go8Dli1O7X90ioa8QCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7b9s-0000000BVpX-2dod;
	Sun, 03 Nov 2024 14:00:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7b6k-0000000BVO1-2C26;
	Sun, 03 Nov 2024 13:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 337C15C4336;
	Sun,  3 Nov 2024 13:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014DBC4CECD;
	Sun,  3 Nov 2024 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730642252;
	bh=VxXH6aqpqHLHF5oRJ5vnT5vpm2uvtxBA9AHVL/CAjN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgyAPyUVzD+RX89LUiOchP3Aw0Js3GqP/DtnP8pAtBfaDedVT967mnJ82pBpE9KRN
	 ftK066xUf9/ky+dJfz8zo3ZrlOBBIwzAtGdFfjJW9BVBxme/2A7kncMayzUKYZ5xhE
	 Vmbx+QZrBR8d8lG3rs/hr5GcPBgei7uWbzXvPZxURjQuM+X2Jr3q9fjSTk/A+86b8b
	 PyY1dLiWpn2qN/lGx/OjiSXOJsgO36lUUbVoSgk7DuHWX2RDImBvvO7ui25Wr0tZYV
	 0Xe+h5Xj9lpyGr/BCNqgwMBTm5cG9eqiST44/fbsaiqt3sqcAsOAptCwqbnUAM9n9Z
	 n3EbHG0jaagjw==
Date: Sun, 3 Nov 2024 05:57:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: ardb@kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, kernel@xen0n.name, chenhuacai@kernel.org,
	xry111@xry111.site, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 06/18] loongarch/crc32: expose CRC32 functions through
 lib
Message-ID: <20241103135730.GA813@quark.localdomain>
References: <20241025191454.72616-7-ebiggers@kernel.org>
 <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_055734_636141_1A1B0A0B 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

On Sun, Nov 03, 2024 at 09:36:55PM +0800, WangYuli wrote:
> Even though the narrower CRC instructions doesn't require GRLEN=64, they still *aren't* part of LA32 (LoongArch reference manual v1.10, Volume 1, Table 2-1).
> Link: https://lore.kernel.org/all/0a7d0a9e-c56e-4ee2-a83b-00164a450abe@xen0n.name/
> 
> Therefore, we could not directly add ARCH_HAS_CRC32 to config LOONGARCH.
> 

There's still a runtime CPU feature check of cpu_has(CPU_FEATURE_CRC32).
See arch/loongarch/lib/crc32-loongarch.c.  So it's the same as before.
ARCH_HAS_CRC32 just means that the file will be compiled.

If you're trying to say that you think this file should be built only when
CONFIG_64BIT=y, then that would be an existing bug since the existing file
arch/loongarch/crypto/crc32-loongarch.c was built for both 32-bit and 64-bit.
But if you think this is a bug, I can fix this too.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
