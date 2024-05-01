Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F9EC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 17:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmByBa5uQ8BvO4p4OkptkGEdCzPanDq4Gtwz5o6UsjM=; b=qjLeESw6oU4Wmp
	JWOuGxmlBjcwSKIPk6hYHZ4RUkamJ9CJa8MGVQJIrLwZA2YgF1qBgsjsCYyy0BFaKFdSTYbeQB+2D
	I11Wsq6e1RwGuSIR8pGWrPem98zi3TiGB8+HxYyNt7ED9qjljPmiwKb04UOLFWkJre9XkSP49r1GJ
	PsoHuk45c/YUwUKWJyXTKC499bESJ6xjgkDcZ8sLWYWCgtB2BWuiUlwbFDQKntgGcKgFFY551EdP0
	cx8aSkyCtPe5jhlYENT9v2HbqyOix/qz4md50/5WMu+y2KcyTXRUoBwXDU/f1HzGmyfbKkrgQurdJ
	AmxHtOUjqE8o0dkUa8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DU5-0000000AGxM-0AIk;
	Wed, 01 May 2024 17:11:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DU0-0000000AGvo-0Lhj
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 17:11:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e4f341330fso64990615ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714583461; x=1715188261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VEcP2FdbTuUC3sLwg55sFZlBNkkI24Wn6q64j9hZkM=;
        b=ng+73jOGF0tWvW44zzmHbegO9Zc/GmakRVo0X7PoNP88vluJki4oPpoCAvb4ESrsvT
         pAf8sQfmN5JHH1bZFFkNDU/lRfKKefYa0k+Z1L/pROO1gm8d+hXxX/OIUf8Zl1w5SQsJ
         8yKTs7cPvxWGQlYpaZSgDLa0yfqMyVb92tRROGGgTQV7oYPGgOBhQ4J5eWIjXoSjGUW4
         ImsgM8qXO/faXv3xydb7Ha5250MqCH1nDJz/62KE98vD7gVXx8482DFPFiGMoZIrOMkr
         fY0GMkXZbbetkcyvEDcsrUi+wLXtIihVgBrGhNxmN/ErM7enYNMvlGtWSL/KoNMQHrgb
         fxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583461; x=1715188261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VEcP2FdbTuUC3sLwg55sFZlBNkkI24Wn6q64j9hZkM=;
        b=AVMKBeK9/yeB6HpGwjVKpfy7QjNWG+DTPXIY4XZQwTaJ+4yDJOquHtpyAVBw5F84rY
         HYwMUoypGIp7V3dsafPyKZkmC27p+qxGrUujm4hcXRYGAbcdAm6EYrS5Uk6fzo+o8ui1
         iv6urIPWljq8qnQ/PeKXGkP+fs2cGjYawYOtH5H/gSnLVS8YIhfOBJuh43MhKk4nDhrx
         kxSLxK2sX6LMu3wlHEm0gRJh7XHkr7goJlrGmtU7VOB1nQq9e6n5UNcXbp7aiboFJ9BY
         2iN9CtYlRy/RzbvladzLvxssZmoDOFfXtMHPnhmHnGTsyVbl2w7dfaBivjwjQAz9r2wL
         3Teg==
X-Forwarded-Encrypted: i=1; AJvYcCXUWdy2sGZfIDwZpnfSZuguBEQRaydZuBxQO1+vgZn5aZYnzzKLijXOrErCrq+fAphpqgZkIfHWs72sUJAET1DsY5jHJx3hROkUBjKan8vl
X-Gm-Message-State: AOJu0Yy7A6DoUnyggdFVUmMQCM0dJrG4GSDIxpvzO4N2DKP9Rt8DUdEh
	nlBTPOY3qzli8ULje9pFrXCcGzpWTsdJqJgUSv5lIy56vHS3h6Cc6KA37mTxX6I=
X-Google-Smtp-Source: AGHT+IHpxFS6GEORaahugjisle6m4KLF0ZtLQCz0Flxl/HiPXR710X9hyJZCr2QqZFZg/RK2FxmvGg==
X-Received: by 2002:a17:902:6bca:b0:1e4:df0c:a570 with SMTP id m10-20020a1709026bca00b001e4df0ca570mr3014699plt.8.1714583461518;
        Wed, 01 May 2024 10:11:01 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id mq8-20020a170902fd4800b001e23fcdebe9sm24447681plb.98.2024.05.01.10.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:11:01 -0700 (PDT)
Date: Wed, 1 May 2024 10:10:57 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZjJ3oaFWhbLc39sz@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <20240501-drivable-deviation-0a493511770c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-drivable-deviation-0a493511770c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_101105_296315_DDBA86AE 
X-CRM114-Status: GOOD (  15.28  )
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

On Wed, May 01, 2024 at 12:40:38PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> > Separate vendor extensions out into one struct per vendor
> > instead of adding vendor extensions onto riscv_isa_ext.
> > 
> > Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
> > code.
> > 
> > The xtheadvector vendor extension is added using these changes.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig                               |  2 +
> >  arch/riscv/Kconfig.vendor                        | 19 ++++++
> >  arch/riscv/include/asm/cpufeature.h              | 18 ++++++
> >  arch/riscv/include/asm/vendor_extensions.h       | 26 ++++++++
> >  arch/riscv/include/asm/vendor_extensions/thead.h | 19 ++++++
> >  arch/riscv/kernel/Makefile                       |  2 +
> >  arch/riscv/kernel/cpufeature.c                   | 77 ++++++++++++++++++------
> >  arch/riscv/kernel/vendor_extensions.c            | 18 ++++++
> >  arch/riscv/kernel/vendor_extensions/Makefile     |  3 +
> >  arch/riscv/kernel/vendor_extensions/thead.c      | 36 +++++++++++
> 
> I see no modifications to cpu.c here, is it intentional that vendor
> stuff isn't gonna show up in /proc/cpuinfo?

I wasn't sure if that's something we were wanting to support since
hwprobe is the prefered api, but I can add that if it is desired.

- Charlie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
