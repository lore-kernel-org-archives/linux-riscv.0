Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8082C3ABD7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyjUsb0HQA/pGQVacB5ggOtk3YDKk4TMDEAc5k39O5w=; b=VV0XOnpGhftvhD
	hruSJ5mqLqetRM5chzdSH/gNs/uBT+XaJHVrqnVYuh83sYYzevmr/11iIl5u7dZJnz3277CY9A/d9
	KFHaHyJ1jWliRO+CXNBn5kMPPVpentvgeJ/ij51mJMh94sftx14iFORpjgpFi9dJkOCzCd3A8X3Yq
	e6V+dCNuTBzjuB42safJmoyy2v18FJciPxBf1PhL59xdd9iaIq1/7pZi4pgBGuvFDXxGZvguKvOFF
	lHyI5vizx61nDRm8l7NSYFoBGDp8axfpGDSkpIK9XGohOn1YMJ+BSqvQwqdG6eXorsvQumL1YZ/bu
	orLnlBDhZGdiJtVcc+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqkB-0000000Cd2j-3NyF;
	Tue, 13 May 2025 14:36:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqh7-0000000Cccv-42FX
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 14:33:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso39910825e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146800; x=1747751600; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6C+eOPgBkYyfSbaSp3zhH361dNsffIyxJdkkZYVPmTA=;
        b=Spcm/CueVechX2MuRf4kpf4SjauF+j+Fj88i0/G8OX/1vODeEaHrmHQE+N7UcZeiFt
         6QTij4PRqPVnssA++06/nY5HXM7ATt0SOuBJgfArexoAhWGYt0dQtXy7O4DAIGgv5Rt7
         /cKHtpnZmMWUuxNx2oOxoE2OBXBKTqz+8liTAcfke6yEFQBfJyCv43gov1y69Yh6qzXZ
         1mVg5iPsDfTD3z5FXgGsRQ5K9N+e71XF/KFkSTV1MxUKMlFiylqvQ/mLdtzPHX/3Z3mQ
         CIUo5jScnOWJcGx+NRyJwkT+TV6/FiQ/GpqyLs39w3kzDycyKZ0KIoobOeQo28F/a85M
         tVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146800; x=1747751600;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6C+eOPgBkYyfSbaSp3zhH361dNsffIyxJdkkZYVPmTA=;
        b=SbNvhxfgbcpCseVpmTDlkxGKTQ006k+7Yzq1LjncxRpkYZgab7kUkfZOycYe7IHYPP
         WB5dpDb9fqrDPeAnbkQS5l8akNRNX5vwgoEYidaTRvHHk4+HKPypr6CqbMCwwjgPH3+h
         R7hhqqC4T31lOKXRVlI3oVxDqTE970HPyIJFBSunNrxZ5IQacYxilx3A7rNhAxFuxi2/
         w8n7cMbQAgCqaAdHAuUC8maQnnt5PR5oRa0NdYID4gGPihO7AyJGoM8iRXCTsXqbeuNu
         CyHPC9mzBa534NhoHCsItNvpajq/jCwOA0G96M7svoUwID4Byjh74h4W7jNvnTXQ0oNC
         regw==
X-Forwarded-Encrypted: i=1; AJvYcCXxwQ7TuBkIImuBz1OvZmfx+4jFBnarvv7cA7wQ5cF/MmY4Pag25gUwlFjNqhtalUCAXhllfbTBYeUNKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5v2MmO90hFQ16beRcVcKK6UqxpmezmYd3toSSRKO0ES8O7XPo
	kT1LYm5oWdfHlrODYQjp+wDoOPkd6ThkqSKzJpN0tdB0SMUNX2KIelzbHGl5LgsJiF+B+u8DRak
	kMDtaUQ==
X-Gm-Gg: ASbGnct6CdoQBWqJtakpScU/+fb5KXoBmZg62ghlc7FGMm/2/aduaEDdgv2EmiK9OzP
	OsFjucfwz1KAWFT/yz+04EfMM6xGsZDq96Bf5VpJQoTz0m+kB7x0cQO5y2LWcj2lu+JvlbdtFrJ
	poABuYpT4NbhPdhiJDimLXwmjmM03sAs2Mt5fKbflsXLwxK2XcqydAMQ22o9GKLUoqBJ6hAaOyZ
	CqQ3ovkG0vseqdV3e1wDHx3UAHh9vmlLI9Bayqw82pk5D3K/1+rV8oGSP71bvHGq+0FrAkCW964
	wh7YINkT0LILRspOzMtZ7Nxbnr+7eX1P6mljL5HLdB1NqNqlcUZu5w6Dna++y3Ko0H+Vl/9O26O
	x8z1I01EDbk81+W04L5DcT6b3
X-Google-Smtp-Source: AGHT+IEBNTH4zw64AEMKKTiN2s5UEu33251ThUx0I1Ms2D2DvDbTNPIeVXC3gTvYmyig2JEqJ5+Vcw==
X-Received: by 2002:a5d:650b:0:b0:3a1:f655:c5b2 with SMTP id ffacd0b85a97d-3a1f655c5femr12440694f8f.39.1747146789207;
        Tue, 13 May 2025 07:33:09 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm16357348f8f.22.2025.05.13.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:33:08 -0700 (PDT)
Date: Tue, 13 May 2025 16:33:06 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT
 timer
Message-ID: <aCNYItP6SWImMvFv@mai.linaro.org>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_073322_003454_D54269CB 
X-CRM114-Status: UNSURE (   8.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMTQsIDIwMjUgYXQgMDY6MzQ6NTZBTSArMDgwMCwgSW5vY2hpIEFtYW90byB3
cm90ZToKPiBMaWtlIFNHMjA0MiwgU0cyMDQ0IGltcGxlbWVudHMgYW4gZW5oYW5jZWQgQUNMSU5U
LCBzbyBhZGQgbmVjZXNzYXJ5Cj4gY29tcGF0aWJsZSBzdHJpbmcgZm9yIFNHMjA0NCBTb0MuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiBB
Y2tlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KCkFwcGxp
ZWQgcGF0Y2ggMiwgdGhhbmtzIQoKLS0gCgogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFy
bzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0
dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5h
cm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
