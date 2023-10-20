Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00069CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMH3H4pq3FSap6jitsOyQAeYjM1afIs3rq9fHenPlxc=; b=kIHFN39WdhVhGU
	HbPjPwgQ56Qqe89aqthYW08K+8bB4/GhqZBGT4g8SeH5x2YoVarCpzRsaEn3b/tOaQNoryKfvFc+D
	Aaim7ODCnjUHay9Zn2fkw85DopwNbsu1B0Soap4skqFkPfvZ4Y/jxttCn0t8whfAVjjYWINU9Kpba
	J/TV30eHbn+WT6C051EIAkNZenWDUCZMkc7Joheh8a+KzyYNOsen6555aRFpR7pWzaKpia5bFyoXF
	S85R5uGivtcdR+5r4pYFFAw0PE1lcTwv25gOSzUhe38IOK6iSllr5B/pQO+/Ksh9i41ZGHMusnLFq
	Llk0utCrUg0VrY9ibhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjq7-001QUY-0J;
	Fri, 20 Oct 2023 07:22:35 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjq4-001QS4-2C
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:22:34 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1e9d3cc6e7aso383257fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786551; x=1698391351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQOTSMVYEAXB96lPNmfxUETXmF1nmywj/hDtdToDI6M=;
        b=P4AFTiKEilBOl7p/1oQFUhwnxHLbRbb2e367XlEvwtDnGnYTl8wLDJNfHkibfxJDhu
         9GxTY4LH0xyOovmYBYLQnHB6wZImVQWZ4QmhN7X0LP+yUHnojzAWMhS0x7cy2kUfJE2o
         vfnWB5y/HxsffuqSGzhNSSIu1IV5wCXPlV3E2zyp2fnGndl1R4/qhkfKj9qtfnEBD35/
         KE0c2Kbk49GMLRt3IMBMRgPah/G4kDUMLOtj9IO9JYvKeFkfaXF+PYzDCwzr+yxPUslh
         dMMj6genVOhIel/KC4s+nadAPLzJlpx797iq2UxK4sZKYP7KdJhZH7EM28vlbj/0IRoR
         GxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786551; x=1698391351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQOTSMVYEAXB96lPNmfxUETXmF1nmywj/hDtdToDI6M=;
        b=lRKRX1efLV7QN1IS3fSwRFzvEyku1V50ikg8JsOfYqmrQC8mwz01TEy5RQ48qRD8p/
         C/ysG9eN179uB+IjQdbQVh5sHpZeFDE2GooBIZEE7JuiQCEuZBhcfYgbw36kBaN/d0uv
         6oqxamuOh1ELNOqZm5dJN+UrxxXbyCIZ4tARjur+i5hyKrVhv980gLXul35BowWbu7Ks
         vdG3IKD9dF47z2vWtoB6LUGnQ2KgaAF8z9VPnU6Sr3ZY60V3pvQVi0mNSBF7HJ+3nAmz
         merxuQ67EZA8/mjGYN5m53FR5fbsOBuiJHf4AgiPWy+NdtwXlFquBEYfdRYflXOHpwMD
         CIOw==
X-Gm-Message-State: AOJu0YxT+RZNxeA/fPkJ7avDuIx5RosC4hDfHMo+5q5hn07CXy+KaygS
	rbg6RPoyqp18s9HaPsqE+baXbQ==
X-Google-Smtp-Source: AGHT+IHVpVTtGUUCbE9QtkhDvgB6PWIuexjVRbTOQpUxtFm1xcTHF7ruZ9rqINTCV8Ep/hVGmPBCuA==
X-Received: by 2002:a05:6871:3316:b0:1e9:9215:3987 with SMTP id nf22-20020a056871331600b001e992153987mr1427367oac.16.1697786550612;
        Fri, 20 Oct 2023 00:22:30 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:30 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 9/9] RISC-V: Enable SBI based earlycon support
Date: Fri, 20 Oct 2023 12:51:40 +0530
Message-Id: <20231020072140.900967-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002232_719276_3BDAAF84 
X-CRM114-Status: UNSURE (   7.93  )
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

Let us enable SBI based earlycon support in defconfigs for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..f82700da0056 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -132,6 +132,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 89b601e253a6..5721af39afd1 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
