Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B514FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GdXBVyfXqjchMg2iQHJPmQLV/bWGdK1njCKgazyMCk=; b=d7QFF4u4tnKwYS
	PzXHgfsoZ/r9FjL61s7tbzexxKYlJNDnzI8et44GGcRm5eeR5lLCGICgikXTna9lwBwafXI3KBZPI
	4OOmdEJfdUUOaBYmBmzeA7QGoAW6r6GOvMdL7bQz/wi18y88b4q2pJYGJ4XXjDm41CvThQRi5DttG
	7S0cFZ49l432WhOtdLUo2euSJOWCGc38gNMmCndT+ygpDJPsXJkhEDrvwLQjZrawqIbInXjCsctY5
	gEP8oh+fWWIjcwRGDJ51oHVNcD0XtTwSwC+xC7mxTwsxajU9foSMLLcUiwic8Y1YHQw7DXeZwSlmY
	u5ZVffNreFg0oRJVj2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1B8Z-000lbh-Ft; Fri, 02 Dec 2022 18:51:51 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1B8W-000laa-FI
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 18:51:50 +0000
Received: by mail-pj1-x1033.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso9171574pjt.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kYIaU/gtITnvja0pFM6EwigG2CC7GiIe3hXR3mlva4=;
        b=3X6M8rtDPeE2MgC99NsC6A8YIqbgb6G0ttPYSqV8hyqRWi32KNEGYh7/9rzZ8a2LuA
         jjphLp1YImCxTvGhSpfwGLyjqA9e3I/vRrUiLy9ZoAXG+nRFH8HjfZqHIkKtbuInhYLf
         fLCgkpg+9bLOU0I/NA3wctw6NuOaLESB918cvhnRAtqA0yMD4MyXm3IfTy+IQyQ23h6f
         14LyrXt05ddaggJKr/Av1ts60bHHMdjgAC1oQoVtTcCN/55n76jWfGEJ7UViXleO7Dnx
         Rw5suN8Xe6Qz6BRHlLBlF0HEk0gE9/RIEoGKCeqgf1JLlyachL1JQPdE3zRJXeCOUf4U
         1p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kYIaU/gtITnvja0pFM6EwigG2CC7GiIe3hXR3mlva4=;
        b=0i21CCJ9yI5j23NCjEzEgKUw6ROg7txMyQj3YfvS02GHmnyW56zI3dJ0hcSHz1zr6E
         2uyMMUy5ElFPGahIwupjhkItSnzO/A9ZN2+k2lYuM3yE4EAhyKy7X1ikKcpiXbCIOPi6
         CPXexjj2qjc+EHvKhtBJpGAU9vA+5jVJSIJRgIRLNj5EaUQBxa6fDeoLvXcwe2yja1qZ
         horhGboy0wYNb/AD00DVqvZQuP1wIuZ9MRLGw2+Y0TB8iXAhTobKLkGPAYfpav2w41Nn
         FXX4aK1duRB/AjQtM+upewfQtPyNBjExJPqEc6pnvGw73onFFPfc9DyUYQzNdLOKu/82
         esQQ==
X-Gm-Message-State: ANoB5pnhBTBI/xwscsHckgpI0qM8iD2eL+I1OUQW9Ic4pP2WSEHTjSBM
	w+XIv9J2IS7LhZ79TZAgSSMgJIFCGNbFBMjd
X-Google-Smtp-Source: AA0mqf4jOsfdSrL3sYyIfvhMN5LJbUro0IzIfORFwevSj7Q4LXslnJAVQo5pBB51Itl8t0OJyS8V/Q==
X-Received: by 2002:a17:903:2491:b0:189:854e:93a8 with SMTP id p17-20020a170903249100b00189854e93a8mr28517703plw.124.1670007106551;
        Fri, 02 Dec 2022 10:51:46 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u184-20020a6279c1000000b00571cdbd0771sm5424190pfc.102.2022.12.02.10.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:51:46 -0800 (PST)
In-Reply-To: <20221115200832.706370-1-jamie@jamieiles.com>
References: <20221115200832.706370-1-jamie@jamieiles.com>
Subject: Re: [PATCH v2 0/4] RISC-V: Dynamic ftrace support for RV32I
Message-Id: <167000658675.29055.15126570984080742819.b4-ty@rivosinc.com>
Date: Fri, 02 Dec 2022 10:43:06 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Jamie Iles <jamie@jamieiles.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_105148_752009_994701F2 
X-CRM114-Status: UNSURE (   7.82  )
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

On Tue, 15 Nov 2022 20:08:28 +0000, Jamie Iles wrote:
> This series enables dynamic ftrace support for RV32I bringing it to
> parity with RV64I.  Most of the work is already there, this is largely
> just assembly fixes to handle register sizes, correct handling of the
> psABI calling convention and Kconfig change.
> 
> Validated with all ftrace boot time self test with qemu for RV32I and
> RV64I in addition to real tracing on an RV32I FPGA design.
> 
> [...]

Applied, thanks!

[1/4] RISC-V: use REG_S/REG_L for mcount
      https://git.kernel.org/palmer/c/8a6841c439df
[2/4] RISC-V: reduce mcount save space on RV32
      https://git.kernel.org/palmer/c/3bd7743f8d6d
[3/4] RISC-V: preserve a1 in mcount
      https://git.kernel.org/palmer/c/dc58a24db8c1
[4/4] RISC-V: enable dynamic ftrace for RV32I
      https://git.kernel.org/palmer/c/f32b4b467ebd

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
