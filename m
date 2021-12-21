Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59844C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 18:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wL2lojPyLMyAn48Z2lpTsku51fNf634sq0qqzTsaRLs=; b=jr4zDJe2GzaCMT
	kI6sCsfVB04u54+TKx2GBzW1lWXIPYpIHxuLg31Hshg7Ba3VUtPx/1pgB4mEFoCcyUCRu3ce1U08C
	u3AAc4tOWpROh2Y19Rolb0zl5t5Tqxa9LW5v9h3clboCazyiNSTHkM3ShiXDwmGLtY142ovXTcG4/
	je4Jry/lgxECAyJw9mRzq2sIZUqxGGsTf4SJzx0CIkj2K0e7x05NDnw+1ZfV7wlWdgDOjeUUL9mQ2
	8zIJPlPrEorO18VgZIGSCf3Kf1oL6I7ATGPos9R583BhCSqw8c9FpghIHLSWZ3O+nTv4yyzWNXwCA
	9ilNtgDEOTPRZ8F5aXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjyq-0087p6-5D; Tue, 21 Dec 2021 18:35:20 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjyn-0087ob-A1
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 18:35:18 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7KG2-1n7PUU354e-007iQR for <linux-riscv@lists.infradead.org>; Tue, 21
 Dec 2021 19:35:14 +0100
Received: by mail-lf1-f50.google.com with SMTP id u13so24058246lff.12
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 10:35:14 -0800 (PST)
X-Gm-Message-State: AOAM531hRFkPIgSLy3DPHdEb3IhFibWB9+W2kqkT+RY/N0iMzSWDP0se
 4JTlV57Kc/cAZDySpvE+5RQL9EOy13gLykDS4BU=
X-Google-Smtp-Source: ABdhPJznn56uiIqEQGonQeMXabHARNb1MKKouJb7pEiJqRUGi0z4LrTZSA40EkADjYddnL79plKTAJq+Gzpiid35E7s=
X-Received: by 2002:a5d:6d0e:: with SMTP id e14mr3598547wrq.407.1640108340516; 
 Tue, 21 Dec 2021 09:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 18:38:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
Message-ID: <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
Subject: Re: [PATCH 00/13] riscv: compat: Add COMPAT mode support for rv64
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, 
 Drew Fustini <drew@beagleboard.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:D/0Xb+A8zAaqYHdQpD3vnKAWJf3vSR8S4EhdO4yv47ZeMmNtALX
 OLpaJG80IdIE3k6cRUIK1XHMYdclS8OoiA9wzYhIm5mTSEYvVxmoe7TKoh6aBq/pMGttVLb
 cmXkKbWswO6/OpDJGni4K4Nvqu01Vk8Yca7X2Bjx6J03Q4q32W4BoB26wvgYxioafDWlQvv
 JqE+V4u0rPpF+H3V4Ydiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:roO6c+JG4SQ=:VYJUSDXdnzwAxsbxcQn4dk
 rAcLXMILrEvwzd7mk7jdGbmZkIwHVVLHcxkll/uMqZkqQg0RABto6xW84cp6pzS8Y/+UK0obW
 pAoakB2th90bxez1KManeSEjT7EqyxsNdPQhDoQWuJ8jouan2OpelD2F1tb4PmgeCIFek/vxS
 4B+pk0a7cDEOOpxc7jYk/19kt3O4125B46xCFnKLgGtmZqxGQF60QP1OtLm+VwCVrXzYAHfzj
 kPVNpX6yEFF+FYnWVE3L8EkpwxqF6RVSIGPdFzv2xoVlVF341y4uVg1yO7+qzyh8N/b9E5S1K
 qrBuaXjngPMqNoylf7OxQ9pW4Nm7Gs9J/rNYvJA3MhvxYwMLDqCNdSBlJRCWhNPgHIAhs/3qa
 ZMOrEUHRpqQjwqkV7D+xdUyMfQb1jKKN9vNo9facJMUSulu8HD0gUZsi+npX5Gk/DuETMtYqq
 z75c1DJ9jCpL7oxNCng57enW7Z6HNii5Xuyu40Ei92Xgda4MW6VKPloDSQRNHXOW2pDqxfYOn
 M7irScF2g1cGwW7XJ3L60dB+T/N48Eb8nywjdCP2RnGzukb10c6WU7W966EuRDE6o2iYwC5Fg
 IRSMwhqre1/Ip87qoMi05/d2RCBThn2Ks31PKK9X/NuWGFuYDUW/D00SZtKCWLc3lA4dCaghd
 VZNyFYOuEbIBi7GwANmZtfzhQo8i6r4+hagJ++crz4FLb5K1p98TdoUFpK+j32qtyKr8SrmCU
 nYklA3dlaRmAQFj3iluSBkV6HiWIBBrKPIDZ/eZRo+4JrSE0MmgUMp1RHXxi4LP2qENslIZrg
 utSrxKmpf9INrX9jg0wYmNn9hQznSDV80lUOQd2g8qzHyGnN9Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_103517_665429_C5D95489 
X-CRM114-Status: GOOD (  17.76  )
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

On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Currently, most 64-bit architectures (x86, parisc, powerpc, arm64,
> s390, mips, sparc) have supported COMPAT mode. But they all have
> history issues and can't use standard linux unistd.h. RISC-V would
> be first standard __SYSCALL_COMPAT user of include/uapi/asm-generic
> /unistd.h.
>
> The patchset are based on v5.16-rc6, you can compare rv64-compat32
> v.s. rv32-whole in qemu with following step:

Looks good overall, see my individual replies for minor comments I had.

I think there is a bigger question to answer though, which is whether this is
actually a useful feature for rv64. In general, there are two reasons for
wanting compat mode:

a) compatibility with existing binaries and distros

b) reducing the memory footprint of user space in a memory constrained
environment, either deeply embedded or in a container.

For the other architectures, a) is clearly the main driver, but equally so
this is not the case on riscv, which does not have any legacy 32-bit
code. Without that, adding compat mode would mainly introduce a
second ABI to a lot of environments that at the moment only need to
support one, and that adds complexity to the implementation and
the extra attack surface of the second syscall ABI when an exploit
may be possible only in compat mode.

There is still some benefit in b), but it would need to be weighed
against the downsides above. Can you explain in more detail what
use cases you have in mind, and which CPU cores actually support
this mode?

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
