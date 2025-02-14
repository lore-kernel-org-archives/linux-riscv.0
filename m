Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FD7C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPedYZhNtfMDJpeaIWUfLhIELuagDdh5zaEFwW6ttRI=; b=3O+Mk4c4d9v/lV
	hvLTETxJH5T4QebJuqTtRQ6ov5/y1GttFL4OmSfvxK/pTx/kC6iG0zsY4RhO5X/RsJvS8k9MAQEqa
	o4GveX4KmRrjVxQATOU6ylNkVVH+KSkBmk2g/Tzx7QOB/WkJRoFXdDrE8DeLh5RjbrYK90U4f9Hsf
	r+Rlb0j1yCHNv7rJRA6brKHCT1l2Xn6fYImASPNjGyGWrfNfEkmmCZJHSDZPFQw50Sb6ZJkmE8yOS
	h45WuIylKy5dbFTnauVLFaMzrOOAi1/mDKQvx3lk+l1XLVh0+kpVHwd47OEzE3mXH9eiZIVEHE52p
	YUet/GgxKg1DyRXhs7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixfE-0000000FKaZ-0qn6;
	Fri, 14 Feb 2025 15:31:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixTA-0000000FHd3-2IK1
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 15:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739546346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvaWRuIqMubpY/jSrhphDNgLxyWwrcegxArhQIPFoO8=;
	b=hcPq6ufJr2kidigwdq4ThKe2gkINr2r5Jq/uaPFUIoGB758OTrT1ctf0oAFVu+NsmJ0LDD
	Rhf6G4LcP/PvrhXHb/qZJSN0Et5OgpOz/XMEKdhv497tnFOY+B1FWyA3ovuoxDeRw+He/o
	pqjR7M1P77Mu1RqBzAWHhrmUmIIjQlY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-jebIhJXZP2WqMnxrf9h1Uw-1; Fri, 14 Feb 2025 10:17:36 -0500
X-MC-Unique: jebIhJXZP2WqMnxrf9h1Uw-1
X-Mimecast-MFC-AGG-ID: jebIhJXZP2WqMnxrf9h1Uw_1739546255
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4395b5d6f8fso12045515e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 07:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546255; x=1740151055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvaWRuIqMubpY/jSrhphDNgLxyWwrcegxArhQIPFoO8=;
        b=Gq13NhOM1XulkT0rLxIlTO6DUdRNpTZcAAQonD0JH/V3dl46DzPHBAQRDWuEhVJ6xJ
         NwUthxGGTvb3XHXQZu5LP74rKS77l3TxirJSEwPdJ+ktHT9tQZwOV7P9h0KrtXfzl1fM
         XPNSduMKjUaqVzT12VhKsywC1nHfxKj8RfZwCaNnEAjtZw8bbi7caoGFyq0HAPhuJzCu
         zXHoT9BKrRR+GNItoMYaNn4ZM6TvT54PJbi6d0S6W6mk4aExIWVAG5paV0DLUx8w6/sU
         StbqMgmeMSf3Gorvy2kI+tDC3LIXe2zsmMEWO0SVEK8/WeJ9cUJhCg08ZCt3IIWpxavi
         Ejew==
X-Forwarded-Encrypted: i=1; AJvYcCUzs/qrsYh2gqfGNCLsNfJ9JIX2Go3PDYJSZM0tYpmVnTAUFpyhW34L7sfZKuiWB0d4ZfWjIqvM+iRRcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyE1rIjSQhN8X3c41Jk5b/VWayVhmG1g5+7ubWZuqdPkxgeucAz
	akOQdeqXfmhr52DcZDJYOc2cAfonc4iQrczaYSxY/QRD8LM7HnhSN706gFwtIeSP2vU3xdP0sQE
	hGidz/rd2vv8Q5kZCmPjNc84oWZXCagWJBAZfxXFney6Sob1oOAbqm5jkExaTer4Xvw==
X-Gm-Gg: ASbGnctSOPT4zyUPuIDhBgDXsG2HmaI9oUKI533hw1oyAL4DE6vKnPijYT12i81ethL
	IOF+QJYPuGA1Wp0Ihm8Zc1it9H/RfSzw1fnOLCHXq1zWcxH8KJVLL5q20vun1nIY6l4FAk7q6Bu
	HEVxEoOvSak9ART87FZxGK2HPDworyAkBcCo3u+ThlgscR51lPsq7U81T00eZSB2ZsDnt+2ZiFK
	cGrjL+yxUkPeHhY1R8BwMoMb+yenUWV4657FAECsORMNpFmOk8qtCOPnRCJUG30/r5BJ1TC9rIh
	Fd87RDMcWK0OHM62J1o08pkPsqxGyQ==
X-Received: by 2002:a05:600c:8509:b0:439:4858:3c77 with SMTP id 5b1f17b1804b1-439601a12b0mr94439365e9.19.1739546254790;
        Fri, 14 Feb 2025 07:17:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ4cE6b9JE7HQ0foGmfeHs83Ot4ztX8SMgiEIT6K5P9Xu9N3qu7/a9sqVogpzuJ8xgB1pwiQ==
X-Received: by 2002:a05:600c:8509:b0:439:4858:3c77 with SMTP id 5b1f17b1804b1-439601a12b0mr94438755e9.19.1739546254333;
        Fri, 14 Feb 2025 07:17:34 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258fc7ecsm4808546f8f.49.2025.02.14.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:17:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: javier@dowhile0.org,
	rjones@redhat.com,
	abologna@redhat.com,
	spacemit@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
Date: Fri, 14 Feb 2025 16:16:37 +0100
Message-ID: <20250214151700.666544-2-javierm@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214151700.666544-1-javierm@redhat.com>
References: <20250214151700.666544-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _TqjeWS_9iofYl-TfFltNUJUOTyIyU8AQe2GkWhY8OI_1739546255
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_071908_646973_5E09E827 
X-CRM114-Status: UNSURE (   9.18  )
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

Document the compatible string for Milk-V Jupiter board [1], which
is a Mini ITX computer based on the SpacemiT K1/M1 RISC-V SoC [2].

Link: https://milkv.io/jupiter [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 52e55077af1a..077b94f10dca 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - bananapi,bpi-f3
+              - milkv,jupiter
           - const: spacemit,k1
 
 additionalProperties: true
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
