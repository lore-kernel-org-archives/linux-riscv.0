Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ED9D6395B
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JNnQC7Zmei7L98uUWIyB4XO1uawsIYoPVMar/FUnlzM=; b=H1c7h2kmcl368R
	MRjF4dKUcdOKqN8MaJNSYRGxiBEglJOXgwXCQWSC3YhizCUqakfdf8tEMuNbRz5adecKtGTTlHKXR
	U/OJKgUGon8VMnxlrVbdsTtwf9T/JgLiZOiMNv2vMMnhiYyU9zYsVrRr5trRanHFjp/eFcZpxwT6/
	YMYYCR0zfgH3GCr8pV47OkCsW9/zJpBlIvmJm+3PrLZLmC1WorPdrMBU0sO35HoroWKSIEa2vpGGf
	n6IoqD0LPZMkYngSRK5LsZCdWPqHwxAMr16cn4EX29UFKJwNO8sO7ShkHNwtHHPolsRxHhs9YWmKk
	GW5FSVYTqP4cpknlVE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlVm-0000000FW2B-0S11;
	Wed, 20 Nov 2024 14:16:54 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlOs-0000000FUmt-2LnF
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 14:09:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-20cb7139d9dso21975345ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 06:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1732111785; x=1732716585; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cxrAHqhmG1JlcR3HvdHEoqSUwYkPTE5MTo5NUdeAECY=;
        b=RmDHZEv2JdaXTEWCC6B/RmZl+BwLjJVv7InBakdtlV/ayEp5uU/AQx1fxl7HDBi+C7
         V/+/yMakmuAzG62KSBzIYxZT5HrjQSRFxGInExqeBBFdiMHN8+OG4JReIBQcvcPCK+LF
         EJKlRrNcKb4HaaFk0KkedGs5CrnzMMvmM15kAxMPnqFEsg9jhX1mzV2dagB3YC7eEGbG
         PiHZHGZoDB/fuWEq/ALjaaA3m1PsiXMfsUE8CsrKT7fACZz0byGcQC0gJqUcPEmnZr7K
         snQwAFk8W4rPoTF0xdCjfnbDo3KxZCNNw+7FZTwQKeVlzaeyyLBiwYA1MHCyJs4xJ+1G
         iguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111785; x=1732716585;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxrAHqhmG1JlcR3HvdHEoqSUwYkPTE5MTo5NUdeAECY=;
        b=XgpWsPAmV5POFFFRpZ+nyng1TooCTf6wdfmeRc1nQxbvA9iClhaxinXhnCvgGkiilq
         FxR6RgF6ICWKfjRa7S5eQwNauW6S+tl8437KSkojYaNqRM1TXII/d0YRJ5cIGeXf/nDO
         7SJTDoOlF6/yYLTJVzZEfUfx1h5Y2bNPCsaPYT9FO+b8BrzaF3uxSeCprKGGpPtsmgHn
         ECVHR7e0eS2u3MYztvKfsBnQ4c52u8dbUjmUY/EjVmVDvel4UJGcEJL2moq5LkTx7YQg
         DXvMrWMxQw7mZBx61Gwf1556xaX6fmEqBI99EvBLYJ/8dxs4PBTq06KqMJNisu+PDlGs
         mUTw==
X-Forwarded-Encrypted: i=1; AJvYcCVRdAp9gJtzAJXhxJqTPQAYKFUIvMaIDj8TiTBvCQroVDldpINc4V8HrNpUQ3mDlqDtYn0mHpgRKEQZPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyaz+3F2C/+V3kU4UMdkdnLwKw9Ecc5tQv1Qj89F1UPBlfOGSza
	5f0MD224iuI0hqHxMBI4AmZjVfBicvkENox4dBhLc2nZ8e09wGOrTHfP/P0Zh88=
X-Gm-Gg: ASbGncs0XT7rLmLtEsWD6xdekreBd72BZDPuBizcbuiV5BIshSsb3BTmdUAlIUZyQg6
	MRWn8o5Yo6lVY9OovDF6865XnL+DbHd9a3lkt8QuQoT6zq+W0O7onGSyMf9WKLyGdOe2PLBXTTy
	iEH4276uYz7vrIAGn5Tkch9XJClTmSKWLTGSe+/3aOlcUw7AYSncC5pf7lWHC+gpveALl9f2mkP
	SDfJ9ax5rN+UNdG1KCu4bUQCqIhuHLfxG+JNKIxxSeMrqUNEvk6TSbJyYxp8wNaO8I2AGfhWoN8
	zIqceQ==
X-Google-Smtp-Source: AGHT+IGUKS5hjt2wBeHFpNbOFGt9aCFT4yqBOEuCP8j8uWcxGmZ/D/8LQlPLEi80dxUfa7W2k1rhVQ==
X-Received: by 2002:a17:902:e80f:b0:20c:cd23:449d with SMTP id d9443c01a7336-2126a456615mr36184435ad.46.1732111783883;
        Wed, 20 Nov 2024 06:09:43 -0800 (PST)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f474fcsm92502505ad.213.2024.11.20.06.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:09:43 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Subject: [PATCH RFC v3 0/3] riscv: add Svukte extension
Date: Wed, 20 Nov 2024 22:09:31 +0800
Message-Id: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJztPWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0NT3ZTUMt3cxIoM3eKy0uySVN0yY93ENBOzFDNTg8RkgyQloMaCotS
 0zAqwodFKQW7OSrG1tQCbJCqIaQAAAA==
X-Change-ID: 20241115-dev-maxh-svukte-v3-af46d650ac0b
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2572; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=ju5iaCTTGnlC8cKNSV/WW1suH3P3ww9XIffkT2cxxRo=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnPe2kHNOLtJ3Nh25+lGk83izF/rgv0VNEkT6pu
 REZcT4K5Y6JAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZz3tpAAKCRDSA/2dB3lA
 vZfUC/sHvSkPEeYcaLuBEqUc3AcV2qThswESzWxUw4n7HTrnZVEWEif4jcdPYpXLMtrBY5zGlVk
 FO4VpUrnYPxMYbz2NSMEqp5JeIOdWY8rBQqKYcV17s7v4XA3BfCXC9q/hXupXM2dEdLOYUGtpqq
 LWyPTw5fuqFEShidGJktJK740GSqg0Rh8ybvwadf6/aP0bIGEYMflZbMn2JDo9Mc3b925/WaPgH
 vgEPgPWoTC/c9MX6Pb+nPxvK6lE/98LSbKCLLSCJDJuo5Z5l+Li4RqRt/SvL8YeqvwOmlKVbtGk
 cHz0q4XRKXyCSAg68Z/n/2rX410Nw9L8j0FxDjrmINiu6yge0/J/TiS2t5YRIoxmPYye0Yiz9A9
 s2goi0wDboUE1uIlMD1AHbmBSqnfSJsCEmE2TnLsnlarYRY3a3WmBh6mNNqh4vpbUOTCI0tpz1F
 7zC6DVzOqR6FJ4zULNN7B0rlWhzSWStDMay5CJOKM2awK0czHIHoaHuStTJywSon057N8=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_060946_636735_D4E77233 
X-CRM114-Status: GOOD (  11.52  )
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

In the Linux kernel, since the hstatus.HU bit is not enabled,
the following patches only enable the use of senvcfg.UKTE.

For Guest environments, because a Guest OS (not limited to Linux)
may hold mappings from GVA to GPA, the Guest OS should decide
whether to enable the protection provided by the Svukte extension.
Therefore, the functions kvm_riscv_vcpu_isa_(enable|disable)_allowed
can use default case (which will return true) in the switch-case.

If the Guest environment wants to change senvcfg.UKTE, KVM already
provides the senvcfg CSR swap support via
kvm_riscv_vcpu_swap_in_(host|guest)_state.
Thus, there is no concern about the Guest OS affecting the Host OS.

The following patches add
- dt-binding of Svukte ISA string
- CSR bit definition, ISA detection, senvcfg.UKTE enablement in kernel
- KVM ISA support for Svukte extension

Changes in v3:
- rebase on riscv/for-next
- fixed typo in the dt-binding for the Svukte ISA string
- updated the commit message for KVM support for the Svukte extension
- Link to v2: https://lore.kernel.org/all/20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com/

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
 arch/riscv/kernel/cpufeature.c                          | 5 +++++
 arch/riscv/kvm/vcpu_onereg.c                            | 1 +
 6 files changed, 19 insertions(+)
---
base-commit: 0eb512779d642b21ced83778287a0f7a3ca8f2a1
change-id: 20241115-dev-maxh-svukte-v3-af46d650ac0b

Best regards,
-- 
Max Hsu <max.hsu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
