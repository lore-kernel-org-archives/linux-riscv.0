Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C2FD5E370
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0E45gVMj4mjHdbpicrE6MOLSPyJxZsaODWLUWF732pU=; b=4fN5Yc/7rgnIl4
	p0mDgmmNoYh9YHtFjeE0PDm6dBdf1pb7iD2y3y32BRPbQ//l4IrkBFVAIQWIlIF+TQn0qpW0Xg9Zk
	Z2MMvIke8KAzoruHXUsJoP4GYBMco+gBzuE5fmtLKXyd/VsUq3fO/BZnho1p62aIsCWxe1J/9Ye9y
	rCfoZSMChMjy9E7MuDbSLVrp9/rXom6135+ped6l5VPPkzESqBr6vFtbW+2knVeWi46gVQDJL65st
	64OPhHSroq1ZZKfi4X4ZM5VrFHEXjwXhjOvl09N0ukxHDBq6uaMxjVGshlZJMeB2fN9wFjtkDiifb
	cFG39uHnoA71blj+1UEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVzl-00000005KyS-23vh;
	Tue, 16 Dec 2025 14:25:53 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVzj-00000005Kxi-0sZZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 14:25:44 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b265f5122so1325829e0c.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 06:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895140; x=1766499940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmGEgPuORdt944lP1ts1khomkIbW9gpZnOcj49yyNCw=;
        b=LtgcqcQKXWJWGfNajcpNibTgiRERwLkk+CwAJvhNGG1FfChBYLUQ0fkTr8BF0jWUaL
         Bg0vu58Z8prN7nRDaDBvf4LXjPof3ldzVZPT2U+nNQCANZnEbi9yKtWnafo/6j8QUY/u
         bEb7S5UbYncxv9iRWHPNM6r70Tl26JjLv4x0PXH1wgbwnHuXjvzhO3W5aBQLI/LSFSNJ
         7rLZGtohLY/Q0WOJE3OXqxvB+WWJh4SL2FwH4KufZDHI/ACeqqNaY7DQwQ3SJdYUh0W9
         fusYrq2UNfR6t1dHZwIsG9zo1mFy+E3nwrjkZBHmFYyQvWf37JqjQA7OR36CD5jf5ghI
         tyvA==
X-Forwarded-Encrypted: i=1; AJvYcCV+QWchkyKz3znleIMOKwhmsp3Quw2MfnMBaqBy67oX915TVj56XLfTkOx7jORFEjSNs+bzULHOrc2Jbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpw4A2JUJxJKJBHnOFSWLRz3SaR4JimuOK0QezVVBhq5eGQ2zM
	pBjAgngfCcRtNOdpMgmxc+YeBYEXikZv9XNSqQiyjDoqa78pK2qw8Il2F95yWdqw
X-Gm-Gg: AY/fxX4iXrre3szuBKkI77HzuNToOL7vkkfr5ShgQa9+kIkhCe+VKlygIsx3e10nEkj
	Mg0TbN5IXKYQ/0sMfrp6v5ZGFM6bUk7gaPBrIGd3FtTL0aR5WxZ6VSDtzOBtVeidTncY8/ktM3B
	uqBd7t1/nhEou94n91BkEq+lBAKA9sddFmtgq//Xq/0si/szsmiY0In4UWnHkzHa8cmbswpuLfp
	mtCyxS6utDr5eGG3K1hgee4WBkIr7sKbrR4pO9q9ldqVCVJ9CTSD3TttNYXI2SBdL9bcurMsVvr
	TQh9dL1jMTU6R/OYDaAZu999YjiVnbPtQnI5AOvpEe/6pcZjnEZpGOR2aIqOnAPmh0UZGG2FztO
	GKULGsIPIR6ct/vb85ULyBwRH/WcVmEVSKkhaF2EVuoYrsmUkyMB/aJZjZ4Gdl+CSSZ220xezQR
	dFEPtDhOOvIKg9G56idO2eFClMyG17la00ADOC4tqrZR2QxpS/
X-Google-Smtp-Source: AGHT+IEHtWeFIiEZKRv6Y8KZO3QRZozVTm52xn44/ezOmLWopMMgCgQstmcXReUzECxO7l9ufzMH8A==
X-Received: by 2002:a05:6122:2888:b0:55e:4bcb:6baf with SMTP id 71dfb90a1353d-55fed62673emr3475077e0c.11.1765895139173;
        Tue, 16 Dec 2025 06:25:39 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93f5aefd79csm5975645241.12.2025.12.16.06.25.38
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:25:38 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so2050130137.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 06:25:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlc+hjXS1Dnx+DSF6es5UtAkwByVx2EL/Fey+Hki/eAjmlq9621s6RjiSBqOmCgRqStVFRB+egbb8m+A==@lists.infradead.org
X-Received: by 2002:a05:6102:644d:b0:5dd:b288:61af with SMTP id
 ada2fe7eead31-5e82729e0dfmr4099799137.0.1765895137738; Tue, 16 Dec 2025
 06:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com> <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Dec 2025 15:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQ1hwrm5E_2SY4re0iC74JO+50D4BJ09+gf+0L_iviEQ@mail.gmail.com>
X-Gm-Features: AQt7F2pv1730SuULqPlL-sSgQJGnjNI8Ry8UB7f0qPfx1ycQ__W1ZVy2e2HJ270
Message-ID: <CAMuHMdUQ1hwrm5E_2SY4re0iC74JO+50D4BJ09+gf+0L_iviEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxarm@huawei.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_062543_249208_D31C964E 
X-CRM114-Status: GOOD (  17.05  )
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

Hi Jonathan,

On Wed, 10 Dec 2025 at 17:01, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> The Kconfig menu entry was converted to a menuconfig to allow it to be
> hidden for !CONFIG_RISCV. The drivers under this new option were selected
> by some other Kconfig symbols and so an extra select CACHEMAINT_FOR_DMA is
> needed.
>
> Fixes: 4d1608d0ab33 ("cache: Make top level Kconfig menu a boolean dependent on RISCV")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512100411.WxJU2No9-lkp@intel.com/
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I assume Conor will take the two patches in this series?
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

If not, please let me know, and I will queue it in renesas-fixes.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
