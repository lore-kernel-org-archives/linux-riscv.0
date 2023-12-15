Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A26C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VxezvVM5S5MVF9y7FOD+tYWGg2mHTTWA9MQJVSFvdvA=; b=Sot6QvYtQHwpCR
	b+eeOEdxgXSz1sAHTEh7Rn+7bc+IlKOOlVuyyyYtW9NV3RGIjnt2QYaVdE2oXzzf08mbDR5LDnH3X
	7ZfAivLOAEr7jtGjd50+rpJr+phUHpmhGXS0vB7HN3qq7m1lsyhZqOQAeJ4AyAyRjH7rbzVlibBiR
	p44tkwwwgT9fUvNXgew+2L5si4qsdiiYk1oDpoKt8oQDmHsbRAGaR44bv+Ue47aDlD9o8NYOUIRS7
	DZkWQHNI9tiZJ0kaWPi7RUCJIRveXfCmrNzVOh/XX+D57f9YU8lIcS+bG4S9uVQxnewyoXDDPp31V
	EVv8xJQVz1hdTylP+PBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBlk-0041lQ-20;
	Fri, 15 Dec 2023 17:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBli-0041ju-1I
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 Dec 2023 17:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yLtSsXKTCLILvMN16fQqKt8fNEBsG0IfzY2SlDwuhSk=; b=HpBMlQAWhEyp2SE44gXh6HNGPV
	zikt4TAqftF7+XsrOYCx7zs7Gn9F/ku2FAaIa72KvqwLYbteHC7GConERXwQP6cHqJ5rdZy9dx7Sf
	1A+jt+cbzJ0A4BY0sCNtA0jn3Sb5m6k3ce9n2+gONWOrXxLx/9Vvuuus++7SVNlBCr9obuOy/NmUX
	/vsBxQ11jDZ7S0Gwc2Os2ChFMUvvLRJ/aTqx9CN6JQM5Wd8iFlkcQ8dnYjjEsXMZWBaukGyaf7PsZ
	CDduWDKRaqN3c/NSHAu5YRHQhNWVyWXNLsoJ0H2aG+05wXHvKFbjXIGo75gBNc8EYFkvPBwcIA1aB
	QEG1WtHQ==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBlX-009zoW-1C
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 17:14:33 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c68da9d639so582505a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 09:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702660454; x=1703265254; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yLtSsXKTCLILvMN16fQqKt8fNEBsG0IfzY2SlDwuhSk=;
        b=F09G4/foDIeHgTcp2qKGuBfPp4d07RWQHZHsFIiO1gIigfTiemVE9aYs9M3pM9fBhi
         HuuxbFcTaw/jZkMK2cWM46MDnC4rojztDle+/Jzc6TzsMb1nyE7hNVJwPeC8KkW/qqUB
         9qC3cggcuaZxdBfDCH9dVSBJ/JfXNePs1KzcEuBKLLGt6O8Z0vljNJUE03nUVf7Aly1P
         DMYZ3yMmoiQTgrIYyt/scPkm3q9cESIdNUZs6E9aMYKnwhiljWtE6MSbtKHkP+sI5VdE
         VLlZCe3PDu8q5X8Pgw/kiUuksrLc0NBQO/lT0hV2m+0zmkwdWmAqzMckuoBclanphSUZ
         HCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702660454; x=1703265254;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLtSsXKTCLILvMN16fQqKt8fNEBsG0IfzY2SlDwuhSk=;
        b=TGapxpWd4UJwTmm3kOkf92GzsnOzgmggQjfW22YXS4m6QcWSwZEdiFtI9hLgSz6e0N
         wt+YBvb8WVo9RT6ly0cE/QVTJ+Snk8ThZAgRG+YmCWiJrDxPg0F0wtQTmbFj8yXn/Pjl
         +hctaqftLkkNBbCUxyDm5C5hBoshbZpN3PoQvOLWnZAmc5xgp5KEeYL/5DvcQKof+lCu
         M+MW/FtyTkxxgvnBsX9iMnka2UtBkKZSc7wrvTm1TneVYSdz3eYYRHvXErY/PPtg3QHl
         cn8GCH0sSP+0+e8Ablq/woj0kon6PF+ExqsDsLaq8+ztWZj/oywYh5zMVwwJDUvq/1//
         j0pA==
X-Gm-Message-State: AOJu0YzIWh9+6KqFHTQk4vhs+sgONx3OUlqF50U7+007nvq5Pl3QnSOj
	9HI1APXvQVmeJM+T+X/IiN1fSHMgQqs4OKWkrx3d/A==
X-Google-Smtp-Source: AGHT+IEbyKgx6IyVo+O/thicE6ukN038O+ZCGBqab4jLVgs86diNRbcckBMXey0NIT1euua6+wlRDimBw0fjAcalrPk=
X-Received: by 2002:a05:6a21:8026:b0:18f:97c:825c with SMTP id
 ou38-20020a056a21802600b0018f097c825cmr6008551pzb.102.1702660454232; Fri, 15
 Dec 2023 09:14:14 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 22:44:02 +0530
Message-ID: <CAAhSdy3Rc+vub65qJ4JNngp5qTgm7YpsJCHZy+ff0=TN_ir03g@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.7, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_171423_746712_30016B36 
X-CRM114-Status: UNSURE (   5.57  )
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

We have two fixes for 6.7. Out of these, one fix is related to
race condition in updating IMSIC swfile and second fix is
for default prints in get-reg-list sefltest.

Please pull.

Regards,
Anup

The following changes since commit a39b6ac3781d46ba18193c9dbb2110f31e9bffe9:

  Linux 6.7-rc5 (2023-12-10 14:33:40 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.7-1

for you to fetch changes up to 4ad9843e1ea088bd2529290234c6c4c6374836a7:

  RISCV: KVM: update external interrupt atomically for IMSIC swfile
(2023-12-13 11:59:52 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.7, take #1

- Fix a race condition in updating external interrupt for
  trap-n-emulated IMSIC swfile
- Fix print_reg defaults in get-reg-list selftest

----------------------------------------------------------------
Andrew Jones (1):
      KVM: riscv: selftests: Fix get-reg-list print_reg defaults

Yong-Xuan Wang (1):
      RISCV: KVM: update external interrupt atomically for IMSIC swfile

 arch/riscv/kvm/aia_imsic.c                       | 13 +++++++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 10 ++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
