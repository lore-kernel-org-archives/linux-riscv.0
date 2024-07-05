Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF53C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 06:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X1urObs9QK2odMpF4nx2oGtWyyiHzGE8GGlbJLDD190=; b=Y5vj1CgjvG5e4f
	f/Zql5UyOHgZBv3nGOTAiRPmhwlDOAEFCumqnxpQj+b/lwGkcXljy7h2Nu7sKqIPcFVpR5Jj4H0Y+
	o4dc5iWbj836ReWG8jztQSmfNQ7MOun+kYm6cZ3y6nTHp53oakwzL2V9wxe0YczeY9xUYfkroPnbh
	qlI2vWJGCXr36XHy/RU4sNVmNg35fhNBSHr5HGL36CAK4DTTx8r5ScGIm1RlwxAbK6kQHsv3ULkN2
	UQ4d33KVAyXzJFvhtFy6LzRit5eiBJzxjzOVV9Jq4M8ebhjk3Ui29KQFCgKb56lRxoimdOq80lX5W
	/3A6RszkMmZH87x+vURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPc89-0000000F0YC-1742;
	Fri, 05 Jul 2024 06:09:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPc83-0000000F0Xc-1s9X
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 06:09:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4256eec963eso8493135e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 23:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720159745; x=1720764545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F2irV+74U1sj/QLOHmfl6f7w4EpV0Hch2lBDdlAQVrA=;
        b=e4n48KAhukNfOsxJHL7sWIUv3VOldxViQ5zfKv5zRkFtNw2KfkVdK/j+2MInahThC/
         jyq33hdbVjJgVustQkehOZ0WiTHV73Kpw/0Cdz/FU9pI2ljSwVw0f+jnDmmK7PrmIlGR
         3HdTAOONjYyfAW3OcgTDxRKjvAjKqIFciOM7AMlw86SmEzsQc6pHMKi8Z8ke6p+BccFJ
         +G1L/ZtmNX6F3Ff5O12VIu/og+Jvhpl9VmO86WP8uVLLqNo2BGL+vft+yiVNMp66zLq2
         BN3GkDogEy8f3R1NEPVoIqkB5SckaNDJuMY5a6mmpe8LkiLmiMbq0mD+LGGJTtNGBLim
         n/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720159745; x=1720764545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2irV+74U1sj/QLOHmfl6f7w4EpV0Hch2lBDdlAQVrA=;
        b=N4sUS28EIksqNwG+uPw3tYsLKPV0kjDiRuK08Iy2lkl+WFwJi6pILAB/4gKAs1PBCw
         LQnqznU5i5xBqLVFzstifkb3HqSBm6okiBCXH34JTP6/7GeJ1S+HCX1s2r4V4qjMcE56
         yOEPHY/STnxktzyamU3nYfkToB3VETgRAaUntQh5iGPLZpmP6bHRnf4GODU1bA6PPhZj
         KpNXfz9kfrNkhbhASid2Gh0iOgyU5rR14Qme5VVXJ7kqHMnxdweB2EYJjmednKvnXtNc
         A87OxNskiOA61QvNLy83z1EKNG/a14ELyZ6stTdFbDDOtlJbu0REfLwoHf9HETN5f1+I
         4AEg==
X-Forwarded-Encrypted: i=1; AJvYcCXVQBuY+wtODAoMgqB69i4EYALseddxQgpO9FXgjmelV2di6iQIjDaeISFKsyasAuv237nS0ws+3c2Cyu0n/KgkVrfbK6e5qeHAn5/EDKsW
X-Gm-Message-State: AOJu0YyaC5b0Pt4FaRAn9llDtNxa6OlnpbXcQQA0Z9AEWo82446P35pj
	HqMbT80iiTUQ5q5zdMyUPP+BfX+Q///AaSKRuGEfLU2sjkJvTP0DSXgteNBAN50=
X-Google-Smtp-Source: AGHT+IGPH7q3QPIhsxrOuPGnR5xF/pM0f0Ix1bFjxS21nFb3I2IhRoxLgCXjQ0q7L3CqruDgrr/YXA==
X-Received: by 2002:a05:600c:2149:b0:425:66fa:c7cc with SMTP id 5b1f17b1804b1-4264a48c5a4mr26558225e9.37.1720159745226;
        Thu, 04 Jul 2024 23:09:05 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm48641305e9.13.2024.07.04.23.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 23:09:04 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>,
	Roman Artemev <roman.artemev@syntacore.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 0/2] Prevent dynamic relocations in vDSO
Date: Fri,  5 Jul 2024 08:09:00 +0200
Message-Id: <20240705060902.113294-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_230907_880466_0FD26423 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UGF0Y2ggMiB1c2VzIGEgZ2VuZXJpYyBmdW5jdGlvbiB0byBtYWtlIHN1cmUgdGhlIHZEU08gb2Jq
ZWN0IGRvZXMgbm90CmNvbnRhaW4gYW55IGR5bmFtaWMgcmVsb2NhdGlvbnMuCgpQYXRjaCAxIHJl
bW92ZXMgYSBkeW5hbWljIHJlbG9jYXRpb24gZnJvbSB2RFNPIGluIHJ2MzIgZm91bmQgd2l0aCBw
YXRjaAoyLgoKQ2hhbmdlcyBpbiB2MjoKLSBBZGQgcGF0Y2ggMSAoQmrDtnJuKQoKQWxleGFuZHJl
IEdoaXRpICgyKToKICByaXNjdjogdmRzbzogUHJldmVudCBnY2MgZnJvbSBpbnNlcnRpbmcgY2Fs
bHMgdG8gbWVtc2V0KCkKICByaXNjdjogQ2hlY2sgdGhhdCB2ZHNvIGRvZXMgbm90IGNvbnRhaW4g
YW55IGR5bmFtaWMgcmVsb2NhdGlvbnMKCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxl
IHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
