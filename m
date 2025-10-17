Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4107CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvAMzkY9EKtHbulMsnL0t+dDtvdZX0uJNhSJgiLgjt8=; b=u2FsRRBGcURJTB
	3pk6IvO7QJVhrNVGFBFt7pVOAX00aNNzS3QfYPJVS0rKshqp86r4RI2sRhEQkQc26wstG4v6QVA8C
	scXdSpvNrfCo0NSD9rgwkfHnAtf0SANyUg+NY0dq7Gx1blNqu/W59zGx98KyZVOkw7TLLwdRMgyt6
	kBRqyW0qfg1YgH6CAJtWJ/JlIc5Y4bUVMMNGPwubp7ATJV5JHfYM/SHBtGh5dqwfAxnXZ/w0twlPF
	sPSlqlx630bweUBzFbFQX6b0vnKpFEe+6e2EPwEJywAKmKy71qhqlb2CoKFhTsrIjZI3GEH2P2gY0
	XG7gDcBUSX0zF1av/tjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mD4-00000008FKx-0MiR;
	Fri, 17 Oct 2025 15:17:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mD0-00000008FIc-2lgw
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:17:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B07140341;
	Fri, 17 Oct 2025 15:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C928C4CEFE;
	Fri, 17 Oct 2025 15:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760714254;
	bh=UELNKYaVfuic64Q2TAthiZ0D/w24Xzmlvf+JP/ejdcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjzG1vrtjafVsJEfJLgW80QEFGVUAVTdJGBCdoy+5jZnY1/DFYZz1ByQaK5GWPyhL
	 Owt/47qNWgZkADS+7hOSY9LtM6z6yBuOM962KpKFSl+8Q7NhYoM4XbY3qzWXE0+iMH
	 ZA25pMI02VQbRcDl3ro4C+fYfaLkwpRW5Cqea+BhXXz+7838TJUxRvvOxpdXefI3Tn
	 TCdcgReh80zCu8rkKgQsSKnUmBGSsiS99M8Tt5WJXRuVaLqQfDQToGVKZ7bnbbVNxp
	 xkKPv2x0O1mOupQSBzoZCfZyfL+jWwqfHCA3E4NmVVhgciMQMiexZ5BWIVBivHqPdu
	 9dudKMddAEJsg==
Date: Fri, 17 Oct 2025 20:47:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ron Economos <re@w6rz.net>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, Conor Dooley <conor@kernel.org>, bhelgaas@google.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, Paul Walmsley <pjw@kernel.org>, 
	Greentime Hu <greentime.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	regressions@lists.linux.dev
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
Message-ID: <v5ziiexkr5tncfocmxtke52kewdjhaxq3mrz3bh52p35ercjzm@vpxhbsxgnqrc>
References: <20251013212801.GA865570@bhelgaas>
 <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
 <95a0f2a4-3ddd-4dec-a67e-27f774edb5fd@w6rz.net>
 <759e429c-b160-46ff-923e-000415c749ee@oss.qualcomm.com>
 <b203ba27-7033-41d9-9b43-aa4a7eb75f23@w6rz.net>
 <yxdwo4hppd7c7lrv5pybjtu22aqh3lbk34qxdxmkubgwukvgwq@i4i45fdgm6sw>
 <18ef2c73-fb10-47b3-838f-bc9d3fd2dbc2@w6rz.net>
 <xfpqp3oign7c3336wxo5yexgitxotttrxgkyzbfknjmfk6pmdc@drsk3ardfl5t>
 <432e4026-208f-459e-82dc-e74ef5da6a87@oss.qualcomm.com>
 <6bf478b8-2194-4ffb-aaac-8e3e314ad71c@w6rz.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bf478b8-2194-4ffb-aaac-8e3e314ad71c@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_081734_716970_E07D4F0C 
X-CRM114-Status: GOOD (  10.46  )
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

T24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgMDc6MjE6MDZBTSAtMDcwMCwgUm9uIEVjb25vbW9zIHdy
b3RlOgoKWy4uLl0KCj4gPiBIaSBSb24sCj4gPiAKPiA+IENhbiB5b3UgdHJ5IHdpdGggdGhpcyBz
ZXJpZXMgYW5kIGxldCB1cyBrbm93IGlmIGl0IGlzIGhlbHBpbmcgeW91IG9yCj4gPiBub3QuCj4g
PiAKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAxNy1lY2FtX2ZpeC12MS0w
LWY2ZmFhM2QwZWRmM0Bvc3MucXVhbGNvbW0uY29tLwo+ID4gCj4gPiAKPiA+IC0gS3Jpc2huYSBD
aGFpdGFueWEuCj4gCj4gVGhlIHBhdGNoIHdvcmtzIGdvb2QuIEhlcmUncyB0aGUgbG9nIG9mIFBD
SSBtZXNzYWdlcy4KPiAKPiBbwqDCoMKgIDMuMjIxNTA2XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5w
Y2llOiBob3N0IGJyaWRnZSAvc29jL3BjaWVAZTAwMDAwMDAwCj4gcmFuZ2VzOgo+IFvCoMKgwqAg
My4yMjE1OTRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoMKgIElPCj4gMHgw
MDYwMDgwMDAwLi4weDAwNjAwOGZmZmYgLT4gMHgwMDYwMDgwMDAwCj4gW8KgwqDCoCAzLjIyMTY1
OF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgIE1FTQo+IDB4MDA2MDA5MDAw
MC4uMHgwMDdmZmZmZmZmIC0+IDB4MDA2MDA5MDAwMAo+IFvCoMKgwqAgMy4yMjE2OTZdIGZ1NzQw
LXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoCBNRU0KPiAweDIwMDAwMDAwMDAuLjB4M2Zm
ZmZmZmZmZiAtPiAweDIwMDAwMDAwMDAKPiBbwqDCoMKgIDMuMjIxNzgzXSBmdTc0MC1wY2llIGUw
MDAwMDAwMC5wY2llOiBFQ0FNIGF0IFttZW0KPiAweGRmMDAwMDAwMC0weGRmZmZmZmZmZl0gZm9y
IFtidXMgMDAtZmZdCgpBcyBhIG5pY2Ugc2lkZSBlZmZlY3Qgb2YgdGhlIHJlZ3Jlc3Npb24gZml4
LCB5b3VyIHBsYXRmb3JtIGlzIG5vdyB1c2luZyBFQ0FNCm1vZGUgYnkgZGVmYXVsdCA6KSBUaGFu
a3MgZm9yIHRlc3RpbmcuCgpJIGhvcGUgQmpvcm4gd2lsbCBtZXJnZSB0aGlzIHNlcmllcyBmb3Ig
Ni4xOC1yY1guCgotIE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k
4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
