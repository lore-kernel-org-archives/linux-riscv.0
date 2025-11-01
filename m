Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCEFCCFA00
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/G8orqEacevTQBHD8lTphQr7Z7ZYg+tqN2wKgC3uWmg=; b=r/E0uIP7KfZ/k3
	gebTX2lrnF1czoRbN7dIftRet1UXtDRpwyuxNAfI2y4J1zogRvB/Uv6NZcPvkQ/jr91B1pomHohAT
	QyMQVQaTJ835Nwj6OZthPtmjRFXJ7CCDCEkDMi6Q3hAu2OFF/uiQW7FiYCq2Nqh3bftXa35S3FSQR
	8oVl5N/SvyxJI9wy6juZ65ZipLAa8BsvO3NCbuN/5SnloKJOjnhsselpdJRiJ4Y1go12BZ6T4pSWi
	L1K957U7OkLSCEQ40w04iwwu4IbhnaWWCBcc5+hcml9yeESt8C1h+qsj6a8WCtTSMUOIumJII2OTD
	Asrpcq2rzBZdbhOhtYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDmd-00000007tZj-0poP;
	Sat, 01 Nov 2025 15:44:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDmb-00000007tY9-2g2T
	for linux-riscv@bombadil.infradead.org;
	Sat, 01 Nov 2025 15:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5DZT80TGVVkLsDEh8uIzxjLsAC/KruYN21Qem0m8wUw=; b=jfcoUw6lKEroEIG62A7ubhz/r6
	kLgrHqXYbG/ZzF2gXlj6N/FdcZBME0s7sQKSTkZ2Rs3VFQowGniFGsk/arJ9sKH/p1peA6gDWRyRa
	cd0e1lW/1om7BbrjVD0z2nadJLd8dq474vrkv5YgKvlEIs0OSmJiS//VGPLrV0Wukii13VQ/1FIxd
	ZoTqgeM2lGOJYLZlADCcuZrVjvdKeRFmZZJl8vN/jbzpfr8LjLbwYp3KSYFg0X7StvshbZFFpzMVi
	trpVRyGpco/JkmF+l+73T71XgRYsmr9V73Co/pDI0luC51wKZspNcJP6pH1/3dsTiUjkUKVf4/Tiy
	MAU3fEmg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCuo-0000000CuZ3-41lf
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 14:49:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29524abfba3so16644675ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011883; x=1762616683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DZT80TGVVkLsDEh8uIzxjLsAC/KruYN21Qem0m8wUw=;
        b=fDF5G6uaRkC3SFGTn+vCaXDtyLFXfrBsFQFUJtFnMakiTVz9ZlEwsyD/YVW3rWTJf+
         ggaSvZLFkfpdEjObNmL75bHx7rGgJ7cuQB/QLV8ZO5QN+8vk/XzVCxfU8rLv31TOHrrA
         t9uravFbRpEMoMYT/NfNlMmOtv8f9CUyp2BWG9PIEAYHC2Jo3ey6heetzlPLqy9cQzMy
         /IkKuKh3pJTFI29uEzJzKOGKb8COuTA3gVeEe4rFZe+YF+n5aGAQP4y2Fcd2LHxNUwV6
         mVPMyuiIUZRXvUOlR2FbqBwlGDebD47KjRaq9sIz+TqS7IsGgoPFZzkoe8ncWTfnbtw2
         Z3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011883; x=1762616683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DZT80TGVVkLsDEh8uIzxjLsAC/KruYN21Qem0m8wUw=;
        b=BqxlqRBEBdmVepe3/+GkXLufBbKeA0Huu7+/rwaLVzLSol58oPDU1VlnfKGtMIVKRN
         JZUbLe47NfZ93PwRriLbtWJKURsA23DT+qDQd3ewQDcrlYG1ap8EJ+pAqt2GQ6ikHZP8
         bl+fFWH8b5VbNpS0CA16P1Dbnirzev+2s3gDj9wa64keFUh7K6L/1RDA3/O1Ssj37LlZ
         0bCilNN72TRXpDKfUWfR4N+PCbXYpaHXc7On8/lMhF45BhLqgECq9tkauyUfNdwY9Wmp
         F6L5NIUGzmhpalY0KlaxljNNTHIlu6RgYywouOQDF+Ufz/OhSsvn57tdwdbwAJgH5u2I
         noYA==
X-Forwarded-Encrypted: i=1; AJvYcCWY4nEZwMPpkHv7QsZNBbJygDOlSi25h0TOupvSflMRnVBMVYYijNENZ2FdB48QvMeHhWnkqp4Gu9F7vA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl7dKnUBxwP/R5LXTxF7VlAXesgdZ0M0D4hbHUHax48Yr2Rw+E
	3X9dqbP6GbuPHVm9FG8vi6i0QsrR91fXEYK6plzPPdv73j1y5YLMexz786Kh4daNh7Y=
X-Gm-Gg: ASbGnctQu0sjQlRqfkYbZYUZAp+bK/O7BYypUE+rbvkDmkwAtfFPzPg8okIxIbPWLEQ
	1/5cRQXkzQD8/SubAdtMd6m5lqXVIOD90qsSQWfnkM2iyUF/JVnuOGT3GZ6/dQn0RUnRYVvQ0BN
	8iO5WLnUhlAyacDFxqLlx+5XSTxPXml/UNY27b67QOun2xbwT95uW/5W7/F09oHs78+VPImw9UO
	Ci5gtZO20TS64eX2YOp9cQOW6221p091moJDq6e2zaf36sPK/z4nBcY+ABtxZtPfNezFtqZDjOR
	BNO5rEPKbgHMJ8EJ9UOUIydKJYtVShh1aLfapYDUT4QMsJo5BavAXfXOipoIEeKuw8rp9blT6pF
	5tomb22MoT8p32PJuogB/k6tQzEUcbMnw7E9+rcG5vEyF+j7SZgE4FUrdy1+EYLW+U5Mv8WtthA
	3k4//3V4ebxW51Ew+pEju+9PszMemi6D/n95Z6NN140Q==
X-Google-Smtp-Source: AGHT+IFkhzb/ZLe6YUds3l2xBBPyiwCVMl/rVpbi6jYMxJtBM8rfwpjbkYfn40FDvEOmymUfcjZpEQ==
X-Received: by 2002:a17:902:ec86:b0:268:15f:8358 with SMTP id d9443c01a7336-2951a51e6b1mr86346225ad.42.1762011883058;
        Sat, 01 Nov 2025 08:44:43 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:44:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 12/12] MAINTAINERS: Add entry for RISC-V trace framework and drivers
Date: Sat,  1 Nov 2025 21:12:45 +0530
Message-ID: <20251101154245.162492-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_144916_574781_F83B47F8 
X-CRM114-Status: UNSURE (   9.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add Mayuresh and myself as maintainers for RISC-V trace framework and drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29e94a94aa0a..45718190cf44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22228,6 +22228,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+RISC-V TRACE FRAMEWORK AND DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/rvtrace/*
+F:	include/linux/rvtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/rvtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
