Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61296C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WMwmolMX2ewCeotpHoRpDuKzStcRKKSSNXq8JlvoO0=; b=k3WL4eWyzvmNGC
	HedhKOTw+tadqni9sCwJTzbLKaZ6At7HrS03N3mLt0wonygF7UWs6H68llfB2K7XuvYdDB67uzZ3D
	uR8eNeZn9cseGhhWofKRqyRH8sxz7xJ0MdOzWcwinAIQYxPbYUfsbfTOLKtzM+V+vP8OI5jpGWoBl
	SmkRUO9uzaQ4R1EFN2P9w6kNpAcb+apBIqXQJTMIM1fmG7XnLtMu5zRaTOB/5YjY/NmW8/rX1tCPH
	jusmTMOdouLsLa90NWf8ZEyuXEx8Yf+sS+QB3icnOGqjpJYzuQEGSrswr4iHoJbNjLEO7eYAuJv1p
	Hl6SlR0dFSI0ws/rzjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHud-00000009hyv-2qbK;
	Mon, 18 Mar 2024 18:40:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHuZ-00000009hxV-2y9D
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 18:40:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1dee27acf7aso29779995ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 11:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1710787237; x=1711392037; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPJT1cBm0JZhHbRAeyC7k94UmgVH4lXjFoSAOzz9Bn0=;
        b=gNVVmSBTTAcOzuoLJjO8XLOf0atn4X0N/hH4UYEF2lcOiZTzHjUFc8x45lq+nNIYkO
         BF4wOn8gNfLJxY8J9AVJQnfo2DnK0Kp0a8xWGosV5hH/s83QWcDcee2QemejfAsDD93F
         fTHLzGDelp8WIRnpI0wV50SvHy/B/upnNqx+F3rK0ZMGTcLRVoJhU6DvtqBij+trGTWN
         tZHdIh9TVZoGtWlM2oxjEy1pLz5hjLPWsF3GG8xIrCTvj1jExxug2GHua/T+3AUOL3Ki
         QMFFdrBEGjqPKBkvlMwuK7f44byjC0gSTV6oVFGPDk2MHz9dpxJWcG/nvzb3WVzis5Fd
         Mveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710787237; x=1711392037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPJT1cBm0JZhHbRAeyC7k94UmgVH4lXjFoSAOzz9Bn0=;
        b=UohDRwEP7U9uopCZyiwi/r9pbFcMIpjqs4vDo9Z3fUkSNIh0u4tZ7PyT75tHc/Km26
         y4g+NJG4iaZOqLTSwu7zxJ1p2LUvPoR9eXNqF9yIDfQDzrOXfu1B9KKiWRjpxOyxBLKx
         cUsL/IOzncXIJpgINoprY/8WnVGk716PlS+fZ5dQ1+zGnmi3JwFBHhNJQpC9R9ckGns2
         L1WqowgVmNCZb2x9cssg5j5qrM/Yzf0z8XCImLZnKU6PmX0n9TlGKWOESjYWai/8pX3d
         PnX6GvrYg0CFMZpIcL3I4Z84AKmKIsfhS9rC3xvpqftpM/bCqeYhfFEHO4XJj/SNq4vh
         cSbQ==
X-Gm-Message-State: AOJu0YyPt+Nx2JVNGsPLwJivZY0DmcHXCtO6z4x5ttdaJkpc5IEe6UqJ
	yPdizxrukiC2ow8gksLIHYIkZ0y54fyeG4DxhohowhPqtNgGl/dtCYdt0aS+kKs=
X-Google-Smtp-Source: AGHT+IERZprP8bJw5Kg2m3rUqK4BSa2GGG3UrN27m7sqm1+N3azIFVcxsfEMVD/M+9yg6cN0tL/g/g==
X-Received: by 2002:a17:902:e744:b0:1e0:ae6:3a6 with SMTP id p4-20020a170902e74400b001e00ae603a6mr8131789plf.20.1710787237315;
        Mon, 18 Mar 2024 11:40:37 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:a790:ca87:56ba:58b7:a676])
        by smtp.gmail.com with ESMTPSA id ku12-20020a170903288c00b001dd3bc79142sm9609313plb.264.2024.03.18.11.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:40:36 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:40:34 -0700
From: Drew Fustini <drew@pdp7.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Message-ID: <ZfiKooxO88h1nj35@x1>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240208034414.22579-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_114039_963799_05D42108 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, Feb 08, 2024 at 09:14:11AM +0530, Sunil V L wrote:
> This series enables the support for "Collaborative Processor Performance
> Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> encoding of CPPC registers as defined in RISC-V FFH spec [2].
> 
> CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> enable this, is available at [2].
> 
> [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf
> 
> The series is based on the LPI support series.
> Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
> (https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)

Should the https://github.com/vlsunil/qemu/tree/lpi_exp branch also be
used for this CPPC series too?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
