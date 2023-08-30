Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4845C83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-ID:Date:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iq7JqQEsxSr31ZoYat1yt3Pfhhl0DZiTU7AQPksdj8w=; b=zNV+HUkY3wXZp3
	lZ32rPYAR2Pqg3u91Iay/+tly7iJlxleNmv/Rs2kWQFvqlIRiDelRcs4JMNBsowOeXsW93+8TkNeo
	7C9v0KwgqaoqDvOqujrnZy9gxdCelXGurzAVuJJ/2vGsw7dny6lphocvjwTzuULw05pvB1dVBTvqn
	W3rpiuPQGsMWhQZPPH5QnNzynfBZnyErGNzY8mVrQi5BfBxHTmsA8lUYgfVCybsXEB8UmgLV+CpX5
	9PLC4V3+P0L1+ebPlHF549owt2+IOZHFoOaw3/CObmQn+UtqdTsAJH54kr/j/rq1XUTdB8/q336wC
	wcmf10Xi2G2Kp832VcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL2u-00DX20-1x;
	Wed, 30 Aug 2023 13:15:44 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL2o-00DX0Z-1U
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:15:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68a1af910e0so3939155b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693401335; x=1694006135; darn=lists.infradead.org;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=hegZGm3fiElU2nJN71cBypkdNJb4po99SKzsZOhFDkQ=;
        b=2xHXjnAwk09O3Fn1szX1QmVQS5sbSNNhsm2LdOJSQRMn/w3/QYJVq3dgUD0pGFo1hF
         jJwN5n0hKoWBgALXCcfAVAO5i1xF2se/LiQMXkXKuKYA5NHsCTLt2LBr5e+ndKCMdcQ1
         i3qtRpjB9KZdLQmh+EFAdrhxe7u9ZXDkaLzP48ZwW2HzRWDL4gp766f6QWKJFtD3jS1u
         H0bSoMZckVcbDXe+CC0d0W4JrdquIs0NTvVJdfimLBAByIKngQ90edk1w5/M5hZXJ2qm
         wLSoOp/1iWTvy7mw/W4mLcZ9b+aFVM0BRZOIuNTyDyk2AUNwrCG2fZQbm5KreNGoznpc
         H3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401335; x=1694006135;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hegZGm3fiElU2nJN71cBypkdNJb4po99SKzsZOhFDkQ=;
        b=M23ieYFKdL+a7rHhcerxBAdJVM0un0rftD/1QmEo+mTP2Pnz2ixAAdQM7pynGjD0dK
         tbNXYXLcwL4hejkv2Eq9LfXzYqMoPx5x1AZj7Sz6mpBfcYmZGXIjB58OMw+OPpVUvwjn
         wuodUSje3Q4mf5+uSW68aE3J35PHkxxLeeJKvSRHbzBjiczKFCx7bLCu9AYrjpxKBSaf
         rQ0Jj/tRUIyWTNAew7Ef+XCP4zXfcAUvI4UA1ar9C49v6SuLVNFJCYY9hDkr7+PWJsvi
         N2/aiGzfQ6zyEKetDMR61UTOt/QT2U2aAw8J267K7JLp05ew3d5+jtbLg6EJpzE7qqhO
         XW2g==
X-Gm-Message-State: AOJu0YzovyGV8gL2wfd6pFbsj1J/Wwl9j66P90ewTrGmeSiHmoHc8sKF
	7o5GdByF67AMlaK/NhUK6MXvoQsbDga8JgKeeOs=
X-Google-Smtp-Source: AGHT+IHIK+t8JhSmJYeW8njaB9TgCBP4dM+lrXnvb/F5adEzsgF/tuJwnFryeVJRbs03zvPX2FxrdA==
X-Received: by 2002:a05:6a21:3d95:b0:14e:3b74:bd46 with SMTP id bj21-20020a056a213d9500b0014e3b74bd46mr2064494pzc.26.1693401335196;
        Wed, 30 Aug 2023 06:15:35 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b001b8c6890623sm11130628plb.7.2023.08.30.06.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:15:34 -0700 (PDT)
Subject: [PATCH v2 0/2] riscv: correct pt_level name via pgtable_l5/4_enabled
Date: Tue, 29 Aug 2023 21:39:18 -0700
Message-ID: <20230830044129.11481-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, suagrfillet@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_061538_493538_7E72CB4F 
X-CRM114-Status: UNSURE (   6.86  )
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

Sorry for just re-sending your patch, but I'd had this build fix
floating around as a suggestion and figured it'd be easier to just send
it so I can take this more quickly.  That patch looks cleaner to me, but
happy to hear if anyone has a better way to do it.

Changes since v1 <20230712115740.943324-1-suagrfillet@gmail.com>:
* Fix the rv32 build with patch #1.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
