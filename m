Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B41AEE0AC6
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnN/yhNcLRE6Jk7E9iSTvQoLCGvus/N6dYTvW7GTvZA=; b=Rbd0cf/amXZ1FI
	c6/gXYc5TmrLdK+X+qGoxhj1osVfoTEeuYr2hCu/r8h9QAiwW1j3yFZZ8pSFd0LivY9ikb1AjZBLc
	kJb5jvoHAQuNdhnLtrPaZT7q2Htveq0UjxM+0SGlaMlFTah4CrITFCLiKNRf0XkZyXYpm4XIKt641
	uwmgyPDWpxOHnlIJru+1NjvbIhBpvPFtAtWHNSKU7ff4tiLBXNrX7k9MNb2TRjHFIZbpBF33jau7S
	nroFX7ttrfW6dab9V+FvJvOuknHT0jbGc+oPFwb8vkN7w98NyuwpeHXlMSN04HMdgNf4kp2lCn7ol
	NzoS3LMz6WVo4s5TGgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYI-0000000CKPv-3T4x;
	Sat, 07 Feb 2026 10:28:34 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYG-0000000CKOH-0Xy7
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:33 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c6c444e89bcso1064073a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460111; x=1771064911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOAi1IprK4L7LlGye/6aTRdwhXY6j5aC3PdeMBsR3Ls=;
        b=uBORlNgHOXIujlfGuarZSeCP9HOXAbFffPe2iRUzO0NtCFUXh3mAgNxh7w3yk5S91z
         H1bvndviOfnyG821i7nygkCNmtSvhWC9wzGlTEvvIF333UYo8r9MUSxj5Wt8gHeq0xLV
         DIBZjTkfLzTHZnV/MK2NxItF4e0sYEUzAe+n18fwaMW6Rk/FvJ4Ys0wBImpCRQR/asm7
         tXpmzbPy5xIYFOAZ8cVuFynkt5JiFxENOSTrq5Ll+UFaG7x0mW6DKEn1xis4DtpOzxwh
         6AeNlL137ZKw7eOZMgYjQIFlorC+QrUciAyP0mWrk54B3esPtOx9yO0nKKEPvVPHR+A4
         BXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460111; x=1771064911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uOAi1IprK4L7LlGye/6aTRdwhXY6j5aC3PdeMBsR3Ls=;
        b=WzXpSOqMjy7wrA0ryV36gqIFnpPj2M5ifh0IUsrBZWa1+r1ccPKSyRgBW7Y+4IVqtQ
         l9AFVD3VQQXiRS4MjsK/zy/tg5X38x8miN3l8gEqr0NYVo+8abvqlW/O67LWViTtlXRp
         jRjy3ELq7+H+lVKIN7rvNUF+ICnYTE/h/fOffWrPDiNwup9GTce55weh4JhVSYaTM/kd
         f3heo1EQWjZaeI2iapI9yB55pM9liZceW6IC+xT+NseF/8M6joqxTrXq9TNQwSf76+Lf
         thd7dbc8whugnB1nMH1+2vMwo060FLoWTDn1etUhHn40purfUbqQT81yTges2uEiQBgT
         LP3w==
X-Gm-Message-State: AOJu0Yxa73JmOMvre6DLIAgsXiJeREj9Nu8dj6dATuUQPtItBiDZMD4M
	bLy5t1UbXMS9UwLCbGazpKy1JXhMyJqh7NR0v/6mJ72KiXhAnuoFFjWhg5PIc65/ncExIk06b6M
	ialAmOQ0=
X-Gm-Gg: AZuq6aILgJQdLlwtoiwGAOftIkExLGGzZSDZhE5wr7hg0W4vh0Zn+VJiZof+m2xShQD
	6p3RlWnsytuaaiELZaErzarAuF0+wDEAOFKCs/pislvSHiicO2S0e1gRAv4Px+Xn6g8JFoumBPU
	brwogY7BoLGZq+XN9Nb6lRZ7ZFtlqvc4Zc5k/inkNkAi+e2USWfVhoMhEibHBUMkmcl8L2hADoU
	Ur4r06KsUpUuBO6jNRsw4iSQOaHDTbmZm5ZCE929qvjbiCSD3Qxb2aYbeZKaSJPevueN2usFKTs
	MO5rd9N7EDndikR/SWUzYp+zv2qJ/M/Ar/yLYwfO7z2SszNeFW20I7n/kW+gnhvQTSNa6HJIIeu
	Kxl1tDegvBa/TCDVxmEYNJbLYsLfmE5aQTf2KyhtRTn9asa9J+Sw3od4J0qOum4ILWxIr5uk4eG
	Qs6cqgd1oi++kH3j3SBuzyfjiflcQ7xXklFS5TE+OGRKyx7EaLbMUa+Q==
X-Received: by 2002:a17:903:2f08:b0:2aa:d671:fdf9 with SMTP id d9443c01a7336-2aad671fe76mr373235ad.26.1770460111138;
        Sat, 07 Feb 2026 02:28:31 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:30 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:59 +0800
Subject: [PATCH 5/8] riscv: hwprobe: Add support for probing Zicclsm
MIME-Version: 1.0
Message-Id: <20260207-isa-ext-parse-export-v1-5-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022832_178842_9CCE0A1B 
X-CRM114-Status: GOOD (  10.15  )
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

Zicclsm guarantees that misaligned loads and stores to main memory
regions are supported. This is a mandatory extension in the RVA23U64
user-mode profile.

Export Zicclsm through hwprobe to help userspace check the existence of
this capability.

"Misaligned vector accesses are only supported if Zicclsm extension
is supported", as clarified in:

commit 982a7eb97be6 ("Documentation: RISC-V: uabi: Only scalar
misaligned loads are supported")

Link: https://lore.kernel.org/all/20240524185600.5919-1-palmer@rivosinc.com/
Link: https://lore.kernel.org/all/20240524-ruckus-trickily-1cda26c1a455@spud/
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8430bc94fdba073e1e3ded973322c773c598a0b5..198b31bc9a20c2739988849cf7d2948a4fe1bdc4 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -395,3 +395,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_B`: The B extension is supported, as defined
     by version 20240411 of the RISC-V Instruction Set Manual, Volume I
     Unprivileged Architecture.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension for main
+    memory that must support misaligned loads and stores, as ratified in
+    RISC-V Profiles Version 1.0.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index e7bd2e9ea33459572d01495f4063e32e3207e48f..323c488de5548883ddceac256bf312ec854ee899 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -117,6 +117,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
 #define		RISCV_HWPROBE_IMA_B		(1ULL << 1)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 2)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 491af3c5b66a0cb30471dafc8b31c70df2f9bed1..6997c6007a8e86dff85b5b83d14924e7c2466eb2 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
