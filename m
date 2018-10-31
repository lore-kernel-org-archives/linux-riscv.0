Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97942ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 20:42:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3852054F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 20:42:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aAUXWcGm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LTWVg3J7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3852054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=dRjSJhD7cRAnEAnDmtga81yu2PXq+ePjfoAn4oYJMjE=; b=aAUXWcGmHoKuRm3wFj1sgiSlc
	RwWd8s+brYa13NF2HlFZ+h0tv5aTiKysyOJeGZS/Sm1ZdsqwNGuSGYUqY6GZFlUdRnUrUhzd7hPNP
	9Nm3oYyqu3B/H1B7vdwzFM8JZpVDT7yJmfXRds0cM8WnvFlaEDpcyMid6L9llTqHfuOi1hisVeKpA
	3AQl9ybNhsg2irYBPNVMDIF/vgO8BBwLqam0rcxI9O5/kiHxJNoMqbImV0lSPbWrkSxxLNGxXkFFJ
	JbIv1D8EbV0myudFJeUhgjBPQuIdauvnTLRZcfcTwXv3n7SqW2x8aoeuNvrBODCCv8nG9KF4AdQyn
	Vpmn+O/OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHxKI-0004mn-I3; Wed, 31 Oct 2018 20:42:54 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHxKF-0004l7-Iw
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 20:42:53 +0000
Received: by mail-pf1-x443.google.com with SMTP id r64-v6so8172115pfb.13
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tNw4+GQDoI+QM0z6JRCy7TPp3efbz9Gf3KD2w8i/67w=;
 b=LTWVg3J7Zj0OilUrMPMl/KAotZUGSib/8cbljjkSKDAymWi2vXIrIY3uuKdOeQX8bA
 io1GuRvN+zmQJxDfrXgdcg4i6Clr7OU5LT6BIX5piwd6Uu7sJddot82KRAwFYzczjuJ/
 PGOWBVMX4NaXc9qbaZCB0RLQ35YYs3XRQDZrPZyEjcwblSJoYQQ98zGfzpwvzrSKIpCh
 O/6yLTgNBKo+uItqyNDOn0KT+IMLWr7P83P8t4B2BOQNxinTexZj2ddqsyZWiAD6cZDZ
 ODqN6TdK3ru6mVRrjF2ShOks+810hWr1UHZVxXZ9uK1GUrDwT+47uiAp+JIzDfpW90RI
 e21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tNw4+GQDoI+QM0z6JRCy7TPp3efbz9Gf3KD2w8i/67w=;
 b=Svd5F6mcv6DOOYq6aM5LF1TrZr1ufJ8WIKFqEtUXTF3IflKC/XgZNaij8WYvaEBzw1
 yM4jTkFTqKUjavu73BPXhoZmyLeBDoV090j1cN2SvAK3GRvVETnAH+EuJriRVVKprfXZ
 bQLf0SXXu9ZuV3TYjX3Lpmt1HADOZgELsigyXY9Wwu5LZT5cmdtF7eDre89xulj/F9zK
 qGJyQuepIJlWNS/yNUZQbo9KfZJKofrtJHUQe9KlcbpLaMY/J1L1tzggbQlTiU99YG7f
 H8Cf6S8DDdYfKEypmsWHq3dAa960+VBIKi6nF+Ak/qoey/0B2HqdPF2NACL0In//ZdBE
 qEpw==
X-Gm-Message-State: AGRZ1gJ0a7mfg/JjoeMduw7/pJ6eveLrDQXrERrKtgv3v2wQmuddA5K3
 6ouUtpV4H6dK09vYllmdQhfCiA==
X-Google-Smtp-Source: AJdET5dEk5vIhWJb+nT1PKgOqAKSCzVQCgcC7HazjWXIZzmxVPxF3qQNEJpQUGDsbZIEIAQshAOm3Q==
X-Received: by 2002:a63:1013:: with SMTP id
 f19-v6mr4620144pgl.38.1541018560320; 
 Wed, 31 Oct 2018 13:42:40 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s8-v6sm1699840pgi.44.2018.10.31.13.42.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 13:42:39 -0700 (PDT)
Date: Wed, 31 Oct 2018 13:42:39 -0700 (PDT)
X-Google-Original-Date: Wed, 31 Oct 2018 13:42:26 PDT (-0700)
Subject: Re: [PATCH] RISC-V: defconfig: Enable printk timestamps
In-Reply-To: <CAOesGMjXZNURZ4SdKjssYCcFv3=4MYLBpBpzvvb1rNM-fo=QHQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Olof Johansson <olof@lixom.net>, davem@sunset.davemloft.net
Message-ID: <mhng-111820e6-59c0-479a-a10f-f3729007ba70@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_134251_629813_92ACE64D 
X-CRM114-Status: GOOD (  18.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031204239.AAh9aSxzNXBTbZpwPvCEs1KV0ib1WByjPf208p51Zkg@z>

On Wed, 31 Oct 2018 12:20:40 PDT (-0700), Olof Johansson wrote:
> On Tue, Oct 30, 2018 at 5:37 AM Anup Patel <anup@brainfault.org> wrote:
>>
>> The printk timestamps are very useful information to visually see
>> where kernel is spending time during boot. It also helps us see
>> the timing of hotplug events at runtime.
>>
>> This patch enables printk timestamps in RISC-V defconfig so that
>> we have it enabled by default (similar to other architectures
>> such as x86_64, arm64, etc).
>>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>
> Acked-by: Olof Johansson <olof@lixom.net>
>
> For next time: doing a re-format of the defconfig (to shuffle config
> order), plus changes in the same patch, tends to be a bit fragile. For
> cases like these, I'd recommend hand-pruning to just flip the one
> option if needed, and then have Palmer or Andrew refresh the defconfig
> during a merge window if needed (usually quite rare).

I poked around and it looks like most architectures have this enabled for at 
least one defconfig, with the big architectures having it enabled for all of 
them.

I decided to do a bit of a case study here to try and figure out why some 
architectures have this enabled for some defconfigs but not for others, and as 
far as I can tell it's just an oversight.  Specifically, looking at sparc32 (# 
CONFIG_PRINTK_TIME is not set) vs sparc64 (CONFIG_PRINTK_TIME=y) I can't find 
any reason for the difference.  sparc32's setting can be traced back to

    commit 216da721b881838d639a3987bf8a825e6b4aacdd
    Author: David S. Miller <davem@sunset.davemloft.net>
    Date:   Sun Dec 17 14:21:34 2006 -0800
    
        [SPARC]: Update defconfig.
    
        Signed-off-by: David S. Miller <davem@davemloft.net>

which changes everything in the defconfig, while the sparc64 version dates back to

    commit 3ebc284d52757cf39788731f8fddd70a89f7fc23
    Author: David S. Miller <davem@sunset.davemloft.net>
    Date:   Mon Jan 9 14:36:49 2006 -0800
    
        [SPARC64]: Update defconfig.
    
        Signed-off-by: David S. Miller <davem@davemloft.net>

When we first submitted out port upstream we had an empty defconfig, with the 
theory being that we should just pick whatever the default in Kconfig is for 
everything.  That's obviously the wrong thing to do because most of those 
options are bogus.  At the time I didn't care enough to look because I just 
wanted something to work, but now I find myself asking the question "what goes 
in a defconfig?"  Is it:

* What I, as the maintainer of arch/riscv, want?  That's essentially what it is 
  now, as we have things like "CONFIG_R8169=y" in there because I happened to 
  have one sitting around when we needed to plug in an Ethernet card to test 
  out PCIe.
* What distributions expect?  There's a major element of this in there right 
  now, as half this stuff was just selected because the Debian and Fedora guys 
  suggested we do so because adding things to the RISC-V defconfig made it 
  easier to put together their build scripts.  For example, we ended up with 
  "CONFIG_EXPERT=y" because some setting necessary for the distros was hidden 
  behind it -- that seems like an odd default.
* What users expect?  I'm not even sure who users are in this case, as from my 
  understating most people use distro kernels and don't twiddle Kconfig 
  options.
* What is necessary to work on RISC-V hardware?  This seems like the most 
  reasonable use for an arch-specific defconfig, and subsumes things like 
  "CONFIG_SIFIVE_PLIC=y" because without the PLIC driver nothing will work (but 
  the PLIC driver shouldn't be enabled by default for all architectures, as 
  it's useless everywhere else).

Maybe I've opened up a big can of worms here...  It just seems silly to have 
most of our current defconfig be RISC-V specific.

Anyway, I'm happy with the change because it meets my "what I want" criteria 
:).  I'll split it into two parts, though, as that way when someone else has to 
go to some archaeology on our port they'll be less likely to get lost.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
