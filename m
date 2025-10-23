Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5DDCCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXksXYzGuNaZENeGE5D1f10O8B1e0FXDANrRn9gDjk4=; b=399ZGzYwgx+1W/
	AEs80LzCiYyWVhhQJuVTQUXP+YxDPdPSVGJY/Dd01kv/hDg52SwgldknkhNAUsV94ThzD+JKOUkRw
	pqCZYIxhPDnLXieytHtBzmilLseRYRbvmiELMPfUocYsVKiJQOsAh/wfczaKn4jAFgHMTctQNifh0
	QMdpaa3+mBl97N36iy/Z69bm2xB8APEu/ca1EqXMfXVW3imA02mSMBh+X87mixsteaYHugQroCkmR
	5SFhcf5x0/JKQizUX0+CasMjOjCPqjdQvTosecw/QMGJz777rn00rSk6/EIO/ZskvTTkwd6EcKqgY
	P3UVAe07M5VU1GN+gDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb3-0000000789E-223B;
	Thu, 23 Oct 2025 17:59:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzax-0000000787A-1pTT
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:59:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-33bbeec2ed7so1106047a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242367; x=1761847167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfBpxcQetznup7hF07KUJDBVrurA0aaR62AdWj47guE=;
        b=UeRLu4fGmkjU9vhSyToA4swkXKd0+IzEgW6jLokW0brZBHsLFgvRAIg6edbYMR1LRh
         IJY85FBY2urVB4bOn7DdRgkCNWuHIazehuMUt//bB7Ytpi3Jq79x5357uZ2ut0ghdXvK
         2ogVuYV4V/jtWqpbF+mt3a0EUSejvVmTvx4yCuE6GWM45OJTDFXylx8etYr0AuoM+kLA
         IP17LRU7mq0b3MfbQLPs5mtk4yFXk706laMkyirWmT1xvAtH18QTEpzISX3xSmihEM7t
         nRHOkCauCFRrQKmhUuhPiEghoTnF6wfcqNC0ns0l8tFDiEKISWyzFOYq8h9Y6hQA5QXc
         Ss+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242367; x=1761847167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfBpxcQetznup7hF07KUJDBVrurA0aaR62AdWj47guE=;
        b=MGLPJeXXQF+UvZMsWp6bOEHYOcm+aq3Keh3/dkLl0FDI7acWfFFzU1EDdtsnpLJ6fV
         EaTTydDNCJc/E8a5Sasm8vmgyDyr1dbg8FFMBNK6Y+IXyOqMw3Chygjo/0HYunWiEPtk
         wG8qln4KZulqd/W8jbXTlafhSmREllVbCMG4mba7OYLRarMHOfzfZ8Bp3IrCIvKFU6aH
         tQRRTZOp8uMhZfAbQbuaqBGKPnlSAuuJmf9IKZZ0IH2Vc4tQY9ID5s2GZbTai5XFlL1j
         3hsncCsve2Vq7Xa+NDmtgutLRuXJFSdfAC+bgsZzqyC3iYVQCffR6WvAryoGn08OJoEv
         vi7g==
X-Forwarded-Encrypted: i=1; AJvYcCV4jwl6EltV3DndIQXRmXB3BPavPACfbcRAKH2luO4cNeho3OmuKo107o/D+Rl6ShhNI30yt9CV/EkCfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1DLIGrSy1URL/iUI0qDrwm8pKv0mwX+ocjgEvcPwfQn8+P6pe
	ipxHUnHNXRB9WxuszFLX2lXWCl7H1XMxs1jmaIrQvcl+GTn11CU62rybBB3vOiRl/Ec=
X-Gm-Gg: ASbGncsIs8czozmpdQ+8lX+1guwHII3mi/hp1IkmyMRkd7poL7OpJndlA/cCuOl0LFB
	Baf7Ap2CyK5PqwcVYpfMCzruU8bSL6Miy1ALgkG+y3K9Wfhjk83fwWAj0DqK8lH15v2DqCwkou7
	szebkykf2UFKgt6YLcJcQ/c4zfQ+Q4vXXJ0jAw27kfGMnzcM3YdaaKpRXiJVqX7fn7u8TmtfE/o
	JgZk2hoEo7KAwqdmDRkHGCQ5BnpGCBKnhRruegeK/Kgshk0Gz/tnqOFkM8352a0w/7MPgy3OBVT
	a9P87CIx3DM+D9OF8AzccuFuVe1UBQW6Pf93DZVYt/URjRMEmrx+SwOU8rpQU247esWb1qJppsC
	lWsP2nAgrJSTtsqH8PNlUaUL4x15ZSxwwoeZTehbDoq8Q6nF9Cz1O8SczfE1IZc3PeQJf3o1wPm
	Y77XwrGmSdXYOIaQ+l2bRtCKZJx+7vFpAkEA==
X-Google-Smtp-Source: AGHT+IEiskDsftPBzROd2WKzvcPRxdNUDdrslLqgJ10XkgDdwMsWJwp/kE4fHkTeBllQGtyODL0OHQ==
X-Received: by 2002:a17:90b:4a47:b0:339:9a71:efd8 with SMTP id 98e67ed59e1d1-33fafc8fd43mr4507074a91.37.1761242366629;
        Thu, 23 Oct 2025 10:59:26 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:26 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Thu, 23 Oct 2025 12:59:13 -0500
Message-ID: <20251023175922.528868-2-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_105927_494408_C2D2D78C 
X-CRM114-Status: UNSURE (   8.22  )
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

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
is the first non-Freescale device represented here.  It has a nearly
identidal register set, and this binding correctly describes the hardware.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Point out that this is the first non-Freescale device used here

 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..5e6aff1bc2ed3 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx6ul-qspi
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
+          - spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
