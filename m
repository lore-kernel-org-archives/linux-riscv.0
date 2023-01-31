Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB881C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3nNtz8GsunWeIGLgH0b8C/hHvlg75pRYEieIQ9fLKM=; b=FwRC9eW6xhFlhl
	Ajqmf6mffspJO17w5k1TVtZt0K2pzSTRn1HzHgs2saKDXPY3dPke5sHWbHKN5d27TOsdkV8xU0CgL
	2/M5rDrbf64CGpYjb4hz5xCwcz6Lx8CvZz/tcIbLmtWR7ffYfnQiiveKH2sgxJQ2YKGbmSNe2wJEK
	52G5E+YrTe75rL5ri+I/X5RMTJ3BJf+oUHKeHj/78JDIHrGRAbO+f8pDEhjG71L2LdXxIgbSQu9sv
	9tzwgJdAjQ54TpGrWrSSWnWKWHwST5MTSU6JFidhpF43DCFaWfG1x5u6uKp0YMXTD7082bxrTfiSV
	qHZj5Wj+YOZzxvjWNbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMq6y-007usP-DH; Tue, 31 Jan 2023 12:51:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMq6u-007urA-Gx
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 12:51:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ACB05B81BDF;
	Tue, 31 Jan 2023 12:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF1CC433EF;
	Tue, 31 Jan 2023 12:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675169495;
	bh=JxNQRX+QU5FxJ+pG19MtmDCcoMZNk1iYqK5l6r83z5k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PCisQxYq5GvV0wFoZ3cwFgIynkn5FKpuPsw+SRmm+NelGNF8kch1LhLBiLveaPCTv
	 M6thttqPFnoDZa9yPxMKq7D16Hl8L3f7cq9ysu/20oCh4/b9y+jbLNAQijppMk/udo
	 2BUQ/C1lzimFfRUGHO2PBSN31OUseRbpQa6gYL27mLqhIwybZtqE1NY9nDOO9Yx3lF
	 0NQkceCWl/rIPem8LOCgi2yEPSP1NvlH1k8axmjq2e0qQsoUpWo+sXG4xeuVfnM8gW
	 8VPuj6GzOZ+OpvtFF307LLf6jEl+LuabFr0lw8ttDwQF9cJSWDeudC1gkg/FbBW9zg
	 5n30MQs5Uk4BQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com
Subject: Re: [PATCH v6 11/13] riscv/kprobe: Fix instruction simulation of JALR
In-Reply-To: <20230127130541.1250865-12-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <20230127130541.1250865-12-chenguokai17@mails.ucas.ac.cn>
Date: Tue, 31 Jan 2023 13:51:32 +0100
Message-ID: <877cx26f57.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_045141_805372_A46FF002 
X-CRM114-Status: GOOD (  11.62  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEZy
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPgo+IFNldCBrcHJvYmUgYXQg
J2phbHIgMTE0MChyYSknIG9mIHZmc193cml0ZSByZXN1bHRzIGluIHRoZSBmb2xsb3dpbmcKPiBj
cmFzaDoKPgo+IFsgICAzMi4wOTIyMzVdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIGFjY2VzcyB0
byB1c2VyIG1lbW9yeSB3aXRob3V0IHVhY2Nlc3Mgcm91dGluZXMgYXQgdmlydHVhbCBhZGRyZXNz
IDAwYWFhYWFhZDc3YjExNzAKPiBbICAgMzIuMDkzMTE1XSBPb3BzIFsjMV0KPiBbICAgMzIuMDkz
MjUxXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiBbICAgMzIuMDkzNjI2XSBDUFU6IDAgUElEOiAxMzUg
Q29tbTogZnRyYWNldGVzdCBOb3QgdGFpbnRlZCA2LjIuMC1yYzItMDAwMTMtZ2IwYWE1ZTVkZjBj
Yi1kaXJ0eSAjMTYKPiBbICAgMzIuMDkzOTg1XSBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8s
cWVtdSAoRFQpCj4gWyAgIDMyLjA5NDI4MF0gZXBjIDoga3N5c19yZWFkKzB4ODgvMHhkNgo+IFsg
ICAzMi4wOTQ4NTVdICByYSA6IGtzeXNfcmVhZCsweGMwLzB4ZDYKPiBbICAgMzIuMDk1MDE2XSBl
cGMgOiBmZmZmZmZmZjgwMWNkYTgwIHJhIDogZmZmZmZmZmY4MDFjZGFiOCBzcCA6IGZmMjAwMDAw
MDBkN2JkYzAKPiBbICAgMzIuMDk1MjI3XSAgZ3AgOiBmZmZmZmZmZjgwZjE0MDAwIHRwIDogZmY2
MDAwMDA4MGY5Y2I0MCB0MCA6IGZmZmZmZmZmODBmMTNlODAKPiBbICAgMzIuMDk1NTAwXSAgdDEg
OiBmZmZmZmZmZjgwMDBjMjljIHQyIDogZmZmZmZmZmY4MDBkYmM1NCBzMCA6IGZmMjAwMDAwMDBk
N2JlNjAKPiBbICAgMzIuMDk1NzE2XSAgczEgOiAwMDAwMDAwMDAwMDAwMDAwIGEwIDogZmZmZmZm
ZmY4MDVhNjRhZSBhMSA6IGZmZmZmZmZmODBhODM3MDgKPiBbICAgMzIuMDk1OTIxXSAgYTIgOiBm
ZmZmZmZmZjgwZjE2MGEwIGEzIDogMDAwMDAwMDAwMDAwMDAwMCBhNCA6IGYyMjliMGFmZGIxNjUz
MDAKPiBbICAgMzIuMDk2MTcxXSAgYTUgOiBmMjI5YjBhZmRiMTY1MzAwIGE2IDogZmZmZmZmZmY4
MGVlZWJkMCBhNyA6IDAwMDAwMDAwMDAwMDAzZmYKPiBbICAgMzIuMDk2NDExXSAgczIgOiBmZjYw
MDAwMDdmZjc2ODAwIHMzIDogZmZmZmZmZmZmZmZmZmZmNyBzNCA6IDAwYWFhYWFhZDc3YjExNzAK
PiBbICAgMzIuMDk2NjM4XSAgczUgOiBmZmZmZmZmZjgwZjE2MGEwIHM2IDogZmY2MDAwMDA3ZmY3
NjgwMCBzNyA6IDAwMDAwMDAwMDAwMDAwMzAKPiBbICAgMzIuMDk2ODY1XSAgczggOiAwMGZmZmZm
ZmMzZDk3YmUwIHM5IDogMDAwMDAwMDAwMDAwMDAwNyBzMTA6IDAwYWFhYWFhZDc3Yzk0MTAKPiBb
ICAgMzIuMDk3MDkyXSAgczExOiAwMDAwMDAwMDAwMDAwMDAwIHQzIDogZmZmZmZmZmY4MGYxM2U0
OCB0NCA6IGZmZmZmZmZmODAwMGMyOWMKPiBbICAgMzIuMDk3MzE3XSAgdDUgOiBmZmZmZmZmZjgw
MDBjMjljIHQ2IDogZmZmZmZmZmY4MDBkYmM1NAo+IFsgICAzMi4wOTc1MDVdIHN0YXR1czogMDAw
MDAwMDIwMDAwMDEyMCBiYWRhZGRyOiAwMGFhYWFhYWQ3N2IxMTcwIGNhdXNlOiAwMDAwMDAwMDAw
MDAwMDBkCj4gWyAgIDMyLjA5ODAxMV0gWzxmZmZmZmZmZjgwMWNkYjcyPl0ga3N5c193cml0ZSsw
eDZjLzB4ZDYKPiBbICAgMzIuMDk4MjIyXSBbPGZmZmZmZmZmODAxY2RjMDY+XSBzeXNfd3JpdGUr
MHgyYS8weDM4Cj4gWyAgIDMyLjA5ODQwNV0gWzxmZmZmZmZmZjgwMDAzYzc2Pl0gcmV0X2Zyb21f
c3lzY2FsbCsweDAvMHgyCj4KPiBTaW5jZSB0aGUgcnMxIGFuZCByZCBtaWdodCBiZSB0aGUgc2Ft
ZSBvbmUsIHN1Y2ggYXMgJ2phbHIgMTE0MChyYSknLAo+IGhlbmNlIGl0IHJlcXVpcmVzIG9idGFp
bmluZyB0aGUgdGFyZ2V0IGFkZHJlc3MgZnJvbSByczEgZm9sbG93ZWQgYnkKPiB1cGRhdGluZyBy
ZC4KPgo+IEZpeGVzOiBjMjJiMGJjYjFkZDAgKCJyaXNjdjogQWRkIGtwcm9iZXMgc3VwcG9ydGVk
IikKPiBTaWduZWQtb2ZmLWJ5OiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+CgpU
aGlzIGhhcyBhbHJlYWR5IGJlZW4gcGlja2VkIHVwIHRvIHJpc2N2LWZpeGVzOgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8xNjc0NjI1ODE2OTEuMzAxNS41MDQ1NDE0MDU2MzA2
MzMzNDYyLmdpdC1wYXRjaHdvcmstbm90aWZ5QGtlcm5lbC5vcmcvCgpObyBuZWVkIHRvIGhhdmUg
dGhpcyBwYXRjaCBpbiB0aGUgc2VyaWVzIChhbmQgZGl0byB0bwpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDIzMDEyNzEzMDU0MS4xMjUwODY1LTExLWNoZW5ndW9rYWkxN0Bt
YWlscy51Y2FzLmFjLmNuLwp0aGF0IEd1byBzdWJtaXR0ZWQgYSBmaXggZm9yKS4KCgpCasO2cm4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
