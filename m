Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE578D12690
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJ8zHpQTRmeiInYgEabUkLsniliOebKVaoAjjDPoNgY=; b=zta8uPtDqO6U3M
	zR4vEQeYijb/L0svERwQDgKyN9AgBf1AKd3psCkkH5a07gU4efW6yw4st4rX47M3z3TIq4FqrdJQQ
	pvjNtkCHct37lENQGhVb6vuuwgIImNpgTQUp15RNrZvMPfKsjR4DRrPYcmVgUrF+DtLGTCRG4mocJ
	5vCM0pCIKb3AFyyJcA0vaM3O1wyWWIOWqqtsJaCQF/CRk+LBCpc5GpnKRP5W5ux8vGdoQzBSMtRLu
	/cOYano6AwtVjndzHamSeKaQqfyXfvXG1VsYUfrz4ONZ8EyvBcnnaZnyrAf2EAUoPSfyzoh3zZ760
	N7pCrZwERJLaKm/VDwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8I19-0000000Gtv0-1bI4;
	Tue, 05 Nov 2024 11:46:39 +0000
Received: from relay1.mymailcheap.com ([144.217.248.102])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8I15-0000000GtuZ-3EoU
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 11:46:37 +0000
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id BDCD93E859;
	Tue,  5 Nov 2024 11:46:29 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id F067140078;
	Tue,  5 Nov 2024 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1730807187; bh=CJiyeokDj6c9VIvYdrBd9CQEjiOeVmC3TfnoQ0s8ow4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XmK/AzQbLW3MPx5gEe4Pzv/y2uk/+okvNMd7CzxkK4V3C00d+9T9oFCs2GsFDG6UP
	 mJDLoHy/yhq3GqOufIL9dYQ6sh+bqgZ2Wcyz5GkWmspOrzvKdUC2J5iwvGFubrilWl
	 jrQnth5Eo9G3HIStdGHBua6Lx/dUCnnAMN3vgwuM=
Received: from [198.18.0.1] (unknown [58.32.43.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 478E441500;
	Tue,  5 Nov 2024 11:46:24 +0000 (UTC)
Message-ID: <48a22231-89ec-460b-913b-54af18166da7@aosc.io>
Date: Tue, 5 Nov 2024 19:46:21 +0800
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Mykola Lysenko <mykolal@fb.com>, bpf@vger.kernel.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
References: <20240927131355.350918-1-bjorn@kernel.org>
Content-Language: en-US
From: Kexy Biscuit <kexybiscuit@aosc.io>
In-Reply-To: <20240927131355.350918-1-bjorn@kernel.org>
X-Rspamd-Queue-Id: F067140078
X-Rspamd-Server: nf1.mymailcheap.com
X-Spamd-Result: default: False [-0.09 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,fb.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_034635_907468_21EB0639 
X-CRM114-Status: GOOD (  13.33  )
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

T24gOS8yNy8yMDI0IDk6MTMgUE0sIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gRnJvbTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IGxpYmJwZiBkb2VzIG5vdCBpbmNsdWRl
IHRoZSBwZXItYXJjaCB0b29scyBpbmNsdWRlIHBhdGgsIGUuZy4KPiB0b29scy9hcmNoL3Jpc2N2
L2luY2x1ZGUuIFNvbWUgYXJjaGl0ZWN0dXJlcyBkZXBlbmQgdGhvc2UgZmlsZXMgdG8KPiBidWls
ZCBwcm9wZXJseS4KPiAKPiBJbmNsdWRlIHRvb2xzL2FyY2gvJChTVUJBUkNIKS9pbmNsdWRlIGlu
IHRoZSBsaWJicGYgYnVpbGQuCj4gCj4gRml4ZXM6IDZkNzRkMTc4ZmU2ZSAoInRvb2xzOiBBZGQg
cmlzY3YgYmFycmllciBpbXBsZW1lbnRhdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICAgdG9vbHMvbGliL2JwZi9NYWtlZmls
ZSB8IDMgKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9icGYvTWFrZWZpbGUgYi90b29scy9saWIv
YnBmL01ha2VmaWxlCj4gaW5kZXggMWIyMmYwZjM3Mjg4Li44NTdhNWY3YjQxM2QgMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvbGliL2JwZi9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL2xpYi9icGYvTWFrZWZp
bGUKPiBAQCAtNjEsNyArNjEsOCBAQCBpZm5kZWYgVkVSQk9TRQo+ICAgZW5kaWYKPiAgIAo+ICAg
SU5DTFVERVMgPSAtSSQob3IgJChPVVRQVVQpLC4pIFwKPiAtCSAgIC1JJChzcmN0cmVlKS90b29s
cy9pbmNsdWRlIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlL3VhcGkKPiArCSAgIC1JJChzcmN0
cmVlKS90b29scy9pbmNsdWRlIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlL3VhcGkgXAo+ICsJ
ICAgLUkkKHNyY3RyZWUpL3Rvb2xzL2FyY2gvJChTUkNBUkNIKS9pbmNsdWRlCj4gICAKPiAgIGV4
cG9ydCBwcmVmaXggbGliZGlyIHNyYyBvYmoKPiAgIAo+IAo+IGJhc2UtY29tbWl0OiBkYjVjYTI2
NWUzMzM0YjQ4YzRlM2ZhMDdlZWY3OWU4YmM1NzhjNDMwCgpUaGlzIGZpeGVzIGJ1aWxkaW5nIG9m
IGJwZiB0b29scywgdGhhbmtzISBZb3UgY2FuIGFkZCB0aGUgZm9sbG93aW5nIHRhZ3MuLi4KClJl
cG9ydGVkLWJ5OiBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1c2UuZGU+CkNsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL212bW83NDQ0MXRyLmZzZkBzdXNlLmRlLwpUZXN0ZWQtYnk6
IEtleHkgQmlzY3VpdCA8a2V4eWJpc2N1aXRAYW9zYy5pbz4KLS0gCkJlc3QgUmVnYXJkcywKS2V4
eSBCaXNjdWl0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
