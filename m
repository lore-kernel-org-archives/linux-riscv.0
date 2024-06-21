Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259B2C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4EBH+pkqQQ82zEbUxb0G26yeqoADk0E3G3gqQsuR2U=; b=dZHJW8P7h87v7t
	KGV/iafgEQZn7BvK5pXRWcc32dl+wTq6t5/WFr0DbOcF40qUG8kRaAJe4eyOTLI4qma+4PFcAkMy9
	lI3fe07TwenhALxJUWv7rqumqwjGIUiWCkS/9SemwkiT+NQ79y5PGoSnNpuBw6RcckP9HqoqjGj4j
	8lv2ZUV5sIrmDxqazkDpoWMLFfZLHog1v2Ufw+tF5Qwn+eJNb88u4NSvW62ui+95PdzTNsKmLkvW6
	YVyHK2Fkw2P5dxLipzsZSasf3XTwyHMtIc2RJ3BK11NiG7WU8+kJIcg6yWbT8DMU1IA3tydO8o8q5
	OV5K+fuBfAOysXp+B2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdn0-00000009FJk-2hJZ;
	Fri, 21 Jun 2024 12:54:50 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdmx-00000009FIz-2LNz
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 12:54:49 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a6f0e153eddso254119166b.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718974485; x=1719579285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pdAHYvPgJox9jkhPwVxoz1/7COjSpOxiTtk8uybQTs=;
        b=SEEVn1D31psLQXC8/iW+yEsVl0DvVki9CePXq6iGzLur9S2PhRQQGNQgm5x2jpuo2r
         HDRP73fE1Ss4l4Cdz+oewRHyLnL4vhhyzoarkruu6lgls7VUGaZlQcIBLCGJeWgpHJqY
         7Q84j0gRg1igiSq+2b0BkIviI6ZYtlOSc73UgE4lpX68SpyxDmJTapRdE1159OJiD4wn
         eJxs1AEGNEAx8Cr6Son6Y2pjXcdrRhKRhq8ymg2wc1p3nHIxgDrXkaTTEuN6C1UeQJRl
         UYEqchVqo3G9eoZtIl8z6iF32GMt1UZsvxqUDVN88pn5RYOEXCAvO2DjxxfaKD35Jj/a
         olSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718974485; x=1719579285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pdAHYvPgJox9jkhPwVxoz1/7COjSpOxiTtk8uybQTs=;
        b=iyoD+4EmTMpEs8V4bsxoJRXROO9qsFxuM/M4TG502KuZzlJIW20wPyvO0DtT9KA/QX
         VLCyFYztt2n09gofSRsjJPBLVHcCkgYFo+Fzyg9T26ZZF2GhY+gPo/j8lYCykuTfpRU5
         uOdxH7UoF36X74AIorg89zdAFOu/Kekouv7KASBon2nstm4WjRDZFbAcZGt/ec1xQzcy
         Pdx0hHRsJ/uxawMT+UpdUm2mxWCSuQnL7RAFHEKj1ytjChPePfekegUsThprItlM+Pi1
         bmpebm71DLytjIZNudB3KzuJnAfa5IbPGWCf1CNxUrFlZtbB+GXeANb4JjAsqoQpJz49
         V4mg==
X-Gm-Message-State: AOJu0YyHnef9m+Ve47R0KvhLtsKC80XyTIzmoh35FVxZV2yqwjwy7mci
	+JtLrXl5T2GiXtl9qLKm2FkyRTmohzAkewr9vhkfhW5BdYxq/jFFDw6/mjs9YUQ=
X-Google-Smtp-Source: AGHT+IGFcCABfPYqsys42451Qj6cmv21K8Gwfng8gQ+7KFppyVnCcWUkFYP647Twsv0fwN+Pc6fn2g==
X-Received: by 2002:a17:907:a19d:b0:a6e:fe97:b33a with SMTP id a640c23a62f3a-a6fab62f6b5mr470525766b.29.1718974484985;
        Fri, 21 Jun 2024 05:54:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b4c7sm81900066b.86.2024.06.21.05.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 05:54:44 -0700 (PDT)
Date: Fri, 21 Jun 2024 14:54:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v2 0/3] riscv: Per-thread envcfg CSR support
Message-ID: <20240621-368af6395900f29559358915@orel>
References: <20240613171447.3176616-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613171447.3176616-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_055447_618623_EBCEFFC7 
X-CRM114-Status: GOOD (  11.50  )
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

On Thu, Jun 13, 2024 at 10:14:38AM GMT, Samuel Holland wrote:
> This series (or equivalent) is a prerequisite for both user-mode pointer
> masking and CFI support, as those are per-thread features are controlled
> by fields in the envcfg CSR. These patches are based on v1 of the
> pointer masking series[1], with significant input from both Deepak and
> Andrew. By sending this as a separate series, hopefully we can converge
> on a single implementation of this functionality.
> 
> [1]: https://lore.kernel.org/linux-riscv/20240319215915.832127-6-samuel.holland@sifive.com/
> 
> Changes in v2:
>  - Rebase on riscv/linux.git for-next
> 
> Samuel Holland (3):
>   riscv: Enable cbo.zero only when all harts support Zicboz
>   riscv: Add support for per-thread envcfg CSR values
>   riscv: Call riscv_user_isa_enable() only on the boot hart
>

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
