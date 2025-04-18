Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1057CC369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Us16VESVth1hEMQsHjBiFBMoGJHimrFGwIi8G+obwcs=; b=LJx6vSsSGVr8eF
	nDKH7KA5P63HRuAw3VGXjDF8waaG59+vedKyUjEd1bXXQU8w70Ryb6253M+8/+edMakjEysNn8cvS
	iqHjH+ADojzW97jg835jhc+k7GAyy3Wv2dZatsGF/voezFsdKNYhWTjdrfFzZmHEe0cVl3GKVIvjO
	IOkIjWkR5XFdL5F6KNrxbdDdidCBZBI7XeAGoQL/VlGSZDf3n14WKpi3RA1POz4vcLdxiuNE0I3Ol
	XR00jwDp2YKSTB9ECb/xc6rKDDqRTKqpn6PDReHqj+zj1i0j9vgstLSFRWF3Fs+srlYUWLOCRTIG1
	0iyuLGtBx8K5tWzjFFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fRs-0000000FIYE-1d9n;
	Fri, 18 Apr 2025 06:43:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eN3-0000000F9bc-3lxl
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736b0c68092so1321188b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954477; x=1745559277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeXD1vINQRN3QewI2Od8Ka4QLQVzf/gksNoTw/gr9eg=;
        b=ccaG1Dy9po+s04wp4o4PQAd5+9YYxBUczPygP1GvYY5Sukitc4Sfc3miWpV5CDwkQ4
         0zJVB4Lmmbk/6ccsHOt0S15Dd/C8l7iS+o3ObvTxwdiKw6vRcPwtPDnz0JVr5Nzo6XDE
         ZH4kfkaPBH9eS68iYGwBipmQcbJd9hzQ0BiiYSVbUg9KMh7zHA1IQkxM+urJw6Rt4GkV
         A0vbFZfLCz48d29NAa+7B1vjhrfI01y0ODWX2JxjY7v5eCQgNHjsyNnvE3IECPcx6N+7
         PkOn46GZNuTwhWTtcOxZ1g/9ZtiXlQ0OFpLuA2I4HqS4meTZaOazO6xgQa6ETIaxMd8o
         FRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954477; x=1745559277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeXD1vINQRN3QewI2Od8Ka4QLQVzf/gksNoTw/gr9eg=;
        b=oGfSLfe73NTxaiALw95PvD009DkOFpKe4HXXfYFpENfyTqsUwSI5AWapDLBipumXx0
         SXtGoo8t3DcG83A8f3x53kLkpDSePUk9N3DYRwmrOgHOIYYyAhZijZ1DvnYAslvGhXWA
         jJ0cvCS9L8VRF+NwmAtWVGoDNz9B3YAd1uxk/zbzdTWD24HhmujsjbEZJ0ieLk6ctFl3
         91vF35yLN3CIVlBsU8vcaJrCqZiQ+g4+e0Quy7jMETBJmKBbepIwxnENor2A4R1mqqKv
         5mWVZEZ/YnhGF/5e21vzm1oSAqlFUR/j2/l+TwFdt7MwvcorPwUjXnJHfYi4RSH855qt
         gdMg==
X-Forwarded-Encrypted: i=1; AJvYcCXI28OJVbxtChOzdcQTU6UOODx2rySHAbAaPzpnA9BuTxS+5m4wlxK3UwKlJWI1DotGE4p7ecW/Z1a0Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDIBFxZdtvTwCwSWuAmW4cZCEGkW1hcMEc4zi7RE2WGW4b835I
	QheOVS86DANJR7Op5mvGnFqj8xpCvtOrS6EdfaXj56ag6OhPDCJmDgWVSOfHsfA=
X-Gm-Gg: ASbGncudDare4zQBxlsQ9yyePYjFDeKMcRvqAMyAAbIX9cqbz6D1ThlWnKhQB6UrwNz
	icxQZNA+WoSuBvgmi5HhZd1AnfRC9Ryvu7pyYJprLnQEkIeoc0Fk/UM/JDICHp/HxPvd1ahyDkv
	fjxcmismuCQ53j3WrzyXaq+SIH3bE1RsocUKM2TwdjW3o+krtCAOaCwQLHr6ddDjLExE7NchD6M
	A5tMi1OjWVg0wD4epuUWk+BrpPKpKmbGHYhRkkR6heHOI0ONGB0UWsWbVMTajp1CW7+KR/qh30z
	aF0POIQ2virRphI2XZrKBxy4jB08tGnHr1M4kMdxb1vyHxZ0rsQ8twT0ekmHLZuUG8oZQL+iaii
	8
X-Google-Smtp-Source: AGHT+IGAIspWR8mvsi/9VEF9Vbfa7oFNnK4tZiRAuDzjqr+y7NEoN7U5AOdZ+OKJal+M1UQ/wWk0dA==
X-Received: by 2002:a05:6a00:4608:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-73dc14a8851mr2022503b3a.7.1744954476983;
        Thu, 17 Apr 2025 22:34:36 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:36 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
Date: Fri, 18 Apr 2025 13:32:36 +0800
Message-Id: <20250418053239.4351-10-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223437_946570_3AD31891 
X-CRM114-Status: UNSURE (   6.53  )
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

Add "xsfvfwmaccqqq" ISA extension which is provided by SiFive for
matrix multiply accumulate instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index be203df29eb8..ede6a58ccf53 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -681,6 +681,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
 
+        - const: xsfvfwmaccqqq
+          description:
+            SiFive Matrix Multiply Accumulate Instruction Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/matrix-multiply-accumulate-instruction
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
