Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504F4ECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jsKbvz+vgzMfZANaNxG3mrgE7x7BmSASLNk2Sn3hGQ=; b=XEdBnxOIJCyvIL
	x4V2UEN4aAZW1bhZ6UYUkBzSdMl4oPfW+ItMwQ/ryYivY/nczJnWZgP7Pls3/XHKIajmvMRz7lUPw
	OWMBbK6wB0GH0HTwr4LOg8cRkRvvfLtWLt4lKCwCAjKJaPcrpKEZ6+L3N4SPPJRAon2DmE3/PJgof
	t1SRnlTEpCddZhycWjqIAt5KXc9lP94H4Lvjc9PMaPJv3e5CUlXXm6CkaYb/gKsotP30cuc01nQ3d
	46anBVaCQJ/fsgmU91pSF676QIGPNuGOEY2tfblLs6ZQOZekKf1EGcjdbFb3kmFz/J0YRarx3Abpj
	4+cDAgu+DMZGXg80xqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0iU-00GzaQ-25; Tue, 30 Aug 2022 12:51:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0iQ-00GzUC-7n
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:51:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so635901wmk.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7s4lILp9cgE/VG98/TN3p3rL3NeB7y+YGCWWz/Ak6qo=;
        b=L6AZHkI6qAhQKRgDVwck8jQPEP5pvVUbAewKRUe/QGZDUn6HXSmN7CBSKyiywVSxuc
         jx+z2pZ+bS6vETgwOq+5TPiOOZd/+INHG4k09nhpsh7oO7PbPKmVWluwQhTFnH7sTb+b
         TMfPZLKaY9wuJnFT6eo9KxVz+acW//pawvrgQZ8ioqEfagH4O9ZY4YJbhJGSmCJhEVqX
         1LGL4eQupDP+4Yhh4q/cg3pBc1mapDtk8g7hqBfmgV4vCCm4eLh9sZ+RYQ4XWP950MEq
         U8V5zPoQfGgNugjHqnYldO7xIy93uKBSjuZ578J8OsdSqOQs1yt4iX/9O38srfbRYIq5
         qWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7s4lILp9cgE/VG98/TN3p3rL3NeB7y+YGCWWz/Ak6qo=;
        b=yx0ACGXr+UajjJujkqJkvtTdQAudZ3jUsaDeGjvNS0UVq5MomXPGoKmLlJBvd8uk16
         Q65uabIG/h+Cz9zk3amZyeA3jzjR2NJdzN/KvPsncX84Ogt95IlNbGjJwbVBbiwfYnB+
         WhESwDYkcQnpa0A6jdoXHLYz4AsmQqrwdErQVWNYL4oSKbdTuMqmgJY+Eo+2Jwp+Mr9C
         WSYDrayFPEcLZqfc2tioy5cHqrQ3aKWztS0QUWffwLwO5iubPKVHeHhXBOV7L7WbtcbM
         7Vb3rzbqVuda4dmHniUWGnjVsIjS9LF6RXJSjA2+KvxSyBrgLS0wCN2w1gzCpzJKNCCq
         v3LA==
X-Gm-Message-State: ACgBeo1VcxHOC/uYsw6XLc3lozZ371dxnW5BQDnyg1NWBcwtPFsSK74N
	YbMN+wd8ZRSZd6GXn2jUSpJlfA==
X-Google-Smtp-Source: AA6agR5nyN9qMCqsMR5Co7UgnLcOiBBKn7+L3agUSkd7KYHf7KNGKsjAB3LwR6t08tkeAcEr4nLWYw==
X-Received: by 2002:a7b:cc85:0:b0:3a5:50b2:f9be with SMTP id p5-20020a7bcc85000000b003a550b2f9bemr9329439wma.18.1661863895829;
        Tue, 30 Aug 2022 05:51:35 -0700 (PDT)
Received: from rainbowdash.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c020e00b003a3170a7af9sm11778784wmi.4.2022.08.30.05.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 05:51:35 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Cc: Ben Dooks <ben.dooks@sifive.com>
Subject: [RESEND PATCH] dt-bindings: sifive-ccache: fix cache level for l3 cache
Date: Tue, 30 Aug 2022 13:51:33 +0100
Message-Id: <20220830125133.1698781-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220829062202.3287-1-zong.li@sifive.com>
References: <20220829062202.3287-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_055139_767589_DD7C7DF0 
X-CRM114-Status: UNSURE (   9.40  )
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

With newer cores such as the p550, the SiFive composable cache can be
a level 3 cache. Update the cache level to be one of 2 or 3.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 Documentation/devicetree/bindings/riscv/sifive-ccache.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
index 1a64a5384e36..6190deb65455 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
@@ -45,7 +45,7 @@ properties:
     const: 64
 
   cache-level:
-    const: 2
+    enum: [2, 3]
 
   cache-sets:
     enum: [1024, 2048]
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
