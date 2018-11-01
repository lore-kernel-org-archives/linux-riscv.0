Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0171C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 16:11:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AB732081B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 16:11:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="beRKL5kD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WXWEoFIk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AB732081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Message-Id:Date:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+g4SOPw7LJ6BuPmFdiKOnz340ni9+lhGXlNxqA/9ds=; b=beRKL5kDAR0Tsw
	RBrx4nYPjrQeKRR03gUUqoOfXP9QwOBy0RNFmSKjQGkMF4RVtvxkfSMYJVXNkbJDwWRn0DNqXXgi3
	Cf1BFJLbdWMBKqihHkEPC8/xK2JZrfbdklPKmoQGhiM/bYhJCKm6j3IdIp99slENPPttt1NAWooNx
	DvQ7xZFCxM3C6vR4Ql8wkFJ1XNyIYju7QRgc6Jn7PKSzLrVmxTKepys7H2RGBMnEAB4NcOniRG0I/
	esqXMb1jEioRcuVzZYQ1wvojyR9+whUvgMS3e9oxMdi5XIw42MGaTYbmnnEk6+d7l+jVrBfIHX1MS
	pTJDKJ7PUR+KMb7/hQTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIFZ1-00023F-AF; Thu, 01 Nov 2018 16:11:19 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIFYy-00021z-6G
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 16:11:17 +0000
Received: by mail-pf1-x435.google.com with SMTP id h4-v6so9549750pfi.10
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:from:to;
 bh=oWrFOgEh9eqgWyKgTgI9lC/V+IkUGh9sKP0cKoTi8vc=;
 b=WXWEoFIkDIaHiCZZa7TbjXodI82vIhkCsGta+aqgE/LFvHGnpK0A8WtS0FWqGFsM79
 ZwLDFDDtIr69JkqF3bP8Hh9+snpwibXQnBYZGuBF/R4J+k3XyUpwfLx5khpJawvNHayT
 cv7rnpXKLr0IGpUuafuaQ72MAsrbw8h9sQxVKQNN1GhKisCZPpinFpPXt9OegOt1eKpA
 maGfMvnC6YcXyzxCqeo0Di/8LbCPEdZuPdzVf98Kvf15mz6z1JrOFhk71xJAdGds8pUg
 oWz1HW6qbJpGfxuNbfjOu9o1tymQm34d4rB/OfaX0iz9QdNJFns2esN+VoY3n7guLWrA
 MSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:from:to;
 bh=oWrFOgEh9eqgWyKgTgI9lC/V+IkUGh9sKP0cKoTi8vc=;
 b=QRHuTi82xMVsjAKlZ7r67G8OeVRwj5QmtVhGWZq31ujFmfL5kbL6g8OTUCTS3g9zon
 pceAw5FLgGJyHkqFfsxO6uXn2+o8/43ANB8vGFXsik7uPb06N+uaLQ3CV9foALkwqiPS
 KBzf13IoGkRiqRmd2jlCmwM3a0cK+QUGUqPXJYESOQmB9fVAhPe3fXwVKwanEdH0Vza7
 iYyYOyESa3C9v9QS2e/lejTy1GbMVAS8KGtTJGkMMvET33FVYbwAzI06ghu8PN+zFIvf
 /3yEZiKMDYLEffH5z0QdVAdO9asH3ODVEzfTZG35VSZGtooZrbO68LCiRRt7C2QvhYwQ
 ds2A==
X-Gm-Message-State: AGRZ1gLgrqm4qQrGifesvzKZWD/rY4RoR8KwdIOn7WQD9Roupxdoiuxo
 5YBuzS2UNqb49TUlZ0CsKnxL+TO3DZQ=
X-Google-Smtp-Source: AJdET5cS+gl89gof7psBASpxNRnxWV2iugRhq/bwjBM2wAu652eM1f1CHbqBUYuH8rV10i97ayBj/w==
X-Received: by 2002:a63:fc22:: with SMTP id
 j34-v6mr7840757pgi.434.1541088664526; 
 Thu, 01 Nov 2018 09:11:04 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q123-v6sm87906930pfq.169.2018.11.01.09.11.02
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Nov 2018 09:11:03 -0700 (PDT)
Subject: [PATCH] RISC-V: Regenerate defconfig
Date: Thu,  1 Nov 2018 09:10:40 -0700
Message-Id: <20181101161041.3250-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_091116_256915_E9EDDB8C 
X-CRM114-Status: UNSURE (   4.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101161040.hv2NJEgFu9dAiaud_n541t1-BZVgjT5er2mLlv_i3K8@z>

I intend to break my own rules here and submit this as part of the merge
window.  Unless there are any objections, I'll send out a PR tonight.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
