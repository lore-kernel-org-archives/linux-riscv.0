Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A472C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXNiCi927UI767K50XD7zb6dNlMrJGGipdIqCiE3oF4=; b=lhQ0XYlSVnjRaU
	8mojEsTOuZBAr1DoeUzBLeDxdRy1VRA1nL397S3N385eslmAF8WH7tP6NRv4pZhmKnl4piHrDo2KA
	SrX+KHY0xw0/XHPc4DizhWvzJ9f15EYT7lYTY0xJV2AQ7dKVR8ee5cFB3eK5sVRdcdF29SuFTDSXd
	M8WEZFg783gmYw3MYzihUkxG20sO5NuR1JT5MlDmyunSBLbjKTpbVxGcdOhvfLOBynyOp5j56kLbO
	nuDCgFABcgSWsLRbg0uz5KzYxkWS30ZPzRAuLXSxf/ok2N33nzf7lJkuFmnA4C0b0y3/+cY6Jrsxs
	wJhRJ4jbpkbT3Gzg0Qrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSit4-00BToc-3M; Thu, 16 Feb 2023 18:21:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSit1-00BTk6-2e
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:40 +0000
Received: by mail-pj1-x1029.google.com with SMTP id bx22so2712018pjb.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TvuJr54uYfZYo8HSlRmVGPkAT+/kE+f0Y+wFUBrfiQ=;
        b=T8ZVYzQ363zfTHRmFc9Jj62v2RoZaVNJV/KSLrEC3vZXuFiM0hJTn+RLJkF6ILJA7J
         GArJJR5zxRlWWcUdo50vWXdvsthFhIsuTgkdCKDo47kU8XsBJ29b1FymHg2Js835U/mo
         CEtDFau+/1jI1mXWRLBnP1SKWAduXmIY1avdHCWj+//ufeIXUlnRmWt1M/tHVZ49S1X8
         BGwXlXGsaHbjRi8enrhc7NwEq9AKnN2ZUDIvySSMJNmYsbmn1beDmvNsglEV0svadKar
         6ptrElsOtU4YSa/V+Mxs9dnfeRU17fORaYp3yaFy6yiycz8YTqNd/lGtv2t/s6LLgUXB
         GrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TvuJr54uYfZYo8HSlRmVGPkAT+/kE+f0Y+wFUBrfiQ=;
        b=yBEqPAx2gh8VOpy2aiy89y1LZFdU/SV6WqEW1TlKIbTKVQJJVc/pYTMdUq5qGp30WI
         /5I9I4W2x7e7tt4YuL+p+8dqAJMGn9boMYT1L0f8hAGeEeopCyARm8NCzM2l3uttEfIa
         H3tJdhsSQ0AIxyDFgpmc+Nu04YahmfwBduto6pLHBjurl/STi48yKE+/elhu5k11qv7b
         SKEo1ZGLDxfOeZLr84Kby0/MyM1dE0pFk3tcgjI7jUXzFhqhX3tophmLFObF1ic8dF9H
         LxziWhubGsZ/3hhYyLWwApgYNpxLwiTV703ZAWZa8ckH7lo0+qm5limtj/ziwaKoNnQH
         dxmw==
X-Gm-Message-State: AO0yUKX2DT1jCdriPRceF9v+6YDlXiENNeQ6237zH40bJJfihfaoeWET
	5+f5gnLUSVLR0u3F6P3xd/mV1g==
X-Google-Smtp-Source: AK7set9+BdbKgkpHzRAqTpNzOousZHvPUaa1x+OuyfWcWse1hD2JwD3lY47+FfAaFO3tCGLWbbQP9w==
X-Received: by 2002:a05:6a20:7f92:b0:c7:1bd0:c575 with SMTP id d18-20020a056a207f9200b000c71bd0c575mr4133361pzj.19.1676571695888;
        Thu, 16 Feb 2023 10:21:35 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:35 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 09/21] RISC-V: smpboot: Create wrapper smp_setup()
Date: Thu, 16 Feb 2023 23:50:31 +0530
Message-Id: <20230216182043.1946553-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102139_149632_EAA0E483 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

smp_setup() currently assumes DT-based platforms. To enable ACPI,
first make this a wrapper function and move existing code to
a separate DT-specific function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 00b53913d4c6..26214ddefaa4 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-void __init setup_smp(void)
+static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
 	unsigned long hart;
@@ -116,6 +116,11 @@ void __init setup_smp(void)
 	}
 }
 
+void __init setup_smp(void)
+{
+	of_parse_and_init_cpus();
+}
+
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
 	if (cpu_ops[cpu]->cpu_start)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
