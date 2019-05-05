Return-Path: <SRS0=/wdF=TF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF757C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 May 2019 00:38:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8035C206DF
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 May 2019 00:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/ewHK5R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8035C206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qSiaqOxeUA9IIoRN8/63QMn6i856FbMnFxwXY+sEL0=; b=e/ewHK5Rg+qO99
	mSCKjugt9w8K7L8rVjT07khz39NDkRPjrvmfnHhFQ6HS55qmJUJ5MHyaE0oDpIUVjPxOJkckHY7TS
	MlcZolQ8oezG6XFjpLZdba6Xf6EalTaiWr42w3bsv/KCqQUIsFLV8it2rykGSBTTm/7UXrPZE3l3W
	Atw41lJRzu+j+wiFO8Cp0+39Qg8tqnwguqwxidMTfTNztiMjgAmYiUx6d+gQGhET71gMHxkRKdrrz
	SPJcK8+BpmoFKxNlgMInVVRYqTQC1sHB6SWpA+CgRnDcX7dzMNhXYD9I+XbyY81RWD2SaKsgSTDNW
	gL9SN2D8M9TdoIFKm94Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hN5AV-0005Cg-3g; Sun, 05 May 2019 00:38:15 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hN5AR-0005Bv-OI
 for linux-riscv@lists.infradead.org; Sun, 05 May 2019 00:38:13 +0000
Received: from excalibur.cnev.de ([213.196.205.91]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MlNgx-1gtmE80RPp-00llXS; Sun, 05 May 2019 02:37:45 +0200
Received: from karsten by excalibur.cnev.de with local (Exim 4.89)
 (envelope-from <merker@debian.org>)
 id 1hN59x-0003eA-LV; Sun, 05 May 2019 02:37:41 +0200
Date: Sun, 5 May 2019 02:37:41 +0200
From: Karsten Merker <merker@debian.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v2 PATCH] RISC-V: Add a PE/COFF compliant Image header.
Message-ID: <20190505003741.xbhyxhb3yg4q2afm@excalibur.cnev.de>
References: <20190501195607.32553-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501195607.32553-1-atish.patra@wdc.com>
X-No-Archive: yes
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:sxTbgCJmLRiraLBFNTdNLGrOPVUH3uIGoJxJS1d4KvT2AdRG3CP
 ARmYczCeXzMQmYpQrL9iP4waOb8+b/S1pKzwMvIT1vRbx3Zg1iOg1pgbYcv6w/2itRxVRe6
 RcTOqmTdBN+0m7v+5KbOwmVqiCJYv8vWI0CtVjNX5RbGb58ISM5BClnrEEwNtVSOkRi+fex
 25t4rZamoBAz2EtVonjtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sMBAA9Hi7sQ=:Lyd/q7qOyI6Zbo9rgcHKZf
 t+fl5iINlqilHbEP7mylVippUEKJJdhqcLQsrcu8UehARi12ogvjb+O4aiVNt+zGeB56ebj8A
 r6AxtBBhpYbVP3zmwkaqS/xfmwZaIrE4kq0lW33CC3vlgAh0Uc2W0FJeRrPpK3MEZHZ9eAHUf
 BLKnChMHld1n8rYCKEopQ4JybcI+wYovMH9B012/eTsx736omXGhp5Zgg/SegqbQ/4RVZ5syf
 4GKqu0sP9BQ4sCH3XxqyF+aQfAg2rESLYmt4yf7/oYc4wHbq/NVQUXdYCBOfDJQ9VbHWJNZU0
 +RWOi+1WrmlZeoElSRu+Um9Ec5Wri6fR9b+MU0dwBzIq9P1Bcc6zB6N5co2q7+yMsy1jbISHP
 ELdYkg3KcT/vn3nrgTZyipeR5NaauKNl634Q2dSjvCV51LNC64tgLkY2FMzTFQXpzT3Lek4dS
 f+cqa9ob6eH+1aMq3KTGtc2dyXyRfTfqQZnty8M+9b8wUKW2R8LiC9BOmWzMC5YSeoAu+m6dX
 K1cr22X520Uis+jeREf9+KOVl0BBw7U1YlTuH05vqSM/7BqS8t0NkQJ0ruIQ+7tK5ITp3/Pz2
 /LNCPjLRsbKMr5ukKB66jqyHmf79wROLWRusWdLYxiiM6muoMxvuvCVMb7JwaA+YKQ5gELwbV
 ZUMPuo/x3j5C0AWmrl31q0ZBaHciLjG9WNMS6P4zitGrDu8AFhZFbe+pi1pQY9XszdvK8QWDo
 36ZlhDFuRkFgHTVC9sI9DZiPuY1pnudvQqORng==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190504_173812_095927_6C2308B0 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: mark.rutland@arm.com, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Zong Li <zong@andestech.com>, merker@debian.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMTI6NTY6MDdQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cgo+IEN1cnJlbnRseSwgbGFzdCBzdGFnZSBib290IGxvYWRlcnMgc3VjaCBhcyBVLUJvb3Qg
Y2FuIGFjY2VwdCBvbmx5Cj4gdUltYWdlIHdoaWNoIGlzIGFuIHVubmVjZXNzYXJ5IGFkZGl0aW9u
YWwgc3RlcCBpbiBhdXRvbWF0aW5nIGJvb3QgZmxvd3MuCj4gCj4gQWRkIGEgUEUvQ09GRiBjb21w
bGlhbnQgaW1hZ2UgaGVhZGVyIHRoYXQgYm9vdCBsb2FkZXJzIGNhbiBwYXJzZSBhbmQKPiBkaXJl
Y3RseSBsb2FkIGtlcm5lbCBmbGF0IEltYWdlLiBUaGUgZXhpc3RpbmcgYm9vdGluZyBtZXRob2Rz
IHdpbGwgY29udGludWUKPiB0byB3b3JrIGFzIGl0IGlzLgo+IAo+IEFub3RoZXIgZ29hbCBvZiB0
aGlzIGhlYWRlciBpcyB0byBzdXBwb3J0IEVGSSBzdHViIGZvciBSSVNDLVYgaW4gZnV0dXJlLgo+
IEVGSSBzcGVjaWZpY2F0aW9uIG5lZWRzIFBFL0NPRkYgaW1hZ2UgaGVhZGVyIGluIHRoZSBiZWdp
bm5pbmcgb2YgdGhlIGtlcm5lbAo+IGltYWdlIGluIG9yZGVyIHRvIGxvYWQgaXQgYXMgYW4gRUZJ
IGFwcGxpY2F0aW9uLiBJbiBvcmRlciB0byBzdXBwb3J0Cj4gRUZJIHN0dWIsIGNvZGUwIHNob3Vs
ZCBiZSByZXBsYWNlZCB3aXRoICJNWiIgbWFnaWMgc3RyaW5nIGFuZCByZXM1KGF0Cj4gb2Zmc2V0
IDB4M2MpIHNob3VsZCBwb2ludCB0byB0aGUgcmVzdCBvZiB0aGUgUEUvQ09GRiBoZWFkZXIgKHdo
aWNoIHdpbGwKPiBiZSBhZGRlZCBkdXJpbmcgRUZJIHN1cHBvcnQpLgo+IAo+IFRlc3RlZCBvbiBi
b3RoIFFFTVUgYW5kIEhpRml2ZSBVbmxlYXNoZWQgdXNpbmcgT3BlblNCSSArIFUtQm9vdCArIExp
bnV4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29t
PgoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBLYXJzdGVuIE1lcmtlciA8bWVya2Vy
QGRlYmlhbi5vcmc+ClRlc3RlZC1ieTogS2Fyc3RlbiBNZXJrZXIgPG1lcmtlckBkZWJpYW4ub3Jn
PiAoUUVNVStPcGVuU0JJK1UtQm9vdCkKClJlZ2FyZHMsCkthcnN0ZW4KLS0gCkljaCB3aWRlcnNw
cmVjaGUgaGllcm1pdCBhdXNkcsO8Y2tsaWNoIGRlciBOdXR6dW5nIHNvd2llIGRlcgpXZWl0ZXJn
YWJlIG1laW5lciBwZXJzb25lbmJlem9nZW5lbiBEYXRlbiBmw7xyIFp3ZWNrZSBkZXIgV2VyYnVu
Zwpzb3dpZSBkZXIgTWFya3QtIG9kZXIgTWVpbnVuZ3Nmb3JzY2h1bmcuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
