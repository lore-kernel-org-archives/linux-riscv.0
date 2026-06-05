Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC40CD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUPxnEqrfX/mcLT79DOK1LT30TeegIwtrCC+NtupULs=; b=pC/OBPTW0EtxzR
	MDMfaQSyQiJQ9oAsXKC5Zpc3PurGb2umDQ4OxX6xPqi6Wz8LZuzRo5B+HraTsFa0duE4HgJDEpZJV
	ePNxnfiVlY5nxCaM0sNV/vTkp2cFVUUDec5ntyXcMq0XQel/bUUoXYAtXIGe0iuqy77gY0h9rE6EZ
	tYeUtMOk42t6jYpJY80VxlAtStmf6uoM++whLvZWMkVoZMcKwBQf4FwRk3BNgvZY2Vda+iiV00r2R
	VWa3SWrV5Ti5kPfjZVztueSffJtyg/3HwGaddqiC3CmsBjX5BbHxrn1Ptk+ALUqMg70m521l2LNxx
	dqQ5M92aCeUgDW/zD6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWCW-00000000nDc-0sqi;
	Fri, 05 Jun 2026 15:11:12 +0000
Received: from mail-108-mta253.mxroute.com ([136.175.108.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWCT-00000000nC8-33S5
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 15:11:10 +0000
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta253.mxroute.com (ZoneMTA) with ESMTPSA id 19e98566deb00067f7.006
 for <linux-riscv@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 15:11:01 +0000
X-Zone-Loop: f01e7c9986c1106cdbb28083ccebf9ad4d1ac30554e4
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vOOeEl9PEnfuR5KUMGDXPq7D3smUMqacba4j+2QN9u4=; b=ciSppfqQKYMgINTv3KkuFpXWXK
	Q75JJoFcYT0+oFafv4Hr/iZTRqPVEyveegSwbqiTko+ZHCM83EjKhKLQNcY4x7wNzMfb9VQ4y7Nus
	i8FsXQc57x5Jos3fLAYTOnlH46QzCctxvQI9YcZXb6ZQLK9bPrKboy3CvbvUYVGvYguqN++Ypf4Ys
	i31IDCnWalauBxhL6YYXpSywWzomMQUhrV5WVuY0aL4oZYr4G3BddonECEfSDNBDJ8wizA5AJN+Zw
	6SSOL3R8P/4bkzS+DSMxh0WZJxtQklzVhZ1N0oji3QBzBIRXSLRY/iFDFLIx/+ZQlejYG3HeKoT+t
	ywd/g4jQ==;
Date: Fri, 5 Jun 2026 15:10:31 +0000
From: Richard Patel <ripatel@wii.dev>
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cfi: reject unknown flags in PR_SET_CFI
Message-ID: <aiLm58Sjuj8XAaSF@wii.dev>
References: <20260518183918.322545-1-ripatel@wii.dev>
 <3f2d4628-a95d-89c3-2fd7-3e1a407d698a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f2d4628-a95d-89c3-2fd7-3e1a407d698a@kernel.org>
X-Authenticated-Id: ripatel@wii.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_081109_858782_91A20403 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, Jun 04, 2026 at 04:40:31PM -0600, Paul Walmsley wrote:
> Hi,
> 
> On Mon, 18 May 2026, Richard Patel wrote:
> 
> > prctl(PR_SET_CFI,PR_CFI_BRANCH_LANDING_PADS) silently ignored
> > unknown control values. Only PR_CFI_{ENABLE,DISABLE,LOCK} should
> > be permitted.
> <
> > This is a uABI breaking change (fails previously accepted bits
> > with EINVAL).
> 
> Thanks for the patch.  However, I'm not convinced that this actually 
> breaks anything.  The behavior of the interface changes when unknown flags 
> are specified, but I'm not aware of anything that relies on this specific 
> behavior.
> 
> Does that match your understanding?

I agree, yes, happy to rephrase the commit message.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
