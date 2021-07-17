Return-Path: <SRS0=adiZ=MJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF19C12002
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jul 2021 02:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69121601FC
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jul 2021 02:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69121601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuVgrvzA5aeGzwxXDcEsty7JVnLZV9EoSQyLF8EtX1o=; b=NcX6O/cwycazPq
	lC4RAjG3snoMfMPYGynEoJYf+7WQtoy9I/bYpgVz7u63bGmbhvTLI4zZA7eqdOtKJPdNoGAZsMyyR
	60DQF8Fdw1QDfO7pIGzEUNujC13pNNeqYYWtdiwWtSysjTJ26Yx8lSPwzzXy6rBSx8MX9BuoJu0vj
	FnlPioPhcCrOOaTG4DWjQyMi4ud9OBVxaO5AmNcXRWuwaHBiDMvkH283Qn8oku90m5FrNsLL7yd9D
	zSZkLhftox/AfxP68p9k/h50vnOdf3XAEYoiSjHl2br7t+Cr4TsNiue9MyrTLPSez6IkWS66ZpZSK
	yviwZT2VYYJcNYlpG1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4a0H-005nu0-7X; Sat, 17 Jul 2021 02:24:33 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Zzz-005ntO-Le
 for linux-riscv@lists.infradead.org; Sat, 17 Jul 2021 02:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=JtLTl9T0wG9pndopfAX2sGRznNc3Jk0+HP
 K4G+ituY8=; b=ROVKHEv6clDWqcKEd5XYiWKePTPl6Ekc+pb/s6gH0HpBFPFqF0
 gMfmeJjCqbitlbKZsnhzPFnrqFBgIbaPlP338cCs/Fa48e4enpaIPZ14CTd6kSvv
 8vW1+9Pmx6BkCN5lEbtxroJX+s22L3PQbQm73NTRXkxQZ+aopcU8V8aR4=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDX3hY_P_Jg76J+AA--.90S2; Sat, 17 Jul 2021 10:23:59 +0800 (CST)
Date: Sat, 17 Jul 2021 10:18:05 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Tong Tiangen <tongtiangen@huawei.com>, <palmerdabbelt@google.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
Message-ID: <20210717101805.2afabacb@xhacker>
In-Reply-To: <871r7yz241.fsf@igel.home>
References: <20210621032855.130650-1-tongtiangen@huawei.com>
 <87pmvjtumc.fsf@igel.home> <20210716205332.5856df78@xhacker>
 <871r7yz241.fsf@igel.home>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDX3hY_P_Jg76J+AA--.90S2
X-Coremail-Antispam: 1UD129KBjvdXoW5KF4Dtw1DCry7tFyDKFy8Xwb_yoWxXwb_ZF
 y0kFy7Gr4jvrykZFs3Xws8A3Z8tw42yryq9rWUAF9Fqw42qFya9w4kJF92yFn09as7KFy7
 uryS9wn8Gr129jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFkYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
 106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
 xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7GYLDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_192416_416876_52DACC20 
X-CRM114-Status: UNSURE (   6.92  )
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

On Fri, 16 Jul 2021 17:53:50 +0200
Andreas Schwab <schwab@linux-m68k.org> wrote:

> On Jul 16 2021, Jisheng Zhang wrote:
> 
> > I can't reproduce the panic error. Mind to share your .config?  
> 
> https://github.com/openSUSE/kernel-source/blob/master/config/riscv64/default
> 
> Andreas.
> 

Looks a bit strange. With the above .config, I still can't reproduce the panic
either by

cat /proc/PID/wchan

or

cat /proc/PID/stat

I use the latest linus tree w/o any patch. I noticed that some SUSE_* config
in the .config file, is it possible that you applied some patches? If so,
can you please try the lasest linus tree w/o any patch?

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
