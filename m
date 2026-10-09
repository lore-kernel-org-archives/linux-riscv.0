Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FA0CA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1W8lAXduN6bPUhw4rA2sxg910mVTqh30zD7yFEQV98Y=; b=Fdw10A8N8sbuci
	5StptXTX2gdTaesM5isCejwb9b8KPshu6lILqT8oFwCpdMXIbDvWI+7hD4SBzw4w6k3gsUbmkBs5V
	gQa+1EnHfChrcjSqCYN3+pzBTpJHSAy6MOTqYSowvMXqghBMWqmFZcXBpt0fQe0YgfagrsfCqWtj8
	iLBNoVHu3WERouzMAoRRcgxOkc48qSGDUcvQxgrOF335Ruz7L6E/MjGWztpesBA3xsrPi31CvTK+e
	/YPFyE2f/iJFwzZm4wIwxbuYd9MRNQ8SCPuJ2IhKkMcAIn2HhtyF5CU5irvwvfPxqPOg6vrMI7X7I
	ZfIftSxwBQ6q5NARC3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Ce-00000005wuc-0zSQ;
	Fri, 09 Oct 2026 09:47:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Cb-00000005wti-3vWD
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 09:47:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so3686162a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539265; x=1792144065; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrPTdcZ/njH2i3/j2LZUGAT14iJIsacuNVj54+laGas=;
        b=LGdw6ywh6NckTV2WMlMaBf5Bv3UwDacd8XkBnqZ41CIuatSYjeTH/80pt1Cn2t/Bxf
         Qy7JgKxDgTFNpYwKMveMILPOODTsojQ9yXVif2/59J+V8gP/Pl/Lp+K5CruFEi/gxhGI
         rvsNrAtPXhWyU8R3nkmJlX69tEPO9jtKPtgmRLVwUKfVnL7cpQd4dDAVggS41y+nbp0I
         d0FOGWgxk0iz7+LFcQhfHjehrhovqhO+Iho9c83oq0328H47bpUoLr2OQg+YCxMnbrQt
         3na12+14uMBaBuV1w0fMA+TgGDTL2V4lGmgehaCj8IFcVFXE/7R53QOEVfUF0cznsKHV
         SRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539265; x=1792144065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrPTdcZ/njH2i3/j2LZUGAT14iJIsacuNVj54+laGas=;
        b=Xtkk0yeT8RI4dcit69LHJZ3g3jYEvZBuESBlmOxbKIj8P1kwy9hqrcoRtpkexTjr41
         9yQoTjPxe8gZf5tn5RhDsrKJqHBbRGyuUS8hnuMlOQziEvLrwa3WidBhKbDLll9zPyUF
         jyHmS0Ec2b0de2ThPShkMy0iJT51IlbNXCmMb3UB8pQAlLnOnut/9/RMBEonNvKGqISP
         zD6S7GYGtUIb1mW2+jFaAjMHbSNPDm29uZTr0h1MAvjroKgcwwwbeMuHyS0csFjAp28D
         kYx1olNXhoNVgqWkYYbQP4SCvvf4ZlSD3Aga0hfmjR4zEkkj8//sNrFgbCaZTp/KIzPb
         V8VA==
X-Forwarded-Encrypted: i=1; AKwUvBzTqSNbX8jgBOa8C8qX+O7OfYrFyGM8KzI9y/6Lw15Bbp3qr14kgX1TYPasQptXypiIA8Z+Q730mOgxeA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLP/AvRwrZWSk9SOYJL+0bNN7Wk3/KaPgUCPFal0+9WTuk/y6cw
	TmU2hh9nex9ymSQE4irzQBT2dEQ0bzzlILfAcGH+9JsnXX6q4aeEAnbN
X-Gm-Gg: AYBFou2LCngE0JisLrds6+WJyfTov9exioIw0wL7MjLSThD8NIgfMGF6H7SHUypEpw4
	eihv6KIwBtTaNUh4Ye+zIxwua+h1aWmZrTBtoaRKXymkY9IsAAnsIAcURT+56mWxDRy1xMfl6U1
	DsAn7ENc6aIOwnOG/UqYTN6jvmx8arwnVOz9dXLN0Fhz5QeQH8QT9+HSbn884aQIZDbvcQGaGu7
	ci3f5yWWcwOqvxxSUH6g2OKk5ZUX2X/beGfsyI3lZlAbvBKiS+S77EKQjp1Vij4UDo5W4pejgNr
	BN2lSxWpaT2fsuyEvtfa9jKeLb4qnch0tIpWhzuGpCUC/lxg48MIR53ecX0g+EBvIXukE4e4XEY
	Vq1fy+Uslzb4aAVEMUbiGaRlN3ijCt7Q94STwP1hiR0S5zXqU+UAzHwWhB6H3112FkQ+um9SKXZ
	bSZjzDB0GHab7ZeHDus428coCveaqyiWVyh7qfcr3tGLcHEwRsE9H4uG1yYXVUvTL0v1/F
X-Received: by 2002:a17:90b:224c:b0:3aa:faf6:a951 with SMTP id 98e67ed59e1d1-3ab3a9a93b8mr1318325a91.37.1791539265069;
        Fri, 09 Oct 2026 02:47:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm2638018a91.5.2026.10.09.02.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Hangfan Li <lihangfan@iscas.ac.cn>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/4] spi: sophgo: Fix SPI NOR errors and clock limits
Date: Fri,  9 Oct 2026 17:47:08 +0800
Message-ID: <179153921379.259252.17749060045138037060.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_024745_977956_7C647EF7 
X-CRM114-Status: UNSURE (   8.24  )
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

On Thu, 01 Oct 2026 02:22:49 +0800, Han Gao wrote:
> The SG204x SPI NOR driver ignores transfer errors and clock limits.
> Fix both, enable SPI NOR on SRD3-10, and use 12.5 MHz on SRD3-10 and
> SG2042 to match EDK2 and the vendor kernel, respectively.
> 
> Tested on SRD3-12 at 12.5 MHz: both flashes identify correctly, SFDP
> reads succeed, and two full 64 MiB reads per flash match.
> 
> [...]

Applied to for-next, thanks!

[3/4] riscv: dts: sophgo: Enable SPI NOR on SRD3-10
      https://github.com/sophgo/linux/commit/0fe449e8ff7b383a8375e85ebca40133a02f3348
[4/4] riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz
      https://github.com/sophgo/linux/commit/a3a8c25c59f8024eb70a460767ff0d7bcb213338

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
