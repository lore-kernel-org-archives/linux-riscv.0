Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E70C25B08
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 21:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GNxI6uZa0mlQWDPH6QVs8AbWN8s5Fnhl3gc08r0eJKE=; b=m1gp77jvE4PP+qIcoFfKgGECq3
	v+ee0DXqn5rujIBdd/4S6BjrFjk8/kBx+4EjlxDZg5+8ShfOx9YaTLqq4u6Qyeu4TxDwEocEJFo+e
	VvMfMEfAgkuvT2YDFWBpuVh0FTKjjq6BmqlPn4PFzEfC0CgS/4gW8gg5Y3yMmJOjbOePhUaJQGieI
	7jmo4PiYpymDsSy63hePjhxkjUKx6DnFzH00fsilKU9TM6Skdh3xgzEXA4kZ31HT0NEX3canU/Bse
	Gr3EgPcKcq4lvwOEN9EgOwetNSHhaRDh5xGC4a8xBZ2zfZZ4Asavm/ZeeT8XPp34DHw153g29sakG
	ugkpi1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMcc0-00DwLX-Ok; Fri, 12 Aug 2022 21:54:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMcbP-00Dvnb-V6
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 21:54:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id x23so1814868pll.7
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 14:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=XiklvoqQLhReqhH2HlBV3RxKGXhEPKw2WMCXRgzokfE=;
        b=1LJq5c4kWXf1RKKHmM/9JQblJdCuJg5m9cl6cf/r2a1rDEcsk8kIeIW+FM4kCW1eRd
         NQZYikAopFBgkZCjd8CfLmJd6JK9yQLosImF1Etn2VCQmkjQ9MkPqt6nUbwjeDXlgUmR
         ZoNbAivKKXG59S+IWGNUgaVXWD+CmyQ7Y+MM+rnGcxKDN3PWq4ojUaeQ2g61EKIBGE2j
         3rOXXAbe2iOLV442CH0DpitVjrHBoklJ9out5rYIIQ2oJwk4oyxqcvSceK/8ECWo3Gu2
         widVll5SEWsOOd5V0oEm1LHXsGB4zMqGqXohxTI55h7L8wW4vmv+WFg57PHT5n9FEy3N
         degw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=XiklvoqQLhReqhH2HlBV3RxKGXhEPKw2WMCXRgzokfE=;
        b=pH3ajP1hPV4YRiVPq0xCQNH9r9SOcy2wxN29M/G09/r1F+GEDsoePtpQFMJV0+3tov
         hd7UjkL0lSbCkoI7/TFcPFjY/lmJ91Hf3fgX0QRgKfGHZ0mHbhruybzzD3x5aQ88OUa7
         tacUWPb1LU29AmgBMTSIJZkDGxdH8EAxSJUPHbjLLDCFTR9UbcoITKzZBm6GGCZaKyWH
         /gwoOUKgR/KbThoqxbKxlX5giz9zii/Gzis+/TT2rDzSBGBUVY/gR2gfl43t+O9sw0NU
         wIl/nU2/5r1jGhB6AXv+N43xp4yr8AFhBQC85ypLTetKYY8T9Hkzi1jHsdaQdluE5s/6
         Edtw==
X-Gm-Message-State: ACgBeo07WkbTp6YLJwk7mfh6GqgSwqYvO0Bt/8WK2yf7VaJlHDPIEHG5
	TEf9dyR4j1HRwd4tSEUPexTCCpySSaP44A==
X-Google-Smtp-Source: AA6agR4wiup5f+8bK0TIAuDHg5gWSeIkqa5saQOE67rkOQyNS7UUz9rfbL2RbtO3K51j+8zrOXqKHw==
X-Received: by 2002:a17:90b:3e88:b0:1f5:6029:1bf7 with SMTP id rj8-20020a17090b3e8800b001f560291bf7mr16106138pjb.155.1660341237910;
        Fri, 12 Aug 2022 14:53:57 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id y1-20020a17090264c100b001713f45477asm2205871pli.250.2022.08.12.14.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 14:53:57 -0700 (PDT)
Date: Fri, 12 Aug 2022 14:53:57 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 14:53:56 PDT (-0700)
Subject: Re: [PATCH] RISC-V: defconfig: Remove CONFIG_SECURITY
In-Reply-To: <20220810061842.13755-1-palmer@rivosinc.com>
CC: heinrich.schuchardt@canonical.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-abf9786a-a306-49c9-889e-842dd3e39096@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_145401_120723_172A2DC5 
X-CRM114-Status: GOOD (  21.50  )
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

On Tue, 09 Aug 2022 23:18:42 PDT (-0700), Palmer Dabbelt wrote:
> A handful of security-related entries were added to defconfig in
> ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), and
> while they weren't triggering any issues in that actual commit they are
> tripping up kasan after the merge.  Remove them, so we get back to a
> working defconfig.
>
> Fixes: 4d1044fcb996 ("Merge tag 'riscv-for-linus-5.20-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> I'm not entirely sure what's going on here: just cherry-picking that
> defconfig onto the merge base of ea0c39260d0c ("Merge tag '9p-for-5.20'
> of https://github.com/martinetd/linux") start triggering kasan failures
> along the lines of
>
> [    2.497182] Unable to handle kernel paging request at virtual address ffebfffefffef000
> [    2.498067] Oops [#1]
> [    2.498304] Modules linked in:
> [    2.498703] CPU: 3 PID: 88 Comm: mount Not tainted 5.19.0-14658-g318ec69153ba #16
> [    2.499169] Hardware name: riscv-virtio,qemu (DT)
> [    2.499581] epc : kasan_check_range+0x116/0x14c
> [    2.500812]  ra : memset+0x1e/0x4c
> [    2.501092] epc : ffffffff8025c7da ra : ffffffff8025ceba sp : ff6000008307fa60
> [    2.501451]  gp : ffffffff81d6d100 tp : ff60000082fd3c00 t0 : ff6000008307fb30
> [    2.501802]  t1 : ffebfffefffef000 t2 : 0000000000000000 s0 : ff6000008307fa90
> [    2.502153]  s1 : 0000000000000004 a0 : 0000000000000010 a1 : 0000000000000004
> [    2.502493]  a2 : 0000000000000001 a3 : ffffffff801f3022 a4 : ff5ffffffff78000
> [    2.502842]  a5 : ffebfffefffef000 a6 : ffebfffefffef001 a7 : ff5ffffffff78003
> [    2.503197]  s2 : ff5ffffffff78000 s3 : 0000000000000000 s4 : ffffffff8159de88
> [    2.503545]  s5 : ff600001f7de99c0 s6 : ffffffff81d6e640 s7 : ffffffff81d78060
> [    2.503913]  s8 : ff60000080ffad38 s9 : ff5ffffffff78000 s10: 0000000000000008
> [    2.504465]  s11: 0000000000000010 t3 : 0000000000000000 t4 : ffebfffefffef000
> [    2.504860]  t5 : ffebfffefffef001 t6 : 0000000000000002
> [    2.505142] status: 0000000000000120 badaddr: ffebfffefffef000 cause: 000000000000000d
> [    2.505570] [<ffffffff801f3022>] pcpu_alloc+0x454/0x7d4
> [    2.505925] [<ffffffff801f33ce>] __alloc_percpu+0x14/0x1c
> [    2.506227] [<ffffffff800901bc>] __percpu_init_rwsem+0x1a/0x98
> [    2.506546] [<ffffffff8027f018>] alloc_super+0xfc/0x3da
> [    2.506837] [<ffffffff8027fefc>] sget_fc+0x90/0x2c4
> [    2.507116] [<ffffffff802808a2>] get_tree_nodev+0x24/0xa4
> [    2.507410] [<ffffffff801e2564>] shmem_get_tree+0x14/0x1c
> [    2.507705] [<ffffffff8027e840>] vfs_get_tree+0x3a/0x11a
> [    2.508009] [<ffffffff802b2b54>] path_mount+0x2f4/0xbd6
> [    2.508784] [<ffffffff802b3b2c>] sys_mount+0x1ae/0x26c
> [    2.509099] [<ffffffff80003b10>] ret_from_syscall+0x0/0x2
> [    2.509787] ---[ end trace 0000000000000000 ]---
>
> they're only showing up on the QEMU virt "-smp 8" (not "-smp 4").  I'm
> pretty confident there's some other bug lurking here and we've just
> happened to uncover it, and while I hate to drop parts of the config
> it's just too much of a headache to have a broken defconfig whih kasan
> enabled.
> ---
>  arch/riscv/configs/defconfig | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index aed332a9d4ea..3ae79af77806 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -179,10 +179,6 @@ CONFIG_ROOT_NFS=y
>  CONFIG_9P_FS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=m
> -CONFIG_SECURITY=y
> -CONFIG_SECURITY_SELINUX=y
> -CONFIG_SECURITY_APPARMOR=y
> -CONFIG_DEFAULT_SECURITY_DAC=y
>  CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y

Looks like this one has been fixed somewhere in Linus' tree already, so 
I'm dropping it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
