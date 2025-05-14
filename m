Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BA3C3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OqqTN1eIe1PoAsrNKcLnM/aIHBUXGDmMXgMd1VorQpE=; b=AEufFZITQsbV3k
	V2KB+r7D/jzsQ7jq+A7wzRNnNbAL01BRDTPLqaCCD/z8w9vPukQnfHQuJBg4RZYexCtetx7Pb758t
	PluOKsaNmkulsaKvn4/YJ/LuuUmUpBncOc6rSNe1ghE7MN3CGLzB9L4po44Lst3QF0Mg9SzGuuFE+
	k0DV7HC3nSxbfEkOUFF5+I8cfPVlHVSam4/02v3m4O8rJvVq9ZVBqhff5RLTQPTZuNI+KUD8dn5G5
	UelGOTRZ6TvSwrcQHM8Gta9oLypg7aiJRJ05DMzLyIxqWizG6mbayMHEq4Z9Zc6cJbnB0hCiSgSBj
	xONw+/vr2mRHPosMvflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEfT-0000000Fgde-2bpX;
	Wed, 14 May 2025 16:09:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDqN-0000000FYL4-0bKT
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:16:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e16234307so11612825ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235786; x=1747840586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgsklLZ/mK5aUC96i1ZN36xx7E9PxV2eHr7rkJneVg4=;
        b=VUBH7dW1Ctt5AzYbGFYRk0JXLnV1jHMCBXVOjRGyl8oHslHvfi8QshAJGVnH3+0n7c
         KlfhensUoensSj3+yR3TAfp+VAjC5Q/zzkuH8LS17WWak1VT8bvwY90ptmq37J7kU7TO
         wmN6/YYePzxxhrTdXVY2jX9o3/dIA0oBGC5Kje0UazF5bmVoO8V0rSS0fVjUtr4mtGlU
         +6M9sYMgdSTIyp+e2ZA4t5LKxpWznYghTN3IABcmX17JL8UPtkw6BM/rG9n0frTLyhSk
         IM/VHGpb9JlNqbh8q2czoVI5T6c3J0eWozvuAgwCRjUsnXp1lsZgoN2U1PPFj4Y3v8Op
         Zoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235786; x=1747840586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgsklLZ/mK5aUC96i1ZN36xx7E9PxV2eHr7rkJneVg4=;
        b=ZhxOnZmk4ll1LYKGLqzkFo2ka4U2cwQOBrwZq9oFWLQUIUVnjskou9OtFwSjXnYHgA
         mOCuM80CZ8+SHw13uJPoFmKn1AM4NfTpD/JefOtIGCr0zjwODKO/5PmIkA5ADmQmdcK0
         snhGu0kyXXz646Dc+3gELwN09nr70OH/8hpDDPp+0K/pba7f0tHgo0hqo4gy3cbNKVO3
         /p/gW98UI0Ale6XJ9EFts3IVUIbM6hXM/wuESsG5INjfQpKNAPifl4JXOQHbYZQ2FMSr
         MKBa8Q1ILwo1NTGSj7euwlc5ziprnnzgtOw5UBy1G4toN/YcULbG7P0dYwEk/HzGj3Cr
         u32A==
X-Forwarded-Encrypted: i=1; AJvYcCUaEtrkr+Gyk6uWdWJgGadfkXA9PH4ACsPdU4XTqySW1ArrwhQFLFpvE5x8MyGX7CuN6GBB2f9ZlswLRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwupQIdxElrqcklYWqNVFjFL9+fXepj7jO/GC448cSmjZIHVgGS
	S6mYAfDm8c/Hxkb2/G4Q2MUTsHDTsT3Vu4XYNTnV1XOLXeZGJRa4
X-Gm-Gg: ASbGnct8pNLTCHAVeYsIhPzlxOazRVX/fQmrM+hDTkskIYDHbVxwqZvrVcezK6wl0DH
	OjHD/UPWEGuwjgeD8Q77M5EMuJjp69DI1NqYexbMUYsZn+a2XXcnRC05sFmBlJ7/RfqmF571q/0
	C7r0CDbkOiboQOHqLLm9hF7QPlHssXvrd1WN1f0EeVrzkGs52XhWT08OMsM4I1a02N0BIuB9c/C
	LquYUuxv1rpCTpN59m9TxKMvrUgZpbhuVfIsFMryPa27pIMGIWbt7BxZX1PgfYxHikpTVoyuMth
	vvF2+2f/d4V/UhBLEMaNdTn1uKik6HIpEjKODx9e97JIYZ7A/mFQvr6J52n+kw==
X-Google-Smtp-Source: AGHT+IGbVInxx66G7TdCmzBNdgbF6IdqT5fffqnER/G+POHGsBd0cJTXz0qVz+AMlIIPHrATjD1bLA==
X-Received: by 2002:a17:903:230e:b0:22e:5406:4f62 with SMTP id d9443c01a7336-2317cb62f61mr103264775ad.24.1747235785499;
        Wed, 14 May 2025 08:16:25 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75468besm100576155ad.3.2025.05.14.08.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:16:25 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Wed, 14 May 2025 23:15:49 +0800
Message-ID: <cover.1747235487.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081627_179984_053428C6 
X-CRM114-Status: UNSURE (   6.43  )
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

Add xtheadvector & ziccrse & zfh for sg2042

Thanks,
Han

---

Changes in v2:
  add zfh for sg2042

v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/

Han Gao (3):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042
  riscv: dts: sophgo: add zfh for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 512 ++++++++++++--------
 1 file changed, 320 insertions(+), 192 deletions(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
