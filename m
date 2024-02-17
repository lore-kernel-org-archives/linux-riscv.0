Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E9BC48BF5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Kvhfc5e+MnauQ8maNtaPSxb+SVoeeU1pYh5MHvSnyo=; b=RvqYApqnd/oqU4
	7iOjCEvt9hSJmQJh8JuFL9l2fGcZ1TakqWK414U3qlvBtCTHlv5et9P0IxpZ9c8AXlznkg/h/U/G5
	tzQt794Vm8mwT66IfmScpqbpxNPTezWG9NlARG1lJku41199/YUTsJqaEUR38qUPyJFPalo+nFgJ9
	63ILyf5p/H8ufFGG4kFjFZzEKagAITw9/PEELWjokIWQiFW4V2EHdNPx/d0txIOadvYrRJ06kPBFT
	1T5TK1w5UEV/vZV/G90yX1XijcmNcNwEcwwPptQb0sNQUY8izxuo8DaD06uwEi8KEhX73VK9Kd+kM
	yaCf3cFGkGjzFcr7X/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb936-00000004Iq2-0zXq;
	Sat, 17 Feb 2024 00:59:24 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92f-00000004IRm-2fWu
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:06 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-21433afcc53so631403fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131536; x=1708736336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM8zssVewnxKekt4u8gJqVdaJ7ofC8o/V7nPW8x9v/k=;
        b=oFh8WNP+nVk4dgqXIJ3culYotJRJlclhIhANf6NYu9w+2tmmDRExpYHY7Gg59y6A4P
         5+N+kWnR/r7qRLL5CAWXm7MZLGTS33hgK+qAfc6RDhuSYD7MPE7pnPRPqx3DkxLm7ggU
         uwLFQ1cblMB72m/d1syvtZoVxT35xOfULj43E6JJ0gRtKWPfgH+RJlM67oSOSXXSG4xd
         IWddN6qcQn+XpB4nTkKCliKuJb1bBUegZm7LCaKDIESYzpAiU7gnIxqHDZranA31Vaet
         H5FC6UCw97aorzQagZM6g3LyhhhUZIjp1Gg4qM2qTljxetOVS7Fv4eFVME1crJc5JwK2
         ng1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131536; x=1708736336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM8zssVewnxKekt4u8gJqVdaJ7ofC8o/V7nPW8x9v/k=;
        b=waNciPmyxurdXvcTwwuADKbHF3fgkDGUQt38ywtPFRkrp3m8Gfy/chdZp/KSZ/LVTx
         dfh+7x33cUu/IgG9raShR9npM2UmQkfVt44bg+3wxdpbGwlIy+E3D6M3FPHMSm3XbHSo
         mYmLp4AIF9itO5Xv9vcN2m5x7KxGLVgvAGCl/CDVpqZik4evhw213mtOgSjyGKzgEUo3
         2vJecL2uzW9n1KKsolmT7qDwhiYAFnEKMAOgQ/3pXAatgjZwNEwnJV53ScYDirE8tvZ1
         B36XOpX4de8lFOx14tmUoebOjVP1/E7B494JDCC/cIIbPMQoA2jEGTcaQeO0GSyn36/7
         vmzw==
X-Forwarded-Encrypted: i=1; AJvYcCXdyqv7bomTH9vJpx4XXB2fX+y1OUGs8Z/3vzsvSz1Eia2u5SlqZpI4DgenyFvk6CK/DEUqLX81rxr+8QQDD5cspnrE/5evi5FqkrNZh7F+
X-Gm-Message-State: AOJu0YyHs1O1JHJNvrnWFhEFuNYo2fQxH8BBAmhqll7/MliPKtQxzof6
	XGtP72fJ6wf5cAEo+ymHDWWJ+uYeB8TsLcPZ4L8v1GXhMW2JCnq3HECRiYnJr5s=
X-Google-Smtp-Source: AGHT+IHxQ/ohabidKPISMfSUq9m2exq/kzmKZJs/ZvDEyG8lUk4zXZLeanKyyRpfmzqm9XJNLg+WQw==
X-Received: by 2002:a05:6870:d88d:b0:218:df68:87b2 with SMTP id oe13-20020a056870d88d00b00218df6887b2mr6753520oac.44.1708131536206;
        Fri, 16 Feb 2024 16:58:56 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:55 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 16/20] tools/perf: Pass the Counter constraint values in the pmu events
Date: Fri, 16 Feb 2024 16:57:34 -0800
Message-Id: <20240217005738.3744121-17-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165857_953735_B9C126A3 
X-CRM114-Status: GOOD (  12.83  )
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

RISC-V doesn't have any standard event to counter mapping discovery
mechanism in the ISA. The ISA defines 29 programmable counters and
platforms can choose to implement any number of them and map any
events to any counters. Thus, the perf tool need to inform the driver
about the counter mapping of each events.

The current perf infrastructure only parses the 'Counter' constraints
in metrics. This patch extends that to pass in the pmu events so that
any driver can retrieve those values via perf attributes if defined
accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/jevents.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 30934a490109..f1e320077695 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -278,6 +278,11 @@ class JsonEvent:
         return fixed[name.lower()]
       return event
 
+    def counter_list_to_bitmask(counterlist):
+      counter_ids = list(map(int, counterlist.split(',')))
+      bitmask = sum(1 << pos for pos in counter_ids)
+      return bitmask
+
     def unit_to_pmu(unit: str) -> Optional[str]:
       """Convert a JSON Unit to Linux PMU name."""
       if not unit:
@@ -401,6 +406,10 @@ class JsonEvent:
       else:
         raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
 
+    if self.counter:
+      bitmask = counter_list_to_bitmask(self.counter)
+      event += f',counterid_mask={bitmask:#x}'
+
     self.event = real_event(self.name, event)
 
   def __repr__(self) -> str:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
