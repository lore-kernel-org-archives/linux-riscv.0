Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB13DC77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyTSgqnc7AKQoAPj9zmYg6TmwpfiVMifgGu/7PtnRg4=; b=tgAH6Tqutc6Z7E
	aWFSNk+1v4nHGrMPsxZXinp2dolOAKvvk3qFiHtcmz42ZisLrX8XMkTP8Wg9W4c80u3aZW+ry/vY7
	RYQfHjwO/q1XHGqN5ylax+8rVMetrPzKQgNfgIIqQTiD4hrRPZTdbvetWJlIf/tQs6JqjkI/anQyF
	MCCYsvk016TQonv5qzOmYDBnb+BOo5Pv3LTkvY0DNXWA7psydEPHam3RuOmwHsOfGwH14N77AZDS7
	bbdZSg7YtRYBTgcAIshrX2DxyLGcgh9zvKEtovCUToGRyiG1GhtLirz0/qtwJirw410tZsPNTalh3
	J2M1zOEJDSXQdHgh+31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prigL-004U0q-2w;
	Wed, 26 Apr 2023 17:11:53 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prigJ-004TzL-0c
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 17:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682529096; bh=1KlUDx3CkkWJEgkDKs1pH/WOg3N32N5GHA91r2xNTlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BvsTAYIbwApxxbliPQYwK42IW0BBSqzJZfyDFKHb45JRj0hqJsEBC4nFrRWiqiM7O
	 IlZk91xUdlWjT3+Rpn+eVoemaki252YlBUBWYe0SiVf5ccXKM0L07/RRjn0e945h45
	 xznu3ZQI0mYLZ8PzsFJqUXe2LoESwSj5Cnyh6Gf4=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
	id 2DD9263F; Thu, 27 Apr 2023 01:11:29 +0800
X-QQ-mid: xmsmtpt1682529089tn6lyi6gr
Message-ID: <tencent_0F23181FB02085B690E30BEE4BCC49087506@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeiexUNVyYWNTlxVkZnL2rZWYLVgEeER4QcbGLKJO1ANXu0+jQhHXq
	 EPW19vc60ahUluul5IT3VcRcw8XuJtTcP/hzlrzcilRt5T7xGysELRPt8pn+VxAI5DmVWXs1Injb
	 PhzQsL9Q1GhjzvS0CbAAHo/XTn6BZLI2VGvmLRebKEFcqlk33DZ1YXFP5IOUImLLXWt1gVUhb5Et
	 yiKnGa4IJI/71vB0wUQgOLr2RlHrQD0X219TG3898OIz0vJeV3odukAb2rjd90EMtQiF6qQKtzId
	 R2guIASKZa7VjeRamtMbAcWfQnzFuOjhisbxcqyKuh16zNxV4wtqUmjmvBogZfGFBrrmyMXPd1Co
	 tteoTv/PwRICBV7sTP001RMFJ8t/1e1ubplXK0FFV81Cqug5taZmws1KRtbFe65bW2fTO2dkgLQq
	 QKmyAtSpp/0eHqJcrxBXO5I2HHnc/m0cVgahwpZbQq3yHIw5xJPr+2lxdLFg4fJTLvmTUNaPC2pY
	 hHsMpCFGYWXhgTLVNIj0SaRUhIEMMkE7v7AvvBlPCMW0/Uzxenao//MgdvPMtEM/9KwvBUAptORd
	 uOMw07p5ovatpMHI6r9AEDFAbg9qsN630gaDywGekJ3S36K2Q//3BIZOcSCeS/MUEky3N50dD27g
	 XZvkiQ+KZzP3NT79IOKX3YuvvkyrYNyQ/geCLT/FdlhbIcXQ/HFpaQbxS0+6rE8XxfNBly2ITGwA
	 h6Q+mqtFNk0AWW4uD8dkyFp928Hp6P9cgSFjVQXpG8GdOZXsladwrAl5KqrIgTbEMHBAzgw6x7sy
	 Jm7A0+PXfl+uqByrU8BDVfzQlxwGV0o8h7b9WDhSgvCPu4HmAgddX24gzhqlaHQehmWTEf1Lg+0j
	 EBRnG+MRB1JCaLZITDmFYHwFoVOIiSLaQKQLrvitb5GchAi5kGkw4mKTvkkprk9Kw0BO+Wh+ZCAZ
	 6KOYPQyDdKepCy3C/eyte13v8NkX3Ll1hAS3422X50J/uFq841jyPQu0o7VtsZ
From: Yangyu Chen <cyy@cyyself.name>
To: conor@kernel.org
Cc: ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cyy@cyyself.name,
	devicetree@vger.kernel.org,
	i@zenithal.me,
	krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	soha@lohu.info,
	twd2.me@gmail.com
Subject: Re: [PATCH v1 1/2] RISC-V: skip parsing multi-letter extensions starting with caps
Date: Thu, 27 Apr 2023 01:11:00 +0800
X-OQ-MSGID: <20230426171100.19591-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426-getting-tactile-e6cee2cdf870@spud>
References: <20230426-getting-tactile-e6cee2cdf870@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_101151_550633_90F2318E 
X-CRM114-Status: GOOD (  10.38  )
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

Hi,

On Wed, 26 Apr 2023 15:37:58 +0100, Conor Dooley wrote:
> Perhaps the thing to do is to actually take Yangyu's first patch and my
> second one, since the problem with backwards compatibility doesn't stop
> the kernel from being more permissive?

How about taking my first patch[1] since the ECR[2] mentioned that
the format of the ISA string is defined in the RISC-V unprivileged
specification? However, I think we still need to stop the parser if
some characters that the parser is not able to handle as Andrew Jones
mentioned in the previous mail[3]. In this case, we still need to add
some code to stop parsing if any error happens.

In my humble opinion, backward compatibility can be solved by backports
to LTS kernels. I think the better option is to allow using uppercase
letters in the device-tree document to make the parser coherent with
RISC-V ISA specification but recommend using all lowercase letters for
better backward compatibility.

[1] https://lore.kernel.org/all/tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com/
[2] https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
[3] https://lore.kernel.org/all/d7t6nxmblmyqriogs4bxakpse3qc7pc6cczjnhmkpk4kjwvgcb@3aihh3erdn6p/

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
