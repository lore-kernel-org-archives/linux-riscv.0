Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADFCC48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 00:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s3RzS1SmwQy5ZaV2pyAtkGcM/Uxk8N9/QOdwgiTk7rk=; b=YkD5M8Paebz9el
	c74SowtTmi4KD6I7LXKgDY/i2zIlPxxUlVIqAa3OqJu85XwvTQTJZDU/05sHHIFtb5deC16GKl7DO
	1sJciedXPOerbvDKYBdc0UNzmp+bp6WEgA1II1Ed7pvFldwVYC7suNYy0mR21g1n/1TJaJg3GfIqN
	aKiHHYM9Dgg6/5L0F23XCMAB2sBPf7ZcRXzyWUJiKAQ0P6Y5Y3TtdF1DW17/3SjUHqRGeiEYS5wUT
	OHCKS832UKcOJdzkNHzmNrqlwf6mMPlkLiN3Mh8XuYySvSjMph96jIIYQzVfxCgnT9EsB3OUVvBU/
	h8ZUi0KJ+yp+RYqe6MfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralmX-00000000YZe-33aB;
	Fri, 16 Feb 2024 00:08:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralmT-00000000YXl-10OS
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 00:08:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d91397bd22so12249695ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 16:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708042120; x=1708646920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B80341bISXEJg7kkhbXc2oX5/huCFSNjahGhVu6ondM=;
        b=QUHiZbokMLBGif8hqB8tT5HoakGoyktNm7IBfryD/jqSyx/k8hiq/OgIrXtI8mqSil
         zx9C8fO1UUGfV243e2r7tMWHn9S2Oy0bAfDzMp0hnz+eVlbvKZiGaHjn9xALE0YSAPVw
         TdKOExzW8e4YH06ZuUDQfTOhopI1YqetNdXXj9EYxTkA4D5qvn9VtlIbF3phDQ/Qr2Ut
         UCMK8xPT/TGaSYp2qp1yd44vZAfcrhMuAxk2JF0cM6nDj7Rzf8Mkd+xW2DDN6iaHvy00
         rSNBtu7ycAPB6+CwEDYRbO5a+DclKSQT1D3mC+7nxdF20R7hP0UFzG3c8y8aQZcNeM0f
         K88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708042120; x=1708646920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B80341bISXEJg7kkhbXc2oX5/huCFSNjahGhVu6ondM=;
        b=daujhUQ/Trr8NwKu5FPbWpsCRlBGiynXMdybZ9+M7oVV2rbeAj6SoCuP629yYjIBvG
         rusWafMfM5pjKAm3l9GCdGBMV8s2+u16K7HL2oUbva7lwKeoFgyE52gfL9S1yicmsjam
         SIPqB2ox2dHWtpy/JAIZHQfZg4XdhTD+vDxpSwN7g03ssVPWRTOAL8UG2HHxQVmwgze+
         LnKaSqhRD3TzuWihaQepjqbv+xULVxIe/j3SCHaHR+8V8pC/EHJTH81PZAqLtwXyzAwx
         QGN5SDyE4XqW2G0D6nwdYBm7OTwV1Jd+ukBYzAsuOZUiWjNLfNPs4qpQk58T7SZQ74Yg
         vxbg==
X-Forwarded-Encrypted: i=1; AJvYcCXo6lRqjRS6Nvsh2Qq3fjlkwDG7KPcxijdN1/XIyin+2mOkZ3ew6ShFxXc3FFat8gbUsvNL5YRC58lHXxffXKQN/6NZLDabYZCodUYpivq0
X-Gm-Message-State: AOJu0YyeXHHMh1lm40BJhbs6hXVdAciuYLgrw/diGD12RZhPxyIE1cKn
	ZL6/Q3zEMBgFrQmo0vdvXoVZMP6Ulbqd0XJLN2BUsjgOkCytiZ7Ol9JLRZLgnF4=
X-Google-Smtp-Source: AGHT+IEEuF0c7LmW9lUaWum18fP3MSd8qAJyzAs9OeCN6ADixKHSo/WOUDyw9k8YmlyzkxoW0t/waQ==
X-Received: by 2002:a17:902:e843:b0:1db:299f:5b0e with SMTP id t3-20020a170902e84300b001db299f5b0emr4475230plg.1.1708042120079;
        Thu, 15 Feb 2024 16:08:40 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bb6-20020a170902bc8600b001db3d365082sm1789486plb.265.2024.02.15.16.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:08:39 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Lin <eric.lin@sifive.com>,
	Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v1 0/6] SiFive cache controller PMU drivers
Date: Thu, 15 Feb 2024 16:08:12 -0800
Message-ID: <20240216000837.1868917-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_160841_317130_D468E1CF 
X-CRM114-Status: GOOD (  18.10  )
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

This patch series adds bindings and drivers for the Performance
Monitoring Units (PMUs) found in three SiFive cache controllers.

Composable Cache and Extensible Cache support system-wide profiling
with a single hardware instance. Private L2 Cache supports per-task
profiling with a separate hardware instance per core.

All three PMUs have a similar register interface and event encoding,
though the set of supported events is different. The Extensible Cache
additionally contains a pmCounterInhibit register which allows
atomically monitoring multiple counters.

All three of these cache controllers (with PMUs) have been integrated in
SoCs by our customers. However, as none of those SoCs have been publicly
announced yet, I cannot include SoC-specific compatible strings in this
version of the devicetree bindings.

This series is a follow-up to Eric Lin's series "[PATCH v2 0/3] Add
SiFive Private L2 cache and PMU driver":
https://lore.kernel.org/linux-riscv/20230720135125.21240-1-eric.lin@sifive.com/

Changes in v1:
 - Add back select: clause to binding
 - Make sifive,pl2cache1 the fallback for sifive,pl2cache0
 - Fix the order of the reg property declaration
 - Document the sifive,perfmon-counters property
 - Drop the non-PMU part of the PL2 cache driver, as the config register
   save/restore logic will be moved to M-mode
 - Add missing events to PL2 sets 2, 4, and 5
 - Use event_base and config_base to precompute register addresses
 - Check event validity earlier, in the .event_init hook
 - Implement .filter for systems where only some CPUs have a PL2
 - Only allocate percpu data when probing each PL2 instance
 - Reference count the `struct pmu` to fix unbind/bind crashes
 - Probe via DT since the PMU driver is now the only PL2 driver
 - Allow the driver to be built as a module

Eric Lin (4):
  drivers/perf: Add SiFive Composable Cache PMU driver
  dt-bindings: cache: Add SiFive Extensible Cache controller
  drivers/perf: Add SiFive Extensible Cache PMU driver
  dt-bindings: cache: Add SiFive Private L2 Cache controller

Greentime Hu (1):
  drivers/perf: Add SiFive Private L2 Cache PMU driver

Samuel Holland (1):
  dt-bindings: cache: Document the sifive,perfmon-counters property

 .../bindings/cache/sifive,ccache0.yaml        |   5 +
 .../cache/sifive,extensiblecache0.yaml        | 136 ++++
 .../bindings/cache/sifive,pl2cache0.yaml      |  81 ++
 drivers/perf/Kconfig                          |  29 +
 drivers/perf/Makefile                         |   3 +
 drivers/perf/sifive_ccache_pmu.c              | 577 ++++++++++++++
 drivers/perf/sifive_ecache_pmu.c              | 675 ++++++++++++++++
 drivers/perf/sifive_pl2_pmu.c                 | 748 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   2 +
 9 files changed, 2256 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/sifive,extensiblecache0.yaml
 create mode 100644 Documentation/devicetree/bindings/cache/sifive,pl2cache0.yaml
 create mode 100644 drivers/perf/sifive_ccache_pmu.c
 create mode 100644 drivers/perf/sifive_ecache_pmu.c
 create mode 100644 drivers/perf/sifive_pl2_pmu.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
