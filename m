Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86780C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 02:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5+y2pdpRUPjZxYgib8qaOzvMkRXDOCwlsURCWt1brho=; b=vAs1BRSStyPe1mPpUnCZIbCyMK
	s6DDwWQ145m2OmW1EZeyoAHdEm5S7yQeeR04sgzMkKNgqN+wc2eJZaXsYpPKWwN8Opdv1YUmoXkN+
	1BOzg4OPUdlZXGxr+kFfha5iXGcDaP5fK1Vzys7e089PY6BWZbVGnWaRTvvq5ifQRRsF1Er2YDAWs
	LXEyrbrNg8yCDqyx1kpT4huQjJS2TcAxI1IsavqCTbPQMx4goxHgNBcT+tiHoBrTWsNl3r7kb4S/5
	Mgw9L6hPWcW2N+OjRzAd/voXRFRVg8f46MWx/iEOoB6pFTL01axoC4rUwmFlKVDbFKkpOHXYZLywO
	XjOR0EpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhMsu-00BCmB-LJ; Thu, 21 Apr 2022 02:49:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhMsr-00BClA-T9
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 02:49:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id c12so3541252plr.6
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 19:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=P94H50ZarQqSfjwX6qGlCq6elP0Tf7lTSu8KGyKb+rY=;
 b=NmTYbo6mbyC85rDGus5JqFccbJXfd2GmU3Z5l9EJZY3ikIpv8qzK4CJI1biwBjog68
 uKCnx3g23B7HGglBH11l1vwC6RKGBI76JMUE6V3VmgwGsTvN/d3gM+Vrt2xbYbYfS0mA
 BOnEhCGcIxGV03jm/ELUziu49+6lf6Yev49wJcKMYtMD7pBcoITrNctKx77+8XMpqn8o
 EouXOnWTMnnI8frgbpNBP0F5xc6Uaof23VNi30CipucmraQ/6rbr6rtawk8L5exHiULk
 Bwrvr+QiZUbbUN9YUTsS5Y+LsQ5PyL5H+yztSyURyY/djpYFFEmyal8lzb13zRm6dMFa
 /PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=P94H50ZarQqSfjwX6qGlCq6elP0Tf7lTSu8KGyKb+rY=;
 b=MapF4YLPU8G1IitQid9zKHRdN+o3Co2OLNY0i+Uzl2aPxeyJ4kdtFMyeQ9cwRczb3n
 Irw4hnJZYtmOWUNJzjxJ8nurXVNIQXsxP2t0UaqyPyvWR6yJBvbrkgM+jAnPdR/3in6N
 lrurOwDcoHn9jrWYKDgTZwuDRI82tLlQROoTPiZ9fcff/XEOIw16pZIyvtHt3WVb0HhA
 lpYSoirlbWmyeKEucMlOLQA9ICGcgsyHhHmNhSY/f4FzJULBqzmb0OVRbSXhxd6DMekz
 /SVfoXMugLHwOgPPaGXWbLh3XIhdkKCUy4vOURmAhOndlEHEyglStrooWIxkxzmwXpXV
 2wGA==
X-Gm-Message-State: AOAM533hUaNw9l2AVNJTfKKNL/htB94eYLzLdCVBXZgweB82d4J6PM7x
 z788EFhJxW+buBCMA8xqJwS+0g==
X-Google-Smtp-Source: ABdhPJzYf8MazJedjnUo1QmWR9gJch9FCr1/4uhLrPs8Uz9WPO7vyXlCpgNvcS+TLPR64gKmBq0U6g==
X-Received: by 2002:a17:902:d303:b0:158:e38d:ca18 with SMTP id
 b3-20020a170902d30300b00158e38dca18mr22977358plc.167.1650509367634; 
 Wed, 20 Apr 2022 19:49:27 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 m13-20020a62a20d000000b004fe0ce6d7a1sm21685124pff.193.2022.04.20.19.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 19:49:27 -0700 (PDT)
Date: Wed, 20 Apr 2022 19:49:27 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Apr 2022 19:49:25 PDT (-0700)
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
In-Reply-To: <CAL_Jsq+5TbfFxD3p4ckvNw=jFweuvjQPRQfjmvPqZJga25o0pA@mail.gmail.com>
CC: zong.li@sifive.com, vkoul@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, conor.dooley@microchip.com, geert@linux-m68k.org,
 bin.meng@windriver.com, 
 green.wan@sifive.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh+dt@kernel.org
Message-ID: <mhng-aab8c429-f5cc-42a7-b281-02f4a389e0e3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_194930_201172_6D163966 
X-CRM114-Status: GOOD (  26.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Apr 2022 07:25:53 PDT (-0700), robh+dt@kernel.org wrote:
> On Tue, Apr 19, 2022 at 7:18 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Mon, 11 Apr 2022 04:43:35 PDT (-0700), zong.li@sifive.com wrote:
>> > On Mon, Apr 11, 2022 at 6:48 PM Vinod Koul <vkoul@kernel.org> wrote:
>> >>
>> >> On 11-04-22, 10:51, Zong Li wrote:
>> >> > On Fri, Apr 8, 2022 at 9:13 PM Vinod Koul <vkoul@kernel.org> wrote:
>> >> > >
>> >> > > On 28-03-22, 17:52, Zong Li wrote:
>> >> > > > The PDMA driver currently assumes there are four channels by default, it
>> >> > > > might cause the error if there is actually less than four channels.
>> >> > > > Change that by getting number of channel dynamically from device tree.
>> >> > > > For backwards-compatible, it uses the default value (i.e. 4) when there
>> >> > > > is no 'dma-channels' information in dts.
>> >> > >
>> >> > > Applied patch 1 & 4 to dmaengine-next, thanks
>> >> >
>> >> > Hi Vinod,
>> >> > Thanks for your help and review. For patch 2 and 3, does it mean that
>> >> > we should go through the riscv tree?
>> >>
>> >> Yes
>> >>
>> >
>> > Hi Palmer,
>> > Could you please help me to pick up the patch 2 and 3. Thanks :)
>>
>> Sorry about that, I forgot about this one.  I just put them on for-next,
>> there was a minor merge conflict but it looks pretty simple.
>
> Looks like you applied patch 1 too which Vinod already applied to the
> dmaengine tree. And you changed the 1st line removing the "# " before
> the SPDX tag which results in:
>
> make[1]: *** Deleting file
> 'Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.example.dts'
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 52, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py",
> line 434, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py",
> line 119, in get_single_data
>     node = self.composer.get_single_node()
>   File "_ruamel_yaml.pyx", line 718, in _ruamel_yaml.CParser.get_single_node
> ruamel.yaml.composer.ComposerError: expected a single document in the stream
>   in "<unicode string>", line 1, column 1
> but found another document
>   in "<unicode string>", line 2, column 1
> make[1]: *** [Documentation/devicetree/bindings/Makefile:26:
> Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.example.dts]
> Error 1
> ./Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml:1:1:
> [error] missing document start "---" (document-start)

Sorry about that, I cherry-picked them from my working repo which I 
assumed was the same but I guess had some nastiness (including the patch 
reordering).  Then I also ran check in the wrong working repo, so I 
didn't notice the mess.

This should all be fixed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
