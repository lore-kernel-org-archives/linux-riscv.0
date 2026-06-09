Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE5CCD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSoghCWNMpdEhtN7rHpPOU5zrkPixdHkU9pZ1DFtvEo=; b=hD+nberwCnOil4
	Nbvb04LgY/B9feU70l92pp2YBhMHiN8lzft1A/h8aKe6QlWkSuiByXvYLonKHsRICuh6UWSvm/nuz
	0buk1/NAHqIWY/sddJCIh0gPygIjHSAGm09NXff8h4cPV/HeU0IkBXYgrDBLgrt0ibFfxhzZKGqsc
	VtX40Et65937YpEMMVoRMOCqmkyRa8fUV+W4WrbsyhHudWtgFWwQ42tBqQDArBvIzfbg67nZ+UOz5
	SVEt35i8gPnEj/JkA29vCiHkv/9N63uDCqbaq8FMTpGZrgFA8Yyqa9HnfHVaI3T7Olc2bQTEP62kk
	eLe/O6vG2FeWAkYYuJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw50-00000005cAZ-22gG;
	Tue, 09 Jun 2026 13:01:18 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw4w-00000005c9p-1UUj
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 13:01:16 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so3905793a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781010073; x=1781614873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBjioe1/b2Df8x5Ip9K6/oumGB4ZieiSVwwEXmL7mog=;
        b=ko0reSednd/SF8dPz1GgjcnolTB4LW7U52wABMumtSi1FW4oLd/zKI8Nl304kjmQjk
         C8bDlqdqWrB2n5byg9TSNR7zk2bkPevCc3goBoPdUcMPC4uaFKwYRk6WMx5SPUG84Mwb
         vg/9UN+Hs67/votej7oGElhQuYFsIMeLQiQlw4xBnz7NNBZVsAVwX8xRMVw4Tt4xoTmB
         X+lk4KVX5N7QKhAvAj/cwRWNfyFfW29aVcwqt1zoL+yb9z+0NUkBsAhhymxCyPEDcyqj
         QwWwmhfS21YpEli28VwVA2qjBvdyWtq55XoDFZzBIzb+NfJsmbjnVP/GlW4aSak1mig9
         /4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010073; x=1781614873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bBjioe1/b2Df8x5Ip9K6/oumGB4ZieiSVwwEXmL7mog=;
        b=P94NT1TSGNohiVJqwbDb9whO+epvu6Kyp/EWUnPq3s7VeH9RIbnmYOPR3kC9cvBWSL
         g1ZvFSU/77MmxExMjkHwJ/6HrNukTroMzNUbjHjsB8gT+c7VgJEyhgvKGTz87OcPhvao
         R6lh42z7mC63EQeOW+evb1HLC2KWvqHgBO6IzYEwd0IKzfkXll/tFw+Tlk9D1Ayjzl9R
         aRoluEvA8i3ANRr9BbBh3TRsH18GLUiMrI2fJ2wp1FK0YwLI6077ARSsmhlsBuEkPcuF
         Ebm+muiSrUo83q27tL+NwN9VjDSGg2T9NDwGNZIGfxb8wJg27FtoboonOY2GMSqNeJIf
         EOhA==
X-Forwarded-Encrypted: i=1; AFNElJ/8Us9RBzJw9LfubpPFT30UyWvPV2uWHxn9TirtnI5C88bvCFn5x0R4Ejsvf1hJ3ZHG75Farcg8sCCGEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIAqqNsksKQcBnCJtrXdgVGCg8/yId86kjQeMZJbjbn/MDD9lS
	mleIV3cMY3b7+hqvz7MMfxX8i8s9+LUIH9A1WO3g7ufvSg6H1IynkKBWIhbud7lSp70=
X-Gm-Gg: Acq92OEzw2VqWqu+8eapcTXdbxxP8HCUFNFTmPNd0nKs9w+0ME/N+ux+PJxHSzoDoHL
	tgoLQamtMN8WLHOAeOp3suJsNFQI3FvY1MQopQiD6LmJmAsbBWZ+MW0eVeqGE0AiUbUi4SzREJy
	XGW/k2JL0ya9ojU9lk9P8cKPoOMwoW7JpHh9laP8iv3vvtqw8xG+ov737fSuwJfm4m/50GAgdv2
	CnpncroqXfJDKKYFVWSKPLfptOW6E0DkW9Kk9//a3in8Akw1flsDkDSUHjhh2/nC060GYQ51QF6
	JHS7YtjgIS541oWdoN1+z3SnMXjVoWVZi5bVlEgGSaOsrmt+7DHPGH32GSUJy3HeyJYZ4xhm5Un
	kGncd4DW6GpnOU+p4ZnwOKpYtJWQ4yZ8KtDaBsGFjzF8TEfex1tg+ZmhOnJyi1dcC9W6zcER+x4
	hXFBdW/SfeDWYw/nok3tGw4luWIj6Ava1ehQHmMK6z4OfrlyOCKM5lFmu49X9eMcb93cU=
X-Received: by 2002:a17:90b:570f:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37133372f4emr14653761a91.17.1781010072907;
        Tue, 09 Jun 2026 06:01:12 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm23267889a91.4.2026.06.09.06.01.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jun 2026 06:01:12 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v3 1/3] dt-bindings: riscv: clarify Svadu boot-time behavior
Date: Tue,  9 Jun 2026 21:00:18 +0800
Message-Id: <20260609130021.99899-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260609130021.99899-1-cuiyunhui@bytedance.com>
References: <20260609130021.99899-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_060115_210625_6799D07E 
X-CRM114-Status: UNSURE (   7.94  )
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

Clarify that systems which advertise only Svadu have hardware PTE A/D
updating enabled at boot, while systems advertising both Svade and Svadu
must enable Svadu explicitly with SBI FWFT.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..b09888e9988de 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -294,10 +294,10 @@ properties:
                of the PTE A/D bits or page faults when they need updated.
             2) Only Svade present in DT => Supervisor must assume Svade to be
                always enabled.
-            3) Only Svadu present in DT => Supervisor must assume Svadu to be
-               always enabled.
+            3) Only Svadu present in DT => Supervisor must assume Svadu is
+               enabled at boot.
             4) Both Svade and Svadu present in DT => Supervisor must assume
-               Svadu turned-off at boot time. To use Svadu, supervisor must
+               Svadu is disabled at boot time. To use Svadu, supervisor must
                explicitly enable it using the SBI FWFT extension.
 
         - const: svadu
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
