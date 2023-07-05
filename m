Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B433EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uKy/HKAYhYKfYIJm0+sKr8mo80ELEZbGSnJUqeVJof4=; b=4eGtTv3/0FwgFu
	tyYB2g/e/lNe7U1jVWE0uIJAfGDyow25PUyXki2C/FxRlWPH+XnEVNmECn7SeF+ZKiN1kDyjxq71Y
	WzvI49y5p3Z1T9Y1pXKWQqSpxDzVv+SugUYBhoq+E8f0lDRJt3QP/G/7TRJwhEtU4uAhu5dPQChYY
	P/46BXgwSKBxcSLtiaEclrxvYPfBxUN+z+62BlTGACCbL487yMHGqpat9m5nNa5l8jhwmtfFT64yI
	OeF1MKZA26C6797P4MVCY2mYSvp1AdE9KEKSQaeVbC5F+hKMztumhutuBFTlT+sQDA5PChHIkP+Jt
	4HaUmdH0OQkd9A//kw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzX1-00FSib-2k;
	Wed, 05 Jul 2023 10:14:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzWz-00FSgr-2D
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 10:14:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso66677115e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 03:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688552077; x=1691144077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlDTGxKAa9u+MMfrqxFnjprJCty9LTNk5K6Uo9s9JGE=;
        b=FMqifX2a0syOcCH/4H/HWrk26qkao7Gk6vgpVmIKL9hFDe6xc/jtngBFhuXHVaXQRD
         q2xMVdrHmZe+W54XWO8cNQ3oqjreEPSNFlAoM372QI5DNvShq1arjPSmF0XxSzhTw6Lg
         uc5/iDik2rXx7xs9oB9jfA2tRHNU6/+ane5lw6nwIvfvmOb0I6ZR1RW5QhBcGRkOWCik
         2zxB5DEVfkNdcl+Pt/hlcKSS3257cvANVWdJONC06ylqTx5yKLTpLR9mbVpWB68YIhA+
         BoE17WuaJIaHYpy6QVvk++zohLl5stBmZPcFX97v6uPbBA42ogccTDc1PKSvtLNnlkW4
         hCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688552077; x=1691144077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlDTGxKAa9u+MMfrqxFnjprJCty9LTNk5K6Uo9s9JGE=;
        b=aMUSv1IJo9xXxtqKX2uYSgcuOACANBGEF5Gpps9DHnb/vgng/gctZvBIUqCDuAvOYO
         7vwVoRBY/UsEv/tvJd+NOuZnR/H80WxFGm1PCVn1MBKFwY+cFatvPdGxNOSCKAOnbtw8
         qQMz0N5bGHlFD3rzAFSs+hgQtfdf09AKZe/Inf48POYeCLMXjz8OGXR3TtcVGyrMEdej
         TsBaKVMwMpgWSMxoqsZfsjhXgVADZMFtTKEznXIz8GehZ3ddG47LEW1tOdz4exjVjTN+
         hrEaM5gDUZiu0OsRDIj3OBNcwhrWpOB2iWg9pJ7TM81ZmK038p5ygAzKfPZaZ54bphhc
         UlLw==
X-Gm-Message-State: AC+VfDz4Uj7fH8YzI1u6MHsFkdsGjhwR7o9NUuvnlBEL4yYJV8L0k9d1
	i5e3dKynrSk6oR335h/uaes=
X-Google-Smtp-Source: ACHHUZ7K5EfFMNSC4PLTQGysSNBsmGFHkS+8k8ibS7sZA5Nzf+ZclnTrpg63X8YXOsKfj2XY0LGojA==
X-Received: by 2002:a05:600c:2201:b0:3fa:91d2:55b6 with SMTP id z1-20020a05600c220100b003fa91d255b6mr13704823wml.9.1688552077291;
        Wed, 05 Jul 2023 03:14:37 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id i5-20020a05600c290500b003fbab76165asm1672277wmd.48.2023.07.05.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 03:14:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] selftests: Fix spelling mistake "regesters" -> "registers"
Date: Wed,  5 Jul 2023 11:14:35 +0100
Message-Id: <20230705101435.1995171-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_031441_730172_D0858902 
X-CRM114-Status: GOOD (  10.20  )
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

There are spelling mistakes in ksft_test_result_fail messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
index 66764edb0d52..62d8884a1a0d 100644
--- a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
@@ -49,14 +49,14 @@ int main(void)
 	ksft_print_msg("vl = %lu\n", vl);
 
 	if (datap[0] != 0x00 && datap[0] != 0xff) {
-		ksft_test_result_fail("v-regesters are not properly initialized\n");
+		ksft_test_result_fail("v-registers are not properly initialized\n");
 		dump(datap, vl * 4);
 		exit(-1);
 	}
 
 	for (i = 1; i < vl * 4; i++) {
 		if (datap[i] != datap[0]) {
-			ksft_test_result_fail("detect stale values on v-regesters\n");
+			ksft_test_result_fail("detect stale values on v-registers\n");
 			dump(datap, vl * 4);
 			exit(-2);
 		}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
