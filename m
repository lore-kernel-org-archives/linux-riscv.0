Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E289AC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jRxR2KmIvyrFKrqoCDzVOBryKGTXZRG1aNNXB89ouI=; b=WWsHINZdRcRtvS
	RejNXVsna2odOFaK5tH35axlVs7w46O7wBlSzzwGWK72jT3qm7TY1ria2JwytkAjX/TyMOJ67JVOR
	UZp7O5xf4JeVTI4zxgJbmaGUKOnU/1B6wQiQ6YVPRpGo0GWWSqm9AeT/lUd9sfOeBnrfAUulbcjP9
	xj3v4AlhtzAOvE6uqCWhdEJ13TRxLeeA6ZGY+juSSWpkZk4QVdipPaXlwTtnfDMbsIB/sB8uHVfo4
	kqp17QlqOF+QBLQPBeZc3UMTUDwABVnZP0gBbwv/VDhbNEwR6BYpRW3ZfAk4JROayK4AAM8ccg4gy
	JwiRcOTZPgNYOKlxoP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZVX-0000000AvRV-2Big;
	Wed, 27 Mar 2024 20:04:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTT-0000000Au6M-3gDN
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=z3VQJildZHY1Bgj6r2iljFMqpw+vWq4Si7He8vtNBY4=; b=Ts36Ao9EROrrl6pPwKzSBul7lL
	uAbI+fnMajzfbFdmEiQEEZ6X7QEcC8a5n+rUUTLj6s6UWUOcft/uo8uytYqGlyMdQa7LM6EnfVa8C
	hKQXvb3bhaQYPLmuwM3j6N6QwKUfxZyG/6D+q+Jnew2eQtqiCUbDd1ZUuR23izRz235xsn3Rzh4v7
	uXQVaRjZKCaEAooT9x5Fl0172FIChAaNWdqVQxxY/AG8Tik1BXZlyg/ofwpm4b86B5wmQ78RTUyDv
	x+NhDOfYkRHf9q8E1ShFs1CNmE7J952TEcMV5XLnMEC3ur8np56guRahjz8jHSOXQehe7qJFsHXOg
	40V4T24w==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTK-00000000WpK-3ENM
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e0bec01232so2082605ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569723; x=1712174523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3VQJildZHY1Bgj6r2iljFMqpw+vWq4Si7He8vtNBY4=;
        b=WtqlXhY+aANfKdDFFyPAM2QEpD7XPx0u57Kn9T0frI9j5UM2Ym6VL1u1tH12r96ISj
         Hi4xyJRWvbCmd6A5McU9u6WILVzhPegh9m2J9MfAuLkuxguAn74U03VRor5P5bgbTOPX
         rZkAAQTWYB/bTedmPmmEmD+PoCvDSUX4ZFkvwampo0P+AQ0WzPHjzrRxTYvKBDs17aq5
         doMFQs3M7IZivGxSIAITB8hQoPAt3hTAWqKT3u4OQZNKUNV4HSSnWxlowBjAL5mjww5m
         eBaSP22Qh9xryZ/e8Ex/HsXTlJa298aLS/4tBtXqZvVisuAL+8QNGJJajgb/8tSEhTKk
         NY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569723; x=1712174523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3VQJildZHY1Bgj6r2iljFMqpw+vWq4Si7He8vtNBY4=;
        b=Eak7KvbXRpOChtaleHv7wykaU/tl7RW0gx3iSFwAD+DnwSz0DN2MlK9GEAdqShnggo
         QJcH79mJ15CTJ+CnE7zP0q8qUF58+6EsNMQou/I3+Va1MQ+jFrzUppou1RCwtWyNuUsE
         2pP+PWZpdHcMCRY1HOX1m1Gwn9S6wNFJgi5VrtlDTEkCxh1oUvb/mL4T3mO/L4gs6BYr
         xAyBns8pd5CFPD/5NAi0KgQcEtu+6kcxsIHy8eEvuN8GOwruWOR4iLDsxLCcBs1ghC3q
         6ZJOlvQpyvNPfCrLLWdmHVbqjr3Xw1oMdgOtNFOSEZzHj5jrBjPYUPmpXo+AuNDs1Woo
         PsHw==
X-Forwarded-Encrypted: i=1; AJvYcCUH26OBJ0NyQvb0ShSSeg0AJc6QCH/zOTucqEpIzxUcCOz23QDh8oSFqH+3bcjNRmXw6TBEb1uiF1AKUlHnppMPP8P8eoR/ssQh5x1gRiwB
X-Gm-Message-State: AOJu0YwWAyNmmuk1fXnoRzKgdor2QjF6RTsRpH0MdRUixw1XtUO8CfNh
	qjbBf9cgxkpEX+LKv1JIoCmXupLvh2ivm3yIqRSZP556V31MljgtOoCNMNg8qP8=
X-Google-Smtp-Source: AGHT+IHYrCNFuZi7JM5PzLehk0tocOhYuLDObxCk9XIqMJvg9sySawc5MBuX1NvDT7qWP/3i+9Szlw==
X-Received: by 2002:a17:902:cece:b0:1dd:c7ea:81f3 with SMTP id d14-20020a170902cece00b001ddc7ea81f3mr964085plg.1.1711569722972;
        Wed, 27 Mar 2024 13:02:02 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:02 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 03/14] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:34 -0700
Message-ID: <20240327200157.1097089-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200207_217794_43983667 
X-CRM114-Status: GOOD (  11.07  )
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/arm/lib/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 650404be6768..0ca5aae1bcc3 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -40,8 +40,7 @@ $(obj)/csumpartialcopy.o:	$(obj)/csumpartialcopygeneric.S
 $(obj)/csumpartialcopyuser.o:	$(obj)/csumpartialcopygeneric.S
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-  NEON_FLAGS			:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-  CFLAGS_xor-neon.o		+= $(NEON_FLAGS)
+  CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
   obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
 endif
 
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
