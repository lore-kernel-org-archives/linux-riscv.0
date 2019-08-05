Return-Path: <SRS0=kixk=WB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0171C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 12:13:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33492087B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 12:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="slorZFHs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="D9rI32Di"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B33492087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lO+wbpyEJaxKPLiEHw/52aEm97M5XvS1+j+os5kwC60=; b=slorZFHsWI/bMu
	Am50hiCOPARHTXjC7byHaz7H8zbIGfGxfm9xe7xnqYz8QY/2Gemn6P9Cw6AG1jBw30/AV0iQmoHQg
	pt2HWQvxhMFZWOVQ2ho2+YiZygm4PHF3eNL8tuXlxNkezpG81+wdQPoybdBzoUycH32InZdxw384o
	2iz3Rasw2tWk956ol4irkawA3zZ5NRujVaMmFO1qw22gaQ0Q61b+dxtPLWPI0RHRYTp6E/YGyoiK5
	kDVBadvymV26EFfMYcX3wkHrea6UPg92csVcjVkywHrheYDG5roL4HN5oKIiJ/iXUuPEQxxyvb3aP
	JAN5Kxav7JnEJrBZKaoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubrz-0001sJ-MG; Mon, 05 Aug 2019 12:13:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubrx-0001rV-KZ
 for linux-riscv@lists.infradead.org; Mon, 05 Aug 2019 12:13:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id h19so6549627wme.0
 for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2019 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0wxhgVqa1i5HebLBuhj43emhxcpL4j6myhHfva4riI0=;
 b=D9rI32DitY/CLc62d2LYXuif0Sbwy/BVZgEu6va3gBgeD8+1ddHIfdW7ic1Zh2gEhq
 W44Qc3nNnlpInYGMKMRkxAcobDCOl3hPWqCvlhgC7zWJKahoO7xyygJx7raDpU3RdEHL
 9vMB9ahaW6qDtb29DKRiWz5r+OL6qvF+gUoOahe7ndwA6mWCAzaAuzjivLCFSWILYRVF
 jvGOFLNavph0BxW02G76lSInbZ60CNfUihG89FP99cZxyY2eZNJ8132Qz2EzW3pgj9Mj
 esX4XUebXFy3HmJ4zOxgr5B5FJn+vD5Vv9WbihVVGNAGfERb5klJIdJL86Tfaz2mIzne
 Xwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0wxhgVqa1i5HebLBuhj43emhxcpL4j6myhHfva4riI0=;
 b=eimPs7zAkuuOsmW9JhIL6Mr3A9xue3UZs9FY7IsAU0LqvAMG9kd/mn6y4UPja90TT6
 6L7GnOhFb/l2XA9JsQl0rVfT3C2d7QkSXbPAVn6Ao//s4Fa7ZLE+KDdw2F+bb1+qX9zD
 8NKdnCrDAPebDEyKk41QdXukn7kLZqczzvJcXmFc3D8qrJxpnwDoMs/5c4CEeG94pcy7
 XkaYRPGr2OJa2gRc5QTSvYH1XopR7CohAkncysTag5jcKJOKylUA9h1SzrUdu5qbqjxM
 GYSp6mNgMOh4dl6YiFN6ofy9BYpT5eXwBz9W2PAOqcfc0pQVDNu96F3IMhbvkimVW2Pp
 ZkOA==
X-Gm-Message-State: APjAAAV2NkDcbNqFqlb66i+l17kGewmwP3b2BCCH8H16PjOxwMclJdyW
 ciN+I4yUTpnU21Jejk53HEbvNGINb+smSNAk1gs=
X-Google-Smtp-Source: APXvYqzTS/w3xceeGnXPkz2ziZ/qExTBJtgjboccYQd7cdW0Ah42GE9a/wIpMA5BQWIqpCVbIOmkP50fin5L4WuSmpo=
X-Received: by 2002:a05:600c:254b:: with SMTP id
 e11mr17300244wma.171.1565007219377; 
 Mon, 05 Aug 2019 05:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190802074620.115029-1-anup.patel@wdc.com>
 <20190802074620.115029-8-anup.patel@wdc.com>
 <edbed85f-f7ad-a240-1bef-75729b527a69@de.ibm.com>
 <CAAhSdy2PDSpTy1JEEC2LCB4ESvZHBbkVEZ2wqz-D2b7SKD5VSg@mail.gmail.com>
 <09417197-36e8-718f-f106-29466ef406e3@redhat.com>
In-Reply-To: <09417197-36e8-718f-f106-29466ef406e3@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Aug 2019 17:43:27 +0530
Message-ID: <CAAhSdy1tfL6uLeXANzuZLidg9E-YTUfDQU7zxhBz1_AH+BvZaA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/19] RISC-V: KVM: Implement
 KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
To: Paolo Bonzini <pbonzini@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_051341_678278_AA3BC46E 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 5, 2019 at 5:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 05/08/19 13:56, Anup Patel wrote:
> > We will certainly explore sync_regs interface. Reducing exits to user-space
> > will definitely help.
>
> sync_regs does not reduce exits to userspace, it reduces ioctls from
> userspace but there is a real benefit only if userspace actually makes
> many syscalls for each vmexit.

Thanks, got it.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
