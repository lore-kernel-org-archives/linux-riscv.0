Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D872C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpTBhgCr0ZxaygBul3eWzaV0X1CXk+jZLqf4slvIJYw=; b=m8yAytIhFmsGNU
	y/T8vnIN4WK8xJz2JOu3osNP8SdpWSl01msJzkGEGpKc8YIctAdhirFdGzZfwOGt2L1cIDGNRqX5o
	ZRQgeQDPJ5tFjk9xbCsHgWW4jHg3DNkfqiYpF6mrvIXqhNOnJomsGwJCa0jTftHruzivUNfLQvGyD
	xqwjbjruNRs1ITW5yWfvjg/Exuvm4Ph/UkBk+sxKzndUIE5jd85mKRGWbUhU0u0oI6/Xdn3mxF6BR
	7izVdgi/jOiJ4P8e4Ebwl0F5JiXuH8ydqr2KOB3Au+IgbeoogMXyaCRNwgBgaUPgUzlsyR7YwsJkC
	RNI7Sk9StZjSLK+YplMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtjL-00000009VCo-30x9;
	Tue, 13 Feb 2024 14:25:51 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtjI-00000009VAi-3nHR
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:25:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so602631366b.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707834347; x=1708439147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PyO3k1PUHkf0DTFKDVTvjkF1slnGeiMvgKzqY1R1vZo=;
        b=pNPh0/YpbpTn/mFeObnESU0ViGSrJXuX9jm8Yz8RrAUYaRdvBK1uzQMaucqFKHUcNg
         Hv61rV48yvevgA2bWnkJdFXgikicxuN8cB8SPWpv17lPSx9YzusVGs0mp2IvmEgiDiHa
         yRqK85mQFuzuKX8jTDEifaaYT0e9u5Kqh5wg+as3MTjopwKU9hAGT/81Gw3nAPKgVhqs
         mT0J/y8X68OSdKvkZIqlhBW00A2imTeu7sbrW31KfsGdxfrFZUyIIHAL5k1n2uUrQe3P
         qiQZ+W7cloRr9ne7Wl7eMNfKh7X3c6PtpT9s7DO0JM2fm5D1pgTt45Uc9YmtEVQvo9+Y
         gvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834347; x=1708439147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyO3k1PUHkf0DTFKDVTvjkF1slnGeiMvgKzqY1R1vZo=;
        b=A5eNSnvHzO5B3DBw2mCtcC1QXkthrsl6B00uqrDPQy/vtxfe4KxB6VxYpaUfIivhbX
         mmBfzm6aBP79+vZYDhIX+k5ACzlaCGhhB4F+mXgIoxqJClbSt0Uh23p21QV4heYoaD9r
         9hfyFNDsOP45rrFyoUpkBHfmk0y72IabC3FGG07Tq4K2I3p32TrkyZ/CdHiD3aFy1tEv
         /7eGb2Sl377mgzX+MeGjutxLehELS0u5iQeSRNLhh9l0LBwQMpKMbZXLlDV3yZ06xjAE
         SNI7NFdfKzUbSzdb+dSSd1vjCv2MR89v0taqPLNkv4ziQJRiRUrulmRAFbD7nNdcS3/3
         7iGw==
X-Forwarded-Encrypted: i=1; AJvYcCURWOFB4vQFESzFfXIeU96rIg2sexcFHcM3T+17BThGYs7Zg92dbhFXlYdFboXj0SytkDam8EG8tS78QolTGVoSXhIWv1ZyDHbNXViAsbY2
X-Gm-Message-State: AOJu0Yxgb0h/az0tkXyNf8kxvxB1VToaT4ZfrtuBNueN76Q0vK157r45
	qaOS6fgmxIE9P/1Z+QsvTFUaYDVWwCNg75tnGDn0cQ8rGE1z/LQVXh1vwkQc9F4=
X-Google-Smtp-Source: AGHT+IEtH690NDhq0BZA5oR5pICFr2zi1bg0SnzYVaGkCrYuaggXr7BA3cC/Af5MJwiwmwG1j0Js6g==
X-Received: by 2002:a17:906:370e:b0:a38:215c:89b with SMTP id d14-20020a170906370e00b00a38215c089bmr7288005ejc.73.1707834346621;
        Tue, 13 Feb 2024 06:25:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlYGAXYBwiHE3BQznOgrFzzKQBeyezWk23o9Bc6z2jRt8i3C7MyRV10Yfdg/ke27CwsgZLWRsD/kG73ElRLMI8DAo+x4rXAaBP7jWAkiP+6svR0TzGqcSsd3AuB2IR1ysHKFSgSaYnXiswAgjj07lMzFm9n352edoaLtPTu5m5IGGE
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y21-20020a170906559500b00a34d0a865ecsm1314906ejp.163.2024.02.13.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:25:46 -0800 (PST)
Date: Tue, 13 Feb 2024 15:25:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Stefan O'Rear <sorear@fastmail.com>
Subject: Re: [PATCH -fixes v2 2/4] dt-bindings: riscv: Add ratified
 privileged ISA versions
Message-ID: <20240213-88c9d65fd2b6465fc4793f56@orel>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213033744.4069020-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_062549_012795_9CAF43A1 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, Feb 12, 2024 at 07:37:33PM -0800, Samuel Holland wrote:
> The baseline for the RISC-V privileged ISA is version 1.10. Using
> features from newer versions of the privileged ISA requires the
> supported version to be reported by platform firmware, either in the ISA
> string (where the binding already accepts version numbers) or in the
> riscv,isa-extensions property. So far two newer versions are ratified.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v2:
>  - New patch for v2
> 
>  .../devicetree/bindings/riscv/extensions.yaml | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 63d81dc895e5..7faf22df01af 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -121,6 +121,16 @@ properties:
>              version of the privileged ISA specification.
>  
>          # multi-letter extensions, sorted alphanumerically
> +        - const: sm1p11
> +          description:
> +            The standard Machine ISA v1.11, as ratified in the 20190608
> +            version of the privileged ISA specification.
> +
> +        - const: sm1p12
> +          description:
> +            The standard Machine ISA v1.12, as ratified in the 20211203
> +            version of the privileged ISA specification.
> +
>          - const: smaia
>            description: |
>              The standard Smaia supervisor-level extension for the advanced
> @@ -134,6 +144,16 @@ properties:
>              added by other RISC-V extensions in H/S/VS/U/VU modes and as
>              ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
>  
> +        - const: ss1p11
> +          description:
> +            The standard Supervisor ISA v1.11, as ratified in the 20190608
> +            version of the privileged ISA specification.
> +
> +        - const: ss1p12
> +          description:
> +            The standard Supervisor ISA v1.12, as ratified in the 20211203
> +            version of the privileged ISA specification.
> +
>          - const: ssaia
>            description: |
>              The standard Ssaia supervisor-level extension for the advanced
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Note, QEMU doesn't add these extensions to the ISA string yet, but I think
it should start, particularly the profile CPU types which should ensure
all the profile's mandatory extensions are added to the ISA string in
order to avoid any confusion.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
