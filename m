Return-Path: <SRS0=MzJO=NO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94284C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 12:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F75A2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 12:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t+1A0Y1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F75A2081D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwWCXrz/3dFyCTivV9HSsZ6HiEK2ZDEevvcPzGdQ/OQ=; b=t+1A0Y1Go4e/AB
	jHX77o2NGZaVUM1eLE0iF5+cvp+gcRy1PA90aCUITqbNxFI9slfcwS0O/HYnmx8YwbjR6YecwkGNK
	2EeeWMFqJMAIkCh911V2zPqYbBJ1gF3cg7r5uzOTOtteulSjBUUtx95UhTa9AKd0ILm0Ai6X2NgoU
	hhSXL+q4gvlbcY3ErYLes+If5fUHFlh8kfhKxBMen2RcSSRi/B1ycTbeupDiVksRmMdeeRDcWXjpR
	39HIlaj0niTaH/l0B+pEZUpgQ38aHjZdpF8RkKfIs7zue67t4q8LWaZtIeQ3Vb3R65NsbCNMcX+Sc
	4o7XlaXN3cNN+zaogdaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIvQp-0001ua-LO; Sat, 03 Nov 2018 12:53:39 +0000
Received: from mout.web.de ([217.72.192.78])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIvQm-0001t8-NK; Sat, 03 Nov 2018 12:53:38 +0000
Received: from [192.168.1.2] ([77.182.136.36]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MWj6V-1g3sYm0dBr-00XxSy; Sat, 03
 Nov 2018 13:51:35 +0100
Received: from [192.168.1.2] ([77.182.136.36]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MWj6V-1g3sYm0dBr-00XxSy; Sat, 03
 Nov 2018 13:51:35 +0100
Subject: Re: [PATCH -next v2 1/3] mm: treewide: remove unused address argument
 from pte_alloc functions
To: Joel Fernandes <joel@joelfernandes.org>, kernel-janitors@vger.kernel.org
References: <20181103040041.7085-1-joelaf@google.com>
 <20181103040041.7085-2-joelaf@google.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <fd939e7c-3d9e-760e-f20c-e7263f064153@users.sourceforge.net>
Date: Sat, 3 Nov 2018 13:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181103040041.7085-2-joelaf@google.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:VsFj7PZvXTuItJtMK3DaoKAJBuiK9mXpGGY5+klibNLoFdxoEfJ
 LMXp3e5QGQjzwTHhuzc7WT6CSt1cWmztVsZoA0YtitXFQxXGg/1sFxtK/3NTNTBkQAE/vLx
 yfH10rM+HaCfDwS1a7MSrlUZRz1cWjsl+WROQOVkuX2Uyl621tQOWWcYzEdwOCFSZeezRw6
 yD79guZzI267srJxDvn3Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:1lqYMjBjtvM=:9WWP2ekn7iGjSIrji6zHLJ
 yBNKkUboO37rsUnXH2Hg1Nez21TNcgKLqB+iEAXeFxsuUWND5iqNTOV0f7iUhZ8LCVGERjosH
 eV3EIcmUs352FIYVcIl9pyl5kGfhyW9CVAKKA3Vtl3fCIVS0h7AUC/CRFfSTYRrqquFdLKY+D
 YY9tBgmKF4RLAo2VV77L0kpvX2Ex/oBUWcqIyxWKJbUKK+4M0oO4Hd1GX9jVpKEDNTzw9Mgv/
 7EcR7oIz4ZDbZIFAHhOkcxazCVjpGbsUt/2JruOkxclbJ8fM4SI/vREdND1Uu+RHQRIfr2h2g
 mvfANVUd2tKA7k1bjCrXUAyb6wb7lYUJR0j+OfLb3pMP/MTXDfpEfncDaW8uY1XIXYsPvgTms
 EpzszDs2kayp8qWmLSvYCtQOWJOBcm1YY61+mraL5tDhBLDaUmh+4KT6vr+Jh1K7kce7R05sE
 dcd8zBw+xXnrI9S0EB8blbb0HUC4VPSKqqDOpIqDlvxsduQE50MQpPbW2a8qQxsvmsh7DxHCG
 VgfYc7FNJpmIqqHy7PsbXSvsbY5CafBpbVG7PSxhOJkq7zcSNFUCySNea//ZYJbaJJilfhaRJ
 wpL6cKkQwaZzhNtfD2PEARWGxTRoJm7JVowCVrTOL7vPSSN1l9lqiKL45tT215MR9ACy9gWy4
 WjD8wcPjzKhPGyVZnegCom/pq3DYdY7Tm85VUpRHx7+4r/fv+iFVTEJ4ctNFSr6k0fSLVHrqL
 BoXtVj57lGWnx+igC+B3hHR/etawYfDXlpsvl5UPntkjZW5FyR7g3yQ05ThLCPg7UN2/gUt0k
 qV43NQj/N7LVgEkDDFH/sDs2unxECJIZFw/iKaEWlOlOEVoiv4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181103_055337_064831_0E4D2FA3 
X-CRM114-Status: GOOD (  11.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Lokesh Gidra <lokeshgidra@google.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Anton Ivanov <anton.ivanov@kot-begemot.co.uk>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Daniel Colascione <dancol@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>,
 "James E. J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, pantin@google.com,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181103125120.ARs5Xv_xU9FtZIWGVELXUc4d8pU-HLtWHniyQXosz4M@z>

PiDigKYgVGhlcmUgaXMgY29uY2VybiB0aGF0IOKApgoKRG9lcyB0aGlzIHdvcmRpbmcgbmVlZCBh
IHNtYWxsIGFkanVzdG1lbnQ/CgoKPiBUaGUgY2hhbmdlcyB3ZXJlIG9idGFpbmVkIGJ5IGFwcGx5
aW5nIHRoZSBmb2xsb3dpbmcgQ29jY2luZWxsZSBzY3JpcHQuCgpJIHdvdWxkIGZpbmQgaXQgbmlj
ZXIgaWYgcHJldmlvdXMgcGF0Y2ggcmV2aWV3IGNvbW1lbnRzIHdpbGwgdHJpZ2dlcgpmdXJ0aGVy
IHVzZWZ1bCBlZmZlY3RzIGhlcmUuCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTA2Mzc3MDMvIzIyMjY1MjAzCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4cHBjLWRldi8w
M2I1MjRmMy01ZjNhLWJhYTAtMjI1NC05YzU4ODEwM2QyZDZAdXNlcnMuc291cmNlZm9yZ2UubmV0
LwpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2xpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnL21zZzE0MDAwOS5odG1sCgoKSWYgeW91IGhhdmUgZ290IGRpZmZpY3VsdGllcyB3aXRoIHRo
ZSB1c2FnZSBvZiBhZHZhbmNlZCByZWd1bGFyIGV4cHJlc3Npb25zCmZvciBTbVBMIGNvbnN0cmFp
bnRzLCBJIHN1Z2dlc3QgdG8gdXNlIGRlc2lyZWQgZnVuY3Rpb24gbmFtZXMgaW4gU21QTCBsaXN0
cwpvciBkaXNqdW5jdGlvbnMgaW5zdGVhZCBiZWNhdXNlIG9mIGRpZmZlcmVudCBydW4gdGltZSBj
aGFyYWN0ZXJpc3RpY3MKZm9yIHN1Y2ggYSBzb3VyY2UgY29kZSB0cmFuc2Zvcm1hdGlvbiBhcHBy
b2FjaC4KCgo+IC8vIE5vdGU6IEkgc3BsaXQgdGhlICdpZGVudGlmaWVyIGZuJyBsaW5lLCBzbyBp
ZiB5b3UgYXJlIG1hbnVhbGx5Cj4gLy8gcnVubmluZyBpdCwgcGxlYXNlIHVuc3BsaXQgaXQgc28g
aXQgcnVucyBmb3IgeW91LgoKUGxlYXNlIGRlbGV0ZSB0aGlzIHF1ZXN0aW9uYWJsZSBjb21tZW50
LgoKKiBUaGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3VhZ2Ugc2hvdWxkIGhhbmRsZSB0aGUgbWVudGlv
bmVkIGNvZGUgZm9ybWF0dGluZy4KKiBZb3UgY2FuIHVzZSBtdWx0aS1saW5lIHJlZ3VsYXIgZXhw
cmVzc2lvbnMgKGlmIGl0IHdvdWxkIGJlIGRlc2lyZWQpLgoKCj4gQHB0ZV9hbGxvY19mdW5jX2Rl
ZiBkZXBlbmRzIG9uIHBhdGNoIGV4aXN0c0AKPiBpZGVudGlmaWVyIEUyOwo+IGlkZW50aWZpZXIg
Zm4gPX4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYXZvaWQgdGhlIHJlcGV0aXRpb24gb2Yg
YSBTbVBMIGtleSB3b3JkIGF0IHN1Y2ggcGxhY2VzPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
