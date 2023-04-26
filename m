Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B634C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GNyPmfYQdmkKzxG6AkLKFRsfqzDs6qiBZEvazsGCwjU=; b=LzDKcrDcXZKc+D
	k/X4M1GSZMPBrrbwRMyhUkTUgQ/8UzXicC7ls6MTI51KkaGtyePD9N6nqAaQuOmki5xJDV9SYGSpb
	YnehTW9zTyG4nBYiIzUhzmC7f7JTqWgdAOPmpM5wlukBQHy8PNs3CkMRgdxb7OLufB3da5Vw9n/dB
	P426vujKRKnLXKGgZy16P8cscPMn+fBepHNadyK1iPKb64/47GEEYJaTyTN6s/uX1mAVJnWBmS7sZ
	+4rcF7+ZLbRpJstzH7ssjVBlaByRr1dE+US3o3M6n0+Csw+DTVt3GX8OAbn00oxzdZHObdKVRl0AO
	+cKAb29Y4+va6OJYUs9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prii0-004UHK-02;
	Wed, 26 Apr 2023 17:13:36 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prihx-004UFa-2k
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 17:13:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so95598a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682529210; x=1685121210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUb7+3g1ZxLTr/dRhnOlbe+49c8O9sECI7Xx12p9I2Y=;
        b=U8Bhd0/qdv+n9w7lOL5H1zZIkDFgkgrdtEflEDd41mvIAh/Hcg4x5tkIpkYFV5Q+u7
         Ni+RtDWhm7HIJab5tWCETZiBBo7VAkzNrhLl8WDxwYcipubIOdLaPkmVP5IX+HtTthFa
         ER1hFdHtz/ol/bwkfZxngsEfLrP4GBSvKVMTFxtO1u+ja/IWQnaKRD53Kb6hJ5tCcY8i
         ck0c9gQz+tjVrsJKrkrkp/pZl9+J7GjB6NzFcLUkp0yABN7N6fb0fyV9ypKqBj+zxP0T
         AONF0wGvdgVRM1EYt1/4tvv+/5wc+OV5p9xqe88X6mdoV3G8sIkWNKDOADY8S1meWaBw
         Pozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682529210; x=1685121210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUb7+3g1ZxLTr/dRhnOlbe+49c8O9sECI7Xx12p9I2Y=;
        b=PoQqsaeAuBSh8rBHd7AIF7GPPFnKmS6oBgLvKAsKF68pIEr7bEb8Zv8SCMFvao/jRO
         ZHAT012oz3ZO63YvHqgd42ilhv3InQ41dHE22PmCQ3qXgHAf20Zs1ES/SMMYO8S6KkOP
         qZsL4+f+VzkAhUNwlR/Ok7guaOST+GhmkHMIMd8FFyU4fKcNpXJ/EmPU/Cl0E0rCe9yM
         M11MnJUEUMSGhphDZhV9Xy9Cuf4njylU6N53bzZ5wRBEwg72s/Bk+5Rgnv+5+coP6UIE
         +/iqedRGkHAT1C+JxakUC3dm/jdRojqlRRMY0bElMwYRo6BZOHfwHMxg7lH9L2FmNuMZ
         acqA==
X-Gm-Message-State: AC+VfDyxxYTn9PRnQ5ZhX/qNhqyDOaNqRw+mCRHJFLUVzpbSHQjryDyy
	dMmyLSeWZYJP46Cb11GbOA6rDaP2ePSDSGtTGM4=
X-Google-Smtp-Source: ACHHUZ7iHhdqraLk0Bhq+zfGYf/6jpcmADeFL6iGZ18rBgjyLlCc1Zrn46OPbAYLbG4b0us0rcL/Vw==
X-Received: by 2002:a17:907:b0f:b0:94e:ffab:4ce3 with SMTP id h15-20020a1709070b0f00b0094effab4ce3mr2481732ejl.32.1682529209874;
        Wed, 26 Apr 2023 10:13:29 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id qm10-20020a170907674a00b0094f282fc29asm8425784ejc.207.2023.04.26.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:13:29 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>
Subject: [PATCH 0/3] RISC-V: KVM: Ensure SBI extension is enabled
Date: Wed, 26 Apr 2023 19:13:25 +0200
Message-Id: <20230426171328.69663-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_101333_890468_F0B5A76C 
X-CRM114-Status: UNSURE (   6.01  )
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

Andrew Jones (3):
  RISC-V: KVM: Disable SBI extension when its probe fails
  RISC-V: KVM: Rename dis_idx to ext_idx
  RISC-V: KVM: Introduce extension_enabled

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 ++++
 arch/riscv/kvm/vcpu_sbi.c             | 62 +++++++++++++++++----------
 2 files changed, 48 insertions(+), 23 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
