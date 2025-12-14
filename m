Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5446D59D99
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 22:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFCHWRaUVM/4lkpqfX56onbT5o67IZqPkmGpCczX8og=; b=l62HyUUHgBxuD7
	Eyo/CmnWaGYRHUxtamqDvQsjAh1mGSZoZJNicakDCmlDs0V3clpAessJmC3BFp6JTHXWXetGRte67
	YOdfIHPiLD+crxL1wJ1ElBtSLmtDki2t4eant5jRIVAxj2rgKDhLqCvkavN+2Lfj5I0G7i29mIA/t
	PsoQOJ+ILOjHzng8uY+g/rivS1sNg8HjGvU+bFx3KADAJh0IAZiOZeWepEnmtI6lUiOoG31FSdlrt
	S1DVsn0RSDYwrzo2lqZzMvjEiRCwKtirt2BEI6Bsra/x3HqMj3FkBsgvhpTDfMiDvCEC3hc5GkNdv
	+YL5k4MslE3bGmKkApDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUurv-00000002oED-3JGF;
	Sun, 14 Dec 2025 22:47:11 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUurs-00000002oD8-3wBE
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 22:47:10 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso2867673a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 14:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765752428; x=1766357228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2L35WsEaTxvf/DBI91MAjfu5hKJ1Z5i6X+ns/IiMxg=;
        b=jxXoykUk+VnLSSXZPeNDkyB1G+hFzqkayxe9QxBJ6nUaZx2cmGHivLHMwGKThYozUv
         TOEQm8XGXr6RV90fG1VIslO5Vtypn8N2XLDe4HfcySY9SedHqgdEm/vQQF+bhT4bu/My
         g6o0vgnzUmoS4Ng7fKH9VbpZ4s1mNQbc4/0zw051YrVF0X4tP5tjXvxtZ+tIECV6jtF9
         ICp8NZReJy2zdd63OcjKaXndPxq6GKuBsCBFugOyTlZtoh53B42EXQLvVTRchq8KvM00
         NTgAq0821jCcCNP65T+8ZsJ9wQbvnblCeYi1slNyjQj3TK0csYOh9+YQSKZLvgEyvDPq
         rfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765752428; x=1766357228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2L35WsEaTxvf/DBI91MAjfu5hKJ1Z5i6X+ns/IiMxg=;
        b=YSxLIqzAPCRu4WOj/iXqGWKwiI1Cdm/FdZ4bgO101V6rdOWbWtPxPe+v9qJFNXbXOQ
         X+3T5d3cKX0EsEf0fppJwvycucmw3RtWgBfLdqgrGIDg22+j9NBf7GIIhZZRbfwQVT8e
         BR192wTz9WGqqQ5iCUs4V6EdbvN6sqmErGcVcmaajOGGQlMpt/p3vw2X9Y98DwfP1pFX
         06KFr/1TsWrD4mOjcTIxy8WNos47qXffMXCQo2LaP4qxMPq0epCGOAgJjIPTIIQWWAbk
         j77rWbLkBFQ/rNmP3zOoJjEvgxD3TLfIev7VYwuZgcg0KuX/BkuP+UFhEBeK9nxZ0sl/
         j6vg==
X-Forwarded-Encrypted: i=1; AJvYcCWNsSdbgzTOlYD6aQUa7M5lqckWUVi5hhfbicJ5VEgi+GWlCE6Z1Y/HJFcCr/iH9DjVCatiSt55mtJyeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQp3vdLmS4wNMGnSjEP634Zw6Veh7Mgsbb2Ei/fHVrlAagLy0G
	/zXadra0YGyE7nWshB50NsHZoN0W3SvZZXs8+3Qfwe+jyLRJ9LtQUFD5
X-Gm-Gg: AY/fxX430vm6AQEmtW+K3/oCtH5jgrmGAlpPMgK4ndhFs9Kpa9iyPQ8ZoAxg5hbYVK1
	isPoFgLIv0XI4MwXuDd8qO4wXew0JpVj7QYFjTfmey0paZnDaPXsni6+7qLQpn7NFXPE1KuFKHw
	eJ3akLUIJaniS1Y87o3sQX7I7OEGOIQBFI/W6AGSvlxv+/9LjjvA60JAYfWYhmnXFzaFwuKaFJ0
	SqgNZ89beE+nfiUTvJVNu4DQ8VfwfPb5yVT6Z5V7QgDrp/kvTrzWsgmWFC92fukkymbmtUm/rqz
	1+BskjsZL2/GPoyGuTxYyRyLyf8XmuCuN6IJAWGLxb9+JVgX0c3kWbPiB1delAl15TfJdumI8e3
	cULhhWZWGp/sC99eCkgRjyQ5qs1rvt7P2NeembOqHOKESTErV9BOq10WRMp01edeglV36kHJDvy
	VoGgfwqgE6bA==
X-Google-Smtp-Source: AGHT+IGzU40Bf02ZiunUmBQwqZQkwop4QCe+bNWbYKaguM5GeKAWWOUq5wkMBFK8h0HWejlWKzSlNA==
X-Received: by 2002:a05:693c:6014:b0:2a4:3592:cf64 with SMTP id 5a478bee46e88-2ac3018c2e3mr7575976eec.8.1765752427907;
        Sun, 14 Dec 2025 14:47:07 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac191ba0fesm25394683eec.3.2025.12.14.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:47:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
Date: Mon, 15 Dec 2025 06:45:58 +0800
Message-ID: <20251214224601.598358-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>
References: <20251214224601.598358-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_144708_977884_DD9F2155 
X-CRM114-Status: UNSURE (   8.27  )
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

The DMA controller on CV1800B needs to use the DMA phandle args
as the channel number instead of hardware handshake number, so
add a new compatible for the DMA controller on CV1800B.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index a393a33c8908..0b5c8314e25e 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - snps,axi-dma-1.01a
       - intel,kmb-axi-dma
+      - sophgo,cv1800b-axi-dma
       - starfive,jh7110-axi-dma
       - starfive,jh8100-axi-dma
 
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
