Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995836088B11
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GyejK5Di;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+R0JO26
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JyLsElG7AAkFsYJGKAb1u4ZvR/ATB1Y0CUWkDKNmLK8=; b=GyejK5DiDqkqY1/T9hqn12kgtW
	ZppM9+hlzZ8SeeyO44ZvAlga49/sAss2H4WO742dgT9tQcNpbshDc62ngUz1zLXkDhH5ykM9ahIWL
	TyG8HBkCy9RitC6CV1QQU0pVizH31v78GgzyJ6DpbsyQ8kKUmGl8ACvCIeP4b9KvoHVVmNfnJMPfw
	al8VF5aXqfB8JKmb5QQEy4sC3yiwRiLLno3CpovGW5FjlDOa3CCiuTr8oHiscGFg1OWAhEpQ/7025
	GMt6x/hJMQADFw6N1TBG2OIcOmQhhaToXMi0/f3Gmh+GAbNmvaFQtY4VG42EFZXn1KKxM1Hoddab+
	Isv2BDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt3G-0000000GqGr-1WLZ;
	Mon, 02 Nov 2026 14:30:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt3D-0000000GqEP-2kvn
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:30:21 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso1236709b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 06:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629819; x=1794234619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gts2WqsGwLc0uD/7GkoBlKKwzjNqrANh5XxTu7k3RAs=;
        b=l+R0JO26A5QTQpwHBtwGPNqaqbuWucmtibkfWWulrcX+HMp2QfZxf5S7BVWBmLhT0c
         59v6akdbOpo3O9Vq03cYnHyIYEmnnDvk01dqd2mDYUjkrPbdrYgEgS4LkVVRl0qIn6L9
         6jQJcvZdAdHK2jTYQST+4uqlNzxkzCRlhJ9K7XOCkoO60f4kwUKOruX8A4xQl+JGdbvE
         3AiMvu51GZLbc0FsRaK06G6JuxP/n++PF/YJpMdtVFAeWxma02MA4yvK/Cdii/9Ikwr5
         9Od6wRG/P5Qfd6JRtWKEJHz+srdgX71MTYzhSRNj5bDEtPt8LW5q0Atskn0TnG662hzq
         JZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629819; x=1794234619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gts2WqsGwLc0uD/7GkoBlKKwzjNqrANh5XxTu7k3RAs=;
        b=k19n6RyCuYaaQgYzeFDnnuUCih96jMfoC9BTrUiYyLjgRxmguQ6u0Fu+2Sj0mE15Vt
         CFdxl9+ZIhOTl2gOvi6YCbRnTGhPCmUWypJ1sRPrsShmnwevPEhUGAnZh6QX8Pei7JiS
         np93l0qc03KgY4GaAAiIOeHLQ+XFXmxkA0QiQc26B2HrSZFMDMQfne2z0mDDcDqhXQC5
         zt1G2VOrkZUiWutPfpWPcGdiLIpvZp4v+NV1FaakAmX3p7hkRG8gD0y/yDxniL9EgisF
         yapPeGiGudu/74G6NeGOf4ij8GbSI99Vw+2r8Lb0Xu7P+h+Q26tnhj/4JWk3wjHisDhP
         //lg==
X-Forwarded-Encrypted: i=1; AKwUvBxbi4OYQxPJkSm53sUBKO/p1yii4YIG0W/ueztIUTN8HOBKu/8shOmocOSQ0zE0ptyJH2HbK5b64fSeHQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZUTXQqA8cUZvkDEsMEZCaJzLnFR+bgTYjAWUxhxBiYcdOn/fg
	j6ZOJ3Ct1ppP9uVgKiY9m9C9ue8Kpk5boxvk7xA6k78MTozZIYEAMMAs
X-Gm-Gg: AYBFou0eoiTKFMeXcwnskPzrMCHqAYnbRZj+u2EVlegoXLnXWQhEk9REUi+GOw79/+B
	8TpUoejmVBzVVxAClfy6ZW7HuQuVMPXYB4QmPeGR4OnhZQIwhqcqSmYnZw5Pe5zf9vzzxocPZ97
	xMxIYpDXX8a+qbQ5kFd6tVIeBE1x8HUOS4bpyhHOGW1QDzlyw4EGdzu2t6ntmKE/3vTbngUFQnj
	ufylOvdjYrUMPvOs/v2r/5VOnTWIu3Xgb5NoqkeZ2QMQ9HkP/qjUUoefsKG0NBFNQojzZkAXOoi
	B3Mj/jlL+/bkcRocVmdNrqxknbaJeVkSd01faN13mZx1nubf+1S3KRa/x8D8wc+8JbpQcJrc+5I
	GYfOMUlLfRQV+Vg8o8tN6/O9rvMBIeMQOQD4V88cJEl302bBYK5ci3ar5I3yzttoMcxGaYZaE+O
	M//Gv3PNeaoNt9krW6uKjOJoFXblkus5CkxsKPuT5VZ25nWM+wc1iR9GwUm3qQpe4UzWDMsGWYl
	iNVWUXE/b4qiOy8J1NFtIXsThLNk8hEEeDKSvhiXfMJiLFTyUEBQkM5/U7GKkqv39ev6p2HmkhL
	4WR6tJwDA+VUuqsyAr7M5jZRV2vziD7+R1g2zsbWPPORxXFHwyOzJWZV/g==
X-Received: by 2002:a05:6a00:3908:b0:898:22b4:c8c8 with SMTP id d2e1a72fcca58-8a9ba9f783dmr7803008b3a.2.1793629818400;
        Mon, 02 Nov 2026 06:30:18 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fcb8dsm2219095b3a.1.2026.11.02.06.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:30:17 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Radu Rendec <radu@rendec.net>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 13/18] riscv: dts: zhihe: add A210 core support
Date: Mon,  2 Nov 2026 22:30:09 +0800
Message-ID: <20261102143010.3785824-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-radiation-ivory-c8f9f9c66b7f@spud>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_063019_704951_E11F0FDE 
X-CRM114-Status: GOOD (  17.16  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 19:48:36 +0100 Conor Dooley <conor@kernel.org> wrote:

> On Thu, Oct 22, 2026 at 03:53:33AM +0800, Han Gao via B4 Relay wrote:
> > +	soc {
> > +		compatible = "simple-bus";
> > +		ranges;
> > +		#address-cells = <2>;
> > +		dma-noncoherent;
> > +		#size-cells = <2>;
> > +
> > +		clk: clock-controller@260000 {
> > +			compatible = "zhihe,a210-clk";
> > +			reg = <0x0 0x00260000 0x0 0x1000>,
> > +			      <0x0 0x00250000 0x0 0x1000>,
> > +			      <0x0 0x10141600 0x0 0x100>,
> > +			      <0x0 0x10141400 0x0 0x100>,
> > +			      <0x0 0x04810000 0x0 0x1000>,
> > +			      <0x0 0x05810000 0x0 0x1000>,
> > +			      <0x0 0x04900000 0x0 0x1000>,
> > +			      <0x0 0x20250000 0x0 0x1000>,
> > +			      <0x0 0x10140000 0x0 0xe00>;
> 
> This looks very much like an incorrect modelling of the device.
> Most of these should be individual devices, and those labeled "sysreg"
> probably should be syscons as they likely contain multiple functions,
> not just clocks?
> 
> > +			reg-names = "pll-wrap", "top-crg", "cpu-ss-clk-sysreg",
> > +				    "cpu-ss-cpu-pll", "ddr0-sysreg",
> > +				    "ddr1-sysreg", "slc-dual-sysreg",
> > +				    "top-crg-t", "cpu-ss-ccu";
> > +			#clock-cells = <1>;
> > +			clocks = <&osc_32k>, <&osc_24m>, <&rc_24m>;
> > +			clock-names = "osc-32k", "osc-24m", "rc-24m";
> > +		};
> > +
> > +		clk_peri: clock-controller@300200 {
> > +			compatible = "zhihe,a210-peri-clk";
> > +			reg = <0x0 0x00300200 0x0 0x4>,
> > +			      <0x0 0x02010200 0x0 0x8>,
> > +			      <0x0 0x08400200 0x0 0x8>,
> > +			      <0x0 0x00540200 0x0 0x4>,
> > +			      <0x0 0x27420200 0x0 0x200>;
> 
> Same here, particularly things that are only a single word wide...
> 
> > +			reg-names = "peri0-sysreg", "peri1-sysreg",
> > +				    "peri2-sysreg", "peri3-sysreg", "tee-crg";
> > +			#clock-cells = <1>;
> > +		};
> 
> > +		clk_aon: clock-controller@30844000 {
> > +			compatible = "zhihe,a210-aon-clk";
> > +			reg = <0 0x30844000 0 0x1c>;
> 
> 0x1c is also suspiciously narrow, but believable. Is there a register
> map for this device available somewhere (ideally in english, but I
> suppose machine translation will do a sufficient job) so that I can try
> to understand how this device should be modelled?

Thanks. There is no public register map, unfortunately. In the next
version the E902 firmware will take over these blocks, and Linux will
get clocks and resets through SCMI instead, so they will no longer be
described in the DT.

> 
> Thanks,
> Conor.
> 
> > +			#clock-cells = <1>;
> > +			clocks = <&aon_110m>, <&osc_24m>, <&aon_rc>, <&osc_32k>;
> > +			clock-names = "high", "osc", "rc", "rtc";
> > +		};
> 

Sent using hkml (https://github.com/sjp38/hackermail)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
