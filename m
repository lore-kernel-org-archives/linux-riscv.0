Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CF2E7735F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vd3uboOBLgR2ItSqapM3S4DJ5DZ83W6nuQB2Ub8NpGc=; b=I9RZUVGLtVcsk2
	Nb79xHvD0CKaENcEA68IIuGhf9ywdOUhb98Jms0Xc7GfnLh4GG2P8bWtoImuiwZFVBTR8pe8U9GDU
	BGk4qTuqCz4GmK8ORcXflmeNcYdjJRXrj4f5dLiK87huXHusFejPMj3P6Hv1DZpVWzLcPeQlFnmm8
	oOhpIoKynzn1FpZA7K5k1gxFW9A6PePP9UpJgG5jaXiE+0WI3/9udjKNve3DF6dGLTBeipp3ypKtx
	E0YJrLkyn+ws+oANjvECB7tgtvwoIERgMnMf96ommLXGgdgoX+HjZUOi9yNa9p+VwBl96oHvDkL2d
	cPbq7c7qFWS2RGlNcypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmWKQ-009F3v-0Y;
	Sat, 30 Sep 2023 09:32:02 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmWKM-009F2r-39
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 09:32:01 +0000
X-QQ-mid: bizesmtp80t1696066296thr4pjsz
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 30 Sep 2023 17:31:33 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: znfcQSa1hKbcYxqfol5fP9hy+d5iapd9bWXb81pkq2JorFRHt2ASdRq962bXO
	Eyl4InpEH2CpYAFUV9l2NYqPU+ovjnAGXlV6VuKPT6l5hIoGbwACL65IFYfcAOI9R5vxSxh
	ZVK2QI8L8KAdq3fCDHpMUKqg5zwNrhJUoqciQm/r0agtEM+FpE3cQOMFpaybcCKzl0E4XwZ
	9z4sDnmlMVDXzTD5KCn1+nfGuufGJHuDtn28ZndGAGAbYBESgzNcHQM4gRGtRIqZuNd1nW1
	fMB4ZZVjW7hiEYljO5IhyEo5/GJCihu7WTCh7i2Ah7wj3qRXX4Mzy/96toY/0Q8o16OgfJV
	7p7T0l6pCJRY2QycXGEvTE4JwG19BRfLV6CaVq6Zbm9SizxlAc=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15485949091047528839
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu
Subject: Re: [PATCH v1 0/7] DCE/DSE: Add Dead Syscalls Elimination support, part1
Date: Sat, 30 Sep 2023 17:31:32 +0800
Message-Id: <20230930093132.2166-1-tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_023159_347148_4DAF1F7C 
X-CRM114-Status: UNSURE (   5.01  )
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

I don't know why linux-kernel@vger.kernel.org reject my email send out by
thunderbird. So here I am resending this mail with git send-email.

Here is a test result about DEAD_CODE_DATA_ELIMINATION (DCE) and dead syscalls
elimination (DSE). It's based on config[1] and a simple hello.c initramfs.

In the DSE test, we set CONFIG_SYSCALLS_USED="sys_write sys_exit
sys_reboot," which is used by hello.c to simply print "Hello" then exit
and shut down qemu.


|                                    | syscall remain | vmlinux size     | vmlinux after strip |
| ---------------------------------- | -------------- | ---------------- | ------------------- |
| disable DCE                        | 236            | 2559632          | 1963400             |
| enable DCE                         | 208            | 2037384 (-20.4%) | 1485776 (-24.3%)    |
| enable DCE and DSE(SHE_GROUP)      | 3              | 1856640 (-27.6%) | 1354424 (-31.0%)    |
| enable DCE and DSE(SHE_LINK_ORDER) | 3              | 1856664 (-27.6%) | 1354424 (-31.0%)    |

It shows that dead syscalls elimination can save 7% of space based on DCE.

[1]: https://pastebin.com/KG4fd7aT


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
