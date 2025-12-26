Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7BDE7AD7E
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 03:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdf6fWnIVWkhOAnkz3Dwh29FsA66z8rD78qmQI4j0Vc=; b=zpjjU14XuEaPvj
	1tAbF2f3XLyZXLZ/aq8MILz+57SE8r7vBNZPsYiFF0TL7J9HnUNXie34K14xkIb3rFOLcAmyA2S3+
	RvZhlozRbDVrLZCS1t9GV6yc9IA01uoVMn58aEvMn+TVkTGfcK4m/GVtwp7adLDxNjlxwNXvitkiw
	uFt9nYxiUl6sDPmCDhATU9PjycUV4JrCIsgwMtqqG/zvkMEKJb9gLg29dvf+0v3AMDkTSPq7HGPqV
	gWe4kowUJNCVLWWHte0LTX43R+nIgddcBgeoUE0Xzxk1P994e5lghyHfV0pXFqkk8cfPpx/iIDuZO
	8joFUdhEsNH4C7dPbqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyY3-00000000rjC-44OO;
	Fri, 26 Dec 2025 03:31:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyY1-00000000rit-0ApL
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 03:31:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0d6f647e2so111772535ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 19:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766719884; x=1767324684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ljrm7quFnjMy54/Pt9XBIqU31VKgbwYSBMG+BN2K7MI=;
        b=mTiBeWn4OaB3adssDAB5MYQEF3f5qJ4gJNJr3Ocn3RZN+8snIUtVv3srp3n7T8CcpD
         mEZQqov73Gm5A4vlvGLWFZ1C8QTH8sOMvXbI6VKotWvx14ysfmk+VEvPZg6JPvly5LEt
         I+Q1MZoihiA8QxS0TO39YXRyxvN4nwOmShGe1ef5PEQTnter8vlJjnKOL8ZgbxK+TzLO
         GrQxLEGpq7O5g1Q2+dZXy+hQN4ngG9hfLjTduxvn6jhnVHOmls/DV6Z/Ehw7PMqFTr6o
         3khWS0g8ByZAszsHcz8e5y6DIjmJpuRlJXh9QiRhsPsCr4bqjPnsB/Gdz9c+w2jRQzyO
         FS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766719884; x=1767324684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ljrm7quFnjMy54/Pt9XBIqU31VKgbwYSBMG+BN2K7MI=;
        b=Nx/F2NQYJHbf87UWj6D7qge0YnrgamZHUGR78hbAxnAx3uWF/i5VgxEsUaqSAOIGda
         MlzfdZ2NjS9DgzxWylWnEpvdUhfLF9HapKdO7CLToWqL9+LWVqRFU6e2GR9VW7VPPObN
         wICc/m3I870ZpHuctk9a/eVe/1gq8jvq6+YsFNI0o80ZNmidtgpeOYFNaG5VoFlV15bK
         GiaPFQ+sTZ1G9NJ3lnI8wo6IJnYEKeAL64CPiYaxQWNUwsxFv/lzcfXj4URIOLARmh42
         UEs0bygu+KbLVqMKw2IqpkwFvopSgPUPcfRlCokUjiPmeZgTk5eZl4jGOCNjip0AXRH9
         KItQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi0XLIJYwxuru8bnW5FAtgwTo3UbWQhEoLrEp8s6dPIxY2oGPSknmMfDUDSq/6kI3pyGY4m0aV3TVkYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyksrFv8oAPyxKYzRKKpwXk48JtT1y3hrT6+elRLUxVCu93mkfN
	whFxXQT0VcYY8oghK4Q+o6Tn0BFuy0JyWQQfiufm0cGcMiY+RRGsj9cT
X-Gm-Gg: AY/fxX5ptQNg48D0yJBhrmFCNygWTNKIIq6dzbDa7E2dBTb3wI4Ly91La2AJDGepsen
	kbK5W85K0zPfKbVH27x7JxhaJ3ZFU+Mj98gZ8+pl4dY368QBEjVR1md5DxxgPJAid59q3qu1ONs
	Z2Eu+AoMSXjMYp31a0Mc8my4Om82tE8zSsDG/CZmGhw1yhw6qPsnA9nwAF/Biaqn+i0L8BulXWM
	Kb4xcJnasCUmlmhJmCx4CZBbm9E2qcwrYJfDeQUzwNj77ybPSSubUh+YyNDFupkJVSNmAUx2P9Z
	bpCErYe0RbVhSAaCjzAr4eOy8VeSqE/DXW5aSRclb0Q5yYtqttSA/8TvwPOMllHk8i0dLzPgV9w
	zNGvQj+Kv9Rwh2bS34D/XlMJS8+O2iFI3Qm/M+vqFJeTUQlA6djEMkVMYYHHzZExDk8ZJ0Irqx0
	H/pGUXdA==
X-Google-Smtp-Source: AGHT+IEsWuTTwcDert2et1eGbmI+azWdFMlAfpYldjsNTfapmRbLtz5IkDDd9aYbRthA17abbkgkHw==
X-Received: by 2002:a17:902:e747:b0:2a0:b02b:2114 with SMTP id d9443c01a7336-2a2f220697cmr217826285ad.11.1766719883950;
        Thu, 25 Dec 2025 19:31:23 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7727356dsm11014982a91.4.2025.12.25.19.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 19:31:23 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <jiakaiPeanut@gmail.com>
To: pjw@kernel.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	namcao@linutronix.de,
	nathan@kernel.org,
	palmer@dabbelt.com,
	xujiakai2025@iscas.ac.cn
Subject: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building with Clang
Date: Fri, 26 Dec 2025 03:31:18 +0000
Message-Id: <20251226033118.1527871-1-jiakaiPeanut@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f1ea892e-a07a-5ded-dd6e-3e7ea55fe446@kernel.org>
References: <f1ea892e-a07a-5ded-dd6e-3e7ea55fe446@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_193125_088159_7A71FFE6 
X-CRM114-Status: UNSURE (   6.31  )
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

Hi Paul,

I am very sorry for the delayed response. Due to an issue with my email 
client, I did not receive your previous message.

I have just submitted the v2 patch which incorporates the suggestions from 
the LLVM folks. Please review it at your convenience.

Again, I apologize for the delay and any inconvenience this may have caused.

Best regards,
Jiakai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
