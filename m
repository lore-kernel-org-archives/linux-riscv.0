Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B6AC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3O7IDP+IPba3SbEZEQDGrGxrNEnCpBjfOK6PdSXzXPE=; b=kDM6gHAFwtlc878KnTIasm8z5g
	BsKYrg20TLO1ViL94rgqjpKsZpOz3QknQr5sJmDSwna2H4PBlDqj/u+9tVDb/Dw0t3qKIsj67lnF6
	AvdBF+AJ9LnR8loqDRBaiiPHIHHAtCimkYEZPCTq4L8KVPKTffqC9E/5mLbtt0/K3FZpqoe4GebxP
	hsZCD7crpPpsnPZWCnK4BMoenU0fjdkMVTnGmYgAPzLNgnpBOlgOMJP91/bk8CMMeARrzQUA19Sog
	BKv3gJ/ImGWthMjl9DPFxkxFgewemFROtBOVtiCC+08WDkugc75R7nG+aBGX8HGquaKejCm7Ism8H
	x7gUW/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZzPf-0000000AcLF-0bbw;
	Tue, 13 Feb 2024 20:29:55 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZzPc-0000000AcKV-1EJ0
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 20:29:53 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-60799671960so14400977b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 12:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707856191; x=1708460991; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/4WgCQSUw1TXLBEg/cdyp6BGe+F8+Dx7OhLtWDh8xI=;
        b=4TD2r1LyPhNeVlhObAYujB2t/teYuFUNsNI0r7XoFOoPVcB25wlWKJCgCqX5HLzf0g
         DH3ukUTbNu9VciwFD60FbCQUbqUHX+zj7aTaWbNAKSPdB9J153bk0orUCQtwOCmJbCiM
         lIOOlagvFqukADwRpcmHdDZZDA74HbYVG6/DzYhyFk/bbKrm6nOdssIYUXMtbn2Ds+o3
         H5GBo6IUjlEbaSAD27EfZWhbz8/OEypQaT6VzUSTeq2SZzU2vm6j0EK7MdhGL9qj1MzK
         3Vnf4dsvWHunnmKVuK4Idx/POYarP7SVklyM0FikJ03AUbL7RSDriiyeztod6O4pKS7D
         /1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707856191; x=1708460991;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/4WgCQSUw1TXLBEg/cdyp6BGe+F8+Dx7OhLtWDh8xI=;
        b=GtIhfVaeFPDLjDNWhBizfNPYN9PYhE2Qk9dk1957inSWh3Imq39YV5e455q9Nu4dTz
         mM7im2iAMve+vmaAfsmjtZ6PgC9EpV2WLFwrkwaWuM7v7cbGA2eGiUET9+VwvbhHDxIo
         /l3H2VVvFJ+QdGqkuf7UjO+Tmm2fgUxRf4Q3WIgsB63RTJUuXINLr22MIXrcZWEmlQic
         DAFI+/jAA01nYwYHNvhAnlKwUjSMZ9X40F5aTjk7QRoTkoXy/aA+mqDUrNGs8D6/tAE/
         PUf5bR0ECZDD2LIZI4DH0EH7EzEHAW18l0dAdAeG+levnylY3hICi+itX5Yfqr+9vAsT
         AMBg==
X-Forwarded-Encrypted: i=1; AJvYcCXtKkUsfqIHkRFIv/kv7x7pmvm7dtnSqsYGOuR6/t5NdbFeXIRIG4ZIGPlO/CTx+yATNTHheEOXKiZBwrBgz4zUVnmE7koDgEDXKV2lqZAi
X-Gm-Message-State: AOJu0Yx2i7FFvB8WMI+guQjAcklipXG9tLU2UnxQipwXebvF0/CYTrVF
	b5gEKnaE1fbqap9vD9F+oa3OHI3MAnrrf1PvI53cAtVQZqXkQhcn0eM7dsACzQf9kApwbCZHok0
	ngxesioopJmOaqhf29Q==
X-Google-Smtp-Source: AGHT+IFUpetQu6KwC00uaQK/HUEiM8lKKNaIEqPcnbDpHfhpKTjtjwUKHH+Y9Xx3e3TlJKreq9z0ndGHYLkZpwPZ
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a81:5254:0:b0:607:87cd:a94d with SMTP
 id g81-20020a815254000000b0060787cda94dmr96969ywb.5.1707856190871; Tue, 13
 Feb 2024 12:29:50 -0800 (PST)
Date: Tue, 13 Feb 2024 20:29:45 +0000
In-Reply-To: <CAJM55Z9MOoZ3A=h4uFaO2hD461U3BMDyWxXLBt0tUdOuJJ5t+g@mail.gmail.com>
Mime-Version: 1.0
References: <CAJM55Z9MOoZ3A=h4uFaO2hD461U3BMDyWxXLBt0tUdOuJJ5t+g@mail.gmail.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213202945.2554307-1-ericchancf@google.com>
Subject: Re: [PATCH v3 4/4] riscv/barrier: Resolve checkpatch.pl error
From: Eric Chan <ericchancf@google.com>
To: emil.renner.berthing@canonical.com
Cc: aou@eecs.berkeley.edu, ericchancf@google.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_122952_376550_2F6268A8 
X-CRM114-Status: UNSURE (   5.63  )
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

Hi Emil,

  Thank you for reviewing my patch! I appreciate the feedback.
  I've updated patch v4 at [0].
  Please let me know if you have any further questions or suggestions.

[0] [https://lore.kernel.org/lkml/20240213200923.2547570-1-ericchancf@google.com/]

Sincerely,
  Eric Chan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
