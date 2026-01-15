Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA18D3CCB3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIb1jtJ3wH3iZNcb1WK3dn/TK1GnLkuFo1DPhd0TqJY=; b=j8Qx2g4y/GzT/1
	7C++dPodcCLSFEooFx8tdtt/RkTgfTh3Hl0W9vmjWyBxAnSXC7FEyuA/aQroJ7kTv2uWQ/Dt+rkiF
	Q1wzPovyDRlDzMDHfCpWOCuLDxuYa4UyGxrodRRhjQdztKArMf8N3Bpvk2EYEj/cBhEyrscjUwlef
	fT4Fruo+k7Wmt8/xLV+YBdGzQt5nVBI8XiRlkYVo0Jx7oBmvt5o8ozw4Bz2X++VT/OTtLgk68uTio
	+U7LM9MgnDfiJvwJQUpMyyZ/kq3T+s58EwhUim0kFM/mNOAsSoa9DmTMQpuHSu81wjj5bTknKJP+E
	LDSWbNBw3QsnOhUxq1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDL-0000000BsyX-3tZI;
	Thu, 15 Jan 2026 06:52:15 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDJ-0000000Bsxy-3FTe
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:52:15 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a09757004cso4519515ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 22:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459933; x=1769064733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBZ/ScCVDVjRB+myzZeML8bLD+7O2F+m5AwnN8MdY5M=;
        b=hdoTz4E827TSCrlg8C5h6nE8UXs+PuQ+Mo3NsWE7Y4SZaSeBv3LrYocl/7ri0DW2VR
         xfq7V/B5XqlczpZazADANET5HvK05MGy3TfcsdBxVHwHRRHmhPecoz9prBmO/6IvJA2A
         8sEIZvZquaZ4F+EsE6Id2srYliPX76IWFoknZkJ4PePLaAgPxznGdJ4RabW1dpaL1zvk
         lePrAzL1w68qQ+1o8cF3MX0nDwLXVCPJQwUcuWq9RSy3sRgVmNa9TE8vazC3NT0FkQOU
         WuF0ffi95KCmVtmsIV/3zkBhAiU9rocLXnVOgI71oK+y7VKUxbvCl31cb0JC201+mB7b
         ZwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459933; x=1769064733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yBZ/ScCVDVjRB+myzZeML8bLD+7O2F+m5AwnN8MdY5M=;
        b=xVLP0O8jr7++axsJ730wWyzDXwmMbO5xfvGY1fbLNzgOsTKVSiYQ72ApkZBPPTbAgs
         20DXakRjKyhno1UiSZdzqNqNdTNcm7Gs8iRE24aUQyfmgXWfZMGeLjBcYvQMtDOnowgS
         k0ueUjkGrtZ3HMberJheLHqDGuy22CDuqMfOLXlXkJ6P2n4LJrETk/seEnmxeTtY8d+i
         xIw6Shk/vYdKhZkTry0UwGFz4vz5mD86nfw+7Do/ov8bON2mwcx+Zb3EcKMLNOibo5IV
         IxpCWmPd12A5+dNpNGTEKCxgtJSe2Vkr7E9K8Bfrjf2ou4NNjIFGQASFzhkIdsLQgP1L
         9dag==
X-Forwarded-Encrypted: i=1; AJvYcCWSb9HRD5BEoUnTogyItInyuCHVkkUqnkZ5inUqfH6gUl2wes1aNG8FjuuOW8PR55Is9UtFuqNhUEbr9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ/oD6M6FVn3GdBZyS9Xx3Ha5zQnGMTYRVeauLu6PschtPdyjy
	UVoMR280Ac9eXELvpUHts6y69we78/L9PdkfZqiwonsied2rz169xy7vnvBW9HzExRM=
X-Gm-Gg: AY/fxX4Z/IWUbfytd8/n1w2JJ4LjgV7NBA8fXgQgKPRMbvnmp+v8rFzMdKFKHnHCioE
	oHymuig66YS98I2WEwC6qg400zdPHZP/k2X8GzUBTdD3GLHmHbEESvB8jbxPaqZyI3OPUhUAs8F
	JYC/Td60BdvSx30YdIeyywti013FvzDlXRr3gp1INwR1Tkv6j2b3d+RQ+OAgk41NKlvZYeIXAtS
	lT7LvTed24k0D+WQYrxmcm1wyO4MrkvLgNsV/05wzGtmY1SRbHteE6CHkoWRPOd8VKKdlHLAZyK
	yCPiC220nLrHXZLiu/mVS7jnmtLlp8h25sERfB8EbrEoruDjVt4lXPsnt0sGwomr9SW4LS91SCn
	B/61OvHUi+a4dr9+Tj7pCHAj5KiuTp8SO42cM08ndCDWxXgCA5Vg2C3GXhXft7SAlDYdoXnO5tG
	FC7r2ToMUgK9rFdJemzhzOVqJZQo6JHKqMaOS7aVHLwdBcRc5vlyKT1g==
X-Received: by 2002:a17:902:f683:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a59bb1748emr52234975ad.2.1768459932812;
        Wed, 14 Jan 2026 22:52:12 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:12 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:40 +0800
Subject: [PATCH v5 1/7] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
MIME-Version: 1.0
Message-Id: <20260115-k3-basic-dt-v5-1-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
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
X-CRM114-CacheID: sfid-20260114_225213_825796_E86551E4 
X-CRM114-Status: UNSURE (   7.96  )
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

Acked-by: Paul Walmsley <pjw@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: Added Acked-by from Paul.
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
