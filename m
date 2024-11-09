Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B63D64099
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Nov 2024 02:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=haePJnLpQEMRR/3UTEl5DDmr/Ev/ll0HyTnRUehWAmA=; b=gvLQcXILB/iCpu
	F3HGkXIspkTQTPTs1HJftpUrak3XtKfO98yRUDYta4TV/ahl1m0RMENjGC6koRjdvepYFy1j8vikQ
	lnyfrqMv6KcTLXWgSUvftLjGq8HNM2ckjTAOy+HwJNWnuDB8+o9ryuiAhZlDX951S3Bg6n+oA1HgI
	f+ungDUvVbMvFo93jx9QkOcQTebS0VPu71Kg+yWRH48twQdHI/+H2ZdtsqpaKTKGNY4fDg7dgL9WR
	BnAoMd88AUtmlqYAprIjdVygJxMt5qIoyDMrUPPMGOcrJhoSwnjoKSq+BsJQtUnMCckeKRUmIKklq
	AZqFd5Ad9bpQdP0TIrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bSH-0000000CXE1-34Cm;
	Sat, 09 Nov 2024 02:44:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bQg-0000000CX3s-285L
	for linux-riscv@lists.infradead.org;
	Sat, 09 Nov 2024 02:42:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20caea61132so24821115ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 18:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1731120145; x=1731724945; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/kq/jig55oiRh/bx6L5lLBF6mfYKjE94DkUXbQGw1U=;
        b=DV7ry+IU/FpasLo7WYV0jwnsKIzP8qe80rRg2a/G2zKiIHawDS1/AF+7DfXjPgm7T9
         th3nQIDsRPl3HdwxmuSmqYxYL/xihLDKVMosPWiNbfc4kfI1vxvGe418QPwrFcjuR8/g
         NclT1G4LaeKH+F5XOp5Au+NSPAAs+5sk65p/iOJlFhHkgc5ptcon2+OLPSJIxAXIrEdI
         OS4eeeEb3IRvS5/ITvaj65dp2dQEgFeu7E+BuxleuyUHTuLmW0eA1kV+1BebxWYJ9wRJ
         SEZiT4oi1wzDIPE7PT/JGME2R+AM6FBe7S/j0InpwAuyMgaILSS1Eu7QXzPh0kgNOpwr
         Ky4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731120145; x=1731724945;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/kq/jig55oiRh/bx6L5lLBF6mfYKjE94DkUXbQGw1U=;
        b=ZMRzuJ1+YYC8dk31M7FvM+R4EkCs5ekGEFiD//l/4aCTAz7Y+KdSmFaK64W1l7jsx8
         3ol0nvXg/I50duzs52lk2Yd3jK8SuV/ry9VYzPSOSEmWouk1e4lrJWAAQ5JiILFnCAgT
         NNZpqFFYOxN1ToO/SsKFmLot8M8bGe766jmWbkaU9xHLpFym0qS+6nsNyr7dQvFheZ5b
         /iuvjJqS1kZYt3R4b0xAPGJEebP6yyTGbbh2F3F0ArFraNiO5L71HXCNgrE2GIbr4WBv
         Oq5ZoaS3rO/FJfzWWSHB/UUShrV3ZwJcOSn52qMNK8EeLNhVwapL0c4aHS/6kg//gNi1
         Eqhw==
X-Forwarded-Encrypted: i=1; AJvYcCXNMxOB04J2dHvlDORsUeaJCkxCrSQXPB41zQ/dpzh6U0aKRt4sssK504C+Yts1aBDNWllyDBUCdNmmUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeqUl+cOUT0hScIfxWyGTLBS14mjjpGh9lKARdDVgzs3z4hPAj
	kGUPXfEJnLbv9EKNRqaq1AB6qp/0PquwFku02yXsodl01RWNPulk70biLH9H+XQ=
X-Google-Smtp-Source: AGHT+IEaqnxKIzWBmEEzYyvufch5G8Tuk0X5vXmjpFy2gAQctA1w0BMtU34C3aumXJGf7VQyRyPOsg==
X-Received: by 2002:a17:902:ecc2:b0:20c:aa41:997a with SMTP id d9443c01a7336-2118354d664mr70046865ad.34.1731120145214;
        Fri, 08 Nov 2024 18:42:25 -0800 (PST)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6e0acsm38035835ad.257.2024.11.08.18.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 18:42:24 -0800 (PST)
Date: Fri, 8 Nov 2024 18:42:22 -0800
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: RISC-V T-HEAD Devicetrees for v6.13, part 2
Message-ID: <Zy7MDgtCtPkxLbjm@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_184226_833822_93C42BF8 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

Hi Arnd,

Please pull these thead dts changes. I've run W=1 dtbs_check and the
new ethernet support has been tested in linux-next.

Thanks,
Drew

The following changes since commit 2a3bf75a9408c40403aab39336274c8010b4c815:

  riscv: dts: thead: remove enabled property for spi0 (2024-10-15 10:01:18 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.13-p2

for you to fetch changes up to 7e756671a664b73b2a3c0cc37fd25abf6bcd851e:

  riscv: dts: thead: Add TH1520 ethernet nodes (2024-11-06 17:03:42 -0800)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.13, part 2

Add gmac, mdio, and phy nodes to enable the gigabit Ethernet ports on
the TH1520 SoC-based BeagleV Ahead and Sipeed Lichee Pi 4a boards.

The dwmac-thead driver and dt binding have been accepted by netdev and
are in linux-next as well as the dts patch in this pull request. I have
tested next-20241108 on the Ahead and LPi4a boards, and Ethernet works
correctly.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Emil Renner Berthing (1):
      riscv: dts: thead: Add TH1520 ethernet nodes

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 119 +++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 +++++++++
 3 files changed, 260 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
