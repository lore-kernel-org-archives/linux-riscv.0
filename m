Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6944DECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfFRVhlXqthKNpaYoSRzQ3X+kpUJUOZNQMIKhUwNf2E=; b=PpIzOdqyzVSIgv
	UEkM/LhEvNhXoMkp5w5wpbdS/P9eFHczjxgcG4OVz2lAf3rs0BvaM6nCLKc4GFbMCTbTe8lOzWoX0
	/MZs5/+RyaoWJae672oiwF457KOaXJhP3nTEkDS5+wuy7xClNCju55apajy4tbk18fk9IWSbXSUXV
	q71zhBl81NrAwvUbAkRJIdVXhAZEAm6YLns1wizrHL+HUMy3SsVXFx7iKWQebHMSs+BUSLBjksi4k
	m2U73biR+owM7InJ5TrTQOq9hUNL0QkiFQakcRj95EAugky5jGjro9WjBTvdzIzJWofu6Huv1cSMB
	Kb4g1jcMpB9aIfdD3Gfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTQM3-007DTf-Ty; Wed, 31 Aug 2022 16:14:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTQM1-007DSc-0q
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 16:14:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id b5so18922172wrr.5
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aMmSguWI98NKmktPvtYnC/l2iKpxumwtwsBe8RwBjGg=;
        b=DH7PvLko7d49IjzAVmtLgrBV49mlxf+9XDXVBbxietelZy/OIaolUAkMFDTBAztNRT
         EMoEQOU27VhuyBJxtL8PFS0vvXB4uSZSv6BZYEtWGxAsrEbvablRpMlaAvFhbZR1UJVs
         EBK0Kjs7TUroqw5S+w092+J24ZCbpfTWwTgi6lQmrCS+UxuHUC3tzTjc/7OjiNjaKzmc
         b4Wu6bVbWaFSFbwV7IV2Zt0M0MZ+C4xrctNpx1T1NFDF57Cv9qIoUu+5kAzmY1a7HfF2
         2dFDdAtZtF3BBHVGpByqhwsHG48GUwgLgN/O2Ybx1zCylPvKfQVYU571NNsWJFZEXaAJ
         14yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aMmSguWI98NKmktPvtYnC/l2iKpxumwtwsBe8RwBjGg=;
        b=E/OSacOkoZ7+zs1IVwyRjHv4Ia8zJijTPm1QgRl8UGphI+fGWz7p8g9vQ2ucZHWCxE
         RePkPET9wxgeGPm1YHfFc8KartWNo80pXovzksJFmGGyhBxYHaqsWY9UIDxpjqGN+1h6
         Iwykn049im7G7VyPDy8bb7VNigr0XcceqP8bDjMRrQ1xJ1pNIaGkBAdsftycUBQZ5KUL
         ViTwy7iN3/N0R0XM+NVwaQfGlnNQpi4DMfirX3UjPHe8NwtWfdFUZcq446Blz5EAgcuM
         WRvHvYNN5tykOtoSlbDNzJcXHPoC5GLESlNBQr9iCMWutG7+AYalaMnFUnAqXQCF7dgs
         9L0w==
X-Gm-Message-State: ACgBeo13QunmzFD8wAvrbdL0sXzL5S+wDuhPG/nlnL3pXBLZeuMIpEv9
	47N+551il5TuEZWoWK2XVWf26g==
X-Google-Smtp-Source: AA6agR5Xgtc4NAD3H8V0qmz4NCezn9CoeHu2vc837ligmAydGEGNkQmcnKuj/N0KmvE310P3PNcRVw==
X-Received: by 2002:adf:ce08:0:b0:226:d1ba:3e23 with SMTP id p8-20020adfce08000000b00226d1ba3e23mr11773409wrn.374.1661962447665;
        Wed, 31 Aug 2022 09:14:07 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d4b45000000b00226db764fb5sm8269091wrs.47.2022.08.31.09.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 09:14:06 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <mail@conchuod.ie>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	devicetree@vger.kernel.org,
	ben.dooks@sifive.com,
	zong.li@sifive.com
Subject: Re: [PATCH 0/2] Add a PolarFire SoC l2 compatible
Date: Wed, 31 Aug 2022 17:13:50 +0100
Message-Id: <166196217701.591052.12924322910945691679.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825180417.1259360-1-mail@conchuod.ie>
References: <20220825180417.1259360-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_091413_087691_6040E211 
X-CRM114-Status: GOOD (  13.48  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 25 Aug 2022 19:04:16 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Whilst re-running checks before sending my dt-fixes PR today I noticed
> that I had introduced another dtbs_check warning by applying one of the
> patches in it.
> 
> PolarFire SoC has 4 cache interrupts, unlike the fu540 (which the dts
> re-uses the compatible of currently) which only has 3. Add a new string
> to the binding like should've been done in the first place...
> 
> [...]

@Palmer, I have applied these to my dt-fixes, branch as the commit they
fix is there too. As I mentioned on IRC, patches for this dt-binding are
usually merged via the riscv tree so I have taken the liberty of bundling
it with the dts change. You may get this in a PR friday morning, but more
likely early next week.

Conor.


[1/2] dt-bindings: riscv: sifive-l2: add a PolarFire SoC compatible
      https://git.kernel.org/conor/c/17e4732d1d8a
[2/2] riscv: dts: microchip: use an mpfs specific l2 compatible
      https://git.kernel.org/conor/c/0dec364ffeb6

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
