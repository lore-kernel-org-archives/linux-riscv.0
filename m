Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F5C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=peAnx5P16YNWQq87tTJjhIUXE3Yfw5iQGm9NjR0lcNc=; b=TqjH91NYWwlRZg
	BcrHWNtpnu4QJZF+n02c8qzY84XLROENbMlmF9RQr6CbX5IqE4u8B7V//7TVhX2kFEQEYlMDQsRV8
	oQ8RVmN6xjm+lxtvNZ+SOOIolRXlCeXFWUNF9/Gv90vWtV343v286+R2WDYuwmRS07Be6l2acBNfO
	6QcpU8iDetrtf2YQxF9EnHejKZSqSJST10R8Su/dyYcSNqFE+8Zrhy8MHumzeUcMYa28ttQ4QX8Cg
	X7V9Y94SJ+PgTEwS2W+DC0WjHwftP2S5eyR9pGPgu4vlnguwq7tgMEmpgJ6RWgGAZ1Ok06zwx6djS
	SNfZ8qVKvQXE794W65rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpCx-00000004sRb-0TMF;
	Wed, 05 Feb 2025 23:53:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpCv-00000004sQU-08dI
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 23:53:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21c2f1b610dso9119045ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 15:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738799604; x=1739404404; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=7fcnWCLdi68j0NdoAQPtpy9pWPaidwfnIE+oZa6u3uI=;
        b=y0VCR59KX8sAWrz4aG8DVdY+8j8Me7CPcyzc/0YRyXzdu+7XVj+lpjCb+xULIPIRA2
         yBw0B6jGk43VBh5YnhQm2sNWbDL3jlllKzbSTSnNyO0JC2v4jNZF+PS4cj2aFdojAm2I
         AXf6d3U5u9Lcf5Ssxu3T2U8jc5geI+Pbzi/omzrLAIOxyFJCDP3uhQOI1oGvUFw2Sl4o
         K9oVNsyTVPu5+iQzotzAuFYZdDHoSFemGp5ESIk7jvqH7z4MKIl7M6QjxdM77Mps5nWG
         2X9TPDTQMkv4yFWPyc3/85GZHlbMyE9EcAdJn5lLVaNvb4s5s2tef+HeS7R29rdv04rb
         on9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799604; x=1739404404;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fcnWCLdi68j0NdoAQPtpy9pWPaidwfnIE+oZa6u3uI=;
        b=uEy3ZKfAeA6ioXNvWMTHoa5kKdGzEFv4+ixxWwwh3LQVdu8zq+vIJVrYdvIdEr0/Cp
         J9OX4iB2tOe2HeQVOVM6qmzhAnvij5TMlzn6SnjS9f/xK7nJYuCINgyMTsxHsPvwn8o8
         MF5/HA8Fa5k6nLpygZrkfFQOZ7Fs32l1woPZTuScrogwczumbr/s7vIBjN3k1bd1Zb9a
         F/UTk5iFOh4yPWmCd/VqypAEwjc6T6Mb19uSdhFBgdItF+kIuMn4q7Xc2TXau0oU331H
         unuBsx1r77Uvy+92C3HeRvvgRvC8UUn7Zo3smMQdwgUYUsMcv753G9jrWIWCQ+i6g6BU
         71UA==
X-Gm-Message-State: AOJu0YzNe1a8vR7BrV00lbrFQWIDlKxr+LjRCr26HOmNWElH0nEbFjZy
	SA+1I5tHMOp8Wr8cWH1AoHOmqlFkGH2In62ecP4yLmzk9tXENVOIiDDRo3gc/8U=
X-Gm-Gg: ASbGncsvObVCg14Kx6i1chrYw2FZtVH7iVLD7wdUimsKqT88wIzD7ywhaTwHmuK5s8c
	ttsl8Q/A2gqpexWIdgYk4t+sQJlyJfFw//IkX7vgIanT4blshWZcZtal4/JqbbR4IgJxAbhj7c/
	HveRWI4bwH656UKguWXMMzrexmze0EP+kk7B4U5ChDb0xDdR9I/O0CBYUl4njZ45CBK/nHUw1PP
	8e8pnOv1FL0WNHuIZz0LiQuJpLQC8sYEG2Net1bgZNc6fw3bh4KHiHh6XOpJGIdviqlV8z3SeJw
	MKo1Sgv0YySB7g==
X-Google-Smtp-Source: AGHT+IEFQeAOabHYACa6GMq4Ma0joYt9fgiiacbiatqd0jZYv9xeehQSZFeFne7s2XFm2jo3y/2/Rg==
X-Received: by 2002:a17:903:2406:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-21f17dde254mr77688725ad.8.1738799603854;
        Wed, 05 Feb 2025 15:53:23 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3320256sm120575885ad.244.2025.02.05.15.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 15:53:23 -0800 (PST)
Subject: [PATCH v2 0/2] RISC-V: Use BIT_ULL(x) instead of 1ULL << x
Date: Wed,  5 Feb 2025 12:40:25 -0800
Message-ID: <20250205204129.10639-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: alex@ghiti.fr, Charlie Jenkins <charlie@rivosinc.com>, Mr.Bossman075@gmail.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_155325_219322_A4F7ABCC 
X-CRM114-Status: UNSURE (   5.69  )
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

This was way back in the patch queue and had some feedback.  I needed to
re-spin it to pick up the first patch anyway, so I figured I'd just do
the rest too.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
