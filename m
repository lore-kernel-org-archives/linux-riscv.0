Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CB3C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Dec 2021 02:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0f5v/T1eVjfTQPEchFcbKce4tqUCQ/1GHnfYDsnexg=; b=URtNUA4rNYZaTM
	HgHLml1ZaAmZQyEkp4vLWOL9Dws7LztmpTQcBZ0U3ajsrHf2PoyWUIT5ZBM1nGT0klU7vdd/P9D58
	+UBTUI2SZ+ho9SvsKDIpWR8TEKMfoh4DVtYlu80d6GFjD+MbCnvPtGwRqD7adGfWv7puGZQQpw/H7
	PLJw+Qpsccp7Fe52nRvfRzI+x6Dja2qAlSq5TciWgs4HmiqWwetk2VNjBshvNO16fd8pArmMrppNx
	Ly9KdsNXjzn9QJBzVFFSLeF5pFwtkZ71JGCrVimdk7VA9Gztw7Y5IX1p4LBEL6HlH6NJACE5ha27y
	Bcv+dmaiyHL+Ae2gxEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0DbD-00Bkng-Eb; Thu, 23 Dec 2021 02:12:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0DbA-00Bkme-Fs
 for linux-riscv@lists.infradead.org; Thu, 23 Dec 2021 02:12:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9827FB81F46
 for <linux-riscv@lists.infradead.org>; Thu, 23 Dec 2021 02:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDA7C36AED
 for <linux-riscv@lists.infradead.org>; Thu, 23 Dec 2021 02:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640225569;
 bh=CDmqTRF2LGRmxpzLtcjy4Vzvp8M7nfS3Pyz+9roYHtU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=roGTWb1in5sqhq0reNrozfr5WBrjXPwekIdfHy6Cxb3A2Bo/PXLfahluePDrv5bpe
 GWF08i8o5GeDS7uL0X2/F/Dm/cESZZkL9wIXx4sKWHjc5AUiDRUtHOmbACKhOH6HUg
 eBApsrwXggQBzFxhaspprA273ELiejffZiBEpWvIWAv8mGnDWkytEP1DhIb7GiWaKD
 VC65lgzNe0yOCtz8B96bLYGaZxWS27cioWEQMebP1DtApSi0Nj4dpguPZS561bsAZi
 c70syXDVgYME0fqEXn7IMMh63RrRPLI51Q+mhcqbznC6sX8JxsGTQcEhinva/n3oaw
 g+7oM3+0bJPQQ==
Received: by mail-ua1-f54.google.com with SMTP id r15so7578491uao.3
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 18:12:49 -0800 (PST)
X-Gm-Message-State: AOAM530WHluMRjft4/3iXOb6g3LMe8lY7JjEMm1TuzRbuZ5kYOvoHl28
 vOIz0Ad0DEVTkpQOjib8JEdENEoPGhL14TDq0H0=
X-Google-Smtp-Source: ABdhPJxTedV2XFghjTyRC5imf+6XJLTz0d7aL0KW95ASmjx0K+4ZXtdiAtvy82fd5Cp6FWJ53e/V4Vw7XdzFTXrg9DU=
X-Received: by 2002:a05:6102:a83:: with SMTP id n3mr138109vsg.2.1640225568308; 
 Wed, 22 Dec 2021 18:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-3-guoren@kernel.org>
 <CAK8P3a3dS=Ne0Pd2qZc8vB2whM7AUcJ1BNbhtf6EEboWAPpSug@mail.gmail.com>
 <CAJF2gTTN1HZeycK-WOFH0EjmjtBB4T=9de6Qrjs=uhAsLoOFaQ@mail.gmail.com>
 <CAK8P3a3m2Mz4Tvu+3cdji6iq_wvFZsYoyKvnaNKTEjE+ivex6A@mail.gmail.com>
 <CAJF2gTQEp0hEousuEyp5cPCa5Remb_8HMZ-BXZ393_z7hbne7g@mail.gmail.com>
 <CAK8P3a165oWeGOgsM=U3F54e4HFvhJxr2sG0qoGLOe_WK8qAtw@mail.gmail.com>
In-Reply-To: <CAK8P3a165oWeGOgsM=U3F54e4HFvhJxr2sG0qoGLOe_WK8qAtw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Dec 2021 10:12:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR4TXXWQ5Ubnz6HdoOmV=EkL9AsEH07RzmVypyeK353vw@mail.gmail.com>
Message-ID: <CAJF2gTR4TXXWQ5Ubnz6HdoOmV=EkL9AsEH07RzmVypyeK353vw@mail.gmail.com>
Subject: Re: [PATCH 02/13] riscv: Fixup difference with defconfig
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_181252_707351_9862AB2A 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, Dec 22, 2021 at 9:52 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Dec 22, 2021 at 2:06 PM Guo Ren <guoren@kernel.org> wrote:
> > On Wed, Dec 22, 2021 at 8:51 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Wed, Dec 22, 2021 at 12:34 PM Guo Ren <guoren@kernel.org> wrote:
> > > Given that there are no specific rv32 SoC implementations supported
> > > by the kernel today (other than SOC_VIRT), the number of users
> > > would be close to zero anyway.
> > I really agree with you, but we still need the rv32 user mode
> > ecosystem for memory footprint.
>
> Sure, I just meant there are few users that would have to relearn typing
> "make defconfig 32-bit.config" instead of "make rv32_defconfig" even
> without the added Makefile target.
Emm... I got you.

Next version, I would send delete rv32_defconfig patch. If Palmer
object, I would change to make rv32_defconfig target. ;)

>
>          Arnd


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
