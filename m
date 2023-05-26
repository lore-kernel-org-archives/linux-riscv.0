Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E463C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HG50ZRbqoFGcInTPSj5V81teNIfSlHU2k5nx2tM826c=; b=sLq16IjzvgDaUe
	3U30qPL+sSSoW7bD1RBUtcqyD9vug6X2Rvzh4U/l/UPn6J5B1GrqD7JuQ5RnyV5BFSoHcFv2gIMHc
	mCl/wW1JUrl9U7476bwDK4b4iiZSALZ8khgQ+Jc1Q1EnquGiTUYu027Siv27tKlRbqiT6WNUPhgLR
	s/5ueNaXU09W78GqlRbqMMpnDqzAC/2Efy0tkWEoUzYu/2ho7EDq5nTnoQgTn7+1ooX/yKRB+/jWD
	vgrNutkAPixuM1bwuQG/WDGkWJYryb2pCxLnRoX90nUHX5KguNUBGZTiDNsSfPsg/eduMohOn25Ga
	FpDr3V+6UUMu7CVVcaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udp-0020te-0G;
	Fri, 26 May 2023 10:25:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udj-0020pc-1V
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 10:25:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30ab87a1897so304463f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685096741; x=1687688741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83Yiipzb/K6uBEC45mb7hvHrhNXCoFghYohKA0/J46U=;
        b=WuxmoIdz7t/DQh00qkb1NrTKQqK5pxsfgSj9aycJdlIOZYMbYtQl8KLfafSWxPqTiY
         a60mJsEGYAmNSZxycrRzocy2yksn54VXqaI0XzjEntMD374XCzerlP/7Ssc9f4mRfl4f
         Q11s7l4+sB+a9itRrQYSGAdqNWGgsbDeQPZK/N4sYR0clU5ZdxaGQlOzYfXI5H7DMoxO
         CUewkn3xbMquE5invDv+efWV8Rgp/KcC6GJlZkQ3pAdZMLiN6EuFbYU+ARwlIykyeZ9m
         yRytCVcMmJfCoYyUqupxeIKqR1kmb/CXNAzKaZ/N8IUlpmB3NXfadNwWbuPf4s/jyHiq
         xgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685096741; x=1687688741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83Yiipzb/K6uBEC45mb7hvHrhNXCoFghYohKA0/J46U=;
        b=XaXj72VcnfVRLBAJerUtcA77VWNEmHl2yU+8CKX8ERW4XClr5SL5VGHcpCRVk/E3zP
         vcSQIB79WsJyoEO1+sai2OCozkqlcNgdPbLRZBxzhJE0HrkFjkcv07UC0vDdPJ1Tnf2p
         aO6llevLzxmXZa3mExZuECrzJ0LdneJOy798JaTWXs+z0IYP9AbENQEeOKfZz65ajqE1
         Bi3lmahNV67dCqufgsr/ZERE4kV2DzkHpGN535fs4/XE6Cfm5PB9lBGlz4HBX6VBCDaB
         j7hwcIcdlhNbBja9L6FZgOUuX8yLigOdF5GYx1T37P1rkyzH9LFfRxeriyr4pi7ZRtfv
         mplA==
X-Gm-Message-State: AC+VfDx8P241xkvTnbyGEACWpgyA0Z90ysy7slSGP3NhC+IAnDrRpKQJ
	i3aPAKzhT62Z2TQntCQwJhphFXi2j20R+UhWrFo=
X-Google-Smtp-Source: ACHHUZ7mn4W6pxjRrEQfRmIqpygLY/3T1mdQVU6d/sxNIPITfbuKJtIuVzoy5nvF/NtN8PTbkxsWMQ==
X-Received: by 2002:a5d:4990:0:b0:306:44d0:2bcd with SMTP id r16-20020a5d4990000000b0030644d02bcdmr1016138wrq.9.1685096741586;
        Fri, 26 May 2023 03:25:41 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a2-20020adfed02000000b0030ab5ebefa8sm4707928wro.46.2023.05.26.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 03:25:41 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Anup Patel ' <anup@brainfault.org>
Subject: [PATCH v2 0/3] RISC-V: KVM: Ensure SBI extension is enabled
Date: Fri, 26 May 2023 12:25:37 +0200
Message-Id: <20230526102540.105013-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_032543_503078_8DC15604 
X-CRM114-Status: UNSURE (   6.64  )
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

Ensure guests can't attempt to invoke SBI extension functions when the
SBI extension's probe function has stated that the extension is not
available.

v2:
 - Reworked it to use an enum array instead of two boolean arrays

Andrew Jones (3):
  RISC-V: KVM: Rename dis_idx to ext_idx
  RISC-V: KVM: Convert extension_disabled[] to ext_status[]
  RISC-V: KVM: Probe for SBI extension status

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  8 ++-
 arch/riscv/kvm/vcpu_sbi.c             | 76 +++++++++++++++++++--------
 2 files changed, 60 insertions(+), 24 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
