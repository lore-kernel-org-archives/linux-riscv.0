Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B5DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvaOsmruZ0iiJbnHvm681px/hDJVmxU+djWb7nb/ytE=; b=rya/X3J0ACxzpV
	tuXb7eWcfMM1ZKx47CZ/Nn3FR2qVwKLbqFP2jNhchoVA29aVQyDcktGZCXbocIzYBmMW2XUk75fqx
	bf1v3nAIn6s9Zl0xuYCQ9UZk6yZjaw5O3AvYmbKZlQUPynTBjaKcvg2oTiqFkYjPB1SMXfcOD9hxN
	pSoM9QLC5opQ170sR960Smv9WQozUMV2Y//nBiZPCvd26lfi/2d6itKhRCyGbdSsmTOpJuIS2bhns
	PYtn8wcbNYpQKBaRIETxVyddfd/JAALFt2Ds5fRdu+nZvQr5nwRkKCuClsUEUCNPLgjg4T10hl2/A
	1SfvJUHBzr7lcbGecXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMQd-00F28t-4Z; Mon, 04 Apr 2022 13:07:31 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMQY-00F27D-0R
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 13:07:29 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3DaN-1naWPf3skf-003aKQ for <linux-riscv@lists.infradead.org>; Mon, 04
 Apr 2022 15:07:22 +0200
Received: by mail-wr1-f43.google.com with SMTP id b19so14394633wrh.11
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 06:07:22 -0700 (PDT)
X-Gm-Message-State: AOAM531r2HMi29vFlZn4w+JirpUJTmsqTo3YFS4cztJa8Xeg6PBqM4d1
 wewgCB8X5oxKm+NS4RMiHPPdpdWt/0A1TH12wWI=
X-Google-Smtp-Source: ABdhPJw/K8sYYGcKUcFc4yTdlw9+SOONHXxVgL1yKBMYbeG+8L+jnCtk7Gvh9Q0ehBPBsNK344bb2OH5nTaXtmbK2/w=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr17503109wrh.407.1649077642251; Mon, 04
 Apr 2022 06:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
In-Reply-To: <YkmWh2tss8nXKqc5@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 4 Apr 2022 15:07:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
Message-ID: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Christoph Hellwig <hch@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:mJ+au8FQ+D9HCkusVrcVGffUfp1wZFurs9AlrFBSwYKgH3hl4g+
 fsPRADNHzmLD561b6/zp3xJiEhMoVHuuXU8svjt38kx8UmV+g+Itw5slHoASTGH+owIVOUw
 EXlGDxeFLiW3nQq7eDcC17GS75xxGeU0TxPWQ2TCDkcE1AcdJ7MnUk6keCkIksjGWGf+CUN
 ze6Unq1O//BhEXp6mamqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0TMOM2P4UyY=:OH0CuIMPYymsjLtlVoMkF9
 rlEi0ysXDnRXoCz1zsi+d2/GMf3hDwWrMu23nyUeAdZaEVD3ss2LPNKaBGIbHR/54nT+MHBTD
 K3X13J3A1G4G97bDbOC8YFEQnUhnKg7gOKdTfgOEH9WXRTBs6Pfh6VuSuln9t794EW2Rx0Hir
 KMZ2w0RGPFWuw5q3kmg1SEhUNKV8Fmr3D0OmrsyiR+BjQaL9ZaEdXCm4hPzTanggUcMiHh1Cq
 pErPXMw1Kt0I24ealEoauaaOkfy5R0+gHqT42GszNTs8R+0SpXbI4RNmj1+XeoaA+TdZ0xxT2
 DDC663nlCNJ6wr8Em0zFHPkdF61KHiP/5nZio+P0kF/qWF1ivoYe2P24s1uLn6rNvanT8bXKi
 fxNv2ckxh80b0V7NJBnPOqfHjIIoEnPwqdTUrQu51Ded7cOpMsf2XnNlfVQzNgMxUa/3yKRfP
 pPPd0knHxRpJxlGszoCB0N5ZAjI7SObVnr8h/dMcM6XeC8mlR6MsKUho9QPfyrewPjTldqjmU
 bmsd8CLLDOCngLoro0jGrCRGaFLExQN2HwdgMt4PJkKehp3GJiS/6wra8+1ZCM3RZa5J/NFNR
 QzNy5MYDYtcTcS5YyD9ot7Szdfzy6Nx34nk0ysWL/iWF4AciSFtWSB2uJhXofZfXNspk/FXnq
 DNRc89aErMTLPF1qPdY6ZdP+tbDuaMo++QwISg78+sjnwfDJrFIbpmehRu0IrzNlPOxBT23CQ
 6bNzwvQjINnLTqbL1scJV0Xb5Ryo/RQWdusgsuyZOevsCOYZAILhkkJ23/+9GfDanjss3226T
 kiwY2jIx0VDxs8Z0ZHCxTkerP7VCbrshG93zwGN6DFxIzL4Js0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_060726_371256_B050ACEB 
X-CRM114-Status: GOOD (  19.02  )
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

On Sun, Apr 3, 2022 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Mar 08, 2022 at 09:19:16AM +0100, Arnd Bergmann wrote:
> > If there are no other objections, I'll just queue this up for 5.18 in
> > the asm-generic
> > tree along with the nds32 removal.
>
> So it is the last day of te merge window and arch/h8300 is till there.
> And checking nw the removal has also not made it to linux-next.  Looks
> like it is so stale that even the removal gets ignored :(

I was really hoping that someone else would at least comment.
I've queued it up now for 5.19.

Should we garbage-collect some of the other nommu platforms where
we're here? Some of them are just as stale:

1. xtensa nommu has does not compile in mainline and as far as I can
tell never did
   (there was https://github.com/jcmvbkbc/linux-xtensa/tree/xtensa-5.6-esp32,
which
   worked at some point, but I don't think there was enough interest
to get in merged)

2. arch/sh Hitachi/Renesas sh2 (non-j2) support appears to be in a similar state
    to h8300, I don't think anyone would miss it

8<----- This may we where we want to draw the line ----

3. arch/sh j2 support was added in 2016 and doesn't see a lot of
changes, but I think
    Rich still cares about it and wants to add J32 support (with MMU)
in the future

4. m68k Dragonball, Coldfire v2 and Coldfire v3 are just as obsolete as SH2 as
   hardware is concerned, but Greg Ungerer keeps maintaining it, along with the
   newer Coldfire v4 (with MMU)

5. K210 was added in 2020. I assume you still want to keep it.

7. Arm32 has several Cortex-M based platforms that are mainly kept for
    legacy users (in particular stm32) or educational value.


       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
