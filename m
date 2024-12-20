Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767C6E7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzP7RG3sbxT6wmKoW0zupH70UrNsOVJ+vNB8k5zD86s=; b=yR+j8drz6QEnQ9
	XGyxHDrXQ4siA21/UgSMznKD48KkwYj5j0T76MPH+bm40pwDQMm+dYs3o1apJC1H3FNHFg4MKE4R+
	28j0LwiCnfJ4iATALkgVJpGmU5hGfs6lvxQsQesGtoApsaCOBC3TUNg8bw2ZD6a5uqlL1pSkAfT26
	J5+B0gi612gh7cvvVOVcOU+z3xuIYozBbV8q26kc0cwM/5JXwLWA0QmZHP0aPuK29mZ9tElFv1CsP
	vMMKWYvB9hGnXp4c0PKkHGjqaAGo5ZVAOXM3FsOIUc6QbmkX9nP02ZV2d5IuMS1hQiKiGr2E67PbO
	04BnIKmfzm/tJGW/PEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ8n-00000004Ohq-1DsH;
	Fri, 20 Dec 2024 09:17:49 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ8k-00000004OhJ-2IIM
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 09:17:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso1201042a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 01:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734686265; x=1735291065; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TP5qOjrI57kWD6zWMzt52g3yBCK0dgwWUIqK6kEf1tg=;
        b=GS2TYv6sUYFHH1dfPHeW7T9W/TBmK8+GOAYuFMnV0oGr7gmK+T3Nf8Ahd4Ou5UXvWe
         VcP6nwdye7YotbECaTEhqEZOO8NehiD/plxYRasVqHAulz463atzXb0L2klv+UZZiz8Y
         5/MVGoKVIFeH9pdcHxCdfFuaatxt3x3JhkLBGFx2HH+rFF4tm0yZ+zuN2ZUoe0mVNRKx
         M3gtmegfAlDP0Jy+aOwMDu1wYLiDcShStNVQetBtB69PyOy/zyB8XxvelyyNdXPXOpBe
         Tvok78+RVhczaxUoMR2uuxYuNBJgj8ikXblAud5iO0QteF9O/nBO7ET2AALVehSSO968
         qKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686265; x=1735291065;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TP5qOjrI57kWD6zWMzt52g3yBCK0dgwWUIqK6kEf1tg=;
        b=idKOF+BOniTle3PH4pSQWwAAgASZQPx2mauEwccQOxP1SQNl+oeXBPK9us7Chgwf/C
         deLUCJVrwpcAd31ucWrpJ9HejGn8zxb0JOJSb//oUXatM0byff1G3P8k/Cdk0h9YxNUt
         RaKbJM69Qh/VZFoBF4R8xIgC7b+vle+PS4jUj3t1GX0mYpqlhkt7WsGvaap9lm9pzUrH
         r+wu0uhSe/MpMbQR3/N0WzrtSBIlXYKDn8ftQkSlgdhHjngu0Mn1IAmY1TqFlmGV0R24
         xZfFsw5I5Uf55HTlFP95Rj3R0Aa6wb4sPnyaG6vjazW0ThdnK+IrCWsZnThghdcsPGuc
         D8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVIUS3SC+pfjYUSxl+KrQ0VQQ4hklZ0YygcGq5ileMO75mJWM+6H/XGIZq2RViA/WKvcbj1NR82xPcEFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEDun3fi9I8l1n9URIC2UXIPpD3wAFZ0hou7R7kNUkgNNPMEct
	5bNbZdEGxTylul1QiEQoK0bPPmi/AY2OA0RNXfU4JWiDVZnxWhkcRwGw+ATfhts=
X-Gm-Gg: ASbGncvGASQssrwY4Ef9NG5swUbuUdwiC1jO3l5qvo5u2XrDtbMTspol6xTFXNepDyj
	5zdR2sqYVAGxRtikYt8/g7lclwomCDJx5BBCLP2VDMpiVF/UppYUtn29uPTY/GgjCl16qf3tQUG
	pUyO53DypOcEyPLqUeU6ykcVC0PsKgUw2zgkxPoVRJe2SxzwemimmTAvxMDfEmeVQuanBv+2RZY
	Yeh5cwlQVYUZQde2qSTz5Let9RuAu9i3g34abSetbiQ0MVM/5g1/jzh4J1bPKHgi2fMqSRBoady
	V+Ge9s/uTY8=
X-Google-Smtp-Source: AGHT+IH9rFiaKDarDUSmEqp+9KpE/3RMz+i1dnvxYBYVDuchWTO2rEyPkbRw2EmqUNEub9WFrbkr5w==
X-Received: by 2002:a17:90b:548f:b0:2ee:8aa7:94a0 with SMTP id 98e67ed59e1d1-2f452f014f1mr3159829a91.32.1734686265637;
        Fri, 20 Dec 2024 01:17:45 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478accb3sm2806715a91.51.2024.12.20.01.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:17:45 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH 1/2] tools: selftests: riscv: Add pass message for v_initval_nolibc
Date: Fri, 20 Dec 2024 17:17:26 +0800
Message-Id: <20241220091730.28006-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241220091730.28006-1-yongxuan.wang@sifive.com>
References: <20241220091730.28006-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_011746_588558_A82F9C6F 
X-CRM114-Status: UNSURE (   9.03  )
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

Add the pass message after we successfully complete the test.

Fixes: 5c93c4c72fbc ("selftests: Test RISC-V Vector's first-use handler")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
index 1dd94197da30..6174ffe016dc 100644
--- a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
@@ -25,6 +25,8 @@ int main(void)
 	unsigned long vl;
 	char *datap, *tmp;
 
+	ksft_set_plan(1);
+
 	datap = malloc(MAX_VSIZE);
 	if (!datap) {
 		ksft_test_result_fail("fail to allocate memory for size = %d\n", MAX_VSIZE);
@@ -63,6 +65,8 @@ int main(void)
 	}
 
 	free(datap);
+
+	ksft_test_result_pass("tests for v_initval_nolibc pass\n");
 	ksft_exit_pass();
 	return 0;
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
