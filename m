Return-Path: <SRS0=rvuQ=AN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3A9C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 02:05:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC5EF2064B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 02:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uQrM5Lis";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jRfxtjAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC5EF2064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jc1p7KHeQuJc4+MPV50XXwx8H9n2g8tedhW/PqOe/kY=; b=uQrM5LisM2rcnyFoTZocnHvMA
	WFOsXtU1tNu0JQz35y+lSWz8HbGKu8WLSa/gG67oHUXM3E3/FOKbTFDERCAkFuY8PerLKGM5+y1rV
	pxta0NBIY2oOUmaa+llhsY76qz4/6UhNY/eSRata3CwjIX/+IYqHJQQMUwJVW3xM2rg2ifRkO90s7
	EC5MPEb2EFXMMgarlvcHSHUpLDK6I2bNMXamoVDNfu+tkizHg1bXHLMj89KTJxXl+JDcPHPEaps5Q
	h2jzJyQoWFqtmQGiM2z2NhHVjn8iZ244cNHRJuIkuYzkSo3TLaHV5R+QE5nVsnAMxZPjo8mWP0Lmv
	ofArKsY4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqob6-0005vE-NJ; Thu, 02 Jul 2020 02:05:08 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqob4-0005ug-Lc
 for linux-riscv@lists.infradead.org; Thu, 02 Jul 2020 02:05:07 +0000
Received: by mail-pl1-x641.google.com with SMTP id j4so10654679plk.3
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2020 19:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=si919z/gb731yIF4miWJ8lqQQhvtP91BYHd7qG0jbYg=;
 b=jRfxtjAlsyBpIblze7OawLvko6wtB4QyMbwgZ2kojyHVMh5x2d0X+6XWyvzIh3tYQG
 s3FMJLAYwapjMMIhNjP2Y/ErtQ9LzTAqVz/W/8jecDF/v+BD58/rhMmisvD2QPA1fJL8
 Bb7MHyXobsSUvZORXXjir+iZh59/Fx21HpqZUMngEAq5tdapymT2k2DTG0TaXWR6hYre
 wg0keASysO4otuHcVjLlUCagcFtvIPJ8JCDIDoc1WN3S/RCRAQTueSqdvYVIxXiT2+uK
 NyWPV2aMvVq73zkN8l94NEc7eGCYBjr2BqrSXfVb5b1e2j9OB2yLoTj11sjOoCdXF8Su
 Qx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=si919z/gb731yIF4miWJ8lqQQhvtP91BYHd7qG0jbYg=;
 b=Sul3iwVoXMLAm0qYjwVGsW7gQv7fv8Xy5v+iLdYn7TsxHA7pftyUu5E8OuNZQLhAFV
 zutI61EWkrU2ISpjCTlMV4im3xjLl2NdLmS/uz0k2BwFM/rz3kFYVhq4QoV7iRc6eIGH
 U+CaZKGCxItZf0Yz6qxjYXEokPMp3O9gxaug2xtz7ld0AvckaoXO8KBKXxdHkI8hKDhm
 +E1QwxPDYfB3gsybgmdrQmdhzdWq6+pq0tmT+wP2WimJQ0zfXCCrSjRAK1tioq2hIWFh
 jpxTwlNup5XDc3m2Suf3L1qckJHWyQjdPwiQhkldbrhVKPLsTXoCN6+8v+6EuFrJ6E98
 t00Q==
X-Gm-Message-State: AOAM533m1WY1v87ih6+4airqUvYsRPVLWC2Nq/RknEGEMYsad6ZUHuNq
 r+7YvHYQKfTNVZVyBbnZaJNY5zJDjjsGlK/nGWSl7w==
X-Google-Smtp-Source: ABdhPJzQ68RugUh9HRrPoEsLeqYaVA3vLoMmx53B1gD8wvkBF7BYoTJ+JI3IXYsgPtf7gVwTkCrizpyAsOEoYN1dyGI=
X-Received: by 2002:a17:90a:e602:: with SMTP id
 j2mr27157132pjy.200.1593655502448; 
 Wed, 01 Jul 2020 19:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200701184751.84008-1-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200701184751.84008-1-pierre-louis.bossart@linux.intel.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 2 Jul 2020 10:04:51 +0800
Message-ID: <CABvJ_xhm9a0nzBJ2YKvwm5vKZt3Xp0H9z6QakD0EYK7vRR-_AA@mail.gmail.com>
Subject: Re: [PATCH] riscv: asm/gdb_xml.h: use __maybe_used to make W=1
 warnings go away
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_220506_757474_EC2A8DA7 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 kernel test robot <lkp@intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 2, 2020 at 2:48 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> 0day/kbuild reports warnings with the ASoC codecs compiled with W=1.
>
> In file included from arch/riscv/include/asm/kgdb.h:109,
>                  from include/linux/kgdb.h:20,
>                  from include/linux/fb.h:5,
>                  from include/drm/drm_crtc.h:31,
>                  from sound/soc/codecs/hdmi-codec.c:19:
>
> arch/riscv/include/asm/gdb_xml.h:23:19: warning:
> 'riscv_gdb_stub_cpuxml' defined but not used [-Wunused-const-variable=]
>    23 | static const char riscv_gdb_stub_cpuxml[2048] =
>       |                   ^~~~~~~~~~~~~~~~~~~~~
> arch/riscv/include/asm/gdb_xml.h:16:19: warning:
> 'riscv_gdb_stub_target_desc' defined but not used [-Wunused-const-variable=]
>    16 | static const char riscv_gdb_stub_target_desc[256] =
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/riscv/include/asm/gdb_xml.h:13:19: warning:
> 'gdb_xfer_read_cpuxml' defined but not used [-Wunused-const-variable=]
>    13 | static const char gdb_xfer_read_cpuxml[39] =
>       |                   ^~~~~~~~~~~~~~~~~~~~
> arch/riscv/include/asm/gdb_xml.h:10:19: warning:
> 'gdb_xfer_read_target' defined but not used [-Wunused-const-variable=]
>    10 | static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
>       |                   ^~~~~~~~~~~~~~~~~~~~
> arch/riscv/include/asm/gdb_xml.h:7:19: warning:
> 'riscv_gdb_stub_feature' defined but not used [-Wunused-const-variable=]
>     7 | static const char riscv_gdb_stub_feature[64] =
>       |                   ^~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>
> I don't know if this is the right way of solving this issue but this
> error is now consistently thrown in kbuild compile-test reports w/
> W=1.
>

Dear Pierre-Louis Bossart:
Thanks for your modifications. I have fixed the warnings in my latest
KGDB patchset and sent it out, but the merged KGDB patchset is not my
latest version.
I have sent a patch set to complement the missing ports, and I think
these warnings would disappear after this patch has been accepted and
merged.

Here is the patch to fix this warning:
http://lists.infradead.org/pipermail/linux-riscv/2020-June/000660.html


>  arch/riscv/include/asm/gdb_xml.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/gdb_xml.h b/arch/riscv/include/asm/gdb_xml.h
> index 041b45f5b997..c28fc1a1d230 100644
> --- a/arch/riscv/include/asm/gdb_xml.h
> +++ b/arch/riscv/include/asm/gdb_xml.h
> @@ -4,23 +4,23 @@
>  #define __ASM_GDB_XML_H_
>
>  #define kgdb_arch_gdb_stub_feature riscv_gdb_stub_feature
> -static const char riscv_gdb_stub_feature[64] =
> +static __maybe_unused const char riscv_gdb_stub_feature[64] =
>                         "PacketSize=800;qXfer:features:read+;";
>
> -static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
> +static __maybe_unused const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
>
>  #ifdef CONFIG_64BIT
> -static const char gdb_xfer_read_cpuxml[39] =
> +static __maybe_unused const char gdb_xfer_read_cpuxml[39] =
>                         "qXfer:features:read:riscv-64bit-cpu.xml";
>
> -static const char riscv_gdb_stub_target_desc[256] =
> +static __maybe_unused const char riscv_gdb_stub_target_desc[256] =
>  "l<?xml version=\"1.0\"?>"
>  "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
>  "<target>"
>  "<xi:include href=\"riscv-64bit-cpu.xml\"/>"
>  "</target>";
>
> -static const char riscv_gdb_stub_cpuxml[2048] =
> +static __maybe_unused const char riscv_gdb_stub_cpuxml[2048] =
>  "l<?xml version=\"1.0\"?>"
>  "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">"
>  "<feature name=\"org.gnu.gdb.riscv.cpu\">"
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
