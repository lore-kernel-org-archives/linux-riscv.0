Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9187C83F07
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnnOvoMggBB1NzfimtwzfObx9cSvErUIz1DEDiKQFqE=; b=J5bAmUqVFLUKG+
	WNAUyQtaze64UAZtj/YfANUwQ6s2JW3QorvF+T6N5LkH/ZGeQFTQAJArScr41CEr/yKD+pU2tOfOx
	I43EKgvU6oxE5xc6KSuAvzQsZ2TyoNBOVSY4tyZiv1I2lAbxjlgYlL+od1e2yHi4g8w3e2TjerBES
	f9uEx+muiAvGolOZsOeNloAzOauQAKN5PALIFcAWxI5bBqsUx1Aii9J0ZOmWiZzieA4g607II865d
	rk7cZi7kpKK82jAeO1m2GEGwMQA0PMo2xVzATThukjoLQtWV7Cq9OpxYLJJ/FcORD0vgsvCzoZn0h
	/8uc/IhmY4bgM2NJNRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMNc-0000000079R-24iO;
	Sun, 06 Jul 2025 10:13:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMJu-000000006tK-05Ie
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 10:10:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso16045295e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751796600; x=1752401400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jV5hk2L/22TCKsTCyR4AWVhsz/bZszE20n4bChKlIP8=;
        b=PnXnmavn66E6NMRsEbYT3/bNOKmE0LLQ/uCacCowK9vQeoo07Syg2DXIjyKggDZhhd
         Yp7NNy3O7/57D0skmthkYN6OHIBdP3n8JGlIV3pTeCFbeLxX3MCF4/1a7VdO9/paWiPE
         KqoOOigUVQpfrTqJGovdODGDpXHk5hG6O9rzl8oACnDIwEumYBQmF716QvQ/o4NJNZ1n
         qw9BUTsbGZ+EybSRWHontjTqnkx9ceXm7WLRW5ZDeGlZZayVjv42UWB8yCMsRjjcUJY2
         oPtXfJM9HFurd5tuQ5m04fNmvfllnJXynmlXj+EpGPQMAb96+TVjrg34+rarPFkbplNl
         IbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751796600; x=1752401400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV5hk2L/22TCKsTCyR4AWVhsz/bZszE20n4bChKlIP8=;
        b=fd0WpYgoyaQoA4UOC0suAEu6qFXe5mAE1fK+Qn6qU3RG86u6P6ItLCfQ88z3/eJnDO
         HW0slSKLnalPUaaVGBUqiEMCTLLiX1Uh4qLKg11zAZJYRPjTPkuPrZvM11J8KSX6QJ3Q
         mukVusI32B5pRZI8l1TQNm/onGzPHmldTI+BlxFZrlYH8bLrSWcCZ90HvpeAl0GoJ5bm
         05tfmpGy0souSCqIF4jT5Q9F9PCdDsZd1d0tVkt2FXXiWZj42mg41ELevLTBhrNpg2yL
         wXmVbbtDgnTuW6gCwI4NYsATdCLm5fCV1r9EqY9rTN9jmZm4NhoSx6nlLnsGYbGnOfzl
         C3+w==
X-Forwarded-Encrypted: i=1; AJvYcCV/dg1QRKAfk45oKRvyQsEP5wq3shQadj4SSxCvZBkgRoafFNtnVOFLDLqsRwlGL9WAuVbjhVir6SY8iA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBkfFvQlrJ0y0b3zShz0cROXtgRj1wKWXWfXqWB39yCRQtpuLv
	vA0jHP7pIhrYqu117pGhxGPNwBrWptyp3eWlE48geYxU+3F8w9udt44/
X-Gm-Gg: ASbGncs0F+CexKnx+lkypbMwXUz6IFaX6Eha9ePj7wDU2cbMsOFEXjQMspR7BfWu1w6
	4EBuO09aPxVHE244Prth2N7Ti2zyqQgOWkzA6qzvDsmfFUuou1PAtfwroS+OcYv+Okv4xr2e/Qs
	1hhgaa17gb2td32jHd+nWuqrotMQPMzwlLRaaKgNsJGwbddR2kaSxXCjpQcAiOL50AsYeTbFArB
	ayMtIsBRZNaxFRWYYoD7qtsKeEsb9BAH625NCvGdHqpFeNflrL7T0Kjlr99uFNDc+A7dfVnsmcO
	7hEfubdrzPI8DskclKApMgOtv29Q4l67P9fxhw65ino3n+K/wb3aJk5qbvL8UpQmXIziWrbMqCv
	zzw==
X-Google-Smtp-Source: AGHT+IFboTpFzUmPBMceP5BQaZY52z0uD8klP61U5hlGg3Max/z1jvvjdVEPb6BxDr0QhRSMuQVpDw==
X-Received: by 2002:a05:600c:4f16:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-454c576aacfmr1072985e9.16.1751796600196;
        Sun, 06 Jul 2025 03:10:00 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9be0bacsm105336185e9.32.2025.07.06.03.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:09:59 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: ardb@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: gargaditya08@live.com,
	jonathan@marek.ca,
	kees@kernel.org,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lukas@wunner.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] efi/libstub: Print uefi status code on error messages
Date: Sun,  6 Jul 2025 10:08:44 +0000
Message-ID: <20250706100900.1481-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706094354.1282-1-khaliidcaliy@gmail.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_031002_059724_8912A8A3 
X-CRM114-Status: UNSURE (   4.52  )
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

Sorry, i accidentally sent this twice and broke the email thread.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
