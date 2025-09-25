Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6A1CAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 03:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/abLRhZQCuLHQrwhCgcOXQvx2vUX815us9y2vGWfDk=; b=j4eorW3xFw6RqT
	NC7eq7hIcUnoMaVLrP7SdgZHR8F619bNExipPCEMH2YRYdFcBUZB47tJS1/xyDz5yVzsnbZP0N0AU
	CGg3v/zSZIV3yBlwVAAeDmUrrYYpusXyfSjKamagF7Zq0CRRfTraIn7X7BA2BGuxq1MLkmq2g5S9B
	PzAMI/4loSbUA8K9r+xUeoPWQ3Ielw2YdkJx+ni7H3dnPWSVeu73Ic5agMlaREZKwJ4e0RKNMULoU
	OGrcO37RVmhg0s0XEs9jjAzAD7jTdo9NA4eBtt4Fy+kTxbsvaKHX5LQZ0jYsx5FCkEVh5k/r27z+O
	O6IdsMCn/KMLvZqZnbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cKY-00000005Nb9-15pt;
	Thu, 25 Sep 2025 03:07:38 +0000
Received: from mail-m1973180.qiye.163.com ([220.197.31.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cKU-00000005NZp-2Glb
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 03:07:37 +0000
Received: from leo-wkm.. (unknown [210.22.154.122])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10b5c3d81;
	Thu, 25 Sep 2025 11:07:23 +0800 (GMT+08:00)
From: "fushan.zeng" <fushan.zeng@anlogic.com>
To: junhui.liu@pigmoral.tech
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	conor@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	palmer@dabbelt.com,
	palmer@sifive.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	samuel.holland@sifive.com,
	tglx@linutronix.de
Subject: Re: [PATCH v2 00/11] riscv: Add initial support for Anlogic DR1V90
Date: Thu, 25 Sep 2025 11:06:50 +0800
Message-Id: <20250925030650.35694-1-fushan.zeng@anlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
X-HM-Tid: 0a997ed7014c0224kunma317f75922ff69
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT01JVkMaGE9DH0tCH0geSlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSktVSUlVSk5PVUpJSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0
	tVS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_200734_811994_09FB42BC 
X-CRM114-Status: GOOD (  14.61  )
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

T24gTW9uLCAyMiBTZXAgMjAyNSAyMDo0NjozMCArMDgwMCwgSnVuaHVpIExpdSB3cm90ZToKPiBU
aGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIEFubG9n
aWMgRFIxVjkwIFNvQwo+IFsxXSBhbmQgdGhlIE1pbGlhbmtlIE1MS1BBSS1GUzAxIFsyXSBib2Fy
ZC4KPiAKPiBUaGUgRFIxVjkwIGlzIGEgUklTQy1WIGJhc2VkIEZQU29DIGZyb20gQW5sb2dpYywg
ZmVhdHVyaW5nIGEgTnVjbGVpCj4gVVg5MDAgWzNdIGNvcmUgYXMgaXRzIHByb2Nlc3Npbmcgc3lz
dGVtIChQUykgYW5kIDk0LDQ2NCBMVVRzIGluIHRoZQo+IHByb2dyYW1tYWJsZSBsb2dpYyAoUEwp
IHBhcnQuIFRoZSBNaWxpYW5rZSBNTEtQQUktRlMwMSBib2FyZCBpcyBvbmUgb2YKPiB0aGUgZmly
c3QgcGxhdGZvcm1zIGJhc2VkIG9uIHRoaXMgU29DLCB3aXRoIFVBUlQxIHJvdXRlZCB0byBhIFR5
cGUtQwo+IGludGVyZmFjZSBmb3IgY29uc29sZSBhY2Nlc3MuCj4gCj4gVGVzdGVkIG9uIHRoZSBN
aWxpYW5rZSBNTEtQQUktRlMwMSBib2FyZCB3aXRoIGJvdGggdGhlIHZlbmRvcidzIE9wZW5TQkkK
PiBhbmQgdGhlIG5vdC15ZXQtdXBzdHJlYW1lZCBtYWlubGluZSBPcGVuU0JJIFs0XSwgYXMgd2Vs
bCBhcyB0aGUgdmVuZG9y4oCZcwo+IFUtQm9vdC4gQmVjYXVzZSB0aGUgdmVuZG9y4oCZcyBPcGVu
U0JJIGlzIGxvYWRlZCBhdCAweDFmMzAwMDAwLCB3ZSBoYXZlCj4gdG8gYWRkaXRpb25hbGx5IHJl
c2VydmUgdGhlIERSQU0gcmVnaW9uIDB4MWZlMDAwMDDigJMweDFmZmZmZmZmIHRvIHByZXZlbnQK
PiBvdmVybGFwIGlmIHVzaW5nIHZlbmRvcidzIE9wZW5TQkkuCj4gCj4gTm90aWNlOiBBICJubzRs
dmwiIGJvb3Rhcmcgb3IgZGVwZW5kZW5jeSBwYXRjaCBbNV0gaXMgY3VycmVudGx5IHJlcXVpcmVk
Cj4gZm9yIHN1Y2Nlc3NmdWwgYm9vdCBvbiB0aGUgRFIxVjkwIHBsYXRmb3JtLCBzaW5jZSB0aGUg
U29DIGhhbmdzIGlmIHRoZQo+IGtlcm5lbCBhdHRlbXB0cyB0byB1c2UgdW5zdXBwb3J0ZWQgNC1s
ZXZlbCBvciA1LWxldmVsIHBhZ2luZyBtb2Rlcy4KClRoYW5rcyBmaXJzdC4KQW5sb2lnYyBhbHJl
YWR5IGhhcyB0aGUgb3BlbiBzb3VyY2UgU0RLIGF0IGh0dHBzOi8vZ2l0ZWUuY29tL2FubG9naWMv
c2RrLAphbmQgd2lsbCBzdWJtaXQgaXQgdG8gbWFpbmxpbmUgYXQgc3VpdGFibGUgdGltZS4KSXQg
aXMgYmV0dGVyIHRoYXQgYW5sb2dpYyBTT0NzIGFyZSBsb25nIHRlcm0gbWFpbnRhaW5lZCBhbmQg
c3VwcG9ydGVkCmJ5IEFubG9naWMgb2ZmaWNpYWxseSBpbiBtYWlubGluZSBhbmQgZm9yIGN1c3Rv
bWVycy4KVGhlIGNvZGUgc2hvdWxkIGJlIGEgZnVsbCBmZWF0dXJlIHZlcnNpb24gYWZ0ZXIgbG90
cyBvZiB0ZXN0cywgbm90IHRoZQptb2RpZmllZCBhbmQgc2ltcGxpZmllZCB2ZXJzaW9uIGZyb20g
QW5sb2dpYyBvcGVuIHNvdXJjZS4KQW5kIHdlIGhvcGUgdGhhdCB0aGVyZSB3b24ndCBiZSB0d28g
ZGlmZmVyZW50IHZlcnNpb25zIGNvZGUgb2YgYW5sb2dpYyBTT0NzLAppdCBtYXkgY29uZnVzZSBj
dXN0b21lcnMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
