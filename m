Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B611DCFA453
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JFIO3AOUVvxciJxvEnHvkLGnO9QkIc+pCjuAAFuELWg=; b=bkJs7P7J3kA5Sc607epPAbUJe1
	XVU+fWPmVF0W4spXlyyiGJ95GZtxsKtaMeIBopkmDyBNxb5ZABrFgR/vzMm0F6HJpwyBJPI23OqOw
	/8Dc1onYox3WFRfWwLKN2Hx+IKfTc+GPmU9V/zylBxDNrvI0GluC1qKuHu9WmaQLcPBnzUWx7SkXj
	KoXq75sz6mPYWEMFJrMw9iFZW3cWJGCogSngfanxEM3QWPjc+Qigkh8Bm96ujW7Awp3haG5Z/BF0f
	3iUDk4NLux1MAgJKz1xOQB8peNEpFNdKohhCEs0iJrunUriXqY84I19xkF0452zEcWE2zBE87bHXe
	r9kJCUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eu7-0000000FK7s-3fT5;
	Wed, 23 Oct 2024 17:12:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eNU-0000000FBvs-0CRs
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 16:38:33 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9B6B54120C
	for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1729701507;
	bh=2KGO9/x+zR1sj8A0z8FXdfQsavpMZB5tjb8iXzv7MBc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=V1Iderx9JlR6zj0++K1DvT4PfpXa8YcCAWcd2xKVMUJ8E/CUPPRocpHHZQOV4viqs
	 JogGMeSLznHtoD0qRIzrpylLmsbwkkcss8ErCxf+u3m1dxz4jz9TB2/ee6hIVplyxb
	 TDJIVFGHP09llo3KZMGjaOqGdZrDa3rqAmGVmIJPtr3pMudedsgRelsmzynvzYc85B
	 x3EmnTAHUdanhTRcjExTq9TEjOFWbq3usb/NphDcm83Z4ej3l3H8dZ4x5UcwWLGDkS
	 +E7OiKcuPm1MiZHk807QCHrRer1XpcpHrhss/edq42+am11Pp0S7jw0KIo6edSKQDO
	 NVEAY7YolvBiA==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-288a2ae6d73so71473fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 09:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729701506; x=1730306306;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KGO9/x+zR1sj8A0z8FXdfQsavpMZB5tjb8iXzv7MBc=;
        b=Yga+kMos8xaAOJN5p/NwIJWTK8lSrMqmxmHJ5gXq+L/doKNbCiur7Sh7Cvd9nhxLZZ
         11GHKUdw13XYy9PGqtdVlUSCyML0qKi+iSjSRk+QoBI4ryhD+Yi5GloEZKzhBnnAh1FL
         w2gN6DoMqFi7MOpan6f5yzFBMOJeczMaDCPyilU+CXij/At0TO4E7gf3JUnpn35Icts7
         klpz4VRgw3cSxpHMw9mu25Jf8yJDbIWKVoTdogE1QuB0UGc5wI8bBIXTbBZHVVGuDVxV
         HiMGGlz5tBLJLoHurNEv3gqxUKfiA7YMf6uDz3ZrPRYB6kFsNTiyXPAgeYXgMmsyl6CW
         O1rA==
X-Forwarded-Encrypted: i=1; AJvYcCViYYUdq/0PDGHVA9NBRVvWpSXZof77zRe+WUeISoedNnY8qWd89PMBLVI+M4aEK0YPI7CkwCLXZfPAbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9k+XuBg8h42Q98VNtllqGRFq9OajpTpJV0FTtRDA4ey6Q7ifk
	xT1DXi/+7uLH4b7IqW1WQXUljOEpOulZfGil1SH1XBlUUTiUfYfffX3oy7Da54KmN8boDhjEEJ1
	QrmvgsGT42K9N5xJamacgJGZnm9+eaolJULsIKoTowOviinXMzYsKBP46SI3KEzrxcepoVqquM0
	Kq+tLXYboK2wBUOS1j1UQHCOxOrUQZ+6UUOxGtDqPhmKDm1xmk+l4dp0tO
X-Received: by 2002:a05:6871:58a1:b0:287:c014:c979 with SMTP id 586e51a60fabf-28ccb404424mr3446470fac.13.1729701506407;
        Wed, 23 Oct 2024 09:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYKVer8iHAkiMMpVseZz+FbkbvOVCl9iXO7WeY67iQ2hOj/Lh97N9pnwdvNGMM13TWHpzNMqvtkjAlCvvT1/E=
X-Received: by 2002:a05:6871:58a1:b0:287:c014:c979 with SMTP id
 586e51a60fabf-28ccb404424mr3446372fac.13.1729701504622; Wed, 23 Oct 2024
 09:38:24 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Oct 2024 12:38:24 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241020134959.519462-3-guodong@riscstar.com>
References: <20241020134959.519462-1-guodong@riscstar.com> <20241020134959.519462-3-guodong@riscstar.com>
Mime-Version: 1.0
Date: Wed, 23 Oct 2024 12:38:23 -0400
Message-ID: <CAJM55Z9amwkWEK5GGKMiqh_6NQY=TBQhjEuFdMPBFd_hHM==4Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: riscv: starfive: add deepcomputing,fml13v01
To: Guodong Xu <guodong@riscstar.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko.stuebner@cherry.de>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Drew Fustini <drew@beagleboard.org>, Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, Alex Elder <elder@riscstar.com>, linux@frame.work, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_093832_428325_C54AFFB4 
X-CRM114-Status: UNSURE (   5.13  )
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

Guodong Xu wrote:
> From: Sandie Cao <sandie.cao@deepcomputing.io>
>
> Add "deepcomputing,fml13v01" as a StarFive SoC-based board.
>
> The DeepComputing FML13V01 board incorporates a StarFive JH7110 SoC, and
> it's designed for the Framework Laptop 13 Chassis, which has (Framework)
> SKU FRANHQ0001.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> [elder@riscstar.com: considerably shortened the description]
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
