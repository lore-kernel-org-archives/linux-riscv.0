Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2963BC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 06:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zo/JCgFT14WdH/5PuANBXEAA1mhL7nbRX1wixzBAtuM=; b=lmRmnRWx4lln62
	/w8ZvwmXQcvsmhUb8zov3QaXzpgxl4zf4MYxIZQgj25DFNrS6qR7xo2Cx2bEzUOI+mVrSNDtYE1uN
	tFB2aEwFR/I9Mwsy3ZU9IyNIbei2VCHu/wbgQs5SG6o9YZMAjt6ndzes8hHHscPKdkBzaBaEb5ulr
	w2HNohFEqUCmNHXpajj7X+7Is/497n7EGdT1LOlEQcOafVE70ey+cYwm/eLw/7wnTpP83Goa1EcKW
	eaZFHOFz0uAUddwfqaP7Y8zkBAN+pXtbp+e4yMo6dnzAx9saB8yBpfNERsjUwHAbu53vYPW6y7hdp
	LwomMZcXrO1/Bns1XQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTQR-0000000ClCZ-3Lt5;
	Fri, 07 Jun 2024 06:50:11 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTQO-0000000ClBY-1K3q
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 06:50:10 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-374528b81ddso7399635ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717743006; x=1718347806; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tMPl8897CpQSN9DJ/kDtQliKlOJSf3E1YJrCy5LiBYw=;
        b=lijOaJch+9/dfNIIffl1NlHPZL4Qo9wtzMYdXt8rjzYDSj4VnHB8opQW6L6yLFM36L
         7DDNIcs9dEm505Ua4cp2zEBjD1P8zb65R0EAvAVT6xkyQDnrCoaY3AAdCU/GukfjubVn
         NB0DTGAzhqeFxrsHrsKaO9OlLFgl5j2kcxFkje8RoXB6N5gk+YhmFXpnZfaxNHWPqUa5
         b8QVcbbCGtzaEEa0dUJpG3YLbecB2TDchje9kbxd8BPF7vXCpR0VHL8okd2wFZy4vgRA
         M17Un1jgrZAb/rIGaYYqcHDY2fjZnkFF1P2W4BHGeY3ZNC45avUkNOtkRs5xaJ5X3eIo
         soeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717743006; x=1718347806;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMPl8897CpQSN9DJ/kDtQliKlOJSf3E1YJrCy5LiBYw=;
        b=Idro1hkY/uvCUtnAYFSVVTTlh384kUugT/Qa/VSiYRlC5RM3zw1F0AuAbRys1ERqCa
         yYQkqXT9eA0Huboo+zTpqJrHVnyPmTLJHGPN3MY95ogo6h1XwTIjdu10UHHE6l6X3yRc
         OHdr6RufcNeli7r44txSf6QZ9me54ASkaT04zKeDACCvMRQ5s5L8TL87lQBREYQHglx7
         tGU7/PXRfKa+LLG1T94l1XQc61RqnF/3kRMIYANvQeai9Nb6i64tskrDXX7RbmoGvaQM
         GsrF6KmWbk5WlRK/LKHgIhTvrqRS83FcHDVPSwjY7IuxOyknYq9Pcl3hbjacsXvCKvtw
         bT1A==
X-Forwarded-Encrypted: i=1; AJvYcCUdcbJQp0bh39OwwfoSLxpfnnyXqcgAC3ZOO9E6kOX+UhtIaQVbCBRus8qRGByjNiiY//fpk8yzOXjCPlK/gr+0Kl7IloxeIqdSOLpSxMxk
X-Gm-Message-State: AOJu0Yz2GFx7+3fd8zCDS8uCpAfr3NU0Q4H/Nli5oQLTbwJ0vJmlRa5V
	1hEPCbb8lUTcUYh5VGdXkBcJekwnH6sWTSX6ZmAwNC6u4TuUKPeCnHmcYy4C0Vnjd2XkAK7heNy
	zf2LCMtNK7Kx133QfI5bwpDUnq22f7cQmtQs9Eg==
X-Google-Smtp-Source: AGHT+IHOma9DkzEVCoXDhOEvw6bmcDS3u2Igp3nxn7YwC4sw4D1kHojmDWd7YU6Na89+glhPtzPdIpk8nv8N94+V80U=
X-Received: by 2002:a05:6e02:12c2:b0:374:9c67:1df6 with SMTP id
 e9e14a558f8ab-3758035fd9emr20660145ab.22.1717743006285; Thu, 06 Jun 2024
 23:50:06 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Jun 2024 12:19:55 +0530
Message-ID: <CAAhSdy0wc=e5LW92Y7YdK6Bi0cxk6C1EhSyv5vMo1FxKMu_CpA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.10 take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_235008_563124_F3B8744F 
X-CRM114-Status: UNSURE (   5.62  )
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

Hi Paolo,

We have one additional fix for 6.10 to take care of
the compilation issue in KVM selftests.

Please pull.

Regards,
Anup

The following changes since commit c66f3b40b17d3dfc4b6abb5efde8e71c46971821:

  RISC-V: KVM: Fix incorrect reg_subtype labels in
kvm_riscv_vcpu_set_reg_isa_ext function (2024-05-31 10:40:39 +0530)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.10-2

for you to fetch changes up to 0fc670d07d5de36a54f061f457743c9cde1d8b46:

  KVM: selftests: Fix RISC-V compilation (2024-06-06 15:53:16 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.10, take #2

- Fix compilation for KVM selftests

----------------------------------------------------------------
Andrew Jones (1):
      KVM: selftests: Fix RISC-V compilation

 tools/testing/selftests/kvm/lib/riscv/ucall.c    | 1 +
 tools/testing/selftests/kvm/riscv/ebreak_test.c  | 1 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 1 +
 3 files changed, 3 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
