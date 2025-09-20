Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2921CAC59A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 00:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MY1Tzia+b4c1LDAuGWLJdSvt8xY/+8Klgce2qdiyPs=; b=ra3ijI+Q0VzP4U
	GLnCQZ6/H7k6BEliYDzUizXq4E8TALpHMYbSkeRuw6dt1+3pGyGbnzeTcIqYe5hG9tqW4uRzer/u5
	Np3+vqzOtdyecaKdcsigkHekJO4XvXZd262GKCX66BIYG7TCG3BgR9S6a9iX/ZvvNYUSt4OnnTomk
	J9lvkhgflxTTdu1O+2My3jpjwXY+dr38W8PJvir//NmWg8/MI1ozcstBa59yogGDamaGHG7JxDWUs
	PB5i5eJi/3qBNYFVvSk2siGmZ2iE5Xn34cw8wJlTWJMXBw4C8tyWQOk4ZCdQOZih5lum6EErQLwVK
	9S102rHBe/m/ennCWbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzltT-00000004RPc-2KVe;
	Sat, 20 Sep 2025 00:56:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzltS-00000004RPD-0RnB
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 00:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E4DA6013A;
	Sat, 20 Sep 2025 00:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A305C4CEF0;
	Sat, 20 Sep 2025 00:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758329761;
	bh=kvKfAjitcbTLQsI2Awo6FX330gVEAw9BSbt3m48J6pk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W34bmWuvwAVc6uarjDsw/Js6LfVE+N1Mt4RN+zbeZD+YQ/M2fAEakHBRMxQJ4zJ/J
	 jsIfenYFvIsdgYgf2IT5FmBoDtV1D1dYton5tD8KZDq/wrob3NbFVnnyH8i0HTGAbp
	 m2edo5DjBhqQNa7sS+jhwHCxDKwVbIgcQt4ha9ydNRgb0z51sFINTXQMjoF+1BRSbi
	 IbUwYt8UEARl7nLBiCs6s+PNXNTkd1vKgWIeJTButGk0lXJF/zvXEYD0vidAZfSO0F
	 voVTJqoTZlujBiMVvWf7/vsGJgBWEsuB0OlejlTgrVebFqv+TkZ5sSmyv9yoEtuKbJ
	 JWMduWALxCPeA==
Date: Fri, 19 Sep 2025 18:55:59 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
cc: kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>, 
    Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Fix sparse warning about different address
 spaces
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
Message-ID: <485fba52-1f41-e940-bc38-2e2244d78c76@kernel.org>
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com> <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
MIME-Version: 1.0
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

On Wed, 3 Sep 2025, Alexandre Ghiti wrote:

> We did not propagate the __user attribute of the pointers in
> __get_kernel_nofault() and __put_kernel_nofault(), which results in
> sparse complaining:
> 
> >> mm/maccess.c:41:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] * @@
>    mm/maccess.c:41:17: sparse:     expected void const [noderef] __user *from
>    mm/maccess.c:41:17: sparse:     got unsigned long long [usertype] *
> 
> So fix this by correctly casting those pointers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508161713.RWu30Lv1-lkp@intel.com/
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks, this one was sent upstream as part of the last fixes PR.
  

- Paul
  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
