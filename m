Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C17C83F34
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nVxfHSjbUlxOpucYmHtaWxge8kncl6TjIQcLuTTaFgE=; b=vzR+w2x921abb6
	AgNneHVxXPDiMekug3xm/DcsRpu8xJvKqPPwm+TxYhYJWrdOMcM4ij0zgv8elCavB4RUbLRph8qnY
	D4Uy08DYEzSE9dBlFLOZbOM/gJn3e1qTRoy8kkoJ0G0D0TO6g7Qvr32C986nLDscw6qyzcoy+J+kw
	ZXvXArmZH40lQacEebjld59TgZqTIPrUpLUQ/fID7LWjDzDuh6QZ7wx0YmlethPkfGGkGeXSvLVM4
	mE+sLO9CI17SQbx/t9B5F3J6IyKolnQsTEYb8eOa+ySJE6OIOyn7MyMRG0HTBPsu3+IwXdx1EsEOQ
	WrR2mNVfE+N5l6F1UjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFuJ-000000031us-0Hwv;
	Tue, 22 Jul 2025 16:31:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFYw-00000002ykA-2fUL
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 16:09:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4562977c203so1734945e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 09:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753200592; x=1753805392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Or4wcFrh/g4bzgPrZR3GzuF5oudOjcYArQDvhE7cWaA=;
        b=osoGv39DiQ+y8Rks3U16wfjhlOP9vWzMpqapcpAQ8FZKIZGqREAQYsAwYOhum/5Ymu
         fMxyIOrvicr2cIx5PKf5Mtwz8Tm3yBv8Mwu28+teyaFmvtc5SBGAMUqlp9O5+csOP3s3
         j3ey0n7vcbJ5NNy+m9KuLnpmC/Hd8uAtS8ttxnT3ZeUJ5fI/plQSg/bPdqlm4VK8sLOA
         H33Vnpdb9Dab+mHDkq2QrtFcz3PlIdZXGDy0heUasQY5JsE3UB3mXzQfW6eYbsTuZW5e
         V4p7Q8RWSkZxFuHSB2vpKRupvTmuJllexL95H+oU/byxJsVT2opb3bVgGO0ClcGXfSFp
         Aw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753200592; x=1753805392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or4wcFrh/g4bzgPrZR3GzuF5oudOjcYArQDvhE7cWaA=;
        b=aMAzDsMxzPAIT0uMsLqqBswvMrmzB+X8Q9wgdGnqEBNTKS1f+TwEytjImCgvxTdiWq
         zPeekT3CFqFjdiVP4EIAxGAVP+CZzqygNcz0rdkzDbLIb1xABa4b2G/kBdpk5RFw38ML
         x+SScmmwwnkomySd1UagM9Ey0EHQeMaYZXLSwroIoo7Dgeomwh3YQRxA/j1GNFxZ1J3U
         WwOTAh0FZXCw3nHRPExLWaC859t8kBMZjpJIs4qlmAt6RGm3jKbrZks8CLD2622sG/6L
         pp7ruOVJjWUUy/N9mAsnW4LTTAkTka+FzxpSC4PKbQOE1yRsu97sWduYgsb4+0WZ5KLC
         cIdg==
X-Gm-Message-State: AOJu0YxClZWM4tot4jzdnhiPOpPW9nRdGDoa3YSi60yyHpmNZPjLX8HM
	vFITjwq2sW9K4IgtDgCQaQ3VeRvvPwIlAz3zmoXHgK3J54CVWET6TWI3D8t/KToI8u349MgOUP6
	TxLJu
X-Gm-Gg: ASbGncsa74T3H+GmtTLN/vPqSeiegzicfnSSh77JFtfU/O8zWnsqSSfqLfkyJ0DU1I0
	s0KnWsnkI7nKeY0d1g5JS/Jle/2+F/2Nm85G1DyNJNZ3dxHaUS4CZ9Z5K1ql3twuDF0ElOxwsMd
	Caz11q7oFJrFQJNH2kNA+F40wDXT0K4/pRmUjGKKlB9w9VbQIpsmQyhZtyv8zA9IuxWyRBphUKN
	Ljxta5smCPuGjTja4XY41OEANv3xNs7S0YRjnu0SU/VHCYujNVa9nXpIJXBqZEQt2xHHR1pYDkI
	yLYHvxePkRQFfq1kVhtH2Q/zTbGR3scloApopJ/cxwfVB4jHEN/TbHvdvG2vOSwYniCK8QQzcZD
	opTj6lxIegUfXjQ6ow72ZeHAfqe66Gw==
X-Google-Smtp-Source: AGHT+IFwNKjM9TFM2omjPd/pzpnGmAY79I7Fealj165kSTBll+PynRFFaKJikEPpsiXonJHrrlPEEg==
X-Received: by 2002:a05:600c:548b:b0:456:23d4:4ef9 with SMTP id 5b1f17b1804b1-4562e0462d4mr107484135e9.3.1753200591900;
        Tue, 22 Jul 2025 09:09:51 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:30d6:4986:8040:bb0a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b61ca4d755sm13702066f8f.68.2025.07.22.09.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 09:09:51 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 0/3] riscv: minor thread_info.cpu improvements
Date: Tue, 22 Jul 2025 18:05:54 +0200
Message-ID: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_090954_676676_3DBD9816 
X-CRM114-Status: UNSURE (   8.88  )
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

SGVsbG8sCgpJIG5vdGljZWQgdGhhdCB3ZSBnaXZlIHRocmVhZF9pbmZvLmNwdSB0d28gZGlmZmVy
ZW50IG5hbWVzIGluIHRoZQphc3NlbWJseSwgbG9hZCBpdCBhcyBhIHdpZGVyIHR5cGUsIGFuZCBz
dG9yZSBpdCBzdWJvcHRpbWFsbHkuCgpUaGUgcGF0Y2hlcyBhcmUgc3BsaXQgZm9yIGVhc3kgcmV2
aWV3IGluc3RlYWQgb2YgZWFzeSBiYWNrcG9ydGluZzoKSSBjb3VsZCBzcGxpdCBbMi8zXSBpbnRv
IHR3byBwYXRjaGVzLCBhbmQgbW92ZSB0aGVtIGJlZm9yZSBbMS8zXS4KRG8gd2UgZXhwZWN0IHNv
bWVvbmUgdG8gYWN0dWFsbHkgYmFja3BvcnQgdGhlIGZpeGVzPwoKVGhhbmtzLgoKUmFkaW0gS3LE
jW3DocWZICgzKToKICByaXNjdjogdXNlIFRBU0tfVElfQ1BVIGluc3RlYWQgb2YgVEFTS19USV9D
UFVfTlVNCiAgcmlzY3Y6IHVzZSBsdyBpbnN0ZWFkIG9mIFJFR19MIHdoZW4gcmVhZGluZyBpbnQg
Y3B1CiAgcmlzY3Y6IHBhY2sgcnY2NCB0aHJlYWRfaW5mbyBiZXR0ZXIKCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2FzbS5oICAgICAgICAgfCAyICstCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ro
cmVhZF9pbmZvLmggfCAyICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jICAgICAg
fCAxIC0KIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICB8IDIgKy0KIDQgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0gCjIuNTAuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
