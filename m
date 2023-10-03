Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333E9E7AD77
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ep3ZxrMUiW6i1KgHKkivp5rQZziERhgNWgBCSBsGO/4=; b=B/OWLcwMjzCEH4
	rOcztwtMrSF9/oOUY7UX6tGaYI3YIoTw8qiyBD/TgejFEHOd+Jc1knCevv5MN8YIib9ZdwLC80Jlq
	Je4cLC3CnRefLpUGVc2gcZJmhpLnh9LbLv3KzlqD0/RzbusS2X7vZVLVg6EG4iRBmOBsdkHdtYh44
	SilHJfhbBAad1wun5SxWKudCAN6DPby4WRgjS1mQFCtWYmN5VybIsYf7OkPba3And0a6aJ6HXI6sg
	6ytPjVJLoFjtA/nYLpAMvl9K5XGw1+VDuMYTY0d/mrx95rZ+DnoACA1Yc2TF7useDejIjDSLOXvxR
	10QF/Ye90urKGXCuTx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qniUm-00EzA9-0R;
	Tue, 03 Oct 2023 16:43:40 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qniUi-00Ez8v-1C
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 16:43:38 +0000
X-QQ-mid: bizesmtp77t1696351393tys816h6
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Oct 2023 00:43:10 +0800 (CST)
X-QQ-SSF: 01200000004000B06000B00A0000000
X-QQ-FEAT: rZJGTgY0+YOUZ7bEZUW/04TLkOEPwIzf85azerfjIvKCpbffmSPTMh+v0i1qs
	tgGncN4m1gwYkonbPq1eThUWyRnw2TvHRdPkhotwvL4yixGCsT2jXlN4skTNt6MvuA6kwSQ
	rhXcCeAhBRTLiHe0qE0ZhLWYOUF5Dk9VfcH8eilV2t870tu6DR2i23OeALoXGmUNJBJvfnJ
	Z1IFcy2cWKUb3kNJtAb1ehtVQ9ouvPZD4ZecOK61t58ulaeEklH1YJvF9cZ4RNXxlsjLup+
	PNMUTGSq0O02jlqadVdMZDLXHDb7LwUO1VGnIQ5EapioiWpzabTBgqQ3fobnD6OUDOJuSc5
	vrBIkkZjpB6HD4lm3j595L+yYCuyXPLf0lUshBD
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5112236808884648054
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
Date: Wed,  4 Oct 2023 00:43:09 +0800
Message-Id: <20231003164309.463912-1-tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_094336_766613_6B29F37D 
X-CRM114-Status: UNSURE (   5.85  )
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

I didn't test DSE with explicit KEEP() in the previous mail. So, I will make up
for it now.

This test result is about DEAD_CODE_DATA_ELIMINATION (DCE) and dead syscalls
elimination (DSE). It's based on config[1] and a simple hello.c initramfs.

We set CONFIG_SYSCALLS_USED="sys_write sys_exit sys_reboot", which is used by
hello.c to simply print "Hello" then exit and shut down qemu.

|                                                              | syscall remain | vmlinux size     | vmlinux after strip |
| ------------------------------------------------------------ | -------------- | ---------------- | ------------------- |
| disable DCE                                                  | 236            | 2559632          | 1963400             |
| enable DCE                                                   | 208            | 2037384 (-20.4%) | 1485776 (-24.3%)    |
| enable DCE and DSE with explicit KEEP() of except table      | 17             | 1899208 (-25.8%) | 1387272 (-29.3%)    |
| enable DCE and DSE without KEEP() (By SHF_GROUP method)      | 3              | 1856640 (-27.6%) | 1354424 (-31.0%)    |
| enable DCE and DSE without KEEP() (By SHE_LINK_ORDER method) | 3              | 1856664 (-27.6%) | 1354424 (-31.0%)    |


It shows that dead syscalls elimination can save 7% of space based on DCE.

Although no KEEP() can only save up 2% space, it can reduce the attack surface
and eliminate the misuse of KEEP(). It ensures that every orphan section is not
orphaned anymore.

[1]: https://pastebin.com/KG4fd7aT


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
