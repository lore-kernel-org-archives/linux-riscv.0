Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7D7C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E685214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:09:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FVJ0R0iz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBDCnbtF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E685214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcBr7H1nfSHcGATRCNczEByllMngBUtqcD9uDQHLFDM=; b=FVJ0R0izhEMjSh
	uHAMZnoiOT7LmtKCZdhRVsbpEVBZ7Hi7U95lfNWGG+6UXCBKO76IWc5kORYHUAa8eZ5Qx8zfxRDWb
	eZQ1gU+t3RNRjEmcl7YJrD0kp8DNLrMuud+bBQtTuL3hRglbqG0HHc7QX6WlV6cIDaX5SJl+PiXoE
	Z72YWIivH558FNkUiRtMDJZXl84OA5PItewYd/IdCz2qC3O+1d5RUjyqKfUsqT/AA2KLFVsH0BG6R
	znV5Z/NqqsOhmJMlfqQwIylwlC3RFui1F7FIWpUxs4mTpmmiXIVvvD7QPlrGQ6HMjlcUN7Lxmzwoz
	On1ArlRhwrETqGAs0gaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3kte-0007qi-I2; Tue, 12 Mar 2019 17:08:58 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3ktV-0007hm-KG; Tue, 12 Mar 2019 17:08:50 +0000
Received: by mail-ua1-x933.google.com with SMTP id u1so1030910uae.12;
 Tue, 12 Mar 2019 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VAhBKSluy9/y0u5fxmhSeKzynL6GOY0xNa5QYg/ZBOo=;
 b=UBDCnbtFGcPoGpCPVFGI6o7l54AzhSolT/2eOhiJJNRuX1HfnWi+oU3rVM+t/WlIU6
 mixSQsgJz66Rb1/sKu7Ajt4GVCs1CWy0AxPSZwUnkKOVp6/8luHFQWPnrpAvC00klVkG
 Cma9OS11qmJ24tup0Btuwveo2UfFY59R08EXIh/jyyGFyKsgXaHU3Bg49U+ccc9DO4a7
 Y+9TflQ2AMoGdoOusykwmDTgGynHBd+iwfzW/SK04JuWqLGNMLEQ+x3z8nTwZhv8n1X8
 NNAcF+MRNHxHBCdcTt8GEpngLLoOkbDDdMLqZGoN2vw8plnOyj66wqzNOvaO9RYPJ37J
 B/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VAhBKSluy9/y0u5fxmhSeKzynL6GOY0xNa5QYg/ZBOo=;
 b=A9Ob6/qVIHjl1oDfGxlto3/UhVsmeJDVVCzeBByjCzxTUEPRZuZKcjfEZ8OjrmmcBd
 uJoyYR05heeuzOka4at2TNI2KGzho4XwmEL4xZVdNXhmkdgeGIhbas8CAkUTCo6Ws/Eh
 zr0NRfeo73cfabPIW69Zo6AFRC1u6ZtDPMnVukaLz9xY8844M6t4jcifnh+zOezNGUPQ
 Toi9zqwcMeYu1kxNMHzdrdiaOAaw6t8YdF8uZAC+zcx8hlP9U9oU2+ZSWpjps8HfAWNI
 hzKYA+nCrs3EvgnAq2ZM5SwmhBnYeWZCLZVBAUU+fh04MJe6GMJ1+rt9qsukxrDNjdSR
 e9VQ==
X-Gm-Message-State: APjAAAUMORUKsRFogKAH6j0Qrl2/cFkJk6U34gV6GIt8KVeWqpWdxiS5
 ycFRnOGuyuYH8k+mTWXt2mGcVxUA1HWykXqD8vQ=
X-Google-Smtp-Source: APXvYqzErWdVjSzoR2G+d2qDyp51YMf8lr9xsoZq0mBgPAxWVzauaJxpJ8TZiNcuIpybuFPpkFoPiUjmeJ9bHVEpQ/8=
X-Received: by 2002:ab0:4222:: with SMTP id i31mr20580160uai.47.1552410527892; 
 Tue, 12 Mar 2019 10:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
 <2c5d240eabdb56913f4abcc9aacf2b6b@mailhost.ics.forth.gr>
 <CAOuPNLg4dfoovZ_eqL5XvNW3Ak9dGeCVr=vbG6G5t4Rxo-nC9Q@mail.gmail.com>
 <00078ed3-fe1d-722e-0943-80bb189ee3ab@arm.com>
In-Reply-To: <00078ed3-fe1d-722e-0943-80bb189ee3ab@arm.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 12 Mar 2019 22:38:36 +0530
Message-ID: <CAOuPNLhvPypbTU+AbodYTFdGHW_Uqxj4UQvo6usNCKZh30uTig@mail.gmail.com>
Subject: Re: ssh session with qemu-arm using busybox
To: Suzuki K Poulose <suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_100849_673873_D1152EDE 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: kernelnewbies@kernelnewbies.org, qemu-devel@nongnu.org,
 open list <linux-kernel@vger.kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12, 2019 at 7:41 PM Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
>
>
> On 12/03/2019 14:02, Pintu Agarwal wrote:
> >>
> >> -netdev user,id=unet,hostfwd=tcp::2222-:22 \
> >> -net user \
> >>
> >> and you 'll get guest's port 22 to be forwarded to hosts port 2222, so
> >> you can do
> >>
> >> ssh root@localhost:2222
> >>
> >> from the host.
> >>
> >
> > I tried many different options, but unfortunately none worked for me.
> > 1)
> > qemu-system-arm -M vexpress-a9 -m 1024M -kernel
> > ../KERNEL/linux/arch/arm/boot/zImage -dtb
> > ../KERNEL/linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -initrd
> > rootfs.img.gz -append "console=ttyAMA0 root=/dev/ram rdinit=/sbin/init
> > ip=dhcp" -nographic -smp 4 -netdev user,id=unet,hostfwd=tcp::2222-:22
> > -net user
> >
> > With this the eth0 interface is removed, and I see this message
> > (although login works):
> > qemu-system-arm: warning: hub 0 with no nics
> > qemu-system-arm: warning: netdev unet has no peer
> > Booting Linux on physical CPU 0x0
> > <skip>
> > NET: Registered protocol family 17
> > <skip>
> > Run /sbin/init as init process
> > ifconfig: SIOCSIFADDR: No such device
> > route: SIOCADDRT: Network is unreachable
> >
> > But, ssh is still not working.
> > ssh root@localhost:2222
> > ssh: Could not resolve hostname localhost:2222: Name or service not known
>
> man ssh
>
> +
>
> Make sure you have sshd in your custom rootfs and has been stared.
>

My busybox is a very minimal rootfs. It hardly contains any commands.
Is there any precompiled busybox for arm (cpio image), available (with
ssh, scp and networking in-built), which I can use directly to boot ?

what else I am missing to make ssh/scp working on qemu ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
