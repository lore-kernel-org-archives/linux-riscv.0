Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FF9C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clyv8039dzbWLG9TjLIRz9RHS4ymUQaeR/euXl87JWw=; b=El5JS8RgnrmZnx
	AFn5agk0cKJcL3nRBtbwZWYgMjCu6ZAf0JBJcOOeKkNhy/CcOOCAczkm5RE9EolIj/ocH06C4seNN
	8xPdzrmYkVwcHhslfH8hHjDvYL9GgDfSadUxXs597I0/vwfPDeQ6IOmxdTgKALtx7k0GevDlJd2aB
	/HapK7WJ7axvDwj1wKzzPK9HpQLs+Yq9hXqxNzzr5d8Dz4+noO3ir3mMroWvdMql9Eh2FSc+Z3koB
	hg5jmHNKGGqK6EnRIBdoAEAmut9R6YSaJbuxyAxXKZHZgjCVpn3f0k7ruOMehNhrfZEhMKOvAzERV
	sElh0jB/WWuXTe+p0g3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6Nn-008sUc-26;
	Thu, 11 May 2023 13:30:59 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6Ni-008sMR-2V
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 13:30:58 +0000
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id D4CDC34257E;
	Thu, 11 May 2023 16:30:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mta-01; bh=9JSAwBIFENdjbz+Vq+
	nThd7WXvA6GppuJ7tkjnIXu/k=; b=gWsLhjlCdbmdg+EGw4lMtZRCfZM5VZAuLg
	BnY9a/x+66pOGpC38TjYzZY4xa8fuenks3nZkuRRhl7x3hcLRKKHQXoP6NWCyFmk
	qgYP4MqlU+njE2Tgf2GnF5GMv9Co3i/CTqkegqnSBRcMF1oChw5ANOE1abLz2HZc
	hdilUnOB4=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id CB119342574;
	Thu, 11 May 2023 16:30:45 +0300 (MSK)
Received: from [10.178.154.27] (10.178.154.27) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 11 May
 2023 16:30:44 +0300
Message-ID: <50d56c9c-49c7-8d93-6698-3d0e90d89c54@yadro.com>
Date: Thu, 11 May 2023 16:30:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V9 3/4] riscv: ftrace: Add
 DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Song Shuai
	<suagrfillet@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>,
	<rostedt@goodmis.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <mark.rutland@arm.com>, <guoren@kernel.org>,
	<jszhang@kernel.org>
References: <20230510101857.2953955-1-suagrfillet@gmail.com>
 <20230510101857.2953955-4-suagrfillet@gmail.com>
 <87ttwjjpx8.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
In-Reply-To: <87ttwjjpx8.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.178.154.27]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_063055_326485_521DCBAE 
X-CRM114-Status: GOOD (  23.39  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxMS4wNS4yMDIzIDEwOjE5LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IFNvbmcgU2h1
YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+PiBUaGlzIHBhdGNoIGFkZHMg
RFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgc3VwcG9ydCBmb3IgUklTQy1WLgo+Pgo+
PiBzZWxlY3QgdGhlIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHRvIHByb3ZpZGUg
dGhlCj4+IHJlZ2lzdGVyX2Z0cmFjZV9kaXJlY3RbX211bHRpXSBpbnRlcmZhY2VzIGFsbG93aW5n
IHVzZXJzIHRvIHJlZ2lzdGVyCj4+IHRoZSBjdXN0b21lZCB0cmFtcG9saW5lIChkaXJlY3RfY2Fs
bGVyKSBhcyB0aGUgbWNvdW50IGZvciBvbmUgb3IKPj4gbW9yZSB0YXJnZXQgZnVuY3Rpb25zLiBB
bmQgbW9kaWZ5X2Z0cmFjZV9kaXJlY3RbX211bHRpXSBhcmUgYWxzbwo+PiBwcm92aWRlZCBmb3Ig
bW9kaWZ5aW5nIGRpcmVjdF9jYWxsZXIuCj4+Cj4+IFRvIG1ha2UgdGhlIGRpcmVjdF9jYWxsZXIg
YW5kIHRoZSBvdGhlciBmdHJhY2UgaG9va3MgKGVnLiBmdW5jdGlvbi9mZ3JhcGgKPj4gdHJhY2Vy
LCBrW3JldF1wcm9iZXMpIGNvLWV4aXN0LCBhIHRlbXBvcmFyeSByZWdpc3RlciBpcyBub21pbmF0
ZWQgdG8KPj4gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2NhbGxlciBpbiBmdHJhY2VfcmVn
c19jYWxsZXIuIEFmdGVyIHRoZQo+PiBzZXR0aW5nIG9mIHRoZSBhZGRyZXNzIGRpcmVjdF9jYWxs
ZXIgYnkgZGlyZWN0X29wcy0+ZnVuYyBhbmQgdGhlCj4+IFJFU1RPUkVfUkVHUyBpbiBmdHJhY2Vf
cmVnc19jYWxsZXIsIGRpcmVjdF9jYWxsZXIgd2lsbCBiZSBqdW1wZWQgdG8KPj4gYnkgdGhlIGBq
cmAgaW5zdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21h
aWwuY29tPgo+PiBUZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPj4gLS0tCj4+ICAgYXJjaC9y
aXNjdi9LY29uZmlnICAgICAgICAgICAgICB8ICAxICsKPj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Z0cmFjZS5oIHwgIDggKysrKysrKysKPj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQt
ZHluLlMgIHwgMTAgKysrKysrKysrKwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4+IGluZGV4IGUwNjMyNDkzNDgyZi4uZmRmMGIyMTlhMDJjIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3Jpc2N2L0tjb25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IEBAIC0x
NDQsNiArMTQ0LDcgQEAgY29uZmlnIFJJU0NWCj4+ICAgICAgICBzZWxlY3QgVUFDQ0VTU19NRU1D
UFkgaWYgIU1NVQo+PiAgICAgICAgc2VsZWN0IFpPTkVfRE1BMzIgaWYgNjRCSVQKPj4gICAgICAg
IHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFIGlmICFYSVBfS0VSTkVMICYmIE1NVSAmJiAoQ0xB
TkdfU1VQUE9SVFNfRFlOQU1JQ19GVFJBQ0UgfHwgR0NDX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNF
KQo+PiArICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUwo+
PiAgICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTIGlmIEhBVkVfRFlO
QU1JQ19GVFJBQ0UKPj4gICAgICAgIHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEIGlm
ICFYSVBfS0VSTkVMCj4+ICAgICAgICBzZWxlY3QgSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVIK
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4+IGluZGV4IDg0Zjg1NmEzMjg2ZS4uODQ5MDRjMWU0
MzY5IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPj4gQEAgLTExNCw2ICsxMTQsMTQg
QEAgc3RydWN0IGZ0cmFjZV9yZWdzOwo+PiAgIHZvaWQgZnRyYWNlX2dyYXBoX2Z1bmModW5zaWdu
ZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4+ICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZnRyYWNlX29wcyAqb3AsIHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3MpOwo+
PiAgICNkZWZpbmUgZnRyYWNlX2dyYXBoX2Z1bmMgZnRyYWNlX2dyYXBoX2Z1bmMKPj4gKwo+PiAr
c3RhdGljIGlubGluZSB2b2lkCj4+ICtfX2FyY2hfZnRyYWNlX3NldF9kaXJlY3RfY2FsbGVyKHN0
cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4+ICt7Cj4+ICsgICAgICAg
ICAgICAgcmVncy0+dDEgPSBhZGRyOwo+PiArfQo+PiArI2RlZmluZSBhcmNoX2Z0cmFjZV9zZXRf
ZGlyZWN0X2NhbGxlcihmcmVncywgYWRkcikgXAo+PiArICAgICBfX2FyY2hfZnRyYWNlX3NldF9k
aXJlY3RfY2FsbGVyKCYoZnJlZ3MpLT5yZWdzLCBhZGRyKQo+PiAgICNlbmRpZiAvKiBDT05GSUdf
RFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTICovCj4+Cj4+ICAgI2VuZGlmIC8qIF9fQVNTRU1CTFlf
XyAqLwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TIGIvYXJj
aC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4+IGluZGV4IGYyNmU5ZjZlMmZlZC4uOWQ0MDVi
YWVkYjUyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKPj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4+IEBAIC0yMzEsNiArMjMxLDcg
QEAgRU5EUFJPQyhmdHJhY2VfY2FsbGVyKQo+Pgo+PiAgICNlbHNlIC8qIENPTkZJR19EWU5BTUlD
X0ZUUkFDRV9XSVRIX1JFR1MgKi8KPj4gICBFTlRSWShmdHJhY2VfcmVnc19jYWxsZXIpCj4+ICsg
ICAgIG1vdmUgICAgdDEsIHplcm8KPiAKPiBQbGVhc2UgdXNlICJtdiIsIGFuZCBub3QgIm1vdmUi
IFsxXS4KPiAKPj4gICAgICAgIFNBVkVfQUJJX1JFR1MgMQo+PiAgICAgICAgUFJFUEFSRV9BUkdT
Cj4+Cj4+IEBAIC0yMzksNyArMjQwLDEwIEBAIGZ0cmFjZV9yZWdzX2NhbGw6Cj4+ICAgICAgICBj
YWxsICAgIGZ0cmFjZV9zdHViCj4+Cj4+ICAgICAgICBSRVNUT1JFX0FCSV9SRUdTIDEKPj4gKyAg
ICAgYm5leiAgICB0MSwuTGRpcmVjdAo+PiAgICAgICAganIgdDAKPj4gKy5MZGlyZWN0Ogo+PiAr
ICAgICBqciB0MQo+IAo+IEFnYWluLCB3aGlsZSB5b3UncmUgZG9pbmcgY2hhbmdlcyBoZXJlLCBw
bGVhc2UgdHJ5IHRvIGFsaWduIG9wL29wZXJhbmRzLgo+IAo+IFdlYXJpbmcgbXkgQlBGIGhhdCwg
SSdtIGhhcHB5IHRvIGZpbmFsbHkgZ2V0IERJUkVDVF9DQUxMUyBzdXBwb3J0IQo+IAo+IFRoaXMg
ZG9lcyBub3QgdGFrZSB0aGUgV0lUSF9DQUxMX09QUyBhcHByb2FjaCBNYXJrIHN1Z2dlc3RlZCBp
biB0aGUgdjcKPiB0aHJlYWRzLCBidXQgZ2l2ZW4gdGhhdCB0ZXh0IHBhdGNoaW5nIHN0b3J5IG9u
IFJJU0MtViBpcyBzdGlsbCBhIGJpdCBzYWQKPiAoaW5jb25zaXN0ZW5jeSBpbiB0aGUgUlYgdHJl
ZSwgbm8gc3BlY2lmaWNhdGlvbiwgY2Fubm90IHdvcmsgd2l0aAo+IHByZWVtcHQsIC4uLikgSSdk
IHNheSB0aGlzIGFwcHJvYWNoIGlzIE9LIGZvciBub3csIGFuZCB3ZSBjYW4gY2hhbmdlIHRvCj4g
V0lUSF9DQUxMX09QUyBsYXRlciBpbiBhIHdpZGVyICJsZXQncyBpbXByb3ZlIFJJU0MtViB0ZXh0
cGF0Y2hpbmciIHdvcmsuCj4gCj4gVGhvdWdodHM/CgpUaGUgV0lUSF9DQUxMX09QUyBhcHByb2Fj
aCBzZWVtcyB0byBuZWVkIG11Y2ggbW9yZSB0aW1lIGFuZCBlZmZvcnQsIHNvLCAKeWVzLCBJJ2Qg
YWxzbyB1c2UgdGhpcyBpbXBsZW1lbnRhdGlvbiBvZiBESVJFQ1RfQ0FMTFMgZm9yIG5vdy4gT3Ro
ZXIgCmltcHJvdmVtZW50cyBjb3VsZCB3YWl0IGZvciB0aGUgZnV0dXJlICJiaWcgcGF0Y2hpbmcg
cmV3b3JrIi4KCkZXSVcsIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBrcHJvYmVzIGZvciBSSVNDLVYg
aGFzIGJlZW4gaW1wcm92aW5nIApncmFkdWFsbHkgdG9vLCBub3QgZXZlcnl0aGluZyB3YXMgZG9u
ZSBpbiB0aGUgZmlyc3QgdmVyeSBwYXRjaHNldCwgYnV0IAppdCB3YXMgdXNhYmxlIG5vbmV0aGVs
ZXNzLgoKSSBoYXZlIG5vdCB0ZXN0ZWQgdGhpcyBwYXJ0aWN1bGFyIHZlcnNpb24gb2YgdGhpcyAK
RFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgc2VyaWVzLCBvbmx5IHNvbWUgcHJldmlv
dXMgb25lcyAtIHRoZXJlIAp3ZXJlIG5vIG91dHN0YW5kaW5nIHByb2JsZW1zIHRoZXJlLiBUaGUg
Y29kZSBsb29rcyBzYW5lIHRvIG1lLgoKPiAKPiAKPiBCasO2cm4KPiAKPiBbMV0gaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtYXNtLW1hbnVhbC9ibG9iL21hc3Rlci9yaXNj
di1hc20ubWQjLWEtbGlzdGluZy1vZi1zdGFuZGFyZC1yaXNjLXYtcHNldWRvaW5zdHJ1Y3Rpb25z
Cj4gCgpSZWdhcmRzLApFdmdlbmlpCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
