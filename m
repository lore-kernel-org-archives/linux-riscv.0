Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01582C55174
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q0fm5+S43X77sY56dOW4nXbV0o8H/OxHlWIFUIfyEbU=; b=PKv5esf81nZRIv
	4RnqbwycKx9D1FGZFAPFBad/4wxsQPzCVzbV4H9HZQ58zZzGil4+1mnuncc85YjjVbvelvG98i1a3
	i2QZbpPDW8/cYY9URaXQASzwa8BiiGmWHosCEAS2MIH+emUjEW+lDkT94ID4KcpYK291eGESxa8CF
	RJf5r0Qal0LF2j9iA1m2bBbkW+XjvnZ8fk+KXn31tCaAXtFAzrl4eoaUSPJXmshefmE8j0/nNhe84
	QKuN9DhE3PZorAINOBmDtyE2pgaRzIS6duufJDfYKB9fZq8iccI+gaeDaJ0W+QTI0WmctkwMb0iYA
	T4xj/r/MoaYmOwUNJ9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuIp-0000000Da2g-0AXX;
	Fri, 31 Jul 2026 20:57:59 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8UZ-000000086yt-3z13
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 04:42:09 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-80a1fb0c683so33304897b3.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 21:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783917726; cv=none;
        d=google.com; s=arc-20260327;
        b=qWFGzBFEfi2cofq8rUeRfY/JGlGziJE48hH8XJx5rnpW4rUy174ceoCltWoVb9d2OX
         YRHwzaYBDAVJlfC/G1gGDmsGk77fGYA2B+Ylxwt0A3NBISxcET96o5i4jtB2QnnEwM2v
         ODyUX+12gIj2jKYED5PpcDisII9urCfHyd4GycBkKlmfpw2thCNfEHFNXh2cRfI7Z0P6
         5Qe4hCkqXMDj2AU8SLyTYOkJTRnrdKukHemyTl/vFPjM7taeOTrSvJ3IqmEf1WgHwHGC
         KqMqbf0fDSHRSzRUu7w0cJcwvpk2uFf1/cedteNDkaVyOwl4PGcPOnhwpRLbFe8iQFwl
         U0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TlRKkQ4mQ6b3iwYXqllyY7DTbZ/ShXk6siNXu76TAM4=;
        fh=67gYM9WwegAQXcm3uMcTJcvz6W8m5arBVkF+VYjRTTM=;
        b=BC7X84bgFKf55KZuPJrIW3ZwuMwEU7yHyTYgPfa6WFIMrSSNfof9Mb5PRfJoKo+IDg
         2YCW+SJ33BLIsiqNe9iOGy/+y5+naykhJDMpw2kiA8GXvKChfSxqNZM8Dqn/T4iqQo6t
         3Z5FK+xRl2NVGtsQG23b0qbh4Kk5yjkhbdMPpmg4dQ34RI8J/PjrE3mtoqMNN7Y/OIkx
         x2DkWyaGNnUZx7YvloUm37Lj/GqoIqp8E6bnedGUTt9uiJ3gqe+EGhebjcxcQRd3on0V
         f2Bp9hT8zMG+po7SRjLUoTu590923Hc8Uy3ER1VQQZxnys7gLcxBjrTcdHis6xoLp/LM
         nmCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=offblast-org.20251104.gappssmtp.com; s=20251104; t=1783917726; x=1784522526; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlRKkQ4mQ6b3iwYXqllyY7DTbZ/ShXk6siNXu76TAM4=;
        b=pAWZCa6a0ZyJiMZdRwe6mypV23okVzcyQIN2UqjFPjP6nePG3LSoa0+5/1rRXUifIl
         0asPpfacWaE9C/11I4YDHffHUJ2r7vOG+keCr8tn1z1Q+l61ckaxsEzOM1Yn0v3gONhI
         c+xauB6WG/4lbf12og74TyuCQXXL5y7yakzQRWI2tQyof50TB/q2ynIwsV2oyza/7QMJ
         ffga9gXsEMu1Ss7fHnjNkw6vNiv5/HgRYz7JXDV40HMXbqh6OrxRLrgmCflMd1I452D7
         hS0HM9VUC8WkJ0jHKZ/DNcVncPj5yoSIbH5kQSONv0CCQjM+WDIo+aO4DOcNasr3lALJ
         IOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783917726; x=1784522526;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TlRKkQ4mQ6b3iwYXqllyY7DTbZ/ShXk6siNXu76TAM4=;
        b=qETteL9sd7hMDiUnHpqM9vgxVrnIZ1CAKJowi0CJ/cDsSeGU96ZK2OOpg9Z8DMWerE
         06xjmXFwRTDSAsBWVVQhZyOvMB8OqODOUm5IuuxXIGtgPM3fHgK3rhH6L2GoTkXbniQH
         P6/8hQssg3AYqrof2jx9DpWzP2yK8m0b7jflOIt4y+qBOuWQ4MZcOGD8Y7g2wCclzw8Y
         A/amtMW9/OEpXX54/PDnq0bbknNek34sCy1z/lm7oMEMmSK+cExX9jqScGAuOr3zK6/A
         p4FSJRdXmtlK9wo40/BDf24PMLcPOEwnktkLbWTqOiOgSGJZMbuRDQm3b2Pa3mMbMEtR
         1VoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGofGOqQbyhcXhYlOGm5v2QI4WFPBJkaAZAx3fcBMjUXsa07dhIqX77uGcyF8dHG6Pn503hfwNMLSbxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0wFX9Kc+9Rs49HSFZ3jTWIzv1McvS1pSYQhSlJiMY0/fhuSDy
	AHvTs79tzqndpmz6jaUuWEBKsQjxYks6mnzgbpvKn94aJl2BeLOYIRLgi/ZqeGDAN26K/t/0u6Z
	051/hmpI1eFT7tdCqarJU7fCW79NVEEFIuZ3e5Xb+
X-Gm-Gg: AfdE7cnVcA3n4PDxJv2Y9T6K+CwKnktfGcSuN6cBSQOQyM6D+mzlXU6vNfCTKPASmWI
	XaQ8CtVHHWu11iwDVVPt8a1WcR1W9Ij9gwa5pg1HR0S9AvgJbvLuK6nCWCBHgMCf1l6bSaoFS0+
	SpB4CtSrUtw56OmHXnFHtY7FyI8B2B1yZrONY/BZRP0KBGmykgXidInT+2fcT6NBscVsyYMKD3z
	D1H5VaiPPqOISqAXc/lcIIAu7S6Pp1X6Xf3xNHG/Ix1FsdC2dejsObu8kuPQ8fS4BHd9oE=
X-Received: by 2002:a05:690c:b9c:b0:7fe:200f:e7fe with SMTP id
 00721157ae682-81e90143547mr59213837b3.51.1783917726174; Sun, 12 Jul 2026
 21:42:06 -0700 (PDT)
MIME-Version: 1.0
From: Nick Owens <mischief@offblast.org>
Date: Sun, 12 Jul 2026 21:41:55 -0700
X-Gm-Features: AUfX_my7plF80DQlAm7KUa7-UxMRWRMp2xYoMP8zn6y3AiJm4Rp8RWFTbr8Gg6I
Message-ID: <CAH_zEu4i9N=SLfo2rV-FvcaisgjEF4PT4ut11VUdhNFmRRbLQw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: mirror VSTIMECMP into t->next_cycles in sstc path
To: jsun@junsun.net
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, junyan.lin@spacemit.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pjw@kernel.org
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_214208_240727_305B1F68 
X-CRM114-Status: UNSURE (   3.96  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 31 Jul 2026 13:57:57 -0700
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

jun,

i arrived independently at this change, and it fixes openbsd/riscv64
as a kvm guest on my spacemit k3 pico-itx board.

thanks,
nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
