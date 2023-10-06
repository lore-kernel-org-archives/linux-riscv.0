Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FE7E94139
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 22:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=czML4Yc7jd9/ERIj1+gZp0aDLyekkEGMk8zr5WAmPwY=; b=tuU
	1WZok6v2K45/uUt4VUcgElJm+DBs1iduXqnKKrpXSzK6AER/uoZtm5GsM47357ZclbkfNWD4nWmat
	nSX6qhJ8OxNYrFa+Vpqvhpu3UtRKUZNy7KJlo8TJ6f08ncCz1oKqkuNziVF+iuCQOxOQtlViwI0GC
	J/YTsntUKj4nfR6uF7dWRdTO5qqnK6ZzOOBOBZw7WIPY2EOKWz0dQyAUaTzTSHVNwDZZoejR75goy
	3Nv0GgFh8ShyR7UPKHVDfBes+sAeTze2OjvSj0vcvyakR/0Hr0BU8hrG7czUwWieSQJs1AkwoMrOW
	0t9VwSF2rH5DQHsgJN+X8bRkTTwkpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qotZ0-006bVB-0G;
	Fri, 06 Oct 2023 22:44:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qotYw-006bSv-1K
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 22:44:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5044dd5b561so3206047e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 15:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1696632287; x=1697237087; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KS7mBEiX0DDz5kR0zKBoVDbfqVsfx0HX5iB/PShhYi4=;
        b=L44QcV0ILBkCuVjtUVgxwHCVmvyy6mHsnHOoSlbuDyFvswlAkwQxFgj5fzgYAXvWsO
         iXeqB34pkzXvUara55gOHBxAjgS/I+DQQGHGN4a4BgjlfiKfKUmnvoUohBTyGU+/qfxW
         5wX1PJCOB1csHh3qOooT1e8FJweBHc15QYoxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696632287; x=1697237087;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KS7mBEiX0DDz5kR0zKBoVDbfqVsfx0HX5iB/PShhYi4=;
        b=OYPN1cxAeHWK0dFie7WJainDFF7sjRmZGXISBnSbNHYkwsU2lS98uRIFY0FJ4C+esZ
         ihbIAMrstabtCxY+l4OAjS9RFtNh6rxH923MfsjyCssAfzGuoLiRTTKTnUivN3DPdo1y
         k+WAsTeyi4I6yHbwYwWkw+bTpe99GQ8B4htYY4I4dIP8gWclJk9NUYQUDKJlyv9ThM3s
         ShITCzPTI9Li9wfhvIqm05EGRSGm27ta1PuCUUEfAfbTJHaGoTTQsp7zP2N5jnJJfVrP
         X9eQ/a0rUmWlHV7Xa/kHJ6m3THjuUmlly5ICLQ2b2exGNJfNhlPPGhMW9/hi3fuEpgpA
         OfyA==
X-Gm-Message-State: AOJu0YzfOOvMR0QGO3wYNVSVnwk/I+Q9dKzf0AZcAPL4djTz2bbFUUyE
	+nM+GYjMMvqt8RO9nIWQ8InNKyFMFFsfB7Fqebdt
X-Google-Smtp-Source: AGHT+IHhwG2w69FTm0eu3WE3/Vh/iQSInl1QzLD5EQ7hePvoSYxpErLzarl1elDZTbG/0iwo9R3jAhzc/ZmDuS7tYFs=
X-Received: by 2002:a05:6512:3494:b0:500:c348:7efd with SMTP id
 v20-20020a056512349400b00500c3487efdmr8273577lfr.59.1696632286130; Fri, 06
 Oct 2023 15:44:46 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 6 Oct 2023 15:44:34 -0700
Message-ID: <CAOnJCUK_-svfBV2q3Sjc7T1PiDDzwMEjLWRr2hhB41vC1_4ORw@mail.gmail.com>
Subject: Public Review: Supervisor Binary Interface(SBI) v2.0
To: isa-dev@groups.riscv.org, tech-announce@lists.riscv.org, 
	tech-prs@lists.riscv.org, OpenSBI <opensbi@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_154450_633390_D3DC5965 
X-CRM114-Status: UNSURE (   3.09  )
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

We're excited to kick off the public review for SBI v2.0.

Review Dates: 10/06/2023 to 11/06/2023

Specification Details:

PDF Version: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/commit-fe4562532a9cc57e5743b6466946c5e5c98c73ca/riscv-sbi.pdf

Source Code: https://github.com/riscv-non-isa/riscv-sbi-doc

How to Give Feedback:

Email your comments to the public isa-dev mailing
list(isa-dev@groups.riscv.org) or PRS mailing list
(tech-prs@lists.riscv.org).
Or, add issues/pull requests to our GitHub repository.

All feedback will be evaluated by the Platform Runtime Services Task
Group. Minor corrections and straightforward changes will be directly
implemented. Any other proposed changes will be discussed in a summary
report after the review period. If no major changes are required, the
updated specifications will be recommended for approval by the RISC-V
Technical Steering Committee and Board of Directors.

Contact:

Group: https://lists.riscv.org/g/tech-prs

Task Group Chair: Atish Patra (atishp@rivosinc.com)
Task Group Vice-chair: Sunil V L (sunilvl@ventanamicro.com)


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
