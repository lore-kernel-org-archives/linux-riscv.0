Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F3C79F80
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FgT7tEgRFKh5YC5i4d2FCaNAdKcQ4y1URgi/DbeK7w=; b=QuLgmaTjqjrw7Y
	qGbbp7mmdgbzmg7LDdSqG0wLipyZx4c/m9XXux07SF4ePF+/qrUXw/PGb7PED3mY0XWFHRtGz1yYg
	kAtlPI8bD8UIb0ALOdj6Wg4TF14SptK6mVfsnLWFJ3Sjs/xi6hlpibPfUm96/npVQWRX0mnhQt3fI
	j5GAmwOtwRq1qzER8dyntrGruJTPxBJLR9SvJptJP9SYiEEJ/cWzP6kYv5W4yRLhuwFNMsHH0UM2d
	r5hXv+BI72lncj61zrefrp9/AbP6jCFjg67ETCUKb+Uns3Sq6Rx4Fvpa4eIcABP1iFlEjsTBJ0XU4
	sAc7v22amd2TZLdR2qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PBs-00000001McN-3Nc7;
	Fri, 04 Sep 2026 08:22:28 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PBq-00000001Mbx-0oVr
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 08:22:27 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f4f53975e6so622798a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 01:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510145; x=1789114945;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Hg5enr8UVGmoY4IFaKJm1CFD+8hJCgKWPLT+95rrjA=;
        b=L3nwURiiaasGOJuqs3K4/zyrKl0wpkgdJ43y3KD8PjLm/LDfAw3hiUO/Fo9Qhu3YJL
         sRKS9xLMlI/n1bp6u0qw5++6A3+3jiCiQkjPN24AoPX/cNiEftLrVc+fsVmzCyPYfwLT
         ZvAwWzjsVAPEtmYlP8ev1PGnKznJsy0l/bwX2IJIM/B0hA1dBY/Zec1qLNjoLwWCjtGS
         VTmDo/ZNEYSdNrQkEfp4rwahEuJK/sQWCE6rHHPB5rsCA2BTeC/7JZ9a8aXrN3WGXo4q
         kM0XRh/uazGQKV8W/ErWn0FkIPzD4YHUv4YdmL+uC+2MRW1HItl9AOYNsNBzkyDEUs2T
         lTtg==
X-Forwarded-Encrypted: i=1; AKwUvBzogxYIr1qNl/Wc8/X8avenC85twQW0k7fzAWB6wWZU6MoryBDZA7+SNIHgxgmVsm30I70PlNxNTrygXw==@lists.infradead.org
X-Gm-Message-State: AFuF++mZtnral+qjQGQiZ/PmgEmniSudx8zCRNcIk/QOjYElwYJoyJ6O
	Tj4LsjkrjOaoIJDOC/S/Sxv3mk4bwtt+AhZGJeTDCjBmAXqoCOs9Qa5OgO8JM6S9nFE=
X-Gm-Gg: AYBFou1TIcsD8An2/LlNjHRIa7TPf+BaKGfjYx/kxnv7hY1dLJjiXBxOUgpAjspef6C
	PvCqXjR4NSqW7UNFSYNF4fMhSQz0TjOULwEBt41FlYP6+SLxmfLf2OplBpfVnlm2pUj5oAkGDUK
	nn1b+ZHWxjtma02fbWeyihJEBry61zLiNP2h0ycOZ+5Ab+I+h3LIHoeaqmaXNHSbBvMXLfsuHIb
	C35xLCpLqz6eedMt+WcUgQlwEKiMqMkP87g+DgNG5lVfP8iN0fqeBt+rnfcPQyg9vjK226nY6jr
	zG7oWuyDXxX1eIs7it0fbs0oYrSdEobI7+KEbZcOGRnCNvjWO+rDh9N0Y/OpMJlOsr6w1hXl8/G
	iDD2iG6FsGARAhVIpNoleVn4H1iKF0A92pkiPkpjNImN4K+mR2XSjWzXYo+zvwsjczjRmFHRN8d
	xvT+7PoVYajswgNzx0U4jimYp/tk2RwVu1UhkwWmbMGz3tdG0Qva8MpwDfGPec3NSZaKD6g2C0M
	xPW+oV7yoxnvAsAX2vfkHs4cK5OdC7gPWQI
X-Received: by 2002:a05:6830:378a:b0:7f8:4a36:5eb9 with SMTP id 46e09a7af769-7fa2038ae17mr4300691a34.12.1788510145128;
        Fri, 04 Sep 2026 01:22:25 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f7aef680sm2415632a34.26.2026.09.04.01.22.24
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:22:24 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b7b4b08d78so121298eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 01:22:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXxXzEdho/4r04Fxdu+ithhg0F75LoJ8JGjv66p4XECpLmGIvbSPN4Lq/G7dIlaj1h6hipsEjfUFSb+A==@lists.infradead.org
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id
 ada2fe7eead31-78a4a9106f4mr984477137.7.1788509665014; Fri, 04 Sep 2026
 01:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-23-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-23-s-vadapalli@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 10:14:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
X-Gm-Features: AcwNN1UYeUOEoTpTj0vmkU4IKRIpHFGa-g95RrL_FdgZr5R39yo0yU6G4UOZ8vE
Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
Subject: Re: [PATCH net-next 22/33] net: dsa: rzn1_a5psw: Remove comma after
 sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com, 
	clement.leger@bootlin.com, justin.chen@broadcom.com, dlan@kernel.org, 
	rogerq@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com, 
	andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, amadeus@jmu.edu.cn, 
	kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, horms@kernel.org, 
	vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_012226_231413_B4D6A5F5 
X-CRM114-Status: GOOD (  14.85  )
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

On Fri, 4 Sept 2026 at 06:41, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
