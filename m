Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE6AC636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcIr1S30uMAaxsO9fovCtnT8RPR1r+paCGaDV+ZlGkk=; b=3vTEg4GDbv/jLm
	j2RVZCIkdpZhJ7J4p5p27xlczbvZhNNMJ5gK32ofL5qjgtxHS/Hw4MDOuKGTi0VwCzAJymSyu2Mi+
	7rlBq7drK0CpVTejFDihLoDxMrsoR4WCsaXe1+VlXfT7aQKfHjg0A3BBRBbzO1dRam2NAxbjrpGFp
	Ov3io64Bi/S2jS28kemNIptESPg1SrDWZTjAhHJYsncpeoWlHVAaLYscDSf+RPCGiaIw4rZRCSAQP
	HHA9tqdg5nbsWytRFXF5VBTVTjhdsv7Ia+tO1Oi/XFsIxfqAS9NRzsUg0F+OCmxF5u/bpwQIntBIk
	JJl3yjLirURTaiD2pIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJDs-006ILw-B1; Wed, 15 Feb 2023 14:57:28 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJDo-006IJx-3E
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:57:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id ct17so7298675pfb.12
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFvwuiQU0jmNxdILZO7NQLD5ut7ESgr69kpdUpMKH/M=;
        b=QNMNnmo91yROCgKC1GGtT7wHqQ0Xy+gpUsO7AnwJVQhLxp6RJ28epunwG5wJcCeK5y
         Ds5lFPpKmuXuqXGvBi3yASDXuI3CDA8fMmBcOGHxjKW8mQTg0YZhxum0jHiGN245bPeZ
         0t7Qqd537++1/XNiFfun4CR+HOfVs+usYF9198vJDSmnnveGdFNssio6nZOle91M+R7Q
         hjKw3GRBhOKDQ+wkuUd3/VazZ+Zso6N/PDdkv9CbRndwHMJiABALE/74qSzXGSGBK9+g
         pa3mQxTaOzdEW7bC3oo1yTZ1MbbPfEKKptUHRA07ISkjSepq7D6Qbk8kBv02PjSkRcDs
         1vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFvwuiQU0jmNxdILZO7NQLD5ut7ESgr69kpdUpMKH/M=;
        b=yMOKp3vZqQSnCMp2mA0QeZqtEQeAVUZYJ22jI980Prz7KmEqp6F0w52AEJ1dqP7HsT
         JADiJo6qVWdoPrvCgEw0555629RijXo+h2IzrWrcqUeCWjnDNPLVrtxN20Xn2wGVU49x
         48AD/M5hv6xp5nFjjro9blXeqMjHq8PvihwdRlMEhIIiQYQXEX7mAUQV54rHsKAjcJDf
         rYCn1+qp64xqO4lUXPNixz+KcqmJwF77kg53WOMp96qiqvv9Kt2Y9cHwwnf272/YYR/9
         ++kslBGiQQxMUJy3MreDdJJbKs/fnyX9+1tHY+HFD1Zl1kNPI8PpKvYxkkXCgIPSbYe4
         lyBA==
X-Gm-Message-State: AO0yUKXV3/E3LMjFD+kXqlnucrQW6Uw1I+hK8ar47o54qfgpl9vi082d
	z2dgUH69h95riLw+0Kz+6w4YLQ==
X-Google-Smtp-Source: AK7set+DkXbgd/QCTecYeDvplhB73+/kstKane/J3RNYJduQ1vLt/z5JIovQGgdr+gdUqUDjjbegAA==
X-Received: by 2002:a62:5245:0:b0:5a8:b533:7fd7 with SMTP id g66-20020a625245000000b005a8b5337fd7mr1750470pfb.25.1676473041076;
        Wed, 15 Feb 2023 06:57:21 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id e23-20020a62ee17000000b00594235980e4sm11846919pfi.181.2023.02.15.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:57:20 -0800 (PST)
In-Reply-To: <20230108163356.3063839-1-conor@kernel.org>
References: <20230108163356.3063839-1-conor@kernel.org>
Subject: Re: [PATCH v1 0/3] Remove toolchain dependencies for Zicbom
Message-Id: <167647301918.19800.8909126197049122233.b4-ty@rivosinc.com>
Date: Wed, 15 Feb 2023 06:56:59 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
  Andrew Jones <ajones@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>,
  Heiko Stuebner <heiko@sntech.de>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_065724_162474_ED0BE113 
X-CRM114-Status: GOOD (  10.01  )
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

On Sun, 8 Jan 2023 16:33:53 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> 
> I've yoinked patch 1 from Drew's series adding support for Zicboz &
> attached two more patches here that remove the need for, and then drop
> the toolchain support checks for Zicbom. The goal is to remove the need
> for checking the presence of toolchain Zicbom support in the work being
> done to support non instruction based CMOs [1].
> 
> [...]

Applied, thanks!

[1/3] RISC-V: insn-def: Add I-type insn-def
      https://git.kernel.org/palmer/c/6067c3aae52f
[2/3] RISC-V: replace cbom instructions with an insn-def
      https://git.kernel.org/palmer/c/dd23e9535889
[3/3] RISC-V: remove toolchain version checks for Zicbom
      https://git.kernel.org/palmer/c/75c53905f873

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
