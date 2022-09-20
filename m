Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1338FC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Kfcj1UkxVakmH31vp12nPpjnY8IRYZ6/pxW2zg9jJA=; b=2hircSnLrJN9Ll
	bkJyFlU3q2BysXnaOoHULWmWb5QZQF+YBkHzBDNMg5KQwBL+6Dyn6rVAaisduFE41txBejUEPItez
	dfJGLzyzXYEtWGG/T4VX1DugpVNNvtNvnlrQmz/uv9zOqv+o6Iz2vk4v+3UnMsd8BlDMmpaRuLLot
	M4v6Rb0Us1NWA79TR2NeVwlMvdqcSc4zcJX4DJmyv3YX0ShH5c5eTQ1Uj/DnlXhJqZJPq0WWvP+0U
	2086rqTt+2dG+AFarMV6MMnoBT1fLXq6xy7cLJQC8iRIvT1VkZlzIuVeldgPywSE8PLyfoY0SaKTF
	g4epZrUZG/RyJ6ydgkvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakEC-006Te8-Nr; Tue, 20 Sep 2022 20:52:24 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakE9-006TZ3-IT
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 20:52:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id y3so9178857ejc.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 13:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KmHiTHNMTP8biWsAP8daQYj5OY7BVwVRM9tvvWtd+NA=;
        b=bGz7v3TaL9xqwNaEzzhpRePNJl3nR2v8fyy/tdpfj8ORs8A+tKuV2ErqZkEXznE4zE
         +KE1X/eI3TP2EtvYb5jzlnwfEDi/0wI2sFh64PIGZiKE8rSfv5J+CNfRZvpHPkwTvJmw
         sB3PUgynTa0cuRCC0zcyM0msRKssfEEA+QhMkZDvdKisHGwoKTuZLJKoyc/aefYF1E50
         tvDpXFQ+0Xvb+EvZ6zm3eJxS6/p5OUzjUqNHta4yxPnstaHc5B518gi42G9L5mGSzK51
         U+uO4xxRqLtpJNEGBu6MHxaoPsLKc3va1Qu/ipdlM3Hp2do0Au8MD7fMVq6tjSoaHnUX
         YfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KmHiTHNMTP8biWsAP8daQYj5OY7BVwVRM9tvvWtd+NA=;
        b=L9K1DqB3QR0Cror+7p/MwvXvRzdu/37snD4cVvc0eXR5cxb35ZyelP0pMH9JLISQSg
         pxl/i3g6H932AcYVE4CvjITcIF6huui61SX9T1mWJRG68+jAE+9xxdz6prWe7hIe0T8G
         +6p9dezlUjiU+Bfo0kOYBRLcH7txBy7PZr8DA41BFcUhe+33wBtjB7ZJhtN/IlSMWaXG
         dy8NdW1f03DvJnC8krnNRIeQ+fR0hIjilmb1GjpT40R75K8umvi2Z2S1qsYMgqeAzcsk
         TKIcBL2PwHtnve3J6DniMrhHI28mmm2jBouWmAYC36tnlQ1plICU00nIB7+GcEcJDPnC
         X4zQ==
X-Gm-Message-State: ACrzQf1B2GyDAqMslmWd5FP3b0ew3i8E/qO3UXW5zyfDoNHYLnTQ9krc
	Nj45osLrUfmW5yJjskCZ52qRN5ou9TErjZLfBSU=
X-Google-Smtp-Source: AMsMyM6Urbztzi3kgvmdlXK/pPcCUmXSDTtGMUd+8QRzEyTzqJlbCLQ+Xv/h1Fp5zCLZ+Wv/N+Z0CaoNNcKWWwG+LIM=
X-Received: by 2002:a17:907:2c41:b0:77d:8aed:cf7c with SMTP id
 hf1-20020a1709072c4100b0077d8aedcf7cmr18383110ejc.447.1663707128951; Tue, 20
 Sep 2022 13:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220920184904.90495-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB5922AFDAFE3DEBBFFF875875864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59224D591B8A227A5655ECDE864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59224D591B8A227A5655ECDE864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 20 Sep 2022 21:51:42 +0100
Message-ID: <CA+V-a8s-6FLu-5D44-Szt8eN1V0rhPxm+cO4OrcKmT90O8LoXg@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] riscv: dts: r9a07g043: Add placeholder nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Atish Patra <atishp@rivosinc.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_135221_637977_2CF35F5C 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi Biju,

On Tue, Sep 20, 2022 at 8:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
>
> Just ignore my mail, As I realised IRQ property in each node will be a problem.
>
Yes the IRQ numbers are different (offset of 32) along with the IRQ parent.

Refer this thread [0] where other SoC vendors have similar issues,
maybe in future when DTC becomes more clever we can use single SoC
DTSI for both.

[0] https://lore.kernel.org/lkml/CAMuHMdUMM9H4jLJ8-zOz9SXoqmK-s4zRWzGCsU8jt_sDgY1h+Q@mail.gmail.com/

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
