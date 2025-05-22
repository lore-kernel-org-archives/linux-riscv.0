Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B45BC54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 22:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdUq0NJ8oi3WxYru1A4FddxLGYW/EVpq3kDMo8eFGbo=; b=yjXJJsZS8pnCoB
	BYgWs54jqmUNFyL1t80tt0ICVCPcLzDAyIIxzijW7TYwF3Xoa7CpWPh+2NPwHjXS7TKOSKhGo9dCv
	bpOTnR7nd0C95gh+zwXN8Ai/F7DafRJDyy2Qc4da6DdQgJOskpykSNn4NDd3mJI0BKSceZqkB8Spv
	2SiaH/9SOFD3///RmNal/8kNrbIq6TAeTnEQzCMDwsj8jZxkyZIAbAFWIr5PTdtgeBw8EBImVUHhe
	bLLffH6mfDGwA5Nyw7wHBWlQwAI6lwuxnAoqjkNU+tmhAqQd18BD8Zxb1FBVkAmrw7qAPSIp5m55x
	sdGv7UWiq59p74tA9XGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIETa-00000002Irz-1Wni;
	Thu, 22 May 2025 22:33:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIETZ-00000002Irm-0FnO
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 May 2025 22:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lIPDnA54KHM+aahxuVehx28jJr1eOYyr6Lt8SFqaFv4=; b=P4OwZuxCAunZBnuM05hrISa6yn
	no1RrOX4AJnWYUN6s6R4ncHmWCJOK+VcKPvqQqo3MWHZ/9Q7TtuefXgvPI+EJTrcR1FUEOnBOtlQS
	IvB9qxPrYz3qzkWknZXvxxF0szNQeyDwa+6JqQhSU7GVH0MG28gL0or1okNHKTb+SS2I4luyPXHU5
	mFw5ySGlXGeox8m6J8GNAiNPoWIbxYAg7bCuGOfQRpHN8Rw+QCgJVylS2UUxGnl9FqZ4h4B3gDO9f
	MFISjsJL2fl1ImpM/nyQlANKpJ2fUDCKYFZ+7pH5I0TSF7KL98+hyu8iDQcw2hoNc3dzqjd6Q+F4u
	/SCKUStw==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIETU-000000015jP-2YPv
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 22:33:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-742b614581dso7029443b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1747953193; x=1748557993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lIPDnA54KHM+aahxuVehx28jJr1eOYyr6Lt8SFqaFv4=;
        b=1FCbdDe6WGWkMhaq4kDogNlMvHriT5SMt+Zjl8RWP4oSwWdCMKvhJ4Zy1TEkb4Fj41
         x0ulHMiZPnspFW6ZfZuQpQnx4EDHl5X08QtFqMSB6B48TogMg5Umwi+bap1Vs3YYTdFv
         MhR4MbBsQTQPbJZSK9qMd0voEjL9MLbpgsE0MYBl3eF8O8WOjdAR/TpGTvgFxeha/6LO
         X5LBKVWcp+wumeaFI/Bvqfg1wzgs+WLdm24mnm9FBXMkAmz3lihOfRR1jxincfurimCR
         pZJgqWVAmqazSpbkBx0wvnAtkT4etyMaLAHqNQZaT4Ky/sgcY6byFc3HmtNzhvrBaNLr
         1b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953193; x=1748557993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIPDnA54KHM+aahxuVehx28jJr1eOYyr6Lt8SFqaFv4=;
        b=wHWnIDeTmsO3apiaw8XOY4zmr0Wn2H5JhGxVtfUVgclNKM22K6a2lg9tFqoLOiFBx9
         MRBfpOW//doALzZE3f4WhiSMd56Im44wVcpOonyneYD5X1b57QuhAEAxEIc52uuvEzwF
         10fOH152B9tAgA263RSKR7fImRoabLfuS5owT0QIQHn0TskVK0WPLovZFU6sEpurQUTB
         YB92+Dc8z2PrIdJBtDjsMxH3wsBaPez6YCG//b3eAUlkNK0WgbZXRGJ1WeiyaiQtMhx1
         R5UTcMaD1FC93UMgVjkD1pWByYCduInKI2rhro6PukVFNq027LGFtEffUU9uCGGgvXdw
         WlfA==
X-Forwarded-Encrypted: i=1; AJvYcCWp5eoMk1mhXSVSz6iY4Ho+pAi6Sm/rpptWHWofw9iwinyyvqUjiI/Eb4Lx+INmsMG0rHuUvwUAQy2Y9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvo4BnolxPE3m3pOEQR9N3kpBa8ceKpM1YR7z+7j6Jd450P8wn
	yXUc8uvMz2+pwhQ3zQxeHjp0DxcItK0Dd/1l1wJORZUxKpB30NTBEG53fjRITkR6QzQ9eWmpX3f
	E1RBR
X-Gm-Gg: ASbGncu5jVsVLACQF9Kj+qS1Hq/kb1W7cWPtOCWm5QTKBib5WEu1hlxa7WH6imKvhZz
	t+u9+Mt8pBdVQI4+BD4Rf8Qgph6xDnwXTpGTmAd2+H3F6HiEA14B1gmzpd28Bx7YhU+QsnfpWCu
	Der/9uBfsZFdGQROwqqQWhTmmI6sS1eDm8E3/KxlkbnZGDjBOWqfYvVIJnTAwjeHYz+FW98AfMz
	kVNwRmDop80/s7/RtS8roIT7OkEgFAcxulczhRqIyAGpUtLuHkNvrZPhc5ms2W2tKtg+0c9vVm0
	C1wwPpHu2BwkpnjArywn695ft/aSuKW/mSTf5SFySygkD9DeBVfrgYJxM22DUQU=
X-Google-Smtp-Source: AGHT+IEXf8P4jUBPRl9v3R75tHy0ox53KdngEfSQ/zTdV0vLhoyMGDNzZ3PqCSjMLrrOP4fvai8dMg==
X-Received: by 2002:a05:6a00:3492:b0:742:9bd3:cd1f with SMTP id d2e1a72fcca58-742acd728eamr34873087b3a.23.1747953192946;
        Thu, 22 May 2025 15:33:12 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c6b1sm12137965b3a.59.2025.05.22.15.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:33:12 -0700 (PDT)
Date: Thu, 22 May 2025 15:33:11 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aC+mJ560HbscG38R@x1>
References: <aBus+Yc7kf/H2HE5@x1>
 <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_233316_986816_3B19FE3F 
X-CRM114-Status: UNSURE (   9.62  )
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

On Thu, May 22, 2025 at 03:24:02PM -0700, Stephen Boyd wrote:
> Quoting Drew Fustini (2025-05-07 11:56:57)
> > The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> > 
> >   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16
> 
> I changed this to https://github.com/pdp7/linux.git but please fix it
> next time.

Sorry about that. I'll use https in the future.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
