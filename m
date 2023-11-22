Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE559C61D99
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 23:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d2jH2wKDqdDilfpUOZbd+0O+GtH/7zWaURwfVPJmQ14=; b=o2KrvMXB1gGegB
	NTAkfrMo+xoYN6K2PsR83dRYcvy6PWnSBf6b70y0+aNN9onIyEcrL+lqXigMWTGQQKj8VksKMKVDA
	buK3Ug8k8mGpIQEytr3rZd1ZWMR0H9IMfGfzVdp5N2qI1FkM9Zdhw+Xp2c92XCkas5SOGopuyyQeT
	wQBPIVPhJlLXPV5+IlFqhzKAXQW2swyrB/e0iyi+WmjOpVdNkEWP5qyvMBaDKH8YPcppyh29XJ3Qb
	daDS1QWi5VGEN3W5Ejl303do2z2Rt0YTr/N2/+1hgcmbn8qhAQCg7OZ+shI3BQralV4//OaBlunAQ
	QF/c2Yz0TW3v57LrEECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5whj-003Jcv-0v;
	Wed, 22 Nov 2023 23:32:23 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5whe-003Ja0-14
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 23:32:21 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cbbfdf72ecso354337b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 15:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700695935; x=1701300735; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VLUpOssAYTVzeEiOhoYcENie1wzsLU/orNHzIAqK+E4=;
        b=mucXQ+OXerE0uOQiAtjLiLBR69ZevXTC6ufhbnzeQxsOSdo7po+lZek2asn9MfSVQi
         Y2yyfEBouf30bIIJDmf4fnhqMpmlNh9dceeXVxpEuikNxxun3OMoRDDe/eY3rW0KDw3p
         po+0xGRBj88jwc2ADLnj2kyCZZCPBgF2xUODWhlSglcJpWLN7Z4sbBRLFIVhIo9+RGqM
         9TSh84msZk5hwhAeu9oEWyXnbslr1BIy2XjW09lMg7UjY21doaaEeFqTNY8Gn8py7LK5
         QB6A+5bLiiSb1myZUjgP0ZT9uCVJY+uzpB98HlSKGdbeWbWWE/y2k6dEh+KtfyG6Sg4o
         nu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700695935; x=1701300735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLUpOssAYTVzeEiOhoYcENie1wzsLU/orNHzIAqK+E4=;
        b=BDMgYBP3bf5EvlCCHX1QZ3BsLgkxMzRvF5x+0Ynr72vysb1RLxytdPsIhHNactv4yV
         WhChu4os1c8uem25fIVg2wANBYX3LiPGGQl6KsOoVgAp1SepwFZ3UQTgrW++X6K0tBFo
         svqCtw+1Ap6FC94GxhPjqhVuAFk3mm0K5cW8MJZsgK2S/HJzc7oxuXab4M1r5usPBMES
         DVExDaePgJHjJrDTw1MNv6FOt9u0ISSHXmxnl3Fa9kLLwXWNrZgU6kWfYL52yVM/DfNi
         3TiTSTduur2zwJIBjlP9Al315T1OKtETUDjZ0Zmd2WAolycSyb5rOTdC0NRcTf2QVYLU
         ftAg==
X-Gm-Message-State: AOJu0Yxv8adSjNl3HxuLcvgnREOqfVxfpPP9QSyU86nGKAbEbtMfWsv7
	WrbteFsq2dfLscKE9Eo+/UrElmIuKVf/tRN0Jp4=
X-Google-Smtp-Source: AGHT+IFcwCrbHmI2/Si3lJWdyA1kfWGBgQhRHqzzJtYh+UpNZfyRxdWJNB15WIFzV/kSsdIDFDfSZA==
X-Received: by 2002:a05:6a20:9e4d:b0:187:9521:92a7 with SMTP id mt13-20020a056a209e4d00b00187952192a7mr4359181pzb.18.1700695934863;
        Wed, 22 Nov 2023 15:32:14 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78c56000000b006c875abecbcsm22603pfd.121.2023.11.22.15.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 15:32:14 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/2] riscv: Fix issues with module loading
Date: Wed, 22 Nov 2023 15:31:40 -0800
Message-Id: <20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFyPXmUC/4XNSwrCMBCA4atI1kaapE9X3kOkNMmkHWwTSTQop
 Xc37UoEcTX8A/PNTAJ4hECOu5l4iBjQ2RRivyNq6GwPFHVqwjMuGOMZnZx+jNCOaK9o+9Z4gDQ
 pl0UnJC8KWQBJxzcPBp8bfL6kHjDcnX9tfyJbt3/JyCijxpia6YrXjVEnj9EFtOqg3ERWNfJPi
 f2UeJKaKpdGaVGWOXxJy7K8AWB7seQJAQAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ron Economos <re@w6rz.net>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700695933; l=1054;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=vrpXxvCGGH1YSMvQ5Jqe6xeNNZN1b1oOFmQ9hFvEp70=;
 b=H+vCsGlFIDAhGLcJCyOavGWzQy2EFY2oZAna2dyq5R2q7g2O6wwED3KreBmoVYvsgWxcxXjlp
 dRS+VBwsxmcB3uzdrkkC12s/Ph3jvsZ6CLb+KWMBb6gQEVxE0y2rRgT
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_153218_573967_8B6E55C7 
X-CRM114-Status: UNSURE (   6.65  )
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

Module loading did not account for multiple threads concurrently loading
modules. This patch fixes that issue. There is also a small patch to fix
the type of a __le16 variable.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v3:
- Cleanup pointer passing (Samuel)
- Correct indentation (Samuel)
- Check for kmalloc failures (Samuel)
- Link to v2: https://lore.kernel.org/r/20231121-module_linking_freeing-v2-1-974bfcd3664e@rivosinc.com

Changes in v2:
- Support linking modules concurrently across threads.
- Link to v1: https://lore.kernel.org/r/20231120-module_linking_freeing-v1-1-fff81d7289fc@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Safely remove entries from relocation list
      riscv: Correct type casting in module loading

 arch/riscv/kernel/module.c | 97 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 26 deletions(-)
---
base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
change-id: 20231120-module_linking_freeing-2b5a3b255b5e
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
