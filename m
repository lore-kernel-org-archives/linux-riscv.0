Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA37C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 May 2022 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aqpMP1/KVUeYVKJfoRe2ctDXTfZCRIY/rdqEMdkDNVw=; b=3Iu7D9uGe+o7M0
	XQ9HQYl3fppsLKl0y/bSOg9oWccny8d5l9t7AKOXmfRsNsC9XwmrFLDTal9YkjdarnBtU8I55Pegj
	JYgWNylgD7bm08U++PoEEAR6CPMUcopH7fxQ6RZzdfGmrEgqz2x2wfdLch6/+LND6iVGxrPWXDlbL
	Nv/MMEtoF7kuzJRY/ukDnpuBbF1gkmZQBYk6q5ydWsOFqy1k2wvzyABMie6fe1HxQUdaMJbBSd8g5
	wxZV8aOpg8/eByxk/4IbF67TJdXOJCIDd8R192OMALQTOAvcPUSM1nrMZAIpD6aSPpCAVkEQK27B+
	K6Zx2Ev5IcM7oNmr0i4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltsn-006LDB-1M; Tue, 03 May 2022 14:52:09 +0000
Received: from mail.megasoftsol.com ([43.231.250.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltsb-006L3l-Uj
 for linux-riscv@lists.infradead.org; Tue, 03 May 2022 14:52:00 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.megasoftsol.com (Postfix) with ESMTP id CA03790D71F
 for <linux-riscv@lists.infradead.org>; Tue,  3 May 2022 20:17:00 +0530 (IST)
Received: from mail.megasoftsol.com ([127.0.0.1])
 by localhost (mail.megasoftsol.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gqoYP82eWi46 for <linux-riscv@lists.infradead.org>;
 Tue,  3 May 2022 20:17:00 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
 by mail.megasoftsol.com (Postfix) with ESMTP id 5BE6E90D6D4
 for <linux-riscv@lists.infradead.org>; Tue,  3 May 2022 20:17:00 +0530 (IST)
X-Virus-Scanned: amavisd-new at megasoftsol.com
Received: from mail.megasoftsol.com ([127.0.0.1])
 by localhost (mail.megasoftsol.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zjXMZ_e32z3g for <linux-riscv@lists.infradead.org>;
 Tue,  3 May 2022 20:17:00 +0530 (IST)
Received: from asda.co.uk (unknown [20.97.211.134])
 (Authenticated sender: admin)
 by mail.megasoftsol.com (Postfix) with ESMTPSA id 92B3D90D690
 for <linux-riscv@lists.infradead.org>; Tue,  3 May 2022 20:16:59 +0530 (IST)
From: ASDA Stores Limited <Hanes.Thomas23877@asda.co.uk>
To: linux-riscv@lists.infradead.org
Subject: 2nd Quater puchase request
Date: 03 May 2022 14:49:27 +0000
Message-ID: <20220503092157.45103AF4A66958B4@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_075158_333359_31267625 
X-CRM114-Status: UNSURE (  -0.57  )
X-CRM114-Notice: Please train this message.
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
Reply-To: sales@asdaa.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RGVhciBsaW51eC1yaXNjdgoKV2UgYXJlIGludGVyZXN0ZWQgaW4gaGF2aW5nIHNvbWUgb2YgeW91
ciBob3Qgc2VsbGluZyBwcm9kdWN0IGluIApvdXIgc3RvcmVzIGFuZCBvdXRsZXRzIHNwcmVhZCBh
bGwgb3ZlciBVbml0ZWQgS2luZ2RvbSwgTm9ydGhlcm4gCklzbGFuZCBhbmQgQWZyaWNhLiBBU0RB
IFN0b3JlcyBMaW1pdGVkIGlzIG9uZSBvZiB0aGUgaGlnaGVzdC0KcmFua2luZyBXaG9sZXNhbGUg
JiBSZXRhaWwgb3V0bGV0cyBpbiB0aGUgVW5pdGVkIEtpbmdkb20uIAogIApXZSBzaGFsbCBmdXJu
aXNoIG91ciBkZXRhaWxlZCBjb21wYW55IHByb2ZpbGUgaW4gb3VyIG5leHQgCmNvcnJlc3BvbmRl
bnQuIEhvd2V2ZXIsIGl0IHdvdWxkIGJlIGFwcHJlY2lhdGVkIGlmIHlvdSBjYW4gc2VuZCAKdXMg
eW91ciBjYXRhbG9nIHRocm91Z2ggZW1haWwgdG8gbGVhcm4gbW9yZSBhYm91dCB5b3VyIGNvbXBh
bnkncyAKcHJvZHVjdHMgYW5kIHdob2xlc2FsZSBxdW90ZS4gSXQgaXMgaG9wZWZ1bCB0aGF0IHdl
IGNhbiBzdGFydCBhIAp2aWFibGUgbG9uZy1sYXN0aW5nIGJ1c2luZXNzIHJlbGF0aW9uc2hpcCAo
cGFydG5lcnNoaXApIHdpdGggeW91LiAgCiAgCiAgCllvdXIgcHJvbXB0IHJlc3BvbnNlIHdvdWxk
IGJlIGRlbGlnaHRmdWxseSBhcHByZWNpYXRlZC4gCiAgCkJlc3QgV2lzaGVzIAogIAogIApIYW5l
cyBTLiBUaG9tYXMgClByb2N1cmVtZW50IE9mZmljZS4gCkFTREEgU3RvcmVzIExpbWl0ZWQgClRl
bDogICsgNDQgLSA3NDUxMjcxNjUwIApXaGF0c0FwcDogKyA0NCDigJMgNzQ0MTQ0MDM2MCAKV2Vi
c2l0ZTogd3d3LmFzZGEuY28udWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
