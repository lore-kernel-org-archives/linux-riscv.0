Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E273BEE498F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 17:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yJmw9QsE9nmhqNdVnTarwjiGam8U4duhS2Zv4Y++I4=; b=p2qZEbX5pt30gj
	9Bjq6dQUWsae7f5hYDgYRzy0ScLndKCwGQtfJ1tLDwFY9F4RccltHKNZhbYbdvTUsOcPczWKY6Tzu
	LPm9RsKKtVbKLu41mDko61iK5JnL+70PMSCMI+5iXw5zR9Wxc3Dg3QeQWYThuzfiUycgx1WccfSJd
	qUW3cUYoCWOuPdLiI9FdVnk9JdrvJBAkw8tLHpuryAnhYU/1X6wo0OONXisuirndYZ12RVulB7tX7
	9Lx0W/EW/w3OZ/EYbqn/QaWKAnQnexUrhxmuCSi8x0yHWnkkResevcxfqQwKRlAbNp+9Nbknxzf/t
	brP/211j6eRp8Xu0SiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadmA-000000058n1-2amU;
	Tue, 30 Dec 2025 17:44:55 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadm7-000000058mG-075K
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 17:44:53 +0000
Received: from smtpclient.apple (unknown [58.38.116.204])
	by APP-03 (Coremail) with SMTP id rQCowAAHKeBqD1Rp4MmmAg--.62002S2;
	Wed, 31 Dec 2025 01:44:11 +0800 (CST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] riscv: boot: Always make Image from vmlinux, not
 vmlinux.unstripped
From: Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
Date: Wed, 31 Dec 2025 01:44:00 +0800
Cc: Han Gao <gaohan@iscas.ac.cn>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Nathan Chancellor <nathan@kernel.org>,
 Alexey Gladkov <legion@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <15D6E841-BA8C-43D0-B08D-170DF475AB3B@iscas.ac.cn>
References: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CM-TRANSID: rQCowAAHKeBqD1Rp4MmmAg--.62002S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyUKF1kGF4fuFy8uF48JFb_yoW8ZF4rp3
	yDuw1YkrWUJrWjgFy0yr429FW2qFn0g3yfZFy5KF1UtFWjqF1vqwnFg3yUWFyDGFnaga1U
	Xr4fGas5Ca40y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [58.38.116.204]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBg0MDGlT6Zg9CAAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_094451_443632_8464654B 
X-CRM114-Status: GOOD (  17.79  )
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



> On Dec 30, 2025, at 21:39, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> 
> Since commit 4b47a3aefb29 ("kbuild: Restore pattern to avoid stripping
> .rela.dyn from vmlinux") vmlinux has .rel*.dyn preserved. Therefore, use
> vmlinux to produce Image, not vmlinux.unstripped.
> 
> Doing so fixes booting a RELOCATABLE=y Image with kexec. The problem is
> caused by this chain of events:
> 
> - Since commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
>  vmlinux.unstripped"), vmlinux.unstripped gets a .modinfo section.
> - The .modinfo section has SHF_ALLOC, so it ends up in Image, at the end
>  of it.
> - The Image header's image_size field does not expect to include
>  .modinfo and does not account for it, since it should not be in Image.
> - If .modinfo is large enough, the file size of Image ends up larger
>  than image_size, which eventually leads to it failing
>  sanity_check_segment_list().
> 
> Using vmlinux instead of vmlinux.unstripped means that the unexpected
> .modinfo section is gone from Image, fixing the file size problem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> arch/riscv/boot/Makefile | 4 ----
> 1 file changed, 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index bfc3d0b75b9b..5301adf5f3f5 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -31,11 +31,7 @@ $(obj)/xipImage: vmlinux FORCE
> 
> endif
> 
> -ifdef CONFIG_RELOCATABLE
> -$(obj)/Image: vmlinux.unstripped FORCE
> -else
> $(obj)/Image: vmlinux FORCE
> -endif
> $(call if_changed,objcopy)
> 
> $(obj)/Image.gz: $(obj)/Image FORCE
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251230-riscv-vmlinux-not-unstripped-30ec0c930fd2
> 
> Best regards,
> -- 
> Vivian "dramforever" Wang

Tested-by: Han Gao <gaohan@iscas.ac.cn>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
