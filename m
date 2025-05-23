Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA0CC3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u3gJyOswTj8B6cs8HHlOScoiIIC8iTqRZAK2lvRM04o=; b=GJg/t4HSgfsTzC
	1PXfch1/q/9z8tFVouR3ZNwUS1ObGhh+6/uuvn8KLC/X8iuoZgTGCAy/CSJnskHeYWeyVsG3vMkf9
	CWXxITftgzSw1q15FtBPI/18f4R5bI3q62jiiew7nGLWOigst2FKgXt6ciiZDFqs6Kt58fX5VkQ66
	MTlBMgo25Ga7+KR66kR4WtBsvbIZDkCbGW53rGznussO5L1EeQFEd/JZeu5QfWYeLytBNfl46O+9n
	rXnCLrCTGEezm1839xpS+LtAz3X3xWnadn0W/n5hTPIjWQW0OzLboWVPvH/ZTFksL3BKOMuYp0S0Y
	OXNsQ5WyhQ9jbC99dDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ0n-00000003dww-2GPI;
	Fri, 23 May 2025 10:52:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ0k-00000003dvZ-3cuI
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:52:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a365bc0af8so711715f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747997541; x=1748602341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMi4ApElv9UTRXKLCAFiLHeHw33aLOhDiUIk/Js8sWU=;
        b=Wj78HTabR9FX54M85uadO+qXYI3YhWHIuM+Vic5akzlflJC6p5mGDdTwYQEHyalucE
         2tMfc4xFGNust08c4OMl3T+2NFX1QhsxCLhqZ7OykGAIEdmFDYZIDyKGXjB+AR+ajY67
         OGIzU/vKF1xaOqA1drbfIMwSctvdf1tPGZ5d8qTFrfkUFo52IC29rVOMSyLft5daxzIr
         TA9NgCKlJ3APumAliDMJjFrpaxRmvEX7FtAyiN0nQUt4/9FaQzYFsfK16SybRaZTskMN
         +36ZpXJRSeL2dwgi+Us7qjTFmgiIvJzjM7z6vaEEny2cDlxgadihSp4OYSXeE40InDtm
         suRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997541; x=1748602341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMi4ApElv9UTRXKLCAFiLHeHw33aLOhDiUIk/Js8sWU=;
        b=gOPKv34mTNPjAgVj7clftmWNCWF/WkBDcRqPVQMgD8RFUS67/PV2mFCK5kI86yC0bu
         oa2PEwL72DHctBJOpwdWrW7K95alV27EfK9GiWbkQIwlX+juAwBxR16c0ZOjUHfVgDEW
         uiBhfIDTnXgJ/ego4XXgwFfHZ1jgAvzeBr42tz0OBvP8a5ZhB1GNRDvn0cAeRu0tbQ0x
         AKubXQh1qP2aekYYICdYe7tP1uWA1GhHj5VA2Wy+PPw2hBL/+uqXi15d9Fwb/Q1fJuRI
         sBfPMVg1p5GU0mgU3YlsJrw1+kZLyWlY5QWxaQA7Zr1sel3OLa5ljkyVV9JzqKqNmq5X
         xVuw==
X-Forwarded-Encrypted: i=1; AJvYcCUU4itUis4IN99KpcJ4TSgk/HRih6bXlHBa/iAiMk2s2k+oGlj10s4xpzWe/+MnrIvcEn7GsgIwr//AJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR7BtBT94t8qXkqmiYAREhdjrv+6jMcfYl5YmLluUuyQfkjIAS
	70E1+bwxuJuM8PdD7QzoVSUEzudiqYWGiC7tyOf6vpROa4JlqyGnxUpjB1N9JzL/8Jg=
X-Gm-Gg: ASbGncsN2VzqPureRkUeZUzwao6PABsjCkNU7dE/jitcA7chPcD2U1U54iUVIN+Tx8I
	w2pqd+glWiD6EsCeR+FuKR1694DS92e1VnRthjIj6/Vbf3QuvVbeJwkJMOV4PFv/yZWOTwC76Zs
	HiVKfLNZPObJ02dwTskB5nj4tyOxgg9t/rgvWp1SzuAXBRUu2LSGN3AuC0pSqPJuNDz/uluWoqm
	VXWI3+g+yuKGh81ACl2qczAKyV5HTkwJDhq36rmDJMay/qF8USRtNKL69CaHicPhOFNY2LcA9iR
	40IBDpBLlX1W+1+wiGOMXahcweWpSlTOBQS7UKahiG3lto5zNtIBPaMMGmM=
X-Google-Smtp-Source: AGHT+IEZmpBdHidSmMll0Tt/cMd2jy3jhCSZ/4z88K5W2YuxN+ezZzGMi4M3/53vgB32or4XtWGoCA==
X-Received: by 2002:a05:6000:1acc:b0:3a4:7373:7a6a with SMTP id ffacd0b85a97d-3a4c2e443a3mr745998f8f.10.1747997541137;
        Fri, 23 May 2025 03:52:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8cf66sm25590521f8f.87.2025.05.23.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:52:20 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH] RISC-V: KVM: lock the correct mp_state during reset
Date: Fri, 23 May 2025 12:47:28 +0200
Message-ID: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_035222_905854_A17909C1 
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

V2UncmUgd3JpdGluZyB0byAqdG1wLCBidXQgbG9ja2luZyAqdmNwdS4KCkZpeGVzOiAyMTIxY2Fk
ZWM0NWEgKCJSSVNDVjogS1ZNOiBJbnRyb2R1Y2UgbXBfc3RhdGVfbG9jayB0byBhdm9pZCBsb2Nr
IGludmVyc2lvbiIpClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50
YW5hbWljcm8uY29tPgotLS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMK
aW5kZXggMzFmZDNjYzk4ZDY2Li42ZTA5YjUxOGE1ZDEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwpAQCAtMTQzLDkg
KzE0Myw5IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N5c3RlbV9yZXNldChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCiAJc3RydWN0IGt2bV92Y3B1ICp0bXA7CiAKIAlrdm1fZm9yX2VhY2hfdmNw
dShpLCB0bXAsIHZjcHUtPmt2bSkgewotCQlzcGluX2xvY2soJnZjcHUtPmFyY2gubXBfc3RhdGVf
bG9jayk7CisJCXNwaW5fbG9jaygmdG1wLT5hcmNoLm1wX3N0YXRlX2xvY2spOwogCQlXUklURV9P
TkNFKHRtcC0+YXJjaC5tcF9zdGF0ZS5tcF9zdGF0ZSwgS1ZNX01QX1NUQVRFX1NUT1BQRUQpOwot
CQlzcGluX3VubG9jaygmdmNwdS0+YXJjaC5tcF9zdGF0ZV9sb2NrKTsKKwkJc3Bpbl91bmxvY2so
JnRtcC0+YXJjaC5tcF9zdGF0ZV9sb2NrKTsKIAl9CiAJa3ZtX21ha2VfYWxsX2NwdXNfcmVxdWVz
dCh2Y3B1LT5rdm0sIEtWTV9SRVFfU0xFRVApOwogCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
