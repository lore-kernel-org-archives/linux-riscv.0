Return-Path: <SRS0=zhGB=7D=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF35C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 May 2020 22:06:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E2162078B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 May 2020 22:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D0Pa+cJM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="bxpp78PW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E2162078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OhAMbFkeBYkh1YD4II233lD+yGJ3K0G9Oci8yZ/ZBA0=; b=D0Pa+cJMi8DpiD
	XvfO9f8lmpZx/pBUVdPi+o/E3T8++F9Xyh8WT4p4EipS+opbqko0YbV5G+y24QnZ5yjvi+jphlhnK
	qhgNaoDViVvWjwKxGKcah1ry1RbKULCRczAuEGx8tH93DF/0EBlMWy8BObj9DI0QOOP/t0yzysgGs
	Sz+8cFgg5TfQWbRmkmmn+nqcRdXd1T7obXtoglS90OZBMVYfgdL116gg2eNX0RyKi1+chaa1Sn34K
	6ocTZWp3yhKEfyPXqAEH9DMk00MtpuTGCfC4K243q2WhQp6GZoHB8RbIYCyYqLjtMw+unMAC0EjE8
	9fULlwAIIWDO2WicEkFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbtKV-0007Na-Na; Thu, 21 May 2020 22:06:19 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbtKS-0007MW-KK
 for linux-riscv@lists.infradead.org; Thu, 21 May 2020 22:06:18 +0000
Received: by mail-pj1-x1044.google.com with SMTP id ci21so3976213pjb.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 May 2020 15:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OhAMbFkeBYkh1YD4II233lD+yGJ3K0G9Oci8yZ/ZBA0=;
 b=bxpp78PWsbxwSFm6fyiRLWCl3wvWThr8h5f6oLQhDzrgcsFD/DEKoS7oK7x73h0A/T
 jkNibCb1jeIWkzy3aP6PUgSiyo949bJH8y5SprysWFZIm0TDKU7RGvQBn33uwRkJh/DS
 w/vFLbaIY20+q/biEmbBhYNgWajV+Fk2/gAYNIFmDHFsd5p59Wx5H484OmlaYPbjPym3
 sU2LetexScCIAqh6kkrHgoU1XctXZ50V31VsXmQRuTxWZbfSfJCOz5ubNXYZGK0wDSCE
 czWKmK0JYYzhmO0Xxs3ezU17nwQHdInAS2MJUDhzjKmXUL2kqju4Gh/ZtM1k6KWtl6KL
 6Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OhAMbFkeBYkh1YD4II233lD+yGJ3K0G9Oci8yZ/ZBA0=;
 b=Hs/MAj0cjfUNBpKdR3uj/J9i3FmKn0AxloczktQV3FumyjUqrsoLfZYkkyEiUwTVq0
 yXgXOOcPALkztwZJ7nu4PFMR7uzzF2NDtDzl3dy5S1TyfKa6SAFdVZzx7ZPB/rAsD8jq
 uMEYjJAvXox5fq0Zhexj0iwYUFrCmWtF88LVCBAI02dHJFzGO3/NpL38BTZ+BZSppPHF
 HDQWQSRChHWfcEgiwM762SBQ8m3VfiBCZiP8KHAYJXJOBGc0NVMltdy4nZqUNrIRsHD8
 HKPaIJdR3sy4yFlMjS2GvOUfIlkrZoFB2un9SFX+7xuOG4AlLbPyr/jXM87MRR+lPSUC
 TKMg==
X-Gm-Message-State: AOAM533GRngy5Lko84zXhEzKwUZu+RELokN4TzpbbHb4lsoZ92K0B0R0
 uoG6WC1ftfdBa5Px44NPjV1X4uev1ecH7Q==
X-Google-Smtp-Source: ABdhPJwN1m6K9hPFs82tA6eWxV2r1TLL4YbjntnvjsyVqmjBlB6uawDniHorXAEwxlNqOq1bJjqFxA==
X-Received: by 2002:a17:90b:23d4:: with SMTP id
 md20mr776706pjb.164.1590098775476; 
 Thu, 21 May 2020 15:06:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d4sm2888946pjo.43.2020.05.21.15.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 15:06:14 -0700 (PDT)
Date: Thu, 21 May 2020 15:06:14 -0700 (PDT)
X-Google-Original-Date: Thu, 21 May 2020 14:36:15 PDT (-0700)
Subject: Re: [PATCH v2 1/3] irqchip/sifive-plic: Set default irq affinity in
 plic_irqdomain_map()
In-Reply-To: <20200518091441.94843-2-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-724b2ebd-3b41-4b3e-8685-26860402e663@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_150616_727263_2D7EDEC2 
X-CRM114-Status: GOOD (  15.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: jason@lakedaemon.net, Marc Zyngier <maz@kernel.org>, anup@brainfault.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 May 2020 02:14:39 PDT (-0700), Anup Patel wrote:
> For multiple PLIC instances, each PLIC can only target a subset of
> CPUs which is represented by "lmask" in the "struct plic_priv".
>
> Currently, the default irq affinity for each PLIC interrupt is all
> online CPUs which is illegal value for default irq affinity when we
> have multiple PLIC instances. To fix this, we now set "lmask" as the
> default irq affinity in for each interrupt in plic_irqdomain_map().
>
> Fixes: f1ad1133b18f ("irqchip/sifive-plic: Add support for multiple PLICs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 822e074c0600..9f7f8ce88c00 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -176,9 +176,12 @@ static struct irq_chip plic_chip = {
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  			      irq_hw_number_t hwirq)
>  {
> +	struct plic_priv *priv = d->host_data;
> +
>  	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
>  			    handle_fasteoi_irq, NULL, NULL);

If you're going to re-spin this, d->host_data could be priv here.

>  	irq_set_noprobe(irq);
> +	irq_set_affinity(irq, &priv->lmask);
>  	return 0;
>  }

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

