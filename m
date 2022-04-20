Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759F4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TWMGZ0eMeAJo2TYUgzbld+vIGXob2h1gv3Ls1NfkDas=; b=zQt0KcAPXjQlDK
	/UtMQWjPACQ+AOhP+JrBO0FE8AvDEHfMGqqqiw6W3AWwc/3WjbG8K2uVHoPuQmds1KiJWThsJz2Ud
	6Sk781fgCgLhJdYAepMAGkEKEYFLc7tWhJhDF5Mxkj94cEUki0qGoiYOCxEA68MCO9lXKPx0R9rMY
	dXT2gzgT0EnugnyfTrTxU4R38yIqU5ahTTMxKa+F6PIa1kxWycwD1rwev3fRVULb4JnTRLXBoM2sz
	Q4KAVlu4xUB+RPAXFuol55+H+Jh7E3ro9jnMwzCwm5B2WuUT2Dr2gOPxk/8EngxQzFSsX0a7IgTck
	sHbH6ihBFkb4qcOqbG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhFNB-00A6BO-Hs; Wed, 20 Apr 2022 18:48:17 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhFN6-00A67M-GI
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 18:48:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id k29so2417345pgm.12
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=trC3Jlxugt+DSRiVxo9xrs63CVYLuv/9eCn2KJJLdms=;
 b=CzzmjkHZYTeeLA4VQjVJtRzQ2KUxzKMzUAu8XCCnixPad50uf9dqsbi+yBo0RH077z
 Q0ZuID/UQaEVBzRnxtZSHcuHsHISgOvBFEoFD1GhyorPjqrVRkiaIjWDcjHHuba+aMlY
 xPXctABj1/GCQLG6fYutac4EDEoxze5my84ivnf3+Hj6BzcacQJye8OApJH3hzIw7nss
 IBsKWtgNzGrzQIVrUYsogBIXs2ZlNjtz6lbpOr++/7CUdS3ZdUV0Cu1lFhPTRlpdimpz
 ZmoIg7LzhrJEojLWuMU6f9h0NuyZo9fH2kr3Da/ALoRkshDAC0zer4yGYXI2ahKVMpn/
 p5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=trC3Jlxugt+DSRiVxo9xrs63CVYLuv/9eCn2KJJLdms=;
 b=ZazPjoOsehHg6h48i+gtRV2JMeT7ytYL2EDS814NtbvizJ6zsjhwth3bn2QI/m5+OA
 C34Kyvp4ZzZhz404W0JG2NO+vqrliGLhcz7HXLZ8ju9dnYL+x4/bOjzulJ0ZnYxmCpcS
 V+7gCH5W5G//Tx+3D/A6EOFtLjxwHwm1rMXFzhQFANoWM7YPvSlFMfj5sYjFzlBWl7iL
 bBoXbCTcJoIGaV4i0QE6uWOnM49VXMKzBnfSsBmVkm2CBJSaL6CJcbIRrKxmsqWJnLV9
 C1+lDWxSte2C5vWjgGHIY8Qnij5PWnbcSbZTEg5Eb11Im38d3k2eNT6e3BATq1k/JNLs
 E/5Q==
X-Gm-Message-State: AOAM5307RzecmzNXvN5seHTYZyBK2zG33YF1gjakrnIk9ANJbCFLfvji
 okS01Bit4Y2YmD2MZ920LWdGUg==
X-Google-Smtp-Source: ABdhPJxMxDsl+AQjvcOpN1nXpf/ttAsJ1UpUjyGXJaFRKoI8lVKUPxgJEPMoUNRJqp9fNFPEEUaD2A==
X-Received: by 2002:a05:6a00:1489:b0:50a:90d7:e69d with SMTP id
 v9-20020a056a00148900b0050a90d7e69dmr12354299pfu.70.1650480491099; 
 Wed, 20 Apr 2022 11:48:11 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 s89-20020a17090a69e200b001cd5b0dcaa1sm120809pjj.17.2022.04.20.11.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:48:10 -0700 (PDT)
Subject: [PATCH v2 0/4] RISC-V: Various XIP fixes
Date: Wed, 20 Apr 2022 11:40:52 -0700
Message-Id: <20220420184056.7886-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, vincent.chen@sifive.com,
 guoren@kernel.org, 
 Atish Patra <atishp@rivosinc.com>, alexandre.ghiti@canonical.com,
 jszhang@kernel.org, vitaly.wool@konsulko.com, 
 gatecat@ds0.me, wangkefeng.wang@huawei.com, mick@ics.forth.gr,
 panqinglin2020@iscas.ac.cn, 
 rppt@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, rdunlap@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_114812_557320_AF63C6C4 
X-CRM114-Status: UNSURE (   5.59  )
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

I found a handful of XIP-related bit rot when chasing down a
LKP-reported issue.  They're not really related, aside from all being
XIP-related.  I thought I had an XIP build test, I'll make sure to
add/resurrect one when I get back around to these.

Changes since v1 <20220419194846.18318-1-palmer@rivosinc.com>:
* Defines the mapping functions themselves to have no-op bodies, as
  opposed to wrapping their uses.
* 2-4 are new patches.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
