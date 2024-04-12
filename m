Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085C8C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbsN8LzEHSllSbhS09Kne5lBkdDfQDFMIJM4onNL1Mo=; b=KJ2fwnW8V5BXXg
	Gd347WwNwOILLvjwCKiRAJSt7D4R4U9vKoDMwuZ70ALr4CzqntwuyJITzHDTKNlS6N279jxRByiOU
	6HeIZsaPH5iwAxcEcPFiB5dZ+wkdcMCBLth1p0PUqfcPUdUhBKLLahlNFpOzX/JwkyX2NY31rUmx0
	ZXu391DRDQfw9IcpPIyIThkZQ1i7WOa4vA7WSqTkToFGEXAnCWDDftP9gckPAKsZFqOfHzxk5pJbc
	to4WRIibmnvtOOwTuoCf9d9T3sZ0+/h8E1yMWxx7MzYL3mIs7Yo/XuJVPcxD/QV2dWt5FVSMiyd1z
	rY91jjfU+gr+1NajPUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLY9-00000000qIs-1i4w;
	Fri, 12 Apr 2024 18:22:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLY5-00000000qG1-3tPK
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 18:22:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e5ebb30129so322895ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946172; x=1713550972; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1e60CwK0PVttJs1oeSOiibpRUbN18cUEABEgzA6wIs=;
        b=DMfPe5gm6G1WBONmCr46996t/m5Z6/Y7cnFE2lKmkE+apFlVYvjP0Fte3nqFK0lMAd
         56nxkxd/a5JBmEwU+W4xxWr92ZdZb/L1Igdjj0hOJvsmg6UG9LzTzI4YcDJdkeuEKETc
         iyGPggE1RgDK/6uiR7rGAQp6YmpFUkiMi2DmaGUb1jstNKF9Tf3RlZuKvGpCSbBFu63X
         8eeixBbxFGYgiuHh/vzi35bhsJxB2s3iqYvuQFxLyQ3ZuYjZjzcbQR6zcoPRSEX50JxV
         vuYvR12t8gD9zldSUOrOlVBWzBNHQMk01MMMDfXjF+LweISHv+OtBjBF13eLhg9CZyoo
         avSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946172; x=1713550972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1e60CwK0PVttJs1oeSOiibpRUbN18cUEABEgzA6wIs=;
        b=B38qYDzi1wsmmuaxXcSAvHMjNPLC+50X9ONMpS/3lQNAOJkS4tdCcNZD3Fk+BKbCG3
         84NyDSVFHNschbFTYEYJKheEWfR5ZupZAteS767Pcdy6kzDmk/DVeki1EcYkielR5yUa
         N/pEiOBXoVj45uGgqGu7mfRz521Td1HcPYWGv6aPUB6nOUbKFUQCog949FQa2rvgL853
         zjJkIGEqH/xZczz7BQpYxm+ptYyQobxQmevItbJ1mMGtIYfu0CwFqrgDJey4p6NXv8vf
         lOS674331xxUhSCQ9P4y5YOCO4xDFpsM1tciL56DXOvOEUClHYLR810Jxnn0Hrqw1JZK
         Gilg==
X-Forwarded-Encrypted: i=1; AJvYcCWePHpHZamSHMpXVE9QnGTIa0l5wJlPqQdOH84x+XD1MFYkUhTsDBtmbHudeW3XtP/JUNtosqyHX75qsHh5HbQwTHsYgfqpG6bRFxuzqQc+
X-Gm-Message-State: AOJu0YzFoygS8uI7eO1nYYnKEsfaZPfp+VUYUIt/T4O4OIDp2ve+bQXz
	l/60YrX8TM12rwPstLZBJzoewIfdtl/v3r0Ual0oLG6vb6h1yyP8jlnx0C7kiVM=
X-Google-Smtp-Source: AGHT+IFxTX0XIuZbNR6qdEOLtuqZ+KqQsFRqq1yUy3tf+EcRY4ZnjF6vouMF9rorhX6yEu6I5X4zfw==
X-Received: by 2002:a17:903:32c7:b0:1e4:3b58:7720 with SMTP id i7-20020a17090332c700b001e43b587720mr4370912plr.2.1712946172563;
        Fri, 12 Apr 2024 11:22:52 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902684c00b001e3d2314f3csm3352924pln.141.2024.04.12.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:22:52 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:22:44 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 10/19] RISC-V: define the elements of the VCSR vector CSR
Message-ID: <Zhl79HOrWWGaM4lK@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-10-4af9815ec746@rivosinc.com>
 <20240412-viper-bullish-d57d19805a0c@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-viper-bullish-d57d19805a0c@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_112254_106985_E050032F 
X-CRM114-Status: GOOD (  10.43  )
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

On Fri, Apr 12, 2024 at 12:27:50PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:16PM -0700, Charlie Jenkins wrote:
> > From: Heiko Stuebner <heiko@sntech.de>
> > 
> > The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].
> > 
> > Define constants for those to access the elements in a readable way.
> > 
> > Acked-by: Guo Ren <guoren@kernel.org>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> You need to sign off on this as the submitter Charlie.

I wasn't sure, thank you!

- Charlie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
