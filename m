Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83CBC71122
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 18:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A91A220835
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 18:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZSsOJkgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A91A220835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkB8zUNwxUo6z3dXZ3XDvjgQTyPxgNE43kTbfOKKlKg=; b=ZSsOJkgZLNqO0y
	yHjBjycPb59XcqbocGjMUO6WSiUU0zxZATVuGoVmQaz92HnhskBbwPynobNBYRO3xsMVE4d2cvVHU
	UQpOIuaEVmjgLLTJTdZRQV7tD0EZC/Y+SrzWbYMsnOHf5Zqt2Sqju2xCYQ7xT6pjodx2rXWlo1r2V
	UfiIyLEggIfzq/SnedbILEyJ0mzTvlvrl1SwFwTQIUDWGuHx9estfWpXiU5ROKrA9M5+GC3CE+BaS
	YpI4fwT7N1//jWqyHugpXCD3XEXGttZfC9JTlReKG0v398mxoHqrVVSWHV+5zfgSvD+78ECxaUL0f
	3xrKMcWI/kdYfW9R48lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB2Za-0000BR-2J; Fri, 12 Oct 2018 18:54:06 +0000
Received: from mout.web.de ([217.72.192.78])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB2ZU-0008QG-8B; Fri, 12 Oct 2018 18:54:02 +0000
Received: from [192.168.1.2] ([77.182.238.221]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M6V1T-1fRTIY0mGx-00yNhT; Fri, 12
 Oct 2018 20:52:01 +0200
Received: from [192.168.1.2] ([77.182.238.221]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M6V1T-1fRTIY0mGx-00yNhT; Fri, 12
 Oct 2018 20:52:01 +0200
Subject: Re: [PATCH v2 1/2] treewide: remove unused address argument from
 pte_alloc functions
To: Joel Fernandes <joel@joelfernandes.org>, kernel-janitors@vger.kernel.org
References: <20181012013756.11285-1-joel@joelfernandes.org>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <03b524f3-5f3a-baa0-2254-9c588103d2d6@users.sourceforge.net>
Date: Fri, 12 Oct 2018 20:51:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181012013756.11285-1-joel@joelfernandes.org>
Content-Language: en-GB
X-Provags-ID: V03:K1:kL1jfGghCfX5IqF0iVRDf8mQoouSapQgO45dI9woF05xgJDfw/d
 AA5sy1osx5PoQoz8e05NX77GNXJPHw9DPR0si3tMAft3cP3Og/UHQyAFEv44VXROloUsniB
 Y8tHxhnCqGSXk3sDOvyIeh0eyIwAL0z+iO5ZuRU8MJFacaGuv/K0/oO3MnIdqboq2zbaeLx
 atswja9Z0HU2X9bmK8r2Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:VYhd+82Fahk=:8qKapuTAK9PGC3QZTGFm93
 Cv2uqZ6//UeJGJZRMh8t6n/D607bhM1JOv0wjRaxbPn/FW+RXDkMkih/t/gcO0hiGvN00WxSH
 IUOZ5UtG4kENR0gAMawuKNvB3LYcHHG1grcbSDqQP/BP66NmXdnncdyC/Fje3KSEJqrBsRHgS
 flHBVB2rkw+Sy4wZAzvjDgK9v1jeeixWlZcCGq1hd6V8ua/ZFailYZ5twLThZPB30GH0alEeN
 4BtcuJtue0qkcUIWFRl1hmdRR5yZvHjT9G3LVxNawPDJYbR2E/TSC2W1COIT8+YT5YBMm0Fxv
 CVCdMWpPV1NaDj8bAFDmchFSwtoFeQlsxVrDtyH0gnZIAcDL1j4j4uaSLVIWcBXN5rhNFjK9H
 3NwtAoLBOLVGX9Ls6HdRK6GTJaYuo5EsxJI16AX32mKNB++RlDhqyr7bqfkkb/WqHXKs3eOTu
 c8F8lqPWVCFAApAGqYnH9taUkWETaXUpGv5nUcYPfjs4TbvOf7jgv4u2azPEp6x+w1COYQJo7
 p13QwmpRRaU/KPxmSbvhunzILyYWG1dQCFpQhDnbuYICSC2DtHVit2NMrNANj+BTHJ4SCceSi
 jTT9dKo7bVCOEQXehz7gqeY5s8xdjd8k+jT4gurpwowY5OZKnVS/YEw7tIuTSEOGTzURUzy9C
 kgRV9hC2Zaqx2MJYmkpaBJigq+1QkIcVVkao5vfZ7Aku6ztfDwqaN8kp6lTzAFV5YGDmPnfvt
 BNOLByR2sgQDnjzgmDIlkBLnLlcavYosoSLzlNhWeLW698K8b0Z67v3JhT9bQ9nF9ogTFxMZj
 +jTqXiDQcHh5AF+SdBNXVw6FkD2x241wRX0cbutTUEyrGYduAY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_115400_634434_21839213 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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
 linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Daniel Colascione <dancol@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>,
 "James E. J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, linux-parisc@vger.kernel.org,
 pantin@google.com, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012185145.ynJ0Wfne32FHI0mS-xap6pLGYapzF5esiNNi1no_oho@z>

PiBUaGUgY2hhbmdlcyB3ZXJlIG9idGFpbmVkIGJ5IGFwcGx5aW5nIHRoZSBmb2xsb3dpbmcgQ29j
Y2luZWxsZSBzY3JpcHQuCgpBIGJpdCBvZiBjbGFyaWZpY2F0aW9uIGhhcHBlbmVkIGZvciBpdHMg
aW1wbGVtZW50YXRpb24gZGV0YWlscy4KaHR0cHM6Ly9zeXN0ZW1lLmxpcDYuZnIvcGlwZXJtYWls
L2NvY2NpLzIwMTgtT2N0b2Jlci8wMDUzNzQuaHRtbAoKSSBoYXZlIHRha2VuIGFsc28gYW5vdGhl
ciBsb29rIGF0IHRoZSBmb2xsb3dpbmcgU21QTCBjb2RlLgoKCj4gaWRlbnRpZmllciBmbiA9fgo+
ICJeKF9fcHRlX2FsbG9jfHB0ZV9hbGxvY19vbmV8cHRlX2FsbG9jfF9fcHRlX2FsbG9jX2tlcm5l
bHxwdGVfYWxsb2Nfb25lX2tlcm5lbCkkIjsKCkkgc3VnZ2VzdCB0byBhZGp1c3QgdGhlIHJlZ3Vs
YXIgZXhwcmVzc2lvbiBmb3IgdGhpcyBjb25zdHJhaW50CmFuZCBpbiBzdWJzZXF1ZW50IFNtUEwg
cnVsZXMuCgoiXig/OnB0ZV9hbGxvYyg/Ol9vbmUoPzpfa2VybmVsKT8pP3xfX3B0ZV9hbGxvYyg/
Ol9rZXJuZWwpPykkIjsKCgo+ICgKPiAtIFQzIGZuKFQxIEUxLCBUMiBFMik7Cj4gKyBUMyBmbihU
MSBFMSk7Cj4gfAo+IC0gVDMgZm4oVDEgRTEsIFQyIEUyLCBUNCBFNCk7Cj4gKyBUMyBmbihUMSBF
MSwgVDIgRTIpOwo+ICkKCkkgcHJvcG9zZSB0byB0YWtlIGFuIG90aGVyIFNtUEwgZGlzanVuY3Rp
b24gaW50byBhY2NvdW50IGhlcmUuCgogVDMgZm4oVDEgRTEsCigKLSAgICAgIFQyIEUyCnwgICAg
ICBUMiBFMiwKLSAgICAgIFQ0IEU0CikgICAgICApOwoKCj4gKAo+IC0gI2RlZmluZSBmbihhLCBi
LCBjKUBwIGUKPiArICNkZWZpbmUgZm4oYSwgYikgZQo+IHwKPiAtICNkZWZpbmUgZm4oYSwgYilA
cCBlCj4gKyAjZGVmaW5lIGZuKGEpIGUKPiApCgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIG9t
aXQgdGhlIG1ldGF2YXJpYWJsZSDigJxwb3NpdGlvbiBw4oCdIGhlcmU/CgpSZWdhcmRzLApNYXJr
dXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
