Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2E3606A324
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NR647S11;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2iYpNvf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NZAmHHX+ZvyDUpr4ZeIRwuMmRfBiFJzHSmFwCDhAPqo=; b=NR647S11L/DW84Nfe5C6zGwxnw
	AZYsVDJoIxusGgwSHMBrpKJXmJkCTBRPyPCYP0BMsHGW8YWCjqWPKkboQCL4bwUU40bzSbVOItimk
	mZ50YExUInoH8BoqLaOLFh2VXq6rD49sRlfqRIvSjGD5M16c7m1GkQ/L2lIhKELaVMpBPgYPJ8mhL
	ue6NI01e6jy8mMQN0l/KunxdbI09g4+v1gZvBlJGTlHiDwOQh7bwNJZPbSe1Plc1Zuu+q7d5fWA9p
	29IdfXsQY4XGiV93BwUZdr9Yzxbf33a3mOiDjI2/D96MmuWJQaqyUEPU9J4w4yPwpxRIVa5PjKGlE
	y6VhMcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0lN-0000000BlFc-2a9p;
	Thu, 19 Nov 2026 11:57:13 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0lK-0000000BlEX-2lKv
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 11:57:11 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso2304281fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 03:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089428; cv=none;
        d=google.com; s=arc-20260327;
        b=U2Exk/cYOEPFw0aYTwPnRxCN2nc8XjirzVblHm6YsmHj1tsdxSY+8eOA/oKipD2f+L
         H16jab1NVaogCeNV3cTCBjirYHB4yei8IHiuEZBNURufNEiCqZyj4AXaBwAUQXLflOB6
         uL9iHuJ3MNy/dOIezjTLmaxMS57zBkroDbVyLM+lO10qQIe76z2dMpu6JxP2FrMfsl3/
         Y4p28WfzIPSKqzVHRxhM8AKwfk/Ix7JBIAwxtXf+871gku2q3OklVp1lKvbKF+df4mTb
         QS6Zo49ArnLig6h1FTf49ZVNmXBBF9FVqCWu2UGiJQvOvqRGpakPL+YaHc5vJ/RpEOrL
         +ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3DGHJD9OI5RgR3FDLdSkUexvvMBs0ImZw3eBtdXnyLE=;
        fh=UBA/ZKLAVyROe7gABJWx1gXgOf3lqPaNTqq/p3WhowM=;
        b=LZaYQBUlEWYKLqGNWXroVCXRjV1kSqOzjM2d/pIBw8zCzeH3ACVf546OyYlzpv7w3h
         QPrKL3lcI53l0Qeke++MB5E5GthvpOeVwuC7kfEGKp7E3OFssZ9PVkM37gil+0gs6/N2
         otiQoi4h4SmSsWI4DHbXsfbL5PKM6f4Qa0PtpY3ocfCyyKIE7CxuRTIIexqpYm9gbinW
         oMTpEQYZQSsrkFuwz7In3pVK4JwC/oPoxaTarRWad/xpoaXPvxb6qM93ttifLCVDwebH
         Yg3pg/6oE95qPyEe7JkQygpy3UqFEtq/8rLP43F/FSBT79FMegKly099G3JC91uiQ4C8
         NM7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089428; x=1795694228; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DGHJD9OI5RgR3FDLdSkUexvvMBs0ImZw3eBtdXnyLE=;
        b=b2iYpNvfLvIKa9wTMAuWHGl8LVd8M9+w4p+6tppR2HUFCgpntN+gEZJf2Ph+OdHCf2
         n7w+A+D1caYwWXCGMtrp1k5DXOukK+3BY8j586vZ0STJuRUuQ0deWz2nzJwOYAx1yhqu
         gMLv6WPmuA5ZJtpP1QAtRLNfabTqQ0I8C7uNVWkeDqC2e0ZhTT+zJcDjScVKJ7TamlJx
         3RcOR5iZlLxKxeSBWrvDlGIcD19wLNO2ERwqrAfD34rnLBlDadnKnqbjbKXCNwUOLT3J
         pD6TIeS04sutUenXdc0R5oAb9p39FRAPtcWDKXL/8xj/mngHmkjA3C5Hb8wUQ/lYCwp/
         ciSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089428; x=1795694228;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3DGHJD9OI5RgR3FDLdSkUexvvMBs0ImZw3eBtdXnyLE=;
        b=d7dEWk4u+myf0ECaGqxQHE4p3zaXNLVadJ2LSPeevKcAQgbnYPtad3d9i5cCVPFdx7
         ITs/MM2wwufpw0udUGncVfCU6ghXCq2tEWIu0FnyLNPgPZF8CkVaJDR/PT4G1SdqBFSR
         Vgj/g9Ln+4jyqejhdo6HbplPxAa5QMdd0zxXaQ10OFfhRf6EZa/XBX/gDN4FCCLYXXSx
         wTt8YpBXGF5DAzawd2AL6Z0aFs5T4v12IyeFB/kPTPb/03/nChwDps6LTGWd03BIvEvM
         If5/sl8lLmnFAEDbAoAhteqK6z/FoZE263GaILmXULvzICgkBoRCFStl/tp5FuEECITH
         4ifw==
X-Forwarded-Encrypted: i=1; AL+hErH5DA8HJjpH/Ie5fKvd3WSpQTf4zEx8ieXudWRrLmbHFBhds598u67oxo7FEUmlRyq6rTXnsQGaYg5LuQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/oCbVfJAkwyFMLQcWWqVw6nY1SGfgNkBZQYraeA/IDxhkKAc87
	BEUTOnkf2E5gwSUTCKgnBHTSIiQWrH0pvXJLC52iH4URjE0Oh6mFGwnX+Lk10wGO6RwuNviIRgJ
	Akkgwouf9rkTgq8GwCmdRVEr49pcDaksOGzF6quU=
X-Gm-Gg: AYBFou39fpRkWc+bEvrnZiPk7POZo1E0Fj7y1TNHS34xKA9ur18uZ96anh5zlxPlIaD
	j2lEyL4b8ALZk3+AUWaHdNCgIvwTKnF+bDOTKpXXp8DQk3zAEMKgu9DAFeLtib7Le826LawMjDC
	RUtmHgH1ur7AZ3W6FO2j56Lf6+Nik3j2xOddgb4SPQySN9clbPhB2Zqb0ogqPQEIfcSDRdSGeWo
	zcRbssrQB9GZiZKOPdOb5IoDpUxItSSAPyrsOAgk5VxFOIlYKluFHmZp08F0Pd1m36tMezMo6aW
	OmTk6KjJNE1wvJ+3mTHOv8Q9Np9Dj4SdIuPGRFGdPbvZwgEluzrWl9pxNRbj0iaVo73Rd/2n0m4
	RgB1wF5YUhyragUg5QWLhhEnmEYXbhqpepDZsGqR2Y0Q37iGujze4iGm/RTqxzykwp8ngq3eqPd
	Tz9v+Q+rgv9MmveLw+8l3RRf3/tDzRxKxQ1MNkvIU=
X-Received: by 2002:a05:6512:2289:b0:5c1:5488:f57d with SMTP id
 2adb3069b0e04-5c1a9d2f33cmr2121143e87.4.1795089427939; Thu, 19 Nov 2026
 03:57:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <20261113124748.339778-1-chenyou910331@gmail.com> <av2McZf10FiOKDcZ@inochi.infowork>
In-Reply-To: <av2McZf10FiOKDcZ@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:56:56 +0800
X-Gm-Features: Aa3M54qSyoSPK0sbiO1qulApR7twGYkaLmwyVt_kNcR7vSHn3UAf0ux0G1y2ll8
Message-ID: <CAKspUhLiZ8GwfVu5cs3f3nr0uFV=qEFs2r+xP+1CkZ5jT5rp6Q@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
To: Inochi Amaoto <inochiama@gmail.com>
Cc: AnnanLiu <annan.liu.xdu@outlook.com>, Chen Wang <chen.wang@linux.dev>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_035710_722059_E7BDDA9E 
X-CRM114-Status: GOOD (  10.22  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 07:32:50PM +0800, Inochi Amaoto wrote:
> If you want to take this patch, you need to add all watchdog device
> instead of the only one for RISC-V. There are three watchdog devices
> for A53/C906 0/C906 1. IIRC only one can take effect at the same
> time.

OK, I will add all three (WDT0-2) to the shared dtsi, so the arm64
SG2000/SG2002 DTS gets them too.

Since only one can take effect, should all three be enabled in the
dtsi, or should they be disabled there and enabled by the board DTS?
I will check in the TRM how the active one is selected and test each
of them on the Duo 256M.

Regards,
Chen-Yu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
