Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E9CC433E4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 20:23:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CAED20684
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 20:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wropAYmd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CAED20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XCTzSLTXjBwef/Hy2O3wGOMFRfayYKy1Ai9JseeJ5ak=; b=wropAYmdW5K/gw7og+OGJygAr
	qV0wMcGwnkUcLBrqgZoRKMJ1q16JRUo9yFom6vZJwwBE4KAoywfHmg1Tng+x6BN282xMctjU08Zwo
	Mj/F7QPjL4kTOvOQRl3fuI6QEEDbNWaWQNzmChMMM0VgW8daTAsOJLQqVXTANN3+ng+FWnFEzu48a
	lMF4/+3NnmfoVv88o7ya6dczC79S8RPVFBlrRmVrMboC81b49YLzotVlbhYZzX2/f5FoVWFHPwldj
	Rp6cuN8kwh7SsoYN1+l3nkbpBZT8SCproSoMOAD/rjk953nWgFSNp8H5uMLOFdEinp+tUwVBtxcBg
	7lky2LyJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyLGO-0006f9-1D; Wed, 22 Jul 2020 20:22:52 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyLGL-0006e7-AJ
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 20:22:50 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N64JK-1krGIu0y8O-016O2B for <linux-riscv@lists.infradead.org>; Wed, 22
 Jul 2020 22:22:44 +0200
Received: by mail-qt1-f171.google.com with SMTP id e7so2857590qti.1
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2020 13:22:42 -0700 (PDT)
X-Gm-Message-State: AOAM5316/d9WX787/M+Mk3MEO7+n5bSfDld7WMTs450KVIB2lNvKZNvC
 9cGCEQcs4EMxmzdGtOrm+OLWBNNU2jF99HTssXQ=
X-Google-Smtp-Source: ABdhPJzomOuvyv87HLrmnRqLMg+xagc+vFRLOHIlCjUhIO6Ps1D+MblDa1Ac6NHH61/GfVpqpoR58oXKvv+qOpTZNZk=
X-Received: by 2002:ac8:6743:: with SMTP id n3mr1132159qtp.7.1595449361849;
 Wed, 22 Jul 2020 13:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
 <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Jul 2020 22:22:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
Message-ID: <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Palmer Dabbelt <palmer@dabbelt.com>
X-Provags-ID: V03:K1:J8ck2IcelAMzGc53QPdXUblwo//9C65t+/ud5oyCvtjfg/JA3Dv
 OZwmYNVHGMAHDEYnnD1g238AV+O01f08cQk4ZP3kMlQAJOAcyHSdO+rAwp2Xsw+geDjINdI
 a5mDLdsSVNurlqmURYZoB6ha0N0+ZtqJiU/YzCIEZrKRmAFYAR0RDRi1JZIINByvcWHauAf
 0xFpnjL1XZf0SDjDNc7qg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dBmn0ZZNjdY=:BcSKhULG0M4xE8aaAR1tn2
 VNKZQtxMm/ELcF8HecKBkw58W7Q+uQbx3X0ynJ6a2Fe47VzzVmQxyWg8509nNkJAH1iFuRK0R
 ZPtzJvGxuRivn/iQAsgVX1WSwHPEAr9XhWtpLlMMsT/G66UvBSvKQ0M8Inr0OQDenEyWw49XP
 A1tTZmAjhDDD5bP/Nvib5qATauzt03TFfYn3DhAV6L+6Q0Z+37hTEJeLDmjSnO+n+CXIBm5P9
 4ZkcQgWffQ0U3D5WeXyQsqc4pq1M3nVoknz5zBYjPkAyqzF08WLInS4t7TFaba11xqnnxyrpq
 fjJAzRGMScDpLUNwsNXnvRZZ6Cd/MeMWvwabsntMUMGyp7T8Eryv5bPkPWCFdoifT5qZzxKed
 SYmidNcxvp6Q0QblzuPTZIVC71QE6Bgx+hFizeGJ766LtZrt+9pxTk/OC4zRKLsQpGqPiI7xL
 noUALyjzwajpWetd3/8GY2xQ5MXB3J6iWEq8rmgwDe+EGcl21vVOCUyFiPrJ4SFaJwOkbR4cx
 W/5Fwqg3IznN4LV23ENrKm1ANVmzvlfiOzyNecoirEiY41hL58N4ybTgCErXQ5Yw7gpIxrq8V
 TMJYorCTaM25Vp7F+hihlycDCkqtI74xV0WheV2BKHpOhy2O2EziTCYC9M/DExxcZ35tgtFUQ
 mLVJjPC8b5mlacx6900tNug2JBTF4gkiaveHiVR0EjYU6AV+c+8El6ed/Jn2O1xSGI0Fu2Cuc
 LlADnpW6EgeoFMZP3YoRcz6IFTAqd1WUjdKT+0eW9xHoqUnGdDEWDzkdfBvVJqV3bdUhLvp7n
 769QEgZAfkz2BskpGFgDc1d5kVqsNaK91os56Fb9iSc7librA+o/KTp8q2mHJJHar65iH19x7
 vlPlRnGYdRxPGrUA6/Ssj28jYLy+RiaLf9IL3wxwlPYcdCZM9wYpu6qHtPpfukr/10WqP4tSP
 V2SZ+sWiDraeW7H1dpx2X5gwZubz3WJKprgcwKswbjdhC8A3X+9yz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_162249_560255_DDCCC0F5 
X-CRM114-Status: GOOD (  15.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Atish Patra <Atish.Patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Zong Li <zong.li@sifive.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2020 at 9:52 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Wed, 22 Jul 2020 02:43:50 PDT (-0700), Arnd Bergmann wrote:
> > On Tue, Jul 21, 2020 at 9:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > The eventual goal is to have a split of 3840MB for either user or linear map
> > plus and 256MB for vmalloc, including the kernel. Switching between linear
> > and user has a noticeable runtime overhead, but it relaxes both the limits
> > for user memory and lowmem, and it provides a somewhat stronger
> > address space isolation.
>
> Ya, I think we decided not to do that, at least for now.  I guess the right
> answer there will depend on what 32-bit systems look like, and since we don't
> have any I'm inclined to just stick to the fast option.

Makes sense. Actually on 32-bit Arm we see fewer large-memory
configurations in new machines than we had in the past before 64-bit
machines were widely available at low cost, so I expect not to see a
lot new hardware with more than 1GB of DDR3 (two 256Mbit x16 chips)
for cost reasons, and rv32 is likely going to be similar, so you may never
really see a need for highmem or the above hack to increase the
size of the linear mapping.

I just noticed that rv32 allows 2GB of lowmem rather than just the usual
768MB or 1GB, at the expense of addressable user memory. This seems
like an unusual choice, but I also don't see any reason to change this
or make it more flexible unless actual users appear.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
