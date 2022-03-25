Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1527EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Mar 2022 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CkNCZK49A5WrC0BXNhKWxF4yEhP/2UXImurU2cMYJY=; b=2scBGLMXQthtRi
	MUkUeOGk5cbqLfkvFrEn0Xe0wfIkFKjxCXvLnKxtiZWjmOgA1I8y4qHz069x3lkn+ZJXwgCF5u62v
	/gL2glpgVHuhslhKCGzyLOz+NFDPx3pX5NK0yl76XXESmh0d/kZxCcwhyMp5YESF77uQxbjiHEQ/T
	36pHcGQj52WjjC7wQ1Y6HD+Xe33vSOgMWQtGPyXMpGbLNp5qtxsifxZZlOxexhqd19Zs2I+g/cwRJ
	uqdEt1YEe++1fMWyXCag61PmRxwsMsORqJxppWd/a+MS7Zvc5PUHNQ2RmoQKMZTXmaT7KnqjtyNAX
	QGl6u5Y8tt/oSCRsbVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXiiW-001yj6-D9; Fri, 25 Mar 2022 12:06:56 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXiiD-001ycH-7w; Fri, 25 Mar 2022 12:06:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC2DE12FC;
 Fri, 25 Mar 2022 05:06:33 -0700 (PDT)
Received: from [192.168.1.16] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5712E3F73B;
 Fri, 25 Mar 2022 05:06:30 -0700 (PDT)
Message-ID: <df54651e-ecd9-5812-70aa-138190fa7426@arm.com>
Date: Fri, 25 Mar 2022 13:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] sched: dynamic config sd_flags if described in DT
Content-Language: en-US
To: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira
 <bristot@redhat.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <1647331137-69890-1-git-send-email-wangqing@vivo.com>
 <68df2f49-9b74-7ea2-0178-be55824b3c89@arm.com>
 <SL2PR06MB3082DBB58303601F73FB77D3BD119@SL2PR06MB3082.apcprd06.prod.outlook.com>
 <73b491fe-b5e8-ebca-081e-fa339cc903e1@arm.com>
 <SL2PR06MB3082FAA7900ED3664838B48CBD189@SL2PR06MB3082.apcprd06.prod.outlook.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <SL2PR06MB3082FAA7900ED3664838B48CBD189@SL2PR06MB3082.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_050637_415843_1BFAD5F7 
X-CRM114-Status: GOOD (  17.72  )
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

T24gMjMvMDMvMjAyMiAwNzo0NSwg546L5pOOIHdyb3RlOgoKWy4uLl0KCj4+IE5vdywgaWYgeW91
IHdhbnQgdG8gbW92ZSBTaFBSIGZyb20gTUMgdG8gRElFIHRoZW4gYSBjdXN0b20gdG9wb2xvZ3kK
Pj4gdGFibGUgc2hvdWxkIGRvIGl0LCBpLmUuIHlvdSBkb24ndCBoYXZlIHRvIGNoYW5nZSBhbnkg
Z2VuZXJpYyB0YXNrCj4+IHNjaGVkdWxlciBjb2RlLgo+Pgo+PiBzdGF0aWMgaW5saW5lIGludCBj
cHVfY3B1X2ZsYWdzKHZvaWQpCj4+IHsKPj4gwqDCoMKgwqDCoMKgIHJldHVybiBTRF9TSEFSRV9Q
S0dfUkVTT1VSQ0VTOwo+PiB9Cj4+Cj4+IHN0YXRpYyBzdHJ1Y3Qgc2NoZWRfZG9tYWluX3RvcG9s
b2d5X2xldmVsIGN1c3RvbV90b3BvbG9neVtdID0gewo+PiAjaWZkZWYgQ09ORklHX1NDSEVEX1NN
VAo+PiDCoMKgwqDCoMKgwqDCoCB7IGNwdV9zbXRfbWFzaywgY3B1X3NtdF9mbGFncywgU0RfSU5J
VF9OQU1FKFNNVCkgfSwKPj4gI2VuZGlmCj4+Cj4+ICNpZmRlZiBDT05GSUdfU0NIRURfQ0xVU1RF
Ugo+PiDCoMKgwqDCoMKgwqDCoCB7IGNwdV9jbHVzdGVyZ3JvdXBfbWFzaywgY3B1X2NsdXN0ZXJf
ZmxhZ3MsIFNEX0lOSVRfTkFNRShDTFMpIH0sCj4+ICNlbmRpZgo+Pgo+PiAjaWZkZWYgQ09ORklH
X1NDSEVEX01DCj4+IMKgwqDCoMKgwqDCoMKgIHsgY3B1X2NvcmVncm91cF9tYXNrLCBTRF9JTklU
X05BTUUoTUMpIH0sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBeXl5eCj4+ICNlbmRpZgo+PiDCoMKgwqDCoMKgwqDCoCB7IGNwdV9jcHVf
bWFzaywgY3B1X2NwdV9mbGFncywgU0RfSU5JVF9OQU1FKERJRSkgfSwKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eXl5eXl5eXl5eCj4+IMKgwqDC
oMKgwqDCoMKgIHsgTlVMTCwgfSwKPj4gfTsKPj4KPj4gc2V0X3NjaGVkX3RvcG9sb2d5KGN1c3Rv
bV90b3BvbG9neSk7Cj4gCj4gSG93ZXZlciwgZHVlIHRvIHRoZSBsaW1pdGF0aW9uIG9mIEdLSSwg
d2UgY2Fubm90IGNoYW5nZSB0aGUgc2QgdG9wb2xvZ3kKPiBieSBvdXJzZWx2ZXMuIEJ1dCB3ZSBj
YW4gY29uZmlndXJlIENQVSBhbmQgY2FjaGUgdG9wb2xvZ3kgdGhyb3VnaCBEVC4KCklNSE8sIG1h
aW5saW5lIGNhbid0IGRvIGFueXRoaW5nIGhlcmUuIFlvdSBzaG91bGQgdGFsayB0byB5b3VyIEFu
ZHJvaWQKcGxhdGZvcm0gcHJvdmlkZXIgaW4gdGhpcyBjYXNlLiBBbmRyb2lkIGNvbmNlcHRzIGxp
a2UgR2VuZXJpYyBLZXJuZWwKSW1hZ2UgKEdLSSkgYXJlIG5vcm1hbGx5IG5vdCBkaXNjdXNzZWQg
aGVyZS4KCkZyb20gbWFpbmxpbmUgcGVyc3BlY3RpdmUgd2UncmUgT0sgd2l0aCBzY2hlZHVsaW5n
IHN1Y2ggYSBzeXN0ZW0gZmxhdCwKZS5nLiBvbmx5IHdpdGggYSBzaW5nbGUgTUMgU0QgW0NQVTAu
LkNQVTddIGZvciBlYWNoIENQVS4KSXQgY291bGQgYmUgdGhhdCB0aGUgUGhhbnRvbSBTRCBpcyBz
dGlsbCBuZWVkZWQgZm9yIGFkZGl0aW9uYWwKcHJvcHJpZXRhcnkgb3IgQW5kcm9pZCBhZGQtb25z
IHRob3VnaD8KCkluIGNhc2UgeW91IHdvdWxkIHJlbW92ZSBgY2x1c3RlclhgIGZyb20geW91ciBE
VCBjcHUtbWFwIChQaGFudG9tIFNECmluZm9ybWF0aW9uLCBpLmUuIHRoZSByZWFzb24gZm9yIHdo
eSB5b3UgaGF2ZSBlLmcuIGZvciBDUFUwOiBgTUMgKFNoUFIpCltDUFUwLi5DUFUzXSBhbmQgRElF
IFtDUFUwLi5DUFU3XWApICwgeW91IHNob3VsZCBzZWUgdGhlIG5hdHVyYWwKdG9wb2xvZ3k6IG9u
bHkgYE1DIChTaFBSKSBbQ1BVMC4uQ1BVN11gLgoKPiBTbyB3aHkgbm90IGdldCB0aGUgU2hQUiBm
cm9tIERUIGZpcnN0PyBJZiBub3QgY29uZmlndXJlZCwgdXNlIHRoZSBkZWZhdWx0LgoKSSdtIG5v
dCBjb252aW5jZWQgdGhhdCBtYWlubGluZSB3aWxsIGFjY2VwdCBhIGNoYW5nZSB3aGljaCBpcyBu
ZWNlc3NhcnkKZm9yIGEgb3V0LW9mLXRyZWUgdHdlYWsgKFBoYW50b20gU0QpLgoKPj4+ICpDTFNb
MC0xXVsyLTNdKFNEX1NIQVJFX1BLR19SRVNPVVJDRVMpCj4+Cj4+IEJ1dCB3aHkgZG8geW91IHdh
bnQgdG8gaGF2ZSB5ZXQgYW5vdGhlciBTRCB1bmRlcm5lYXRoIE1DIGZvciBDUFUwLUNQVTM/Cj4+
IHNkX2xsYyBpcyBhc3NpZ25lZCB0byB0aGUgaGlnaGVzdCBTaFBSIFNELCB3aGljaCB3b3VsZCBi
ZSBESUUuCj4gCj4gV2Ugd2FudCBkbyBzb21ldGhpbmcgZnJvbSB0aGUgc2hhcmVkIEwyIGNhY2hl
KGZvciBjb21wbGV4LCBsaWtlIHdhbHQpLCAKPiB5b3UgY2FuIGlnbm9yZSBpdCBoZXJlIGFuZCB0
YWxrIGFib3V0IGl0IHdoZW4gd2UgZG9uZS4KCkkgYXNzdW1lIHlvdSByZWZlciB0byB0aGUgcHJv
cHJpZXRhcnkgbG9hZC10cmFja2luZyBtZWNoYW5pc20gYFdpbmRvdwpBc3Npc3RlZCBMb2FkIFRy
YWNraW5nYCAoV0FMVCkgaGVyZT8gSXQncyBhbHNvIG5vdCBpbiBtYWlubGluZS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
