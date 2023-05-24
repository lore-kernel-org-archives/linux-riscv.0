Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A09C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WchazqOhYaOCiVWc1dTI4e1/96u4vHkTJ07O39b+4r4=; b=35QJq1dXrx96ll
	tySXuSIQqaWqO6lWjQA5hN5HXKuiuYISNxIvFKGHJuIq+gBzdtSh9I7cW+1vaL1JDkFAAH6047SBW
	iWWoCW1CXNNPYMveBtK0yrfVKjW8aCA8x0KR/n1J+6KUOe7QwgUCtnDGcDMUeF35OjyHcUHEH0kK1
	aQ+r7s9szcM3NDgJC6esr5Ytnkp1UVblPk4w22tHVzMIwN2ZKUWVLCXgx8cwuZ2h+yStkzOVyKpKp
	HRvQGlvQZjUpvtszBxyE8XyaUy99X6dwr9ABsjTVmk7BRwSzqSuGK1zj3zObAY9ke40h6rSg2otKl
	BjwTNTcES2MTqkpJZ2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1r79-00DyRh-09;
	Wed, 24 May 2023 16:13:27 +0000
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1r74-00DyOg-20
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 16:13:26 +0000
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id CF793DE18;
	Wed, 24 May 2023 19:13:15 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id Ce7PVoYQRckz; Wed, 24 May 2023 19:13:15 +0300 (EEST)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net [83.102.40.55])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 80A2AE355;
	Wed, 24 May 2023 19:13:15 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by luumupuu2.dnainternet.net (Postfix) with ESMTPS id 84DA22C60;
	Wed, 24 May 2023 19:13:10 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: andy.chiu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH -next v20 20/26] riscv: Add prctl controls for userspace vector
 management
Date: Wed, 24 May 2023 19:13:10 +0300
Message-ID: <2621691.14T4csFsIl@basile.remlab.net>
Organization: Remlab
In-Reply-To: <mhng-52f8af07-f3fc-4674-94ea-abbe2108907a@palmer-ri-x1c9a>
References: <mhng-52f8af07-f3fc-4674-94ea-abbe2108907a@palmer-ri-x1c9a>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_091322_912296_2CC2B688 
X-CRM114-Status: GOOD (  15.72  )
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

TGUga2Vza2l2aWlra29uYSAyNC4gdG91a29rdXV0YSAyMDIzLCAzLjE4LjI2IEVFU1QgUGFsbWVy
IERhYmJlbHQgYSDDqWNyaXQgOgo+ID4gSSBkb24ndCB0aGluayB0aGUgdmFsdWUgb2YgYW4gYXV4
aWxsYXJ5IHZlY3RvciBlbnRyeSBjYW4gY2hhbmdlIGluIGFuCj4gPiBleGlzdGluZyBwcm9jZXNz
IG5vciB0aGF0IHdlIG5lZWQgdGhhdC4gSWYgYW4gYXBwbGljYXRpb24gc3RhcnRzIHdpdGggVgo+
ID4gZGlzYWJsZWQsIHlvdSBjYW4ga2VlcCB0aGUgViBiaXQgY2xlYXIgZXZlbiBpZiBWIGdldHMg
ZW5hYmxlZCBsYXRlciBvbjsKPiA+IHRoYXQgd29uJ3QgYnJlYWsgZXhpc3RpbmcgdXNlcnNwYWNl
IGNvZGUsIHdoaWNoIHNpbXBseSB3b24ndCB1c2UgdmVjdG9ycy4KPiA+IAo+ID4gV2hhdCBkb2Vz
IGJyZWFrIGV4aXN0aW5nIHVzZXJzcGFjZSBpcyBzZXR0aW5nIHRoZSBWIGJpdCB3aGlsc3QgdmVj
dG9ycyBhcmUKPiA+IGRpc2FibGVkLgo+IFNvIG1heWJlIHRoZSByaWdodCBhbnN3ZXIgaXMgdG8g
anVzdCBub3Qgc2V0IFYgYXQgYWxsPwoKVGhhdCBpcyBvbmUgcG9zc2liaWxpdHkgdGhhdCBJIGNh
biBsaXZlLCBhbHRob3VnaCBpdCBmZWVscyB1bm5lY2Vzc2FyaWx5IHVzZXItCmhvc3RpbGUgY29t
cGFyZWQgdG8gc2V0dGluZyBpdCBvbmx5IGlmIHRoZSBwcm9jZXNzIF9zdGFydGVkXyB3aXRoIFYg
ZW5hYmxlZC4KCj4gVGhlCj4gc2luZ2xlLWxldHRlciBleHRlbnNpb25zIGFyZSBzb3J0IG9mIGRl
ZnVuY3Qgbm93LCB0aGVyZSdzIG11bHRpLWxldHRlcgo+IHN1YiBleHRlbnNpb25zIGZvciBtb3N0
IHRoaW5ncywgYnV0IFYgZ290IHJhdGlmaWVkIHdpdGggdGhvc2UKPiBzdWItZXh0ZW5zaW9ucyBz
byB3ZSBjb3VsZCBqdXN0IGNhbGwgaXQgZXh0cmEtYW1iaWd1b3VzPwoKTWF5YmU7IEkgbXVzdCBh
ZG1pdCBJIGhhdmUgemVybyB2aXNpYmlsaXR5IHRvIFJWSSBpbm5lciB3b3JraW5ncy4gQXQgbGVh
c3QgQywgCkQgYW5kIEYgYml0cyBjb3VsZCB3b3JrIGZvciBKSVQgdXNlIGNhc2VzLCBJIHN1cHBv
c2UuIEUgYW5kIE0gYXJlIHRvdGFsbHkgCmltcHJhY3RpY2FsIHRvIHN1cHBvcnQuIEcsIEksIFgg
YW5kIFogY2Fubm90IGFyZSBhbHJlYWR5IHdhc3RlZCBieSB0aGUgZGVzaWduLCAKYW5kIEkgZ3Vl
c3Mgd2Ugd2lsbCBub3cgd2FzdGUgYWxsIDE2IG90aGVycy4KCkJ1dCBhcyBmb3IgViwgd2hhdCBp
cyB0aGUgdXNlci1zcGFjZSBzdG9yeSBmb3IgdGhlIHByY3RsKCk/IFdobyBpcyBpbnRlbmRlZCB0
byAKZW5hYmxldCBWIG1vZGU/IElmIHRoZXJlIGlzIG5vIGNsZWFyIHN0b3J5LCBpdCBpcyBhbGwg
YnV0IGd1YXJhbnRlZWQgdGhhdCAKcmFuZG9tIGxpYnJhcmllcyB3aWxsIGNhbGwgaXQsIGFuZCBq
dXN0IF9ibGluZGx5XyBhc3N1bWUgdGhhdCB0aGVyZSBpcyBlbm91Z2ggCnN0YWNrIHNwYWNlIGZv
ciBzaWduYWwgaGFuZGxpbmcuIElmIHNvLCB0aGVuIHRoZXJlIGlzIG5vdCBtdWNoIHBvaW50IGhh
dmluZyBhIApwcmN0bCgpIGluIHRoZSBmaXJzdCBwbGFjZTsgbWlnaHQgYXMgd2VsbCBzdGljayB0
byBqdXN0IGEga2VybmVsIEtjb25maWcgd2l0aCBubyAKcnVudGltZSBjb25maWd1cmF0aW9uLgoK
LS0gClLDqW1pIERlbmlzLUNvdXJtb250Cmh0dHA6Ly93d3cucmVtbGFiLm5ldC8KCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
