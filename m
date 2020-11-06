Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A07C388F2
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 08:12:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0231A206FB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 08:12:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qactCIgg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="xEpk9Oeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0231A206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5Yx39KRWej8PR3psxCkOtFZw4YgaSBQVuCpO0Hc2Qeg=; b=qactCIgg7pV5aRlahru0/gbz/
	ubG8pu3lPNbS7kMwoVgfDBxW6kn9xV6GSeRZcD1QVJReo4wt5eGd3jl9ITEdKULIrdSxJRZZnfLOM
	ma0xKhxZ3ucgb1pzczlXwogfKvDHVrLEwA2WOKgHicFdsdx/CJNr/DfOA1l26bJNO88imuYF7p1Y7
	J3ZjIBvilP0Y32V7CFgBvQX3oDpN2N9MAH1RSlrraBl9hliMUWKU8kS6e/nGW9PwpXyAeLop3vMjQ
	Elod4ctGCRglKEHOZIfp8gXXGpEsgztEoaKgy2duIyIu3/dJ/E529kFiJ49jPel9h7T/e1lCJKPHN
	gaRwN5B5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kawqk-0008HF-Tr; Fri, 06 Nov 2020 08:11:58 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kawqh-0008FS-TP
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 08:11:57 +0000
Received: by mail-pg1-x544.google.com with SMTP id x13so352244pgp.7
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 00:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=nl2gOQJsn3R5FlGmFMYIhkURcmKqqMa3zHkLCq1t0Aw=;
 b=xEpk9Oeh7f3I+9/gTukNIEnoWwbjWmLjU4TDeWnSzvQ1A0cupFlA2T16UYK+zxbIus
 4y2maE0uVaNwxdV4MBk6k5bde8rAirUprLpzlLPXq5UJckG5DaR0oHYXGd9JRj0Ip2Ic
 XsSeHOdu8+580ytgr9XB4BhlYuvBHdrPPW7St81aqo44K98Qc0yzzyW5hDhsS5H6F+4d
 OPNlN8jrWd7gnEI9DNNlBMXpoYCLPAAC4kD77Y/9iCRfXY8qgQYNZK9YhWSke0Rtac4X
 S4CZIN1WiJfsA3ZkC/JUk9cnD/XySA5k/Jr1iUBzT3uXsAbr4gaV3rkDSTEAFSirsxdw
 vpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=nl2gOQJsn3R5FlGmFMYIhkURcmKqqMa3zHkLCq1t0Aw=;
 b=XimcSJWhd5ggHCLINyAbSkUryGfdnhce7zI1giPD9+pzUixI6J0PKkMgHCk5R6UL9j
 1kbYERDdwbNRBqSsBgjiQlJTEBS6hdcRe8jEZgTAHgGmomUnwR8H3dZDEFPRnhI9VeLa
 Ovn97gzkOv5Fby1vN5s5QhgYbzAIhWL5YnOn9zKJF+vqYMe8Sk7vhZN4A1NllIMa3Mi3
 LN6KH0mRzKHxqi/cr/oMpCbvVBLZjiQryFO73H+yJBzx9NEqlnHpkUTbFTinGN2DAqUv
 XVZ4AKkIrgGxsHofb0xOEhIw6pInqFJzkbnDaYETibCfDykYfSzRfGEOtHVwKNp8p8bD
 TgtQ==
X-Gm-Message-State: AOAM532g52HlaaX9S3yyOQ1Ir2Okq3kmPW5IQpV0XvTXBk4kJuQJE/MU
 uzukO8XDA8lkHcx32stOX30AQA==
X-Google-Smtp-Source: ABdhPJxo1RjiXlb6GUZrxagqr8RXpC5+1TbkUZrlXDd0OeSammEjxunDGz18YSh3pIvPN5PbT7NENw==
X-Received: by 2002:a17:90a:bb0e:: with SMTP id
 u14mr1240572pjr.112.1604650314068; 
 Fri, 06 Nov 2020 00:11:54 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a22sm1062947pfk.29.2020.11.06.00.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 00:11:53 -0800 (PST)
Date: Fri, 06 Nov 2020 00:11:53 -0800 (PST)
X-Google-Original-Date: Fri, 06 Nov 2020 00:11:50 PST (-0800)
Subject: Re: [RFC PATCH 0/3] Add Microchip PolarFire Soc Support
In-Reply-To: <CAOnJCUJUmzVon3BWH6Du08mpgLu_rHJEhdOkCXUK4N+ZftkCRw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-484134d1-59a4-48ca-84da-9569d5f70ad7@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_031155_995732_1C15ABEC 
X-CRM114-Status: GOOD (  34.19  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 robh+dt@kernel.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 padmarao.begari@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 05 Nov 2020 23:37:45 PST (-0800), atishp@atishpatra.org wrote:
> On Thu, Nov 5, 2020 at 11:14 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 28 Oct 2020 16:27:56 PDT (-0700), Atish Patra wrote:
>> > This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
>> > It is rebased on v5.10-rc1 and depends on clock support.
>> > Only MMC and ethernet drivers are enabled via this series.
>> > The idea here is to add the foundational patches so that other drivers
>> > can be added to on top of this.
>> >
>> > This series has been tested on Qemu and Polar Fire Soc Icicle kit.
>> > The following qemu series is necessary to test it on Qemu.
>> >
>> > The series can also be found at the following github repo.
>> >
>> > I noticed the latest version of mmc driver[2] hangs on the board with
>> > the latest clock driver. That's why, I have tested with the old clock
>> > driver available in the above github repo.
>>
>> OK, I guess that's why it's an RFC?
>>
>
> Yes. The latest clock/pcie driver did not work for me. I might have
> missed something in DT.
> The idea for RFC is so that anybody who wants to try the latest kernel
> on a polarfire board
> has a meaningful way to test it.
>
>> > [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
>> > [2] https://www.spinics.net/lists/devicetree/msg383626.html
>>
>> Looks like this one hasn't been merged yet.  IDK if something is broken with my
>> mail client but I'm not seeing any github repos.  If this depends on
>> not-yet-merged drivers then it's certainly RFC material, but aside from the DT
>> stuff (which should be straight-forward) it seems fine to me.
>>
>
> I think it makes sense to take this series once the clock driver is
> merged at least.
>
>> Since you posted this an an RFC I'm going to assume you're going to re-spin it.
>>
>
> Yes. There are some feedbacks on DT which I will fix in v2.

Thanks!

>
>> Thanks!
>>
>> >
>> > Atish Patra (3):
>> > RISC-V: Add Microchip PolarFire SoC kconfig option
>> > RISC-V: Initial DTS for Microchip ICICLE board
>> > RISC-V: Enable Microchip PolarFire ICICLE SoC
>> >
>> > arch/riscv/Kconfig.socs                       |   7 +
>> > arch/riscv/boot/dts/Makefile                  |   1 +
>> > arch/riscv/boot/dts/microchip/Makefile        |   2 +
>> > .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
>> > arch/riscv/configs/defconfig                  |   4 +
>> > 5 files changed, 327 insertions(+)
>> > create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>> > create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
