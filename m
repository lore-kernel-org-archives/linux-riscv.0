Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83568C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyZThLpalv7e6iyUyi0wV9RJvXtELxsGcf/YF+c6+l4=; b=OxIeyOqH7/f3Fn4g4UBYTLddiT
	zlg0sEPxEendu1iTqUvhsw2JBFJqaRotizEaIxCRizseowKbgZnyVwwT1UeXMt0Fkg4h1ONyLzyo6
	bMoMYkLKhpds71upkdX3oNqZqYBoXq58Q3U7E1yiEVJ/24VSPf91NyHDbMov2q6s7KY4SSvMU/z4f
	W2u55a4YCe4OTvjI4ax3rxnv92WPRQ9ks5px+kYm/KkvOm0SXssPgTkGeBuMKzjfm0WinR/afzkbG
	sMhrMgqN7lCUxvQaRfLvNxnxdvOdV3Lb2DByKqnElEm+s5wvmrOIlXx4fElF8LfVB46Vpnt0ZuZvI
	Oc67txzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8MB-00000007vrR-3sSi;
	Mon, 02 Jun 2025 16:49:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8M9-00000007vqS-3VvZ
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 16:49:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2349282084bso56763145ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748882988; x=1749487788; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJtLmJ1+ZA9gGTeiAdVPiVyS3gmJ2S4O+OKpjfVOgGU=;
        b=OJefbkDEpNLViWDPLDqOkUEChNP46Lv/uIo4VeVoZe6vHWTOmZvhjya+/25iyUwr9a
         co1fLK9plSrXlnvMcEkh/EcvDqSTP39YELE6AqVgoDxbr+ctAvTtl9vlHEdBmq+oYai8
         8RSMdhwfz5/S+047mHM9zWep3KxsrawREevZTjT3SWT3TAmGiCU8Y9AMIF2UHdOpjJka
         Bukuz6V68QLTrHH2UD/PT2lzrrl/ym9vx4oOQZNKvx9aDu5zwyUs4jd8UrhLwe8lclfr
         mYYzML4G4r/XSm2RsJnHq/hxciZ9qOWko0R8ZNQp65YExoPyNBDDMrcS4FbseShBPoYu
         KDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748882988; x=1749487788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJtLmJ1+ZA9gGTeiAdVPiVyS3gmJ2S4O+OKpjfVOgGU=;
        b=SR5uDBMschYSAMbzMlItntxrzATSpu2Mtz5QVeq09xCXhfPTgDzB6qHEV6cC8yZTZW
         mvbG2o06nP0nhZlFxDnLjgFueoItmGdMfKg1odga+MwE9lSrDnfh0cGYjdsz1YkBxtDo
         MuabSasrdlgGuvxUIsBNUqh8ATC5uZOQ9lH2w+dZSbSNV+Rhf+fYXYlnO0SIIT+JDF8G
         fZuzKeR5MqNYff+G2p6H++SIl3DuMsrlC2na02yNqW+R8iMn/amo4i4HGEWmjVXgn27T
         5GZaHZ/vv0gFl3CwCpKuKVwzYWRGFPbODw29MU0Bwihs1r1sqiXGm9woBFtrxAEEcxq5
         KEqw==
X-Forwarded-Encrypted: i=1; AJvYcCXQD711qCUB1Dj1lGaDuiNtDn3qLy/sqJyHVhciC/SXEITTVq8UPU17dK+0ZvQNzuywj5pzGBHbjMJ+WA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV8fT9qUBvBrd35a5t2QBThCSRCERqySqvCOz4O0O/+d+JwgKA
	A5ChvOLjoJ2iu0cSXHdbbe9Di18d0rAb5waH3vX9hWl0H15aiAFmaL3VtJati0CUnzw=
X-Gm-Gg: ASbGnctRtuEQ+9+mVhZLR7MBPqyAvz5hxFj5xWPC62QUoMj5Jp2tmb/F8Tlbvv05S6I
	pxiRaqHYz/s2EeQ6qHwqJFrHHYVwrWUjeXSvTBBdlt9HmxvxH+TGDSz6zAoxHTnVeAPBPb9h4GZ
	WPECJdpzjGQHKadVlvOfQ6d64Mwm6wyHL6dv7+aWInEsUa8tiTKuj/w7g6wRxEh5ueLwv3QB2nB
	s5FxAXjGl0XmErHIEqlKir5UTp99X3nnctoQnXl7VBXZpvQCMVGu3SeupyZ8cYGt0Y1OPxBoSxB
	XOuocjLNCO3SPVb4oJooTp0YdDFAxDYognWhhbPNBhKz5sj8dVsIidtQngCoj6sMXKBsp9Pm
X-Google-Smtp-Source: AGHT+IHf3hxMDA11sY8CrqFCsHaPToaLCZdH89rX8lG5jyAges8FHHXEJxrLZzMcA5pRD8YHrbMtkg==
X-Received: by 2002:a17:902:ce84:b0:234:a992:96d8 with SMTP id d9443c01a7336-23528ef7a17mr232511875ad.19.1748882988548;
        Mon, 02 Jun 2025 09:49:48 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd75c7sm73327845ad.113.2025.06.02.09.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:49:48 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:49:46 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check
 exception
Message-ID: <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
References: <20250314092614.27372-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314092614.27372-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_094950_096155_C867F253 
X-CRM114-Status: GOOD (  14.97  )
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

Hi Zong,

Thanks for taking the initiative for making cfi work with uprobe.
And sorry for not noticing the patch earlier.
Few comments inline.


On Fri, Mar 14, 2025 at 05:26:14PM +0800, Zong Li wrote:
>Handle the uprobe event first before handling the CFI violation in
>software-check exception handler. Because when the landing pad is
>activated, if the uprobe point is set at the lpad instruction at
>the beginning of a function, the system triggers a software-check
>exception instead of an ebreak exception due to the exception
>priority, then uprobe can't work successfully.
>
>Co-developed-by: Deepak Gupta <debug@rivosinc.com>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>Signed-off-by: Zong Li <zong.li@sifive.com>
>---
>
>This patch is based on top of the following series
>[PATCH v11 00/27] riscv control-flow integrity for usermode
>
> arch/riscv/kernel/traps.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>index 3f7709f4595a..ef5a92111ee1 100644
>--- a/arch/riscv/kernel/traps.c
>+++ b/arch/riscv/kernel/traps.c
>@@ -386,9 +386,12 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
> 	if (user_mode(regs)) {
> 		irqentry_enter_from_user_mode(regs);
>
>-		/* not a cfi violation, then merge into flow of unknown trap handler */
>-		if (!handle_user_cfi_violation(regs))
>-			do_trap_unknown(regs);
>+		/* handle uprobe event frist */
>+		if (!probe_breakpoint_handler(regs)) {

If task has uprobe enabled and there is a cfi violation due to mismatch in
return address on shadow stack and regular stack, then it would be a cfi
bypass, right?
Perhaps we should be doing this only when we match that sw check exception
is due to forward cfi violation?

Do you agree?

>+			/* not a cfi violation, then merge into flow of unknown trap handler */
>+			if (!handle_user_cfi_violation(regs))
>+				do_trap_unknown(regs);
>+		}
>
> 		irqentry_exit_to_user_mode(regs);
> 	} else {
>-- 
>2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
