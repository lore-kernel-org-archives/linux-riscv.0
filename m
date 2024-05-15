Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329D9C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lPKO/3RXebKNY2pH5r2qDxJXZxJExdAEQ/fPOoClDgU=; b=kIUapjrzEUqmG4
	pWDOF4UhjV/eMCMwQoDfewamT+AMEV6yuYYQFcjdjTLkb/AAGSYUbNQxqEYxvcWTAegPabpsSiTbU
	FoWy7iJwd9FYHOgIZtlbf6wgIBXAWxHSNYTTrGlxLfc3mErRPuCDYGSZEThvgaAvWkAoseKiptcJ2
	9KCX65rkYYKl1j7pX34Tqss6tnhOW/SYqmgcelhh+vTI+gT9MQBxoeYJmxX3f4n7cQ7FpGE3EWGeK
	p97UFNwu7bE4byVmrVk1FvryryioQYiDpVO5Nax233EwsTGbcYYr5w6YPPerLg3BbHr/ul59x4m6r
	/gmOoxSiU9lgTJiZxChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7An4-000000013xX-1FeT;
	Wed, 15 May 2024 09:19:14 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7An0-000000013wZ-3zgB
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 09:19:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ed835f3c3cso57216345ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 02:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715764749; x=1716369549; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BVwu4rFW+94AWdY34I4zNqztX5CFLn1Co//HIXJxwo=;
        b=bb3+TMHBFnq9Lmmv9UFSxGvrbX+d2GcWWMA/9gwRH6Du2Md/DKjN4lJzd6ZQv5Eiur
         IzEQ8M5Xv4pn/Xa/PTLpcJjjFug75Ny5EW5yLqw3tubZvz5MZS0LvOXk5Zo79LMJyDHq
         IcF7Z4sTJP3IuBAgvFWt3paJRk8ZrsfowwJ2cr65IlhAbJxMW5QQSJcECO9cDsDiL6Oi
         FLSuAifuw7n1E9iHoxkNaUD6Hg3eA7C4kHuo/kD8yVvndUhN12l851zwI5Y2I86JfQty
         LZI5WvDceLlbGN49nwLovIwgO17BewaWhFwM6dPykkFiDOdyRdjQB5a+LYmczudxp54e
         chfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715764749; x=1716369549;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BVwu4rFW+94AWdY34I4zNqztX5CFLn1Co//HIXJxwo=;
        b=hMwKE6zAlPv4k99NADJZP/mHHlJzLF+T6c4G39d9T2fqSqFrgY2Vl0tnitrTohREj9
         Jjuem+//4JWkOQwYAZKy8D2mua/aI6CUWoXVs0k4TJFTFpN3vRjvRXz1cLGK9C1dTNs2
         QhZliRDkfbfR1FRr1TGmYuLrnoX6fTrk3HotqegPlQxYLd9nlznPk7Fl2YMZruAZtkDL
         jvxow46M20v8Iidvr7em5nhKLUV6Bk9PKTt3BkoRn/acEHTFDfc8U44Yj5Z6Hs2vgffY
         NAsUd6kOn41QJFNMEm9x2mQCmFgT7QKtVMhltVJdLnY6AtsfZ/qjWy/b+dOGSdDhov2h
         QSLA==
X-Gm-Message-State: AOJu0Yx0QHzY5j3BQJgDQSCqqn6jJKTww3a2AAsO+dX9wSxI1XTVPKbi
	Setbdb8qfRZvI+bSLC+bBjRXNpN9wVWBR5jR75TZL8o2UWZlBddtRQWjUmCpnKlKhR1lFNcFMg0
	y8qXuaXz1AWmr9M86ZGwdZ9ffOZ23Tjq/W31ajnrnAidDPMFIlINML0xWil7VmVJMM/rd7k/jwN
	Ha1Nc8ht/T7pFL764YXR+xJh5BVQ78f52/0T7gU0+SHLaFJbqsBTNILlI=
X-Google-Smtp-Source: AGHT+IHd+bGn2VdihpmBsU2mDilPtuwmXZVyUBsUgWxgGdm5kBZ7KndTQoemyKqz0sjI6URDkBfnlw==
X-Received: by 2002:a17:903:32cc:b0:1e2:3720:e9b4 with SMTP id d9443c01a7336-1ef4404a0bdmr183568035ad.54.1715764748578;
        Wed, 15 May 2024 02:19:08 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad99a4sm113297935ad.81.2024.05.15.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:19:07 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	apatel@ventanamicro.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [kvmtool PATCH v2 1/1] riscv: Fix the hart bit setting of AIA
Date: Wed, 15 May 2024 17:19:02 +0800
Message-Id: <20240515091902.28368-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_021911_007822_2E078983 
X-CRM114-Status: GOOD (  13.17  )
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

In AIA spec, each hart (or each hart within a group) has a unique hart
number to locate the memory pages of interrupt files in the address
space. The number of bits required to represent any hart number is equal
to ceil(log2(hmax + 1)), where hmax is the largest hart number among
groups.

However, if the largest hart number among groups is a power of 2, QEMU
will pass an inaccurate hart-index-bit setting to Linux. For example, when
the guest OS has 4 harts, only ceil(log2(3 + 1)) = 2 bits are sufficient
to represent 4 harts, but we passes 3 to Linux. The code needs to be
updated to ensure accurate hart-index-bit settings.

Additionally, a Linux patch[1] is necessary to correctly recover the hart
index when the guest OS has only 1 hart, where the hart-index-bit is 0.

[1] https://lore.kernel.org/lkml/20240415064905.25184-1-yongxuan.wang@sifive.com/t/

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
Changelog
v2:
- update commit message
---
 riscv/aia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/aia.c b/riscv/aia.c
index fe9399a8ffc1..21d9704145d0 100644
--- a/riscv/aia.c
+++ b/riscv/aia.c
@@ -164,7 +164,7 @@ static int aia__init(struct kvm *kvm)
 	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_nr_sources_attr);
 	if (ret)
 		return ret;
-	aia_hart_bits = fls_long(kvm->nrcpus);
+	aia_hart_bits = fls_long(kvm->nrcpus - 1);
 	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_hart_bits_attr);
 	if (ret)
 		return ret;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
