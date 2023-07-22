Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D384EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpRxSt3SxmqoIV1vN+5RqJPKuhQqF9DqQjMybeHp9mY=; b=R39izgdyNFDsUk
	ABHDcMM9RjL7G5a3/B585xSozMr/O7JQiKy+vEDkc6UZLD0DfWSEskDTgrLI/Ci0JhWN4CA+Q9lB3
	uA3CX/LLEuQmpWk5URxA6+cu1nb5G8Ej+MkLhsH1A6DWFNKNJKL88KhIlTr0KkX3oitD7UwMlKVZU
	FUrBB9PrNDDtKSpFfHf21HKxwkiMCzoJSS3fS4m+6UIzjqJuTPcdOFXkuVztsOlq0Q4dxH70tEv/4
	N10XRvCOs7dFcZFF1r5ZJDorPMKLBM0ecT16BH/nFZA+GUOU3BaPTgvsTmNXb9aWJ/1Fdfz2kBXDl
	8ZSfL6HEC3Zb/nAgMc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8qa-00GFGo-38;
	Sat, 22 Jul 2023 09:24:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8qY-00GFFq-1H
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 09:24:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29C4B60AF3;
	Sat, 22 Jul 2023 09:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AEFC433C7;
	Sat, 22 Jul 2023 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690017853;
	bh=A7F1zmUw4KPxRoXFXZ1pO5q/1gFrwvDuZVFBYVGEmXw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XcpBxqhEBeZsE22MmnIwHig0zXtwwyxQj7CLUw5rjbraL+O2OksMlQsPcgAWESJDj
	 ufzwQWM2avduDQ8Uo/Bn3Y28mShJRp98o76oHCZyPZbBqVYYxiLsqtEOlQ0JB7T3mW
	 HVXkNacF1dWMzFRTLab5FYRvoeBx3CAvqe+KpwBMxfvAEQW4VTRSenJec+xpHIhz2T
	 IjSCmNAWrSEkaogfT3FrK7zI8lL/aeBP5rBngQIOt3lZHOTTx62e/MhzUuCxYd9AdW
	 HJVoO2ru2XSLJqUUi7Qb8tmsZ5Ko6V2KYMm/ox3joXy0+R5XjHRh718NCyEnF4uZgx
	 tvlnaEujfCGzg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, pulehui@huawei.com,
 conor.dooley@microchip.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 kpsingh@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: Re: [PATCH bpf-next 0/2] bpf, riscv: use BPF prog pack allocator in
 BPF JIT
In-Reply-To: <20230720154941.1504-1-puranjay12@gmail.com>
References: <20230720154941.1504-1-puranjay12@gmail.com>
Date: Sat, 22 Jul 2023 11:24:10 +0200
Message-ID: <87fs5gguyt.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_022418_499675_4ADC72A2 
X-CRM114-Status: UNSURE (   9.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEJQRiBwcm9n
cmFtcyBjdXJyZW50bHkgY29uc3VtZSBhIHBhZ2UgZWFjaCBvbiBSSVNDVi4gRm9yIHN5c3RlbXMg
d2l0aCBtYW55IEJQRgo+IHByb2dyYW1zLCB0aGlzIGFkZHMgc2lnbmlmaWNhbnQgcHJlc3N1cmUg
dG8gaW5zdHJ1Y3Rpb24gVExCLiBIaWdoIGlUTEIgcHJlc3N1cmUKPiB1c3VhbGx5IGNhdXNlcyBz
bG93IGRvd24gZm9yIHRoZSB3aG9sZSBzeXN0ZW0uCj4KPiBTb25nIExpdSBpbnRyb2R1Y2VkIHRo
ZSBCUEYgcHJvZyBwYWNrIGFsbG9jYXRvclsxXSB0byBtaXRpZ2F0ZSB0aGUgYWJvdmUgaXNzdWUu
Cj4gSXQgcGFja3MgbXVsdGlwbGUgQlBGIHByb2dyYW1zIGludG8gYSBzaW5nbGUgaHVnZSBwYWdl
LiBJdCBpcyBjdXJyZW50bHkgb25seQo+IGVuYWJsZWQgZm9yIHRoZSB4ODZfNjQgQlBGIEpJVC4K
Pgo+IEkgZW5hYmxlZCB0aGlzIGFsbG9jYXRvciBvbiB0aGUgQVJNNjQgQlBGIEpJVFsyXS4gSXQg
aXMgYmVpbmcgcmV2aWV3ZWQgbm93Lgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgZW5hYmxlcyB0aGUg
QlBGIHByb2cgcGFjayBhbGxvY2F0b3IgZm9yIHRoZSBSSVNDViBCUEYgSklULgo+IFRoaXMgc2Vy
aWVzIG5lZWRzIGEgcGF0Y2hbM10gZnJvbSB0aGUgQVJNNjQgc2VyaWVzIHRvIHdvcmsuCgpKdXN0
IGEgaGVhZHMtdXA7IEknbSBvbiB2YWNhdGlvbiBmb3IgMiBtb3JlIHdlZWtzLCBzbyBleHBlY3Qg
YSBzb21ld2hhdApsYXRlIHJldmlldyBmcm9tIG15IHNpZGUhCgpUaGFuayB5b3UgZm9yIHdvcmtp
bmcgb24gdGhlIFJJU0MtViBCUEYgSklUIQoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
