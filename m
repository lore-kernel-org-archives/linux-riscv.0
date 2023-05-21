Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0045C77B7A
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 02:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RemBXbzaj0LeFZL0pP5IMBMEctdn1nr/DYxCOS02ZPo=; b=jk5oqvQiZ1uKb3
	j8mRRiUOpaTuE+7dWL5kMkI0ppqTil9M+XGoyKvYv4pnF9GL8u+mPPtsQpRQA9coPNHZH4rIT3Jur
	cxfxdDSwjDOnwjMtVivdHy1I3w/zNMb22B8MEptKGMOUqa0L6LkZaenmwnYrNwqjDJkHcRLNSZXOz
	yml46gwdmTr0NZlbVaXQzc1B9Qr+3lZXv3n/Q08Zj2ZzjeVfLI+DSmFUuQ0/koLJd5ssDf4Wh10ZK
	R38EYSHX9T7ivMcrL1MT5jvRMDJBr+vnwU9+hbi1hPYUHxk8dSH4+BzH1CxgxtBChVKVnNx+sLouJ
	8hn/pX1bOcmjd1f8PGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0YOd-002nIs-1Z;
	Sun, 21 May 2023 02:02:07 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0YOY-002nI7-2N
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 02:02:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so1526285b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 May 2023 19:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684634516; x=1687226516;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=51eARV0mcKeV1eIZtds0tWRUIXNBvFSqTgfBgrE5Jwg=;
        b=xelRWVs3hikFpb6Z+GQFtokNQWEDsFQ16L9wp06fub8GBYnTA4OUitMDyex+TszXFn
         muJjlJWM011b09xLbXnpBId7LBmeLKJ/2x9KLxY8cbN7O44YMZ/zPT227036WmXvn4E4
         6tWGCQyzIqZmOqlNx1h4Mf7UNBXnxm8xg1wJs0xfENsxwlJNd6u4aqSDTP2XOUopPfmK
         V6O4giJfRAUCB8FTpncGp3G7MNz4APz6MsVEAOLwbZ1XrWICx7joDvSD0WGoDb4VGTcm
         j1kb4Q2H3wMg0pADO+lHH54XIuyPfPRq5ZslfMslq8bRHL824dHu7jsrYsDY387nMtTd
         pjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684634516; x=1687226516;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51eARV0mcKeV1eIZtds0tWRUIXNBvFSqTgfBgrE5Jwg=;
        b=QRsb1j1pXn+3lYTI/xaDxfFsC7QD/TJq6X9LJTHbGAERCoR3seIUwqBkDMC8d4uooi
         Z5gGw+ZxUjNEa2JAmnlzLpLxy+cPBRJtBcMopScoJO+2C8gquXS1VmI3pQCOAdbkaDX7
         OWVFlQKdVJxPJB3yGFzpY2lGjjGmA+YpKZxwydZR2ZUNNV0dV4o8ZgKabIuC7YPzixoe
         ghqDWpYJroIOwZtKNGvYRr6xyYm9QKe0gUu4kEzIN16oo4n/FLYRk2fMAf/IILpt3Js5
         49bwe5MT27q0LCKNfPOyc3lTlU4/e3I2J1ZGYfHvJfFAWLsZd6ewuuAthUtgPy0yh7Rb
         jEFw==
X-Gm-Message-State: AC+VfDypjZWKDqpbYx69V+GABM+rGYq78SfdKXUGDYpoAOp0RX3KTRft
	M7iU9Do6tupan4eAH1i6Q9YIyg==
X-Google-Smtp-Source: ACHHUZ5ZFTB2b1TzGRnzu56JDQXNuSCkhQzwTKamxHc9v+Tcbetk0vwpHRvSFd3twRCqlRjYN2kXqA==
X-Received: by 2002:a17:902:e848:b0:1ac:820e:c34a with SMTP id t8-20020a170902e84800b001ac820ec34amr12119763plg.0.1684634516058;
        Sat, 20 May 2023 19:01:56 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:95b7:fae6:7e9f:45cb])
        by smtp.gmail.com with ESMTPSA id v7-20020a170902b7c700b001ae0152d280sm2107584plz.193.2023.05.20.19.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 19:01:55 -0700 (PDT)
Date: Sat, 20 May 2023 19:05:54 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Subject: riscv: boot failure for 3335068f8721 ("riscv: Use PUD/P4D/PGD pages
 for the linear mapping")
Message-ID: <ZGl8gn/rD8WZ0nak@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_190202_967245_2BE222A2 
X-CRM114-Status: GOOD (  17.62  )
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

Hello, I tested 6.4-rc1 on an internal RISC-V SoC and observed a boot
failure on a Store/AMO access fault (exception code 7) in __memset().
stval (e.g. badaddr) was set to 0xffffaf8000000000. This SoC is RV64GC
with Sv48 so it seems that address is the start of the "direct mapping
of all physical memory" [1].

The 6.3 release boots okay and the system is able to operate correctly
with an Ubuntu 23.04 rootfs on eMMC. Therefore, I decided to bisect and
I found the failure begins with 3335068f8721 ("riscv: Use PUD/P4D/PGD
pages for the linear mapping"). The system boots okay with the prior
commit 8589e346bbb6 ("riscv: Move the linear mapping creation in its
own function").

The boot log [2] shows that the fault happens right after buildroot's
init script [3] uses switch_root to execute init from the Ubuntu rootfs
on the eMMC.

DWARF4 is enabled in .config [4] and the decoded stack trace [5] shows:

  epc : __memset (/eng/dfustini/gitlab/linux/arch/riscv/lib/memset.S:67)

From memset.S:

 Line 67:         REG_S a1,        0(t0)

From the oops:

 epc : ffffffff81122d6c ra : ffffffff80218504 sp : ffffaf8002e47500
  gp : ffffffff82695010 tp : ffffaf8002e2ec00 t0 : ffffaf8000000000
  t1 : 0000000000000080 t2 : 0000000000000001 s0 : ffffaf8002e47550
  s1 : ffff8d8200000040 a0 : ffffaf8000000000 a1 : 0000000000000000

Thus I think it is trying to store 0x0 to 0xffffaf8000000000 which is
the start of the direct map. From the boot log [2], OpenSBI shows:

 Domain0 Region00 : 0x0000000002080000-0x00000000020bffff M: (I,R,W) S/U: ()
 Domain0 Region01 : 0x0000008000000000-0x000000800003ffff M: (R,W,X) S/U: ()
 Domain0 Region02 : 0x0000000002000000-0x000000000207ffff M: (I,R,W) S/U: ()
 Domain0 Region03 : 0x0000000000000000-0xffffffffffffffff M: (R,W,X) S/U: (R,W,X)

The DDR memory on this SoC starts at 0x8000000000 with size 2GB. The
memory node from the device tree [6]:

        memory@8000000000 {
                device_type = "memory";
                reg = <0x80 0 0x00000000 0x80000000>;
        };

I think the direct map address 0xffffaf8000000000 would map to physical
address 0x8000000000. Thus I think the attempted store in S-mode to that
address would violate the PMP settings for Region01.

I do not yet understand why this happens with 3335068f8721 ("riscv: Use
PUD/P4D/PGD pages for the linear mapping") but not for the prior commit
8589e346bbb6 ("riscv: Move the linear mapping creation in its own
function").

One important cavaet: I do have a small diff from mainline to add
support for the eMMC controller in this SoC to sdhci-of-dwcmshc.c. The
output of 'git diff' when 3335068f8721 is checked out [7] shows that
this just adds a new compatible and corresponding sdhci_ops struct.
Everything works ok with this change in both the 6.3 release and the
commit prior to 3335068f8721.

I know it is a bit awkward for me to report a boot failure for an
internal SoC but I am hoping to find a better solution than just
reverting this change in the downstream kernel.

The reason that so few changes are needed to run Linux on this SoC is
that there is a service processor that handles all the low-level tasks
like setting up clocks and configuring various peripheral controllers.
Everything is already setup and ready to go by the time the hart meant
to run OpenSBI+Linux (fw_payload.bin) comes out of reset.

Note: normally Linux runs on all four harts but I reduced to running on
a single hart to simplify diagnosing this boot failure.

Thanks,
Drew

[1] https://docs.kernel.org/riscv/vm-layout.html#risc-v-linux-kernel-sv48
[2] boot log: https://gist.github.com/pdp7/afe78604f477c9e3a3cf0241bcdffcdb
[3] init script: https://gist.github.com/pdp7/8d61bafbca55e987b790433c0353831d
[4] linux .config: https://gist.github.com/pdp7/a4df66f1359a34194bddd32f74ab38a3
[5] stacktrace: https://gist.github.com/pdp7/0524892ea319775ea70e43a54cc842a9
[6] mysoc.dts: https://gist.github.com/pdp7/cd1b2e8e8d3f6047efd53e4ef65664da
[7] git diff: https://gist.github.com/pdp7/581c9e8415da94a29d34ae6d7cc14669

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
