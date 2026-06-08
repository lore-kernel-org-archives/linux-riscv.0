Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0477CD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZlPM/ymsyhQq47+6WtTwtVQoqNbvp9K6vuZOx03ZaA=; b=FkbsJUM8Px44UM
	j00ySv+uOClnv9Um8PsdqVACzuR88liIn6ASyxCItn37GxEcJ6zJxPF1dk8hGhYnPObNIMNbCJIio
	rXK5vLnGUT6HB8cKGn2zk16CdSUkqrrw5EY30dbHj3jlhVDuF2uLL9GupYGnubl4kQgkL5Lj2tB7f
	tOxY+NyeE05UM4e+TPEtI8rnMOQiuPhcIOG+6iWEnniO8eGB9vhQcHurfx8TGbJyDLAY6UGFD0Q9v
	dtR4RpiaU59xaKZpiSmuXC3pL2nejOlibGNEGRUaUytirvHCNd0Xwdr08xi5IoOxRdoSCjtx4loB5
	l8Xogj/kXPteTyKZ3nAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYkQ-00000003U3R-2yKe;
	Mon, 08 Jun 2026 12:06:30 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYkN-00000003U2R-2vDB
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 12:06:28 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-660e9ea26b9so3939166d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 05:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780920386; x=1781525186; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuoTf4wVL4g8Z3xsGez2Y7XIEEPar/p8NPUweSV+iH0=;
        b=XvKEsL/03I9pe7S5zEnPu8APQZmSbWALGnmCfzQMvjqnUXRyS47ihJqu1GKqezJ73v
         D8b8IcI3RoeaP/M4lvOwGgg0sGx10m7dV3g22DCXZLKjA+ORJDeKho+D5o+6tgueDNND
         X6h5ORZ2kEF2cd/bcieL0NFky8U5bdxEYHOSn0Jtj7IwwE0iNqWHzrF8d26SYx2CcHcP
         M3Tp8ifdPI0WRSp0WdJ5SUaV1GCa4svVuvrWoFXp60p7AwJV5JuWtGiSoGxARevZh750
         lucZQEw1zFArQ3XrfzwBYcize46PzgBCNSY6x+ZYduvc+brk8rV+4+FKXviBz8eciDxy
         b3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920386; x=1781525186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuoTf4wVL4g8Z3xsGez2Y7XIEEPar/p8NPUweSV+iH0=;
        b=f9fTu+yvX8F18UpOyh1Gfg/3f6KI3Q9Ee0wRdE7b7YeelOV+nTYOCL7zPoxlNRy43a
         9JAdaBfSqjMpyOGvunthV1cNpPH0DZ+AhwpHNg+NJ9uKH6NdgGGwepNsD1yECy4jQzO7
         iuSDRKzYbpDGmtcFComfBNvBFun9venIOR9WdFN+NjQJ3G7xI3JPAuHSSIZ6SN5/GRh2
         01HLMcxpucHV3fJrxHbEX8Gq6pHFlbkPyOR7zyjiQ02zil2EixwxjTbE1X70cxtAzCSf
         qI9kclBbCBbpParVSu4W7UK8DxWMGThwZDpjPTBe2obaE+3am+lv91oBh9qgVbB8WyuL
         3TwQ==
X-Forwarded-Encrypted: i=1; AFNElJ98DUOaKJbS9GjCUtJDOiszGdpzCP7cLV2PyewJpswkq6XCOlEnojcdlH0txepDwBdgn+NMbqd/QeGA0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBg4OtCGZVgHfNv5kLxzdv8U6431dtMg2ObOJhg5FyYjW1XQfJ
	KmrxOGymmrue44vwIrSKHd3G+6YSil/8TaHNbi6PmMfH+o2DrfKLRFFG
X-Gm-Gg: Acq92OHJ2pvsazQhpyK8e2N8p5w8DBcjDQGBTlsmj8mmB0dF3neXAH7jjZrD9rOw6OT
	ltzweSyan16fW9ztT1UNi6tc3kkJZitzP+qrEdaf8tCi3Oe3hEb3MRk+7CnXktmJJ+pIGzn+APV
	WATFPMsxl9aAJVff4oEicnFNIx02S5ca37rAal6P8KLlBSK3rHXTOA1KeztFG975ENhg9usiN06
	FZZYt2556g6m/7FWtfTrHBFJ5ykzGo9o0l6YHS9fWjksKBk8sfhJ87ffM8kzBvj/iP5OO/lpWAQ
	pDQ8xOuUlI0G1wIIBKRKvByrJao5wf3UVt0R8hOndBMRc3Xo3uBTSBp0QiZmoDbUCyjntMDUAS7
	PMd9XWhbGqJVt6l8Tn0A3c6gsSSTCQDUIq2hpPi2Fu1DCpzBD1WCsPSXrdp7cvx/ub4QQeq1m4w
	HopZ6TUUq3ihIjK5hvs+Xa0AhgDeN1cVZHgrbhzx0/7AA47P08o7uXZqjtberSdFjp9t8=
X-Received: by 2002:a05:690e:d58:b0:660:5d71:7b46 with SMTP id 956f58d0204a3-66106dcf6d4mr11872452d50.12.1780920386042;
        Mon, 08 Jun 2026 05:06:26 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b9d5sm177590886d6.44.2026.06.08.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:06:25 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:06:17 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <aiawOUHBcKtMVEZk@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
 <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_050627_739950_0AFF3903 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Shuwei,

Thanks for testing! I am seeing the same wifi issue on my end and have been
looking into it so it may not be a config issue.

I was able to get the chip enumerated by adding some properties to the sdhci1
node and adding some quirks to the kernel source on reset. I was also not able
to get the chip powered without manually toggling PORTA pin 15 in code. Then I
tried using the aic8800 1.0.9 dkms module however it needs some changes because
it is not updated for Linux 7.1. I did find some Milk-V Duo S AIC8800 drivers
and will give it a shot soon.

Thanks again,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
