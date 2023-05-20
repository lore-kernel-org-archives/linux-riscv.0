Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBB4C77B7F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zw+MdVqQwnB6woJKANRPD340yhRV/NYopOHiiNJkvqA=; b=gYYROSUFZGyKFI
	9GSaHuG6OWz/pRMm8eqCNsuq7e+qZjAsCylhirYRCl4sXWRkHZHo6Mtja90abOE9OJjIE1Kr1QkdM
	N5Bhe+Ut84W3pu31RxPGXERpMMqxAV6Ni/+IPXnUA8QXcMddU/348QR50jOECT/wjx4QpA/ZlDEFq
	FuUGwd4POfRuSYXmzFWBc1rjnPMsZ5uh97eXpCxD3PVYImhfnXSSHG2KUxmG2PsR3Mee2XiH5SsZn
	UmeaeieBCdsR83aznn+q+izlmLS+7710Tfym2tTBasKq4TFcMlKq8+EKTJoXTY0n66Ga71ZC7ZSyl
	/wUMOw1afD4ocsCnpIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0IIn-001225-0I;
	Sat, 20 May 2023 08:51:01 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0IIj-00121Y-2G
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 08:50:59 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34K8oqrM027225;
	Sat, 20 May 2023 10:50:52 +0200
Date: Sat, 20 May 2023 10:50:52 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/nolibc: riscv: Fix up load/store instructions
 for rv32
Message-ID: <20230520085052.GC27206@1wt.eu>
References: <cover.1684425792.git.falcon@tinylab.org>
 <1425d092ef4c1242646ede2bbcbc3ac945c2b274.1684425792.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1425d092ef4c1242646ede2bbcbc3ac945c2b274.1684425792.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_015058_028417_DDB6C409 
X-CRM114-Status: GOOD (  10.68  )
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

Hi Zhangjin,

On Fri, May 19, 2023 at 01:02:12AM +0800, Zhangjin Wu wrote:
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/arch-riscv.h | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

I'm having a comment regarding this one (which for now I've queued so that
Thomas can rebase his series), please provide a real commit message that
explains the purpose of the change and the solutions chosen. Feel free
to copy-paste from your cover letter if that fits, it's just that I do
want to see some justification for a change in the commit message itself
(i.e think about the poor person seeing a bisect stop on that one).

You can send me a paragraph or two and I'll happily copy them into my
local copy of the rebased commit.

Thank you!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
