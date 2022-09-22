Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C600C6FA8B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/YqhIx9E2kwNZ77MkxIHw8nknvI5vBGmHzv1X3MIyG8=; b=42VQsmcdheLTE/
	5bHgP+U/ez1fm+nLY5X8G5c70wDHXwl1G2ZGSVG0rJ6jSVWFJFkwiXQlochSQypLsblcKWtvwcrD3
	dVSs8d11n6ghx23QmdSIe7VCNB1xq/okfSsOEZHdcbJ2OXoGP+VwB6+jtENVLVgaTxK3Ohmwhb3XF
	utdlY3jiWDo7FIQ2l8dKIkzQIgKccRygAqUO8DDbXqAXJVbD0X0HKsjllqUlZFBOQ0fUjszZdRSLF
	dPG3QTuzrQBlU3GjS3F6QHpdQ5Pwrxr8h9IRTxaT9ObNiNWDZp4PgCJGDU8izsanKFa1x8EBgvTFD
	iXiUSPndKj2C7dYPqkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHhG-00ECJj-69; Thu, 22 Sep 2022 08:36:38 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHh9-00ECEs-EA
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 08:36:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id e67so2325222pgc.12
        for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=MhRarJ6HsClW27b7vtuGGO9+1qjL4ewcJiYtQp85NVs=;
        b=PupQ1VxaalBQAbhKNzbtAp0aIhcecxHqTumsawCvdkP4elLO+RYGH0ybVsanFd5sIX
         mmEqUFLUXcybEAKVaOPAr+KdXlORbLX4DOCGO0/siKbxw4UgzygAAV73hGyXt6UGRvoD
         qWqmI0K3gGelI+TD3fxNbdhas53GDkJNvA9Qiq2HfmXLy5jy+Fo92DvQyEAx/y+E0mYy
         opg2pA8aNRd+OHsrxx8EoqHD0P6uwxXgFwSqtpyuGeiFZBA+ni1zn0VJsDlmgCoxmE88
         Om8rh1QFhLnDtSIs8eQM3gbl6ualXSf52fKJZQAspuSeLz02nyy18bA6YHWRifMcYzbi
         9tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=MhRarJ6HsClW27b7vtuGGO9+1qjL4ewcJiYtQp85NVs=;
        b=3ha1gK8QOYPihGaIdJKCUVmwBsCzx03CHp9MGpPWcHQiPJx8fEtHwMX3D7PV018e/4
         siKvUT8/2ondDnV2mbQeUwbZFOc47hqbepqfxXqFoGCMFLzBfivB3rOu5tlnEPbbkSUv
         dcH8KN1hHI4UJoS/k0SNobyFLy7okOihtYlvqz6C2BPCWihjGvkag8Pc0tDHaNmxq9Xm
         obGgYhZCI1l+bPpMeDtSCabq7UZi4VaXS5WwuWGfAfjdXAPxAQ1zn10LgItSVY+x/3Zc
         jU5eo6/2LpcZDPK7bA9TTwC1Xudcfa5twsP/Nh7HZVqah2B/p/5l5F12/ENIkzXPs+X/
         0xSw==
X-Gm-Message-State: ACrzQf22eNBGpTQ/NQOt2oaTwglc56Z2YBIaAUVF+MjNI+pecNEWtXZn
	pD2GL2mwaOJNsgJOvw8DB5w=
X-Google-Smtp-Source: AMsMyM6mk+Yf7RFgk2KXxVPzP22QjA+djcokpAoyZFs5lc3NU+vZL0sr3+rtx+PSS7EDWQBPGRebZQ==
X-Received: by 2002:a63:a501:0:b0:434:ff77:1fda with SMTP id n1-20020a63a501000000b00434ff771fdamr2131551pgf.310.1663835788995;
        Thu, 22 Sep 2022 01:36:28 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id f15-20020aa7968f000000b00543a098a6ffsm3631338pfk.212.2022.09.22.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:36:28 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: xu.panda@zte.com.cn
To: brendan.higgins@linux.dev
Cc: davidgow@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	skhan@linuxfoundation.org,
	dlatypov@google.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Panda <xu.panda@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] kunit: tool: use absolute path for wget
Date: Thu, 22 Sep 2022 08:36:11 +0000
Message-Id: <20220922083610.235936-1-xu.panda@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_013631_534685_4CFDD925 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Xu Panda <xu.panda@zte.com.cn>

Not using absolute path when invoking wget can lead to serious
security issues.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
---
 tools/testing/kunit/qemu_configs/riscv.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/kunit/qemu_configs/riscv.py b/tools/testing/kunit/qemu_configs/riscv.py
index 6207be146d26..c3dcd654ca15 100644
--- a/tools/testing/kunit/qemu_configs/riscv.py
+++ b/tools/testing/kunit/qemu_configs/riscv.py
@@ -11,7 +11,7 @@ if not os.path.isfile(OPENSBI_FILE):
              'Would you like me to download it for you from:\n' + GITHUB_OPENSBI_URL + ' ?\n')
        response = input('yes/[no]: ')
        if response.strip() == 'yes':
-               os.system('wget ' + GITHUB_OPENSBI_URL)
+               os.system('/usr/bin/wget ' + GITHUB_OPENSBI_URL)
        else:
                sys.exit()

-- 
2.15.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
