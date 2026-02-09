Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B0BE81BCD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 14:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01/+4V7px3XsQc3yOt3SFsEj6qTGIO9TqT4XFehBAlI=; b=aC5RBw/fWbB/9f
	SZLKob3F3oyYBUFwJsWtLBjsWDXA6dpC6VQxdPYB4h8Egu1kjpCCF8tVTooeNT9soyZIwSg+tvAzL
	2ENpy+ycIp0OWk3AOTFHmV6Ql8v6rBkyehx0EZy4ecrxMPpShHKqsCqGQbXcIbXUTlC9acVVyiWwn
	O136LSQkEUXrVaFChLoNxpB9ywMxS89VH/fT0f6lfWbQpDEZek4xuu9S+SaUUWynMys3GPoRir1NI
	pdetKfhP6ke/q/TdbgSUmB7b4Az55XMJxn5K/eE9hSfMLYjdfwKqngOntM7yazMQEwyKyoPOUrZuD
	8T8U+r1sCgNtyzgXV10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpS4Z-0000000FUiT-3W21;
	Mon, 09 Feb 2026 14:17:07 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpS4W-0000000FUht-2CZa
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 14:17:05 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-354c67da885so1662682a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Feb 2026 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770646623; x=1771251423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+vhAUWptZLQYZPG8ROuiqprar1JCQQK4npIFBepuBs=;
        b=Do8bH1d+xsMldFM+YcS3uXjrXLF+9+2pA97VMIu5v/T4OEY4eMP/mLUlC0Q6nABgJe
         1cvWl95ZaUWOCsEH8bcYxfwDGjSnoNKTZUp8xvLZtwhjISofQXtOGf6QCGjeTj4Zc1e8
         MJo4CDOVN3vba5pnsH6lTUNX1oQGCMkUY6eFRLD6iYhuo6fzjGGVHPrJxnr7OF4esE/b
         k4IUW8slpVUepj4G5PReU8NhccjKFjmgR+3yMxtMP0X38iDPhaZDmfDH0WRv04Twu2Ec
         sH+U9/59zjTMOQ3vJwG0DtEoDfPoUo+LQ+MgfzlZeFRxTy8T8Kgonv1XECItqS3LsbO/
         k+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770646623; x=1771251423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+vhAUWptZLQYZPG8ROuiqprar1JCQQK4npIFBepuBs=;
        b=KgsECS1MX9WNiYlVVVbgLSBDMTUPwbSBedO819Qiq1HKRP9FhxI2vRCqnC73TT8TMv
         b5E3Idv/0DxQ8l3BgKd4Uh7e4Frw0OpxB7J2SHe9PxxEIC+SEi529RfhPR274hZYEpH6
         xwJCpPLblELTe4Ex7AvCIlLrqu5aRqHKlsaAu47+/Cm0QVyUu+KtDX1QNOIh3UsGRHf/
         8PEqDVUqOwaRqBXXBj6fq3mH8XUh+ATOTVRQ/lt9r3Jr1+7gU1Cndehc/9tcYtci7MZG
         I/qu7Rck6/MC7HE5RPoD6SR1K1mn8JNHrXYfF316x5rd5imwqCHQjvihfeq/w59iWpHj
         m/fg==
X-Forwarded-Encrypted: i=1; AJvYcCXnTSgtbN7QIqQol1boACXFwOMH3K7fnAyymh3VizYR0UHsz1rpfWjLH4N6VJiMmasB4iVDXsLAsN5Wcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeKxTiMaX7ajtiOO+04DE41G1kCtv5qExbBvFa5Ch7lsRZDXqA
	TEUj9+5MihTUwXYgJ78xV2tJShHM6XRaUBsnEwtmW+mlBWj9Rr65sg/q
X-Gm-Gg: AZuq6aKPCoguSbboa2sa/TRrKm/8YmiTm8l9nzLx637RI6rCLE5Ge0hECxtorazGApc
	vh1KmgvfMWSKqUNYXqa+MpmppM+WzJYSw6173tSBDfRlswERa/1WuJUcMQKHPcP0QLtBZmWaX8g
	eHvI6bOk3jEK9jhE4GoCKwCvIGPza9ZqXkdr7fH1VabC2hbHghwkAOu7Bokz5RY5RdodsnnrRsd
	MuB4YXlKpTKeU5HR5J/NMUH0Dy0b1SLU8X4D7l6DNf9fCgm1OM/wjyQdNlxbTlbmIeBEudTcW+n
	z6+8TdX6xT7lniEFKelKv1SSYey7rz0Uc9VkyAKQcdHsE0Nt16wIaNIo3IAuy6vsECpdUhcDkkR
	7F+nGwuq0pfWpHHc7bpU4DuD+dPOtFueH1VzqR0fU21y2cOy40DSwukjtwYpKobzdHOq26QwNWG
	J5jF1CVo2h/OOabKA7MNl2mVJ3mjyKy4xlLA==
X-Received: by 2002:a17:90a:d010:b0:356:2eac:b650 with SMTP id 98e67ed59e1d1-3562eacbbccmr4038749a91.3.1770646623298;
        Mon, 09 Feb 2026 06:17:03 -0800 (PST)
Received: from localhost.localdomain ([106.38.154.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c5955a7sm14852844a91.17.2026.02.09.06.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:17:02 -0800 (PST)
From: Gong Shuai <gsh517025@gmail.com>
X-Google-Original-From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: fustini@kernel.org
Subject: Re: [PATCH RFC v2 08/17] RISC-V: QoS: add resctrl interface for CBQRI controllers
Date: Mon,  9 Feb 2026 22:16:49 +0800
Message-ID: <20260209141649.330184-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_061704_567034_5FB7C571 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: x86@kernel.org, atish.patra@linux.dev, aricciardi@baylibre.com, atishp@rivosinc.com, cp0613@linux.alibaba.com, cuiyunhui@bytedance.com, gong.shuai@sanechips.com.cn, zhiwei_liu@linux.alibaba.com, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, vasu@rivosinc.com, robh@kernel.org, alex@ghiti.fr, rafael@kernel.org, acpica-devel@lists.linux.dev, robert.moore@intel.com, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, ben.horgan@arm.com, palmer@dabbelt.com, rkrcmar@ventanamicro.com, Dave.Martin@arm.com, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, mindal@semihalf.com, babu.moger@amd.com, liwei1518@gmail.com, npitre@baylibre.com, paul.walmsley@sifive.com, ved@rivosinc.com, reinette.chatre@intel.com, pjw@kernel.org, tony.luck@intel.com, peternewman@google.com, linux-kernel@vger.kernel.org, fenghua.yu@intel.com, samuel.holland@sifive.com, james.morse@arm.com, krzk+dt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, Drew

> Add interface for CBQRI controller drivers to make use of the resctrl
> filesystem.
> 
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
>
> ...
>
> +u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
> +			    u32 closid, enum resctrl_conf_type type)
> +{
> +	struct cbqri_resctrl_dom *hw_dom;
> +	struct cbqri_controller *ctrl;
> +	int reg_offset;
> +	u32 percent;
> +	u32 rbwb;
> +	u64 reg;
> +	int err;
> +
> +	hw_dom = container_of(d, struct cbqri_resctrl_dom, resctrl_ctrl_dom);
> +
> +	ctrl = hw_dom->hw_ctrl;
> +
> +	if (!r->alloc_capable)
> +		return resctrl_get_default_ctrl(r);
> +
> +	switch (r->rid) {
> +	case RDT_RESOURCE_L2:
> +	case RDT_RESOURCE_L3:
> +		/* Clear cc_block_mask before read limit operation */
> +		cbqri_set_cbm(ctrl, 0);
> +
> +		/* Capacity read limit operation for RCID (closid) */
> +		err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, type, closid);

It looks like the parameter order might be incorrect. I believe it
should be:
cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, closid, type);

> +		if (err < 0) {
> +			pr_err("%s(): operation failed: err = %d", __func__, err);
> +			return resctrl_get_default_ctrl(r);
> +		}
> ...

Sorry for the resend, my company email had some formatting issues,
so I'm sending this from my personal address.

Hope it doesn't cause any trouble!

Thanks,
Shuai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
