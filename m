Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093BFE7AD42
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EK1nTNessTr95XbnOL6LQfd/gPUysjHJXgrJ8ZsSnL4=; b=nw16DgAuFqnpca
	pRsnmqvQbFxMOQJ8/7ZcXkxxwwGlmieK0xdynooErK4qazDnmQWy+h0i5IUhyYuqlSoEUo6eKNGx4
	XpntvLRqz/va3cedr461TypUgxTMffo1LZehZb7SOgEIpcCJETY2i608AEkPApR5ot3DgFvf8ZyJf
	u0KqYZG5VCLp/Yoabq2ADGDZQ5A1rAx7Iq951Ww1SpmssO8IF8Bi318SjDOlXPJFLCxO5HTGH+3xf
	bvGr0FmvADDNYP5AbUy7LsgIMU+0gwnKOu/v7Ik8Sgv990/hTZ2prbOKJQBtViVBoGQYSeh6mjFTd
	svPdytQ2uAzhJt0ulRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhwK-00000000IB3-32ti;
	Thu, 25 Dec 2025 09:47:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhwJ-00000000IAI-0vcM
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 09:47:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a12ed4d205so57518425ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766656042; x=1767260842; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJbqjKEBanMRME2GndVRpSufrs8pVvgREEbvcdz3cEc=;
        b=noeS60PQu5Dlj3Th3OHz5IUX7DFnxB0g7ydHBQwGIRJ5ukHWxtpu/ZG29frUzL5FxH
         MTRozQ4Kvstas/DryVhXWUEHV84kjbNgIzq5k92vM0/1dXPQP3vy6bCJDcN1qR0xfp0C
         tWkdn7wfS1U0WHNGknBLQR+W06o2rmn28j+yc+rLtsMjmr+NyaLD3hzxnTNiDFI26jsE
         fHywA3jOF2RSWmB8jIT8LogTQG6cM9fHPktK/JUjhx5uI4US+R6U9+qOklEhsZRA7oLi
         PJ1gx8lVbMesNy36tPrIxy/ZWeFc/g1A0Yq5pTTfqFjUlF7dNC105YuRLCBbBgCTPQfg
         7NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766656042; x=1767260842;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJbqjKEBanMRME2GndVRpSufrs8pVvgREEbvcdz3cEc=;
        b=BNZihgpQlwJ0RuzuB3I9vAThXAOHH22n1Uef9ufvFKsPltUbjReNdpY86HnAu1/9/U
         5jhQtY6p9/7rq0tPruakUlPhf63zcXcYXBnkNGFRKHkz8N7u/S1JEbY8uzNHN8v9tGpw
         RbPS1IUf330MgmB/Tu3P8MgxexHurunodxTtrDDAaizfTTXQNDaXsbMmI3W6t3mJnVhA
         ULP3Vdr5YMmxd4/PN6XHxscLONd5QrCatUEMW9QdUZM6WoNKyfmOS5QEdayP62oFhYyr
         LVkVh60qLNJOGaoMBDD7mRofCELGEvNcIxfC7DCERZspc7eJWG+uTAhv/t9lvWdcibOv
         3SEg==
X-Forwarded-Encrypted: i=1; AJvYcCWvgkCCuBoizH4dK6on16uj4k3x1uY9xdxEmifgqQPXklgCAhjE0j5vXEG4iqAnyUm6vhV+Gwi3Hp8kJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywre273pXqyUB3eU6PYA1uaLCpqAVzWSgi8GBjWe4yEvHQSiqo3
	si8WxTrI9zUWgaVa4t4uKjqXuIK/YKUZ8q0SAbFG1g3snDJ20CwfJRkX
X-Gm-Gg: AY/fxX6wxLNw1vlVHPgG/1LCAej0a94D9c7gpCeAgDJ6Cscx8Q/ROKIwAQAfYR4l7mf
	WOOMRMIINImCsV6f5Zy0EhYEFVGD23e6/LXJCEaLSpB44/oiA3rVDaZ0vOnDgq2UvcwraP0PKWI
	/n3CewlD/BfSzdisT2mgTjWw/PlQJijBdePK1GaZkUhslaUONUDOlpr6Yi0+mxyUhulkBLOyegZ
	6lznRLI1jhg6ZfGiesbZXN/l4TEug39DB6aMO4PF2eBqoktXzO61y0AeGDlo/ricpi6DAWMNUDV
	SkUA7h6sXq8kSpEl+Hrmw2dJF4D8LxW8gLq/kA/zD4OTR478dO1cB6nHFYjxe95uz2j3raqqKQf
	2gvq0VjWSi//orPABsdHZPX1oTrPjlqf1sgWbRG0J6yfOIUNU2bdRmVvhIPdyuN7P8Os96XUlAA
	i9LyVTb2DMI3Y0jG2QIdZS04mxnU+uJNCAaTqny5D7pVDtdgoYqDQTCHzspLLMmCpAZpJL6SXmM
	1BETTNoIf2s7DfkZg==
X-Google-Smtp-Source: AGHT+IGqeIuBv9OWXNokteJpQ08DeKnV3oR28EBjTWNiLAcYj7iu6vP4q7amwT6MeNCYNytD88Eu2A==
X-Received: by 2002:a17:903:3b86:b0:295:5945:2930 with SMTP id d9443c01a7336-2a2f2205161mr202892715ad.2.1766656041808;
        Thu, 25 Dec 2025 01:47:21 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp. [125.103.213.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83961sm177814725ad.38.2025.12.25.01.47.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Dec 2025 01:47:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 7/9] riscv: dts: thead: lichee-pi-4a: enable HDMI
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-8-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:47:04 +0800
Message-Id: <EEB07B95-C9D7-4B8B-9FAD-105A0287CC6F@gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-8-zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_014723_260409_F2E5D3FC 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, "Han Gao \(Revy\)" <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> On Dec 25, 2025, at 00:12, Icenowy Zheng <zhengxingda@iscas.ac.cn> wrote:
> 
> Lichee Pi 4A board features a HDMI Type-A connector connected to the
> HDMI TX controller of TH1520 SoC.
> 
> Add a device tree node describing the connector, connect it to the HDMI
> controller, and enable everything on this display pipeline.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v4:
> - Rebased on top of v6.19-rc1.
> 
> No changes in v2, v3.
> 
> .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 25 +++++++++++++++++++
> 1 file changed, 25 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index c58c2085ca92a..7cb7d28683bce 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -29,6 +29,17 @@ chosen {
> stdout-path = "serial0:115200n8";
> };
> 
> + hdmi-connector {
> + compatible = "hdmi-connector";
> + type = "a";
> +
> + port {
> + hdmi_con_in: endpoint {
> + remote-endpoint = <&hdmi_out_con>;
> + };
> + };
> + };
> +
> thermal-zones {
> cpu-thermal {
> polling-delay = <1000>;
> @@ -121,6 +132,20 @@ rx-pins {
> };
> };
> 
> +&dpu {
> + status = "okay";
> +};
> +
> +&hdmi {
> + status = "okay";
> +};
> +
> +&hdmi_out_port {
> + hdmi_out_con: endpoint {
> + remote-endpoint = <&hdmi_con_in>;
> + };
> +};
> +
> &uart0 {
> pinctrl-names = "default";
> pinctrl-0 = <&uart0_pins>;
> -- 
> 2.52.0
> 
Tested-by: Han Gao <gaohan@iscas.ac.cn>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
