Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2167C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rADDVa/ICpRNHvVidUyzkgy0Jvd1uKAoQvFjSCoRNoU=; b=D6Ag6KxlOMpF3r
	jzD4dA7GTWWuai5z3s7E+QFlWig+ABy9QWJrU1B6u5sFxIs/BXjfPcyDfvw44L5OWAVpndiegoa4S
	pG1VduuqBac3vYhLDilZqmHI4HDQwmgs6T7KTruteVgGGQh5BHAwRyOCvsG+Wv2Kd6Q4/2/3UHY4u
	DznphI4ZM4wBJsaMt+jw/NCeMS5mUlFz8MsX9fTjxhO4a6yhZQmMVQ35Yct8Ul5BfZ2NRPpyscX+X
	Xq2ntoo44uf57ym2uX0uAVhavw/0suHG7LonWdfYFAiaGQnlfagvcURzuWpPOho9SHswQHN7jCBFO
	HRL1cKhFRtv/kWB7MIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXLbH-00GLHV-JM; Thu, 24 Mar 2022 11:25:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXLbE-00GLGo-RM
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 11:25:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 r206-20020a1c44d7000000b0038ccb70e239so94447wma.3
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 04:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HON75yKlLcLjQMxfILiHDZtc2ZUHcCFbq1pzqC9iTVw=;
 b=VxBbAmpgbVV9uu2w9d93bg+Dn5TJoAdBozzPG6eY9+pLTdqZVL8NO+NLBrfjH0ELgC
 IBWv5BkHs83Cnwwz1FSyVncnoDp/kt8/l4pSNYt2/NNWAJKI9vjWW6X+AckPVQD573eo
 x77+CJGpanods1R/S1BSO0hlnL4L15Rs12NBT1NPzPBI27HDbQ49LY5YAEvk6cRhynFG
 LIklyPEbcEubh69FSLNnrxNt+rWv9oUCUd2vt1ZsmUlpk/5HE87UFPA//gY8SnAmfDDz
 Cb8pSs5mCjpcmiWCInZU/aAUGOl6ArSpDfZjMErlK6yzaZP7st50AaqGQFQ5JjrBhsxX
 hWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HON75yKlLcLjQMxfILiHDZtc2ZUHcCFbq1pzqC9iTVw=;
 b=jqdixh8SyA97jYhOjh0jH5mUwYcaccsgdCaD/OZY+B4BqJRWWEfTMYaBwkGszERpW8
 ke3V3gAb8grC5TfR1LhAaw3LL//AAChXrG4os+xzFBUnQf2R9LmmCc80l48VwUXR8tVO
 XzSrEMzC9xLSKLEuI127UvzhXXA/jiD7wlif2XrkNfgCpwkSd8RsszC7f/7bItC8rr/Z
 M7Lvrw0M/9B+4Jv8qERaC8qWjrrZecjWJoi+4I/MKLlyRY8dy5dlkxXZ/jyrVJxUcCow
 iWI62Va+JYjYlyNvNvbW1TsJWqCGQ9UP+OkLCyx7wF6JQMUCv5/z1B3VjhTZszfVDuqn
 O6uw==
X-Gm-Message-State: AOAM5332lMwm5JSlpM/9b06Z1120Z7ZXcHnh0vZlLkVgjE1j0eDbHLrG
 1glENjDQptEbayygCa7Psx5xWg==
X-Google-Smtp-Source: ABdhPJwInRBIMpTMz3jhpJ6WDusZ8UQcn5vjN+E8W2Td7HLiLU2maFKA2uPGJqZmMzQzd/igFk2LLw==
X-Received: by 2002:a7b:c24d:0:b0:38c:68a4:eb4b with SMTP id
 b13-20020a7bc24d000000b0038c68a4eb4bmr13501836wmj.108.1648121151030; 
 Thu, 24 Mar 2022 04:25:51 -0700 (PDT)
Received: from localhost.localdomain ([49.206.7.17])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d64a3000000b00203ed35b0aesm3875350wrp.108.2022.03.24.04.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 04:25:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 0/1] RISCV_EFI_BOOT_PROTOCOL support in linux
Date: Thu, 24 Mar 2022 16:55:33 +0530
Message-Id: <20220324112534.209959-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_042552_903720_1DCEA93F 
X-CRM114-Status: UNSURE (   8.87  )
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

This patch adds support for getting the boot hart ID using new
RISCV_EFI_BOOT_PROTOCOL in linux efi stub. While there is an existing
solution of passing the boot hart ID through Device Tree, it doesn't work for
ACPI. Hence an EFI protocol protocol is recommended which works for both DT and ACPI
based platforms.

The frozen spec of this new protocol is available at
https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0-rc3/RISCV_UEFI_PROTOCOL-spec.pdf

This is tested in qemu with both u-boot and edk2.

Sunil V L (1):
  riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL

 drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
 drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
 include/linux/efi.h                       |  1 +
 3 files changed, 32 insertions(+), 5 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
