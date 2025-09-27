Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AB6CAC5B0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvFShGlaiysQnHiUi3p2SLRNrkZ/wEd3KHbNzpM+bvg=; b=rmdijkKFApu4se
	JXo2sfdfL2xmCkYrM8btGZLepRRafUjRCZYJvPy1zI43NqvntPLS0yrlUhOPuUO/xDeZ+wQXO54F2
	bjCrE6vypOw7fnNOTQszuX/BEwLiCgUvAPSQG6yWLurR3LDZs9Sx1ExpjzyNhBgtg8kd/qmDcF1Nk
	HcGOIQ6P0wkeGTXRWQKrlvskkbAkKutKSSvY29d1vNes7yN7ubRg+gBkmaXGNPK8NdwWSi2kDbLx8
	Bog/B/WlFc8mXkKi/+f/Envn9QI7mqLmAmCfzJxsk/vX3QbRhFYK/45MvqdNHzXZ3smSV8r7oRRmx
	qrcAPEMwhDD5M7kvUNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VSS-0000000AAj1-3vj9;
	Sat, 27 Sep 2025 13:59:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VSP-0000000AAiX-2Shb
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 13:59:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-244580523a0so33437245ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Sep 2025 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758981564; x=1759586364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ2zurBZlXyqU6xN/6EaGXAHpVHgluSazTPc6JBBq6Y=;
        b=TXVk4FVAOgbRRPWBeqtUt6XnoyoHDc8/6pwv8HojGmiai+UZ3JvBShYXU4Q2Aph/DR
         rm1EoPHSWvZy6ZajBU7XasXZJk8HIrwlGnHPIiv82lgLacnKuIgndUwH8Tl0/j8bT/HW
         Frok9DI75JMCCSV4+cOqVBmWCLqBFBCrP/5cFqL5Dlue3RC7AG5aDqex4e2Gz3qf/HxL
         HNPzqNE6spBPnUyayddHc3cOlxY86qwfCzL8QhD6Lq8gPe3WStTylqmJNMO6y7k3pUwd
         clVPYSXSFU3O4wpLanaOFXfIarAsnRvJbdw4+H0znDyoRdC0EbnWpJQbaPFzLq1HyV1o
         uO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758981564; x=1759586364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ2zurBZlXyqU6xN/6EaGXAHpVHgluSazTPc6JBBq6Y=;
        b=G7B2w9zmLNhlo2BG00/Qo8O28jJmLM4/8JjBYhIx+Xh9wcIS0XWqa++TrROrXAJ3+G
         UCMawg9I95LWz6Xd0M1V9fRA7DS61srProCNZXMHhsbXjx1in/LR54nmTdBk9ATc3Sr0
         gMzTZBp6IfRmpc7QP17NMJJs+W5EQ8BtbpehTYWiOaGMOapzaDKOdE12P6EngPF3t3i7
         ObNHWRqa93rgwcqIN+weAVMqJ+blDG9F2ai8vlHBbGrupoTW+O0REM2jmfPnUcjKHfXh
         QPm2xDbZWgu3kF/DnkYgK41jNfkQOtWCqXh7EJS/eEnK6vEJrYmj1AZpNJrXGelEwze2
         ztVg==
X-Forwarded-Encrypted: i=1; AJvYcCWHNut5DD7iQ9fN8Bbq5awDdSDbpq622nOmzVIHiAySdBxalQjfcW2NG9Q3F10d+Fbln0p+tirXHrRdxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybKMXghf3+7oJlwhdxFs+xYZ0G1mEKs/hVLLqQ/ghNVGJrsXcW
	VbHXO0rRuEsYY9pZzEeQXj0mJzmZGVdx3liVNO/fRbA5uFxktUzV64Sr
X-Gm-Gg: ASbGnctm5+oUTuVPYBjN0V6UB6SR+nsgJ4aYkT96Qkrx1g64+v8VD5M9ZwyUehOHhHh
	R0HcHkp+ux2syTy1zxG+YPhi9Om1ZEMJz9ncHeMgJbHOnMk2rCw3zD2YUMX4wbxFfRq66ouNlFC
	CJY2ratEEFUQZMg4gH73ZiNJTxjCzmr7VgIozcJcOittJ9rM1dxhF33kzA4gM2a4WqfZrkwy45G
	l1bOqbe1bFL7ybGMEPaARW1tdD+GsbV3kxiU4TyDeEFLnBumenmOXaa611lWR6dacCqTttsjlG2
	gtxWnyyvEh+mjYqWD0Km5Sb/zOSkYghD08XoU1ety1j0bSn6JEocosYZYTppICwi+OaEqt/HQBK
	AwHZZBCD+krE2TBOBhCP8gPCt
X-Google-Smtp-Source: AGHT+IEf78Oq9CDF3Gdqzh+zztJ/1K0sMtW4DnsPMDn/dIyyhBV9SYuiQfoD+F6FHky70q2kK7m2SA==
X-Received: by 2002:a17:903:2f8c:b0:27e:c27f:b834 with SMTP id d9443c01a7336-27ed4a6dc52mr119233195ad.56.1758981564487;
        Sat, 27 Sep 2025 06:59:24 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:1f0b:281e::3ff:4e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cf181sm82444095ad.28.2025.09.27.06.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 06:59:24 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 04/11] dt-bindings: timer: Add Anlogic DR1V90 CLINT
Date: Sat, 27 Sep 2025 21:59:12 +0800
Message-Id: <20250927135912.3327-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922-dr1v90-basic-dt-v2-4-64d28500cb37@pigmoral.tech>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech> <20250922-dr1v90-basic-dt-v2-4-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_065925_622246_81618C43 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, Junhui,
On Mon, 22 Sep 2025 20:46:34 +0800, Junhui Liu <junhui.liu@pigmoral.tech> wrote:
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -29,6 +29,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - anlogic,dr1v90-clint    # Anlogic DR1V90

UX900 uses the ACLINT with SSWI. Please use the new ACLINT binding.

Link: https://www.nucleisys.com/upload/files/doc/Nuclei_RISC-V_ISA_Spec.pdf

>                - canaan,k210-clint       # Canaan Kendryte K210
>                - eswin,eic7700-clint     # ESWIN EIC7700
>                - sifive,fu540-c000-clint # SiFive FU540
> 
> -- 
> 2.51.0

Regards,
Qingfang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
