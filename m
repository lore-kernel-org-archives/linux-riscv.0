Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDC0C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvMYPDLamTg54G8paYY+u8t8wZW04XEo2siioPchhvs=; b=dtY18zwC2yXztT
	pkgvohRzYVwUIJ2OAW/QJocEKw4sqovcJAdikmGSD97pefBMHejEwMOH/7aNmFbYclKuScmPO+QoP
	xThPHqx2loA/Llj7+GagTyC/Z2Mk/62zP6ERo6VRK+uZpyW9fV6IEJljtjFJj6SBKfs99tJRz03uZ
	WwXLJ5mU+L5gFlz5fLDWP5SDfct0hjUeSD0OJn1tonNswLUOC88BX8W4auNIAmpBcXfuuBklucZMC
	pneRDFzksDJ9irows0H9mv3mgk5e5KEjNUmB3qQWE9NUnEYk4rLj77jQZNXHSEQzktxJw5BN/AiIn
	pd9/q09tXGTdF11e6PJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oPm-000000046Fm-1dBN;
	Mon, 21 Apr 2025 10:30:14 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oDB-000000044mh-3jlM
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 10:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745230614; bh=uMEDAIJKgdn3nU1kFSVUwatOowWRY5Q6GYnInvNYP5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a3Gzd1uN7rosQwa/uMpKo4f7ZbGsi1y57qYKWYOT0rOs55zdDgkIclw6wREbRyqa0
	 nTutx0QCSW0lJ6qC+N1ktTkgB8NNhZ0hUPeHKv5Lnkr9zmod4FG8L//WTNo27ubpn1
	 ZNdSljNQsrDgprE11UJzZ/94I5EktM8KF9eHXM3c=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 41B23877; Mon, 21 Apr 2025 18:16:27 +0800
X-QQ-mid: xmsmtpt1745230587tp74gul55
Message-ID: <tencent_0E5DE0122D64CFAD35F51FC3B3433BE94F06@qq.com>
X-QQ-XMAILINFO: NJYJgedmaB0kBtBBkNR9QDgomEawmQAcHUG5e+2Vo/YfAYcOpU9wgiTRHyWc/E
	 TZh5Ka3dz61Qx5UHihaUJfFBowv/+j+fRuyLZz/jlfZci4WInTFEzUsAkzLuuY2tSamMO3ICKG1A
	 xdRkvX7BfKc/QmpW+MYkSXMOgSm6hi+6nzN9hc3rrVA9xWCmYwPvR+JEdmkRvoxkfe7M98QRqhba
	 Jz0kFZ/yQwICeRLRJeSiqefD6mw+oOUoaL/TN+Jfhlj2WoGaFuLBvWHi5uuvxevCl4XP7GSWz5kk
	 eH+h12Xoa3Nd/PKxzPXFD1Jab3Y3vCqs4ju18pl0fMlUgb7Af5uD/9F+BXqoyO2DdbzfS8HHBOIc
	 w6JrgWCNAR3KRxe8n1m1YWgDAAe+9O6J/WVchDcQd1C1nISFNy574+xJXSNl5WIfIWgA3Ovk890N
	 MwTcXRB6qz+Rv+QBjgTLC0HPoOawO46f3SZKhBWa3EhllxgSv8tOkPLCrKdADIhMypkFRJzCme/c
	 mIDBPk7mCQoFsbbFmIclPml7pefqzyl2PY6+jd28DPNqfm0KrrxYVsb6bh/IYFDi+jgkKmsnqt1U
	 nqK2lwF2lHFZ7v4+CIemhIYlcNkzQYEfhdEDXPNVE8YICRDjnE3B3YIlJTt7B2QXja56pt2BsYJ8
	 1iZAlwlBmJHrQA8XI54Rf2Zn/QP8Z+CwiCcs2kSbHe+TIM9kimhhh+uooiyX+gpEjH3h8yJxSu2F
	 huH7/OpfcxXbLw/fAbBq55aWb5V0SQmXUiJtfwmhXo4yzAu3EyBc9a8a6NUl4+qnEXXzbMKu7im4
	 3WzfsKiA6JxJdTTtzv2veovobj9DBJyoMHEQwCSeeTUuBeXGlQiDYOWkejJQSsiaagf+prRd79Vf
	 zrwCnu5UySpp2G3NIVCjdw0D7DdEylH0AlMNCU43QjNU5YjIo7fCpXlTW5nmcPaQaIl3sb5jy68Z
	 WGfhj1x8+KtXmWNLzblp/YsQFetTAmNkFCchwAEABrE4SHMurphmtuHyhjAaKC
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Yeking@Red54.com
To: alex@ghiti.fr
Cc: Yeking@Red54.com,
	aou@eecs.berkeley.edu,
	dmaliotaki@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mick@ics.forth.gr,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH] RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Mon, 21 Apr 2025 10:16:24 +0000
X-OQ-MSGID: <20250421101624.40970-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4b2a6bf1-3642-431b-bb74-3aeae79d17d3@ghiti.fr>
References: <4b2a6bf1-3642-431b-bb74-3aeae79d17d3@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031714_774624_35156F05 
X-CRM114-Status: UNSURE (   7.03  )
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

LoongArch (merged):
https://lore.kernel.org/all/tencent_7FAF68BF7A2EAD9BFE869ECFDB837F980309@qq.com/

RISC-V:
https://lore.kernel.org/all/tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com/

PowerPC:
https://lore.kernel.org/all/tencent_6E57A00F6D56CF8475CF9FD13370FBC1CF06@qq.com/

SH:
https://lore.kernel.org/all/tencent_40B6A6E7C79AEEEFEC79A07DE00724909A05@qq.com/

ARM (rejected):
https://lore.kernel.org/all/tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com/

ARM64 (rejected):
https://lore.kernel.org/all/tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com/

Russell King (Oracle) wrote:
"
ARM gained support for CMDLINE_EXTEND in commit 4394c1244249 ("ARM:
6893/1: Allow for kernel command line concatenation") dated 4 May
2011. In this commit, CONFIG_CMDLINE _prefixes_ the boot loader
supplied arguments.

In commit 34b82026a507 ("fdt: fix extend of cmd line") dated 13
April 2016, which _post_ _dates_ the introduction on ARM, and the
commit even states that it's fixing the lack of appending compared
to ARM, this adds code to drivers/of to _append_ CONFIG_CMDLINE
to the FDT arguments which come from the boot loader.

It is DT that implemented this wrongly.

No, we are not going to change arch/arm to conform to something
that was implemented in a broken way. drivers/of needs fixing
to actually implement it as it was *originally* intended - and
there is five years of arch/arm doing this *before* DT started
to do it.

If drivers/of maintainers also don't want to change, then I'm
sorry, but you have to then put up with the fact that it got
wrongly implemented by drivers/of and thus has a different
behaviour there.
"


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
