Return-Path: <SRS0=kt+C=4Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A11C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2020 04:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FB22072D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2020 04:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2gYTzoQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="zHH9ODWp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FB22072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SSZsDGhSerIIDmdwfHH/fp67wbrGstkqSnkD4VLOqfg=; b=J2gYTzoQ7CShgsR2A35C4Q2Dj
	+3389wnxtz/DtVSg16uhGelVy9dhRdrne/giHNozuWA3xqB/oDHf7blHLweXZHdjvoLohT73zDpIS
	nyPgD1zaTWoIBWFtIOBdZ6pYsuXvDl9dUzxzvt/SIhsSKPF8iYdIEzxUpdSGz2cnwvC0jA2dK5gz6
	K0jMOLSgxS1EB1xxCFM2I5D+3s03K4lfQg0gXODscPSexbr+i8lIevShFvfYi2kJ73ig+/3ed1ygV
	z5t4TFzzu5WQ4U1lSH2jxI/2LL9ch196oqMIpunx75ZeEvKyxZ8WqkvbqpnYmrgN/DXSmvk9x73pY
	0tSkclz7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAQo4-0007FQ-7R; Sat, 07 Mar 2020 04:11:20 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAQo1-0007Ez-PV
 for linux-riscv@lists.infradead.org; Sat, 07 Mar 2020 04:11:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id f7so23306wml.4
 for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2020 20:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SSZsDGhSerIIDmdwfHH/fp67wbrGstkqSnkD4VLOqfg=;
 b=zHH9ODWpEEjd7VAR28iSRqlGtRioLOYQUWUFGlv4o8+dLQOhk5VjziTn1f+E95ihhb
 CTERTcdNiiil33dQ1nNUy9M37n0v2q+FUTEvLW6XzzRU7PErlamDzt6ztMmJw7GERTDK
 Ly14NpgrafuJ+nF9qGPwv+yA/iJTqVlzp1jxFOuM8RO87aNhnjPXqBmVFYI4PRmHq0Ck
 QcV08z84jE0EPt/VC4E2S9kT6OpAURsyD990yPBbHZcDBN/38/CdtacGitKJkGAPtbPh
 gDPPD6/P4utab3N7jeqYCsNN6fZ34z5VVxKuXdcSAUArFey0UtWU/mT0PnuRchZBzFUX
 rrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SSZsDGhSerIIDmdwfHH/fp67wbrGstkqSnkD4VLOqfg=;
 b=LFBYicTQJZo/cJzHxZkxIKGJ6fV1hEuX6Ka4KIjNe5CFAMnJsiOXcgan+ppQucaKT+
 a/IuBL8kGN2lOxE3ynIEZ2oA4Cf7wPqquj+AzBc6Ir3BDUbhfJz9WUBVKvCxd3Pj6cDI
 0Qvc1ZQwLA+eepZSB2D9vW8O+VVIDBhUfKG/bHK1fDu1cgoU587PYaIefddgww6ogEO+
 xY0F9DosjJkk2SY7X/Keq01yoVCgxnk5resXw9ni8Pe181luGg4S5LFL+eDpvxyGghtS
 GoW4b3b+1dIopmNdzjlg70S35gulJoeqa097YgyJLFBmUYqTas7Ft+//A3V+rbVQ5xpb
 Ra0A==
X-Gm-Message-State: ANhLgQ0VE7xZaE6rXtDh+Wi4E/MWW5Zn7xQ2ltC2zZGpyuFAbGpWqvn8
 43rjdrkEAES2InhB0ng+qsZm3geAMv7TunvnyqdtWg==
X-Google-Smtp-Source: ADFU+vtqaA0F9Q60uXR+uM5+FlPCBnDvI1tJu7lU8g6uNTE65nqEwqd5TdxO1AkmYCXDwzcHn5PVIFhHg0uPHipYsww=
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr7708658wme.26.1583554275520; 
 Fri, 06 Mar 2020 20:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20200212103432.660256-1-damien.lemoal@wdc.com>
 <20200212103432.660256-9-damien.lemoal@wdc.com>
 <CAAhSdy2sP5L2ijtOC3wcYZVcf=0KfAobHzKC+CrAYLvmAO9cTg@mail.gmail.com>
 <BYAPR04MB581624CE07B742A7D1B1F53DE7E70@BYAPR04MB5816.namprd04.prod.outlook.com>
 <CAAhSdy0Owsfa6wGyBnHoOONN3uc93YwXpnGto_U5OE3tTwnGYw@mail.gmail.com>
 <BYAPR04MB5816A2497FA764FB145D350FE7E70@BYAPR04MB5816.namprd04.prod.outlook.com>
 <CAAhSdy2eGOifb6Ov6hfy=-QsjvFCKgZqqX1tiq1Z=wFrLpz9CA@mail.gmail.com>
 <BYAPR04MB58160D1A2B74D22332E498C1E7E70@BYAPR04MB5816.namprd04.prod.outlook.com>
 <c8197767-c76a-efc2-1fe2-250840bee605@gmail.com>
In-Reply-To: <c8197767-c76a-efc2-1fe2-250840bee605@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Mar 2020 09:41:03 +0530
Message-ID: <CAAhSdy1bfg3hT=VuRTtGNA9PZT-hGQ30Ty7kLGVVuvQFQ8kC8w@mail.gmail.com>
Subject: Re: [PATCH 08/10] riscv: Add Kendryte K210 device tree
To: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_201117_882892_E2B9BA7D 
X-CRM114-Status: GOOD (  27.73  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 7, 2020 at 5:48 AM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 3/2/20 12:08 AM, Damien Le Moal wrote:
> > On 2020/03/02 14:05, Anup Patel wrote:
> >> On Mon, Mar 2, 2020 at 10:21 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >>>
> >>> On 2020/03/02 13:22, Anup Patel wrote:
> >>>> On Mon, Mar 2, 2020 at 9:46 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >>>>>
> >>>>> On 2020/03/02 13:07, Anup Patel wrote:
> >>>>> [...]
> >>>>>>> +       sram0: memory@80000000 {
> >>>>>>> +               device_type = "memory";
> >>>>>>> +               reg = <0x80000000 0x400000>;
> >>>>>>> +       };
> >>>>>>> +
> >>>>>>> +       sram1: memory@80400000 {
> >>>>>>> +               device_type = "memory";
> >>>>>>> +               reg = <0x80400000 0x200000>;
> >>>>>>> +       };
> >>>>>>> +
> >>>>>>> +       kpu_sram: memory@80600000 {
> >>>>>>> +               device_type = "memory";
> >>>>>>> +               reg = <0x80600000 0x200000>;
> >>>>>>> +       };
> >>>>>>
> >>>>>> No need to have separate DT node for each RAM bank. This can be
> >>>>>> express as single DT node as follows:
> >>>>>>
> >>>>>> sram: memory@80000000 {
> >>>>>>         device_type = "memory";
> >>>>>>         reg = <0x80000000 0x400000>,
> >>>>>>                   <0x80400000 0x200000>,
> >>>>>>                   <0x80600000 0x200000>;
> >>>>>> };
> >>>>>
> >>>>> This is to match the U-boot device tree that Sean wrote. So I would rather keep
> >>>>> it like this. And strictly speaking, if one wants to add a driver for the KPU,
> >>>>> having the kpu memory segment for it separate makes it easy to reference it from
> >>>>> a kpu device entry. But granted, the two sram segments can be declared with a
> >>>>> single memory entry.
>
> There is no clear documentation on how to do this, so I have been mostly
> just trying things until they work. In U-Boot, separate memory device
> nodes are treated as different "banks".
>
> >>>>
> >>>> But, that's not the preferred way of describing memory banks on the
> >>>> same machine.
> >>>> Usually, we create multiple memory DT nodes for NUMA systems.
> >>>>
> >>>> You can also refer various ARM/ARM64 DTS files.
> >>>
> >>> Oops... Sent an answer to this to the wrong email... Here it is again:
> >>>
> >>> Yes, I understand. But in the case of the K210, that last 2MB segment is really
> >>> special as by default it is not usable as regular SRAM. I think it may be better
> >>> to reflect that in the device tree. The K210 soc_early_init() call back can
> >>> probe for that special entry too to see if it has to be turned on for use as
> >>> regular memory or not (i.e. if a kpu driver will use it).
> >>>
> >>> Since booting Linux with 6MB of memory will be even more challenging than with
> >>> 8, I agree that we may never see the case of a kpu driver being used. But I
> >>> personally like making that special case clear in the device tree. No strong
> >>> objection to your simplification though. So if you really object, I will go with it.
> >>>
> >>
> >> I understand that it is helping you to distinguish last 2MB segment but this is
> >> also possible using with single memory DT node as follows:
> >>
> >> sram: memory@80000000 {
> >>         device_type = "memory";
> >>         reg = <0x80000000 0x400000>,
> >>                   <0x80400000 0x200000>,
> >>                   <0x80600000 0x200000>;
> >>         reg-names = "sram0", "sram1", "kpu_sram";
> >> };
> >
> > Nice trick. I did not know about it. Will use that then !
> >>
> >> The K210 soc_early_init() can do the following:
> >> 1. Find memory DT node having device_type = "memory"
> >> 2. Find bank number for "kpu_sram" based on "reg-names DT property
> >> 3. Get based address of KPU SRAM from "reg" property based on bank
> >> number found in step2 above.
> >>
> >> The reg-names is a standard DT property used to distinguish multiple
> >> memory regions of device. Same can be used to distinguish multiple
> >> banks of memory DT node.
> >>
> >> I am not adamant on having single memory DT node but just wanted
> >> to let you know that this is not a preferred way for non-NUMA system.
>
> Anup, do you have any suggestions on how to describe clocks for each
> bank? I think the kpu sram may need some clock manipulation to work
> properly. Perhaps something like
>
> sram: memory@80000000 {
>         device_type = "memory";
>         reg = <0x80000000 0x400000>,
>               <0x80400000 0x200000>,
>               <0x80600000 0x200000>;
>         reg-names = "sram0", "sram1", "kpu_sram";
>         clocks = <&sysclk K210_CLK_SRAM0>,
>                  <&sysclk K210_CLK_SRAM1>,
>                  <&sysclk K210_CLK_PLL1>;
>         clock-names = "sram0", "sram1", "kpu";

Yes, using "clock-names" to distinguish different clocks
of same device is the right way.

Regards,
Anup

> };
>
> --Sean
>

