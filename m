Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9822AC5DF71
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Le5hgb5JZwi0d89BDavn4Dblcbyqn1FIaRcxhs74q5A=; b=iPgve/O8zAIzeU
	v7W52TU5WPALSKFpA6lkOmcHTfCZW3STp5swkbAcdXzKrBx1TRVVh+yGS/9S9Jd4yT7MxwfSFN3AV
	lbz/cu337zOEvzbrbTpB08z+2p8FyNBiS2B0+rB+DNQXvRBeMY4H8JvUHY8R99aLU2tkeB9qVa1B9
	px165pQ+E+gOskYfUwEjstSVRZAm4ydFa0/TXhY/THBpUGQIk23JSpZ7ccuE6hhIPBbh88gB0xy+M
	fWOzHDuiAQIg9wXT8hG98x3mHuPCIDGvdwfQVMZNVxP+aTZxnHupS14a427vQDtqyOTFL/k3n0SAW
	KitbN75d5sRX/TtBGftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKSY-0000000CYwZ-01So;
	Tue, 02 Jun 2026 08:26:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKSV-0000000CYwA-3iZj
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 08:26:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8422524cb38so880582b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388807; x=1780993607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOUthwrtbXM+y6Tz2Zof/YPxQsVutrNjHKZLo6oqW54=;
        b=hodZLsexevwz2XVd/P00pnldmHFsj/KJgrbuqJH969mUn7cmGZTryYHyM5CirVXnwe
         Endl0AlsO7/kuouSHi/Xh8vXrloKHy8HtK9FKRBYIRBnEX5qVpugDJ7969zbjRgmBsG5
         pvFM4TXz+21y8282iH5x92XGsPftrvLN9ytbjgskbH+IMyQPOiAveeDXILxRuMmA59yr
         LGqGKm6CIMD/dz70wUf19DZaRgR5kFokyg7yBxqExGJmslnNu4QgsZjVykAjglE7zf1K
         c9ybqkTV7TYzcIvxHbCVSs6Mo/HktKJ3AlbdAK1daW65rzHJmzzRPnJFu6U1RQgbvb74
         2eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388807; x=1780993607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOUthwrtbXM+y6Tz2Zof/YPxQsVutrNjHKZLo6oqW54=;
        b=XP5nEzgxlPTmZ+5xDsPAuk9eq6auuBA+fR+fhFKCqVfDgKy5a4/WHPAWikoYAo24+K
         dmXfPdQc4VAagyc+mx/imBB5o5cdkhcqtqIcJpRnFPg/vvP7RumfM+fa6NBhXZHi+djr
         0obE5eXKiEWU38dSXKXwkVYQawxWIWx4V7JLnDItcLkfyCfF5hUggI79ou8UhQit7uQj
         LgBb0L2TYmqi2Qit/NXK3gVMVL3egiuRQ4xGk1OOMoSKUHVa5uv29yGT/HhEXXFdC2JK
         ML3ZP9Zi8tUJaIeuS95OIcwOOQdUwweEjUE8fkE8BiyJIiXhynDVQ3pfymlO4xjZ9ieq
         k76Q==
X-Forwarded-Encrypted: i=1; AFNElJ+5nXcEdxNKPmpeCrEftoiHrDj07jLCXs2a126UNol4StUjl9RplMRFYrleZFUMa1uGNvQQxwiW4SOo1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw473NzYAEOGyjf6WbxZI1uDBER2pDEWcd72+sPJyxK/37tIeKB
	IjbUKQhtAi8tjZi/du+qlaM+CSImy5IiEF/4D+6VP5wA9zXeLXyFDx/N
X-Gm-Gg: Acq92OFAc87NuvL1dw8PnSHsWKUzJK9vVriGLCA5nN6ZMQkgFQaiV9Ww5z5v3e3LBoU
	YVcTZqG+kW43VzzWuoDalx+ag+pzA2k70DIUe0LvrjeIsoBchgE3uFNyh5Os5ejdlYr1EhA4zDE
	HHypfRnYHqHbg12Jy3Ijzs3blSozCF/5rHWHo7T+oXdK7DHjnYhW/LzC+aIwwcAJVx0voPo1lE9
	olCx98U6RSyeWvHPXCvT+FPXbNiozb470zWcMznRa91H6bwYSvBHEBs3Z0aN+pQPaWn00yJZleA
	ekMRHL3j3TtAEjqh+a38v/UzIvS557rpfAMbEPnIXicAfLBxJ3aEwGXay+Eo977wLWw5cheOHCR
	/ZSc42UQm327cOo3JTjsa1clyCKMI155J5j3Ysrwv+ZkdBKUUstkcMOpZp/6P1a+Yu9gowgqSrn
	0vkmAGhdxhl85xklhkUykjqVYpW9h2d+1QjA==
X-Received: by 2002:a05:6a00:9457:b0:842:2f28:4e53 with SMTP id d2e1a72fcca58-8422f28a4ffmr11145495b3a.47.1780388807111;
        Tue, 02 Jun 2026 01:26:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm7025142b3a.34.2026.06.02.01.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:26:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Tue,  2 Jun 2026 16:26:23 +0800
Message-ID: <178038877400.2114604.9271390665852626517.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_012647_942459_D76876D5 
X-CRM114-Status: UNSURE (   9.34  )
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

On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> [...]

Applied to for-next, thanks!

[1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
      https://github.com/sophgo/linux/commit/efe66eed43ef507a5b3784d988842d2e621806e1
[3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
      https://github.com/sophgo/linux/commit/972e8823d93866bc39cf6270bd5ec26d055b9d6f

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
