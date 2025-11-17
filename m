Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF089CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iZFT50A7CfRB3ScO20ZIZzhVHYGKbG6yzt9lFsbL0NY=; b=DFuRJi87HZftCc
	3NcPuBrlaVISKunN0m/pdOu6dy1QVar2+pm7gvxy1t0EbSgmQpgFSJniDaFFjNjk5+7aNgp4fq7Ln
	a3NlI5DMRXDRfugFscdTiBJjidJqtH9BHnFUtZA/SlNRaMKxUgAdZfgndtkHtdCVBdPZR5ezkXvq5
	KdcTYQlX/USENpBk4dX5yLlI+sKa6SvCWFEu8cFPQsab/V94/JnVtVT2sLdypY6mH7nWYXJXQ+xT6
	7opf+PJL35qWiu4eFS5llvg+qKK3oGKyRWq6JboCdqxEOJhQboI+f78bjVH3okyfiGbCEKaHS/FNV
	6YQSph18ok8WA7jrSSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwfR-0000000Ftah-29RQ;
	Mon, 17 Nov 2025 10:41:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwfQ-0000000Ftab-21x1
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Nov 2025 10:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kAUfjZ6BVnYL57JWajx/Z1xJhvt0maWRmCYifK1Tonc=; b=ghCzAgJEoMpncM2E0FNiNK+LM5
	sqUSEeCXLHs0t0N9jFJ1s8LmVLqSu5jolj+GR8m7UA2+NBKGVgbrEarwy8pV68PhXQecCzd0A2xwM
	fLvgp17IzTl912qaav+cZ6FBnKnts2lOUzfVUUHxobdQa1Uwc0YIgvgTmY1fOh1ISoTju+r7FPt6N
	c6TGqBW9dkbin8e4CJ0tgKcZWpqDz10RGo0ODGMx2TxPBhpXsgep4w+4HULzbbXGeasnWO/01n7si
	wAQ4UhF3qNz0QzTSDz9XXqqJiFetGW+hrZBSgM6DjE4J8CKH4DDLpUpDfcOJJ/SCe4f+diwHFRnGJ
	kVgbknNg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvnj-00000006wod-3966
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 09:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763376050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kAUfjZ6BVnYL57JWajx/Z1xJhvt0maWRmCYifK1Tonc=;
	b=RraCXQbO23QfgOHaZMetKIIj9VUqiqC7z9Q05gq5ldw2cTE+qjPTznI8KL/XLjHiWMrBR1
	iqPCtRM8VR/4L67mMj25ftKeSRoKdUZVElMiryfWV1dCuiWuWVUwfnti8Xpp1L7gh3aahJ
	iCln3YHlrZhr3nXeCkw8M80ahDTL/GA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763376058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kAUfjZ6BVnYL57JWajx/Z1xJhvt0maWRmCYifK1Tonc=;
	b=VskwVIO9R0cBWsfOVd9CVPBRKK7FOTrbJ0zkcwtkqjnCP0qgzKv21DSgqdL5+1gzA6FDCr
	8X33MNM82I44AmMndM3ZjV+/hWy2X6WI8dNI9p23GMwYtb/U5rFopfAXy2vJQ7XBPE1vxz
	AqZdUq+ctO/jxYqvtNt6AUBbvM292KA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-bsOAykWeN9SvhFfBKYnb5A-1; Mon, 17 Nov 2025 05:40:48 -0500
X-MC-Unique: bsOAykWeN9SvhFfBKYnb5A-1
X-Mimecast-MFC-AGG-ID: bsOAykWeN9SvhFfBKYnb5A_1763376048
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429cbed2b8fso1646663f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 02:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763376048; x=1763980848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAUfjZ6BVnYL57JWajx/Z1xJhvt0maWRmCYifK1Tonc=;
        b=uJ8IrKkjBu/AvloDvpPnmeLxIu2xnOFHCoUszw2P4oEv9alVx0mitVC58H0RMifTDO
         gw5mat4V4JAfnI1Yln+YSWsG5u4nyfR5CVF9rxCHLS2diwltfoRDN3Pb1tFIDzZwWfE9
         9ji+RO/mzIb7oLJne726iqrdjf8iHBI6ZQXwhar/2ihYOsQI9/bqzbi0zikHH3elD3Us
         W9Ym9Eb8Ghs5HoEmv4EQBg9uhk46BOXVmuBESshmAzdcN67F00TEwRV28YOe7x3ai2BI
         EMkLEKNl/R64bD7ee2Rb9RVSsa85LexmLr5kq0LEegZKQR8SkxxKdflYRsD6rrnGs5wi
         hzMA==
X-Forwarded-Encrypted: i=1; AJvYcCWdh51ejLNWAns4vXC9klGx61bJHsHSNNt6C/UMs7t3So1ae4SeBpkJRFxnnJ2OleNXL0sb6KB3JynJQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxgVYLlB6tg2G0xyY6v0Mdn80BvG0g/zybPHXJAvNznps9jmm0
	1Y7JoSegWGBBf4c40Q6TgLM4wRuyIOwiWM7uKbE9ni2Ja3fjG2cGd6Bf9C85THwbESSIheLYZNU
	UIoHabcachXACp/rR0tywWQ1Ow498Lv+XdbVgwSc7T5jqA55PtCXvZ7zOpUrxMAfYylR47Q==
X-Gm-Gg: ASbGnctNUsE5q81xCtW7lqlCyj/IDZuttpOMUjRt/OS8iET86sY2MOEcwiu3MNbC0x8
	v2UDjtL0I5CIG7hPzcCFohMlSG+/VLfx+kyU3QcwMNenCSXI1niD5v7kgvThYdW0lHItIJ1fGc5
	TT8dC2YpqHPJhnlMEqaKispTYz3mP0AYJurRnsMBGM4cvqYQtkyMWGrjcwkbpiNAuhQFQ++V33j
	7Kdy8uUBhZzNv4krD5OXRhcZECRWZy5OscmVthlIDWixqBW39qL+gGLKQi/cukAbYtDqdJ5W+/e
	AW0HAWc/pPIkc7KHDzHcmzgddIscBHoCx57CwzXV6BJwbS71GxsEfrNsZ6+yhwPPGHMMcpDaGh+
	5yR/spHiHmc/ey5Pd6sP7lyCv2eGJIeUYj1UQJAQ4ZIui7+J3
X-Received: by 2002:a05:600c:1f92:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-4778fe96324mr111237935e9.22.1763376047729;
        Mon, 17 Nov 2025 02:40:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDlPS2oFFSJ+IKiQOcZ0dVKJrAeryW0seKkZC07kxLfKJ//4N95dOnEcejlq4qUG/ZdKbm3g==
X-Received: by 2002:a05:600c:1f92:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-4778fe96324mr111237665e9.22.1763376047320;
        Mon, 17 Nov 2025 02:40:47 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477991646b2sm130447715e9.7.2025.11.17.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:40:46 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in RISC-V MICROCHIP SUPPORT
Date: Mon, 17 Nov 2025 11:40:44 +0100
Message-ID: <20251117104044.291517-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7L_LxFhNFWPF6tQipOt2IQyKWDPrw-a5wCPkDzA4z2E_1763376048
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_094535_953064_986B08DE 
X-CRM114-Status: GOOD (  11.63  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 71c814e98696 ("spi: microchip: rename driver file and internal
identifiers") renames spi-microchip-core.c to spi-mpfs.c, but misses to
adjust the file entry in RISC-V MICROCHIP SUPPORT.

Adjust the file entry after this renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec635515c0c4..320045a6bad9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22372,7 +22372,7 @@ F:	drivers/soc/microchip/mpfs-control-scb.c
 F:	drivers/soc/microchip/mpfs-mss-top-sysreg.c
 F:	drivers/soc/microchip/mpfs-sys-controller.c
 F:	drivers/spi/spi-microchip-core-qspi.c
-F:	drivers/spi/spi-microchip-core.c
+F:	drivers/spi/spi-mpfs.c
 F:	drivers/usb/musb/mpfs.c
 F:	include/soc/microchip/mpfs.h
 
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
