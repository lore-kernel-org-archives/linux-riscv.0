Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C57C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yX5g0ta0RbKdDmEg5+T4ZBnasf6PXcft6TmSQ+yyu/A=; b=G7QS34JPGqbP5M
	Zsd8oFQOCBVX/o/zvc8z+35arlQ83PVLFl0KhFhPG4ChQR6Vk4BhDZkHTYZn5jTSslHz1JymUMXMk
	cD0OfZ9QvDq9/Ei1DiC7pPVUq/5W+ZzSVDOYNUSiwJE+gkFW6wMKyvEaP9fMshhmHSjaV1+0qqKWa
	tViaJWC8O8Tgp0Zj/m2eVt9y3lSvsKGRTtVrF1vn+pl6PBPnW1kR37G1mjvD0OkIFBJ2/ofv0OLfp
	XfcQD9dsUxiNaYWe2jlHxFC4fz6GfuXbIkwELlAnXGbuuZEXfStTxJRF40+Riy+7CKTdiJCZyo+1y
	MuEZYlCGDK5jAICuopGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4zz-00000001Pjj-4Aub;
	Thu, 08 May 2025 17:25:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4zx-00000001PiZ-1chx
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 17:25:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1070896b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 10:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746725127; x=1747329927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OwMv2Dele2i3ePJGKyi8rGIW+sb2B+dfxRjnej0ldTc=;
        b=LYxaNfXE2ljM11/Dzh8wSS5wcJuZFWnbdSLiQ7XAaYo9dMYyuNBT9IGQ6NsZwlI3yX
         ueatyHpFFbedE2/9H50Kl73WLul0ym8y1Yh4Xzyo0WaXJ/ECEwVLn9ej8gmJUyieclz9
         2N6hoWqGo9t6KkFPVXT3oHYUeHFI3cyMTM64fy9v+YcjUQKi5/l2Z++7+1DHTMh492sJ
         RAJsPmxiCExtkS+riRNu4wV+DFFuwNvuVOBACb5Ghp2zWu4dpr9oufTZ0b+6CM/6jGSd
         F3ZSMEFyd06fJl+HmuLGg9xWdJtYqyi2JOKPlkiy4SCHGQeXrjy1i5h/AJtVQdtzho6a
         X5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725127; x=1747329927;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwMv2Dele2i3ePJGKyi8rGIW+sb2B+dfxRjnej0ldTc=;
        b=S/AEhcOiAy+W0041Fl2CupuVjYz+68ABg2culAAW36zL7q6D5lgYpqxx0GqoyZ8ENM
         NisGcivWRiaO2FAqeR1lVw8pBigUqB/3XneOXSXNqEkPH30cP4LlOHO+l7LaqumTQjHw
         wyv+Ep1sm2x5QjxuXU6t37JqA6X+Vfww49KOyrzMF18coFerwVkr0y1puz3L01alrBvX
         Te1jYzQxp7McZw8A2OWa6HBdTqpF2DN56S9Eu7zJOXAoFLySuLNMsk4KUbp42eAoL+cN
         s10GxA0Aq8nCKBnW+Sn6ennQaA46rM7aeRIX2F+BByCQ7M9mWyMVipMRAq58SvccvCAI
         mWzQ==
X-Gm-Message-State: AOJu0Yz61zVRgcMP8zI9vgjJW9dJevOORXX3PqeY3x6FVx3SFnUrCwmN
	SSJiIF5hRt71BkKIjskheEja86NwvBAjp2TinI1xSUKqoHdn8YdjVGnphECbJvI6IedQluBxmKV
	J
X-Gm-Gg: ASbGncvUQnKupcUnzsP97PZvNi4Dmh/oVAohwIIBjKmNqjNJRf/7OVNOcZvjgEn6+uN
	z3ovFFHZWFvmcspUMZFPjj9f6UQqAs620GTo+6rchr7b6SOks0ubHmSYNGYQamYtXT+82CqI+xV
	zdBWOKmmBK4gb/gsPrYIojdqRypEEDmWWVcOk7zTM7YCvWswbZTlQLHTAoE2dw7/9C4EqBuM00j
	t8wcH3zZrSPT8UQp/acSNTRR751wMvI+KHszbmMgWZD8BlEl+lXXSe0mxYXWI7dyvcGHhuS+ozH
	Yh3aWS7KnGraaqLGyCScUUenrspJ3m1H0A==
X-Google-Smtp-Source: AGHT+IGE1jr1cArVsOywq6oEXaZ2Cw/DnjYbfnUUE+RwC9LrkJywUOyn7z+1gMN5Bf5Sw1Y6TcawTw==
X-Received: by 2002:a05:6a21:9002:b0:1f5:7873:3041 with SMTP id adf61e73a8af0-2148bc0fccamr13339943637.18.1746725127508;
        Thu, 08 May 2025 10:25:27 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2350ddb4f3sm83165a12.56.2025.05.08.10.25.26
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:25:26 -0700 (PDT)
Date: Thu, 08 May 2025 10:25:26 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:25:21 PDT (-0700)
Subject: Merging plan for SBIv3-dependent patches
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-4c05b8a8-03ab-4e68-ae73-ed405f196e7c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_102529_620437_9E03C9B7 
X-CRM114-Status: GOOD (  13.05  )
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

We've talked about this a few times in the patchwork meeting, but I 
figured I'd write up an email as this is a bit of a wacky process.  

There's a bunch of patch sets blocked on the SBIv3 freeze.  That's been 
coming soon for a while now, but it seems like now it's actually really 
coming soon.  So I'm going to start staging those onto a "sbiv3" branch, 
as there's some cross-set dependencies and probably some merge conflicts 
that will need to get sorted out.

I'm going to plan on doing a staging merge of that branch onto the tip  
of for-next, so it can get some time on the testers.  That'll be a 
little different than how we usually handle for-next, but I think it's 
the best way to go as it'll make dropping the patches easy in case the 
specs don't get frozen in time.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
