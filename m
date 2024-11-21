Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A75D6ED21
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BZ6Z7f/IIz23S0l34UCQt2l3PQJ7FtEPYZGCcnWvGkQ=; b=gSvHKMlrbJrps3
	A0etb59UaXg0H/sFKW7tspqq+mLv3pgVykqthM0v7/F3s8agwJcM02ZxCNV7r+GApBzLJrGBnbqSf
	CL2m8kF7UYOet8GtAacf2Zp24Wifw9bALmiG7sw+mOSjwJLrBj3WE9R7ceR6gVLeoW9/TY+M8lZdt
	0fNzw086bRZzrcT1WGdbu8AMmlC5h/RG25GOHpbU6JXhBk9bpNJkT7XuYpEscuiAT6f5IcnmhcC5s
	kCgdQ7FbwqjzhEMgConu80QvljCm+RROE2tVkRzFf4Z5o+nchPMLntX0NPO76ANowri3/kVwKlOyf
	NDE97FKZFE8vL5BQSBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6iv-000000002jY-2H3m;
	Thu, 21 Nov 2024 12:55:53 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6is-000000002iv-3iqh
	for linux-riscv@lists.infradead.org;
	Thu, 21 Nov 2024 12:55:52 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-83a9be2c028so29182939f.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Nov 2024 04:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1732193749; x=1732798549; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4OPqzXMUHnyZ1Qfz8WKePkWvYvx6EvXlEnQMdWX7vBk=;
        b=few12TdPQeW+6O9lrhDj7WzdQnD+ljznOWGvY2MoUBerEOCJk37pMljnoyPOIkVSsd
         12C1LLMlW5iw7AyFlGOe+1eY2JvuUhuj8J49MkghrGysW2DNhQLOQb6f4gHLLvZFbpf2
         f0cZxiZeSlux+SNl+wq14vFKbczB2RJeJNa026poCrnNtW9Ph0scFJQ0s8LhtKMSq9ke
         oPFzYRpP9F4TP8AKEZZiwS5MQVWW81VgkRXUwI6KF2wF85Trgh05Tg6LrWR/4NtjHAVb
         Z60wYUvthECdRKecDyEi8DP0jJsuxmspsysexzZ3iPw7+ov0z+o+QPqnEkZ5JIMjzseo
         d+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732193749; x=1732798549;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OPqzXMUHnyZ1Qfz8WKePkWvYvx6EvXlEnQMdWX7vBk=;
        b=qQDzxZHx/zX5ctmv+JDTZ0ouENLW6zQj119xIIWqDX+CbkEYqR7BgHJfA1hGdDcz6R
         iIxi+BqsvM9KyxCzh79Ji6iu3b8Ci8cUiMnnAnHqEMHaqQno1O7L7Ce2NOzf5C3gIG9Z
         mmY0C9NVHNImLPhk6p/X5/+2VBWyiWp/e/nXOFPICFPYEP4ih8T5xrQrXCGJNxc2y4NP
         g8EJzd5hWOjisT08EOi9H1WocoblXtXwEEYgIUxR7L03X7FkbZDy2sWb4kVNaaGeln9V
         CjduQeUbPTxI+VbSj46ZMai0rFgupmPN2K8QGesB6ycLPK5AEYr2+KrWGn15IqJYZO8L
         le0g==
X-Forwarded-Encrypted: i=1; AJvYcCV3Sa4mwU56vE5MNMzAulfu/MH8G/f9cWeINsufhLtmujAaQD2opT126leUbNee4pfxJR1QJrKZA/+IUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpzpx6HaRFteIVLyEFWacpMuKbhG77qgqh7PEVAWdlyQWdwB5G
	7aVMUFaFyhg4e7+8+zMbyiXqRwWccsBN7yuMxIoFO5i1NZgpbJiYuBYSrVmHHs8VzHZwS+4QaOn
	NImkcYQ88YEdN/cGNzii9mDJ8QpdqCYUA+gk6ZA==
X-Gm-Gg: ASbGncvO52OHLnOE/F9zsIclb3+mP8BLAfGefkb7hBHLTdQjvvi0tUitCFGCOok0igI
	fq7JoPkfnDE2Lv9dorVN0SdT76cBiquBs
X-Google-Smtp-Source: AGHT+IFzME82wtFhiLZQ0596FmC/IrmouUnXxIXvNfGhgZBmJbZiykpTW4VRwU84h8kkvIZO3+9/SLoaGrJsnt6/bD4=
X-Received: by 2002:a05:6602:15cd:b0:83a:a305:d9f3 with SMTP id
 ca18e2360f4ac-83eb6028fb1mr880276339f.12.1732193749094; Thu, 21 Nov 2024
 04:55:49 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Nov 2024 18:25:38 +0530
Message-ID: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.13, part #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_045551_185610_29DFCFCC 
X-CRM114-Status: UNSURE (   7.87  )
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

As mentioned in the last PR, here are the remaining KVM RISC-V
changes for 6.13 which mainly consists of Svade/Svadu extension
support for Host and Guest/VM.

Please note that Palmer has not yet sent the RISC-V PR for 6.13
so these patches will conflict with the RISC-V tree.

Please pull.

Regards,
Anup

The following changes since commit 332fa4a802b16ccb727199da685294f85f9880cb:

  riscv: kvm: Fix out-of-bounds array access (2024-11-05 13:27:32 +0530)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.13-2

for you to fetch changes up to c74bfe4ffe8c1ca94e3d60ec7af06cf679e23583:

  KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list
test (2024-11-21 17:40:16 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.13 part #2

- Svade and Svadu extension support for Host and Guest/VM

----------------------------------------------------------------
Yong-Xuan Wang (4):
      RISC-V: Add Svade and Svadu Extensions Support
      dt-bindings: riscv: Add Svade and Svadu Entries
      RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
      KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test

 .../devicetree/bindings/riscv/extensions.yaml      | 28 ++++++++++++++++++++++
 arch/riscv/Kconfig                                 |  1 +
 arch/riscv/include/asm/csr.h                       |  1 +
 arch/riscv/include/asm/hwcap.h                     |  2 ++
 arch/riscv/include/asm/pgtable.h                   | 13 +++++++++-
 arch/riscv/include/uapi/asm/kvm.h                  |  2 ++
 arch/riscv/kernel/cpufeature.c                     | 12 ++++++++++
 arch/riscv/kvm/vcpu.c                              |  4 ++++
 arch/riscv/kvm/vcpu_onereg.c                       | 15 ++++++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  8 +++++++
 10 files changed, 85 insertions(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
