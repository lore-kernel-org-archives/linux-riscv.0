Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F89C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 18:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D988560FC4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 18:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D988560FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=etorok.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AfbmNluH97pUuG6WKkdkcsA7NuIt/5SCRWjtoOAwfg=; b=UqPU/lSbkI/9y5
	SCswdLnAVXHfAZOplW4zTudAqY7bhY1qMwqFYRorZZksRORP6wsjNSAnrQQWL4a1Q4noKtn/GYeYZ
	GExPWEaJYj+2msQxaEQrlojPNQVguBJH2viGlnelT4SMDxkw1B899+/+PpndQ12o5CrzccUtw4CcN
	qFMD5f55Y4OQ2m7RmgnFIBNwug+UR/aIX7n5i+wzyhhuPp9P0j47qhCxZXSrIQFVBN/9gUyzA2ALJ
	L96OEpu4L0dwPV5AVn+AU++14Lb+AUhE8+7ykkgKBvC6+IrBHUHNTf83B6w6PnHrkhEhapKmjM2+i
	wTaRl6Wqx8NsVC51FWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBLo7-007Bk4-Ne; Wed, 04 Aug 2021 18:39:59 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBLo3-007Bi7-A4
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 18:39:58 +0000
Received: (Authenticated sender: edwin@etorok.net)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7DA83E0007;
 Wed,  4 Aug 2021 18:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etorok.net; s=gm1;
 t=1628102390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psvfep6hWXjTVMEg9R5p4wT51NrNpB1sLwGhQXSzqDw=;
 b=Q7LWz1RD0AdsoypX+h4oLJqh1CCJ6rUYTXtpRTJHCY91sC8a8pcEpcObe/+HgwNL64STSG
 jiom2uGQ+/6ZmfEBL5jJwDI5wMO3h66btC4oXMjDkUDRxqtK4adVL8qHc8SbUgnarGrY4+
 8f/bWrOEEfoO2NEB2ESEHsdGPsUurNZyu5GM7QUlSHKT3HBbDVfamgqPh0leB0tTS1T94t
 wcU+iiaTxYUFaewCSO4p9JlJr3KOem+i9U4d/TvgtytXe38ejCucmB4GH8XepzLzUES8nI
 qlIisyy7t6s1pyM6f9JA0R0MJ1z6hTYuWSNfgbNYjgBi5glxD2SHY2FK4b/qbQ==
Message-ID: <fda2eff99e5727656a8c2de8d77b5d3afe1f336b.camel@etorok.net>
Subject: Re: [PATCH 1/4] tools/perf/arch/riscv: record registers needed for
 --call-graph=dwarf
From: Edwin =?ISO-8859-1?Q?T=F6r=F6k?= <edwin@etorok.net>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@redhat.com, namhyung@kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
 linux-perf-users@vger.kernel.org
Date: Wed, 04 Aug 2021 19:39:46 +0100
In-Reply-To: <mhng-3ff979c8-3e24-48a4-8a22-8aa3f14f42ac@palmerdabbelt-glaptop>
References: <mhng-3ff979c8-3e24-48a4-8a22-8aa3f14f42ac@palmerdabbelt-glaptop>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_113956_170699_41CD22DF 
X-CRM114-Status: GOOD (  14.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIxLTA4LTAzIGF0IDIxOjIyIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToK
PiBPbiBNb24sIDA1IEp1bCAyMDIxIDE2OjI1OjIxIFBEVCAoLTA3MDApLCBlZHdpbkBldG9yb2su
bmV0wqB3cm90ZToKPiA+IEZvciBsaWJkdy1iYXNlZCBjYWxsZ3JhcGggc2FtcGxpbmcgdG8gd29y
ayB3ZSBuZWVkIHRvIHNhbXBsZQo+ID4gcmVnaXN0ZXJzLgo+ID4gCj4gPiBUZXN0ZWQgb24gSGlG
aXZlIFVubWF0Y2hlZCB3aXRoIGEgdHJ1bmsgdmVyc2lvbiBvZiBPQ2FtbDoKPiAKPiBUaGVzZSBn
ZW5lcmFsbHkgTEdUTSwgYnV0IEkgZG9uJ3QgaGF2ZSBwYXRjaCAjMi4KClBBVENIIDIvNCBpcyBo
ZXJlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIxMDcwNTIzMjUyNC40
MDI0ODMyLTMtZWR3aW5AZXRvcm9rLm5ldC8KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjEwNzA1MjMyNTI0LjQwMjQ4MzItMy1lZHdpbkBl
dG9yb2submV0LwoKPiDCoCBTb21ldGltZXMgdGhhdCBtZWFucyAKPiB0aGV5J3JlIGp1c3Qgbm90
IHRhcmdldGVkIGF0IHRoZSBSSVNDLVYgdHJlZSwgd2hpY2ggaXMgZmluZSB3aXRoIG1lIGJ1dAo+
IEknbSBoYXBweSB0byB0YWtlIHNvbWUgdGltZSB0byBsb29rIGNsb3NlciBhbmQgdGFrZSB0aGVt
IGlmIHRoYXQncyB3aGF0Cj4geW91J3JlIGxvb2tpbmcgZm9yLgo+IEEgY292ZXIgbGV0dGVyIGNh
biBiZSBhIGdvb2QgYmV0LCB0byBkZXNjcmliZSB0aGlzIHNvcnQgb2Ygc3R1ZmYuCgpUaGFua3Mg
Zm9yIHRha2luZyBhIGxvb2ssIEknbGwgdHJ5IHRvIGVuc3VyZSB0aGF0IFJJU0MtViBtYWludGFp
bmVycwphcmUgQ0MtZWQgb24gdGhlIGVudGlyZSBzZXJpZXMgaW4gdGhlIGZ1dHVyZSAoSSB1c2Vk
CnNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgd2hpY2ggbWlnaHQndmUgYmVlbiB0b28gc2VsZWN0
aXZlKS4KCkFsbCBwYXRjaGVzIHNob3VsZCBiZSBvbiB0aGUgUklTQy1WIG1haWxpbmcgbGlzdCB0
aG91Z2gsIGNvdmVyIGxldHRlcgppbmNsdWRlZDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyMTA3MDUyMzI1MjQuNDAyNDgzMi0xLWVkd2luQGV0b3Jvay5uZXQvVC8jdApo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8/c2Vy
aWVzPTUxMTEwNwoKUEFUQ0ggMi80IGlzIHBhdGNoaW5nIHRvb2xzL3BlcmYvY2hlY2staGVhZGVy
cy5zaCwgc28gYWx0aG91Z2gKdGVjaG5pY2FsbHkgb3V0c2lkZSBvZiB0aGUgUklTQy1WIHNwZWNp
ZmljIHRyZWUgaXQgYWN0dWFsbHkgYWRkcyBvbmUKbGluZSB0byBpbmNsdWRlIHRoZSByaXNjdiBo
ZWFkZXJzLCBzbyBpZiB5b3UgY291bGQgdGFrZSBhbGwgNCBwYXRjaGVzCmludG8geW91ciB0cmVl
IHRoYXQnZCBiZSBncmVhdC4KClRoYW5rcywKLS1FZHdpbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
