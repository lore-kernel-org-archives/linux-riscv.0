Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AF2E7718A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Dydcx1/oKjgPAlgDAb/G1Hi1KbpyA/SRrQRZuCY7ck=; b=VvFUbbenyS7Zjz
	dDJuK6adrtdELUZyg+zsMTrl72wYm+aX9sGP4wWqSS40gtBm+AxYhUwYyOCqvI73L3d15ZYkOy8wH
	5ZenS4kvzgPIEpXAVnNxj4B2skr0xCoqQcH31Cv3QOKIhrPa/cPNS5+IQ/7ypgTox36AjKqSYnM34
	GTx+TvpG5NXNbHBWptUXQ1snMvxWLw7g3RFF5gagOgpKdQnIKtncj1wOr5Rn2xXgMDtnmWPfUlX2A
	cCH2QHZQU78zZGtQQNiMR0GqhHJyrqTOZRaSRVEA6I7lS0IVJ70NR1aalJOb7f4eWfnI4Crd0CHQ0
	1x05jA6VaOT2pymXX3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ8r-00000004Ojr-3dlD;
	Fri, 20 Dec 2024 09:17:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ8p-00000004OiV-2CXb
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 09:17:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-725dac69699so1510855b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 01:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734686271; x=1735291071; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a2aSwIvmjb/5T6lJn2rQ/9k8U/HxY8PQ9cPVzeLGfwY=;
        b=LovK9q30E/9lqTpSDl/ufHK4J+SVLwm4218PgFi+KF4hjH78NWFULsbe+LofmT8fsQ
         PiVn/MlnS0FVTia+vxbNI70org0uVfbg0t5F9WEVlZ23KShYk+qYkoFbwQHQcaUGo7tK
         lcBhrDUOgh8Wj/oToB3MTQQ6x4v6C574gEWIEXkO4/t5Gxe3SlvkohrU+ZEzIbE5bB3y
         SpDgDaVCuD9bnmDpJN61k0QwVCxE0AbNBzjSKXrLmghvnOejmgFpTtnx5OOt3qxSQZ2Z
         G33cAUBFG9dwcvtXlsIVOQSm+8K4cRjHSgIu7cz2fnvPK3ojgJ4Tl8dwnFe/0ArR0ysN
         Gj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686271; x=1735291071;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2aSwIvmjb/5T6lJn2rQ/9k8U/HxY8PQ9cPVzeLGfwY=;
        b=ZZhpdjrT78lMtd7l7fkxldsEy38qS+6WKx52QXW4AUy90v7bORFzUcKSd2gIv+y0dA
         m7pnLVBmuNxYl79i2Ns4Xm7jXmf0pErqV+h6P9ifmsRXreotAggldAOxOo/M/hw7cCTx
         Lrn+ePZT796zXhNM0wN1HUvISEV6xutiyHTF9N5NoL1Q6AzBe6qJRB7ZQrrfElaOpvyU
         8aPWEBGh1lYzl9OHp/9VAasRi7tPl8XuPS9b+WiKQvmvcPv7w//toXZV6Kzzh7L/P2rl
         TXX1egksae8nB3yFNFfbQTpaoNd6dJzA/kjZyD0ELKmXTBcm3Ir2kk0O4xWia/0i5zUE
         ftuA==
X-Forwarded-Encrypted: i=1; AJvYcCWHegth0PwekqxCAZuwkyF5HLg5fnQnUYulnbyYiCRQlUJGI92KOyAOr60tnezk7uo2dMsmA6ovuGtTSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjFVyS06DjMNzL6gl5OFnJ7xHWpkl51rayyAg+dYNjf9r5UqD7
	mcx5FBA3/n/7Mvw6o8ufW0b3Xzmu7yt2k2aH8CRHRrR546/jQBfyQztpD21m+aY=
X-Gm-Gg: ASbGncs53dGHwCksXDkaFbjCdwKld9AE0I9C76XJMQHy5/5wE9Rtj4QDRmbMCliD5YR
	VE/0VxG9rM2MSFHcPspTudV4q4iJAVMJYr/b16XYDTVCtHWG3H/yJzVPzKBd4hJgSNmGfXgTDje
	5g0ByFNb1eZycALGn3dt5TOn2SNOI7gM66DeJcnC0FX+mp1d1m1QWAB6aZqMT7MlOMrVOVFYsCK
	bn3D2xxCoNuirJARF3yAQN6CqJ9+EZWetCj3EIuV45kvD3LJM51aI1tpQUL3fGNxUeX+fD2fu9b
	+iPFn5/Naik=
X-Google-Smtp-Source: AGHT+IFjmcyrQBlqsYi8A3jJx2RgZWdnoNiqiG5tYyi/sN+MGEEnkPUZWugth5TL0+738iD0RCKCCQ==
X-Received: by 2002:a17:90b:6c6:b0:2ee:b8ac:73b4 with SMTP id 98e67ed59e1d1-2f452ee4fb6mr3045312a91.36.1734686270930;
        Fri, 20 Dec 2024 01:17:50 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478accb3sm2806715a91.51.2024.12.20.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:17:50 -0800 (PST)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 2/2] tools: selftests: riscv: Add test count for vstate_prctl
Date: Fri, 20 Dec 2024 17:17:27 +0800
Message-Id: <20241220091730.28006-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241220091730.28006-1-yongxuan.wang@sifive.com>
References: <20241220091730.28006-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_011751_561066_57B89F65 
X-CRM114-Status: UNSURE (   7.39  )
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

Add the test count to drop the warning message.
"Planned tests != run tests (0 != 1)"

Fixes: 7cf6198ce22d ("selftests: Test RISC-V Vector prctl interface")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/riscv/vector/vstate_prctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
index 895177f6bf4c..40b3bffcbb40 100644
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@ -76,6 +76,8 @@ int main(void)
 	long flag, expected;
 	long rc;
 
+	ksft_set_plan(1);
+
 	pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
 	rc = riscv_hwprobe(&pair, 1, 0, NULL, 0);
 	if (rc < 0) {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
