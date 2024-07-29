Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17353C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zfbm3BUxKTc0Q60d23iTD7YCAatBiIdY9V8yNam0Z1U=; b=SxnWIbj0uhrpJ3
	IJF8YFXevg1k0EHAaZMJt33EpkZfFv+ZlaUHFH+G5tJNckTLKUGJr/u8Ah3OVkRyTodBB6z/TA/YV
	GnSkIBGFkClYq/YSwVnaS35fnNiAWwCL4r3pyKTbL6XJ4IZ2lX6E843mK5xImv73s0BE3Jfyl8/cu
	00JJYSyKNV3yIOrfJHDS1H8wXeMPxMWePeXybXXbl+b6AGKKAaj5tFbYen2esdEi4y4oo5XcgaYLK
	CkTYoJf7XHb76jdubV5QTvZw43TZlO4EXRCnwb0Gvs+tchroMupf/I/ZVDowkxwDz9Wqssq90rVmq
	XY94eVINxy2olLEdDeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNe0-0000000Atcb-25Na;
	Mon, 29 Jul 2024 10:30:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYMVk-0000000Afk0-2r0l
	for linux-riscv@bombadil.infradead.org;
	Mon, 29 Jul 2024 09:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4J4SYhEOa1gabPOMO05hjVOcl3yukqW8OZI/5xw8IwY=; b=GnbeYelgl3IQsIzxs8CnLqcfCF
	9XQTNhGYpiPLJOFT+3LiJGRsLj9UfY6gEkgwuZqWNTXTsYF7JYoWNhDwFa/24KuHKqfhJ4WWAJ/m6
	EkJ7J/ZB6k7edZg8oHsPjUkL68XabXb5yxUHWTugbYf5SGch6/q7sMQfBgSbUS9fMr35rbe/SkK5A
	/3MZCs7JYEXScOTErZQbiEgVK5s2N2nOjiSKHzxJHJO5Bl1Ub1+91Gfoh2guKkkjBDiyua3X94yJU
	SNnIfQazM5CtGR0JtFSILVLHqJNZqO7wtTo30u/+jpzdYCky1YYIN22rtvWX0aWC+LOXkFKkavH+R
	MVeUCWzQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYMVg-00000004knZ-3A4a
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 09:17:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so14895815e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722244656; x=1722849456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4J4SYhEOa1gabPOMO05hjVOcl3yukqW8OZI/5xw8IwY=;
        b=OQIp/psqme7UmKcMnt0+if2ghMRb9yiugp3pMDByOoFxyIZXOjROqEISfzAuM7a0HO
         jpw5hQ1yeYWquoVViCyJ2KSP8Txb5aIA/yh2J6OEGKQlb+QGwiJwgQ6UUtaL5BtD7Qyr
         LS5m2QaqmOe+TKDdS01hnX/FD3VdknIBqe0sOlG3YPXyDQjFPoWOGpK3Ixy91znps1YS
         X1VXHwoYCx1kA3hAJToyr7Ou3uy7hKzMuWu2qTFEx35QK1t2UjIFyOT7fFWJmVU0Vgf3
         +FOMiGnUn4eNto26Sl+njoxiuGyzyHyJTQE137E1RUrnRqXG9u8DU4/p9ChOU3WjLuz4
         Qi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722244656; x=1722849456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4J4SYhEOa1gabPOMO05hjVOcl3yukqW8OZI/5xw8IwY=;
        b=K0XIsaUB1s8gEzcuTC+NUFO8bj38jDIl5LiQ9ftsADjsKRl0/fAJnVxkWN+d6VbN/I
         ZnSQ9drVU11Ec7rKMLRUFfq8zFnbMty4JZ2Eb9ocr5ZYejSyJPs6gB5DPVcarMtHYRRZ
         YxBzj5ycoNemFmQFcHlGpb5pGjAwUx970oy7tsGO9uaUYwTnGdtKAZhsAlEsXQDir4hU
         GIx1ikfrUtoqlDZdDNx0LNwha5cvsT2bWcBX3nAU9PwMyh7AjMp1dZF61VAkj7LT1AC3
         GwvEo4zwuHsG3Jv+/xt9aJrlHGmMdKPNdPeXV/HR9jlhib2v6EI2nbHI2S4DbFr4ZetK
         uOIw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3wspf8raYd5qCQU3OZC37zjXXW2Zr26zQl6TpL1lk968GKMF+ImfUcQvTPhLGXyMNSwW9xIlJiQKX6MAdtAvFJoXYE1kqRsGSBThsSFd
X-Gm-Message-State: AOJu0Yw0TNEE1NtB6UqUYlKR6NzFi4pF9LO/v/MSOIojNlH2nMOVxMP/
	LtVRIjPLGlX5IHhoSSOZSi/kBz8VqSJUqH2nKvu1KfsFvIliUmpq
X-Google-Smtp-Source: AGHT+IF4VHDW9ojKBR3q4Jivc1+iyrtgdpimZ8JmgOjlc/xzRxT+ve0gc0P2I/uxp+rWVbQ0JWSdXQ==
X-Received: by 2002:a05:600c:4ed4:b0:428:1ce0:4dfd with SMTP id 5b1f17b1804b1-4281ce04fafmr18629985e9.34.1722244656245;
        Mon, 29 Jul 2024 02:17:36 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42805730e5dsm171836905e9.2.2024.07.29.02.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 02:17:35 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] tools: selftests: riscv: Fix spelling mistake "regesters" -> "registers"
Date: Mon, 29 Jul 2024 10:17:34 +0100
Message-Id: <20240729091734.42259-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_101741_584826_A3AE5305 
X-CRM114-Status: GOOD (  10.49  )
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

There are a couple of spelling mistakes in ksft_test_result_fail messages.
Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
index 1dd94197da30..6838c561e4c9 100644
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
