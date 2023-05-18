Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE278C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIHZnlA3+UKnCyRiuHa18BkrbFCweBbChddIrC77k0A=; b=5BDPQN4DwWx3xs
	X+WUSziR00gzDS68YnVtWwsGW2M+da7b+tOFp2YqXMraBdewpymgEQ6n0HMWW/ylr9PYaFVJD6oco
	0p09IbKPC7CQSvU+FzSWoGsBK8Q9rDZs3X8re9drPnLR0gHiEnJaPgBfwYtud1Uc99wg9LfeBeixm
	0Z4pKT9G+tlyuG16qP1ubl6mexcO99tMKmPR0PfjXHqvzy4GgkwJFfjgGN6J1dcY28JQ1gm6cIZdh
	SJPyynzX5mS2z7FUXc6iPHJp45BorOxhqei/4YoUA5YwrM3k5LD3KG4hxB1Uje1IpM5NIl636Nkcy
	rZwlaZh6gf7uQeIHbxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgP1-00DRzJ-0C;
	Thu, 18 May 2023 16:22:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgOy-00DRy4-37
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:22:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so211512b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426972; x=1687018972;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbKkWHcrIgmeU53Vku19x3Zfwadjf8vHA4LYRH5wmCY=;
        b=NEzuFRUUhNOcH1q+Rm2j6i6gqGIp6xJPZ7cmA5mkGLFv+USZnOvW7CPzqUHuq0jVHu
         GtA7ZEFRhmBIY4mXuhnEnYyqYwcE+TU3PjI6DHlKhvnDeybKpslFBiEnvmkF/gS22vvD
         HHSJJElg9ZauzU3ulLEqqbltCizHYYAiTB0PEj5PhBig4wJl7H8VgLLgx/R7TNvTn0rC
         eMlyKdU5WWy6/GzMGahUnd0JVXFLZq0/+vTrnvDRootsNqND47vi78ULS+0TqeeadBGI
         Z+r3F1+htzAnsixZgXU6oR1vcL0hrQbjsFwGymu+x/afZ/DEKYgEmIqavy48mY8M9S6d
         ziKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426972; x=1687018972;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbKkWHcrIgmeU53Vku19x3Zfwadjf8vHA4LYRH5wmCY=;
        b=B2yGS+FYPH2+x+r+PWH4pRqApjMOWT2aR0CCf3aShUkNGWKe8xBVkvDRzOPzqw1UD7
         0gVZiQEsR1fhEyAJdDwHbAELCpSqrkTgCtb5P/tIwWPOBdRJO+0KktTvbF1v2ahSrLKc
         MukfoE7rfk4lVU2S2ZZCPPOLz6wPdqt6cJaStuCKLNBm8t4jjknOkvTYdDNWzzyMPMSL
         b9Qg7elaq+reeGOBxvxxxmuJallgtzHjJ9nijOj/SftRWwlAhBe5SwPTGEk7KdWUSz5N
         CLgsy9CK78BDSjzcQApTar/tvrUUFre1Hn7961LlLS6kJPZDUlkVbOCUHQbTHJJPvMsk
         yeZA==
X-Gm-Message-State: AC+VfDzKQlfWI3UkKWNmx/oIzZGYH8FZvy+DHMXKyBFlYVkxoBy58suD
	7lYwoHchaIUVU++Rx7lszXTznnf87UJOgJJF2J1PPUW/fLKrpWEGQfrM9rTCOUA/yHi3mplv41F
	MXLQNr9kPYCA67kxyJT2p4p/9bxLOrgzcRItWR9uPaRqaoS1ns/9ehokbP5GAInhS+iAKLsryRE
	NtwSnLdPgATMXWePA=
X-Google-Smtp-Source: ACHHUZ4cNt92/WP2ysaHY9D2AcqqSWS+D+pEmSvvEFQxQEF0lgCg7dMBCSKN+WsgVX9S5/lGcyi2ig==
X-Received: by 2002:a05:6a00:1a55:b0:648:d20c:37dd with SMTP id h21-20020a056a001a5500b00648d20c37ddmr5634519pfv.18.1684426971795;
        Thu, 18 May 2023 09:22:51 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:22:51 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v20 26/26] selftests: add .gitignore file for RISC-V hwprobe
Date: Thu, 18 May 2023 16:19:49 +0000
Message-Id: <20230518161949.11203-27-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092253_001647_BE4F855E 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The executable file "hwprobe" should be ignored by git, adding it to fix
that.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 tools/testing/selftests/riscv/hwprobe/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/.gitignore

diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/testing/selftests/riscv/hwprobe/.gitignore
new file mode 100644
index 000000000000..8113dc3bdd03
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
@@ -0,0 +1 @@
+hwprobe
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
