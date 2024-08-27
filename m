Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0D9C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 04:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csdhZ0Rkt9dmorUzmT3uOpJHcMTcAAtSub4dtPtte3w=; b=niWDZE2HSEzP8Y
	EQbbU7G7FkXAGg8Et6fvPLnpMOcs/RFsib/519QPJWWtUO+9FWfVuyPQ1Oj4wKm27zrtzDtITmRFy
	DTdA+oUHg4FABTSQJB7GnhCNDJ5szDLzhjs82NFulr3G6euxMpVlvSLzeUvuvd384lLEpl8PYzgxx
	ohDp74yETC9ABNbqHMAri712PmuMO1JKGj+Ds3B1RLagOY2KZt/NB75pwMz1nqJp+bCVhhAy5gY2H
	GmVrnv/Jx2eAK/r8i5wHBI0Rzw7gvVbdjBcUAJwJNcRFES8YSw8y0yrElW23P4nK0sdDa4pcTZVjB
	x3qz1TFsjZRQaeiNNOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sioCv-00000009lVz-1yV6;
	Tue, 27 Aug 2024 04:53:29 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sioCI-00000009lO5-31hy
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 04:52:51 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e115ef5740dso5105741276.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 21:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724734369; x=1725339169; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=418E3MTktRHmY+leklOtGq6971YMsgcbUog7USmFf5E=;
        b=mtQIJsitFzPtDx7getmUdcxUqaGXIFm9GWr4wQc3L4QOPbSmZO6aySSM/AK0cwBhWp
         trWzTkyV/dgXFmfMwC5T0nyicsdU5lCyI3s8P9yLpu5QGT5xBxPK9MGGG1QNf4xe9Oxa
         I7yvU6nHYAQTltzs1j3YveCZsH4ZitCtdqodxcMQpjJsnjLGhsGxFbCbvuXVHVZUVRV/
         tMqxEbCpmsSpnGeMtrvfHzVON8qoLGDib5Vy8nkeevhxyc9ID/bBe/48MHRsYi6xefEs
         njR9jVDCUYbWmrjq8NiSqe8OXtoTo6cYB/E2szqJhEFQgdysZaarNZ0lSte4x47o8FZE
         NamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724734369; x=1725339169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=418E3MTktRHmY+leklOtGq6971YMsgcbUog7USmFf5E=;
        b=aW7RuIYaSjptiNXnjh+Qmjjgwv2SI6vjo9GGUUxo3gOKpAq63nioOLdKJjawGngywl
         +G8gOaKNpvnI0iL2ut12/UJvQbG6fWmXZKP2B5KuMRSak9NWOBnneyxBWfUOCQqzfuV6
         huQjvjbAVLr57mvZiRhl4uVdtyMeJVLo72TcZslse6YweMyU4z73aNE5tiMXMkkDAIzI
         qYdOBOQwGPUqF2J576KlKRNf0QyKtiq5K8h5SzaKfoNwaFydoo9Mb4QhyPeae3Ai1kia
         1oPHBLS7ZYv0nDFGgluYn4697DufF7zrx7S/WU1M34+VSy3S2NtH6y5FbSs/feBQ7PWX
         FiOg==
X-Forwarded-Encrypted: i=1; AJvYcCXu0B+LqI+bs4Vs72yxIk38fnJIt96xkml2rrty481+laIFF2ly4Bo+gPXFxmoPl64/fShfVvacxMhEMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR/IR/ThjUzht5BEIPCX3n5Ti4u19Lw8YKoHvgTkx8xEY61Men
	f61iCYkK1PwPqZCJNLeHaq4R4cUwFh3Gt95EHO03UQtI4ktZgQF7
X-Google-Smtp-Source: AGHT+IG9abeZfKP33m1kBLwp5ZcRFam4qvM6M6Qjkco1IbhHF/ioe2Wg9UichaH7JZICQ1R1vorh9w==
X-Received: by 2002:a05:6902:2405:b0:e16:69b5:ef66 with SMTP id 3f1490d57ef6-e17a86a8e16mr13105821276.54.1724734369212;
        Mon, 26 Aug 2024 21:52:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e0e18sm7750246b3a.104.2024.08.26.21.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 21:52:48 -0700 (PDT)
Date: Mon, 26 Aug 2024 21:52:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
Message-ID: <44ddca1a-8aac-4041-b01f-190694637753@roeck-us.net>
References: <IA1PR20MB4953DF0AE7210A6D74162952BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49538276F283C4D01364AEB6BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49538276F283C4D01364AEB6BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_215250_778523_430CF03E 
X-CRM114-Status: UNSURE (   8.28  )
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
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Chen Wang <unicorn_wang@outlook.com>, Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Chao Wei <chao.wei@sophgo.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 17, 2024 at 10:22:56AM +0800, Inochi Amaoto wrote:
> Due to the design, Sophgo SG2042 use an external MCU to provide
> hardware information, thermal information and reset control.
> 
> Add bindings for this monitor device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Chen Wang <unicorn_wang@outlook.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
