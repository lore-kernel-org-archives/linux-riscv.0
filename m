Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E225C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 01:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ak5HwZiA8dj65mpby/izj7Hc1lo/VqddxFhBm2itHjk=; b=RxdsCxS1GZf+bB
	jQ2JVqTPExWYgVCzffp/9A9QK0XprD7Nj162ynUp5wDd2cGDYCTierBA42Zpm3Ori2xAMotmb2MMl
	Cl8kvgHzrOywSLod6TuZOX04aXoskl+fWxh42qlvii8b54P5DI0Iloj8qVMm0ONk2vTQx7myiewNQ
	rNtkQlFDJTxO7yD57FTIRMKiMOBw0tlcBjM6j1X0z3GItZRKS6TgTTMwtCEE+XdJVNsI7kQzod/uM
	4P6KPZ/hPCUbjISB8ZjhDKAnGIEb4+PF5svt5KKywVxIazPLvmPAoFXNFYncdB6MfxcyUgzuHK5zZ
	8zlkeEhfr6wxrCaMtTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7PZf-00000003Ke7-0Shx;
	Thu, 16 May 2024 01:06:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7PZa-00000003KcZ-1oLs
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 01:06:20 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1ecd9a81966so59634195ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 18:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715821576; x=1716426376; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/UFcDnnjy3pyeAsdnnlsyXeGMcrQPBnwopB90N131Y=;
        b=fqLbHciKrjXsKJpwL38jW3XTB5PI/nPNJYxjOWnMClOFW5ESEI7573tKO3Q1rVrzKS
         pCbv8IDzRyNwcJPO1ey6YlpXpPSNqA0eiDhqefke2OYzCGvkfm3oB/j5kvSb42JzCbDA
         9i/I3JF1OoS1s3X/Ne4qzg5oX4zbFA3F7qx0Q0yidpVR4dQ/TFmjQ3uUGqMjRLUk2+O8
         O5y7T/mH4ZRmgWmS/v2tOhS0SooV7DH+9ZAZ9PNBZ1tWC0Xg/GCAFBhAnNDVhqnoT8ne
         Gni2sAaMVwXjI/btp6LKAdJt+NDZSc/gdanLPJ/oQwETa9q0dLoOx1kbQWdEdaL+Bfra
         PFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715821576; x=1716426376;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/UFcDnnjy3pyeAsdnnlsyXeGMcrQPBnwopB90N131Y=;
        b=vWMNkvM4uAwdZuSEa+vMwlfn0kYgqqcjcu2O6hnzcgDPYv+s2sgHKyqSEGqu5GQcrd
         Kg8ZBErPQVHZtsEoG0g83cFAamis/dQmYLQ5MLuUd6+teQPsDJBogKL+cR/v5ILCCL3/
         8PFHl35vZCuZHQSHaygzGy2JXhghXO8lgGJ4dw9nKxm2XYMP81Ik0PPL+HroVpjxbucm
         Izj/wgd/O1W82+wjvrBHAtDYCCUozzOZU5ds55RO9TPCbpCo3kDDIAY8X1Yae98fsuLO
         G1w91fxtP96vQInL+YZ+BJmSNfAcgy3+vwNTxnA8fbzqnOerBRJKp3xCUPuq9I9a1Z/C
         1tzg==
X-Gm-Message-State: AOJu0YxsDPj6A4lIcns1SKM2aU7tz3UtUaqO7o8lapLOhEJQmthIpQZq
	LvjLDxKJWMR5QkVmQGzyPfuZ+m0ZEqCECrkeyliVtUd105RGU85x553i/ymcnORDL21ynXCBqnC
	R2pgsMxniKzyO03g2I93CA2hGPS95ab3itww8aY3pOnDjg0zQ67pUhVqb2bpwqCU5kyQcpaCAAe
	I3vudjL8PvDxe2wyIX9S3MbO8iQoMp64gIz0aOghmDAcGS+cIBoNw3e90=
X-Google-Smtp-Source: AGHT+IFWQCLfM9nDqO4/Vzf0Qykfi/rGKbCui2qknji+9I132i+xvtmVL4rM7HV3QXYTYGm9mnJRMw==
X-Received: by 2002:a17:903:120d:b0:1e3:cf18:7464 with SMTP id d9443c01a7336-1ef42d69b44mr229915525ad.3.1715821575542;
        Wed, 15 May 2024 18:06:15 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f0cb2141b0sm2054875ad.285.2024.05.15.18.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 18:06:15 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 1/1] riscv: Fix the hart bit setting of AIA
Date: Thu, 16 May 2024 09:06:10 +0800
Message-Id: <20240516010610.30013-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_180618_572224_DE8577A1 
X-CRM114-Status: GOOD (  12.79  )
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

However, if the largest hart number among groups is a power of 2, kvmtool
will pass an inaccurate hart-index-bit setting to Linux. For example, when
the guest OS has 4 harts, only ceil(log2(3 + 1)) = 2 bits are sufficient
to represent 4 harts, but we passes 3 to Linux. The code needs to be
updated to ensure accurate hart-index-bit settings.

Additionally, a Linux patch[1] is necessary to correctly recover the hart
index when the guest OS has only 1 hart, where the hart-index-bit is 0.

[1] https://lore.kernel.org/lkml/20240415064905.25184-1-yongxuan.wang@sifive.com/t/

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
Changelog
v2:
- update commit message
v3:
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
