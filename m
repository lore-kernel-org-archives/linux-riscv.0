Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEADF506C3
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kikQwnsNdGLvyDrXj1GseEin78+h7ANjx1d0LsInH5c=; b=J9DcRYbgasYbX8
	LgLK1+FhQYNN8NzEDEZA6KF5y2Mi2Q9dDfqhJDPR+0jP4BNlR9TC0/wNkz+1T7KEc/VzeMsFI8vcE
	/lM7rKRfVSROwyO9TM7HP/egpQxXGhc9v/w6faPo7U/LcoaGzpSsNBikpyVrWuSpYOn6nZ9esWlnP
	bxu7wcPNBauutMlx/aa37F6Bdmi+lflWAUkIbVRByNap9NrWbxVTsa1NkkbHalYtXBSDmxIWMOOf+
	K4dzNTV4eV3Hn4ZfvYbcLP6A6ygiu8+WoQ7q2+fGG7hDhV1u65T9Ad2zGXRLwy/nk6xx9mxIh7RVV
	llFy5Gi4OGk0MuQQuYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27CJ-00000003y6B-1i4g;
	Mon, 16 Mar 2026 12:37:27 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27CG-00000003y5d-10qs
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 12:37:25 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8cd71fb9f06so283759585a.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773664642; x=1774269442; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+43p1seL+R/O2hzNoObXrztoY0CvWOJdUHkcnpAiuU=;
        b=mK7dh7XBQdSMPH0yKboGtwBSw0aiwNjbBp1BJ2CyBCXN3KZjkB/b0mK9ENwuIhvlIY
         v0iOkDTSP+r1zQNfpDAqw4xuldY+Z2AG45Np1b//6YELTY0FqSFC3N+ZKCO/DGCdkEbU
         Ar0H32y3BqYKPjPVuMrWmvzUPkXZGZwt5F12B4KYilcCgvbHlpwLx8GR7Tq7Mb9zjihH
         M4Uf2CJlNpAaLzWsr8+vqK9Wq2hEx8v9PoaMz7Fpd47Y4IefmyVD8VjZg6Pk6STRohiz
         JFpLaucmMgRWja5/ewUQbSd+XnfdUzRY5qZV/mE68mBiiJyaYugVEZ14T7/ygfy86yMy
         qqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664642; x=1774269442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+43p1seL+R/O2hzNoObXrztoY0CvWOJdUHkcnpAiuU=;
        b=Wq2zHtOgNaR2zRnti90U8N6mhtYHsa8Kh+HRLmNfoGoJwD5tKA/lBGnaUgCpNMedhx
         h70GflpoYk6aAeTSrs7bAWIhuLjHXP/O9FJkJRNbZqhX0gxF26s9sYM8jkMzNeRCpWdO
         FS/vhkAff8+ED8jMEv+CWlBAVpbbCbpwESes10rKvrxkiaPjdylHFhFa5eSgR3biw+Oy
         S58ELb5R5ozam0W6qtYFpB3HesFjczoZibvpj01z5BODFjvcgpu90foyQe7ODM7BXE8n
         W3N0szIT4EtnY82XH/kvD1Xab52bx3peI6faVzBy+v1XW0VOOqKKqG7Prfflacrw7exj
         BM6w==
X-Forwarded-Encrypted: i=1; AJvYcCVCv7sFr8X1tKJVgoUXiGQi+7i75Puel3TvhSa8lAL5Dyxx69p7BNfY3MGGbeoyXryQwg+q2f3mCG2I4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjlZP91+s6ev4XkWlfT9zn9QmRYJE8ym5l2beppGoxDBOgQQwj
	B8PW1BIz5eZB5Hk3ugkyz00Anh2FAO2DynKFTG6bxfs5HXhLUXaB9bsW
X-Gm-Gg: ATEYQzz/QHhd9hSgJtE4ljcqn+2W9HbwZA4EoACJfsDxXYHuughcc1KaIhy6D6I0ibn
	RaiciC9OHvbuU9Jj4dBTzKf1Am0qOLFCReSP8ublGwMWIpDmNuX1IW+U5TDNC4w+QKSEbL2W9lw
	FDsV0w5G6n13ZVpmdnhJAhLWHK7iACaEbS8MYVpbheywTygJtCwaqscm+MermV3PaiXx34RQUOE
	wY5XENQ2soLZbV4/BBXoK+c8uOQhMXKBNhpOd+a7HoSrVTK56zCMOhf4jjm5C8eHdQZTx02hioa
	UNHlDFSkKEVsAUdQsRqQa2eDxlZG9EoFL++yWU/HUNwteeem/1paj4xnvwDfjP0ihDoWj3ERrh5
	a4n4R4JvSHVBS4ZGz3lmIqPkVARgsPRIoMVzt8UlMT7qGON4uXqRxRi1Q5mqoDMHUOLFb3+1+FZ
	ezuCvkgJjgb4u7Iqi5wtlahtdeDN8Gq+Xw9IlfCEv0P6/C+zwU1EAORD71
X-Received: by 2002:a05:620a:2912:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cdb59eb46fmr1602679485a.6.1773664642445;
        Mon, 16 Mar 2026 05:37:22 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda2148400sm1214055685a.39.2026.03.16.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:37:22 -0700 (PDT)
Date: Mon, 16 Mar 2026 08:37:19 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <abf5fw5wdsfdNV8G@sleek>
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-2-josh.milas@gmail.com>
 <20251029-nebulous-doberman-of-wholeness-0fd3a5@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029-nebulous-doberman-of-wholeness-0fd3a5@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_053724_316674_9315DBB1 
X-CRM114-Status: UNSURE (   6.45  )
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

Hi Krzysztof,

Apologies for missing the change, I got ahead of myself.
I updated my changelog for an upcoming v4 patch.

> How did you resolve previous comments on bindings? Nothing mentioned
> here.

Which issues specifically? i2c issues were resolved by updating the 
.config for drivers. I have yet to resolve the spi issues.

Have a good day,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
