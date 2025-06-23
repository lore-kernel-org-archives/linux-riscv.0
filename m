Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3499C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3zrR5r5WwvSjxkStV0RHQ6Le/jDP1WiKxzmXdmUo68Y=; b=c1aWQek34PXYat9FZrTNmeXBeO
	d2RX4y64nqTYsNMsuRh7DqsHPkccj65vHF8lQ9hrPqhpJ4Z6PZzUCxSwPpVA5bTSbx5g+yGMaIfb2
	R8jk2UU3vx9gYVgiU0HHCPBWIWew88jWPNO3AawqeSI/zfkJpLQY/UL+LtuKDiplboOAZss93jDxK
	q8daYJBMNpzWu23m5KPql2aJ0d4buEwQhGj3olJwV13PkMcbMVsnUmbfj8B03FkVmT2iC4OO3xCKI
	lIyLkeQLCKEbzMqK8KSu1DgbdlbachmWLJaxioRuk9qyYxJsjOQIj7xpX/39IcRIkrb0s/V+g5plV
	xwyKxPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscs-00000004Odl-2Xj1;
	Tue, 24 Jun 2025 01:39:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqjV-00000004BDD-0fDj
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 23:37:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-748e63d4b05so2834588b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750721868; x=1751326668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcKF/Hbk3n0gfb5f/PYKJg7t66HvAlh7Py7W/Nz9PVM=;
        b=X5wZqMV5DYH399I0HkxKphzuBhrAJKOAgkaqcm1E2fP+9mCTZtYy5FCZu0EmAHfIk1
         dRCcg1qSHR0nZD+4dAGHoVa5MsKBV2DxykKncjDEoHKz2uRdvkMNMyqY3HaPUqceX6OI
         JaM22aVIh65DW4whu2JRVaAIiG425t4rr4AYb5JRW3aVgKUb+36AU1DW39QYt5ih9E5Q
         DWyG9MAHdWLqtBqfjiaQA+PTCF+ovz+ncm4OSV5hkDxZF0jj0Ly4J0zXX0qHLi15vPv0
         gwC4MUdjwu7rPEyMK25/6zs9v1II2ZWjR8jWvqafbfIW0MiIGDfEqb0EGYkfSw1eDQpL
         OSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750721868; x=1751326668;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcKF/Hbk3n0gfb5f/PYKJg7t66HvAlh7Py7W/Nz9PVM=;
        b=DMt5UTwDOWqu+vQX6wsIQR84r2arfEEE1eZvnrjr+ObaWrRZkS8Up+6DubyfdeiQv0
         5B/nhPr3DDUcORnF+1uACYHD0FAjmpZ82lL/nsxp+W3mwcQpKiOhfHPYX6Q86b570iSt
         bTo8ATcTgOY+RNLLRzVinZbe/pynmJk7xDPKRcYht4lMvmcQnrOeaYS5ENYKKtVZX9YG
         +SJUrrJRkCLgWel3I1gu6yz7z6EFlZBEGslK9ngpwVCeI+pIdwrsQl7LlX5Pn/sSDx19
         xJ3SvqM5uOP38ZxLFQ+x5CkFjnEUlJ7n6OvfI3En+SxbjnRWZUX4Z7r/YfOJ7nHTC4eJ
         ziPg==
X-Forwarded-Encrypted: i=1; AJvYcCUCUc/+7V/IaTDDWEGmjnEQcjP6cJL76JU2hnGlHfIefAyAv/I+CdjgOCRfifgMlH4sX6B0YOXuoD7Dyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzkIpWgATnttJQMJK3Nb8CDxzYiZCSx05SIvOk1jfE/tI74Qj3
	wPXJtkrV/AOY+HMmuVY8/StrhPZD8qXWZuEEe2HkQE/aiWgudRJfk6ssE03W4DRyihM=
X-Gm-Gg: ASbGncsQTae2LxfmyvrV7TNXsTrn79TFEMXuFW6ogAQ4luaeNUwNfjTSfscquxDAqrF
	LiZmFNKJ/+ZQ8vNECL96CVTKQBvqpE6R8OW6fdQkLGzP/dzRg8J02BU9ASrxgW/egi2vFcBrJSs
	8ZYqON8TE1asgswede3S85F63/thQQy+sXGLTaBVHJXjGXzZzcpIU0t5mnaGsKtY5VUzsD94WCE
	u01ZELB5JL6oJZ3dANXLBBTy+skVWXTDAbP4TkeCfbThWALs/cl7cTRiMJFgRv4TCTV3i+wpwRn
	CPlahbhMsskmg/x7BvoFP3DhwyPD5g9+oouNRi4llh9e4PeUSD54hHIvl6mU
X-Google-Smtp-Source: AGHT+IGAs3OuSAJDQHn2hdz8UrtA7+3G/pgzK3avyjgKR8NhPk0epLLLozqMdrMjxB8LM0T2Jjjpmg==
X-Received: by 2002:a05:6a00:18a4:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-7490d5c1af4mr17476048b3a.5.1750721868397;
        Mon, 23 Jun 2025 16:37:48 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749b5e08cfbsm284749b3a.18.2025.06.23.16.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:37:47 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:37:47 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:37:46 PDT (-0700)
Subject: Re: [PATCH v10 15/19] riscv: mm: Add page fault trace points
In-Reply-To: <8ec7721c8c300ee99d5ec0782558c7689b7ec203.1749547399.git.namcao@linutronix.de>
CC: rostedt@goodmis.org, gmonaco@redhat.com, linux-trace-kernel@vger.kernel.org,
  linux-kernel@vger.kernel.org, john.ogness@linutronix.de, namcao@linutronix.de, alexghiti@rivosinc.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-393F61AC-2A36-46DD-A969-D7EB83A7FFD5@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_163749_195869_8F6E8052 
X-CRM114-Status: UNSURE (   8.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 10 Jun 2025 02:43:40 PDT (-0700), namcao@linutronix.de wrote:
> Add page fault trace points, which are useful to implement RV monitor that
> watches page faults.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Sorry if you were waiting on me.  I'm assuming you want to keep these 
together.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
