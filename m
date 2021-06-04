Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C613CC4743D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 18:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 885566141E
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 18:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 885566141E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0Lba96nofA6ymf1wUDCAAiAY0VxJ5mdGdSOWnxgU/g=; b=WtO686u22wBFF9
	LLX8XYkmRUTJwHL/YyB4S5z2l3hITfA0ZCaxM+ADCENVx/+1t6ESjotNOo3KkwTeVABEEsLKJq0Lr
	sDah86NDxblUUpdymbr8PZtHzGUKWaj7MH5XLOZUB1N6/93oSEck02IU+ArbjHAzQu5w+atE3A7GX
	tgJz6A4G74M+2sYkarrXgixO2rtbp/V5n69IPaVUWkym2rMF6C/T/WguareH+sLIf8/yvZZYCFYdr
	Kq7X3FCpIcjla1abXBPFKMLmLOoS9BT+51LcENYaAi9myrwxmClW8poY6hJEDOdo0Dyn/E/yjc7oJ
	gZiVybn9YAH7x1dyflDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpEfI-00Esht-6t; Fri, 04 Jun 2021 18:35:28 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpEfF-00EsgU-DF
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 18:35:26 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N4hj5-1lPhSG0IEx-011hJc for <linux-riscv@lists.infradead.org>; Fri, 04 Jun
 2021 20:35:23 +0200
Received: by mail-wr1-f50.google.com with SMTP id y7so5586418wrh.7
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 11:35:22 -0700 (PDT)
X-Gm-Message-State: AOAM533oP1jSG4e7evpqGvrhffgi/xQhx9IiTL2goCXyXL8Jwht0+1gb
 Okme2mU0uHp8rHAr4Huv1juMfzCVsZoePj8+dOk=
X-Google-Smtp-Source: ABdhPJxERBDztGap2tMeeCVda43Ious9cLlsWPwTXGV01hDgX+xRbkwxcD2X8jt1oNQSa3O2nrllQDYOEr19Z8vD4+o=
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr5424092wrs.361.1622831722675; 
 Fri, 04 Jun 2021 11:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210604120639.1447869-1-alex@ghiti.fr>
 <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
 <CAM4kBBK467AZ-qhmtREe9mr_bp3QcCEptQcFAApnbrvPc6bkuA@mail.gmail.com>
In-Reply-To: <CAM4kBBK467AZ-qhmtREe9mr_bp3QcCEptQcFAApnbrvPc6bkuA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Jun 2021 20:33:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1dSaYbQi1Csbp2LDcruj3+Ae6VVgNDXatSjTU77G7d0Q@mail.gmail.com>
Message-ID: <CAK8P3a1dSaYbQi1Csbp2LDcruj3+Ae6VVgNDXatSjTU77G7d0Q@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:SYbZJpIaqYSo5qd9CFLkKGQfdZ3X+na0bmyLByX8mD+qFm/BXv/
 U4gbtWw/TDNq8M3sOQa0iFIN5B8YXAcPZfuFBDzFfEcd5qabcxsOes1Z6uTlX5dEKa3rdjz
 aHO2WQ9XLoQKIPIuqsml9+jZqH/CWAu3Y7W/W2U4W2X61haXH1dOIbs8L/BNILlF5z+X5my
 AEmu7Yp4Zx3NaV/6CksjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5w9HMYWPk5M=:i+/OEycHVW6MG3QaJJiRsy
 WxL3u0NiMF++ApP6Zrg8sYZAnrHfxdFP64CevVUDGDwBy5m+BIDGgQ46nBwLy+9gVhzZHEOg5
 Wc79JTiP+yej0K2OvwUn3SyjAsjyKdKjoGNLW+rHr7f/Ieck1M6/0JNnjjOH22imWYkLDsxLN
 i8C7vl55iO1jQKxogE+fc+A21SHIxoMKZA+K5PEDOYByhZozgV32IJVEv9mvbqcqt93gska84
 DgHGZMkvGozU079bK6MGeaGiJqDkA+ZsnCmLoAqiFTQcc8ON0HrwOyrlEfhmjtDJw8yRRxgRy
 M+sBgjqQYJfz48wLMIbl7hMccb1XBiSlXr9Qy1QdOvVE9GWv0DiBcurCJO5+t6Jh/0CzEQAE1
 IMKCmqf9GihgNwmZPM3peniLlucl308TOG6BcETW8ilf5yfB+ZuZu4Y4xk2oyDkfu1LHf9Lxr
 K93Jd0PTDOJyc+kKbnee1reGsTDI5O8e7vPaTaLuiVScPtewbtY9H3QrhA+nTRExcVMqxnK3I
 WxOJjfzVy38z+XOiJeHO5U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_113525_762103_D61C9B78 
X-CRM114-Status: GOOD (  22.88  )
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

On Fri, Jun 4, 2021 at 7:45 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> On Fri, Jun 4, 2021 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Jun 4, 2021 at 2:06 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> > >
> > > Fix BUILTIN_DTB config which resulted in a dtb that was actually not built
> > > into the Linux image: in the same manner as Canaan soc does, create an object
> > > file from the dtb file that will get linked into the Linux image.
> > >
> > > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> >
> > Along the same lines as the comment that Jisheng Zhang made on the fixed
> > address, building a dtb into the kernel itself fundamentally breaks generic
> > kernel images.
> >
> > I can understand using it on K210, which is extremely limited and wouldn't
> > run a generic kernel anyway, but for normal platforms like microchip and
> > sifive, it would be better to disallow CONFIG_BUILTIN_DTB in Kconfig
> > and require a non-broken boot loader.
>
> can't quite agree here. If we take XIP, it does make sense to have
> BUILTIN_DTB, since 1) this will not be a generic kernel anyway 2) we
> may want to skip the bootloader altogether or at least make it as thin
> as possible and 3) copying device tree binaries from bootloader to RAM
> as opposed to having it handy compiled in the kernel will be just a
> waste of RAM.

Indeed, it does make sense in combination with XIP. Maybe there could
be a Kconfig option that depends on CONFIG_EXPERT and that can
be used to guard non-generic options like this?

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
