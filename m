Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6177CFA44E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2HZu0nKdSJNuNfIK+I9DHxRJbDErsbafvFHwIcmpgOQ=; b=bYYRthRdlCsnzs
	Sr//dUFPBr/bxnXd8RPjfQv8z9OzmS47ZJwJNMN7QmsO1oi9R2Rod9BNpiKaVXxO17++E1K7ySDr+
	60eKELaGSF6omQKUNXbEHG+CrWfvezRQWfZaR7RhoiyDkErCLfY8k0o2m3fPbDXKSpJOtnP7j5gM0
	PQDVT9dPys+okFOkz8V4gmY0do0twuxTNZvc0Zy+n07apKQAlxSIgqjSuKDhIZAUsNl617pBs7ScA
	NGjDQcSBQTM5DTUe1LfJagJOl03wGzAaXnGcmH+5cMxb0RfBJfqxHxJKjFb74Jv1QPRNf9eiRga0r
	D3auBUYCkVn+X7IfZ9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7f-0000000F7sS-3v44;
	Wed, 23 Oct 2024 16:22:11 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4xm-00000004rvK-46En
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 07:49:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e0a5088777so4097158a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 00:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728373737; x=1728978537; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:msip_labels:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bA8/SVYlYdZngnDmGUoO6FHKbaDxUuXbNbeOYz6c8is=;
        b=lSq8sV5go5/KPgLNolK7Ge8JeL2zRmjXuz8pwDeuL8WPXOGrWGhxSuJrtZRemKFg6D
         H0zC9T55geFhxJTT9P6sW6sbfcV9/qpzlI+eYRIiH0RceQPfWbqj3A9gYrYy8Sir77Mb
         FtL4HU3Tthv2eBUjggxF3q9qyAJjhFrRAemnWPtc5uoZFMNTkjVSM3iLIVduyWsO8c04
         2BIU8T6HPOIpshSqioPR9Ourji1/juKoAb8WDhvVYpgbSMItRTbbEkDOPFCMJ8GeaGdd
         BL+09sPOmEg7RuaM27FGlAM1TBTDfBNESwncoUShIpcgpl+Zriy2mbHycw+tch4oZRik
         /bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728373737; x=1728978537;
        h=mime-version:content-transfer-encoding:msip_labels:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bA8/SVYlYdZngnDmGUoO6FHKbaDxUuXbNbeOYz6c8is=;
        b=ZdmD1FpRyyO05IJmdHoK3gq3nleUTpwzFfh9QSU/QBidIUgoj8eOm1zYHIcipqNY2y
         7UecvYBkhyAczIliIsbUE6r9Zz08Fo3tE+GKQRrjeM6ZUxhnDyKGGK/ylIY7DqOmy56M
         pr2Y0QkhgieLT1rzl5PFMyOe9Zoirvux98ESoFDEoJGx8/GzXN22X/n3jRjxbGJ0KGWq
         SpW08SEl1t+AihUPxeiqVXPjyxn15O9v9EgGB4FlNM8aW6CyiqPOgVM6VhTOFDwFzAHf
         1fUp0WATM5Hukeua8HYRrTLC8lmD5xYg6UskmC3GquaipfdUlL5UY9bEdt2HaekYK02e
         uM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVggfpeBOzlMKSUoiHOGdd5tCjlEF/im6llh4dN4nY2MTQ2eCBHMwdQOokizBBEg7r+nEFy7DG/c/lMzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNGeiVy1yS3XMWKQNh+2WPTc8MsABlRL4Sf+HVX501Rds5V9v6
	MTYS9mdvVlrFS55KtY/7haauBul3vYgGrVW+0RHyiI2jSRsJoBU1
X-Google-Smtp-Source: AGHT+IErgU2lhExs25qWrVDEDDHSGx9Xkj/N08LVXzRxU9AH6TiBRcn+BcRRKUGwzhdRig6cMz2MRQ==
X-Received: by 2002:a17:90b:315:b0:2e2:8d33:f7a8 with SMTP id 98e67ed59e1d1-2e28d33f84emr423120a91.7.1728373737424;
        Tue, 08 Oct 2024 00:48:57 -0700 (PDT)
Received: from TYZPR04MB5973.apcprd04.prod.outlook.com ([2603:1046:c09:1962::5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85da3f0sm8511251a91.30.2024.10.08.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:48:57 -0700 (PDT)
From: xiebo bo <xiebohao1234@gmail.com>
To: "tjeznach@rivosinc.com" <tjeznach@rivosinc.com>
Subject: Re: [PATCH v7 0/7] Linux RISC-V IOMMU Support
Thread-Topic: [PATCH v7 0/7] Linux RISC-V IOMMU Support
Thread-Index: AQHbGVZ6glD/G7fCRUu+7C/pNa2TDA==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Tue, 8 Oct 2024 07:48:52 +0000
Message-ID: <TYZPR04MB5973A5633B25CA29FC81AAE1AD7E2@TYZPR04MB5973.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_004859_038604_F52F3ADE 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 23 Oct 2024 09:00:49 -0700
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
Cc: "apatel@ventanamicro.com" <apatel@ventanamicro.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux@rivosinc.com" <linux@rivosinc.com>, "will@kernel.org" <will@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "seb@rivosinc.com" <seb@rivosinc.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "mick@ics.forth.gr" <mick@ics.forth.gr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,
I hope this email finds you well.

I have a question regarding the process of updating page table entries (PTE) in the system. Specifically, if there are ongoing accesses to a PTE that is not yet present in the IOTLB, and the PTE is updated while these accesses are still in progress, there could be a scenario where the system expects to retrieve the old PTE value but instead retrieves the new one, potentially leading to translation errors.

However, I have not seen any memory barriers or lock operations in the code to ensure proper synchronization during PTE updates. Could this cause any issues with the translation process?

Thank you for your time, and I look forward to your insights on this matter.

Best regards
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
