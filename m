Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDEBC77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 17:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OsWvKlkseAXfsue04LQcxFvXPBOeJrnXVfjPdJPxyrw=; b=chNDtPz7FhuDvo
	TsREMQL4RY9/UMMVgWxvNmqThFdCFnNNH/+c/1cMSrZ3CQkPXHwXztcI7o/TkcG2hTE6T2pz/aIcX
	QpVVUXi7JfqTlBSOmBAGPphS41a9YQpQb2ms3oKX2MmXSUVSqT0c6PMOADlZDETF4oljVHQjA+4Xw
	HT0QXmfC+fwVSt7ZKgQUZuty3HxJxFPQ0jjmQnJrFr/UrKxpfO2jGvdaHPM4lm3t97IUri8SKfpzB
	deAruwPij1tyjw1W+TYU4JmiI9IQaND4ELh7NNvIofraBcb9Zmnx9osS+/ymVD1j51Fkq97SaVSTp
	+exB5Hk1YqY3qNceunmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43UQ-00Eno9-1n;
	Tue, 30 May 2023 17:50:34 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43UO-00EnnJ-14
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 17:50:33 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-96fab30d1e1so13506966b.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685469031; x=1688061031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L0pz/H3P7wNOhOh5HbZy4mMD6Do0feXhqGcaM8vC3TA=;
        b=UC4NFI1l13H25ZwE0xZRAFV7dbuLx8DhzUZw1UQ0kJgtqJQzh5DVIxJtCYZTl0ewC6
         Y1FK0WYvf5FcjGvL5Ah7GlprZyx9qkL50M50jf1A3iF1PYN3v+XheNduKzisuQbSnS9/
         OZiElsVKmb57OjIyY5sHjpGGlBHf2IxXwMYl8vS4lerjBAfvopOQ63Qz8XJdAdQ6PLRh
         D2MG7cB8k7WgMHeiulwX0Pbu2OPdHDXlsa8PW9Z+08ILcGIArP6IUvN5oU3K46+dKCAG
         DAdEue9Hrk2BDgQKAeXuM8H024Nszg37LWnKoSs5nDxnE5jEAD60uNJHhbHT3CxdjkPi
         IFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685469031; x=1688061031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0pz/H3P7wNOhOh5HbZy4mMD6Do0feXhqGcaM8vC3TA=;
        b=jR7V9cWSyEtodM+HcqSx6ds9gUilMCyTBzV0kfETtysu9YJDPewH3Wc+e97fufFSjK
         ietnAMWycHV6xJ6L/v1ecdW763CbDlY+O28ixbCWIs9HOpVbxA7NRMNVkX5Es2reYngU
         JWq6SMtvrbClyxQIaqHdkkF+Q+G4nT5TKaDCYjbCi6Bq69I1rfsZ548xMyGwGTunH2Yf
         6M1fFcVO273EyaQ2Oe1hzwuAfl6YtH31yoWM4FSlNy5GkptbP7XJCblq5He8DMXlkJOg
         ci6u5ojm5zvHqCyaMQyEicRtg1XHzCw0yZOqmX3EQIxvBzVYE9lwaZcipAWQluXV4Vlx
         c8CA==
X-Gm-Message-State: AC+VfDxSzmShAnWXjUpRiejyCmiVSYVT1lkFxwp/JsHvIQFHWeXYeS/w
	hPAQalfoC9kXxtGog+XO8VgPO3FGv0/XhH01Hkg=
X-Google-Smtp-Source: ACHHUZ6Qn31zvU57m0MX/u7ayQvN3uMFcE04w3fYtq5CW6bPVx0av729Na5tJqm+XhYVDLFvpAE4BQ==
X-Received: by 2002:a17:907:3ea9:b0:967:13a3:d82c with SMTP id hs41-20020a1709073ea900b0096713a3d82cmr12071471ejc.26.1685469030833;
        Tue, 30 May 2023 10:50:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j4-20020a170906410400b00965a4350411sm7664906ejk.9.2023.05.30.10.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:50:30 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [PATCH v3 0/3] RISC-V: KVM: Ensure SBI extension is enabled
Date: Tue, 30 May 2023 19:50:21 +0200
Message-Id: <20230530175024.354527-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_105032_368801_E40F9300 
X-CRM114-Status: UNSURE (   7.15  )
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

Ensure guests can't attempt to invoke SBI extension functions when the
SBI extension's probe function has stated that the extension is not
available.

v3:
 - used lowercase for enum

v2:
 - Reworked it to use an enum array instead of two boolean arrays

Andrew Jones (3):
  RISC-V: KVM: Rename dis_idx to ext_idx
  RISC-V: KVM: Convert extension_disabled[] to ext_status[]
  RISC-V: KVM: Probe for SBI extension status

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  8 ++-
 arch/riscv/kvm/vcpu_sbi.c             | 76 +++++++++++++++++++--------
 2 files changed, 60 insertions(+), 24 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
