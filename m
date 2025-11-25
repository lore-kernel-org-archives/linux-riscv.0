Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E632CFD37A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISd5lNmxd3H/znTy405k8WB0GQ0Kjpag3FasXSqXKwk=; b=wU1G0TMW46F8TY
	7D90U7vfSZm1I57RqNL3quHdIraoVrCSHINnNIF3prUKEA5xlJJ6DL0xiiaI+qJ0ZMStZVDwiWH/b
	JfH+4vxoP2jLEHMDtcZO3DYpKhUupB+vCR+GoD81lM1qF/0WAdv4qfMQzLrr6Y29BBA5PQY+cle40
	jcQe2564qezMXJwmKLcn2BY8YtdciRJZpPI4TcVbNrM0zBxOeol1v+1doGJJp45yhvaXCb0Wp4/KB
	EQtsrdgWSLvmlgkhrQ29r/Hd7TNaQS6A7qljaao88lEtvywsZvIPg6cJvimO6Ro1nU5ge0XYtPsJr
	7FP5CbkAMrJ6F4uMVWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpxx-0000000D5hR-0ugj;
	Tue, 25 Nov 2025 10:08:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpxu-0000000D5fG-1y6H
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 10:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8E341B61;
	Tue, 25 Nov 2025 10:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C36C4CEF1;
	Tue, 25 Nov 2025 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764065285;
	bh=D1b4er93gAo+OdqHV55sYeUH0qszWznpY2Gqy4l4Bpw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aEPGstBbu+C83dg92XtBr6Vs04BmxFzimlKkzXWXFd/tjzsGs8c2Ml4G9o3qliDFa
	 1lBo/b9j1xdEfgJ5+Zz26WZ8NcaSQSXu5BeGg4iY9vhu0vU54jiA+Rfp/X3k/XYAF2
	 YYTd00hXO3tKGYG5KPBvuOj7GmZ6fW2kI0+6/lNJJMBGHfX/ZZ14rgDYvQ4/WdbcC9
	 mdAhux7EBWLiaLaikGFLBcgb0FkrOZTUz6qH5FAuRGS7uLGTwZ1HIuYkfGB4gEogV8
	 8iBzTl6g/ohSViXQbB9ZdLAttfE8/84SXbFdKAcxY5xy6pyLFs+ElKgbi6BWXYfBGr
	 ofBYjNvzUOfgA==
Date: Tue, 25 Nov 2025 03:07:59 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
cc: Conor Dooley <conor@kernel.org>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Himanshu Chauhan <himanshu@thechauhan.dev>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: refer to intended files in RISC-V SSE
 DRIVER
In-Reply-To: <20251121134757.120782-1-lukas.bulwahn@redhat.com>
Message-ID: <1d42ff22-509d-ccee-1f7d-3400ffb6ed61@kernel.org>
References: <20251121134757.120782-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_020806_533741_97A8ED2E 
X-CRM114-Status: UNSURE (   8.39  )
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

On Fri, 21 Nov 2025, Lukas Bulwahn wrote:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 5ffe60d26107 ("drivers: firmware: add riscv SSE support") adds the
> files riscv_sbi_sse.[ch] and intends to refer to them in the new
> MAINTAINERS section RISC-V SSE DRIVER. This section however refers to the
> non-existing files riscv_sse.[ch].
> 
> Adjust the file entries to the intended file names.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Thanks for catching this; queued for v6.19.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
