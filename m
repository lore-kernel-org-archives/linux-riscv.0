Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413D9C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nqdvM3Bs4EM5Jo/wl4LV1ZxoppklQzazqMlyRgZi04=; b=JvSt3EE3To/oqt
	ubUXQRTmojYN+KNhnwKDpQS6iFaxHlFbfDAPtpoymstJbKKAY2UjCnysc51x2oEkHnVVDYZh+BQtl
	4f7l6/NtE/kTkTsMybR0Gk9XDedL80JxSEi52+slBbIMYhIvdpTT4bedCzsuzLG1phTNRboh472q/
	D6FjBEtIlN6sQPSHZ/tfCWEYXfRaIF/Tx/36IteDaFsnFNsTnHdqAmJPy9yt8FCvqt+QZTLXIEz0F
	OxQZx4j0rxc5xSOYT+SWgar1cBdMq+g2P4cKleRhOnXtoc3i3yfqqkujUXAnekNc1ycKkFqW4eaTX
	enolo/Wzlp2/dLFUHf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHdb-00C1Dn-JL; Sat, 20 Nov 2021 04:06:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHdZ-00C1Ct-4x
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 04:06:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id n29so21432132wra.11
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 20:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zj9LfTNeTtv2Et/1mlpKwDYIeE5/dUFTD8JTvEnxqpY=;
 b=gL+1wye+8tSijwPvsxt81oz9tLdroFm9IWJipQoqjbCaI/uFM2dzeJ6FbVmkodDl6I
 QgCy4zb7gq03bonQqBoK7XBmkUz9Q4NzFkwzc0w7b3/zSsGl1VPdCMilTLhR56AdSRQV
 VvjHVZfCct72kAGTP92CrBnRrwykiVaoCUWJgoCxNaAbvWn3qd8xpnoiclBRhr1zivzZ
 h/FHintKsinuNMDYQZPAZf0oQPS/iN0sNfyCh16Qf5zkckQTknq2bpBsTnJO6/BM2nzW
 EkX2BcqvcEJ1uintBz20F+AaqIp6ueX6RdhKSeuKrUkC8VhTxrnDXEFy2RRLDxY9p6Za
 rbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zj9LfTNeTtv2Et/1mlpKwDYIeE5/dUFTD8JTvEnxqpY=;
 b=Ta7MjW09gvNlac/LwBJGR19qZ1406fCNILi9sFmUak0WraSBWmL2USwdCU3mFjtNEK
 /qJKN5nZ+3HszZKfzsKylQW4hDZOdvKNTKWXBYVKdDm749pTpBpRhGoQRRsQnSIo0a0F
 dlPCgWfgqqC8GucgSf9h2HbQCbyP3aZDV0gbWz+bF5KhVmggeIa4KkbhE/qXDyocSSr2
 gHQJDl6BLsCRp9wjFPrNm2WsBl+XCLzk01DXU4JKTMPIJ1hDK/ecmMTxSh3FK4IqUk2k
 TkE2GU8KWIeNhXtyRa6xmgdFdX1kl0ubv6R+i1kgH+qv3TRKcRazqFXyyE1e0qXrX0MV
 BzwA==
X-Gm-Message-State: AOAM531Bm7ffGrm8aP4eK1/+qgHGdhVamJFPfhzm77Ef9ARIjK/AHYBc
 /x3PPym7Jo7EtnpW3Y5vQlLQzQbyCEiqq6VkiUHv3w==
X-Google-Smtp-Source: ABdhPJyrydUzo3fszfZv36X6eCZ62sCl5xd+acY4/EMveMQCEW6TSBW6pj9/RihmIVL7rsGQjCnlatx6PNsal6/p7kA=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr14422173wru.363.1637381158507; 
 Fri, 19 Nov 2021 20:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-12-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-12-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:35:47 +0530
Message-ID: <CAAhSdy2PadUtRDxUy3Y16RBSEubDqUE_sE2Br22OZA+-HBGnrQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] RISC-V: defconfigs: Remove redundant CONFIG_EFI=y
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_200601_213842_026C64ED 
X-CRM114-Status: GOOD (  13.82  )
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

On Fri, Nov 19, 2021 at 10:15 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> We've always had CONFIG_EFI as "def_bool y" so this has always been
> redundant.  It's removed by savedefconfig, so drop it to keep things
> clean.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index a72dbd74b93d..f120fcc43d0a 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -143,4 +143,3 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> -CONFIG_EFI=y
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
