Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58BFCDD1B1
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kgD7m2On2ZjtzEgdVTLluvseu+oLq0hcE5jx62sKFa0=; b=4pkEBloQvC5UNr
	uhWO1VsU5UneQKSQkblccvPEXbZrID26bsA9CqGvC2n+McA1krPD5zl8eRr4KAGxzQEE+QdGJQhHY
	1MDmxp4sWxgbnNb91ga7w4m5SrtYDlSU6/OjkCN1GdqO8t9BFjbgMpTHH5w+u3wj6Cmhd1IzVorlT
	Z6qiuWs3e2mmYN3ZYZGFfltatPCZUyNzQ2y6u70Ddzu/3cwFMqDh7fU7gE5zBbnYA52Hg4iLepVGi
	ZNnv/evBzK2gJzqSrxi4TZD8Ou9Zuj0Zxl1TZshBe4Cz8Dkxlo4Gp5iALgpjSal3zteHD8F03bwMm
	mFoO9INbKEJGvTr1v6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suBEL-0000000BKPP-2ayW;
	Fri, 27 Sep 2024 13:41:57 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suBEI-0000000BKNm-0lZ9
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 13:41:55 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-2e0b93157caso762078a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 06:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727444513; x=1728049313; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7rJ/O+z7bpxFdhA8Ut3eubNwBQf96yErA3CvXZEpw4=;
        b=KYJhlW8yGHmiWjABpM4jYE5yCTNVs20nzzzCdeFbihBCDIJFibK6y21hU7yHzEfPrx
         1CkchxtxZGes9qbmgA0eDdmb1Ty3wg6UqVNA9+/Li1EWlaXvaHR//M2WyKN1BiETw3BT
         3Ax6tI+d7SQ6utaJT8jy08MjERd9lSQQm/6N3rjXdGQgkth85lomshQBxT6hGradQV6R
         vUaebwd1uEiVhYTq1hf2j7aBFmpLt2Q0ewYxD+LxSFnBA8c7te7iXB5LSZM51BwcWWNz
         9/88waX7ffcBRyG/tt/eEcrpuKswyNStOoTkgR58Ys1hWNeZrXS9fLR0RzDDj76H9tHk
         p6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727444513; x=1728049313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7rJ/O+z7bpxFdhA8Ut3eubNwBQf96yErA3CvXZEpw4=;
        b=c6i3Rb7NuMq2CsOOV4pKv5N/FRPuBrpK7VUcDzafRp5xaOEjSA5icVMFJ+RqJEExyd
         hWgzwAgt55Bq0sh5GlH+QHJ//hwyjGoXYaJroXbb88UHyGZipPfvyH74AXTVhHBGawgh
         zIcQg9BM0twupvUDOj0KGQGTUAtNtJUibsJlKmzw54XPPHcu+SsJr2sNOufnb0cJPnsw
         ANy3oSKKWdLBhi3mcZlDR0Td0dSxQC007L+rh7igeum0Pel2UckonUgZ1Ld23LOCTcnM
         56gNSfUM2mPhRNjkdBDtuCG4Eg29fY4yyyO3EcR7BUigu/oM4Qpum8pzz8osRFEWEwZB
         yNtg==
X-Forwarded-Encrypted: i=1; AJvYcCW4KA0u5DAYagNe4/reJej3WzCoqWdDdjQ4px/GKugDb7+WtoC7BgYMXP6ZutCWCVMJ9tc15UyDtGy2Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMINCc5lS4uH4qi+thlr06spfsrL09XclGzIRKhM9amuwkDd2q
	Yest8Mi/Y8z4j94z/QTruuH8gjB75LfuqXxKLyJMQKxScCYgkmpuHbG953iu8qo=
X-Google-Smtp-Source: AGHT+IHd0pjdAibmhIjPPq9egnYivm5hXKu9xdNfijgHfStvVPMb8ZqhOcsLfmCZcJhJm3LSp2aMNg==
X-Received: by 2002:a17:90a:f002:b0:2c9:6abd:ca64 with SMTP id 98e67ed59e1d1-2e0b71be347mr5415189a91.9.1727444513078;
        Fri, 27 Sep 2024 06:41:53 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e16d6d2sm5671744a91.2.2024.09.27.06.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 06:41:52 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Subject: [PATCH RFC v2 0/3] riscv: add Svukte extension
Date: Fri, 27 Sep 2024 21:41:42 +0800
Message-Id: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABa29mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNz3ZTUMt3cxIoM3eKy0uySVN2i1KTE4lRdI13TZJMUI0uzFENLEwM
 loPaCotS0zAqw0dFKQW7OSrG1tQB4a8FLbwAAAA==
X-Change-ID: 20240927-dev-maxh-svukte-rebase-2-5c4d296d1940
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=kXRwG34UI+bturoVzhgeOOxPV0f/Bx4DS5Ky79B+J7c=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBm9rYeApPCCtbRKlNa0fE1A0kbxZJAywkNuCj78
 NBFhfYWq4mJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZva2HgAKCRDSA/2dB3lA
 vcpOC/0VaRoc0IjaAnv5H9+vh7FVkndqjkCNsVcqxk7vUeC9xBFqJEoAHh5Dl03M8SXUcJ8tph+
 kFnL4hsHgu0u/UtJ6QcJaL+7CCnhKx+7tQFuviIbbm4knj91J+2iFU0cIHheHEn26UHvx1oguar
 gxMGJo+JZMRcVhWae2ABGXQx9YY8kENuIRar1jmm2qFfhvL5hAHp4MuT1XWx3KTzqxwQLNt2VQm
 hbNVCJA0Lb7EXREcgCeKddpxezeHTlJiiUlMFEOWo/waRN/8XRYhddDP3fdSUf5gWc/1Qe9kcW9
 quTNevQGuK0XZM4K3EgGpRN0C3wxIDdHlcxrI3xNihgTxIPbQF9kaHOnUfxLrfbpeGc4qXy9VQC
 b4M2V68cTEUW/+cEe2lz77WnQSGlvWTsOz+tJaIm2NTSASK6jQHC1xWzxDiyCHYMk3v2i58wV7t
 yi4jBX8y+8xIyEZ6Ae4U0cA1xHOQQZlVSqJ+/DZFECCRAmqfnyNjygsleoVQ/eDg2oaU8=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_064154_229841_FD8A9DA6 
X-CRM114-Status: UNSURE (   7.95  )
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

RISC-V privileged spec will be added with Svukte extension [1]

Svukte introduce senvcfg.UKTE and hstatus.HUKTE bitfield.
which makes user-mode access to supervisor memory raise page faults
in constant time, mitigating attacks that attempt to discover the
supervisor software's address-space layout.

The following patches add
- dt-binding of Svukte ISA string
- CSR bit definition, ISA detection, senvcfg.UKTE enablement in kernel
- KVM ONE_REG support for Svukte extension

Changes in v2:
- rebase on riscv/for-next (riscv-for-linus-6.12-mw1)
- modify the description of dt-binding on Svukte ISA string
- Link to v1: https://lore.kernel.org/all/20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com/

Link: https://github.com/riscv/riscv-isa-manual/pull/1564 [1]

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
Max Hsu (3):
      dt-bindings: riscv: Add Svukte entry
      riscv: Add Svukte extension support
      riscv: KVM: Add Svukte extension support for Guest/VM

 Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
 arch/riscv/include/asm/csr.h                            | 2 ++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/include/uapi/asm/kvm.h                       | 1 +
 arch/riscv/kernel/cpufeature.c                          | 4 ++++
 arch/riscv/kvm/vcpu_onereg.c                            | 1 +
 6 files changed, 18 insertions(+)
---
base-commit: b3f835cd7339919561866252a11831ead72e7073
change-id: 20240927-dev-maxh-svukte-rebase-2-5c4d296d1940

Best regards,
-- 
Max Hsu <max.hsu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
