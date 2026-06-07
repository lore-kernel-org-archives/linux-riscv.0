Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9FACD8C9D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5HU0vsM42Igoeeql+oWEoZpI6fcMp58mC10d+TzfXY=; b=LC/HDMz/CrzMXh
	iIYn4+XbsnQ0dOQ+J4PY0q0+F1z9UZx9W53t8dPSYwQASMhr1Z2q0yEz8i3WooYpzgcwTusWPfWFb
	8BbNHYet/+hkNr1KXgpOZz7jMz0OyxrZbrwnJHf3xCTvzq00aPdu63N0CLqLUyK71pc+c+9WpiqtQ
	6l4ya/U7Jka7qfuh1hkop9wOiP+OcTCzMjZVGq9GNEPaqDwfk8mgUncPKthv0jFq1TzYOA+yeqsra
	U9p7F+AqEb78mhnmQ3M8F3BKD9mXjPRpXUfJxWEi7r32ubVdiwklKdM/3mr7zaGADDEQvNi3jgjX7
	4C4sqIKu7w5lEPU2PZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bQ-000000027IJ-0Dgb;
	Sun, 07 Jun 2026 08:11:28 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bN-000000027GQ-2Axs
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:27 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso2090032a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819884; x=1781424684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXyTBTDSB4kJ/NqnyBvVuRSbwI4TemATINDoQruBQBs=;
        b=pXOcx6npzOo8IJwJInC/PCPESL0kVL7oP7jVSJUktrWtT5x1gw8AJIMdbp8ciEPNv8
         YnlW1v9LGF6kzCJJJEwMNOwTnwzj+AcGz4u2WC6ivk2Ml18H/S3sG86fqItWSUVvC8UF
         SWT/gVGSigjTL7LOP3vHkkxZQox1CPjFTJ4mTNrzrHWA3W5178jrq3JF8cL0rAn+LxiT
         0TsVfy+SmXFHaQg4LVX4zHjpBDPNvI7NbQGFjNqqkDtMlCabcNB1wvYhNvRKqIDoNow4
         w+17VUXNxKLAct/6moOCciSJPX2JsIQjVQJdQ6pGGOwfEN8NxkOX97pt31sX2qHNuZcl
         IYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819884; x=1781424684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXyTBTDSB4kJ/NqnyBvVuRSbwI4TemATINDoQruBQBs=;
        b=qo/ibCH9ye3HzAK/dea4dJYrfZXc3pgCAL3Eycpd0+e9nHlFCMAlR2YU16bNJIiAoG
         oF4u/T8EO2F+bMO4VvmjOlsw5nMN3HehfczwgXsmyOdMM8VfBAkPIfxa9FM1oMgnx3SA
         /R9xMBRa52ZsJuruHGsOkp0IPEvd4c6rcCPnlpTUh4AxQBq89ousmEYvVVATVLGSzwQG
         O5GlRon4JIEP1Jpafq5FJMlsSN2Mxcr9+l3B7WAlUQDEY48wvueuazwK0lScoW2HVL7y
         57Bn+6AqRItddIzgapVYK3CY05w/I2MmWY5yzV9wF1GJmHF0SNf5s4B2ktV0EL823GCS
         POsg==
X-Gm-Message-State: AOJu0YzbVIuA6lk5kMmEdt82wGLVM2fTUncijHZQSSimT5sTXJP+OmBJ
	5ANrwpJLUTmqhZ+ma9dLKWq4ZGYrYM3JbiPO+FNaDq6vOJu2sv69oiVX
X-Gm-Gg: Acq92OHpnVzrnM30oWLiVFGdH5AKZaj4Nz9hcPU1b8eOaYH6BMviYBi1/4KRkVBXBSB
	0fzfdGrerOapkxgYmKN+GLSJOGF/0Z7XerMZjzp8iwEWbvKa3oghZhb7gH+QJNvM2I2vY6wdWEd
	utW3EWL/hW/wOkgftnvFDCMZwVJPMk3EwZN0DFcz6cHGJb4trZeQbx52pouSlI4p3Fj9uZ25DaN
	m6OZmlDcL6Wv5MKtsIstPSM+j7/oo5j97FvtT8jr6kcIImbbXZcxNbNVIC4KYc2cNbt7UjFgJgl
	nxPdMF2CDm5BZZhWwwCtDlv/4Aems37bc/cBiQ+JrABxM4l4VDuCMrxMd62t9mNWPmW2qfAOlvM
	ve6JymQl65E9eGZZ1rJA4659DyAhb21Qfs3uRmhPJhutRrJ5i6Jr5c78eW4gG4jonZTyG9ES3iH
	IE/cTWoTulovR8Fj+Ty3Y9jHZrOdUJQ7C4pQ==
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr12811244a91.19.1780819884574;
        Sun, 07 Jun 2026 01:11:24 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821ddsm14362164b3a.35.2026.06.07.01.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Sun,  7 Jun 2026 16:10:59 +0800
Message-ID: <20260607081105.993908-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011125_572565_BA16D208 
X-CRM114-Status: UNSURE (   8.40  )
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

Extend the KVM ISA extension array to allow KVM userspace to
detect and enable Zicfiss/Zicfilp extensions for Guest/VM.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/isa.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7bbea8812d92..a27de850fa4c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCLSD,
 	KVM_RISCV_ISA_EXT_ZILSD,
 	KVM_RISCV_ISA_EXT_ZALASR,
+	KVM_RISCV_ISA_EXT_ZICFILP,
+	KVM_RISCV_ISA_EXT_ZICFISS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 1132d909cc25..9852a91fdecc 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICCRSE),
+	KVM_ISA_EXT_ARR(ZICFILP),
+	KVM_ISA_EXT_ARR(ZICFISS),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
