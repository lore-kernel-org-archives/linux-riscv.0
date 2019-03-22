Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD05C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:38:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0E420693
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8h1irfZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="K2icgPHM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE0E420693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCPWeq9kgkpOKhaRB7rOcvuo0tH7FJxR36V1INhOw60=; b=a8h1irfZhl1ZIT
	iDCDA6JyRXp1HBrWAcogxoM2TlsyAiwQ4a+JnANLlbyJG+jSu7rleOoVWl1fkKtWH1GcMq2jNSoco
	PWdDITRFkHQVQKlcAXTcCENwYqdwoqnr6gLXyovb3wAPXAGS0ETzTpXS9Knr16JbOVsLkJXG33QFh
	bI06zDFeADmKPh4zyVW5aRA4Tj5kNvKDfK5lA9ufpeE4p0+7CuoSuuzZkiXOpr+5U7DW7PgK6ljyU
	R1K0EGMTCWY67UdoDDfSLcAUn+2mb4TUqdfJwYwYyAvGstAdHOFxcJFcLlH27TNuKh9dNo/F2yg+s
	d+o2sLMobNHifzbrjAkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KNY-0004oV-19; Fri, 22 Mar 2019 13:38:36 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7KNV-0004o6-CL
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 13:38:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id y197so2231293wmd.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LNed13vu5UfKDTRaNWf23yepiT0xAK7G/0DQlV9b+3M=;
 b=K2icgPHM8lfav6WGBmXN1edhbKLMtarIfCfayYs1/xLiizu11GuALiaoFdtOQfresy
 11RneQofkaqAJWNjTLZzLa2QoWsIY6rl795n0QofRYgGv+hxsg6Z6TQZLcUL5hlhh4uN
 k0dYj62mYyMrP5ZESlTC84Vz2CkmfuZuPpRsKazDBBwYbI/XD4Cx6SAhIRC0+6bhffDI
 7Cg5XqYnPgUlz48qtm3PZMJLJOaIwjlTtVA6JlX4QU4WfNk1crWLvV10BsqSofR+y26U
 MnSumh8GvtVIkxyvVrWqV91Y4q49Fw+rfI0bsuicZ9b0rBIHMlVmN+hKJLUbihLdDQck
 407A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LNed13vu5UfKDTRaNWf23yepiT0xAK7G/0DQlV9b+3M=;
 b=dDQjn3BEiESuGARJC9jNBwdG658+cEG0j4ei0MToF+B1CVLye9sBkVzhgzIKtEhVFV
 CStkLOBH9NT8YmWmnMyI/BFOAJ/xGwSoFyrXnzSztSPf7BtNdYb583i8tkGQy71JdOS2
 jJyKtyqtZgHcQycirbKSYVe6hvh0nwixUFwnI73WFMcPJkQ9us2rmxvfRSuOqt9qw0qm
 EwDjwxK3/aGYam0eNmdSFZ0dUXwegCwjcXYYQDymP5a4lLHQPVnDMUZGi6+7tQ4YO2vB
 Xj0uSPPood3JOUaBvkKcUYKL5rnGXORJM9x/bf83paRLL0x+EWBAGDrQyC7nKFHQzkxa
 uk3w==
X-Gm-Message-State: APjAAAUdxRvIm0JjJO17ZP5c6lDzcM4q8rMhLxpr87BD6hPdqpCZK2++
 bZBdrh9H/ir3lGkqwNYyYlvrYd2fkP0pIrY1w5hRGQ==
X-Google-Smtp-Source: APXvYqz5LOEB9s2OqMjty0jYbtXUdpN+kp2ylp0cSkbHQ04peEwg1pMKiviLKAaJ+3YuYy7zx4RK3jDALLqtgCR4gQI=
X-Received: by 2002:a1c:9c14:: with SMTP id f20mr3130702wme.16.1553261911835; 
 Fri, 22 Mar 2019 06:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx>
 <CAAhSdy3UoX9gS=9YN6m0=qA2g-m=bw-Y-N-5CAFQZcnKA04C5g@mail.gmail.com>
 <20190322132650.GC19263@infradead.org>
In-Reply-To: <20190322132650.GC19263@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Mar 2019 19:08:20 +0530
Message-ID: <CAAhSdy0=J6+YHt3ieFrkBJhaE2EXvjqkaWOorm46Mgv+QzyUiQ@mail.gmail.com>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_063833_424265_BC7727C8 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 6:56 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Mar 22, 2019 at 05:59:07PM +0530, Anup Patel wrote:
> > > I've drafted a patch that separates trampoline_pd_dir and swapper_pg_dir
> > > setup, if it works, the __load_pa() and __load_va() conversions can be
> > > applied only to the trampoline initialization. I don't have riscv hardware,
> > > so it's compile tested only.
> >
> > I had similar views as yours but I found that trampoling_pg_dir is totally
> > redundant and since it is part of __init section it will break runtime hart
> > hotplug in future. All mapping in trampoling_pg_dir are already covered
> > by swapper_pg_dir. The PATCH4 in my v2 series removes trampoline_pg_dir.
>
> Can you please move that to the front of the series?  Killing
> trampoline_pg_dir sounds very useful indeed, while I'm still not really
> convinced of the 4k mappings to be honest.

4k aligned booting is optional and only enabled via kconfig option.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
