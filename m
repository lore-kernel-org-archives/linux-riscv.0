Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C62F3D600
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Hekk49P0w2AIVqgWxIG/SYVVzSVYpxnAQgacoMuyKo=; b=IM3IE4vKT96XBf
	KLkKut0UIXlGJO9vFyxwW3Uq0ERwd93zR5CmQZUQx+ycKibt+h7gaIPxPtHPsZUVsgow2ZK9+Ib1M
	aLGMXFhiXyWHZLwZMbulPbV4NPCmAL8LFEsJ/VUlGMr5imI+oHK+X0ix5N+PK+mT5cb4DMGk5nmBH
	YiRmC4AMr+z7F+VNf4Q19RbeUP3rNEHPu4EcP1BQoeN4ABqNMtYnIIublHyWfxN8Dj+z8q800bTgM
	jRm7C3slX3pcfDrfEJekbQA8xsRuc1ChhMUuvsib3EcMLt3RGOHEp78pV7TtycQ+ggO9FF609Lk5m
	kwpcTpU76Q6O/gNQUP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6neG-00000009qRf-3pCB;
	Sun, 29 Mar 2026 10:45:40 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6neE-00000009qRL-0tgo
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 10:45:39 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a9296b3926so22821615ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774781137; x=1775385937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OuCLPjsEadPOUVMbfsmJNhO61+7qHRvYnI6+IDoFMc=;
        b=VndLEMupnAivRxWy7Vv+epynO5lup2idw/cM7YdZEL4oylTNigbmfwqXTpu/irikiu
         bnqqQZm5uRjJt1FUfaG1aVH1gzT9jfvvgQ0nVxcE6Dy3qLnLCu3fI0KUro195auZp+9V
         +HndF4DeuOQfBgcyu5xEnzHxH0G2/JBI3amJSVko/ciCsx+tgU619z0ak/EAR67lpYWz
         ugdHr9igewFIs/JCxjpE/duFzBZnyXueVsUxVdmlDF6l8JSPvg7XmhFzJgqcVHtin9C2
         rYSfGJvCU3l1yzztEROYH9ryKOML+p0RCfjiMB5d7SmPctyQaPEjxd/eWaqB4hYfrpO1
         PJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781137; x=1775385937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1OuCLPjsEadPOUVMbfsmJNhO61+7qHRvYnI6+IDoFMc=;
        b=rO/GHKf5urtPsbNwxGQ9kZZxW15tUqBjS9eW+3TQ9YuEt5OIaFvI5er+TJXYlMakxB
         KfG+1Fv6H4FkZd/irGpKpHIUvXumZ4kQUX/ePZgf9Pa2XI5v/iQZjtE/ZcikL1wVoFkL
         /3tHVLsf0YLKwIclO+a8a1daVVMZEOMhaeB7Y6vlJAv719yJuNV/ql1GlzC+WsaXtkDC
         rZqfbBqYoNKwKDk0y33VfAuV2DYJ5gTjguT797IP/Pki3QNPtkAFynKgWO2E7ypU65v9
         AddUpQkaCXgI8KzZ/Ogd9mncIPTjzaEwmEk318Y2MFW57l8N9MuDFfC8pM/CUmgoGTJB
         K8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR5YraTtqpZkTThbd9s5YsEiHys2w7gwZIR5zMPoUo8jQdTubwJ2R1jE0HrJFZcqT5bMAPTB6/iugCew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAYC+d3H3XmhE3EiFei0E5TKT2He2Q698Xx4x2S5WTHdyoKIzq
	Ah7SQO1cz+2LUPumqa55y30xdOUp6ue3xzt573EJQcKY/SmgvXNoK3HK
X-Gm-Gg: ATEYQzyCJSqvzoVbHizJde1d+a7gkRKF2bqy8r87dewfKpow40JM24DNqlN9zVs0AFw
	/IT1+DFgQU3kbx8gW77PDlslFGfvhTv7s+Rp4K+g30qx03CRDId9sfsF3jtx587g5abcom6U9iA
	XppKD+9n2eUpWsOJfphOqON/avFiic/pYPM8Pxy05U5MO8jXNneacr6YnHcuMNYpWzdeYK6AYI4
	StHIX9s394kufk/twoLQzbHANaVvhbj6EGJP6tQuLH/AuqG/diDx9R+7UG5kjTSREdg2hMle2w2
	vWHPcT7isvBWGcIi8FWiKqwTO7hPiqmATs3G3GMN6M/pl+BB2JRft4ya3WjGLpvQbotTnHxzgwd
	ztRu1tmXN9+ejdCXSbVXXRjG43vsYuCBS4AQzaOL5RVK/BpGbF5jFgwmm9SC9OC402FMEcyaECC
	sMxK8eMBS90vQIxeh8NWxRKJvFxNOCTLcO
X-Received: by 2002:a17:903:2f82:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b2497e4b68mr29510625ad.8.1774781136332;
        Sun, 29 Mar 2026 03:45:36 -0700 (PDT)
Received: from localhost.localdomain ([1.203.66.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265e7basm57611035ad.21.2026.03.29.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:45:35 -0700 (PDT)
From: Gong Shuai <gsh517025@gmail.com>
To: shuweiwoo@163.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lukasz.luba@arm.com,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rafael@kernel.org,
	robh@kernel.org,
	rui.zhang@intel.com,
	spacemit@lists.linux.dev,
	gsh517025@gmail.com
Subject: Re: [PATCH v3 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC thermal sensor
Date: Sun, 29 Mar 2026 18:45:07 +0800
Message-ID: <20260329104507.4101836-1-gsh517025@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_034538_275755_1D229FED 
X-CRM114-Status: GOOD (  16.05  )
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

Hi Shuwei,

> Introduce support for the on-die thermal sensor found
> on the SpacemiT K1 SoC.
> 
> Include the device tree binding documentation in YAML format, the
> thermal sensor driver implementation, and the device tree changes to
> enable the sensor on K1 SoC.
> 
> ---
> Changes in v3:
> - Fix indentation and variable types
> - Simplify clock management and redundant assignments
> - Link to v2: https://lore.kernel.org/r/20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com
> 
> Changes in v2:
> - Move driver to drivers/thermal/spacemit/ and update Kconfig/Makefile
> - Address reviewer feedback on style and structure
> - Improve variable naming and comments
> - Link to v1: https://lore.kernel.org/r/20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com
> 
> ---
> Shuwei Wu (3):
>       dt-bindings: thermal: Add SpacemiT K1 thermal sensor
>       thermal: spacemit: k1: Add thermal sensor support
>       riscv: dts: spacemit: Add thermal sensor for K1 SoC
> 
>  .../bindings/thermal/spacemit,k1-tsensor.yaml      |  76 ++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 101 ++++++++
>  drivers/thermal/Kconfig                            |   2 +
>  drivers/thermal/Makefile                           |   1 +
>  drivers/thermal/spacemit/Kconfig                   |  19 ++
>  drivers/thermal/spacemit/Makefile                  |   3 +
>  drivers/thermal/spacemit/k1_tsensor.c              | 281 +++++++++++++++++++++
>  7 files changed, 483 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251215-patchv2-k1-thermal-5ffb838fc1cc
> 
> Best regards,
> -- 
> Shuwei Wu <shuweiwoo@163.com>

This patch series works well on OrangePi-RV2 with mainline kernel 7.0.0-rc5

$ cat /sys/class/thermal/thermal_zone*/type
soc-thermal
package-thermal
gpu-thermal
cluster0-thermal
cluster1-thermal
$ cat /sys/class/thermal/thermal_zone*/temp
35000
37000
36000
36000
37000
$ sensors
cluster1_thermal-virtual-0
Adapter: Virtual device
temp1:        +38.0 C

gpu_thermal-virtual-0
Adapter: Virtual device
temp1:        +36.0 C

soc_thermal-virtual-0
Adapter: Virtual device
temp1:        +36.0 C

cluster0_thermal-virtual-0
Adapter: Virtual device
temp1:        +37.0 C

package_thermal-virtual-0
Adapter: Virtual device
temp1:        +37.0 C


Tested-by: Gong Shuai <gsh517025@gmail.com>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
