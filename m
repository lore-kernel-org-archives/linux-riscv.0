Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C3606A334
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lNVHL4HK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw0K7RCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/ZZHe/vgQsMAq38J6itLmbin9ORveHYG5zwO3JaWqIg=; b=lNVHL4HKeBBUErFgN5c6jh3wei
	QUdxP7y7O1cPOhF3AsG+uq6sX+m7agnz+RNOfg6zv64KttGLHN58ewKAwRpzEYTpyPSR3EYHxpjQF
	+mQW17lxl+vgxSpnOv0DWvFJu97JP4z4KAgs5OHL7f6DuFok5LtMKr29MBXnN3sE61Ap1S/mBjuxY
	U+zbhI5/rmdd+nT4st0sCRs8veAVc979IJGuvgWoYDucjMSxjbIrysC4WdQqeQk3fsK6GMIiLL0Ke
	5/Sw+aahbKWlBPqtdonv8RZtM/0uYURZ0U2uw/rFNNlNLpmxU81waMTnvaySXo9+2+d0O6vHS866h
	/Yi9XMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD6M-0000000BJsO-2aSu;
	Fri, 06 Nov 2026 06:07:02 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD6I-0000000BJqc-3rCo
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 06:07:01 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so486133eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 22:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945218; x=1794550018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
        b=uw0K7RCZRy13aJa8Sly2m6IRB0JO3reNzBHTPacOY/4wRPnlmojtPQK3hlEazmr86W
         MjJeJvAxsuyy4oi9jVHWePxFwmdB4YI2Uml869q/4O6myHfa33qszifARg85p+O2I0PK
         9M70+TYjbCCN1VDYrMOPQzDxMUahY/A5393OUUwT9qeiAviEL7rgkWbZQr4bnt30WOAp
         qNFUsWBaEdkUjGTZi0zrbaI7iFj3YK2hmYfzPNyTyrFkch2776fCdJoYoXvKbV4b8afT
         z2I5cmavkwa6tUyJ7DBdzvCfsT8ZrGwBC1ELJc/+RG5XFTt3EwgYqW1kxSZeMvgApAhX
         RN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945218; x=1794550018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
        b=VJL69V6YWm95ghHhycld2c+RngzR1G85bZp+Jeb/AqTIDe06K3l2DJ3ij1W250y+p7
         g8VvWNBQaWq3Ckv6gFYs61JbMxjrpxJDYl8UVI2kbWBcDINnjXLwd5+Ku0uGEo1rlDxL
         V9cBwpz3XHhzWwYjZFYXSl9rgyj1m3ClbS5z7nVxhcQBKLSew9PIwIz/aQZ1g5LBWUcI
         SyvfDP36unEn7vmuMqtPzEvvbFKoaYu0XCGMYGTfWHOxIXi6KNN6K9ABF0R+idi0Tbei
         6eFkqQVYrifMmH9mAhrQcPmtiK2q9oZyCXHQA65Ff6tJXvaRwD2V28c/8fCFFFzwKDo4
         yoSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFMF+alQZdJfe0pBtonQ/YezROky0/ZQMWfU6QhPJ4x6HT1efyiZ2tt/R49QSjttYyXUbl96SWh6Zc1Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/DgjlX2J2Xoh/mWblTnUxt6sJmtgHhze76ydKYNqXdSJpss8N4
	Odlt41QRxtS5DzIqbb3vLTCYqUQn33Wy84l7AiQqVe2MAZDEXu2VJZ8A
X-Gm-Gg: AYBFou2srauimPx2qb3GCP6DvOOo2wU79F0SLaza72Lkosp92yo3tySa/NNpyQTiW6Q
	h/EkdsfVaHOtpMNynFV9Kjnfa9+masfhAyTS8QQH1ixUJNWhg6dqu7GUjRbLCVQFEGgeYfQJGgU
	jETVav2lPy9fOfMxKM/w1uUDKOsYT5oDEKWT3xiJkwvkmGOmu40yDVK5671XcjY6lnIFYckEM3t
	cOH3YCalOeAfDuQGNPMJv6gTR4Q4uSHC6mECW0Bv0CNOPiIE0XytzuStYEeyfRDa6KLtnz2Q+9A
	+qfynvzw6x45aRRimxx9hfl7qoHCq13PBV+pNwK8MqOvBJvVA/JSc2ehTeuIo7Z0mHMlnKV0P3I
	w8FNcI8Ea/RiMlSCgrkHdFCjjvvkAlXZFFT1Y7OwpT/RMij1/xD3EtGTj4ai+CSdVHXXPmw5SEd
	LBYyx1QTt3r1MvC28KDHxU2XfQsV1eSObXpoYf6oe2WpI2PqoAnGWWKtvK6PXFhPnJ75LfHe9gK
	YoQYqVPhHVPuCsRw25Jg6vefUBP5dQ/znsVWMFdvhM9UiYf9xveAWZhK5svEX8qJcNjpWBavnoO
	3ztEb9ETO3rcKUrKOOashezSgDxKkFRd53nUhwcNQ9l2bu5b5D64
X-Received: by 2002:a05:7022:3b83:b0:1b2:4cc7:7db2 with SMTP id a92af1059eb24-1b25d34ed54mr1914086c88.47.1793945217607;
        Thu, 05 Nov 2026 22:06:57 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:57 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH 0/3] Add read-only SpacemiT K3 eFuse support
Date: Fri,  6 Nov 2026 14:05:22 +0800
Message-ID: <20261106060525.346873-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220658_957174_BF53B893 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

The driver reads the shadow registers of bank 0 and bank 7 once during
initialization and keeps a copy in memory. Later NVMEM reads return data
from this copy without accessing the registers again. Reads outside the
two bank ranges return zeros.

Tested on a SpacemiT K3 COM260 Kit by reading both banks through the
NVMEM sysfs interface. The data was unchanged across a reset and a full
power cycle. Reads crossing a bank boundary returned the expected bank
bytes and zeros in the keepout region.

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  25 +++
 drivers/nvmem/Kconfig                         |  14 ++
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 151 ++++++++++++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
