Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F31CCF2C9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0v2enHOLKEl2OYOS4Cijf8P37IEAiIXncGHIoZH+WI=; b=W0vdBbhBANS8Dx
	+riqW/rVwARC5NYEGtJUlMaFPzoteO3SNSRY7+f4rzxpqSqP7p2MMuCC6BLI2/eB4qBgwWf3ffEzD
	D56WztCpJw1pzMi/TJT4g4RsOCRmjBf/qDDsCISwXyEyZxhpE9uPyxpaIcaTY8PYP4ou7V4LEYgYC
	PviJMTgvZRLaG4GRcxCVDBOms+EvqUSEHeLac8EpfcFLXsTMwvf5olnWjvSVsA4agURr46dEbdr7i
	01bg6gby4TQc8IT69w5647DlGfWaD6ExW/3DLPC8UwE+QcGQbCrbHUqqggoZOjGFaQNkuznHLe/5V
	jyi4+kxnPzWSwHqo3JAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIRZN-00000005vC3-3B9A;
	Sun, 18 Oct 2026 14:09:01 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIRZJ-00000005vBf-1gVH
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 14:09:00 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1137292a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Oct 2026 07:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332536; x=1792937336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=sIPbL1BPHrOLAO1tKhJW3pMVY95lubkClpQny+37Y4urC4ynyw3ufB7vyhbT6tQJqY
         HgTwvnlmAlXTk/EYd1uxGeI0UPvWlpcj6EoTUbG0nW5Rc+x3plIB6I3PRtL7e3IW2Ucg
         YEqa6ljhpxLwZ3J0BaeKBXs1V55O+PmWFninuO75Py77t6h2XOYetgD08iK8PTnZRCgq
         wxvqQ6qn7+/BdhKrsU1OafXKRLOAdO+dB+gk+SvEQsBb2UXJFcDVXQtob4nrH2J0vwAa
         p6MgWLlEwv5Cq+Nr/6ey0DJCgBjg+tLYB1HXtErXfvrv6OVLSGH/iZrenka03LGgwMXS
         TyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332536; x=1792937336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=ZNY7geXRXhmse0zHIIu/fS6k82KObH4AhA/pvYCYnptbD6FzVf8XOOm/FwMRVSP8cS
         LsJ/HPdK+aPgI/Afzw+qrT8QQbp7nBtVlyzeIzFK3Lium7+6UNzbZWULdcl8GomFucz4
         dG5O5E8xNxHIWyNiDIAneh8o4Uq5cNzCC5M8MyCIs0okn/rnrq+RKrxXuGmxJqTnSHuH
         pIAR8YJtxbzGf6YT/u5piigiuMXSli6PGUKTc9ygBLPF1EjmbyJgsvB+SKXmp2H3iZ7N
         vBCWD8fwW5cAOD3ERHoWkrNhocvhGxC2NR3hJqMBbTI8RvrTrJlrzpVAluH5bzvS0AEo
         JhIw==
X-Forwarded-Encrypted: i=1; AKwUvByaZvvaE94XXaP9ZKUe9AspXoos72Z9bPsYsGK3hOLvgAz/Q/kpAWpUwpv2alFewhig243kZc2NBAw/QA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLXChi2QoZRnJr4VHHDrVJ6RjPnVfs/U/7c9QyA3KPtacvU3+p1
	r7D4qOoqvw5qpqZVOAPr7KGk4KDAQF7MkoFwR5MqvxlZqU3WlcUATGqK
X-Gm-Gg: AYBFou1RpImkN/QKI7WqwE2Gu2Y4N0C6HKmSqJAifsVFwK99FmXwx1j2UJ3mlLLJHbg
	/M8gq/KvRAroAWVuv9AZ/ydEf6Ll1iCzU4h+6LLYDUG9m+z1mtMGTglkgI4RyrxWKle+8ZKSFWJ
	4nUC7Clav8EKoVtSjpXzbIFP3eGdlXdBRSWiq1uSkEFdlIuDAAp9HjPwO8tTLJFuO00009adM3Q
	xbOtn9P7dZT+u6E3AX5wXxlx7r0PTliswPFd5+Zg0Us8XPS+lMEokePLWWghs58yNI0tRsJU+EC
	UQRWb6L2I0QLOhhLzaAUFK9bKfzSsJTQ6hN5+M/zSqVv8qiVn1VgxSPYP6BeirrK9TmYDX1byZN
	jOZpxeTuVq4/s2Be4lCDBkaG/SDDRO1aqV+N7i0qTDaJiPFm1ocacZjVYpr0SeQqRlXlOINM7bc
	2hcf84hnzSkz9WHWZ4i3GpwThfVsQaeIL9HnlbhuTwPbrIIfttIgQdnv3VH8TlC/UM/H+IvYJJT
	mfuAYzH8jAbBt2/Qh/aZkOd5cl9/bnzdFriysbTnfNTxtZQYAcW1tuz0bt0PCg3LyZ8KUKX7x6c
	a0I8ee6xumlVp1srKc1o7V7HGeNoi4ZteuAz27xTjyAlLhR/ksSIxQ==
X-Received: by 2002:a17:90b:4a4b:b0:3ab:188b:c5be with SMTP id 98e67ed59e1d1-3acef15462cmr4793176a91.45.1792332536192;
        Sun, 18 Oct 2026 07:08:56 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm16970791a91.15.2026.10.18.07.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:08:55 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 22:08:42 +0800
Message-ID: <20261018140850.1630481-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
References: <20261017180141.3477743-2-alan.tseng.cs@gmail.com> <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_070857_451274_65FD49C3 
X-CRM114-Status: GOOD (  10.99  )
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

Hi E,

E Shattow wrote:
> Drop this last paragraph/sentence or place after scissors line, not for
> the commit message itself.

Thanks, I will drop it in v3.

> Presumably the BootROM does configure all of the above?

Mostly. The boot straps select SD, eMMC, SPI NOR or NAND, and the
BootROM loads the SPL from there, so the SPL needs the same
controllers and the clock and reset controllers behind them. The
BootROM also prints to the console UART.

i2c8 is different. The BootROM does not touch the PMIC, but the SPL
has to set the PMIC regulators over i2c8 before it can bring up DRAM.
I will give that as the reason in v3 instead of the U-Boot sentence.

The BootROM can also load the SPL over USB fastboot. I left USB out
of this series and can add it in a follow-up.

Thanks for the review.

Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
