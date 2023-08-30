Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A78EC83F18
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQx4bYQjCGSjBIfi/6N9BbfZY7VeQ3jkCCiFXQTl2Po=; b=yRl7ylVeU3bB/7
	y8RpdYXgrm0aiTzxTHEk/95bdN9QonMjxd+1m3fak6+Thm6MMUcvLXs8m3ZCf0sZzWUxdPPKrEhNg
	oKKpCrivStIWrR6zy5t93FZo6XohsfoiMZKX9ZsXP90XhL4sxZWQg5YTQeu0Udj97jtRvgFDaMjPC
	vr8Px4/h31EuSybv85VZlAowSM+l2JSWIjRybUEG8u6YmYsN0ObDUje5GnH1vLLasnbhPzOBlaU5b
	bin7D2apJbPx7kMemWFGliZ5HqUjNT50iNBGCNxqSWal4l0yvT+YHwpXjM60rbKQH9oPSDsRpb6kG
	xb3T0mzW8PVCKMSQgTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLBi-00DZDy-2c;
	Wed, 30 Aug 2023 13:24:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLBe-00DZB6-2a
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:24:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc3d94d40fso42180105ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693401885; x=1694006685; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRT8HTnQl0A0AIoP4ZTxLcQAlQfUx0TWGO6B5/BcjqA=;
        b=1HNTg62W0uZmNX4YH4YBzaf3JKLkHpcKllDIfjoNl2ADMRygME89fHG/Iat2BLt3GA
         cffJvHZpd4Zm+7a5WzQtBtxIygTkEwE61Cb04qnlSJCXR0NM8AjqpYgMhp70pCKO3+1f
         6JVrK8PuW8bu2kJ3cQMkmr6VAfin84WvECOX0LQtxwi9dPmcuJsski/TDxXl2cuH8HQS
         KwoVkKX3lK+T13MXCC2xCDyq74IGmwE+/PqYanSfvxdEV0a72fA9fs1rQQMYsjK5O1AA
         Vc/R1gv5BXmWCLhqut6FnxzUl4f9mgJuQ9o8bj6/iQRGVa/il5FIGvQ6rML2CZmAIeJU
         BhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401885; x=1694006685;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRT8HTnQl0A0AIoP4ZTxLcQAlQfUx0TWGO6B5/BcjqA=;
        b=iMyownGGa2CXy/4syuIhQfWj/YVyEybNmNJOzxZp7capi1Rqn7YJJgIRyPyt6TFhMP
         +LU69827rPF4WmtQxf3kzOaxlbcOCsosyIy3HwlQmG9lRJySNQyIS2NCZvADp7+lxkUK
         iMM5u9X+I2c9LdfRiJsS8mNTCdC1Qr5BHVRqzbj3LGMzIo3tabfnE27MknjgGe9DHohs
         veG6KVq5yRdknyF4q4oHtjY3vciMpNmREN2QAnKRqGNTCLyWJwiiqxvQEw1KoNa3rrLR
         GJ/RdWoje8grQKfrgcJPTWmzwTyoRoJctpcXHVCLpIxxfuLch4AygSnZveyq76G+bFgl
         R6zA==
X-Gm-Message-State: AOJu0YxfxyD4+Nwr9H6z5r9T8J+kFwXNrAeXPqrh6CA+wLI6AaDtkiDu
	F6LLlJua7eDuWbXV3N78EbnqkA==
X-Google-Smtp-Source: AGHT+IHIIGqJnityI0OPSbmG85fQUYCCUbZlEhqTIhCoa+VaqpTd500dDd/u6VytqECHnak/hR1Q0Q==
X-Received: by 2002:a17:902:c40b:b0:1c0:aa04:dc2f with SMTP id k11-20020a170902c40b00b001c0aa04dc2fmr2709086plk.11.1693401884752;
        Wed, 30 Aug 2023 06:24:44 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902eb4c00b001a95f632340sm11151096pli.46.2023.08.30.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:24:44 -0700 (PDT)
In-Reply-To: <20230711201831.2695097-1-evan@rivosinc.com>
References: <20230711201831.2695097-1-evan@rivosinc.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-Id: <169340187980.2480.1248805004166656896.b4-ty@rivosinc.com>
Date: Wed, 30 Aug 2023 06:24:39 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062446_846395_C55E1B2E 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Tue, 11 Jul 2023 13:18:30 -0700, Evan Green wrote:
> In /proc/cpuinfo, most of the information we show for each processor is
> specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> compatible, and the mmu size. But the ISA string gets filtered through a
> lowest common denominator mask, so that if one CPU is missing an ISA
> extension, no CPUs will show it.
> 
> Now that we track the ISA extensions for each hart, let's report ISA
> extension info accurately per-hart in /proc/cpuinfo. We cannot change
> the "isa:" line, as usermode may be relying on that line to show only
> the common set of extensions supported across all harts. Add a new "hart
> isa" line instead, which reports the true set of extensions for that
> hart. This matches what is returned in riscv_hwprobe() when querying a
> given hart.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
      https://git.kernel.org/palmer/c/3d44f547b677

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
