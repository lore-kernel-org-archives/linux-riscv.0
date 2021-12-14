Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A2CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 21:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPo95ZWW/QFW4FPnnZByiEvpc+/qIB6YXdh8DRgqtT0=; b=LWFAmFRb2GLQLv
	M0tU0TXzvaP9Zc0zgUqDXN9yU2MxmiYkvF9DBbXVr+ZKWwugn9di9yr3OCG46FYKR24uF3BzF67UR
	/ubvQ+fGu8QYUPekuLUFDoOm1Ksd1xozLUPmsyAn4XLx7xigkuEOP/UklpP+2r+JJvjl/SnNMKIEy
	rKjxxixsjBHlmR44Y8lpbp5Q5Rwjbqg1r7RWXLRlS+7khXi4M6lrT3jpAl7ek8dmD64PrQ+xCbpVK
	4RcOOy/hDEmAHkWm9wniqaCr+3p7c5DnV+YlkjCSoBSnEg9i6jzSSSt7rSXycI1UzB2LkDos0MFJ1
	kkyFIx0dlLLSf1S1gaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxFNN-00FqIX-F4; Tue, 14 Dec 2021 21:30:21 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxFN9-00FqGK-Gq; Tue, 14 Dec 2021 21:30:09 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M8hMn-1msafU0JeL-004j4Q; Tue, 14 Dec 2021 22:30:05 +0100
Received: by mail-wr1-f46.google.com with SMTP id e5so1278950wrc.5;
 Tue, 14 Dec 2021 13:30:04 -0800 (PST)
X-Gm-Message-State: AOAM530Pcd2VvmNiPZwAdsS0tvb/shRFVPYrZW9vycLn/WfGCoesVm3o
 GL0JOsf+6NCJ8chs2wcR+rZiLwBoHI/Jo2Wgj5A=
X-Google-Smtp-Source: ABdhPJzcegCK9YMz5uc5MEIV8QsJtofipyRKfw/xnhV/DeCAcLktjJYubEtld7Wf6tdXnIwtumoe9/2/TOT0iKczb9s=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr1617828wrv.12.1639517404563; 
 Tue, 14 Dec 2021 13:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20211128200647.147058-1-kernel@esmil.dk>
In-Reply-To: <20211128200647.147058-1-kernel@esmil.dk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Dec 2021 22:29:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
Message-ID: <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
Subject: Re: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: SoC Team <soc@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, 
 Fu Wei <tekkamanninja@gmail.com>, Arnd Bergmann <arnd@arndb.de>
X-Provags-ID: V03:K1:F8T2dN1rLs1dPUgJvLWaVnxRujoQzP3iNrj3pJVIYPE6uQPBjW+
 GuNqnhJYTgldB0xSJ9mgOhzL80vgGLG1vh1bdqkF8kX6wNehsijPTgATTiZMoyueqEwYSzd
 pMjQIywsvApJF6t8ICmdY+PmFmnJoLcBQtk2lmlgqJJOcYFj5TLgpugs+vGiZgDTHHax5da
 xpQqh67BS4067IUdLoFYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hP8CRkaRY2M=:iWfbZV+vez1usDs2CY8V7G
 LL3wQeuc+lah+WyN4mWH+Zaixtxzxq8bttc2PeVxCDz4OueRJldVI+5+3o0pOpUpzrPpDVOR0
 9n5vL2A+IDNq+vMd+K83yqwYr6YzT4u9DFms40GkUsk8bNoBL7eGWqAPies0cmswUdmE4L8S4
 QraR2By0cPhDVaetlt7TfMm8PFwxJQ4L+nsz4m0kyqsjsIV2BXtEvL61NoxRILVPEqCINS0QL
 beIm/cRghvrkMO4YQgcGdVPEZPpX64zaBaU1ACKS/EsrkX8LNHe0pc6Vcv4D4h6z/CY16gTNW
 FwwfiQZJHdQ9II+6kyY7Zy7CueQ9GsfZNb3lPMjG9F9cmQsYX3LlgNYBHHlYbX8+0yn1/+gYK
 o82cxvdW0BLcxsKoNKAUrrM/Y0IU34B9VKgEMlnpNNqBuREb3iiK++EBQJNaw1NHRAnJJewGx
 xyO3jOv0NGe2+Y1Mi2UKkgfExsAs4aUcvgQQwPIup6tkpmbGDrtn1O4ewmkI0InXyQZvyGcyY
 54ZBzc3JPGtDibQZQKFD0nP3a/9o4tAsGK25vX1tRfp/k34BwBNagCZ8CXQQ73icwwwELt2rL
 U/VXPOa0I5h3KjkXu0olnMSMX6JHa9jPgbKue5UXfw0P+rTCWgXfXr/Hb6HY/4Qvndu/Zs5NY
 v2D6hUJlz3prX1eoOAOOXrMkOcxOZNuueFgqZYXJkoxon3oW8jbYQM/kJME2n/u30BHzDUeWS
 ItKH+5FpN8EGcdKHkjrShBbcpj5hahevVqbcaQkBc/YLcsZUw1QTDexOn5UCIBzc5rPZBV7bM
 PMi7kn9+0JfaImyurqgk4VqhM8bLXwzZFhOF1Hq7SYdhejif6E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_133007_884850_E97909E9 
X-CRM114-Status: GOOD (  12.79  )
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

On Sun, Nov 28, 2021 at 9:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/esmil/linux.git tags/for-soc
>
> for you to fetch changes up to 398d6e139782d1ce2c9822beb8effba0c9c51cc4:
>
>   RISC-V: Add BeagleV Starlight Beta device tree (2021-11-28 20:07:09 +0100)
>

Hi Emil,

I just got through my backlog of pull request and got to yours. All of
the contents look
fine but I noticed that there is no tag description. Please sign the
tag with a gpg
key and add a description that explains the contents of the branch in your own
words, the same way you write the introductory mail of a patch series. This will
become the description of the merge commit.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
