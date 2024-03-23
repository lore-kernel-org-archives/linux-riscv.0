Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B39C54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 06:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqLX618108sNX5aoUYaXBCaXv/+KeDji0hyqmwMgnB4=; b=ZhMx5ixBoa1TVM
	L/0PuDxgeBJFvki7KOeafGfluGGnRrJvuV5AXmQyOccT9symww2Cqt/mfifprPeosN8hzAPoLE2JL
	G3sYx3Y9KhhmE50wGOZJPwGyAcyRe5vPpRd+jVmj+5RfwNG2DodGZWZb7pi0mn6O/SrsRjB/9sC4B
	WEf1Bds41ADkldPKlXwmEsCf3lwvk+YasPcfyaMAqf0G27GSG5QhwS7MGeCJFsogfR4tnfUEYPoH9
	uzEVL4dI3giZVJWMeXX7R9ry5w4Dl3UG36EQvCDet+FjdGn6XTXQt5JR1GlzYijvdZfYfCc9uHd9+
	KQsMEbiWBHBwyvFivi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnuq3-00000009iFX-1Ng0;
	Sat, 23 Mar 2024 06:26:43 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnuq0-00000009iDC-3ZBH
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 06:26:42 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6e69a9c0eaeso1710225a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 23:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711175197; x=1711779997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jaVCkfGUt9+ZKDpqqrdz4xILcOY76BiSHYTOJFFH2E=;
        b=iie/xatA2M8X2b3YCSTdHZvFL1HJsXDZVyg1STmnQUhK47oXrf/ykewRj3K6inNM4/
         4vNurVtZgU3MdbILy3B1t7TJtGHC4s+4VJ7/r6mOY+Nb1DPLfObrWaOiZ6tLna3A8MDX
         YK3azC3PBNQ6hHsQ1lMNvHALWfwNa1nOMI5M1oG6uoWtnZHTCgEJPokXGq9hSDR9Ij1Y
         5vqPL3wpafTzD5vHgOrq9vo0ISc05sUPaD/r0B4mCfTnwxJvcE+LjD1aFND5oS+QZfL4
         +jkfk2t2vpBAtNKBH8yGF1/nFDCvK8QZUnHeBnnXuoDOCRZyB4d/aMilaJu9J+lVu5/p
         9+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711175197; x=1711779997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jaVCkfGUt9+ZKDpqqrdz4xILcOY76BiSHYTOJFFH2E=;
        b=rZYn66ItN+ZKqjOLII4cK7EJ41DO/fdGc6Y8b4B5s5x/OMPoavOMWzdNtoT0e8uJ9i
         7p891UkXc/7NU0exB9zfuBcQEnWRIE3Lgfszfbtu2R/8aOV/fSXMxzv6hV56mnov/cL+
         nvQjqMJHTIdD4JuY+RAB0X+zouE82CFiF6+FiSsW42Fy1eJfSuw1bphIhdaFuzp/nKys
         mD2uzxPK/k5VAC9gdmdn115CG6TM6sgOXVJhfrTMaQsp7l+RioQ14qnMlfpBfiiM2wch
         rDPEW8XnCa5U20geQm9uC4KF1suCXuC7IPNjmsBMqpQmYE8x31EWeRYS61/Tn+QB7MIp
         ou8g==
X-Forwarded-Encrypted: i=1; AJvYcCUHolGtseOFJtmJIPEyRG0YhfE+Q+kM1N4dKMRTOcS4zEH7r2qlve5SqOAn4BksVTFiEbDeZq8pxJrDjr5eWKdCtRd2ies6APzavU+kSrJb
X-Gm-Message-State: AOJu0YxfgqwVaiMoW4v4pYqNAspd3IyrOf5uJtLvsrcFMEOvHGBynwEi
	Cja1UdxNxD7tbden1uReiJxbh6fsoMijeEQTDbCJcvEfhBoBVQ35
X-Google-Smtp-Source: AGHT+IEHyo+ubbUWK4arwma+3PRQMV7yKpXQuggv/YJ9P+edg7f4UJVqvn625Nj+WKv5vFH08lYBkA==
X-Received: by 2002:a05:6830:4d7:b0:6e6:84a2:9e59 with SMTP id s23-20020a05683004d700b006e684a29e59mr1830226otd.9.1711175196822;
        Fri, 22 Mar 2024 23:26:36 -0700 (PDT)
Received: from gmail.com ([104.28.240.134])
        by smtp.gmail.com with ESMTPSA id v8-20020a63f208000000b005d7994a08dcsm2589763pgh.36.2024.03.22.23.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 23:26:36 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: alexghiti@rivosinc.com
Cc: aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH] riscv: Improve sbi_ecall() code generation by reordering arguments
Date: Sat, 23 Mar 2024 14:26:25 +0800
Message-Id: <20240323062625.2488-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322112629.68170-1-alexghiti@rivosinc.com>
References: <20240322112629.68170-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_232640_919567_F1AD003F 
X-CRM114-Status: UNSURE (   4.35  )
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

Hi Alexandre,

You can simply make sbi_ecall `__always_inline`, so the C function call
overhead can be fully avoided.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
