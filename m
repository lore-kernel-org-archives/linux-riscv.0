Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BF9CA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 04:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDU8RZ3ATPNez7xe1IAtF8YMDNE/9pO/PTGWVee8sBY=; b=ca0sKAD2P9pWIp
	q61UI3s2l268VYWAA1miFuX0Ug4xuitm/7AiuMRE2VcKWbc7q+PID0xi/9hu2AlaC+m2tVLtqkiq5
	5r2+tTkmsdgEG4V43IzOTinpr45eZyGwM45ry8eHddFRzzdtqgMN9JeT2Tm7aIwDwU3zG3yNEwGbV
	+i5ywD/7C52sqwLDCd2d3on5mpLMJ3burEQ8UxkoxPSvfg/1RPdNuQIoyBQ9bWETXwFsl0AHzbaBm
	FfJ3AeinbdrlWgQvOoc5KpW6CgigNpanZS8mfczAouweV3PhgFii+Dqj66XUKEithQo3QhIMhYiwP
	3o5lVTfAbOo/Pzx9TMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZm-0000000FCYF-0YsT;
	Tue, 02 Sep 2025 04:24:58 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZi-0000000FCW1-2rjH
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 04:24:56 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32326e09f58so5239037a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 21:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756787094; x=1757391894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=Dom1AiD0zTkGGow8Glk7Xrun7A8EHnulMHkrRqtioRAO17wW5nwCTYcVAExsq5zQa5
         ztT9+K8vWgqbxYePsKeEby9qCCxQ4hWr7G9N0zvxtZ/tNr6tbkDgzcdk41OEDF2FQB2q
         inDXC2zZamiyt3/1q1imw+qBcsjC8M/vu6ms/ZUk6lft2tQ+CjFYAmKlLkUNUnvViqjs
         8mTdG6dEccHkMTGMh75g7gri13T6pBIjJf8x/eQ5KJNSiLUYTLALnfYsnQ1VaT6yX20F
         gmPziH47UuKadyg9h/NUYWPzwfKcqcvy+gs8/aRUs1f1eC3VbzAa5x84643/dqr5a2xR
         CY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756787094; x=1757391894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=YNVPhH6JeLG58pdYriDco2TBlZyQQ1yDt3BRY7fSOfSvQaUvHEPVa62UkkwxAy2OEo
         FON/0kNmdIHqmQvbtsGyMIHuIKJkQ4zXgi2uygNFFK/25cb217QaIs1W21DwI7HQzJrm
         OQ6SROoS9ZEAW/BG/ph9AeAaItnrCoECkV0KqkhyGpEajXuChjONDJjzBSset3uz9scU
         p76vEldlegyI8Fn2aM6YRolzMWrh/24o4JaO/oHhk++5Amjbp3yf0CkMAMs6UXbUQJM7
         HgpyKirF+z17/9aq57La3yg8DzUQcxzYpK5IfTTMtrD6FapFrlKRWRV72kXPEEBrRaz/
         xPrw==
X-Forwarded-Encrypted: i=1; AJvYcCXnPuZ8+bT64RyjitZ6IJQk7nEi3Djg0rYuw3fo4RLzMmE8YAnRIJHcMm/dGPcF5r3kUoX7PXWQXtB7VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXqrXj/HuEvw4YPhrQcoQptika1ybqyqlXl3WgEBxnwmwNVlqO
	narBRIp2rAFIqsWyrVOLTBpsiD5gKS8RVZyF+TVzLHyG94rmRes7IGPWy+xgaFiJYW4=
X-Gm-Gg: ASbGncv76MsZRXawrGwTi7eKCUUJTHYehCiUuUst2Asi6zue2rzdnRP6DSjI42FHyy8
	PIywWZNfWEp5zbiKyNO9h8lcLS/4E8s6QuTeirnzkDBCryYd8DYoGBorRfQw4BEQfTVxYNHoZq2
	Fit4dPFTrTnyXjk+U1YcZqO8XverA/44wvvFMwX6cMTM5FFnIHvBuAUL7rJnaXVp1GjkKdLv5HT
	bAL+joZgVk3L6k8OF+mjR3J2M6yHj3SrzKtpDmzzDQ3hV1UHYe4KA9hRz0YkIRwJYbjsiAzHcIM
	MMdeiFhbi6ZiwSdo47Q5AVSMPxfJfkaihoRTaEpmWq67pID8zoaIaLzXoaXMUF76jw+TE/1x114
	10MYi1kDsFPu/btm8kU4dH8PhB1vf48JDIQsSwGsAF4qoeu4/IO1crmQdH5Cf7QEOW5dEModaUH
	BgFiYZe2EVWUNGEo8pD5VfXcB4o9jVX+gR985r7Lq2ZknOEUFpbVXIXg==
X-Google-Smtp-Source: AGHT+IEnmNFl2IKFCyIgBswInELByShKQ4l0hZtC5CN4ow3TwqNmWqqVVXxHS00T0raVklLsDS75bw==
X-Received: by 2002:a17:90b:3c83:b0:328:bff:12ae with SMTP id 98e67ed59e1d1-328156c5707mr14802701a91.18.1756787093860;
        Mon, 01 Sep 2025 21:24:53 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e21d14a8sm12216706a91.2.2025.09.01.21.24.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 21:24:53 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 2/4] dt-bindings: riscv: Add Zalasr ISA extension description
Date: Tue,  2 Sep 2025 12:24:30 +0800
Message-Id: <20250902042432.78960-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250902042432.78960-1-luxu.kernel@bytedance.com>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212454_719475_BC5082B5 
X-CRM114-Status: UNSURE (   8.17  )
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

Add description for the Zalasr ISA extension

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf534..100fe53fb0731 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -242,6 +242,11 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zalasr
+          description: |
+            The standard Zalasr extension for load-acquire/store-release as frozen
+            at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
         - const: zalrsc
           description: |
             The standard Zalrsc extension for load-reserved/store-conditional as
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
