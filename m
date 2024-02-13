Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8457C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 22:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UbzJWdwuoJuOKmqnGbEb/w8yiHNv0La0x3V6jXo+rtc=; b=FMzG/vrf7H8muNTmpmYpy0Nnvo
	l+YY3rW+RVeizgbzNFRiWRLqnAiAkTUZO5Y+IYRYwHhPpT7KtSFAdo4groE/ng4/BtFj/eAT8C+sl
	TCt5KbU7qDQxV7ZfF2c6eUpD9hghlOcB0M7raqMntmJUy8aVBePQCPW1L9e6tq4RXktdI8NViHEnN
	jxkldgNIfydnwa+egYoNGU4V9i4nGNOfVx4BYiy28k36OCVZHw2vL9y3Q98SSPrKmTd8oNaxjz9XD
	0nBJoxDi/G9Sz9Cq//e54R3prTLoMnpDQLZujs6GXiyobHHsU7rNciOLMJXQn0/RaUyX4ALhdkAd+
	jAM1UXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1Up-0000000B7KI-0CGZ;
	Tue, 13 Feb 2024 22:43:23 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1Um-0000000B7Jv-2mof
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 22:43:22 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-604b44e1dc9so70703137b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 14:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707864199; x=1708468999; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHJiifufVzDkMZAoUjH+SKnrhFUND46ohEe45AXq8HI=;
        b=n00NYvn/CeMSGPWekja8Llliq4iXXOHwTy5pdMoER0eOiDgSHMyW92Eipw9uvikvbW
         260fp7bfpzML4aOY0xMhMIOpg+u6g/502Te6E2H7BYxXK+nhKmBlnYEaVHkjazlycSqy
         5byPDAZOF9WdFht2+naBUbTuHDn3sr5Mg0N6sZ6flo8PG2+egZ8GzmXuHsykHXOY0Hcf
         H24ROuUx9CdvnS9TmNQNxZ3CneW0Um3ds0VLTPMM2uCuqS05ZQzAyNY6ZyaLcpawmF/D
         AIdToAUuLQNh2+RQDJL3FKBB5uXA945NgNWT8qFFgz/aRDgT3H5XWFLSh+BEavS+1jOe
         jDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707864199; x=1708468999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHJiifufVzDkMZAoUjH+SKnrhFUND46ohEe45AXq8HI=;
        b=jxe9CMiha316CJTS2+lmPc9mGCiKETcfbkimUxkOgl2jTL9/+Yo8NbR7I3AxhkxMsU
         TAPzG1T4HEjDJ+eCirznLIc+vzNpDT/1T0MdIj97BP+qWWJXDBtUjSk2IFkKhbq/4SXO
         aqCGL5eRNitSMxALfNk6ZmD4DHnkR0MPX4exPruegPmsXhTg1g8UFnICk4Vj9ANCNn0p
         UB8uXj15w/8d2eGTlHu16qz6/OC01kAIRt7R/2CkxetxTr0HSbSj/Jb02SSoRzeSadt8
         Xyg9KDW8jKhz6h/A9g9/NLMZ8Lxmfqynde+g/xLSBkGQ22fEGmDittjrFCjxRdd3kgDe
         3e7w==
X-Forwarded-Encrypted: i=1; AJvYcCUnGSFgwRpbtV2994jUHTrwsMyWOSz3Xn3y3cv7ekdHNd/RiI5F0MqFXvKd0mwW22Aax5gZn+539wiK8nZg9jW7Ht6nMMzies7x1H+GxJNd
X-Gm-Message-State: AOJu0Yw3ed7SGQvE5Vj+NKgsDvr5195bfFb8NGI/XhLJVWOn1BSiTB1G
	kjFkwAcmdSU8BSWaq0aQNSjVBO8Pdjk14hC4NoEOl+EWwXhpybsf/eOr6i9B3ea/iQllpGP7c0F
	DtpUDmpjZN88GX6kA5g==
X-Google-Smtp-Source: AGHT+IGy7Og0OsIVjKDJo37wYxV4WnvwVhbxROaRt5+vFuGWYAQMwlYj2CtildNGUmlCAlu1PHbcWHRYYQGE1wjI
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1243:b0:dbe:30cd:8fcb with
 SMTP id t3-20020a056902124300b00dbe30cd8fcbmr17019ybu.0.1707864199209; Tue,
 13 Feb 2024 14:43:19 -0800 (PST)
Date: Tue, 13 Feb 2024 22:43:07 +0000
In-Reply-To: <2d4d939d-4b49-44d7-8405-e075de844884@sifive.com>
Mime-Version: 1.0
References: <2d4d939d-4b49-44d7-8405-e075de844884@sifive.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213224308.2598732-1-ericchancf@google.com>
Subject: Re: [PATCH v4 3/4] riscv/barrier: Consolidate fence definitions
From: Eric Chan <ericchancf@google.com>
To: samuel.holland@sifive.com
Cc: aou@eecs.berkeley.edu, ericchancf@google.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_144320_727179_0B0DDD2B 
X-CRM114-Status: UNSURE (   5.41  )
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

Hi Samuel,

  Thanks for pointing out the negligence, I think we should keep the optimization.
  I've updated patch v5 at [0].
  Thank for the reviewing and suggestions.

[0] [https://lore.kernel.org/lkml/20240213223810.2595804-1-ericchancf@google.com/]

Sincerely,
  Eric Chan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
