Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D46FFF8860
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 03:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vnj1RhtTBP/6nHzj1q1Cq80gvvyG3ErQZWtJ94acVpU=; b=tS4YFinUjbISTY45wh3er4drU8
	Eyz0ifYyu3ELAyFsxsA+GSeqt8if0cvKIfYs8pVz02duB+LTmCf0UP4zn81VkHVs8u9PCNkPx8jLV
	aJ0cmrSttgcB4zbypgq6LKW/8raAB6tpxXYkPKPZ9o/YQd+0O0kUKy6SOFoDnYZmsDb13L8FPkSZR
	M0hNX8EEpnJJfdjl086DlpwIfmbgaectKA6Hf1SzVV+GeRs5Kt8QcxWDtISnkuavuUqtTSrtw9sni
	KolrIk1cwByFNxHJ7BwiR5e0QLmZpYoZEsNOMKr0fKE+9QcCr8jASSZDwkRXDsGUffddMs/ZsUxmQ
	CmXBLyWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCwd-0000000G7Wz-3Iv1;
	Mon, 27 Apr 2026 03:47:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCwb-0000000G7Wd-2Cc5
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 03:47:38 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6794b8699b8so762725a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Apr 2026 20:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777261655; cv=none;
        d=google.com; s=arc-20240605;
        b=U7xCD2AZCBJ4vKxuQSB8i1QUbEqgiTk5+gshQdnAh1lbKxnItdx8GnjnT54ef396jR
         lmFmA327Qu0TbvrARadnYbqLm8ANThNd3EJS7h1Q++wRS6EuRA2Rob4xqZ8s5E9893/X
         xZmVuH3Dp1oabpD8f5dbhcuwCYmXGE9qHCVMpeOOiqp9RnCfH3VwPjUsxUnijXlIHaOU
         ygfpGnFrAmWxLpgBB0wgw0P675R5s74wHLfj2Uo7DU5iuSGNB44BTzR+VnHhBcLBoFIF
         7kKIIN32pSkY/Q/JD22vAiYO6cackMJQS2BxTpCc8M2NReLnd8RegXDDLPH9mOyORUqC
         TNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xVJ2BhwV83qVllgr6FcBChE7Y8IWtvvWh4DLe0sZCm4=;
        fh=aC9qxksevgzbpqvhd/Ci/JyBJRLE8GTceZYRamiJix0=;
        b=bulFoRoADnYbwd77Vz6YdPyN5jLF/XAygkElcl1HGurqIkbi9SrU6bEpXqAJK1dcGr
         z2yCI28jeS7J3g5trhYehwSSkSPmlF0KhirszlqVGGcGWq1yKwEkmXXjBMRjLDTfXZy9
         0iHTuYsP6rocKNPsD5kfEDwB5cdgGWluk5MIhNfsAgykgtOxxCB55YATSWWNPqDJWWO7
         Np0L2MPLEtXkuoY/bkuuEE3maotb1CXE5oF+JD6wSpCq57MIoMsoXgcYhisX2MJJH5uK
         T31w5Emwlllu1UmAfqEeZrjCl6IRt/loKehAaUJLgAo9jCnn4vKmF7UWOia0GTh1HHqC
         ShVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261655; x=1777866455; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVJ2BhwV83qVllgr6FcBChE7Y8IWtvvWh4DLe0sZCm4=;
        b=q7YRVRQjih1VG5HizjjgzUs/1rq9+uS6QEkrn4EEznZUUMSKg+8khmtYg7BRLSnxQ1
         U2OOhDwkQVBJNAz/vvS3ahk/6UOvPNGzZRXhln/mZLIOxW3y/BumS490IKhlLLYT1siK
         CpKA0T35SOC2JMPfd8TwBT6YSDrb706CO51h5bkvPcj7kcmXN42rm3o7ip3B2Bf8RIXj
         bGuPbCvlLHKyPtZX3/jR2B1Y49EosTZiUPRDg9lsOouGqSzWttKXhhCYdTN4uSDpmOtY
         9UiaaSqOUhMUDkZG4MP/i/hTb+UKtpmdQg/XO18BGrgHssl2HEVGTzuNEed0/x4tZDQw
         h5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261655; x=1777866455;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVJ2BhwV83qVllgr6FcBChE7Y8IWtvvWh4DLe0sZCm4=;
        b=pgadr8K0Opxph6h6gn0vbFoEF2o5KziauDSfGIVZquBWpWK5E1Q9brujG2k6gmNkh7
         zLgW+2DxeBUN2fUQnhcGMC3XvspNFivj34XyHf+yeU3OJtM81j4m1DZxdFAgy7TtC5ww
         dNNl3uMnMFfZao3xOZTDVLcMPOGLkwSd4nqmc9XenTaU0QyfoLpb/OIGeGzONBAC1v+r
         35S9GGDM2qUqUxeBwqc+82WdeCjQTg8bH+6BRML0gm66BmFHoJ5DKlgHpAPa/ViTeZ7n
         EVyclHYbv1cq8NUiL1LI9IIyq3g1/8PO2ECInylxuWfh3QDnQW9rrGYl1RTuE2zIKO6U
         2dGw==
X-Forwarded-Encrypted: i=1; AFNElJ9YsgX0ISW7knIjlsi04pEBHUggCi7ote2Rf2AogdtgR88llEtlIryJoQFHXkBIazd0b05J5jHshbCqUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhg5o9PIxocPVV2uQFUWKKPdnyoAf0k4U6z6Hbw/6+6WFYe09r
	iQbJ5wlLl5qZFXJ6I1lbemuepsbUfD2207pDgASRU3c+ri+5P2nZIPBFf/KqSDp/0vBEpYXbMeF
	X2WS4GGbeBQwnc2q+9Y1mWoi7HijK/cE=
X-Gm-Gg: AeBDiesauv7yHWAiWfpOjQSsvF6ejLxYpe//oOX4Ph4grjh2i8NAaoTnvtyV4UThfL2
	kq47b0fXfTNwoLkdZLW0hz9YH4Ni2fiUlWxu9V2Lp4FvwFwtNjRDagmiZm6vDN7FEIB15yvkqVQ
	QsXKfykYTtAjDl6cs2KN2nUxcN4r2j+lUWaXTQFGBpGD865XZ633EoTn3eFAJWtCJR5DCV+zVlp
	PE1N/jkieO/XxIsUx3xNtBCnialCcn+wMjZv3FQIhehazrxQwxJntemCQd70NB/bk4MjUNQcr0B
	vOt7+joNlXbumO8=
X-Received: by 2002:a17:907:7b92:b0:ba5:391e:20f0 with SMTP id
 a640c23a62f3a-ba5392d6e53mr1928899166b.42.1777261654816; Sun, 26 Apr 2026
 20:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
 <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn> <DH40Z14EHV40.1I443BTRU720F@linux.dev>
 <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com> <aeqF0EiP4b2Ycj2G@aurel32.net>
 <CANAwSgR-rJ0O9SJc92z05NVez6ZSfn9Gx8fJr3Be3QfCpR_XBA@mail.gmail.com> <ae4DJnPhTNZzah4p@aurel32.net>
In-Reply-To: <ae4DJnPhTNZzah4p@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 27 Apr 2026 09:17:18 +0530
X-Gm-Features: AVHnY4Kd1tmDpw3x0MMZE8yuua236pOpxKWTw0tSGmfS2g3ngBY02gZ65A7OoU8
Message-ID: <CANAwSgRiuO+YhvqXOYa7eSOrwJSyUVOO4w+v8QYi45rkVAUL+w@mail.gmail.com>
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
To: Anand Moon <linux.amoon@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Troy Mitchell <troy.mitchell@linux.dev>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204737_614054_555595C9 
X-CRM114-Status: GOOD (  33.46  )
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

Hi  Aurelien,

On Sun, 26 Apr 2026 at 17:51, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-04-25 23:12, Anand Moon wrote:
> > Hi All,
> >
> > On Fri, 24 Apr 2026 at 02:21, Aurelien Jarno <aurelien@aurel32.net> wrote:
> > >
> > > Hi,
> > >
> > > On 2026-03-16 08:19, Samuel Holland wrote:
> > > > Hi Troy,
> > > >
> > > > On 2026-03-16 2:23 AM, Troy Mitchell wrote:
> > > > >> I think the reason we ended up with the "unsafe" implementations of the
> > > > >> reboot/shutdown functions is that on the backend it is usually SBI SRST
> > > > >> calls, which can protect itself from other CPUs and interrupts. Since on
> > > > >> K1 we're going to be poking I2C directly, we run into the problem
> > > > >> described above. So all of these should disable interrupts and stop
> > > > >> other CPUs before calling the handlers, and can't assume the handlers
> > > > >> are all SBI SRST.
> > > > > Yes, we cannot assume that all platforms rely on this.
> > > >
> > > > Why isn't K1 using the SBI SRST extension? Resetting the platform from S-mode
> > > > directly causes problems if you ever want to run another supervisor domain (for
> > > > example a TEE or EFI runtime services), which may need to clean up before a
> > > > system reset.
> > > >
> > > > As you mention, other platforms use the standard SBI SRST interface, event if
> > > > they need to poke a PMIC to perform a system reset. Is there something
> > > > preventing K1 from following this path?
> > >
> > > I went this path and submitted a patchset to OpenSBI mailing list doing
> > > that:
> > > https://lore.kernel.org/opensbi/20260419150857.2705843-1-aurelien@aurel32.net/T/#t
> > >
> > I just wanted to check if we can use the latest OpenSBI image with
> > vendor u-boot ?
> > If so, can you share the details of flash the u-boot and OpenSBI binaries? .
>
> That is a good question, and no this doesn't work out of the box.
>
> > I was working on the watchdog driver, and the system hangs at reboot
> > So, what changes do we need to make in OpenSBI to handle this issue?
>
> This can be addressed either by making OpenSBI compatible with the
> vendor U-Boot, or by making the vendor U-Boot compatible with the
> upstream OpenSBI. On my side, I prefer the latter option as it also
> keeps the upstream OpenSBI compatible with the (future) upstream U-Boot.
>
> I have just published a blog post about how to do that:
> https://blog.aurel32.net/upstream-opensbi-spacemit-k1.html
>
Thanks for the update.

> Regards
> Aurelien
>
Thanks
-Anand
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
