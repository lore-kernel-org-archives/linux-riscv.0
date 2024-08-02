Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5D6C52D6D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L5aqzYUsngc5dW5swYlEh9URNigaC8uFgixoBBI6keI=; b=k8cMyImfRmLjJS
	azUPfyhgiq97Qm5/X18pOcx2m+poGjd+42RCg2a47fjNNYkJ7mV6OxwX3AyJjdRZAYfHjFUnwJMKY
	OEkt9m1F2PQyJBJ2nRQ1YjxWv8iIxBGVUYVgSvH9rlqGvXivpqknOQ8tZ/8FA9uSw3obzP+YeTsOb
	bwurtYy5KTiKzhinQh8kJrOHIHGb5Xa4ZMnL7GqnnHjLzHwKy+Thds0mJLYeQhvKnKnWA+kxu58ZJ
	RvvDjoQ2E1laOJo+eqGz60CssfgBLGFNeAcRA3oGy9gHE3jMKB6biKHQ+5GtHcDw+Hp+nTcALKCCT
	TzsC7IabMhJmaXmQiaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqfv-00000008i4K-2DoX;
	Fri, 02 Aug 2024 11:42:23 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqfs-00000008i3b-2TdP
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 11:42:22 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-389ccd2f0abso36878615ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722598939; x=1723203739; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a5H3AeCfNpJSz2g2+5Oi/AktIYfYVa7hff+1WjAceu4=;
        b=AY5m4JftF0qEACflr1RBnGBlqCWtie629xVImOGYejRkMQCPztfximirRBjUb76q26
         DHBraDXNN7ThOGo9gEhbHlcRtDEdc7LM1COWelU8M9zB9YDNFl32IXu8DCzMPZHYzZGT
         U9SU3nV6ABfkd5fOfrsqtudK+XebrASdvar/eWuq0U2OsFxUUajwh8nDYDoux51Gu0k9
         N0QjrIYRqwYFAsBtknuDBABhvUfTfz7BvJBYApOHtr2h3bENLxz9CpbUusuIntFCJCeL
         qRzDdn0vEs/s+CBiA9vGbiINAjqy231SprGSYZIjcDbu4pjIgVd0leLWAaXjIWisSTaK
         QSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722598939; x=1723203739;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5H3AeCfNpJSz2g2+5Oi/AktIYfYVa7hff+1WjAceu4=;
        b=eZFLOG+mmOq5lWCu4gDd9Il5UrfY7/Mm/LbhprOytBL+AzXQlpaucfsX7nz6xXOlVW
         vV+X7JRhylcdWelpP2fgP+vO3k4MhhvVh5ZChf96bWnHQ2rVUePIeSArjHZIP5Kd1YVI
         nvngi5pUZPxYAras3ozoC1nP821rbB7pHq/9wxHEhX4/5Rt8vh16wQAgUKfdMSYxAGHT
         sUB4tQuPv7J25rrn76xsZPGwUyJmEdR+3BE6IxJASrc0EQHuDSBiIv7JMWffzE+ncj+Q
         iIu7qyP4Vf0GVBqb4hUm2a/cOtt7eVKwmoU3JqUT0pXre0EnFt7cFDzsLVczB2fAbH5G
         sdIw==
X-Forwarded-Encrypted: i=1; AJvYcCXtZxOAyoQjWxsiBaSrZe3Piv2xexQ58988osZOKAR8veMN6v7+ZEGJWO2ytz6F/JjU9Mc2quYoZyzl9vj/LnoNGkVIa8pU/7ZO2Qt/2WJI
X-Gm-Message-State: AOJu0YxkYjQ3S+O+YiyHIKgQQpQugD3XOlTB47D6yi73CdOYBPpgVlH4
	2PAcYY8InmKnsyGTvadlVFv0stu3nCGwRi6HGSX8mn2EAlGWkhcN3oxJ7ZobblEVQNfejoyTDJ+
	xqZdFg0VFFmZs9CQ9wXrQjRWuGjrIjUd2Q/C1AVPq6fHup1pa6Vk=
X-Google-Smtp-Source: AGHT+IF+ejI/SVKE/t4Uk/W5P56djcwV8NhCicI1Lcde8YBa3WL3gElptRwgVZ5UcXVXfBkSVFxk28Ev5Le4Snmg7pI=
X-Received: by 2002:a92:d7cd:0:b0:381:2571:ca7d with SMTP id
 e9e14a558f8ab-39b1f79e0famr38010815ab.0.1722598939359; Fri, 02 Aug 2024
 04:42:19 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Aug 2024 17:12:07 +0530
Message-ID: <CAAhSdy3ZhXmbDFrWneA9aA8ALYy+SgMpyopd_9MPzYgWksMLBQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.11 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_044220_652082_EFD86D11 
X-CRM114-Status: UNSURE (   5.90  )
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

We have one compilation fix for get-reg-list selftests
in the 6.11 kernel.

Please pull.

Regards,
Anup

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.11-1

for you to fetch changes up to dd4a799bcc13992dd8be9708e5c585f55226b567:

  KVM: riscv: selftests: Fix compile error (2024-07-29 10:10:56 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.11, take #1

- Fix compile error in get-reg-list selftests

----------------------------------------------------------------
Yong-Xuan Wang (1):
      KVM: riscv: selftests: Fix compile error

 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
