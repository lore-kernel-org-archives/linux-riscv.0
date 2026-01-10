Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F74AD277D0
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ritvmcE9mG/rubj3e5kOfcHqBhUEzGB4PGDaXqSHwOU=; b=oKs+2/4kh++W5t
	MZvZx8CCx9Jt//kYShtdjXb3Fdc/lPf+oN9QLEU9N4bNl8GnhRv//qriGIbBwuMRKtHTlPA7dNijB
	rnfRM1278qFMHQdXtL0dc7QQpv3xSd+5UUvtq1B3sMPpjs7pY4ClLAZfbLn45cU0QOs/3KU3salus
	o8xflNhSKj//iumht26xzwna7YUN5Y6DaB4HE1VDQIq08U/pHm6iacRej33buB3CG2Dowca/XgE2S
	/OPaRnsfpS59WFSFIw56al9srt3ZQ0O8ThB98p0HVG0Zcw68xfyfqELupOE7DrdlhptHgeyrjuUZU
	HCwkkTTAH8qXNXknMyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNY-00000003Fqj-1edG;
	Sat, 10 Jan 2026 05:19:12 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNT-00000003Fpm-0SDU
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:19:08 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-29f2676bb21so43937435ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022346; x=1768627146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vZa4MSAEGd4aC/jK6JBtGhuF7IGt0ZyoCs3KPie1Vc=;
        b=RgBY6uwfh00E05tIroWtWC4Wcc4Av48Awe2F3Dc4vIkSzvTNHdqGULbkAQaN2bzcnF
         QzpMn+tA2kR8CAEunCMpk3ZOdBXizj+xxDtqC0is4PziERlqyhUdgrzj2XY1sQsKda04
         dwyEmm2HrMvvvtcWKw52Rbn+xty4V2dvHuklUi+4wLyZVFvr1AzfDxxKt0W8rT/EGIU0
         uo4yvOs5Ykt35JVR3VLDYQyKlk5IHdrK0dVKrOZFhwt2CdoYbdREtXDnBJprkKQqgg82
         DRQvxGSdEKLB/+EAvIj9e/U6pwR3ayxRzwG46qtC2yFOeNeUWSN9CiI2McPr2xFaWf3I
         2/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022346; x=1768627146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vZa4MSAEGd4aC/jK6JBtGhuF7IGt0ZyoCs3KPie1Vc=;
        b=Op8/RPMQxBHdWQ/XWBY7mquOp0ldhm8Nvr4SLlKr40XVvn5VxD8cWmattVzqJZ7f9W
         /9qTDT0uMYidF8Q7OKc2c2UrAQ23ETNwU4QiYnyE+PG+dl6o1V1R+UptQOrbW/2GmCDN
         KmS3BkCqSIqwlGYIAQiazlIlRvDyPlg+N6whyqOvMOzBosTECJNb2T/KER/Mcay8y3xi
         w2WidyeXi6KtdOvKfnF2hhHqT62OnNb9iHa1F7S8Tt60O2Lfre3KnhFwejLiPRoeD7bk
         AQWOqAyCq0tLeJW2MIWx1LhiB7iaibKl89T8EDIPB9ViquWl/PqX+BlmsO5Vab+DtgTn
         p64w==
X-Forwarded-Encrypted: i=1; AJvYcCUq2Li9WgRRqg40b7FCvyqtIjCu7BKqqHbKLg1SxYCqzTVuZabdGl9qC6CyS+//5GfLUKVlJl4qb4wn8g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl1sicKV99eIKrJoYtJr6h0N9r+zHrE+AOjBmLHi862dpghVHs
	C95w0wyhBlxU13fmKm99b6KAEUmd65HoxVW+jHrtPChw2ik3Dadhc6lMYKz9HVXBkZc=
X-Gm-Gg: AY/fxX47K4RtsbyBLYm7htEwQbwpMVde3N2BySWQhx2f8H2kBb8oTBjI/ubZZPP/xx2
	guJK1GWVa63HIYdYQBJfvTwUIoFUfuW7tgdEu6UG8HsBZCx5HLOggHJNU+cvbarRfOH7sxDuiw2
	uPcGtMv2iygBG8ntsAKE+wckSj6cLzOmXyNj32yvUHFgyaqQVRo/407cd3mC9XLY62w1KLpTLbq
	uflUunRzWaFAakyUhnZICebC0P0Fh1Zra6hQlVDGqp5CIJ6E97zTm5R34dbSJkIljcE/e6jTwOp
	aNYBucUtgx5hZdLwiPJ/Xox2lnvxhl42gGgV9ydvzp+q8IrOq1xiAhHFcktKcm8++8l0MFGF5qL
	B6C8Lw1aej0KNGKS/hIPR/jPtqbXZc3J+7VByjrzTdxEAw3SKH1bj3mF2hHvMhaYTW8Qwx3mNwq
	q688MvgqRgGuMkyNAiJnpBAxTR3PIKLI64iEJUSKfNfuanSbT3cg6lig==
X-Google-Smtp-Source: AGHT+IHbWq9DQ8nx6uG9JGFLdiLuMqyccmdPD516zDG77XGC4jrI6E+jtKCvRSSwQ6vvWdUH3x05HQ==
X-Received: by 2002:a17:902:e549:b0:2a0:be59:10cc with SMTP id d9443c01a7336-2a3ee491b7emr114403405ad.32.1768022346020;
        Fri, 09 Jan 2026 21:19:06 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:05 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:13 +0800
Subject: [PATCH v4 01/11] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-1-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_211907_155122_0400AEDC 
X-CRM114-Status: UNSURE (   8.47  )
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

Add compatible string for the SpacemiT X100 core. [1]

The X100 is a 64-bit RVA23-compliant RISC-V core from SpacemiT. X100
supports the RISC-V vector and hypervisor extensions and all mandatory
extersions as required by the RVA23U64 and RVA23S64 profiles, per the
definition in 'RVA23 Profile, Version 1.0'. [2]

From a microarchieture viewpoint, the X100 features a 4-issue
out-of-order pipeline.

X100 is used in SpacemiT K3 SoC.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: Added Acked-by from Krzysztof.
v2: Fixed alphanumeric sorting of compatible strings, put x100 before x60,
     as per Krzysztof's feedback.
    Added reviewed-by from Yixun and Heinrich.
    Updated the commit message to provide more information about X100.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d733c0bd534f..5feeb2203050 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -61,6 +61,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x100
               - spacemit,x60
               - thead,c906
               - thead,c908

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
