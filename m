Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E549C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xszz7T2YA4eBZwV9DRuHSe3ELAjZ7QMqCU7ZTJrwWCM=; b=qrTLyCcgdJBEhL
	fEn6dyVDfwmzMiNvSSi5e1m73/fzYwN0IEvAchgjM0q+S96JyNgyL7ekDYzTGQkaPq/bnH4m1ShMV
	2kiObIi9HnQWXpueRRWrCfN6J4gICBg8gzdx+mFoOt6x4ZzUCtkih5CWoD+MRUSkSDeblJ+j8GAka
	k+i3XdCTALttZ5HDviR8GzxhCytvSR+LFoGyEIDAAiIYZ/Uvxa76XJuzY2eBoaYXgqXTp+RBxeFJM
	6YVWVAyQ0eOo3ooiK0YwFDdl8KT6ISo/Yh3dC67o8c4vhGn5I5yw48k3mJBsxtQkme9+GiMrs5F+/
	4ULAaH5RLhnOTuZVQidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfafh-00000006WpU-2ps1;
	Fri, 03 Jul 2026 09:58:57 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfafe-00000006Woa-1dD1
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 09:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783072672;
	bh=7wKH1xnMpdQTYs1GgGEhEsEEfpRsGdlMmEvMsie1aI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=AyK54OEF08ZrxaQE9bv7rQRp2XLdD9ZthtzFfsoezJ3XkyVViT0djjEhdSKDNU7W/
	 Q0xEB4d3k8K33utHxJnK17LAv5zXegrFwdA3t2cOBY/yzCpBRvZSxeNw9igCS3Phqo
	 hOgOTkK8P5f8WU2SvJwUB8VuvWNNzqBImtMqwvE0=
X-QQ-mid: esmtpsz19t1783072670t860bd952
X-QQ-Originating-IP: yQeUo0oBNZiyozxrn5J6mXe/g0vxOwLg8q2rE5Nai50=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Jul 2026 17:57:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1894719642677403996
EX-QQ-RecipientCnt: 26
Message-ID: <D233CE7F52A8953C+2120e7be-66e5-4cab-9543-05591eccfd76@linux.spacemit.com>
Date: Fri, 3 Jul 2026 17:57:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
To: Zane Leung <liangzhen@linux.spacemit.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: anup.patel@oss.qualcomm.com, adrian.hunter@intel.com, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, irogers@google.com, jolsa@kernel.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mark.rutland@arm.com,
 mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com, mingo@redhat.com,
 namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
 pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
 <2026070316-surgery-unneeded-bceb@gregkh>
 <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
 <2026070300-submitter-humbly-833a@gregkh>
 <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
Content-Language: en-GB
From: Mark Zhuang <zhuangqiubin@linux.spacemit.com>
In-Reply-To: <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NgUh0HaKLqP00sIHNiZsEu7Niegxk5pTSzxaZ+GlsG4n1I/PVfaXHQ6H
	G7bEpc+n6Ha6pZW1ei7OmJlvF/jIxpDNhMP8bRgCbk8logP94yKGJh6dHtpWF3PnEj5KWMI
	2bnjp+eDV/r0qHxYbn4we9tcH/8mxzxv9pEKbL9fvogwKwuqffCJlJluuFY00OQYrwXqG4M
	P48eKTIqVSW3db+ehqAtEfkq5LCkVZej8hKTq0PbSTAVWu8Uh+CCsStQ7JWBU5FBs2jcpk5
	JUxKXH8xJgdf2WaiN83pFqGWQV1OOx68aD6dckb0dGMYureZOck+50fzNP4IHf+R2ygdmSY
	YBfqilPPp/lcicmMHsq9HiUwqSedY/nz7WvV8obCjLuUI7CGzTDFpk+q0e9HeTHdxVxAGlX
	/bdPgWWMGVZwRuW4VRfGwCPaYco9kClX0MKeGqhmvJLerhBf1dbUWpR5m6Vwfr21qz5nsOG
	5qcsKLc65PFLJzx9i4uF3PAWUbBL03uG+hIt5RcUUt3HqBZhLQABHhojjR80Z5psLdwDp00
	pLnAd07hTU0+y7yM+XyhqgtqPjK55+j7YnbMrBFJtXkJqcI/tcs3VyRwFxdZqUXi1FVXhn+
	Dh6d8KbC4Nop1XXLPqC3BjwUr+3nPrtFSP3Xq1uIm2FWYy/VMAyhbkMggvjya80SAkxMTgS
	cSp6AxjDUs5QXimzWbj/qDF611akMERRI0/d2v/vMFEZc5KjOOYEcPUbJ7UUzA2xUvcnk+R
	VuukAlIRCYFzWXKcd8Fog8uI9NYJcxlA+6rRF5b+XuQ7q2o4ysSA5l7IiIpxksq9h0FMGQk
	Emnfp3Ovj7q1RZ7C0mnG4WFJ4TLNvYbMabPgJ1NhyiAZXotO4Upc/xvWiO8w3LWxs7pT6Tb
	cis+p406SVjcPJ6GO6ZrzLta79G4eHwyJNKzn2zvLQip+5HFZm0H0Yw4wHQFuDtshRehe5e
	DYCISUpDkoDngDli7Ll864B8Ir7JlrhOESA2TubaWzVcZUezlRnyfMlE0Os34rnz4iPElIK
	aVVUTb9eUfs2HhWO1dfT9rUxuesNMo8TXzABmFRlfTkduqg//LwZndfFD3BbSQ1FWD+ovci
	AqH8fvxw+8OoVbdPGWqDTtVuEnMU6k25Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_025855_223014_CB8FE2CE 
X-CRM114-Status: GOOD (  22.65  )
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

CgpPbiAwMy8wNy8yMDI2IDE3OjAwLCBaYW5lIExldW5nIHdyb3RlOgo+IAo+IE9uIDcvMy8yMDI2
IDM6NDEgUE0sIEdyZWcgS0ggd3JvdGU6Cj4+IE9uIEZyaSwgSnVsIDAzLCAyMDI2IGF0IDAzOjMy
OjUwUE0gKzA4MDAsIFphbmUgTGV1bmcgd3JvdGU6Cj4+PiBPbiA3LzMvMjAyNiAxOjQxIFBNLCBH
cmVnIEtIIHdyb3RlOgo+Pj4+IE9uIFRodSwgSnVsIDAyLCAyMDI2IGF0IDA0OjE5OjUzUE0gKzA4
MDAsIFphbmUgTGV1bmcgd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBCYXNlZCBvbiB0aGUg
Y3VycmVudCBmcmFtZXdvcmssIEkgYW0gY29uY2VybmVkIGFib3V0IGhvdyB0byBzdXBwb3J0IFJJ
U0MtViBBVEIgYW5kIHJldXNlIHRoZSBDb3Jlc2lnaHQgY29tcG9uZW50IChFVEIvdG1jL1RQSVUp
IGluIHRoZSBmdXR1cmUuCj4+Pj4gVGhhdCBpcyB2ZXJ5IHZhZ3VlLiAgUGxlYXNlIHByb3ZpZGUg
c3BlY2lmaWMgZXhhbXBsZXMuCj4+PiBBY2NvcmRpbmcgdG8gdGhlIC90cmFjZSBjb250cm9sIGlu
dGVyZmFjZS/CoFsxXSBzcGVjOiAiVGhlIEFUQiBCcmlkZ2UgYWxsb3dzIHNlbmRpbmcgUklTQy1W
IHRyYWNlIHRvIEFybSBDb3JlU2lnaHQKPj4+Cj4+PiBpbmZyYXN0cnVjdHVyZSAoaW5zdGVhZCBv
ZiBSSVNDLVYgY29tcGxpYW50IHNpbmsgZGVmaW5lZCBpbiB0aGlzIGRvY3VtZW50KSBhcyBhbiBB
VEIgaW5pdGlhdG9yLiBBVEIgQnJpZGdlIGlzIG5vdAo+Pj4KPj4+IG5lZWRlZCBmb3IgUklTQy1W
IG9ubHkgc3lzdGVtcy4iCj4+Pgo+Pj4gRm9yIEFUQiBCcmlkZ2UsIHJlYWQgdHJhY2UgdXNpbmcg
Q29yZXNpZ2h0IGNvbXBvbmVudHMgKEVUQi9UTUMvVFBJVSkswqAgc28gd2UgbmVlZCBhbHNvIEFS
TSBjb3Jlc2lnaHQgZHJpdmVyIGluCj4+PiBSSVNDLVYgdHJhY2Ugc3lzdGVtcy4gQ3VycmVudCBm
cmFtZXdvcmsgc2VlbXMgdG8gb25seSBiZSBhcHBsaWNhYmxlIHRvwqBSSVNDLVYgb25seSBzeXN0
ZW1zLCBhbmQgZG9lcyBub3Qgc3VwcG9ydAo+Pj4gQVRCIGFuZMKgwqBBUk0gY29yZXNpZ2h0wqB1
c2UgY2FzZSBsaWtlIHRoZSBLMyAoSzMgU29DIGNvbnRhaW5zIFJJU0MtViBFbmNvZGVyLCBGdW5u
ZWwsIEFUQiwgQ29yZVNpZ2h0IEZ1bm5lbCwgYW5kCj4+Pgo+Pj4gQ29yZVNpZ2h0IFRNQyBjb21w
b25lbnRzKS4gRm9yIG1vcmUgZGlzY3Vzc2lvbiwgcGxlYXNlIHJlZmVyIHRvIFsyXS4KPj4+Cj4+
Pgo+Pj4gWzFdOiBodHRwczovL2RvY3MucmlzY3Yub3JnL3JlZmVyZW5jZS90cmFjZS1jb250cm9s
LWludGVyZmFjZS92MS4wL3RjaV9zeXN0ZW1fb3ZlcnZpZXcuaHRtbCNhdGItYnJpZGdlCj4+PiBb
Ml06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDQxNDAzNDE1My4zMjcyNDg1LTEt
bGlhbmd6aGVuQGxpbnV4LnNwYWNlbWl0LmNvbS8KPj4gU28sIHdoYXQgc3BlY2lmaWNhbGx5IGRv
ZXMgdGhpcyBtZWFuPyAgUGxlYXNlIHByb3ZpZGUgcmV2aWV3IGNvbW1lbnRzCj4+IGZvciB0aGUg
Y29kZSBpdHNlbGYuCj4gCj4gVGhlIGlzc3VlIEkgcG9pbnRlZCBvdXQgaXMgbm90IGFib3V0IHNw
ZWNpZmljIGxpbmVzIG9mIGNvZGUsIGJ1dCBhYm91dCB0aGUgZW50aXJlIFJpc2N2IHRyYWNlIGRy
aXZlciByZWdpc3RyYXRpb24gYW5kIGJ1aWxkaW5nIGEgcGF0aCBmcm9tIHNvdXJjZSAtPgo+IHNp
bmsgZGlkIG5vdCB0YWtlIGludG8gYWNjb3VudCB0aGUgYXBwbGljYXRpb24gb2YgYXJtX2NvbWVz
aWdodC4gdGhlIGN1cnJlbnQgcGF0Y2ggc2V0IGFzc3VtZXMgYSByaWdpZCwgaG9tb2dlbmVvdXMg
UklTQy1WLW9ubHkgdG9wb2xvZ3kuCj4gCj4gU3BlY2lmaWNhbGx5LCBpZiB3ZSBoYXZlIEFSTSBj
b3Jlc2lnaHQgY29tcG9uZW50cywgaG93IGNhbiB3ZSByZXVzZSB0aGVtIGxpa2UsIGZ1bm5lbCAo
ZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1mdW5uZWwuYykgLAo+IAo+IFRN
QyAoZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1mdW5uZWwuYykgLCBUUElV
IChkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRwaXUuYykgYW5kIHNvIG9u
IGJhc2VkIG9uIHRoZSBjdXJyZW50Cj4gCj4gZnJhbWV3b3JrLgo+IAo+IAo+Pgo+PiBXZSB3cml0
ZSBjb2RlIGZvciBzdHVmZiB3ZSBoYXZlIG5vdywgdG9kYXkuICBJZiBmdXR1cmUgbmVlZHMgY2hh
bmdlLCB3ZQo+PiBjaGFuZ2UgdGhlIGNvZGUgdG8gaGFuZGxlIHRoYXQgdGhlbi4KClNwYWNlbWlU
IEszIGlzIGEgY29uY3JldGUsIHNoaXBwaW5nIGV4YW1wbGUgb2YgZXhhY3RseSB0aGlzIHRvcG9s
b2d5OiAKaXRzIFJJU0PigJFWIHRyYWNlIGVuY29kZXJzIGdlbmVyYXRlIE7igJFUcmFjZSBtZXNz
YWdlcywgd2hpY2ggYXJlIHRoZW4gCmZvcndhcmRlZCB0byBBcm0gQ29yZVNpZ2h0IGNvbXBvbmVu
dHMgdmlhIGFuIEFUQiBicmlkZ2UuCgpEb2N1bWVudGF0aW9uOiBbMV0KCkdpdmVuIHRoYXQgSzMg
aXMgYSBjb21tZXJjaWFsbHkgYXZhaWxhYmxlIFJJU0PigJFWIFNvQyB0b2RheSwgSSBiZWxpZXZl
IGl0IApxdWFsaWZpZXMgYXMgInN0dWZmIHdlIGhhdmUgbm93LCB0b2RheSIgcmF0aGVyIHRoYW4g
YSBoeXBvdGhldGljYWwgCmZ1dHVyZSBjYXNlLgoKSXQgd291bGQgYmUgaWRlYWwgaWYgd2UgY291
bGQgcmVjb25jaWxlIHRoaXMgc2VyaWVzIHdpdGggWmFuZSdzIApwYXRjaHNldFsyXSwgc28gdGhh
dCB0cmFjZSB3b3JrcyBvbiBib3RoIFFFTVUgYW5kIHJlYWwgaGFyZHdhcmUgc3VjaCBhcyAKdGhl
IEszLgoKVGhlIG1haW4gZnJpY3Rpb24gcG9pbnQgYXQgcHJlc2VudCBhcHBlYXJzIHRvIGJlIENv
cmVTaWdodCBjb21wYXRpYmlsaXR5LgoKWzFdaHR0cHM6Ly9naXRodWIuY29tL3NwYWNlbWl0LWNv
bS9kb2NzLXRvb2wvYmxvYi9tYWluL2VuL3VzZXJfZ3VpZGUvdHJhY2VfdXNlcl9ndWlkZS5tZApb
Ml1odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA0MTQwMzQxNTMuMzI3MjQ4NS0xLWxp
YW5nemhlbkBsaW51eC5zcGFjZW1pdC5jb20vCgo+IAo+IEkgYmVsaWV2ZSB0aGF0IGlmIHRoZSBi
YXNpYyBmcmFtZXdvcmsgZm9yIFJJU0MtViBkb2VzIG5vdCBjb25zaWRlciBjb21wYXRpYmlsaXR5
IHdpdGggQVJNIENvcmVzaWdodCwgb25jZSB0aGUgZnJhbWV3b3JrIGlzIGZpeGVkLCB0aGVyZSB3
aWxsIGJlIGdyZWF0ZXIgcmVzaXN0YW5jZSB0byBmdXR1cmUgbW9kaWZpY2F0aW9ucy4KPiAKPj4g
VGhlIG9ubHkgcHJvYmxlbSBpcyB3aXRoIHVzZXIva2VybmVsIGFwaXMsIHRob3NlIG5lZWQgdG8g
YmUgbmFpbGVkIGRvd24KPj4gc28gdGhhdCB0aGV5IGRvbid0IGNoYW5nZS4gIEkgY2FuJ3QgdGVs
bCBoZXJlIGlmIHlvdSBhcmUgb25seSByZWZlcnJpbmcKPj4gdG8gdGhlIGluLWtlcm5lbCBzdHVm
Ziwgb3IgdXNlci9rZXJuZWwgYXBpcywgc29ycnkuCgo+Pgo+PiB0aGFua3MsCj4+Cj4+IGdyZWcg
ay1oCj4gCj4gCj4gSSBiZWxpZXZlIHRoYXQgUklTQy1WIHRyYWNpbmcgaXMgY29yZXNpZ2h0LWFs
aWtlLCB3aGVyZSBoYXZlIGVuY29kZXJzL2Z1bm5lbC9zaW5rL2JyaWRnZStjb3Jlc2lnaHRfY29t
cC4KPiBJIHRoaW5rIHdlIHNob3VsZCBhYnN0cmFjdCBzb21lIG9mIENvcmVTaWdodCdzIGNvcmUg
bG9naWMgc28gdGhhdCBpdCBjYW4gQm90aCBjb3Jlc2lnaHQgYW5kIHJ2dHJhY2UgY2FuIGJlIHJl
dXNlZC4KPiBHZW5lcmFsIGxvZ2ljIGZvciBidWlsZGluZyBwYXRocyBmcm9tIHNvdXJjZSAtPiBT
aW5rIGFuZCBwZXJmX3BtdSBzaG91bGQgYmUgdW5pdmVyc2FsIGluIGNvcmVzaWdodC9ydnRyYWNl
IGFuZAo+IAo+IGZ1dHVyZSBhcmNoaXRlY3R1cmVzLgo+IAo+IAo+IHRoYW5rcywKPiAKPiBaYW5l
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
