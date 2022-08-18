Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E8EC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 20:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15C2YG1hoDEBYTsAlcZQ3Wx2+ioFKmnXEMJpe3NyWCA=; b=zAjHv6NvKwBcuU
	Nx4gb4Drz9nO0JLg8qc/Fqp3UpX/G4wHEIGFOKcLL0lih4O0TzS8dtqDoN3nz2ehgrm9T6ozRNzoj
	/gbqJ54/GJHItfJCcvRXG0zx7Sb8BmwaT6ibqGLTUg6LOlxfrnPI84kTHNBbkpHnmFPyCAE/PY8My
	K3DT24qpB4iWEC/xrGufM4U9sVhRvyPFWCcDxe9ReQhtVjXCwwlaWiBJhfz7K9Z2X7rKg6P4k2w1M
	4MOk/cVcAN3+0p1wiK98FSEHU6WKVV5+C1/Rj3qSJsLyxHfLBs6JlVFSHZvvTi8zudeD5WDCfml0/
	a0lOS/qGfN7EeagA2kLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOm18-0097jG-5n; Thu, 18 Aug 2022 20:21:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOm12-0097fI-6N
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 20:21:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id k18-20020a05600c0b5200b003a5dab49d0bso1513680wmr.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 13:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=6pkHhD3b4s4v8AQHs/WwRMbCrj+baLByguJdX3yP3tE=;
        b=SNg7c5ehYit1W3JUTfCcA1hj7RDAY1+SiK6sTMnKJidiwTgVb3c5eZKWvLF7K4IwoD
         sccQU3hBb2AumVwC7SLf5xvrKlUo1+B67NRu8XntVU6o6grLjNyHOGYJkQoKiVSXN7/M
         1eeIeywiXbsVYr58Pk2PhqcVQJZct38rVgOwSN2fCsrJi6WhArQSESCPNKKMZTSCITYp
         fsZucnwY4o0TRfbfCML/PrKlsVsJzRdjGf0g4SeWeYlAGZ2flkVg4bgodsKFvj/Y3C+p
         vsvmYIN1lUQjldodmNJuMS3eak3vEO07PINmkpZXdJGEzHkLIVOUzm8zgwaTl9bVNq/f
         0eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=6pkHhD3b4s4v8AQHs/WwRMbCrj+baLByguJdX3yP3tE=;
        b=JVd4LxvLnIYm285o3WZmsm9/q6zTNZ+I/tM6Z7MChWJquPqXSKVPUT+xX7+CPrbZz+
         Mt150fWqBaIYUCy98fJRsycUEKHcW56YYUilfTUKXpHXWETRIBT9Sacz3TTU4yCS0kz9
         d/EzQDCiHAzq5kFwxdYOpjQK4PK4u/Mg0BNGWL3lS39cU47eT+DG/f1IaHOemRuouZ1j
         s5ht9LLpmdMWaWbod2VgjLJJ73IRFbAMjNI6lC89TdMvB7D65fEbfRMM7IfD6pHi/MVa
         GgjbXD7Mbc4T3+UasWRzQuLKZO+DyitC2AwNHC7Eg2hQrjtFJIbhQC50aqVQD6ngvcUX
         a+MQ==
X-Gm-Message-State: ACgBeo2DCWcZrWqClJncKhw4dZfWE3ol1QhFXSi1+l0K6DPvCNz/byYh
	CpVa9lMDKQCIuL5wm2lhhrEaHQ==
X-Google-Smtp-Source: AA6agR6qGU/c5zIjVDM4u/3IHu4BiAu4VGjiPUqHmwqo6VHjdZvw3PlBFQMCeg5go3ZwXC9ISlkFcA==
X-Received: by 2002:a7b:c41a:0:b0:3a6:2569:7eb9 with SMTP id k26-20020a7bc41a000000b003a625697eb9mr2786229wmi.0.1660854077409;
        Thu, 18 Aug 2022 13:21:17 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id t24-20020a7bc3d8000000b003a5bd5ea215sm3121230wmj.37.2022.08.18.13.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 13:21:16 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Date: Thu, 18 Aug 2022 21:19:49 +0100
Message-Id: <166085385179.1336923.6007777550886077496.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817132521.3159388-1-heinrich.schuchardt@canonical.com>
References: <20220817132521.3159388-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_132121_273888_FD65C265 
X-CRM114-Status: UNSURE (   7.32  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 17 Aug 2022 15:25:21 +0200, Heinrich Schuchardt wrote:
> The "PolarFire SoC MSS Technical Reference Manual" documents the
> following PLIC interrupts:
> 
> 1 - L2 Cache Controller Signals when a metadata correction event occurs
> 2 - L2 Cache Controller Signals when an uncorrectable metadata event occurs
> 3 - L2 Cache Controller Signals when a data correction event occurs
> 4 - L2 Cache Controller Signals when an uncorrectable data event occurs
> 
> [...]

Added the impact of the bug & applied to dt-fixes, thanks!

[1/1] riscv: dts: microchip: correct L2 cache interrupts
      https://git.kernel.org/conor/c/34fc9cc3aebe8b9

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
