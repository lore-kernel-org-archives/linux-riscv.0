Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32FEC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBus7yMrnLTapP6l717G6AR1Y6BogHdy9ORIgTVy+d0=; b=bQZB9ne/hwLgp4
	W/yYiLlA7yOD4z/EXTuFPy4IMHkF6y0KcVXWGmoiAlDkR5R+DnzQCRXRgjvF63XJrVW9hcK91N3LR
	P4esa6hzqoTNe7SMYmu+dwXfLsBoyeOBpnI1jDJLPDoefcoLBxW/U5yA04xgsPDSkLtuUHlz1r67R
	cqFVwVKHab6BB8FMXobnofSb4oyFqqr1gIqSt6/iAt8tHnHUlGE4/V5egPHS31WzrmdlrxBHhqar3
	gMhTtDnipnfo99tUiOHBQrTR3saNP+9kN4vxP76qlEsWUmRtXPzF5hNBG5MoGgy5W7jWD00JdNcvV
	uvoyvOUGTGthKa+7EXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhAp-0000000GTR3-19tR;
	Mon, 24 Jun 2024 10:43:47 +0000
Received: from smtpbg153.qq.com ([13.245.218.24])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhAk-0000000GTHE-1NAn
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 10:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=milkv.io;
	s=pmbt2212; t=1719225778;
	bh=sekKpimCctA0okQna9i1fH0J/PrsR0PvqSGbrwoPYJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rzZ+QoRUvw3FwZcZWpztY9qHfXoPyUFYPHobNy1CKUj5LNK5F6Y+wRHCzmajV4DC/
	 3BWnArZETfYcD9ZZqiQngi0aN6nmsBFcoqGFxrYGSaNKnOyFfyQSzNkZyWfwRfj4di
	 68kzw4Rke9iIruvT0KgL+IcnzhB9YWvXP8axvnqw=
X-QQ-mid: bizesmtp85t1719225772t7y9mbj4
X-QQ-Originating-IP: UW+IHoZnpzQqZ5eHkn509peR9S4Q+TWYo3iaqYLOdls=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Jun 2024 18:42:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4310506951962495159
Message-ID: <DD700917BCC5A08D+fac89999-b4c2-40c2-b2a5-a4be69ca3fe1@milkv.io>
Date: Mon, 24 Jun 2024 19:42:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: starfive: enable heartbeat LED for Milk-V
 Mars
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, kernel@esmil.dk
References: <20240613024827.36512-1-naoki@milkv.io>
 <20240613024827.36512-2-naoki@milkv.io>
 <8ceef5c1-03b3-4468-96e3-d86db5434e82@canonical.com>
 <AC74C056BD8A7945+7d7e4fa9-25e6-40a0-b571-ff3d01cb575f@milkv.io>
 <2C13D76B7FA9727D+6cf7c812-5cf9-4fd6-a79b-8f2899c7c3de@milkv.io>
 <CAJM55Z_ORHP2P01CqTN192TBmgfj93aLNhrw4cz4b-itnn5TBw@mail.gmail.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@milkv.io>
In-Reply-To: <CAJM55Z_ORHP2P01CqTN192TBmgfj93aLNhrw4cz4b-itnn5TBw@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:milkv.io:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_034343_686449_8DF48323 
X-CRM114-Status: GOOD (  13.51  )
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

SGksCgpPbiA2LzI0LzI0IDE4OjQ0LCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiBGVUtB
VU1JIE5hb2tpIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gNi8yMS8yNCAxMDowMiwgRlVLQVVNSSBO
YW9raSB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDYvMjEvMjQgMDg6MTMsIEhlaW5yaWNoIFNj
aHVjaGFyZHQgd3JvdGU6Cj4+Pj4gT24gNi8xMy8yNCAwNDo0OCwgRlVLQVVNSSBOYW9raSB3cm90
ZToKPj4+Pj4gTWlsay1WIE1hcnMgaGFzIGEgZ3JlZW4gTEVEIHRvIHNob3cgc3lzdGVtIGxvYWQu
IFRoaXMgcGF0Y2ggZW5hYmxlcwo+Pj4+PiBhIGdyZWVuIExFRCBhcyBhIGhlYXJ0YmVhdCBMRUQu
Cj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZVS0FVTUkgTmFva2kgPG5hb2tpQG1pbGt2Lmlv
Pgo+Pj4+PiAtLS0KPj4+Pj4gIMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEw
LW1pbGt2LW1hcnMuZHRzIHwgMTMgKysrKysrKysrKysrKwo+Pj4+PiAgwqAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4+Pj4+IGIvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMKPj4+Pj4gaW5kZXggZmEw
ZWFjNzhlMGJhLi40ZjRiYmY2NGRiZTQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4+Pj4+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4+Pj4+IEBAIC00LDEx
ICs0LDI0IEBACj4+Pj4+ICDCoMKgICovCj4+Pj4+ICDCoCAvZHRzLXYxLzsKPj4+Pj4gKyNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KPj4+Pj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9sZWRzL2NvbW1vbi5oPgo+Pj4+PiAgwqAgI2luY2x1ZGUgImpoNzExMC1jb21tb24uZHRzaSIK
Pj4+Pj4gIMKgIC8gewo+Pj4+PiAgwqDCoMKgwqDCoCBtb2RlbCA9ICJNaWxrLVYgTWFycyI7Cj4+
Pj4+ICDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibWlsa3YsbWFycyIsICJzdGFyZml2ZSxqaDcx
MTAiOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgbGVkcyB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBj
b21wYXRpYmxlID0gImdwaW8tbGVkcyI7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGxl
ZC0wIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpb3MgPSA8JmFvbmdwaW8gMyBH
UElPX0FDVElWRV9ISUdIPjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29sb3IgPSA8
TEVEX0NPTE9SX0lEX0dSRUVOPjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGludXgs
ZGVmYXVsdC10cmlnZ2VyID0gImhlYXJ0YmVhdCI7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0hFQVJUQkVBVDsKPj4+Pgo+Pj4+IEFjY29yZGlu
ZyB0byB0aGUgc2NoZW1hdGljcyB0aGUgU3RhckZpdmUgVmlzaW9uRml2ZSAyIGJvYXJkIGxpa2Ug
dGhlCj4+Pj4gTWFycyBib2FyZCBoYXMgUkdQSU8zIGNvbm5lY3RlZCB0byBhIGdyZWVuIExFRCB0
byBkaXNwbGF5IHRoZSBwb3dlcgo+Pj4+IHN0YXR1cy4gU2hvdWxkbid0IHdlIGNvbnNpZGVyIGJv
dGggYm9hcmRzPwo+Pj4KPj4+IEkgdGhpbmsgTEVEIHVzYWdlIGlzIHZlbmRvci9ib2FyZCBzcGVj
aWZpYy4KPj4KPj4gZG8gSSBuZWVkIHRvIGRvIHNvbWV0aGluZyBmb3IgVkYyIHRvIG1lcmdlIG15
IHBhdGNoPwo+IAo+IEl0J3Mgbm90IHN0cmljdGx5IHJlcXVpcmVkLCBidXQgaXQgd291bGQgYmUg
Z3JlYXQgaWYgeW91IGNvdWxkIGFkZCB0aGUgTEVEIHRvCj4gdGhlIFZGMiB0b28sIHRoYW5rIHlv
dS4KPiAKPiBBbHNvIEknbSBub3Qgc3VyZSBpZiB5b3Ugc2F3IG15IHByZXZpb3VzIHJlcGx5Ogo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBSk01NVpfajhnV0Z5S3ZzaXUt
b0dEVjdIYWNyNEFtdDVGZGtIZGpLbmhad1pneG5jQUBtYWlsLmdtYWlsLmNvbS8KCnNvcnJ5LCBJ
IG1pc3NlZCB5b3VyIHByZXZpb3VzIHJlcGx5Li4uCgpJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGZv
bGxvdyB2ZW5kb3Iga2VybmVsIGJlaGF2aW9yIChleGNlcHQgc3RyYW5nZSAKbGFiZWwuLi4pLCBz
byBJIHdhbnQgdG8gdXNlIGxpbnV4LGRlZmF1bHQtdHJpZ2dlciBpbiBkdHMuCgpCZXN0IHJlZ2Fy
ZHMsCgotLQpGVUtBVU1JIE5hb2tpClNoZW56aGVuIE1pbGtWIFRlY2hub2xvZ3kgQ28uLCBMdGQu
Cgo+IC9FbWlsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
