Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAB9C433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 09:26:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4830A61244
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 09:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4830A61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcLj81ye/sALtMI8Q1wtT0V6DS6k/sGXwCLBndy6ql0=; b=ZNSPL05YhH7zFN
	+GJjASkFzICsfD66mQ/Fpa6ZEwKHPT1TjuM2X+cU2HkYDfmDAu9QiOWBUM7MryNQQ/QZrXPTPlv81
	1NhqIjv9CNeWI+imJdBaX5FObVhueQE/HRHr95mDfVQ4L2Rzw4PUel4XgtVkN/kfzG8anGhqJWk4K
	7dbL+QFocCGGVrkAsJQY7iQqxiwPN0c6a3rDTZWzdGZE0xOtK+EG/Oz6h6160eBJskTjemc8wd2DI
	D9wz549NRqt5azQXS++M7EyeFvvGtEejUTsyGFrgoCt10EVttu3vatLWcTVPMYCMrlY2Qubnwnr6F
	RFcKQYujR+PR9qfF9FfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldUqL-00DX9S-LP; Mon, 03 May 2021 09:26:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldUqE-00DX93-Ca; Mon, 03 May 2021 09:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fLy9DiO4d7hbeLXoGuF654ufloNHLfA8Z/WN8IvEIrw=; b=kE/KWJcXUMDiX/bLnTIIk8V3EZ
 RDQi4rzJ1j/t3S+F1r5KI6oW3iLmtpur+TSElahzOdrDxSqqZ+6hxmw9vW+UiXGyfT5vooXS9txxs
 YdXy/9aoUppEx4211oc/14RI8P1yNGsXiOluhKWCJXylihLWa2xo/SlSSZRR9+xTk6/+BlLlz1vsJ
 lBDnTc6hu9TUM8Jncy2J9R/wEbGpD9tAy21Fdkdrkzjs8j4ELwPnOxRzfPFrJC7Aj9fqx+EdU1i/A
 FwLAdjdHO6EICAOBIAYKa8fGnWa6jsxISpztyHkXXvO5sK1an2uG2AHY+R3DGRV/jOC0yhXnNAkEQ
 XbwQRgPw==;
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldUqB-002wVn-EX; Mon, 03 May 2021 09:26:13 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MVvGt-1m2UMl0DXp-00RtDF; Mon, 03 May 2021 11:26:06 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3152620wmc.1; 
 Mon, 03 May 2021 02:26:05 -0700 (PDT)
X-Gm-Message-State: AOAM530BbjWCl/9wT5pUl+H7p54H5RnkSUhBZVgduGXwWJHu6xrL34PJ
 PPmVbTucfgWpmtehpU2Mxn9qq+1zJpHkQrjnx40=
X-Google-Smtp-Source: ABdhPJyImR0lXDOWh/rFmKSSJQOuX4SzDcgMMWQ8OtmjXS6cOp8lf5wEACKwu1MdktyqNDYlMn4UdggeZ8LLn0fAS0M=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr30642981wmj.120.1620033965603; 
 Mon, 03 May 2021 02:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
In-Reply-To: <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 May 2021 11:25:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
Message-ID: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Segher Boessenkool <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:dfF0glRwgJZb8sIdPte6x8c+oPsO7va6VRFuZtiqpEPqHpLWebf
 ITPeCDQkSqE4fke3nne040PqSBzm1QvXi8zvaRB6B4UO0DplEN95snpw9yKOlzm+eqdKc0w
 ItdktX1oWH+domOXvJR39lfPpSw5l+X593fxnEyRPpi46yqL5rAN0DqUUHEHRGCyVTOQDS3
 S7zsuuzzFGW6OlKlQJhfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:djw/hfV7cuQ=:oPg44G3dbPza8RnxAIMF05
 ewrz9peMKs1f/CV7sLXFKf/gFmb9zHwiJctto60+Y8UKi86u6/QlDjPai7inWFrhmKynST8Fr
 qwy66OGURqVTyVqAHAwPPxy2GRCNio2ruEspjN1MSerAKhcTN60lb2dsv+D9eI+YZxpn3HZXE
 YEMKTTuPSv6IV6wlXR4ifecMt8fptICPJJmsi2aQUt7AQiaBjf6fA9aywruLEBYJD8Fn6vF15
 h/YrrqaHnyLbfCY8qgZnKoUtFRiR3/CJqYUS7pKw+hoH9lzXe7CgFt6GPKLnfZTzM2A/2Nz8j
 jPI+/IGcLkXdckxz3r6NlS2LheiHt32Hw+hRfwCOrYuH0JBilAqWjmvzZoNiVZzVa8VCDR0ip
 nm0kM5vxa99ctBcMxqBlx9NPLnTi3hul/7cxxVwlcTvg7gePOEf3QMAXTEWtDfkyRwWdei96x
 iWn/qdnvOzXL22JHPNQKsR4CezjkcU+vN7S0QUafXBI8iAkshlBgpduldBHOfuZs942cOcLT4
 2zTSO6D9giwp4+Z/4JWoY8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_022611_799366_C6D49BF1 
X-CRM114-Status: GOOD (  20.94  )
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

On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
>
> Desktops and servers are all nice, however I just want to make you
> aware, there are embedded users forced to stick to older cross
> toolchains for different reasons as well, e.g. in industrial
> environment. :-)
>
> This is no show stopper for us, I just wanted to let you be aware.

Can you be more specific about what scenarios you are thinking of,
what the motivations are for using an old compiler with a new kernel
on embedded systems, and what you think a realistic maximum
time would be between compiler updates?

One scenario that I've seen previously is where user space and
kernel are built together as a source based distribution (OE, buildroot,
openwrt, ...), and the compiler is picked to match the original sources
of the user space because that is best tested, but the same compiler
then gets used to build the kernel as well because that is the default
in the build environment.

There are two problems I see with this logic:

- Running the latest kernel to avoid security problems is of course
  a good idea, but if one runs that with ten year old user space that
  is never updated, the system is likely to end up just as insecure.
  Not all bugs are in the kernel.

- The same logic that applies to ancient user space staying with
  an ancient compiler (it's better tested in this combination) also
  applies to the kernel: running the latest kernel on an old compiler
  is something that few people test, and tends to run into more bugs
  than using the compiler that other developers used to test that
  kernel.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
