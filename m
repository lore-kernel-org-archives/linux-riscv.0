Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B778DC36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8/4Tp/1j6hJtBQ641PH6u8ZkeO3SbcT5563Bk3YXTI=; b=GVTGmeFhFSbdea
	/by6c4CqtKOdDBcp7uAGhlGEjfG1WIYM3SrhVXmCsQT/D9M24qHLkmndgpiflgFkq/Wen2Am8+WLZ
	R7vOJtqHuRibIOIiASjBaspDCdInvH70WmRbfXZIDeORjq8wQBW9CGQloK/+o8al3H+H5MDrRUvmc
	a5Hf1M7HxezKx/asiHhMFT8LE7vLas/GTNmXrZd2826b9gFViAoLEIhflD/kZ4Fj9AQkVXtfIkXBo
	H4rjp309XGV0V20YQWKCMoyZf0VHQ0EPTpgKp3N5SGOmj1qXkeqWJ8eioYcLXgHTmf4mEDSftrEZk
	HU/9kzl1BVEzsATNItRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twjJv-00000003SxX-46kX;
	Mon, 24 Mar 2025 15:02:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twjJs-00000003Sw6-3DFG
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 15:02:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224019ad9edso9264415ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742828547; x=1743433347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thkoKxykLsETroc6mn87fVjpfe6Eo9+STWnHf3GGcRM=;
        b=SW1Sy45iPy59As4PlDxOS6w/qo5AFgCOAexikFKxPJy89SAaHnwEO6UKOxbc0cJlpy
         DtP88qMlWrBNNmj37gYmwlBbPujR1XPAr/s/wi6Am0xuq0hheTijIuyR1pcHTnesHY+d
         njshwLtGamsE60xjsKbhjKFlhsBvgK2iVkC+bv7/uQO0JyIGx+PIFQ+u/lV7S1P6c0HW
         9KI1XJL93+iu2DNt5IMFjP/df6BuHBX+wXY4p4xNRx8XgapcgC3PecN+zjfprRTk+VGG
         YG6NNX7QMjTJX/76Dcr7muGU+jxPUonk/5Afu6wFPIv3K4pASYD018toxC8LI6FnSj7y
         nRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742828547; x=1743433347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thkoKxykLsETroc6mn87fVjpfe6Eo9+STWnHf3GGcRM=;
        b=f3O2Ex8KxBGe1HaZnvA1eyQ0NJ8Kiff4xeHsJ+v5gype2tavxL03bFSxk3UxS4zIJ2
         UQMoOQbLxKRiOc8VZqNtF2CDdpMNHIMrsA+SHPp/BIa9EhsTBgw4Xp+98mJcIwH/mZvJ
         VDNcvpQBbeH53hvXF7OeCngU1lfzvB5ThK1u94jDsO/02DsSI5GzDYTE0hNehzvvoDAH
         MLqxePMvYb+Jb94dpB9bTfNZAkfJZTMp66bga8sXdecVfNIlBmRahjPX2F8E/8E5GT7c
         XRILXl6FlgFNDibTSUR+2ZwPaqV+hfUyK9gsxWjMPTZyTnN3WIadt6BMsbvS44tun5Ci
         owNw==
X-Forwarded-Encrypted: i=1; AJvYcCVsZ0Q5Rl29SxT4NGcMFwaEs43wljxiuDC9Ux4t7er8tvrIv42hZL2PxAfzzyyTLTzsccn9znGuwWOyDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBEQXQxUiaDI1Nb4ug2Us8pa9R0V5AVARxyBpEtLQVxK25jhxJ
	NAHwk6L6DH4Qil2l5ZL7ej9hdXj0IBunnZHXrAlCB+GaScFY7r4b
X-Gm-Gg: ASbGncv/tvitiD7K0F4Uqa6DQLdvm+8UQ8fH/epQzw4GZvUZPBLtGkrZBsbM80OfbhO
	rM4KoXQrMIsY2kK1ZMzfcUv/HlzebxFQ9A2281vc5UQy8L4ZXZLH6dyJECnWvPe0xfgreGlE8Iy
	X2oRDXHlI786yvBvnnvjnM25ipq/cCx3QGdNlH1i0fKbsfZx2HxzNx95zohW6ZVr+zYPx9DbIlW
	WQjiNSNsYqLW6jzTMjM9ds6rIEvksXXmckKAvL1Q0X+6W1nORInY2M0T/v1/huJx3mWw/Vv+b0F
	fzWIJUHHf6/HOtnmAt+1OebnZH+CDEm+FwPvekCVXj5INwt4VY6OKcgHOWTKhS9b7ymS
X-Google-Smtp-Source: AGHT+IGr/YRRu0sAJ7wEPqi/mxNqtNffODibXjrYjhkvWCqcaNcg/AbPXQN+biMqZTzAtSh2Phrdxw==
X-Received: by 2002:a17:903:250:b0:223:635d:3e38 with SMTP id d9443c01a7336-22780c76135mr219585055ad.15.1742828547184;
        Mon, 24 Mar 2025 08:02:27 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b287bsm71697385ad.124.2025.03.24.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:02:26 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:02:24 -0400
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 0/4] cleanup dead code in nodemasks and cpumasks
Message-ID: <Z-F0APn3eisfC0lC@thinkpad>
References: <20250313021953.86035-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250313021953.86035-1-yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_080228_800821_F069B6F1 
X-CRM114-Status: UNSURE (   9.46  )
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

Ping?

If no objections, I'll schedule it for 6.15.

On Wed, Mar 12, 2025 at 10:19:48PM -0400, Yury Norov wrote:
> Cleanup dead code in nodemasks and cpumasks, and while there, fix
> set_icache_stale_mask() that misuses atomic cpumask_assign_cpu().
> 
> Yury Norov (4):
>   nodemask: drop nodes_shift
>   cpumask: add non-atomic __assign_cpu()
>   riscv: switch set_icache_stale_mask() to using non-atomic assign_cpu()
>   cpumask: drop cpumask_assign_cpu()
> 
>  arch/riscv/mm/cacheflush.c |  2 +-
>  include/linux/cpumask.h    | 19 +++----------------
>  include/linux/nodemask.h   | 19 -------------------
>  3 files changed, 4 insertions(+), 36 deletions(-)
> 
> -- 
> 2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
