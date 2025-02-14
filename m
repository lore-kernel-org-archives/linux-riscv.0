Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ACAC02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ufpZVntjCEAj3gIUCcHb7pCGiq1qA8GOECnEUf02vg=; b=zsGbImaPJGZO3/
	LP03L2U2J2z2fT9Y1ymN+5Qvv1PWZGfQnmEIj3CtvC5BbT/MNef+eVtrZg1GFWZdv74H7XaxpvItT
	yQLqtTV6NrtBOZ06Brz4tfhbuc8ViSrCL12Dwgt0RA5hx1HxW4rWOJctHoC4T+NR1c6Hi2Jj6+9q3
	sLJEFsNazNUbpUTz0c7gwD/gNDW3eHY3jrXEa90uZathtYgtSfz2aSkPoYMR0Enm4MJ05Ub4ZLU6n
	VDx8IEdh4F3Av1PpxSB7jpY+Y4QyN5xpHJ0AB0kao6LdYyhKzl9I+VXlMqN/baBOIlApQonRyfMFQ
	LF+66yJjajHkMziAoRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixfF-0000000FKav-1QwP;
	Fri, 14 Feb 2025 15:31:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixU5-0000000FHqs-1z8I
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 15:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739546404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dfZVegvU6qk4m7FwzKbbRj/0F95Jye2At6/Y/AuatDM=;
	b=dlY7ZHrXXxjqr5WOoj0G39YjDtxIhZ8p1hsF2KVFAw61rcjrU0OZ4A1olwsY31I96Y+UG8
	QEkLbFdYmWTWRNSLO27ZXCPUsNPFFlGyYBfv3PZoqJOnkYjVB96zOG8b7aykFLJqMdU6FM
	sONt9kR+2vspiE8I8uUvxiogUCJvQ/U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-TZOHbfbHMuWMTblt1zidIw-1; Fri, 14 Feb 2025 10:17:33 -0500
X-MC-Unique: TZOHbfbHMuWMTblt1zidIw-1
X-Mimecast-MFC-AGG-ID: TZOHbfbHMuWMTblt1zidIw_1739546253
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dd5031ee7so1576246f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 07:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546253; x=1740151053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfZVegvU6qk4m7FwzKbbRj/0F95Jye2At6/Y/AuatDM=;
        b=fCjmFqMkwNxr/Ii1SXY7F4oTSjp1zdUNEIzBwdP4i281jv3hyqMxH5e3xV9DUEan72
         NZkR8WQUqhZko4t8hfVztnV4gfQEDd1Z4GI9x38I6+yepDPoVraeebaUe9Evq1qw9nB4
         /jcrAamnivLJOqnx8vWkTarb+wTMTa8Qu7iMj2LTaW1G97gK38gHi6RVpR2Yw/kxGypi
         33J+aiaHyD4ElMWTtW2I1Xs9QFa4o4Wh6e6uOf+/7ROf+OMXwpD58Yodx6b7Q7mgTFuN
         qzMtIJCqqF9hPzIE6V22oAPA2dYd0WUHoIeicV0uD36uFuA2DF7XNyXhbJedTRlApwAU
         dCww==
X-Forwarded-Encrypted: i=1; AJvYcCXJEXjP0c+/Gokt213CZJ3gSLwzs1g78AWvQ+GpKcKg4R0thsqSZ/xIxB6mqcaTMhvfc9WaYmbpl+GDFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN/l5+EMe3OaRqZz3E8IxLx8FjZ2OMe1tKH4dEoUMDiZosOfJX
	0bgvSYVAge/lmas8jS6absTEY7mwje0eWEXgpPJSV9A+ZWFpyFES228JpWrGQDvQxxHh28ofe2q
	uFO50cW1hMpi3RsyQ1tUmFcQk12pc3NDceA7yz4uqCD5k0WYEa8h32nRkdq6BTPJFtw==
X-Gm-Gg: ASbGncsxuQlb3UOrpPStiyTSW41wVbSEQdO95ldP+qng6H/lz6DxpTR3DMnd0uJY8CD
	B6o4GAw5fXDXBXnVWmrJIPUuoRbaQ/or7TjWGHHCguXpeXMfFrdv+c/H3n/yr+2jIJdbPLGzW0A
	ANB0Gm+IgxW+hbfJbdGGcS1S4vdTk7lj/O4OqbSXrRBJLVZ8jRcqrwNLahbp7PYs1Ve0x0cvvg+
	EJCCfQZ6TgbJ6z08NNxxCIY//cL4DfLNy1amyRPnrLdbwbHcljdx6c+nXUyszmsA9cEmueq3XKp
	T5menby+EqnAHTHzdZ+Whbjj+NvUlg==
X-Received: by 2002:a05:6000:18a7:b0:38d:dfb8:368d with SMTP id ffacd0b85a97d-38dea2f76ddmr11997610f8f.50.1739546252649;
        Fri, 14 Feb 2025 07:17:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqA4RqLrxgT7ylPsH/Tx2/hd3i/GaBHUNlAKmeVU3IYJ2UXCjv9nvu6wq2BY2mLXriK9b/Xw==
X-Received: by 2002:a05:6000:18a7:b0:38d:dfb8:368d with SMTP id ffacd0b85a97d-38dea2f76ddmr11997573f8f.50.1739546252260;
        Fri, 14 Feb 2025 07:17:32 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm4855672f8f.77.2025.02.14.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:17:31 -0800 (PST)
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
Subject: [PATCH 0/2] riscv: dts: spacemit: Add initial support for Milk-V Jupiter
Date: Fri, 14 Feb 2025 16:16:36 +0100
Message-ID: <20250214151700.666544-1-javierm@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -F1dHk9VeTwe2RDjkfklVgqtWxUfJAUtg0ehSSSWvu0_1739546253
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_072005_590388_D6B8BE85 
X-CRM114-Status: GOOD (  11.45  )
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

Hello,

This patch-set adds a minimal support for the Milk-V Jupiter board.
which is a Mini ITX computer based on the SpacemiT K1/M1 RISC-V SoC.

The DTS is very basic but at least allows to boot into a serial console
and get UART output, similar to what exists for other K1 based boards
such as the BananaPi BPI-F3.

Patch #1 just adds the compatible string for the Milk-V Jupiter to the
SpacemiT bindings and patch #2 adds the minimal DTS for this computer.

Best regards,
Javier


Javier Martinez Canillas (2):
  dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
  riscv: dts: spacemit: Add Milk-V Jupiter board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 27 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
