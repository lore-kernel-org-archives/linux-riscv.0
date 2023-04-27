Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF48C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txE9bYh3bwTro6e7Ai7vGnfAUckGOI+eL9tR+tjji0w=; b=pC2KMwF+fW24NW
	k6X6+xO9ibJTVwAuNCJ9+uKzadzXLe2z6pnzhZEvt/y5Ds8kdZzoe6X4WMJPLS/liz0zLbLfXGqCH
	ib4UvdZlrJC+3koCNj+In6pbST368mkoceZphJwbvNx7S/QUm+u97/C5fLMTu1xDbHP+XgTD13jKK
	bimT95ioPVLX1sH8ziJkyLNjpwLRnHWuQLhUy/9yukdx9sR4dGePWgxyYI9qzpRD85tok+zLpWbTa
	SoPdwZTlS/TaUt7PBZ4wSxLX5S1kgGhGAGnLzNv570hdMGGUNmrknwBra0rCWeGLeQCBhO+sswJ8t
	8weChi2dqApn75eYzGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps12M-006ZQ8-0m;
	Thu, 27 Apr 2023 12:47:50 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps12I-006ZPK-38
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 12:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682599654; bh=9eIpaK6qsbATrucAS3D9t6aE9hGbGWJhmkVCEJk7Msg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CmVHg28tn5St3t5OMsFTB9rlmKEu3ZZdsMV56CHfT23cJUkChAzBZy6DxB65Q6t+s
	 HEjgSXgbNnEAy5aeerHmnKGPYCBVQShw08oCIGl6crDXWVz9xSNFEnRPr9Tdf4p3dy
	 65FzECsHci4hXqdvZWwERHgQEJ73MbUn/FbB+xcc=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszc1-0.qq.com (NewEsmtp) with SMTP
	id BD4A5CA0; Thu, 27 Apr 2023 20:47:20 +0800
X-QQ-mid: xmsmtpt1682599640t519ijgnm
Message-ID: <tencent_BC64BBD18CAF41904B9BD1510B1739062805@qq.com>
X-QQ-XMAILINFO: NJ/+omVLhVgasM8xrCwXqQLqxdfhOSMWAGMHYCh5/DRfXhjvY/sQ6rAgga8Kq1
	 e4Ng5wa1JQBXAFEgCvi8ESAnxyhDm7n293s4emhIlkUHGLfigrzv7rB2SNYNWFP8eMq2JbtxzUJt
	 WYSVkiAiy8lw9FgzIEHDF0WxsltFJ4NSBmbP9jN2XYcbW2dopnV9mOSxG9FcZcuM8n9jVrrmnL8/
	 ENOXFKlbCqfTWj0cqlyTvLKLR0JlhewOjfyFvyEXa6nFhTdKkwAxSC01rRnz2jOM1/2zGSzRO8fR
	 CaiN/zgaLNxwW3Ax+rsMcuKp7HtzbCKgnmbD7U6U4e7GpyjMUsx/j/jpmGXDSKQm9VEs8ynR+VxC
	 uWdlmKw2Xw5FrYOcOG2tYCu+sMmO0mnOMfLNL/o5ot02B5AkloCOFn9MoIb95q6zKUbFAvS3jn41
	 CbD8cwVpaG3g+bEu47S0Gshkb6FYrOa+K7Q+wXXKMjwWTobtK6poOBWpHELqfJm4OppdrUM3mHZP
	 8HL82EUbXxBFi8GZLpxEi8i83pVmd4ScQuYz7CxpppKRxB1QNFL3+xQoMHUPnGaeCE75BLKDGJkU
	 +qxoKhfVr2PjmyIE/anieLwxFu9ZloMB1DMvfIao1vebRxxfJCQ3wuoxEE2m/j9Zg/azlIqHYvGd
	 hRI4xNg6tXisFw4A979DxfEZiN31J3bpp6M2wesdhDSFBr6YmpOeBiC5tZUF85QDVUijWjyRFhya
	 G+9Iynryne5GLrvOdrsjlWJm03tZtOnYfRzsGn7RIlEjjryo3ZyhpjBNkXcb2+rUlML2gHV+OtO1
	 FY66QYbYk9bfieost2wl+SNugHcFYfDgU6/lsAJrQYKTnpsNlI+1Mg6LgYh0qR3sg7YqvjkoAymU
	 lyfSoMNQFmFO3isKQCVwh+tgkLtZmTJ11qGgp4I7QGrY8jM8jS9as8lSf0j+hCI0FpXd+sFnzGHg
	 dg83r41vCxHcJ8Yi7Lo9l7jgWKaqs4ssHfUUu7UCm25FhGEqtV4gDqZugPwXn2kpUgJTDle6c=
From: Yangyu Chen <cyy@cyyself.name>
To: conor@kernel.org
Cc: ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	cyy@cyyself.name,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	soha@lohu.info,
	twd2.me@gmail.com
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Date: Thu, 27 Apr 2023 20:47:18 +0800
X-OQ-MSGID: <20230427124718.239569-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426-porthole-wronged-d5a6a3b89596@spud>
References: <20230426-porthole-wronged-d5a6a3b89596@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_054747_353551_E10861C8 
X-CRM114-Status: GOOD (  21.04  )
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

Hi, Conor

Thanks for your meaningful reviews. I agree with most of your advice but
have a question about the code about checking the first 2 characters are
"rv" in `arch/riscv/kernel/cpu.c`.

On Wed, 26 Apr 2023 19:54:39 +0100, Conor Dooley wrote:
> > @@ -41,7 +42,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
> >  		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
> >  		return -ENODEV;
> >  	}
> > -	if (isa[0] != 'r' || isa[1] != 'v') {
> > +	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
> >  		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
> >  		return -ENODEV;
> 
> I don't understand why this is even here in the first place. I'd be
> inclined to advocate for it's entire removal. Checking *only* that there
> is an "rv" in that string seems pointless to me. If you're on a 64-bit
> kernel and the node has riscv,isa = "rv32ima" it's gonna say it is okay?
> Drew what do you think?

I think this code could be a workaround for running rv32 S-Mode on rv64
CPU without changing the DT, although the proper way should be to change
this field in DT by bootloader or any other software.

I have tested a simple rv64imac CPU core and left the `riscv,isa` string
empty in the DT and removed the above 3 lines check from the kernel, and
the kernel boots successfully, and using busybox as init is also ok. 
However, if this check exists, the kernel will panic at `setup_smp` due to
`BUG_ON(!found_boot_cpu)` in `setup_smp`.

I am wondering whether this should remove or add a more sufficient
validation. Although this function will not be called in ACPI as I
reviewed the recent ACPI patches[1], it will not be a problem if I submit
this patch for better ACPI support. However, If I just simply remove it
from my patch and submit patch v2 directly, the ISA string in ACPI mode
with all uppercase letters will be OK. But in DT mode, the kernel behavior
will accept the ISA string with all uppercase letters except the first two
"rv". Do you think this behavior is different between DT and ACPI can be
OK?

After some investigation, I suggest removing this validation since the
validation is useless for a proper DT and the recent ACPI patches[1] do
not validate the ISA strings, so we will have the same behavior between
DT and ACPI.

[1] https://lore.kernel.org/linux-riscv/20230404182037.863533-1-sunilvl@ventanamicro.com/

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
