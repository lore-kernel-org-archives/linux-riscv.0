Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D4606A31A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rz8nQJw0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oVhd2BB8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eHP244GklaQZwCt9yw82zW9sBYm9K+z+EM3YJRg899Q=; b=Rz8nQJw0ly5xcVzRXK4tf6KS7P
	o+y/CiWZxHY806eHLW+JjzuDTq7Gek6xK7JUr4Fws4nrWn27olhsJv08joWeipf0qohlWri3l2VAF
	aGbX5QRY8khfdH3/epJ6FZjoxuvSqfTCmvdnKUppCnFpUbf9/hPPi0/zZrfHW7JHyc+5Q6G1U6uzz
	DPZMYaCaQjg164egkaxKuupqy8tfK98dBXuvmJTYbbBUp60eZISzxlwoTS1Puvfay7VMYI9PjwNgv
	AWGbf5vnLUJBdNrMz9RfQfqtfXj5DzyWKcdD0ygby+Q4V8Bdxi16VssCJIy8So1q1+ynAaqc4Cd+H
	awZ8ueqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6T7-0000000DDY0-3Utn;
	Sat, 31 Oct 2026 10:37:49 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6T5-0000000DDXi-0ljK
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 10:37:49 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-36a24f47293so897356eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 31 Oct 2026 03:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793443065; x=1794047865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=51xyznyCe9WelvYeEXo4BU/h4Ecjz+qWRQ0TYPxSgHU=;
        b=oVhd2BB8YaJn7Zel8sCkRJm1Ex50smSxViqg6QSoNLZcplm46/wQ63BOXEO/Afl6jD
         +9BYFM9sugKSJx4SdN6y7+GBIvE9kMQtLs9dxNzOetog9kXQAHngTRMUXm2Sd6f/TSIU
         ZyD6aBsdZ1Plklas1TOy71eyKhXOokNKYsGZ2gWDqA2+dgJjmgwyxtlY0smPCH1O+jGp
         9AukxAI5gFQGOB4dk6ZJbZaPMxDYX7dz69y8LQ17UXI6ZfEOHt66xEHsMdJW1dJcpAbF
         m3eq9w5iQ6yK/6KQht5VsQegcWIIkeRGeIrJRCV2zbWBkjGsoBMbw8oTuP2nET1Jd1Gg
         vX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793443065; x=1794047865;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51xyznyCe9WelvYeEXo4BU/h4Ecjz+qWRQ0TYPxSgHU=;
        b=a6tmrhcKJE5cxXfAND05/tWeVZ+KoINaqAgInwBYzzF1330QDzT19PVqSq5paBMIaG
         cF5wGa53KwZdqA9v0Q2iV3fUGl4WeOAboLen1e5OQZJ6ue1qqL+Ru4oHTVgxMfjP6Njn
         mgOqBQPOXQEwmgoIj+N0dnbYwNyK6iWf2SR8HPNeC6bDynDQMutXJZUPFQBuX3lBTfsI
         6Pxb2e2JZnlI46R6OeYBtWMtOKRHAGt6pw13+emLnMv97xJFvbOWAamIU4TIsOaOEi31
         3i6yeh6Mq5kWqBhWzTWhuq3ND3xCJQRBQpwHnWgPAte1qFefNsJ83vBbrs8ANzwIIylI
         FT9w==
X-Forwarded-Encrypted: i=1; AKwUvBx180GlyH4UBXM48TIa1srhKXKoIzFOQomtMF7VvtdgBkjC94Bq4e7twVk7a7d72emvlbsJum7seWADDQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIxD9udFeJz+LF65ixhZi65bOaa0XC38N/6+lWnWt5bp391VCkX
	KbiuSs5u6YWgHUOsK2eQTF++cK2hMsOiKRJlWDUO/dotSgyMZRPyoKg=
X-Gm-Gg: AYBFou2qiRjDAaYikvoGps4XJYenaomP8kkBsuxD0oyvhPHKmbL7CGCzomEqAtIimWq
	EQLfOJH9lc98Vr0lzJLZAemNAWo4DvbI0y2CWKWL3JdOjfdU8ksF0U9A5U26aSUI5OTR+NcHHqB
	dx+hfeOKlBstwKEBtY33fh5bIHP9uDip8s7ZgSF++Ps6AEC28SgM4yPpPvvco2wKyXkE0H48eNA
	1/mCxAgQ6/iw3co/zlzAod8a+VBK4L8cFctFE4y/vR0fauKPwsSxyfFJMBZvPbWUrM0u1C9mxh3
	QVpjvFxDlbuu8EE6HmlbdSuO/DSyVsb8fk5+Kklr2EdiKRwhsh8FURcM45KEkrW8SKVQjf6EROa
	EuaNYvhIXmVynoBkw24X3wtawUdeI0kUM55kuVRsum4A0FY+sAdCfNBzsXoSVbr7PEwng59siRZ
	exTmbuDRj/1CVJuEzxhgfO8SyxLN95M7szGmP1y9HOpvIl8ppxjjpieFL8x5tKLU9+jftiMC+A4
	OSWDNskTMKuIYMhXMxddNY6227EYF43VhRMrdDZPPHTXSF5UKEL2WzGcbBpaJ0lHuocybOuxgbL
	Yvgb5pfjqOOiyp9ARBKq9VuvN5Ojppr+FwdJtw2Vs4Ql5L4u0FCMnlapa0UHMA==
X-Received: by 2002:a05:7300:ce08:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a42401de6mr6495441eec.9.1793443064825;
        Sat, 31 Oct 2026 03:37:44 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a13:a5c6:1ff1:280f:be24:11ff:feb0:8690])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm17019810eec.3.2026.10.31.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:37:44 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fustini@kernel.org,
	guoren@kernel.org,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	wefu@redhat.com,
	a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-riscv@lists.infradead.org,
	lossin@kernel.org,
	m.wilczynski@samsung.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 0/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Date: Sat, 31 Oct 2026 18:37:34 +0800
Message-Id: <20261031103734.24734-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030020209.3833766-1-tomo@flapping.org>
References: <20261030020209.3833766-1-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_033747_257703_38019414 
X-CRM114-Status: UNSURE (   6.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tomonori,

Thanks for CC'ing me.

> Both series use the same module header, so whichever
> is applied later needs only a small rebase.

Agreed. My div64_s64() and div_s64_rem() can share math.rs with your
div64_u64() and div64_u64_round_up(). If your series lands first, I will
rebase patch 3 onto that module, preserving your unsigned helpers and
the common module header.

I have now posted v5 [1], which only changes the SAFETY comments relative
to v4. The first two patches still fix Delta independently of the math
module, so the behavior fix can be taken separately from the extraction.

[1] https://lore.kernel.org/rust-for-linux/20261031103206.24051-1-chenhan0017.work@gmail.com/

Best regards,
chenhan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
