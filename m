Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EA5C3ABBC
	for <linux-riscv@archiver.kernel.org>; Sat, 10 May 2025 00:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PCBNZFldyLwnOzya9iy+HE0R93swcMkblYj3JCzJ7nU=; b=fnD
	+PRW4OcUVL7OaqIcKXVkwweowQl8ttimL3egIYCnnAj0kD7ZuYYgMHD7pXe8PG09Y6erPH5LbECA/
	uLjHbo9iKN28/ZU2jgJoj4Mx+QahRf98XCbun/mNIkWY30D3fQMwn4HNgpN/vuu5oF/Yg5YNT/L01
	khNh5WUx2zKhDvhUMKzfqgNklH13AMWP+p5cN117bbfeWTXGp1Z/UVW16rb/FNLrjn6dOkLqIs8tm
	vSI/lrBcSNuv8NOQBMZCUxVrcdicdEt5ZjCj8Z7yYQzzTvEzj8H/67MungukAO6oo8sMHZu62+MaE
	V6/n7GVJkztv945xLcyzZLLbda4e45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDY3n-00000005Bbh-0BzF;
	Sat, 10 May 2025 00:27:23 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDY3k-00000005Baq-3imR
	for linux-riscv@lists.infradead.org;
	Sat, 10 May 2025 00:27:22 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54e816aeca6so3730278e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 17:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1746836838; x=1747441638; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3mVG1HeM3gdC8OZro3hpeCvElqs1hv0qRQHLs49i9jU=;
        b=TZ52jrIK5E94vIBS7ZM2xfk9qPZPIqkiuewItaJzc2mkvbsOoTY5mqO6pkBDB7RWnn
         7w4GbA0wSsGLJOILtwzAXhzlNEKxeKoxmFSO6gkYGfIEQdfl0EqWDvVAFWaUdelSNEgg
         TLQECl+1I5Z5WC8+O5hjSMw/fbypKBmnvgIr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746836838; x=1747441638;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3mVG1HeM3gdC8OZro3hpeCvElqs1hv0qRQHLs49i9jU=;
        b=bGZzcP3f+JOXcngVtip5xhDmk+bjKC6X9nSZK67HyJGHZcO4uisERwFt5yPdQZbxqG
         OGBfbrqyhVS6M9kpHe4LOm/+osGlyOObzfMGF8HyzcNGxtie71kzJ6L/SAHuft17kRgu
         njLJ00lTU9Ko3WkDIj+U9fxMaw3UbiCup3+3LjnekpNTz1+pNohOCCuJGZZrbXQiDGxz
         2zL5eQhW3izEx1f6r25vIkffctugpxNkUuavik05IxO20ZtVmKV2a74/RbN8oSesHM3g
         Qyd2+AoY7SGbFElY8d+GU6Yibu64/7aP2yw+NW2q8VYQddAyu3CHdlrUwDXSHWyXzT/j
         YmQA==
X-Forwarded-Encrypted: i=1; AJvYcCVBgcF1No5bNXKB8uMZcNebq30WlG5FVnDU8uCIsyWepQ5g85y/da9kFwkiI85V76lIIAzm26HYZOYOrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy/BnkM0icLPTwB/a4rgh86/NQa/mTZnnerY17rJnIX1yATunN
	xueQSNrIT25HBwb297wSkpQX8G+JnCVQI+vpcWmgzy7KoyV3qJRRFGq4wgo8twc9i7zuD1vJCBv
	JT3fZCnS/SwS2QeFNapbhohoQVvxiWdVJYFL4
X-Gm-Gg: ASbGncuzYBoHAeFE5snsxdD1bNXOn622vaJ47HQF+6J9eP4O1j1/XslzZVMu1LC9Dq2
	5XlflemJ5iqRC+4me5V/NfykexRs1e88j6DpBzqgQBXeKYx7o4c25BmFSASnyfQ72w2+epjEUqI
	X8C9DSgDZtCBJw/auHyPezmSRBGijigAEohOTMGMYv
X-Google-Smtp-Source: AGHT+IHq1BR2RwD1OajhP+/YiGZ9fkf144EzsbbWtinB6VHcq7O/YUEpefqqQEj01YRC/lW7eaBIPZsS0NcfX52nkTg=
X-Received: by 2002:a05:6512:10ca:b0:54c:348d:19b7 with SMTP id
 2adb3069b0e04-54fc67e34bcmr1853508e87.46.1746836837608; Fri, 09 May 2025
 17:27:17 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 May 2025 17:27:06 -0700
X-Gm-Features: AX0GCFvBhojEPGxCv8S7ei1dcTB_JLnwOyhSbEHrwZ9C3QNaeRIjn699JP7VHCw
Message-ID: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
Subject: Public Review : RISC-V Supervisor Binary Interface (SBI) version v3.0
To: OpenSBI <opensbi@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, isa-dev@groups.riscv.org, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_172721_191937_5C3EF1FE 
X-CRM114-Status: UNSURE (   4.71  )
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

We are excited to announce the public review of the RISC-V Supervisor
Binary Interface (SBI) version 3.0. This 30-day review period begins
today, 9 May 2025, and concludes on 8 June 2025.

Specification Details:

Downloadable PDF Version:
https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf
Source Code: https://github.com/riscv-non-isa/riscv-sbi-doc

How to Give Feedback:
Email your comments to one of the following mailing lists:

public isa-dev mailing list(isa-dev@groups.riscv.org)
PRS mailing list (tech-prs@lists.riscv.org).
Open an Issue or Pull Request to SBI GitHub repository.

Review and Ratification Process:

During the review period, we will collect all feedback (comments,
corrections, and suggestions) for consideration by the Platform
Runtime Services Task Group (PRS TG). Minor corrections and
non-controversial changes will be incorporated into the specification
directly. Any unresolved issues or proposed modifications will be
detailed in the public review summary report. Assuming no issues
necessitate incompatible changes to the specification under review,
the PRS TG will propose that the updated specifications be ratified by
both the RISC-V Technical Steering Committee and the RISC-V Board of
Directors.

We extend our gratitude to all contributors for their dedicated efforts.

Contact,
Task Group: https://lists.riscv.org/g/tech-prs
Task Group Chair: Atish Patra (atishp@rivosinc.com)
Task Group Vice-chair: Sunil V L (sunilvl@ventanamicro.com)


Regards,
Atish
On behalf of PRS TG

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
