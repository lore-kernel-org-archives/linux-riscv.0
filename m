Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D65C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hp8SYx4hvbDOwRxCC9ippRe8YtH3qjRWlVrjb0oAork=; b=riRtXqmHxnXiF8
	U1wRpRf9wrGDwA9gXblecdc8gLAJ7RQ7utOQAtgX5dd8bFAhVSu+nzfT/K8ySAGn7TJhNbnkHhaZT
	Ei685kOAfGmuqDI9JC+Cz5O4HKHYP3HzDV2FSsVj+CHnAff4qCmiULeptkMKnN0et/fuopYvQezaB
	EAk4motWMFmYTZU6qeHlTHFCKgRkdBmv1xs2p0QclRBudHE0w4aU73F9y05XN10UMyme47yzgQ+A8
	uy1piplVR2oj6Ta5WkzLg9df4ly0fekuEFtjp7Lp9Ci6VwCyT07GM5jzwYawEgXB6P/wyi9u/6b9K
	6jq9gTCmZt8eqJcaBcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUan-0000000066N-1SdY;
	Mon, 10 Feb 2025 14:16:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUak-0000000065r-3LZD;
	Mon, 10 Feb 2025 14:16:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso29238125e9.1;
        Mon, 10 Feb 2025 06:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739197013; x=1739801813; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2yxORkU0BwHhsffL3ulJIkwpSZLMqKG329zUxbYPPkQ=;
        b=ZnOhr9EAkfIpu1ZExH88HzWDkGD8URrP2UH6PNDOQsgHKUHfdwKYcz6QNhPa/QWMjf
         OtpqovchW8BV34nuR0s+zt6w9FyAbYJ13s2l7uu3SnGbun8Qm3tawFLgJ+V2W6bKJ2gC
         bPEo1LMmgwmrGbtYeBGkwgxXRTrMKQOD3wfX4sb06+oPw384g9XzsF2VV0ro8F/mkwct
         k6XYMEC1pwccbpg+qc5t29lAUfaICfehTIcYt1lLsKM0DIC8Cgaxsj6OIXpr3PRYbHTo
         h0Wr3EpLrXHyBxdquHlRXSxUQgXzWVbvFOYlIWl8cxCKALPl4jbBgM+Y3IFUpEXee9SG
         U5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197013; x=1739801813;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yxORkU0BwHhsffL3ulJIkwpSZLMqKG329zUxbYPPkQ=;
        b=KUbQOa5iRm+EVCXQExVHOIGWuKA8/oo6mOaJaAYOkG4wJK1HTZs6cWQeBhyHUtAgud
         QU7/pG6gmEhYHlNK9PxB13C3WMqn9Z2zW0FtxoV+eag8X7+U8PuAMdG6T/KrhIVl/Y0T
         yo5nwU0Yv+t3DhMP3Ru1eYKoLkPoeMYartVKIAkIDwqlIQMzStlYJRE08K9flx8tRPfh
         hTYSGOoej4uLI5jhHJFqimMYNZEpByqqzHnSy2vbxFr+/8kk0RYSDt/5g/Lwh3+Apuch
         wuv0wMa2P6e8f+T5g4sOQ5zfL7JC8hmYb6jJqIptXT+K7WDg5YjGw5qpHUZnp7uPSDLM
         I8Og==
X-Forwarded-Encrypted: i=1; AJvYcCVxgllVapiSqYlKwT2kUEHP8XA5lPBg6x7JT41+xxzD+mJoPKIn2a4Ke36wkD/Ldc6qrMbBAD/X8RkqaYJUKIDT@lists.infradead.org, AJvYcCXqX24UJtfXXWC+ULHjNY/4VgfZHgznWwehOxJ8Bhv9YYq8MwICSDGNNWz8Z4G+CPlg2xlz02MY57PsQoY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuZR5SVGMqVNvt1tXp4bTJivo13QclWBfRjhd4B5Ts3IzfL84T
	fSiAsio6WODEVALkR2oOZdZqDw+GjA6zuuiEPCTyB9KaudqWA33Q
X-Gm-Gg: ASbGncvHBXphvHHGtNLE2ipTkj2wTK3eZxADlWk3aatvZ1x0QONXZh+1fnNsWurbMKL
	6XnroX2JrAu691uE98e7WbkJJ4xB6vy12J/ogjHDjrCsFDJk4hCZYToSiAyH+VBYq97X3u7uQE6
	aSc4e7APZ4dVya9WlQxrqRevu6PB/FqPVtnFJrUc7utO32RucVjMNiPvnZ3mNlq5Yl+v0PZkN4B
	x7fvyjasaVXMX2lKfXYAz5iOmFSFWx02/tD2pu8YbaIKSiVycPBKtnio0TCipBLgW4aQCeK8zOk
	GgIhoGJJvDmqe5hrDwAywv3wd9NNl8O6
X-Google-Smtp-Source: AGHT+IHNOu5fBQbgxx/H3Ub0lE217C3Rg7B6vLrKoEEdX+bR5RhSjkNikHnqhQxwOe47XQ6szqa9EA==
X-Received: by 2002:a05:600c:1913:b0:434:faa9:5266 with SMTP id 5b1f17b1804b1-43924991f73mr111581495e9.13.1739197012751;
        Mon, 10 Feb 2025 06:16:52 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db110dfsm186220095e9.36.2025.02.10.06.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:16:52 -0800 (PST)
Message-ID: <5e08940e72d4669eac3d4090fec84c8a1ecb17c3.camel@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann	 <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Mon, 10 Feb 2025 15:16:50 +0100
In-Reply-To: <g7gruyv5rczuqybblnxy7myh2rakk2dmldy3ks247evjb6k3zj@ffkzilxgp3gy>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
	 <g7gruyv5rczuqybblnxy7myh2rakk2dmldy3ks247evjb6k3zj@ffkzilxgp3gy>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_061654_851354_137D92CD 
X-CRM114-Status: GOOD (  12.04  )
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

Hi Inochi,

On Mon, 2025-02-10 at 13:05 +0800, Inochi Amaoto wrote:
> > Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> > 
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> Can you add a riscv version of the this file too? This also applies
> to patch 4 and 5

this would require binary Sophgo RiscV toolchain, which was the whole
point of my ARM64 BSP. So, while I could add RiscV counterparts, they
would be completely untested.

On the macro level that how I see the current state of upstream affairs:

RiscV:
There are necessary upstream packages available required to boot, but
there is no upstream toolchain to build them.

ARM64:
There is an upstream toolchain, but the published U-Boot is being
linked with ATF binaries -- I was planning to come up with pure
U-Boot BSP for this, without binary blobs.

-- 
Alexander Sverdlin.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
