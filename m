Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13593D637DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 22:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xc9JGOTkMA+nH/PgqDyAyVT4mGTn3jxLkuzFdRRnGBw=; b=REH9DvGh7Tn0qe
	K/yqc+CfiFA0gSKbvV4eneePP0ZbawMW8DHH2p3S7yzUD8cv03J+tcihwcjf31hGa2NLpe8Lt9u0H
	/fcavBgpaCegVQf4Vr2IWGkQc7843zEm06ZFGasxGLgMGr0kdVA8H7XXvik1JqY0GLOG8Y06mkkvF
	kDJSg/OgvovuJYRmX2cR7OjoVzHX00M9YsX7Iz7deFXcxSOWbi8+H6aIZO8VlUQVrn2oj6YTUZePl
	5z6Nygez75d9Yh5T7jQNpZtv1DVfbwnGXPE2dsweyb+LW5aV2x8pznOePx+mF24AEnN7OpS5NLmC8
	ZBSBUlB0OK0x0lm+8CQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdnI-00000005uLn-0R2t;
	Tue, 16 Dec 2025 22:45:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdnF-00000005uLU-2SI8
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 22:45:22 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34b75fba315so4643424a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 14:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765925120; x=1766529920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A7nXoigv9/yz61HlMjawiCb2Rzy4kdcjqDMu4uuBc3o=;
        b=KVXz/MwrP0hjArk8eDiS4rH5ZXSMMRKlAtmEzKHbgrRfMPS9xUZmKqa6XuFcES3cvc
         QGU8ouy4enW04W+ri9Bv6ME9q1OoJBcLUcPl3qUDhiPrcQ4e7svLxz/jQR+SI1I6UqCZ
         1TGru8ey+fL+r8bCEQNJUS7yCnQGdhiEQogkKW0caRS7G5mcUCofgRwXFlfZfEVoJx+D
         bYJD7OBV+7rnOUhM8QoEDP4P2bgZUS+/rC9MdGR/iEEZ93gR+ppSvgFhszWM0aWfs/E0
         V9cuA5s9/DNuuefJeM8ZEOarjzayOaiPJC4wmxELl5VgJ1ttX3MnHwaEHYEwHAikXq0h
         1lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925120; x=1766529920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A7nXoigv9/yz61HlMjawiCb2Rzy4kdcjqDMu4uuBc3o=;
        b=RWQZBMeCXMVhHoYy39PZR1oNV2fyqnDBR+B5tbn56XL6orx/4eC0vC/65386a1ukVi
         myVw3tOtmaVHmmSMQF6WYgC2bF+FSzMI8FJRhu0uiCY00dJd1Ag1n1s/TpgfyE6fGvlt
         EYo3Hdq9n32KCjNZ+SmxrB65BUM084EYf/5Nh4DAwam5HbgkeCweDFoEPGDrc85JTVwV
         NrlKXnQ997+xz3XgYqFodamUY/Ku6S3zJVNoqCg3cZSIUafi7mce4kOLbaMktf/8pAxF
         RGfHKfUYUk2gU3VrJ3TsrFYILvR82unDjwfWSvG99R72lFj9fnZ4zPf54D1gNbXYWGVO
         Id8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfTkKJ23mLAiDNUk6qeniSfIVoQHvh59EId2N7M+mjTvchdoraub5QNcra7ZPWqemEFSHomdSTyQEOYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6bWGHviks7JehcrE4fj4FtKiOYI57W1wfrdAWRCoAUuvz4gxf
	mXb0ObSXLzitvWS6E06l6nFAisjwLtqfJPiZW6Kf7S1BwMpHijx+SH2v
X-Gm-Gg: AY/fxX5PQCBtnHeyzM0UIiEOIkbBaI6I7uYlUFNst06kbpFQzN0a/11kvsoHCvvYAgZ
	okVBIK0XZgIw0DcJUjiJwJc3BJcwQ5z0nP5E1RpYai9sQN6fcRi4B3xjlYsNPWJmJLhA1/PyGut
	+a8/IZxYhZiPlsbMm1fJKp1TqRTOtt7aYbXm6BoUn7hQD3ygsYV3dFfwQ+G7xGcBcsTYlYC4eP+
	1RB/cW9x4pfUMGcx0xlSkvGwo7AN+LP77Vyt+KSE15bugeGSvop7+S7BvmJhijoMu3ksTyJv4pg
	sHOnu6D4qndPC29jGXiHKVbMBfaipWorsQOcBh2J4KX5tLyiYtgIjmtya7Rm8ydHctS17Ci951I
	Ks6GrmJRTZaLjNCNh6obuj2/btsO3MEBTFlCDC3LsYbomY1DfRUXG33gcS7JPM2ECTAoMTuJ9TI
	cWg7+rAFJigg==
X-Google-Smtp-Source: AGHT+IE9nIlDHsFmfYsacNR6G1ZVOO+zgg/tDfoQF+xuebBoHAyCLps0J4BtB+5eml9RBwlgxvUP1Q==
X-Received: by 2002:a05:701b:2719:b0:11b:c4ee:66b with SMTP id a92af1059eb24-11f354dd89amr8447143c88.37.1765925120396;
        Tue, 16 Dec 2025 14:45:20 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm57479374c88.2.2025.12.16.14.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:45:19 -0800 (PST)
Date: Wed, 17 Dec 2025 06:44:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <aUHgt8caOoo1gsES@inochi.infowork>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <aUE9hDtflXpcgGnX@inochi.infowork>
 <aUF4w9sO5lmU9T6v@anton.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUF4w9sO5lmU9T6v@anton.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_144521_666355_305CFFF6 
X-CRM114-Status: UNSURE (   9.50  )
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

On Tue, Dec 16, 2025 at 07:25:06PM +0400, Anton D. Stavinskii wrote:
> On Tue, Dec 16, 2025 at 07:09:16PM +0400, Inochi Amaoto wrote:
> 
> > Hi Anton,
> > 
> > Since you have tested this patch before, could you give a Tested-by?
> > 
> Done. V2 works fine with Milk Duo 256M with 2 channels RX and TX working
> simultaneously.
> 
> 
> Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>

Thanks

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
