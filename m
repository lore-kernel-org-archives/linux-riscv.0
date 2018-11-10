Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAF1C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 05:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCAE520825
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 05:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWbWR62F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oOIWZMOQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="Zgtuo0EA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCAE520825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEyK07W/LIThCofVLAE0+UhsF/3txy1p6DbFi9S8Wtw=; b=iWbWR62FEYJeAk
	JDdbBCVt3Yc+SrN05lamhzKNvVrJ5BunI0YU0MSGlMwO1HDRiGE3IDt2rR6BkleenVTjZ0bpIprex
	gp+CEwG1xAlaegXOdP152DxGGtyV90afcwwPSAyGTaIySF07ImcLNb0fNUivtqX+3y6g1jiFQE6Ck
	7DQnMEbLLSBjCbxrEl8HzLSshXufPs/9gAGvFpIch7KXRzEziDez8N+Pxq5bmqfuQ4AGKBS6a7wl2
	8NeHg5NMI12K++UJJV93QoAbVSjVWi7UI+REIS1x6CzVUlho9R6b1vg2/k71xXyS0U3rhVQTNcdj4
	Cu2nUIiEhE8FScnSGNuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLLrw-0004GO-Mo; Sat, 10 Nov 2018 05:31:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLLru-0004GG-Ck
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 05:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eduMqZAjdxi0bXO4Cqz7j7ggQ1HkY2CswbK/hJ6Ndyc=; b=oOIWZMOQxcV0qQnumFjzEWm+H
 aq48pprFMS3SBp3G4ltCvOxhS0ymWj1uxukFBlKxG/WaKichS7lgoMM0tBVdXuW/RuZbdzBA/6oVs
 xtpvOtQo5UVx8XOlZNgVs9JN4Ca/eIl9AcWVlBXvsaTCJ5i2ePQ0pYPf3IO+ueLU5vJaUw9YiFFwc
 D/1eUDUpaTKs8icdPQhLBQ0BTH+DC3xss++xfYb2fmkRtjwKofa5mrw9z9H8UdwU568JQOV+aN2rq
 C+NJcs5OfZ5OaViqRNe30E6Yw4yHmKMchcn9vxhH2kcdLLRAc67oLMhAmGfb67zEG/FCJTAIQctwb
 G9NkAo62A==;
Received: from lkcl.net ([217.147.94.29])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLLrr-0001Hc-4H
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 05:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=eduMqZAjdxi0bXO4Cqz7j7ggQ1HkY2CswbK/hJ6Ndyc=; 
 b=Zgtuo0EAnTFvuTyc6e+yiLy2rwNz2kRdOWPHQkHw9M+OmcwrBVnibgonUK66FZ9ptqHV38U/gO9lUoixZ/7Fv3zC32mqup1tSpwRVrNQ4PrmmGJS5Ra6rXZBI0od/8IX5tB3CG6ivPnbtoaz7QNBGm2LEflkAvH/BMxO+durrEQ=;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLLa9-0003kW-Hb
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 05:13:17 +0000
Received: by mail-lf1-f45.google.com with SMTP id z13so2787653lfe.11
 for <linux-riscv@lists.infradead.org>; Fri, 09 Nov 2018 21:12:56 -0800 (PST)
X-Gm-Message-State: AGRZ1gK1g1GyIqG8rBYdJtOHfxdTRahScGQzgGq80/IkLjasipc49ez3
 /4GyvcdeEUV40VY/MKU+G9PqeCsFdGd8kSH2Z2Q=
X-Google-Smtp-Source: AJdET5dksH1Fum25Kx9GhZVTIPeLMV3xkUI9pRpcuD44mk0YIvEn8opiLo0tRQHNdtu74qeiILytuUmGlo2vCVhGCIs=
X-Received: by 2002:a19:4f0c:: with SMTP id d12mr6729218lfb.121.1541826771027; 
 Fri, 09 Nov 2018 21:12:51 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
In-Reply-To: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 05:12:39 +0000
X-Gmail-Original-Message-ID: <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
Message-ID:
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: atish.patra@wdc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_053135_284721_A94875A8 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 olof.johansson@gmail.com, alankao@andestech.com, abner.chang@hpe.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 agraf@suse.de, zong@andestech.com, Alistair.Francis@wdc.com,
 paul.walmsley@sifive.com, mick@ics.forth.gr, sw-dev@groups.riscv.org,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110051239.d0OP7FmBi8IHDYa5zKSW-96ChCuoLVR7jdityDugebo@z>

On Sat, Nov 10, 2018 at 2:42 AM Atish Patra <atish.patra@wdc.com> wrote:

> ## Conclusion
> This proposal is far from perfect and absolutely any suggestion is
> welcome. Obviously, there are many other functionalities that can be
> added to this proposal. However, I just wanted to start with something
> that is an incremental change at best to kick off the discussion. The
> aim here is to initiate a discussion that can lead to a robust SBI
> specification.

 very cool, atish.

 i would very much like to see the optional addition of multiple
serial lines, by adding a getchar and putchar function that takes just
one extra argument: the serial line index.

 there are a lot of different uses to which mult-serial lines may be put:

 * boot message separation from console login
 * boot management separation from other purposes (u-boot/coreboot)
 * virtual /dev/ttyS0-3
 * clean UPS reporting and management
 * remote virtual machine power management (power-on / off)
 * simple bog-standard multiple virtual login consoles
 * separation of debug messages (stdout/stderr) to ease debugging and
development
 * remote and virtual OpenOCD and kernel debugging without disrupting
the main serial console
 * PPP serial links.

this latter is one that i am particularly interested in, as i would
like to be able to boot a full GNU/Linux OS on spike, given the lower
barrier to entry in making modifications and experimenting with spike
than it is with qemu.

 if spike were able, through a multi-serial SBI interface, to have a
PPP serial line, it would be possible to run a root NFS (or other
network block device) without having to sacrifice console access.  it
would be possible to create an initramfs from a lower-capability
system like buildroot, containing PPP, enable it, and pivot-root out
to a full stock GNU/Linux OS such as debian or fedora.

 so there are huge benefits, reducing the development barrier to entry
into RISC-V experimentation and debugging, and opening up a much wider
range of capabilities and possibilities for machine and virtual system
management.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
