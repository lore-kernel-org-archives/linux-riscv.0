Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B81AC55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 11:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gSKSnug1WYbsarFsm6x/8rDrdAUdbffD/17Dv7R9Dk=; b=SpGKKzMx4AST2G
	ORS+hhRuBK3SzfWw8iAngz6OqU508ofOM/qekFLC1qglteNWWYqMsD5ku9DtNU6WOrNYND/ybTxGk
	ortGDsC+WyTuykLTqOz6gpCRcpmCghH5E3+CY+CjzQvkGYls3lpRg/sdl87YRzqJWJg8VIpvP35Vu
	SwyDo/F8zry/eTzWiIC6TZg6yicH/Ayqv7BTWY6H3SJAeytiOfnrReLVV25si31ifXvtGnB54KLwi
	5A8jE/g2otjb187TeY2xmtxxpHZuw2aJEZXfP/L4Wxl5H3Rh5gHw/CIRJPcGUCETANzZMgdMN5vnV
	JA94YJNzse94qNSMgXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsfX8-00000009Kfi-0Y2K;
	Sat, 08 Aug 2026 11:48:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsfX5-00000009KfF-0D30
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 11:48:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so226047a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786189686; x=1786794486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ba7CPldeXVcAH2TRIOtLqqxgKtUdJnJOaQRZ4PwvS+c=;
        b=YZeabKHD/ns7YFJtIfMizIXjYI5hZN6AyO9atu4ZF9419D3ySZufxv8pdFjJlYCJQ+
         aqIYoRAt+zfzHUQ8CDNm51jvYNJggO/Ry8c1DpHEw/0S1GSYYuMLicr5aVC3CkPnQU7X
         3FnjGmeb2ZGfBKvAZiP2W0tWPRxEMpcD6epqTBOqrZQi2knUV2wCcDILp/ykIRwiGNBm
         JoQLqpDRBVstKHEhuaQwDHWjB6p/Iais9+9OcMbbPsFJ/2NqWssgVjcjmVWKpLNMO0kH
         h8yteFrfsKBn9DNqnU17wAqqFnZArjUHH3MR0+5J+yPLHt5kJvxP/jhdsqkP17yPbF95
         4Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786189686; x=1786794486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ba7CPldeXVcAH2TRIOtLqqxgKtUdJnJOaQRZ4PwvS+c=;
        b=QbpDaoZv/WXPUSSNO8IOXpYcB/u4KuGRX+O7dvcvIkaNWJ96YZHtjnxCBBen6XWXzU
         IHXpdqcrgbOkz3Z/+4E/iVzkO0ODe2x8ZjMLawL8QF4WwU8sRz9m8aHILryD/O4t6If8
         Z7seFSsLUhFZmy+90kWpDr9LSZvcpcBHPjyi+ujdH2v9h6oSyFllnHr+4OrFCQdB0n23
         RrwDoOxHAc4u8ciTtPG1pkUQDF/EyIL9R6PiaL/8Gh0R+Q1KfZSeNs+PXCRZsMYMR1Be
         79ku+Qd1k5RCh+xioQ5Pl8OP59iecTtM8asTxQOm5ZNymkZeMkKklwRdDsbUlR/tkIL6
         gB+w==
X-Forwarded-Encrypted: i=1; AHgh+RrpR+Wc+4GWpFyKDyiuB9LeGxDG7q6QZIBBv8IhoLohXcNrCNDRf1mCr9UQLCK6b7XJgN5UYVXe6a/wXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaEyH7986kppCo23nGMxNmS3vLIj6GG1OC384QUOYsYEw0yOqY
	DJ4qKHRIee6HTOEvGbF6sml3wS9a7HtX0z6lOVHEwQbbaKd726Zt7I9y4bxiBQRP
X-Gm-Gg: AR+sD13ysoYtK4dQpmXRVA9eMUDiHJBqheM9jES4X5gEfseDHzwFLp6vG+o8SVFsgbG
	YKRAhvP2xy0/MgxVWLtRE3GH0JKuwu7VYnc9rWluII+zHZo4D2zddWuCUIhSVfR3DHiWO6M2K5i
	Chl8ZcSRMslZHjWINnSD37q1ovzVSBSm0BNFSp64SqNmU6AOi1486UCoMMO5tdgDHD/FMu+XXMc
	SUvCxjhdHwNAgOVYiDdy30Jy2FgJALg7JTV0wO8N4DeB38pVeby6OFcbRUFcBXl7auadXNhDonq
	MXFWXQJ7IfZjG4LnbMF2G3qOoifZ8uCRn0Wpusgz8bN2HrkFISvrWKrEFRnA+ei6vUUIQhJej+9
	oQ6CxxalecAzS9nu6xE3FhNBQfs+QGqAuKUgpF/WSV41FDSDCvaGUgUUmM52EVoTztLBrrPnm3i
	HjFp858hWDI/jISgFEMkE/z2QnitLhaKF0FEaQ5ELlk5Qub9ZpR6qakZpqr0n1DKHoDIcMls/Z
X-Received: by 2002:a17:90b:1a92:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-392823bfc0emr5665515a91.13.1786189685672;
        Sat, 08 Aug 2026 04:48:05 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b37eac8csm2648105a91.4.2026.08.08.04.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:48:05 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Jimmy Ho <jimmy.ho@sifive.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hui Wang <hui.wang@canonical.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cpu_ops_sbi: retry checking if CPU is stopped
Date: Sat,  8 Aug 2026 19:47:58 +0800
Message-ID: <20260808114759.1677578-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808063242.20178-1-jimmy.ho@sifive.com>
References: <20260808063242.20178-1-jimmy.ho@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_044807_123040_82186DF6 
X-CRM114-Status: GOOD (  11.75  )
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

On Sat,  8 Aug 2026 14:32:41 +0800, Jimmy Ho wrote:
> + start = jiffies;
> + end = start + msecs_to_jiffies(100);
> + do {
> +   rc = sbi_hsm_hart_get_status(hartid);
> +   if (rc == SBI_HSM_STATE_STOPPED)
> +     break;
> +
> +   usleep_range(100, 1000);
> + } while (time_before(jiffies, end));

This is cpu_psci_cpu_kill() from arch/arm64/kernel/psci.c, down to the
locals, both delay values and the closing line of the comment.  Please
say so in the commit message.  Right now the 100 ms reads as a bound
derived from something about HSM, and it is not -- it is the arm64 PSCI
value.  Naming the precedent is a better defence of it than silence.

You also dropped arm64's report of how long the poll took.  Deliberate?
It is jiffy-granular, so in the good case it just prints 0 ms, and the
caller already emits "CPU%u: off" -- but it is also the only way anyone
ever learns whether 100 ms is close to what real firmware needs.  As it
stands @start exists only to compute @end.

Separately, sbi_hsm_hart_get_status() returns a negative errno when the
ecall fails, not an HSM state, so a bad hartid gets polled for the full
100 ms.  Worth breaking out on rc < 0.

Thanks,
Zhan Xusheng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
