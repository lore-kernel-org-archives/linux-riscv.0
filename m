Return-Path: <SRS0=owx/=6N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E7EC83004
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2020 07:41:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C9F2073E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2020 07:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FTxI1TcM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDLgGsPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C9F2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S6vndLuaeXb6bB9uiepv0GIEKfn+kuOCySzTjAzHsMU=; b=FTxI1TcM168NhTo12HR+cYni0
	AFhucaobpuFyB8SY0K4K2LLLamceRMceX7TmqYuEqMNFnyNcxLEGfQ447alOIBVpxH5UuhTiZS0Qk
	tZTe51Di68P1Jz+aCfgrsWovkrX3KpHu2agykB1EAWFPB2JYmnFToZvuVOBkY2qkVF5jnoIW4RsX0
	VPOh41K3QLpwN/COw1ZKjZ2vuLf6TnG6PXBS4d6+1DW2RXuHfimC3BnGCdvKhogzJYVY0vupcYpic
	AR9z7Yvg64O9s1KsXFEG89e4RBDlFirShbW6Si3lSjNT23yaVIsE3a2ooAD749bxPLF5hYxPK6bZf
	xRiGgrvEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jThKz-0003Tw-GB; Wed, 29 Apr 2020 07:40:57 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jThKv-0003TR-WD
 for linux-riscv@lists.infradead.org; Wed, 29 Apr 2020 07:40:55 +0000
Received: by mail-lf1-x144.google.com with SMTP id d25so786897lfi.11
 for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2020 00:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S6vndLuaeXb6bB9uiepv0GIEKfn+kuOCySzTjAzHsMU=;
 b=FDLgGsPFHgxlMBjFNmkfnE/Jr4mIXNB0ns9FLOBMmwPRIyZAlEnLT6cTCgVk6vLaCW
 ttoowgf6aOut7y2PxCcyMO7iByXRbafn3qJt+BEsv13U45mOcDHqmNm3MT7KhHXp02s8
 qNIODLOep7LI6mc5PkRyIZQkcJPxNxdJbwAhk7uhCmWq48lMQcj25Pu5LwbYN2bIMoAn
 gniHdU1zqIfIAJJQEwtEf1I9od2tl1RQ+3At4RTciCU3gNLSIxB+sLpX3Z4BQC9m6hiP
 K9rXPnNmEK76QnKzxjl6YrH0FewLuscVAmm2rpuLKi0NVxWe4nau8n7rvoBvBx9GwCIt
 6YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6vndLuaeXb6bB9uiepv0GIEKfn+kuOCySzTjAzHsMU=;
 b=CLnmrKQzv85p1OTHNN7dWKu913Xtpgq+jgbxvUIqjF7j60E7XI+nIQ+Fb3Vzha5PYK
 dn7sUF1REYY6CsBdJUq/iuy7CKneExMHRpUNENyUW0rnlYC8sRaWhfbu299b1PEtKwyf
 v4MVbTVALQTBkwFe+qs2bsI+2k8BK3Xmt513biFm1cxDI7whTm+wIUhDjG7dAUFA0zQ2
 IyjLfAiKwsnshiBdXI0sJ61YsPE1psB9WK+xYsqdUY3VX9RDeCtld9wop0Qx623ETW9s
 fl4e56HZGvnewHSni08AUiriOC6gCYo0xOuDvKSld2G8OE7n3Lkl0s58MKPK/3hp9nJM
 2fvg==
X-Gm-Message-State: AGi0PuYJpwNxruLIjLhIMlHCMEOBIR4oauPqYb1VaIGip8akRtveWGzm
 l//Hl7HzFCnSFq4ZCzW9UWWD3/BBlkYDF5Hm2lw=
X-Google-Smtp-Source: APiQypLMoZakO/8ExLncaCmnnOtNMCr57sttCek7NXn2hztLvfuFdT+oQQxp8aJPkYV2kumt/lzBA/5xwKhJMFDHg7I=
X-Received: by 2002:ac2:5c07:: with SMTP id r7mr22066594lfp.160.1588146051463; 
 Wed, 29 Apr 2020 00:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <1582175719-7401-1-git-send-email-yash.shah@sifive.com>
 <MN2PR13MB3552ADB09621545F67A914E28CFA0@MN2PR13MB3552.namprd13.prod.outlook.com>
In-Reply-To: <MN2PR13MB3552ADB09621545F67A914E28CFA0@MN2PR13MB3552.namprd13.prod.outlook.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 29 Apr 2020 10:40:15 +0300
Message-ID: <CAEn-LTqUWfiV_QV3hyCQ9YouaHCzNFPq=WABfioNEiMJVP8ZVg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] cacheinfo support to read no. of L2 cache ways
 enabled
To: Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_004054_032109_FDE4E353 
X-CRM114-Status: GOOD (  20.05  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "alexios.zavras@intel.com" <alexios.zavras@intel.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sachin Ghadi <sachin.ghadi@sifive.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "bp@suse.de" <bp@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Ping.

I think this one got lost in time. I don't see it in v5.6 or v5.7.

david

On Fri, Mar 13, 2020 at 8:03 AM Yash Shah <yash.shah@sifive.com> wrote:
>
> Any comments or updates on this series?
>
> - Yash
>
> > -----Original Message-----
> > From: Yash Shah <yash.shah@sifive.com>
> > Sent: 20 February 2020 10:45
> > To: palmer@dabbelt.com; Paul Walmsley ( Sifive)
> > <paul.walmsley@sifive.com>
> > Cc: aou@eecs.berkeley.edu; anup@brainfault.org;
> > gregkh@linuxfoundation.org; alexios.zavras@intel.com; tglx@linutronix.de;
> > bp@suse.de; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org;
> > Sachin Ghadi <sachin.ghadi@sifive.com>; Yash Shah
> > <yash.shah@sifive.com>
> > Subject: [PATCH v5 0/2] cacheinfo support to read no. of L2 cache ways
> > enabled
> >
> > The patchset includes 2 patches. Patch 1 implements cache_get_priv_group
> > which make use of a generic ops structure to return a private attribute group
> > for custom cacheinfo. Patch 2 implements a private attribute named
> > "number_of_ways_enabled" in the cacheinfo framework. Reading this
> > attribute returns the number of L2 cache ways enabled at runtime,
> >
> > This patchset is based on Linux v5.6-rc2 and tested on HiFive Unleashed
> > board.
> >
> > v5:
> > - Since WayEnable is 8bits, mask out and return only the last 8 bit in
> >   l2_largest_wayenabled()
> > - Rebased on Linux v5.6-rc2
> >
> > v4:
> > - Rename "sifive_l2_largest_wayenabled" to "l2_largest_wayenabled" and
> >   make it a static function
> >
> > v3:
> > - As per Anup Patel's suggestion[0], implement a new approach which uses
> >   generic ops structure. Hence addition of patch 1 to this series and
> >   corresponding changes to patch 2.
> > - Dropped "riscv: dts: Add DT support for SiFive L2 cache controller"
> >   patch since it is already merged
> > - Rebased on Linux v5.5-rc6
> >
> > Changes in v2:
> > - Rebase the series on v5.5-rc3
> > - Remove the reserved-memory node from DT
> >
> > [0]: https://lore.kernel.org/linux-
> > riscv/CAAhSdy0CXde5s_ya=4YvmA4UQ5f5gLU-
> > Z_FaOr8LPni+s_615Q@mail.gmail.com/
> >
> > Yash Shah (2):
> >   riscv: cacheinfo: Implement cache_get_priv_group with a generic ops
> >     structure
> >   riscv: Add support to determine no. of L2 cache way enabled
> >
> >  arch/riscv/include/asm/cacheinfo.h   | 15 ++++++++++++++
> >  arch/riscv/kernel/cacheinfo.c        | 17 ++++++++++++++++
> >  drivers/soc/sifive/sifive_l2_cache.c | 38
> > ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 70 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/cacheinfo.h
> >
> > --
> > 2.7.4
>
>

