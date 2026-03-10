Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506DFFCC9AF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 03:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyLC1kbpkqT/sn0Qwwt9h11o5jNHV8Xq0Ozq5Z7LnHE=; b=inrvrK1gPkgF7A
	VPAqa0AOzb/jQV/fYHlqTmQpnakTr9VSILw6ABz1YRfvE39d9AD8WnSFdkTxgTLnWg/XKG0vCoXux
	lPy2I+oX+7rKmNi3uBgQ3MJgP/fVdcf/vHsZiNv703PpTO5aBHGo+1geq6IOngrpqYmNFDHtZMbJA
	iDb28101LzdROGvvyzXzametBht64Gsqo5FyxAhBLS/K+FnRMyJnOSEEiCW0Van7Gh/b5FZWYmMbD
	ORDO3bdjn+S+h3FQgCMWXozUuLGuLC+SLxmp+QbA6eS2KGAtbAd7QVrNHawKyLbIqCa+mvxON3Q79
	72sGrtjOexh+E7ZZi95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzo7K-00000008gGE-21hN;
	Tue, 10 Mar 2026 03:50:46 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzo7H-00000008gFW-3pCP
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 03:50:45 +0000
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 3C1951A043F;
	Tue, 10 Mar 2026 03:50:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 78DA21D;
	Tue, 10 Mar 2026 03:50:36 +0000 (UTC)
Message-ID: <45f1347b4738e1ac77d6847000d6c609da94fd46.camel@perches.com>
Subject: Re: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
From: Joe Perches <joe@perches.com>
To: thecharlesjenkins@gmail.com, Shuah Khan <shuah@kernel.org>, Paul
 Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sergey
 Matyukevich	 <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, Deepak
 Gupta	 <debug@rivosinc.com>, Kees Cook <kees@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 09 Mar 2026 20:50:35 -0700
In-Reply-To: <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
	 <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Stat-Signature: u193rprgjo7r93buudfppys8kyybw38e
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 78DA21D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+KGfyI8RkAuQVljT1LKgxF1j0M9vsA+Ww=
X-HE-Tag: 1773114636-622055
X-HE-Meta: U2FsdGVkX1+l88962NQxhoMCTggFAT4zW9tz2CSvpJfh8DtT37gahn5IelQZmitPhxpfAzl4lOOE7eoTuyIYx9necZg+hy+/LKJEQG9utTt1yi0MsabMAXDslf6+g/hZ44jjgyb6ks9J0JBRR4T7sVrjxpNouhoXkfqhA3v/wtfRX4sTyZOU7uzhOdfBrQczfJSvoKS2MgniYLF2Wrs2vjevNYA7DdJQfkymxpuKjtywIWTXbVDQahZp7Zk+NtFKW/LvTrdaIFY0HDqYCDpuL9RJkPfHrdHyJoEa5k30kNQZM5GXt0IC5VY7GcCZOOjIVg7yqypXjdNh6Mw+CARknZ7cK1ue4cUq7sBajnL03xfoLShetRzNyg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_205044_023516_56126041 
X-CRM114-Status: UNSURE (   9.68  )
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

(adding Kees Cook as he originally submitted this __EXPECT macro)

On Mon, 2026-03-09 at 18:52 -0700, Charlie Jenkins via B4 Relay wrote:
> From: Charlie Jenkins <[thecharlesjenkins@gmail.com](mailto:thecharlesjenkins@gmail.com)>
> 
> EXPECT_EQ() expands to multiple lines, breaking up one-line if
> statements. This issue was not present in the patch on the mailing list
> but was instead introduced by the maintainer when attempting to fix up
> checkpatch warnings. Add braces around EXPECT_EQ() to avoid the error
> even though checkpatch suggests them to be removed:

The __EXPECT macro definition is a multistatement
	"do { ... } while (0); OPTIONAL_HANDLER(_assert)

Perhaps the multistatement __EXPECT should have another
do {} while (0) around both statments like:

	do {
		do { ... } while (0);
		OPTIONAL_HANDLER(_assert);
	} while (0)

so if else blocks without braces would work.

Perhaps the same for the __EXPECT_STR macro definition.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
