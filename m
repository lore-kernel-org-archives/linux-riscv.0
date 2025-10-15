Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579A6CCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 03:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uS6oZgSUf/W1HzvNty8Z5ZHc6TY/FMMqgtcjyNErnA=; b=NN1jnoO5d6EvHF2vdaG9rT6HKW
	/RuZIkOCrM7NqSwweINjmoOurxcMubStldCqR9eJSX9rPWApVdBjijvuEYZBC0C0qK1SM00xqg+Md
	eMWrdOsY8aK8Y/2ZZYnlg0SqiyMNaMXw9ts2wYE3tjPPG2Cd478shCy+TpLStElV+p+d9SjgdcyLd
	nBSJfeDKo7kA36VQvO3P2dmEu63iSz4zUXgI8wESm3WtLfkQCD6XcVUaHWQXrVlydwvUJRQBwKIe3
	2daIDzwi+AgeyHb05FjFSbxaddQl8hxoSNnwGunC8MGoaXaDltifMSt2Cl4kgQv0g6lBK5rZxP9aF
	4+HMvksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8sKo-00000000MDR-0DoN;
	Wed, 15 Oct 2025 03:37:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8sKn-00000000MDL-056G
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 03:37:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D41AC601EB;
	Wed, 15 Oct 2025 03:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EF7C4CEE7;
	Wed, 15 Oct 2025 03:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760499471;
	bh=sWZ++ZKI5PvBaF1zudgHniT7o5gWllCQAH6AAoFLBjU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ct/h+jGWOlifGQ6fq1o+V+tzON7mkNfRACGz1ohUoU97OMlrm+ylzF/OBWCVpStEj
	 NW1RhRZRMdN/4K/7uU3+DhiMIDxtpnVbYdPDIAzOf2UlWsdVy6af03Hbee0y8jH+Yq
	 M2HzDjpZjVsQKFsFaPTmiJnvBXyyksAwHAkjzMwR3zXdeKUt0YLXKVnQy4qT46D0rm
	 VY5L4inWDW3x1yGp0fghQCxEkv3yRnvZNuSXe50UqVZUVIKVLnJYkIWSlY7aFf6CFP
	 rSHvcHnjz0ntM6PJNl4N0/anmwNkvCDwjd+Oc8PW7ZLh6Kk0PqfcCxybYCEWgH8k1X
	 td9zUXy2v4DEg==
Date: Tue, 14 Oct 2025 21:37:47 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>, guoren@kernel.org
cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    palmer@dabbelt.com, conor@kernel.org, paul.walmsley@sifive.com, 
    bjorn@rivosinc.com, eobras@redhat.com, corbet@lwn.net, 
    peterlin@andestech.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH V2 2/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE
 fixup
In-Reply-To: <CAHVXubgrbjHXAPSLjk6uZmUoa52fTYBvutk4q0GFYJPQ0swrGA@mail.gmail.com>
Message-ID: <6c45ed33-d6f8-d385-8b89-9caf2ec18c77@kernel.org>
References: <20250713155321.2064856-1-guoren@kernel.org> <20250713155321.2064856-3-guoren@kernel.org> <1cfdf6c1-a384-43ad-9588-284335d073f7@ghiti.fr> <CAAT7Ki9_Vm0+v9RHpa2w-Bg3agJy2Tp4d6+tcPJ=M7XX3GV-7Q@mail.gmail.com>
 <CAHVXubgrbjHXAPSLjk6uZmUoa52fTYBvutk4q0GFYJPQ0swrGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-522593608-1760499420=:3130946"
Content-ID: <8c856d3f-3e68-86e2-9afb-5e258ef191d3@kernel.org>
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-522593608-1760499420=:3130946
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <dec4a9d7-972e-6220-cb11-4e8c9ec5d42a@kernel.org>

Hello Han Gao, Guo Ren,

Sorry for the delay in responding -

On Tue, Oct 7, 2025 at 11:36 PM Han Gao <rabenda.cn@gmail.com> wrote:

>      This patch is included in the 6.17 merge window but not in the
> 6.18 merge window.
>      Is it possible that the patch was missed?

This was almost sent upstream as part of the v6.18 merge window, but given 
that it adds the ability for architectures to override WRITE_ONCE, I think 
it needs one more attempt at gathering feedback before we do.  I'll send 
that out this week.

thanks for your patience,

- Paul
--8323329-522593608-1760499420=:3130946
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-522593608-1760499420=:3130946--

