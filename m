Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE32DD0C601
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tuRtS8XGf0SievS3uhW0ERSQaM/J9USe/nrWvJQxFtI=; b=byfXHYHR/Pz/UH
	Fj/tSpqN0R9/hitaXl8FhdxCkvPUtS06xlxBucL/8pFjfyKGpnXYA0IDRQTOEuI+TkNkw7Fqkf9v4
	LmIQ7qE8ZAilf3Myc6PUzqmXir6tNX9Nc0oSsvAJ8PUJXISqBzIVLV13oAHCDTtj2dAwGRV/FY0EW
	zne84XzeEb2BuarHrpEUIoOMMxMyjuqvrpXV4FEsuNh7lnys0S6tKyuSlwsYVyr9h15tYtfkz39aO
	4ZFt8gyswa6nBppBk2y8jBVhYABx00O2U0MJ2MUJoXT3R2kv1p5s3Suy+3/NIWAOH5gvvkm1LdIQS
	ZNxhFK63X70LBbB+ENMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IwW-00000003aD6-1jZb;
	Fri, 25 Oct 2024 11:57:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IVU-00000003W0D-33i7
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 11:29:30 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so1350513a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 04:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855768; x=1730460568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eoLWfDYqMargjt9GNsixRddeg2Fxxd0sF4oOMFzM6Mk=;
        b=ZF87nP+9xw/IhL5ZuWGANLilUvgwMRNCMDC5qvh4n8YmNzDIfl/Dip0FuziQlwt0xd
         Cj27UHkgwsc+4rmLXaKf7FhXX8aBIDEl547MM7zNcJthsj/HMeGHB2Ju79SFEfL1/zRT
         mE5KXP0SIqlBC1z5NQ5rGBKdYG3bUCrtYMs+Ydz1tvK/00hXW6mXrIkOd1qXKETcLY5c
         Wm+Xp0aXrJEAVlvkO/6y28aYxmwiF3jkCih3Tv0NX1gFiC0G+ub1dkt0UAhNpr/kcMHS
         MmTSdwJmuxLfWGK5nv9X1QdTAq8jGZBIiupkKV+S+VokOWr9+3rQwfWXwgNCvg5EFJpJ
         jipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855768; x=1730460568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoLWfDYqMargjt9GNsixRddeg2Fxxd0sF4oOMFzM6Mk=;
        b=Ij91TS/rX4/rTAFQwWYe23VyQoerkYZle5njoj0Gek/NakeSlBjB8tZrVr5qpvE2I6
         O22iuIyWhoF1zWSmnwJeQpx1lZU5fTDj0HZ0nw24MXxJ1FMJdjUp+G4nylO5rrKNvJsq
         /40EoNEHkUYmfOvWfjwuDgEtvNekSPcZjipyTZGrQawWNHZ3JsI9x0rlAetspK3tz39e
         m53FL3kGF0ZzkJFVQRJjxYP3l0Ll518J+6uIW3sgoi2RRJaDO9ONyQFi4JgLxCQzcr7m
         JTr4c85EjuOBFENxGEr+hGHsDztKal9UgDM0rybPvgUixQvFbgwQxPOzpqQCExsIJwGf
         YcGg==
X-Forwarded-Encrypted: i=1; AJvYcCXirhwJd8+PmRkkHK2FylkqbbQxw2Qkqr3T44jV6WgG2ttlzp42p2HbVdSSjdATz+bQOtefKWISjC3fpA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn5Nx2hgquWBqbAGd7Wmy6XX6kq9pl2PYqNVR+u9xOCJj3Qj6v
	dIDhAJFFkqgnYqjF6W76J5h//6aVtvBSf8S+jkYyKzHilFfkA1Yt
X-Google-Smtp-Source: AGHT+IEB8bzGZcvOJIjZhselT38AHzYQjS+DXNlkOweOTcZYUWMza3njOQb1NrxYvytRBzozvZo8sw==
X-Received: by 2002:a17:90a:709:b0:2e2:cf5c:8ee3 with SMTP id 98e67ed59e1d1-2e77f4a2b59mr5516975a91.10.1729855767805;
        Fri, 25 Oct 2024 04:29:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3748c9esm1176328a91.41.2024.10.25.04.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:29:27 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: dts: sophgo: cv18xx: add emmc and sdio support
Date: Fri, 25 Oct 2024 19:28:58 +0800
Message-ID: <20241025112902.1200716-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042928_792164_300F6E0C 
X-CRM114-Status: UNSURE (   9.61  )
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

Since the sdhci driver is already supported, it is possible to
add emmc and sdio device for cv18xx SoC.

Inochi Amaoto (2):
  riscv: dts: sophgo: Add sdio configuration for Huashan Pi
  riscv: dts: sophgo: Add emmc support for Huashan Pi

 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    | 23 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  1 +
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        | 21 +++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 10 ++++++++
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  1 +
 5 files changed, 56 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv181x.dtsi

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
