Return-Path: <SRS0=snBs=OH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754C5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 14:21:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B50560EB2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 14:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B50560EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFJnFQB1EGGBqJYz0rlU26fcapcIX+G7B1IffWlA0c4=; b=z8oqiIr+qC4aC4
	+eUQL/cfghkTINkgwYjhcO8QlLlIZFwYEY6z1rblzLPlStG5gXG0xX/M6c6bhIJ9kz9vHs4XapdJN
	Cbx8cgdCBRyPG05PWF6+k+3pSkYYr3MLjWRYLqQ4dKF8VfGe3y5lWp5m25ZepwaYsAkHlEV3tDuyl
	XGIUeXzlgXvSKWwyjTKTVwsVnVDAO3uH5xg85l8BS3QYvN8ruhnfin4G1i+1JxSw0UO4yFeJ8QBV+
	Vdg3OGEYauNGpKNd3udbZWDOQVfkj2gneEHL6HNf4GyIulPJZtl7s6/xeds7fNCwYV23HtvNI+pYk
	xoAhjZzp9ZZdlby0+XxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mREk5-00EPHT-Cb; Fri, 17 Sep 2021 14:21:29 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mREjx-00EPGw-8l
 for linux-riscv@lists.infradead.org; Fri, 17 Sep 2021 14:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=eNWjUOhlNPYKaMAtioES/rG0dxTk7gZ+ai
 70R1grEPw=; b=fLx9paXp1EWnCFjjfADFUp/Af7IqNSE21ZEidBrrWrsDe8Tmw7
 DOvqEG/jWmU7AGjCRsosyasr6Gvgm6j2LYYU+sNw9Pn+CV4ATyj6ky9JAewUH0LL
 oWxrA1Xn1kXdDYTBG5yhHKgOrURckiHFwT6nESH0KMoywASc6ZFgz2iUE=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBXW4dSpERh3mcRAA--.2969S2; 
 Fri, 17 Sep 2021 22:21:06 +0800 (CST)
Date: Fri, 17 Sep 2021 22:14:29 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Chen Huang <chenhuang5@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Darius Rad <darius@bluespec.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] riscv: improve unaligned memory accesses
Message-ID: <20210917221429.4d3a15ca@xhacker>
In-Reply-To: <20210916130855.4054926-1-chenhuang5@huawei.com>
References: <20210916130855.4054926-1-chenhuang5@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBXW4dSpERh3mcRAA--.2969S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKr1xAw1fWw4kKr47Jw13Arb_yoW8JrW8pa
 1UCFnxurWFgrn7KF93Jwn3uF15Z3yfGF47JrW2ya4Uur1YvFy7WrWjq3WDG3srXrn7C34D
 GrsavFnrua43Z3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
 6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j189NUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_072121_976083_7528E12D 
X-CRM114-Status: GOOD (  11.91  )
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

On Thu, 16 Sep 2021 13:08:53 +0000
Chen Huang <chenhuang5@huawei.com> wrote:

> The patchset improves RISCV unaligned memory accesses, selects
> HAVE_EFFICIENT_UNALIGNED_ACCESS if CPU_HAS_NO_UNALIGNED not
> enabled and supports DCACHE_WORD_ACCESS to improve the efficiency
> of unaligned memory accesses.
> 
> If CPU don't support unaligned memory accesses for now, please
> select CONFIG_CPU_HAS_NO_UNALIGNED. For I don't know which CPU
> don't support unaligned memory accesses, I don't choose the
> CONFIG for them.

This will break unified kernel Image for riscv. Obviously, we will have
two images for efficient unaligned access platforms and non-efficient
unaligned access platforms. IMHO, we may need alternative mechanism or
something else to dynamically enable related code path.

Regards

> 
> Changes since v1:
>  - As Darius Rad and Jisheng Zhang mentioned, some CPUs don't support
>    unaligned memory accesses, add an option for CPUs to choose it or not.
> 
> Chen Huang (2):
>   riscv: support HAVE_EFFICIENT_UNALIGNED_ACCESS
>   riscv: Support DCACHE_WORD_ACCESS
> 
>  arch/riscv/Kconfig                      |  5 ++++
>  arch/riscv/include/asm/word-at-a-time.h | 37 +++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
