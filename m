Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5CCCF8844
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+clRME5XFaFDrRnlE/CtoAaIBJ9n69KEmqgaAKHtLk=; b=Ve6QJLODNTEhd9
	Ucyz1LLkkLDZ41uX/5tNYgBgaQfqIKrcZkY6R+naPCwF3LaNIh0MsESK7svvNb3mhOmJZ+1Zqteoh
	2Yomw3RmUIVtFi70A2v2TasMFEfwvAK9XzS3fT1/wIvADkdkMAkOPhRruzn9sY+sWFwOELmiOnH9d
	c2TE3VpUGCgv+qCnoMOEMRF93QGXcW1gkM3QrIICkmrMQf0nAqik1Z7Oaa4VtX1+DmqPEMk4ts9yD
	HxkeuxWh28dOD7V24stDZf5OAJJySm+893EoM9rQuFm6DJ7uX8ToRUZqBsG7iQYYJ2LKX3TdT7bXE
	xD/UUdSz6mH4AOCS2Hjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2mL-00000006ZHN-0pvZ;
	Thu, 20 Nov 2025 11:24:45 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2mH-00000006ZG7-3BBn
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 11:24:44 +0000
Received: from Mobilestation.localdomain (unknown [183.6.59.216])
	by APP-05 (Coremail) with SMTP id zQCowADXzV5N+h5pzdhdAQ--.1076S2;
	Thu, 20 Nov 2025 19:24:10 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: ajones@ventanamicro.com
Cc: alex@ghiti.fr,
	alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	shuah@kernel.org,
	zhangyin2018@iscas.ac.cn,
	zihong.plct@isrc.iscas.ac.cn,
	zihongyao@outlook.com
Subject: Re: [PATCH v5 2/2] selftests/riscv: Add Zicbop prefetch test
Date: Thu, 20 Nov 2025 19:23:50 +0800
Message-ID: <20251120112351.34433-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251118-cbe35d090a464d246ed0b8eb@orel>
References: <20251118-cbe35d090a464d246ed0b8eb@orel>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXzV5N+h5pzdhdAQ--.1076S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYB7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI
	0_GFv_Wryl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUosqXDUUUU
X-Originating-IP: [183.6.59.216]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032442_176240_1D54EADC 
X-CRM114-Status: UNSURE (   4.10  )
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

Hi Andrew,

On Tue, 18 Nov 2025 10:45:43 -0600, Andrew Jones wrote:
> I would have written it like below to avoid four redundant lines
> 
>  case 'm': case 'z':
>    tests[opt == 'm' ? TEST_NO_ZICBOM : TEST_NO_ZICBOZ].enabled = true;
>    tests[TEST_NO_CBO_INVAL].enabled = true;
>    rc = sigaction(SIGILL, &act, NULL);
>    assert(rc == 0);
>    break;

I'll apply this style pattern in future patches, or in a v6 if we end up
needing one.

Thanks,
Zihong


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
