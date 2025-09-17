Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F69ECA0EE8
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pGGgsD9ZZxYEEgt+o3olx21fNFDVYS5ZmNIJjfoMwQ8=; b=Lvc5D04KwPUfma
	b79yXxy7/xuv6BlYy6wpUKkiEL+pYpdUX9npFOISrD1RPwopPnLfj6+uTMgh8pQujhDJNiTm36aYM
	JVvyfuTIc8GoDnTaXPQDeSbe9CFIetTQmwZASYkT693vSUDeIPuo8AFcVUl4/HesGzaUi7XDZZb+5
	C5QkDMOVgUjCr4EUTdjw+s2RloS97Lpr8yND4ZL1pL5HOvRV7EtU1rMl2f6TssEicYy936q9tp+BU
	wG9MsL8w8Ju4dMh2X8Jz/jF/eHwjqVHbh6JiQAIMNndHPT5CnbtblSgQvDq3q1sUrZ2ZjY2o3QFD6
	fZAc4WNWtTLZhJjalrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqsd-0000000BDeW-1afq;
	Wed, 17 Sep 2025 12:03:23 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqsa-0000000BDdy-0XAP
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 12:03:22 +0000
Received: from [192.168.0.107] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowADnhxF7o8poUhdeAw--.4222S2;
	Wed, 17 Sep 2025 20:03:08 +0800 (CST)
Message-ID: <b68478db-5a8c-4b5f-a4d1-f4202ca1f062@iscas.ac.cn>
Date: Wed, 17 Sep 2025 20:03:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: stable@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: riscv: Backport request for mmap address space fixes to 6.6
X-CM-TRANSID: zQCowADnhxF7o8poUhdeAw--.4222S2
X-Coremail-Antispam: 1UD129KBjvdXoWrJrWfur1kAw1xCFyxAry5Jwb_yoWxXrg_GF
	1UJrWxJa4UXFWUWFWUKrWrArn5CaykZ3y3Jrs7Ww4IyF4UC3W7Ga1vkry8CwsrAF47AF93
	t3WIya4Svr12qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_050320_538460_70966C5E 
X-CRM114-Status: UNSURE (   3.89  )
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
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

I would like to request backport of these two commits to 6.6.y:

b5b4287accd702f562a49a60b10dbfaf7d40270f ("riscv: mm: Use hint address in mmap if available")
2116988d5372aec51f8c4fb85bf8e305ecda47a0 ("riscv: mm: Do not restrict mmap address based on hint")

Together, they amount to disabling arch_get_mmap_end and
arch_get_mmap_base for riscv.

I would like to note that the first patch conflicts with commit
724103429a2d ("riscv: mm: Fixup compat arch_get_mmap_end") in the stable
linux-6.6.y branch. STACK_TOP_MAX should end up as TASK_SIZE, *not*
TASK_SIZE_64.

Thanks,
Vivian "dramforever" Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
