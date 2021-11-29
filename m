Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898E2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXmyyJ1uW6i423CI2h/0SErjz01YLocJXg8y3466278=; b=nKlUm4m2IQkhOe
	6LBXY62CqNpV+yj7oNYareGkyLnYQvKEspvo1lor2KM/Ys/WIYxl/nfFT10YFpdqI5ixcIk58u4UB
	j5jNdEOPKv1juGetLZoMHB/2KxYbL/Y1gFrlkIvJZs4KSybTwQbFW9V4/OfcG2m1WQd5QRy0QmUF7
	Si+lAAlQb+YF54UdXmOSqL71opZCldgpCHd+G8A9jRIkBJ2jrTIn5HE01kq6TNpqygakzSkbNNYvU
	5eK9c7tv4eWz2fhpqhwZvw6AonKFTJBjR38JkA33EB56SAVHFuwZxFpGZLtnYe8uHVASFketpQgtb
	kqT9prE9IfmkQ+tKa8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mroD4-002kTn-CC; Mon, 29 Nov 2021 21:29:14 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mro84-002iJT-UO
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 21:24:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id np3so13686140pjb.4
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 13:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b62tn3CiLEw4TEz1WNhFNgRTXFgBiHhnJtgsgZWqss8=;
 b=C6OGbMhG+v5XlL9yl4j0UR2cIHoafnS2LzJ3ob0t68dnLc73h2Rp5hBz4RcDZ1WEMM
 qPCjhLDut0sn6xzdSiAFqL21usNnkq55/8aDZZ3amKK4dnT8rlxRng8o/Dtm8xTM3d/i
 NSDiWa6yQOtH7wSniIGmsjLew/TI+U/F6DZC3+TAXr9JxFI/gDMfkcB9Yr7LHysR29vM
 RxCKERC1fXFe7EfyyIZq7HSjBcuInc9y5S405QjQRz+aI1YOkR4GER2pJHM+ehMBmxRL
 9NzzJiKEklbmOsekrn21ZpN/yJKWAZ9ifUHj5n9TmqX0PPsfLyzcYhEyNeGA43BGXJpS
 rSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b62tn3CiLEw4TEz1WNhFNgRTXFgBiHhnJtgsgZWqss8=;
 b=SM3ChBU9yfC7OgBGd4Jh91Zn7TH5Ea3f9rbDFY1J0XX3aoDKPy72k/nmUUSDHzb0SH
 KX2O3SAdKyHXvIxHkr48JROPZWAOJVhuxUl5SvCxaTbdUP324paVWpp1aGuEjneQQ8vO
 u4ScmRy3QXTtkiCVfQInC6XQnPyuJUz3jO76Hzh74t7mnEK3XuV6M2k4oMehG+J31ZYk
 qpWeF9gVk7wgg1OUNA8IJa9vu0OTDyHXABfOz6u8T3zlvPvtSsrMI1ZtaC0JWQBdaHlS
 vIe+IDpKNiqddtQqtOZ2+STKDVp7QSdQpvDcwIsfUOkZGCCYJ+Jy/FchATgBDBYvgVsx
 q4Wg==
X-Gm-Message-State: AOAM530M8teixlih914wLs4cu+5XM+djI6OY1Cv3XiTIpLJKPlsP/S4E
 SvYgPJKfm28NpLeRynWguOweSg==
X-Google-Smtp-Source: ABdhPJz19iIGhmUOfcmwjR5DsZEZAZQyC3/Sy1xk33p927V7yWWQgBpSF7Y4Srq66XMacjv9n1Awyg==
X-Received: by 2002:a17:90a:b382:: with SMTP id
 e2mr680962pjr.181.1638221043538; 
 Mon, 29 Nov 2021 13:24:03 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id z10sm18483644pfh.106.2021.11.29.13.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 13:24:03 -0800 (PST)
Date: Mon, 29 Nov 2021 21:23:59 +0000
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Adam Borowski <kilobyte@angband.pl>, Atish Patra <atishp@atishpatra.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko]
 undefined!
Message-ID: <YaVE775RaGQJsysE@google.com>
References: <YZvP3AuTdEdje/IY@angband.pl> <YZvipLmkQQZ3va8F@google.com>
 <956FCFEA-AB88-495B-B4CD-F3FB410A4270@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <956FCFEA-AB88-495B-B4CD-F3FB410A4270@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_132405_030113_E8804F4E 
X-CRM114-Status: UNSURE (   7.56  )
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

On Tue, Nov 23, 2021, Anup Patel wrote:
> @Sean, can you re-send this patch to the Linux RISC-V mailing list ? It
> seems this email did not land correctly for Atish and other folks.

Yep, I'll get it posted, sorry for the delay.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
