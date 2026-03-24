Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC57F532E5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 07:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUmDgWFz/DeFlQpaau41A8OyEZgvynRDleew7jINvGk=; b=K9amMKvv4O6oAz
	S2jMMkkgNsG3hWXgRqbVtljEcTPpRy37c5pDkX2S5UK1pTRKoXZOERQMJRlPK8th+XX+suFE9gLIw
	aDoHzgmW+ZgiwJQAmLLC0hut7Eb+CeHtZzJn8445XArdjqyxW5pWw5eW59iVmgE/SB1pj95yycKkm
	G3RnbCBVUNADVKeAHuYmSPS5fbFUhBvdzHL66C4D3TH17VCvY6yZbriNdjvDkIAvuLE556v9EQvD2
	DpgjN+zzx9h9ChtHIKLKombX96bqGz4VdrHxpHKIJ6ZEFZMeD6dmTERLIgZwaOUpSZd5TczU3rXPl
	OenfhzHeGUD1vx+N8Fow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wap-00000000viQ-00nS;
	Tue, 24 Mar 2026 07:54:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wal-00000000vhy-2Ng5
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 07:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NY5nUJKxwLcdpu7HOgzJTvPCYPrPJwn2RF0wTsX1HlA=;
	b=MKKcE1ucy68NU005ab8WiudbQfggMago0W/Vtd0bL71H9Nni6ZokyCl/3N1kp3tqYA/Q0s
	Q2gMfrHdFqiPr9J02oPqMCEJvoPGA2qodteskRPMbpuGO0QDeQE55bydTDZz6sSFnO/Cr9
	ofqEhf2OxyTzokadFTmXjzhYHGuffHY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-gEDbStGzOnGsGnQrZUxO9w-1; Tue, 24 Mar 2026 03:54:19 -0400
X-MC-Unique: gEDbStGzOnGsGnQrZUxO9w-1
X-Mimecast-MFC-AGG-ID: gEDbStGzOnGsGnQrZUxO9w_1774338858
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43b4a9a3bf6so1618514f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 00:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338858; x=1774943658;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY5nUJKxwLcdpu7HOgzJTvPCYPrPJwn2RF0wTsX1HlA=;
        b=VREYBHKsIPk9Al8GxwYdvb9PAePEqgVaejctKOf6htQo/8yNgdD3/0rdVxei2B5jYv
         FbdXmvDyj8X3+6wdL9U33YG2XiHxdg20VP/bLamrcIA5BC8PAjI+PsIagnhv7D5y90PE
         Wsnvf2yZgOQoFCtP3KorITrOnrdzZAArTmIEbP/6JivYb2+1bDYVp0b3aImTOzltfv05
         //gggRidX4Lee8fwvbfbQ5tpc29tS+0jPp1uLRTKlG5/tdPyIMUby8P5ZC9Fm2j8EjhN
         IbaY8f59E+EZsCNnhWEJm5kB2Kp5nTODfRGqxT9LAEnDjuFx4itljRyLJiw9wB36HJKI
         OMiw==
X-Forwarded-Encrypted: i=1; AJvYcCVspo7tHOYWxLUw4nmMDpKwqxptepgJrrFy25mb9Vg88NnRBQEkuJk9GHaD5NN6gUusK97jvPlsyQGyCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMDWUpHfXfLxdsUKDwRl9sizRDEIzB/QP+d69EIeFh5rUiOUgo
	JlA4xd6AnUP3jo1G1lo2S5SYeTgY1oZqM5M1K1PI7B3CkrN4r2oXRqhZbZdxmIav4uHDGgBJ8sO
	pkxEjYJB+hnKD3KoWl8KLZfmMcjtbWQ05g6gccfNCk82ywIG4kjKNYpboItxlR9IsJyF4CA==
X-Gm-Gg: ATEYQzxAwd43U+ysffpsQQCk3yV4h7UuH9gYtuX9+NzM5QNhba8AteaoLyouAlEEf70
	zvH7RuYzPnZ0sLFvlwjYHZsRTHN5tG/d1FyRFRjYwQuoWFxGhxt7tOId1Ee8iqg6tBkRkeBXVCC
	x9E92zNfTonvDeKuzF2mIiuL/PM/P9tSD4cT7s21wKPdrMucHAZZ95IDDSv3L4fVTOdfqpu0b1k
	3Te4CvZIQZ02GHOVudcCnVDkffDgdrVeW39lgy5vZQW108LKh/H5oCW1Zf+FN2Y1r7ZqQjDJ1nr
	97W7xk7SgKds5kej+GknwwUWy6g03gsuGU7vxw2WGmzAEjDktanTTykZlGOj/urP+JgOWE5wqWi
	h7NpztADxj5xPCtP6hakbqKRupVQifkQDlrCExYBcurdWVIm9f3PTZNc95tPiMxIkYjw8QglraO
	n2L06c
X-Received: by 2002:a05:600c:a6a8:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-487012ce8b0mr126639355e9.11.1774338858159;
        Tue, 24 Mar 2026 00:54:18 -0700 (PDT)
X-Received: by 2002:a05:600c:a6a8:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-487012ce8b0mr126639145e9.11.1774338857718;
        Tue, 24 Mar 2026 00:54:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871174f2desm38779755e9.9.2026.03.24.00.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:54:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/6] riscv: dts: spacemit: add LEDs for Milk-V Jupiter
 board
In-Reply-To: <20260322203356.2206927-2-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-2-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:54:15 +0100
Message-ID: <87ikal8xy0.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x6p7nd6Bg_JOzFf4MTZZFvXqNYvLnyM6qgq1H4M8o6Y_1774338858
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_005423_681928_2BFB1F31 
X-CRM114-Status: UNSURE (   8.84  )
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

Aurelien Jarno <aurelien@aurel32.net> writes:

Hello Aurelien,

> The Milk-V Jupiter board provides support for two LEDs through the front
> panel header. The "Power LED" indicates the system is running, and the
> "HDD LED" shows disk activity. Configure the corresponding LED triggers
> accordingly.
>
> Caveats:
> - The LEDs are driven through a 4.7k series resistor, making them
>   quite faint.
> - The disk activity trigger requires a storage controller on the M.2 or
>   PCIe interface. That said, it matches the purpose and the vendor
>   kernel.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
