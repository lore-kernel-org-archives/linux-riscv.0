Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDE1606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qSTkh54J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVxpg//7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uwOtjlYjqQAFD4qZkgz+Lqz8tg0AvyzL/dDg95QbVpA=; b=qSTkh54JB72LMPO13vUHFCq5Jq
	V9VOVDWzZ9eKKQQreChAAAE1AXFUAsy799HoNaP8Iu2T7bGUs7s/AUqx5U2u0YxkPIHdNrPB4wgvx
	0E2XE4BiJi6TpjwYrT+EEoWxCoUATsvz8t93fqrjdELk5FdAmpaJg0JR3NfuYCR+g3xuuyXbeRXd/
	eDHgjJqNCMKPBBIxnJZUxeMNW2ikXLU2oOwuFdlOeFZnexRAWal18WNxUdXi/Nj08s6srZX0LNROf
	NDMlV8aGdrlYhF4Y28BeuC9mJaj4+TRUncUHdY8MEtnt3AXk+Hno0XD8tYohIGfGIuaVl/BZM9LFh
	hpTPHzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGtp-0000000AkxE-1rlK;
	Wed, 25 Nov 2026 17:35:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGto-0000000Akwp-0wlx
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 17:35:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7080861E25;
	Wed, 25 Nov 2026 17:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E977E1F000C4;
	Wed, 25 Nov 2026 17:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795628115;
	bh=VhHyLFRoMZTTpzK9/qbi2HxQjus7kyc4UtiAeaU33j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YVxpg//7XUL6zEg+Rxa4H4eebER+ohBygTeKRTnmnvYPVXxRaLu/XdtfuYX9DnRgd
	 rLao18Zai3T8xA6NyahKhwrdj6yOUV++Az+cNM1fzjtyEybKTBfkdijg151IMOgu5t
	 ZqhrPibPlb9mO1zb0+KfuthXmzZJqB1SwLR9N0gS1uRSYdIolvdTzKpZ7Cl/nMUOn5
	 1UnEuKzP0lsE0rdjZqkn3gKAo6N/H1Oxhy5zb55/muZb2ouaKXJjB4mBC5x1/RyE1k
	 j1Ao5wjAPD44ix9opEzz2iPAqOArQk2pAP58VX1Lf7gnXO9qSQRI0lIArJO48r+hgj
	 O116O9pU6GeVA==
Date: Wed, 25 Nov 2026 09:35:13 -0800
From: Drew Fustini <fustini@kernel.org>
To: "GUO Ren (XuanTie)" <guoren@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>, Chen Wang <chen.wang@linux.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, sophgo@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Leonardo Bras <leobras@redhat.com>, Yao Zi <me@ziyao.cc>,
	Chen Wang <unicorn_wang@outlook.com>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Subject: Re: [PATCH v7] riscv: errata: Add ERRATA WRITE_ONCE fixup
Message-ID: <awccUVMi/lSQFfHQ@x1>
References: <20261124-write_once-v7-1-4158a930aa80@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124-write_once-v7-1-4158a930aa80@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 08:35:04AM +0000, GUO Ren (XuanTie) wrote:
> The early version of XuanTie C910 core has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 platform with the qspinlock lock torture
> test.
> 
> So appending a fence w.o could immediately flush the store merge
> buffer and let other cores see the write result.
> 
> This will apply the WRITE_ONCE errata to handle the non-standard
> behavior via appending a fence w.o instruction for WRITE_ONCE().
> 
> This problem is only observed on the sg2042 hardware platform: it
> takes hours of locktorture stress testing to trigger the livelock
> once, and an interrupt can break the livelock. No user space
> application has been observed to hit this problem, so there is no
> need to modify user space WRITE_ONCE(). The vDSO code runs in user
> space context as well, so its WRITE_ONCE() does not need the errata
> fence either.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Yao Zi <me@ziyao.cc>
> Cc: Chen Wang <unicorn_wang@outlook.com>
> Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Drew Fustini <fustini@kernel.org>
> Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
> Changelog
> 
> v7:
>  - Define BUILD_VDSO for the riscv vDSO build (as arm64, powerpc and
>    others do) and use it to keep the WRITE_ONCE errata alternative out
>    of the vDSO. The vdso getrandom code uses WRITE_ONCE(), so v6 added
>    .alternative entries to the vDSO and booting with
>    CONFIG_DEBUG_VIRTUAL=y hit VIRTUAL_BUG_ON() in vmalloc_to_page(),
>    as reported by Drew Fustini:
>    https://lore.kernel.org/linux-riscv/awPgjwuswbjeDftg@thelio/
>    Fold in Han Gao's "riscv: vdso: Define BUILD_VDSO" patch:
>    https://lore.kernel.org/linux-riscv/20261124-riscv-vdso-build-vdso-v1-1-c52b0b3592dc@iscas.ac.cn/
>  - Clarify in the commit message why user space and the vDSO are not
>    affected by the livelock.
>  - Rebase on v7.4-rc4.

Reviewed-by: Drew Fustini <fustini@kernel.org>

I tried v7 in qemu with -cpu thead-c906 and CONFIG_DEBUG_VIRTUAL=y. It
boots okay and the vdso has no entries in .alternative.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
