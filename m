Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD4BC43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9nCRC2+LHVJeu5s4crYDxO8NfdIKdM8ePXFVE0W9zc=; b=WzCwJb9l2oPYP3
	HECXvPoX1L2X/A44J1gulfdBGsrqHIgThMu6xwkxLDptpKsvkzqXlRLs16cdidNu0i/Eh/mH9PDMq
	tVgRlNxVuj0Ba8WaX+lNkj/5cmDpbY1A2HiAQdKxvttE+u416hDNOf51lajUf+oQ4Uxqw7kbvr9cy
	01VBPY4g3Mq3iYH9sqWfgQe8wC0HfZIcAo0vfrIOPU0mxOYYuyw7gwwfoXhZv5VwwKdmpZTO0Wjwr
	N7HrZC1NKbxtpTdMj3vZMC4KFi4yOgKjQN1dJrcWOuGjU0dNRNhobOCuNZTdFO+BOwJOLmXDjjyRg
	lGdPpe8Gr2v0IyOH/mkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDXE-00000003zIO-0TG5;
	Thu, 02 Jul 2026 09:16:40 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDXA-00000003zHq-3Ipx
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:16:38 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso973876e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 02:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983795; x=1783588595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3iqz34neGUxAgVEYrpwzzcpe57aRQt9k5cgKzpkuWc=;
        b=MxxTjgia+B0kZj4CilX9MP6/bR/U6vkISQ5Jmy8LwvReHDDidJq9iZrHEIQ2Dv2ooV
         N4EXoOuwapp0xkop5GPzHlMUV44kQzquJtPildJNX2ZpFKyca1gmSLeMlswpg200QdNg
         juzUXsez2cuY/vB4V0pBUeWPMEgtbxmwxteB7z+8svW5ozZStfPqHxNpYT/vJDV/3Wd/
         8RYncZfQBnSjFeE/r08SouOJBIzvJTMXgSDVocP0sk1PzGwL4nwNqpgdxMECiqogbuY6
         dnZBXQtugya2QB0PqUK6nLy9pEG5DgyR1mNJ4b+GdbE93hlgEs0vQEcQnrjn2X/WUY/A
         tccw==
X-Forwarded-Encrypted: i=1; AHgh+RrXvdw5psjCP5m66QH1b45pT9zRETOiwnh2Ou4kBZJTm/uGOpOhWqOclTs4Yp4sGYpRIvTS+JmPSFZeaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHUh4jllQ8Aa4qYfbAQVkKPonp1QDnCdY/7ra3JQLGIQ1pdlLZ
	H0KQmU+kCQYmohwUFMtlNLWuBCeXN4mmFeCYgCrVwIUgUS851VZdT5NwRtXRUJu1N4Q=
X-Gm-Gg: AfdE7cmSP5uVgPNrdr+bbmRN2J1OQmx1xHREOnfmR93eAXHtJWVnDHmCNACXPHGvYgR
	EH+CrjJEwPQdbKRDqKVdy6Gf0jBlrDMxF+38oUCvMluH5xW8cIFgeQXPoBTlYWFXddMRKZtXwpP
	++xCmdecnGOiD0yuBF+VIaLBkuB4cOVMgr9NAtb50lmiaTHRoihWlE40oEZge9KfOvOmJ4CQ35J
	UX8uRI1nhTiy96QMwh0wJixo5GS8puQElD6aFFwyi/rj8r6Tpoz8Mr7USVCmZfgqsYqoqSipHsR
	KT21kvWgNAnRgAGTl2V4twfMNUqPIms1uJ3TFDbAdp72xckksQm1DkwBYAoWTfQZnYlGcIpF+FL
	RUyehk0L3voWwQIsxQ20fxqnrIAf99DUyYf7O5AqrKXr+OWKAeiLsBF4TUTHEA31MRqh39Qjpv+
	Oj6hosCenx8wfNqEtskjx47arrN9OS7Xn1wdETXV3V4K6C2DqGXg==
X-Received: by 2002:a05:6122:a15:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5bddf58e0a2mr2374588e0c.6.1782983794761;
        Thu, 02 Jul 2026 02:16:34 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdec51940esm651280e0c.6.2026.07.02.02.16.33
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:16:33 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-966d4748ad5so982482241.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 02:16:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr3Rtb5amx2olZP84jvNNb/wR8g2JIfYLWx6Qhics/L6zX0xwFNPhkJBuwfqREyjtoQysJOM2rxDiM8/Q==@lists.infradead.org
X-Received: by 2002:a05:6102:1620:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-73da7681403mr2525301137.6.1782983793184; Thu, 02 Jul 2026
 02:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Gm-Features: AVVi8Cef5-UyxrfN1fWvFDcXcIwIbwhU7f5lsircbKpxY8MZwCT2oXalNKmt_xQ
Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_021636_839599_CF4627B6 
X-CRM114-Status: GOOD (  28.67  )
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

Hi Bartosz,

On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> >> > driver instead of the MAC driver where it was previously. Instead of cramming
> >> > both HLOS and firmware handling into the same driver, I figured it makes more
> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
> >> > any).
> >>
> >> I think you are mixing up DT bindings and driver implementation?
> >
> > Should the bindings change if we have different driver and firmware
> > implementations? Isn't binding supposed to be agnostic of
> > implementations..?
>
> I've thought about it some more and I believe this question is philosophical in
> nature.
>
> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
> the same Lemans Ride board and it becomes one or the other. Yet they are not
> described by the same DTS and the bindings differ as well. I don't see why we
> wouldn't allow the same approach for the this PHY.
>
> We treat it as different HW variant when it's managed by firmware - just like
> we do with the rest of the SoC.

DT describes hardware, not software policy.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
