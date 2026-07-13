Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF46AC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93Am70EGs+iXoTJ2NxA16AircisefO7Cmg6vJ5NnlUs=; b=w9qPLE96zktnCV
	pRlUYU5GdRk0FDKbIbVeOet2OQ/eIGdvrUpiBqB4nTRLn/+TKtb7mFP/4NtjO2+lyeAZpF3U+FMmV
	amrJCI5OEvy4ZbneO0FZTRRuX2gMz+tTeXVeLgZDaI1EQK0QfM1mEjXwLnlI/HY2GMBJLZ9LySP64
	mqpGbwjaKxshaYZ3oLsPWbMlrffGO2WH5CECl53/9RbhBbdWT9//ij9sUhv9dDYSjQtxGpu25bVDf
	clx1toG1kgnvID2CQ6glYWfsLlQEIe37F3QhfDmsyKzqoYX4RfXNuP3urCNiGpo55Vu3jxKsxWMkl
	JD8JnxBcNy9c3R6xM++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCY4-00000008f4w-2Gdk;
	Mon, 13 Jul 2026 09:02:00 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCY1-00000008f3H-15SC
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 09:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783933291;
	bh=rfDq6XPlv8R4XIJ1/9itc+1o8grDKU8S7i/xorOHrq8=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=vhcE8S4aZ1b1Gfj5eZ5STO6ok2DGOdR5gXFNXhXlD1+fvk9j5dJ1LkRxp/3m1eTB/
	 vnmNL1fhNoPt72dHy92JcMEh0O6/UY1JDhE4Hpp03GFetgzrrlZVyVtQfWxEWYi7cc
	 ihEqkEdDjDn5a54C70E3ket81RqH2qiHDlj9VqZA=
X-QQ-mid: esmtpgz13t1783933289t8710c04f
X-QQ-Originating-IP: uYeZvJY1YPz9m9I2VRUZhVLMDbWxBVchNNwN8t2JL+0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Jul 2026 17:01:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12062326101475102107
EX-QQ-RecipientCnt: 7
Mime-Version: 1.0
Date: Mon, 13 Jul 2026 02:01:27 -0700
Message-Id: <DJXBKMGB3NLZ.1NH7HSR669XF0@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Pei Xiao" <xiaopei01@kylinos.cn>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn> <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn> <DJUQ3TZHM7OO.34ULEC76Z2BDY@linux.spacemit.com> <e453a825-4d73-4d35-a699-a495b0ca1058@kylinos.cn>
In-Reply-To: <e453a825-4d73-4d35-a699-a495b0ca1058@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NVu/uN2EcufQ2/Vo4zOzxog+GCp25ZAKLkVyCAD0xt5o3OyOPeBT+7uQ
	V0eHXCPXv19kK1QXZU8RB/mBaK/+TZYD88T+6uJjQnQrEqc4GPObqF26TIPrNF2rt0Orjff
	5I920LXehgsPFU6+UIrKBlZjsSjuOVaqed6wMBGZUKnds+/4I9Q8vLJdC0uS1m//YYnFv18
	L8RFyFHeh2zD4MYO/XWLL6gAjzZrqSLyjPIYHVmcG9KjWQHUCFfG/d+yEgBjOxFNo1G95DR
	OoIECL/gnlGWW7BQNxjQo6d9Qm7dDrS8ZFEPzabn01/EAjB6vu8GWDHNA/drLqt7th299gr
	Wu1YoNqFbN6mP1plYw0KY2xCPeflLe9bgS6jM2SKNhup5VQHG6DE6L98Z2J6xa0hadwJU5q
	ExEFRKL6U9RuyOzDEoSW7Y4rXpcfUIhIR1o2h8NmHU2v3T99znvwrVVx3jQY0ss4j9zwrvn
	7i66MfXV28UEJgBUNAI4TechIp84cgAKSkhpM0OX45WVnDw15pLKnx7QvmdtJuAvuKr/ns3
	l104MfE24rN2FpD1trdK4c4ojvKRbDe+H6EPRJzUofLc/TgK3yXwQoe8uWiUzbSrkx0MHhS
	DBJPP6rBwRIvK4t9e++xwur95tiJax6iwD2w3sqMKcIQ77bS4IbNg3wT2XhMlEBcnRgpH1L
	Uojh824Wzq4Y538zR/vmcnEgXU/DwKBykUW2t2VMQbhbBw7FHHZp889OZSAB66CCe0B1ViR
	LSBgtblOwQg9JdRVzL54KuQGCgvoKzeF9JJ16LPnEfqJrpvf0zEcLlRx0ji+EZ9Pga1gewk
	uR+K5wNhYC+/2oSdoQBFLV2Z5dxNSa+2yySIDd4t/0r6QneUrdI6FBLzTrKy3xIWbwlLY8B
	9c6nMvok/N/YXiyzgKMEI7ORiz24LHK0B3HphWhY+D7nmPip9kMEwnmD6JvrhGsCfmVfOdQ
	u/hIdLanVA9CROX/aLcQ23pk9WzqNJyaIPXddwiMJ9a+WCUccA+S8CbfmQ7fZ2Fs6x0eKtW
	V3sH75HfaOmpKJdr2t7yYUXUWbhA/UwXlU9dl5cHmomtUdrQ/kdm2MKQnRqnCV7d3MfxPru
	jUj0fqXywKN34oqjZodXsQ=
X-QQ-XMRINFO: OD9hHCdaPRBw6CmXJi6UaqSbLUGYIq/CyA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_020158_133681_41F81DEC 
X-CRM114-Status: GOOD (  11.34  )
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

T24gRnJpIEp1bCAxMCwgMjAyNiBhdCAyOjE4IEFNIFBEVCwgUGVpIFhpYW8gd3JvdGU6Cj4KPgo+
IOWcqCAyMDI2LzcvMTAgMTU6NDYsIFRyb3kgTWl0Y2hlbGwg5YaZ6YGTOgo+PiBPbiBGcmkgSnVs
IDEwLCAyMDI2IGF0IDEyOjIxIEFNIFBEVCwgUGVpIFhpYW8gd3JvdGU6Cj4+PiBXaGVuIHRoZSBp
bnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVyIHJlYWRzIHplcm8sIHRoZSBoYW5kbGVyIHNob3VsZAo+
Pj4gcmV0dXJuIElSUV9OT05FIGluc3RlYWQgb2YgSVJRX0hBTkRMRUQuIFdoYXQgdGhlIHJldHVy
biB2YWx1ZQo+Pj4gYWN0dWFsbHkgZmVlZHMgaW50byBpcyB0aGUgc3B1cmlvdXMgaW50ZXJydXB0
IGFjY291bnRpbmcgaW4KPj4+IG5vdGVfaW50ZXJydXB0KCk6IGZhbHNlbHkgY2xhaW1pbmcgSVJR
X0hBTkRMRUQgZGVmZWF0cyB0aGUgImlycSBYWDoKPj4+IG5vYm9keSBjYXJlZCIgZGV0ZWN0aW9u
LCBzbyBhIHN0dWNrIGludGVycnVwdCBzb3VyY2Ugd291bGQgbmV2ZXIgYmUKPj4+IGNhdWdodC4K
Pj4+Cj4+PiBGaXhlczogNWVhNTU4NDczZmEzICgiaTJjOiBzcGFjZW1pdDogYWRkIHN1cHBvcnQg
Zm9yIFNwYWNlbWlUIEsxIFNvQyIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBQZWkgWGlhbyA8eGlhb3Bl
aTAxQGt5bGlub3MuY24+Cj4+IFRoZSBjb21taXQgbWVzc2FnZSBub3cgZGVzY3JpYmVzIHRoZSBh
Y3R1YWwgbWVjaGFuaXNtIGNvcnJlY3RseSwKPj4gdGhhbmtzIGZvciByZXdvcmtpbmcgaXQ6Cj4+
Cj4+IFJldmlld2VkLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNl
bWl0LmNvbT4KPj4KPj4gT25lIHByb2Nlc3Mgbm90ZSwgdGhvdWdoOiBwbGVhc2UgZG9uJ3QgcmVw
b3N0IG5ldyB2ZXJzaW9ucyB0aGlzCj4+IHF1aWNrbHkuIHYyIGZvbGxvd2VkIHRoZSByZXZpZXcg
Y29tbWVudHMgYWxtb3N0IGltbWVkaWF0ZWx5LCB3aGljaAo+PiBtZWFucyBvdGhlciByZXZpZXdl
cnMgd2hvIHdlcmUgc3RpbGwgbG9va2luZyBhdCB2MSBuZXZlciBnb3QgYQo+PiBjaGFuY2UgdG8g
Y2hpbWUgaW4gYmVmb3JlIHRoZSB0aHJlYWQgbW92ZWQgb24sIGFuZCB0aGUgZGlzY3Vzc2lvbgo+
PiBnZXRzIGZyYWdtZW50ZWQgYWNyb3NzIHZlcnNpb25zLgo+IEJlY2F1c2UgSSBub3RpY2VkIGEg
c2ltcGxlIG1pc3Rha2UgcmlnaHQgYWZ0ZXIgc2VuZGluZyB2MQo+IOKAlEkgZm9yZ290IHRvIGlu
Y2x1ZGUgdGhlIHZlcnNpb24gbnVtYmVyIGFuZCBjaGFuZ2Vsb2cgZm9yIHYy4oCUCj4gc28gSSB0
aG91Z2h0IHRoYXQgYnkgZml4aW5nIGl0IHdpdGhvdXQgd2FpdGluZyBmb3IgcmV2aWV3ZXJzIHRv
IHBvaW50IGl0Cj4gb3V0LMKgCj4gSSBjb3VsZCBzYXZlIHJldmlld2VycycgdGltZSBhbmQgZ2V0
IHRoZSBwYXRjaCBtZXJnZWQgbW9yZSBxdWlja2x5Lgo+IMKgSSBtYXkgaGF2ZSBiZWVuIHdyb25n
IGFib3V0IHRoYXQuIFNvcnJ5Lgo+CkknbSBub3QgcmVmZXJyaW5nIHRvIHRoaXMgdGhyZWFkLiBZ
b3UgcG9zdGVkIGFuIGVhcmxpZXIgdmVyc2lvbiBbMV0sCmFuZCB0aGVuIHNlbnQgdGhlIHBhdGNo
ZXMgaW4gdGhpcyB0aHJlYWQganVzdCBvbmUgZGF5IGxhdGVyIChJIGtub3cgdGhhdApvbmUgd2Fz
IHNlbnQgYnkgbWlzdGFrZSwgd2l0aG91dCBhIGNoYW5nZWxvZykuCgpMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvYWFiYThiYTIyOGE5OWY1ODAwNTAwMDRjNWI3ZTI2MmQ4NTVkZTQ0
Yy4xNzgzNTkwNzUyLmdpdC54aWFvcGVpMDFAa3lsaW5vcy5jbi8gWzFdCgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIFRyb3kKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
