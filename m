Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1F1C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 12:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gqzt6KeiUm36cSFhWtkhAKW3Mp2SJ4xDKkZgOhlOsWw=; b=fs+dzyDxc2msqi
	73FRmw0doEbwf9ABh+WhqVF0ngiW7usO4obbZ8N0PLBzTtbJlR1sYKAU72S62bleP5l6pWCr09qkt
	awjx8wMZzKn1IMsrVlO8yWjdOZdRUi5catytK6STi9TC435cDTkgs1mGWr/efLjxVECAtXBBLikHZ
	DcRucnosahERnoPQQSsIQjl+CToFoQbWZ3X4tSJGGYyNt9zxCnfkZt5byNfHnPA1y7RJgw44J8yaq
	DjBK/QlujIIn5s+FmQs3zDZAbdGMRTU2SQxPuIYxAtdWYhSKX/5YdZAt62kxMRSKpqhIjwCVNADlM
	ZT5NFoNgdKZuMikCSmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOO-009PC4-0l;
	Thu, 02 Nov 2023 12:01:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOI-009PBK-1g
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 12:01:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso7140295ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698926496; x=1699531296; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uR5uSCS2gr1HMGyRm1+7GoAqNDGTDMjtA3OkeTUhKCc=;
        b=Hv3D5Av+9wIx6rnPqbUFcxedcwhKUOuy5L7EADpwp+PJVEZH/AkQDhwfyKVhpnQ5ep
         aFpbCVSiqDq4gfqNBGiQit+vUToDtsfq4s3bEBjwkxNQlsyrJGMOiyl4jMMrUu7mA6Z5
         zuPj9Ikqf+5NKy7+oQ/YvbqnbF2ZVzY4jm0ZWAP/7s6d4UkkoAwEZwKFD85fVA5pX6dy
         EBku0S/lkWb6LyXqJAgbO65wPRW/UjcEWospvpFRk54KhXy3gB76j4i9/gU7imz3FVNk
         4Og00SJxbJIXhrvOBafmvCBJ0QPmZEyyWxBX9vfqYlPfEkMRh18gPYmkf/qUvgK6pgHW
         XHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698926496; x=1699531296;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uR5uSCS2gr1HMGyRm1+7GoAqNDGTDMjtA3OkeTUhKCc=;
        b=bVAOj0ZCDAdn3b7iDIzt6Jz0uIpxjYrsK5xIEbW+GZiUnn8ZcKVPqDWpQr6uqMWvVz
         m7jq3UiLALYyf0AovkoAU4CMiVyvXLzTh+CfZhCG7IEXgPCVjUkHRTzcrG8m5i9ZtSTr
         B7J4quut6ztPC1+A6Qlly5Ujudz+El/kFW6dsB8C31eOOD/yQK/sQEbwGrt7Pj5HGUKG
         PYXukw1Y4iAsmalyOpVS/epgMZVmeqZcMja//KChUDTCfSxgldsQFgiyACAlagH/nskH
         zhgmmiArrlh46a3hX5k2gPoeGTjC6aBbByiVj+OBDoJs333AkzhBz9boA8sEUH2y6I6Q
         oE8w==
X-Gm-Message-State: AOJu0YyxT0Z8/Vx5BOdfgRAs6l4jGCGily6OMiw2mGOvc9eRjsPu1GIK
	UHGdstgnc8Y3sTmu+WrF9i9oPF3NwRTeMPDXoft1+aJWWy0edScQsxfxZ85pRV0OwTtmR0sZWAW
	7AVZmqt55aHLopjsu4hbbrRr6x8wWOfafpEqhUxzruvP1wAkGqs/eVxM5NNg1Y9OGV/X7aybalK
	ezSqWNIz88pi3+EaYbaA==
X-Google-Smtp-Source: AGHT+IEMn2jUJoF5gjkIfo3Vb0F0SanbNc6Ga2rkF2u00f7Atbo6e9oCnp5kZFQcCa67Xo9P1Ulnug==
X-Received: by 2002:a17:902:e54b:b0:1cc:6a09:a495 with SMTP id n11-20020a170902e54b00b001cc6a09a495mr7702986plf.44.1698926495647;
        Thu, 02 Nov 2023 05:01:35 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b001cc0f6028b8sm2969008plg.106.2023.11.02.05.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:01:35 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 0/4] Add Svadu Extension Support
Date: Thu,  2 Nov 2023 12:01:21 +0000
Message-Id: <20231102120129.11261-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_050138_635341_5238E3D9 
X-CRM114-Status: UNSURE (   9.10  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
patch set adds support to enable Svadu extension for both host and guest
OS.

---
v3:
- fix the control bit name to ADUE in PATCH1 and PATCH3
- update get-reg-list in PATCH4

v2:
- add Co-developed-by: in PATCH1
- use riscv_has_extension_unlikely() to runtime patch the branch in PATCH1
- update dt-binding

Yong-Xuan Wang (4):
  RISC-V: Detect and Enable Svadu Extension Support
  dt-bindings: riscv: Add Svadu Entry
  RISC-V: KVM: Add Svadu Extension Support for Guest/VM
  KVM: riscv: selftests: Add Svadu Extension to get-reg-list testt

 .../devicetree/bindings/riscv/extensions.yaml  |  6 ++++++
 arch/riscv/include/asm/csr.h                   |  1 +
 arch/riscv/include/asm/hwcap.h                 |  1 +
 arch/riscv/include/asm/pgtable.h               |  6 ++++++
 arch/riscv/include/uapi/asm/kvm.h              |  1 +
 arch/riscv/kernel/cpufeature.c                 |  1 +
 arch/riscv/kvm/vcpu.c                          |  3 +++
 arch/riscv/kvm/vcpu_onereg.c                   |  1 +
 .../testing/selftests/kvm/riscv/get-reg-list.c | 18 ++++++++++++++++++
 9 files changed, 38 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
