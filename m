Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E41C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abF3Asto1H5buFSGY4ALly8Zv8e+xLGo4YLMHZhG/PI=; b=Ii88/ELHH+rUxN
	6nz3xIZqRzGta+zlGWSwFtTryFmHZryxxJPZpjFYr5fbDHE3JRYPmxALu6G155ox+vIzobtK0GHOO
	Gwh6K/wkffL5OXtq+NmmF6M8GqYxC3ofZw3+L/zyqPIDtuCnqx/vDVK2fSrHKO2+Shz2IILmFxX8J
	QZsEwNi1+1eeOjDCbdrZC1qM/wkmFTUL6a5fxzEaRyaaM+fwD6+T5eR+r0MQL+oWmlCO5u6oKk4Fq
	2r4rvhimUrJV3irTLCtW/58JahwrHeCq/1BMzcQS4qJIt+2a/J+CWaWhkvWsGT8AbC5ZHUFfyORqZ
	O/HkosZ3PmUzYrP/jSOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oknaX-007JDJ-ML; Tue, 18 Oct 2022 14:29:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oknaV-007JCc-9N
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 14:29:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6F376151B;
	Tue, 18 Oct 2022 14:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FF5C433D7;
	Tue, 18 Oct 2022 14:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666103338;
	bh=k65K3XnLvRjoAk6TBgfNDUr3K8yut18Iz71twZv/1OY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFtlRRCuNWeoKw6Chu93Pxxv5Le+LyqZfJSjN4yn0/MyGDdkEmrbz+cUSnzHLPEzO
	 aDuxKzHWZWG/p2hqotv4Cb/eK/ycA8e/vybPnTPkkVbxzhO7RYEEXEoxRy17dgyywg
	 JL9ZpD55GbpgY+SALICqAb8mae0POtTyqch5/ZYLsDCldG9cHF1yG0+B0krwcgoeR7
	 BntrjA21rM9YesAHfwIRYl1jyanopwoyeiRTWIuOvewU6aJ5RnGBW53b2KvRN7pOuL
	 /v2lkwfKeKJXdXTZ482oM6JDK1NtITR0d5tyw3thySIxgVN9GV0pdftvC9ihrsQuJs
	 xb8KKEr+hmH3A==
Date: Tue, 18 Oct 2022 22:19:21 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Denis Ivanov <denis.ivanov@cloudbear.ru>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dao Lu <daolu@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: Re: Bug report: cpu_relax call from vdso space
Message-ID: <Y0616eIDlrlGwF3a@xhacker>
References: <3815b200-a9e2-a3db-c7f1-1e3f86dbab3f@cloudbear.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3815b200-a9e2-a3db-c7f1-1e3f86dbab3f@cloudbear.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_072859_381897_00BA204E 
X-CRM114-Status: GOOD (  11.18  )
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

On Sat, Oct 15, 2022 at 10:08:55AM +0300, Denis Ivanov wrote:
> Hello,
> 
> Segmentation fault may be raised from cpu_relax()
> (arch/riscv/include/asm/vdso/processor.h).
> 
> cpu_relax() may be called from vDSO functions (ex: __vdso_clock_gettime).
> This means that global 'riscv_isa_ext_keys' variable must not be used in
> cpu_relax() directly.

Hi,

Could you please share how to reproduce the Segment fault with
cpu_relax()? 

Thanks

> 
> Use of this array was added to cpu_relax() in
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=fixes&id=8eb060e10185cfc97ef0200d197ec246ba0f9f8c
> 
> Denis Ivanov
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
