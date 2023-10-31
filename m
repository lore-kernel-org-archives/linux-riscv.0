Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C742C0018A
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ryZdJJPgkJrf+wcJHKs01kCLmiiSAGRHl+wnMHcsCBE=; b=KS8DPeoTLVVVXN
	n8aWVaPTRp7hD4E//yKXESTA3laeI0AoTH/b7lxD4vXifkZ58Nhq/5C/N4MYN8H9z9LGeSQfIvcQ8
	JshXbWC6MOHv67GqaE+ri32C4NdkPSjRl/s6b5JXLGTdO9JVhKU+UXGnqXBQpa953y8OVtvTaiNZN
	4b5U7/gm+X4BMqYebU8/CRN+v65CkHuo/sw3yBiyr5l9c+Rri84P75wvCTtGsM4TLmzh5J0OtMHB2
	FJzoWcM+hUNTscjd2dakB0YBZS5AiQVtAGDtepWoda5RhzUCG6oAyBujzVIQgyb3qwmSh4WWZ0Is8
	QOUuXDM8IHQuVmyjTyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpWG-005PVK-1G;
	Tue, 31 Oct 2023 14:15:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpWB-005PST-0P
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:14:56 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1BC934081E
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698761689;
	bh=Q44keJVGaKBkwqEmz1WVH/8yD9sVBY1cid355hx4DyI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=aMzbyOvorFukGe6GASD4FJKJ4n3yr06ql6JxhVQVDHdLzY7kvA6A9zykt4K4PiOkJ
	 btttOPlNaifSTwq47b59CU7BsGu+FjTbehONetkjCUf1C3eyTatNjrIev9+myvddI+
	 HTTgk+rdE0gVF0o1QvKdy4rGZV+cqErtDeXlvPArIZqRIKm2O+KGAOJljScYOgn2ag
	 043urxRbQJa7zCXWAiN+gwB+DURkALvHaaXmRNdGVmEVlBSABRLPUn2RoABuh7uy1e
	 JpWP4ZafOyqbmXcpzND2ZtXAvFfFhG5XgglkmzlqJbU2y/O5jQcXrzJJoAp9Fzy/3Z
	 JRUmqFWdiI8FQ==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9d223144f23so207274366b.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761688; x=1699366488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q44keJVGaKBkwqEmz1WVH/8yD9sVBY1cid355hx4DyI=;
        b=VMQnblHrt3+tVtswzSSvZa3AZ3fQcrZMph19z8jrl+5APRL2lQ2EcKC7B41IZ/3uNJ
         PC4Uapc6nrUZc1Ue2JDwm9tSLOlMed54N+v4ppRgto2lohYVkt/promyUAl3uyMHEayR
         wpw55IV/D3Onueb3wWHYxfZevT5rymRGJik91DUAwrK8mJSobPTqBXMF0bs7M9im1feZ
         Ka95Y2SjlKWQLr6CT7IxZRQ58AdP4rgLFdnRZbxpNImiEMPDbcWZQ4pWO+96SJpGVI65
         TYF6NEexhlRvsmDn1vvm88xm85wPmssJqnDMh7PSHg0eeWfzaJA4wahJ3rzjE/XY+LWl
         5vTA==
X-Gm-Message-State: AOJu0YwKj9T9MwpGqwwiOFijGPuY4xbnkBEC6q5tXefVLwKSSpT98QNA
	OCXvUledRCyFcOLKRV4LozA6YLg14BrkKZ1r0DvujtWtKmunBNkKvf7wGiFtC04mHlYW2kC1Fu6
	D+IO48UdMQkhYgiyeq3msLuPiOG1ESpLOEmhQch7M6sTCSqVEJ8M1gw==
X-Received: by 2002:a17:907:1c0f:b0:9bf:2f84:5de7 with SMTP id nc15-20020a1709071c0f00b009bf2f845de7mr12150620ejc.4.1698761687880;
        Tue, 31 Oct 2023 07:14:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNNB1kOl40YNNgulYED6HWdQEMfYH4dxGn6uxtPiyveTyL8eA57XZ6tGygKxqqCZcI7GLzSg==
X-Received: by 2002:a17:907:1c0f:b0:9bf:2f84:5de7 with SMTP id nc15-20020a1709071c0f00b009bf2f845de7mr12150604ejc.4.1698761687590;
        Tue, 31 Oct 2023 07:14:47 -0700 (PDT)
Received: from stitch.. ([2a02:aa7:4003:190e:bd47:7b6e:876:4bdc])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709061b4500b009d23e00a90esm1037395ejg.24.2023.10.31.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 07:14:47 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] soc: sifive: ccache: Add StarFive JH7100 support
Date: Tue, 31 Oct 2023 15:14:42 +0100
Message-Id: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_071455_290599_69CC1F5E 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for the StarFive JH7100 SoC to the SiFive cache
controller driver. The JH7100 was a "development version" of the JH7110
used on the BeagleV Starlight and VisionFive V1 boards. It has
non-coherent peripheral DMAs but was designed before the standard RISC-V
Zicbom extension, so it neeeds support in this driver for non-standard
cache management.

Since v1:
- Fix email threading, hopefully.
- Drop sifive,ccache-ops device tree property and just match on the
  compatible. (Conor)

Emil Renner Berthing (2):
  dt-bindings: cache: sifive,ccache0: Add StarFive JH7100 compatible
  soc: sifive: ccache: Add StarFive JH7100 support

 .../bindings/cache/sifive,ccache0.yaml        |  6 +-
 drivers/soc/sifive/sifive_ccache.c            | 62 ++++++++++++++++++-
 2 files changed, 65 insertions(+), 3 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
