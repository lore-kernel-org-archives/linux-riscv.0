Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C47E109C059
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMiIlP+Fe2QEqyPb4Emv9PSIL/JXiKmoEabq3hil4m4=; b=QIYKIloXXOIxnk
	u5eVp0G0ehNWfqeuixqxd2C523iTNHX3sLEWRt3EqzyH/BykfeahUyBuhkkigsgoB0A1RTPDSvjyh
	vO5sDcfHmRJwT8U5SOI5yFutB2Ye0v9qGa6ahRkdIiJQ2jGS+YJXowheXbTLNTTSCW/0NWLiVTdGK
	4alQR9z0CwAq5vXsWHAZXR+UWbMDm0r1XlSqpjnqJ4mPFcPaLbTxpSd1wozmuONEP6Hu/op7hcnyF
	GGarHsh2AkFNeRTuUn0TfzuM+iK0TQfzKEw4kByy31hLHOed8zj+xt2FMb1zLHD7JG/5B2uMSVipp
	5AcixD8h/7l1u5eRtFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TPt-00000004714-3MQZ;
	Wed, 25 Mar 2026 18:57:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TPr-0000000470l-2Tlf
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 18:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8296E436EC;
	Wed, 25 Mar 2026 18:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFE9C4CEF7;
	Wed, 25 Mar 2026 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774465038;
	bh=EzSTivZZHEFsqJJhQ/mrLHqvwiue3C8Av7gGjfmrF68=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uoRxIIT1z5Yyy21LFfjXSVFT31PKw/1MTkiaBWqKR52dlPT0+Ac+RNfOydlnGFb4G
	 eCEd4iK/5wqSG2rg4+BBZgUHP0T3Va0DYhiA5BgOkW9GXUbeJ/3eARGF90VrqJNG4j
	 BIQ3wghBap+eFg0QQx9Q7Ey39KrVIcnmgJ21epVplStFxm4f/U64j9p01dzaQ2Jqei
	 SZrBfK3EzX2iAFDelgqQHnZRBxbQONLoAYR7Rwk5k6BHb6glbMd+EVmcEZUQ150fij
	 Em/gKXQLoR3a5E2EuDhPpXSHH7dqPaUaxS5DQaLGoSsO1FVdrAGVncWSXcibcK6LHv
	 KzILUX7kL7h1w==
Date: Wed, 25 Mar 2026 12:57:14 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zishun Yi <vulab@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
    Thomas Gleixner <tglx@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Nam Cao <namcao@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
    Simon Schuster <schuster.simon@siemens-energy.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set
In-Reply-To: <20260322160022.21908-1-vulab@iscas.ac.cn>
Message-ID: <d0a66d50-cfa8-2260-2185-12c945c8e6f2@kernel.org>
References: <20260322160022.21908-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_115719_671374_9A970837 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, 23 Mar 2026, Zishun Yi wrote:

> In set_tagged_addr_ctrl(), when PR_TAGGED_ADDR_ENABLE is not set, pmlen
> is correctly set to 0, but it forgets to reset pmm. This results in the
> CPU pmm state not corresponding to the software pmlen state.
> 
> Fix this by resetting pmm along with pmlen.
> 
> Fixes: 2e1743085887 ("riscv: Add support for the tagged address ABI")
> Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
