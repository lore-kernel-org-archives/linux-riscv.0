Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568D3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 10:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQjUehPOU44f5UOw7L+L0Xb2uzjU3quzlfqKnLg3od4=; b=tbKpHg3ooO47cn
	TnVdctegB/YpC040GODKacs8OVI9DvoB2M1rW97hD7Mlh38j55TtCk3XVFdaohHqA+gWbV7/flf/Z
	UAfr6Pkut8CHrMcADUaTKfxhn3qbRVkFuYoUv8MH60NiU0QemtoqBLtOOQ/2cNoCSJslEBWQljiQI
	IPu8D7DzK2g1wKV2fx/PB6Yjbm+W3wXpHPHo3WAxICvQX35gfyIDSt7+785Kipidaq0DhCFacHp0z
	PlO6zk+LVhgHoClJRvTcgMXwJ07VHMrOZT2BdSzfY0kKBGg4cCVV7bJAHVPbA2sEat0aXRU45uZkz
	Hep7xEVcUZz7t2Ire+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNB6q-000Fkr-JH; Thu, 24 Feb 2022 10:12:28 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNB6n-000FjN-5f; Thu, 24 Feb 2022 10:12:26 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N6bo8-1oJ0My2dYs-0187RG; Thu, 24 Feb 2022 11:12:22 +0100
Received: by mail-ej1-f47.google.com with SMTP id hw13so3179732ejc.9;
 Thu, 24 Feb 2022 02:12:22 -0800 (PST)
X-Gm-Message-State: AOAM53100DmJzrUYpTMIu/dQZYnBbgFKrrro2BEn1BNjkCgjVyBmFTMU
 hBMUzjsuBkuZwJ/cLXcQrdOsrK70KwOBJXTd7QU=
X-Google-Smtp-Source: ABdhPJzPVQaW1f3Bbzw+kTDiMg4Tajz+c6SJ2JtQUsJaSw6D1lJ8eGh3OG9MaDTzij1odC2MMgMswcl0VWfIMCexGbY=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr1412807wrr.192.1645694019453; Thu, 24
 Feb 2022 01:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-17-guoren@kernel.org>
In-Reply-To: <20220224085410.399351-17-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 10:13:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
Message-ID: <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
Subject: Re: [PATCH V6 16/20] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:67KnLieDZRNziBJPteu3Au9DfZEfEmQYZ+Adp4Js4iDJaBYxREb
 HagAFx5ZhXAc49O3bUd/uIzrCBCy04fkBl4h+Bsdk9No1vMAYfKnZDY1tclspc0e+q3ZrQV
 c90YwIVBL5mF/qCuAdJ8i3AQDrKAXAD1WW0xoW9Qq4UhSXBtd+cFfwD72Jk6d0lahVhTftc
 6COZ50DaRPnNcwo426aag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LxaivV2OH5g=:rZzesXNXXJrTs2yUGQqMoj
 emee/7NNErGQga/QKL/ZbiUvDhyo3eqT6I4ijnZQKIcuTy7lSEe2xt3c73qVB9J4FzXaF9Xth
 Szi3GDnqmzG9y4MAd3ozNS6q0UNArXPQccmzSYHLktl3ecDWlGgvYun+oGhKr0YOwXVjVPQZX
 LXIJzjP42vscgfCOUJuigZcrh9cUYp3O4LexaUjeZHKDBV5jWNw6q9NHqr+r0gKtslaeZfrCr
 zatAFEShvpi1ZyU+8KlGMdJ++wAEGO6QGUro7jVQepurVSLmymQts+aXp3NJUac1G3GWptgLJ
 CG+O7swsxCm2R8WJi4qbXNAruk+PWSYz8Wu+x9Fy1P5kSwQDiiA05UoWcdy5/uP2z/G3Pyzy+
 J403ekEjY78CdIn4lf8BTaxUbU9uZTbsWZ88IUaAGIddMRTN7PSAFfHUtLHF4HtjdwMQTzU5g
 RHMIqSCrhlW/KU2KBiMnzz0J1ilsvZCZLwZJ8RCCf2cCOIz+9D1iviM2qqHeJprcMN8ZKDI0D
 bcAkSfQndcB02mGsyv2Xe7QZl2orwk+nxZyeGamyVPVxQsV9lUMMFioL7fW1+ghzbJK7ZV6Sw
 F8TDAavnDZ8xuYBBuopJoWZ2Sf0tIHpBrXE5ljVoLWX2bj50jR5hOFAoY4YcgydT3YNe0eahZ
 nbIj2kh6Ve0wktweUNGSLCaL5y/VR7DtphVuHTXMAYwP2sz5bBtIOCw/hXxmX6I8g5AYbwnzG
 2Nsi9mAjQRFdwMJMbElMb+aqamDv+YktsUoH1p673oo4WAVlva9blSlrqKMp/S6UTlvDNhxaT
 lsesZrOTYDIKmHfsAp+Ql9o73wXaMaKDbmGOWFcLuZoB+g2KSUUHiIoXTNWs0R1u74mTopo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_021225_538765_926AF084 
X-CRM114-Status: GOOD (  15.02  )
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

On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> There is no vgettimeofday supported in rv32 that makes simple to
> generate rv32 vdso code which only needs riscv64 compiler. Other
> architectures need change compiler or -m (machine parameter) to
> support vdso32 compiling. If rv32 support vgettimeofday (which
> cause C compile) in future, we would add CROSS_COMPILE to support
> that makes more requirement on compiler enviornment.

I think it's just a bug that rv32 doesn't have the vdso version of the
time syscalls. Fixing that is of course independent of the compat support,
but I think you need that anyway, and it would be better to start
out by building the compat vdso with the correct
architecture level.

At least this should be a lot easier than on arch/arm64 because you
can assume that an rv64 compiler is able to also build rv32 output.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
