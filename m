Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342F8E677FC
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 11:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V61fi7cNktKuw4InVp9mpw2gtSpxbZUTwjjLcs/FsRk=; b=OFbL53L+/IgkAj
	R8RNZcwk6aVCnJ7F9biLZIseiasTlsC07p0FGI6KNpfpvmJHb27HoTXDsv6q0784xzp/bBdO9Nqo5
	rxe0JJGSPL1EEmEqY8FqaBlg7yqWgjGO0h9jjQMDUtdlJCOlIw+WL2IAAOV9qqPFoh0W/a81z/1bd
	NIpbO/y6heWDPVtUhGQT830EW6EpApo9TKdiv++0jj46rDftMqHkq5LmN6bAngboxILQPtXSXr1t+
	vpNSZIvo584Y0hpgTrGZqmfiNb5n39my66O1LGSSdZEn28y7OYmMo+12Bu6XQ3jERBJR05jIq0WcE
	XbenmyfTIpVgwA1TUPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7COh-00000009aCx-392g;
	Sat, 02 Nov 2024 11:34:27 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7COJ-00000009a5c-2lKr
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 11:34:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso2115039a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 Nov 2024 04:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730547243; x=1731152043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJwVRqFiaLvbfZMx0epyTUOxfCpcBzEpVcmmFC1PExA=;
        b=XvKcmnPDl7ytM+7U2xqMvlLoW7KvBzG561umXBKC23sKO1aOLnOBs8dhVZwnV2gGFb
         0IIlY+BUQiBDAPzD0fhwxfp81c5ZslGRHt3I7lDfXernxhxfKdFIJoDkf8MFdwEq3jjZ
         PnISSlAhzMp2tcavtd4747gIxT4KZAtg2VX3Gsy6qYA5UK0hVqXeECFT2X+AWDT0rIEC
         QOuu3u0PygmeSFdWjZwqSYtZHrQaDKc4hpDYPyVAS6uuwlZ9PXefW5+23+5uYG6K6ca2
         n24ldJpo8yILQShsLNvGQOaFOFIAm2Z+MTB0TY669WarcK29xZ5cxvUPv8dQd7NYSLnX
         f/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547243; x=1731152043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJwVRqFiaLvbfZMx0epyTUOxfCpcBzEpVcmmFC1PExA=;
        b=ea1l2l+TVait0Z0nw3iU2RXgGaTjgvAFhvjChWTRnCE7T4fbcY/6kLbIK9+StdxdDv
         Tf7v2L0uAWPxoAW+TUGoZqOst2gXckkXo/j1mqC7gwh1Y3R8kZy5SUdeb46NdFOCna1k
         LbjDpsiMGoFtbPO0ViXBoWwzXHz1ygxJcgQFCOrk8mha+Gm/8DwIxbTuntL0w0iOrunm
         1n7DWI6CeA2tDnGL+RwmKGhzuqbMkqj1T/icRmK5VfxM1WtMARhH6aU5oxcDznRHbKLC
         aYE1AUa3BJ9xE0g5n7rJQ+W5k4j9WZBV+fVBLX4UWyYS+JRX79gXLcydqvLzz8yi74Ji
         yO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWniUiTSQrEzgBRYV0kaKmcGPytj4YfUG2ulIHyoSYSJpGtuVg6PhAE3hvp9Pl3PE77lCmGKP2GsEVh9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKdNNtOu/nAreTf/GHe71KuiRsEeU8aZHtM5f8oh8DdR/TVgld
	j0vvcTY2mETxxEIRFncFzM9EguN98xyjR0+9pKNukYx4qqCT/fiK
X-Google-Smtp-Source: AGHT+IHjH3YaQv/7yAR/oDJWHwHW/7AX5VV4a7rQxUbdRITTCl6mcEEMRSpePQiSUvKPeNoACJHiRA==
X-Received: by 2002:a17:90b:278d:b0:2e9:48d0:3b59 with SMTP id 98e67ed59e1d1-2e948d03d29mr7841945a91.8.1730547242689;
        Sat, 02 Nov 2024 04:34:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93daac455sm4681492a91.19.2024.11.02.04.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:34:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: fix pinctrl base-address
Date: Sat,  2 Nov 2024 19:33:26 +0800
Message-ID: <173054635856.778838.205612154809931860.b4-ty@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
References: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_043403_718068_3344AD8B 
X-CRM114-Status: UNSURE (   6.59  )
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

On Mon, 28 Oct 2024 11:43:24 +0100, Thomas Bonnefille wrote:
> Fix the base-address of the pinctrl controller to match its register
> address.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: fix pinctrl base-address
      https://github.com/sophgo/linux/commit/44196383a26fcacbd6dcf5a1ab2dd8bf8e4132c0

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
