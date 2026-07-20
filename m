Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D3C44521
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MWWLNnJC1g9t6ZQS7/xVqlBa71bp161BkzvTn6cZq7Y=; b=UC5PVVISFZck0H
	Jv/6HH9mO8vHymP70SELLrpv0UbM8cgZoLJbuH+fda3lStRGK/x9Hj67ewHBybHqhhFUzJOm95qKL
	NnXv/FJmCOUoFRSC80t73uL40n4jutbx5zzQRBuI/iqSs3ZCdQAVUw3qcGUPILo2hEpkfEasNYRys
	XQ6jO2zptdV3Ot0SRgtiVFCubNxQB8VUIkKTDJy11eQhDUWEEwLOrJJkS49zDoYOY8Ck9Qgz0R23K
	92FP75QfvAwM+8QdQl2Dkd84D0OqUp98QmLb8Lmo3rzDS/1Hx6JkpkrmeMoWu539VbZQYGAbU62yW
	eS1FcEJK/gZ7z474WmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhin-00000005zCT-3qqQ;
	Mon, 20 Jul 2026 06:43:25 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhik-00000005zBq-1Id4
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:24 +0000
X-UUID: 48264f24840611f1aa26b74ffac11d73-20260720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6ca9ffa6-c7ae-4817-81ff-9bf191c7c61c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:9fe386d20ed2bd4355799ee68e0faaa8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48264f24840611f1aa26b74ffac11d73-20260720
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 384922734; Mon, 20 Jul 2026 14:43:14 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Date: Mon, 20 Jul 2026 06:42:57 +0000
Subject: [PATCH v4] bpf, riscv: fix extable handling for arena load_acquire
MIME-Version: 1.0
Message-Id: <20260720-bpf-riscv-fix-extable-v4-1-165c0b3b07d5@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAHDDXWoC/43N0Q6CIBSA4VdpXEeDAwp01Xu0LhAhWU4dOKZzv
 nvoVa21uvzP2fnOgqIN3kZ0Piwo2OSj77sc/HhAptHd3WJf50ZAoCSClrgaHA4+moSdn7CdRl2
 1FjOlFBdGCyFrlG+HYPN6d6+33I2PYx/m/U2i2/SXmCimWDsCzBgqtOOXx9z6ro8n06GNTPAXA
 5nhQJ0oJIWCsQ+GvTBAvjEsM1bpkjApgRH1xqzr+gSA4M6qSQEAAA==
X-Change-ID: 20260716-bpf-riscv-fix-extable-399947ca778d
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234323_018033_96F8E73A 
X-CRM114-Status: UNSURE (   9.60  )
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

ZW1pdF9hdG9taWNfbGRfc3QoKSByZXR1cm5zIDEgdG8gaGF2ZSBidWlsZF9ib2R5KCkgc2tpcCB0
aGUgemV4dCBhZnRlcgphIHN1Yi13b3JkIGxvYWRfYWNxdWlyZS4gVGhlIGNhbGxlciBkb2VzICJy
ZXQgPSByZXQgPzoKYWRkX2V4Y2VwdGlvbl9oYW5kbGVyKC4uLikiLCB3aGljaCBza2lwcyBhZGRf
ZXhjZXB0aW9uX2hhbmRsZXIoKSBvbiBhbnkKbm9uLXplcm8gcmV0LCBzbyB0aGUgZXh0YWJsZSBl
bnRyeSBpcyBtaXNzaW5nIGFuZCBhIGZhdWx0aW5nClBST0JFX0FUT01JQyBsb2FkX2FjcXVpcmUg
b29wc2VzLgoKUkVHX0RPTlRfQ0xFQVJfTUFSS0VSIGxlYXZlcyByZCBzdGFsZSBvbiBmYXVsdCwg
YW5kIHRoZSB2ZXJpZmllciBzdGlsbAp0aGlua3MgdGhlIGxvYWQgb3Zlcndyb3RlIGl0LCBzbyBh
IHByb2dyYW0gY2FuIGxlYWsgaXQgdGhyb3VnaCBhIG1hcC4KCkNoZWNrIHJldCA+PSAwIGJlZm9y
ZSBjYWxsaW5nIGFkZF9leGNlcHRpb25faGFuZGxlcigpLCBhbmQgcGFzcyByZCBmb3IKTE9BRF9B
Q1Egc28gdGhlIGZhdWx0IHplcm9lcyByZCBsaWtlIGEgUFJPQkVfTUVNIGxvYWQuIFJldHVybiBy
ZXQKdW5jaGFuZ2VkIGZvciB0aGUgemV4dCBza2lwLgoKRml4ZXM6IGZiN2NlZmFiYWU4MSAoInJp
c2N2LCBicGY6IEFkZCBzdXBwb3J0IGFyZW5hIGF0b21pY3MgZm9yIFJWNjQiKQpTdWdnZXN0ZWQt
Ynk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+ClJldmlld2VkLWJ5OiBQdSBMZWh1aSA8
cHVsZWh1aUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBGZW5nIEppYW5nIDxqaWFuZ2ZlbmdA
a3lsaW5vcy5jbj4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gTm8gY29kZSBjaGFuZ2VzIChwdXJlIHYz
IHJlLXNlbmQpLgotIFJlc3RvcmUgU3VnZ2VzdGVkLWJ5IGZvciBQdSBMZWh1aSAoZnJvbSB2Miwg
bWlzc2VkIGluIHYzKS4KLSBSZXN0b3JlIFJldmlld2VkLWJ5IGZyb20gUHUgTGVodWkgKHYyKQot
IExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA3MjAtYnBmLXJpc2N2
LWZpeC1leHRhYmxlLXYzLTEtZTlhNjAzODgyMzA5QGt5bGlub3MuY24KCkNoYW5nZXMgaW4gdjM6
Ci0gUGFzcyByZCB0byBhZGRfZXhjZXB0aW9uX2hhbmRsZXIoKSBmb3IgTE9BRF9BQ1Egc28gdGhl
IGRlc3RpbmF0aW9uIGlzCiAgemVyb2VkIG9uIGZhdWx0IGluc3RlYWQgb2YgUkVHX0RPTlRfQ0xF
QVJfTUFSS0VSIChCasO2cm4gVMO2cGVsKS4KLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjYwNzE2LWJwZi1yaXNjdi1maXgtZXh0YWJsZS12Mi0xLTQyMWY3NTgxMjUz
M0BreWxpbm9zLmNuCgpDaGFuZ2VzIGluIHYyOgotIERyb3AgZXh0cmEgdmFyaWFibGUgYXMgc3Vn
Z2VzdGVkIGJ5IFB1IExlaHVpLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNjA3MTYtYnBmLXJpc2N2LWZpeC1leHRhYmxlLXYxLTEtYWYwMjNjYzE3YWY0QGt5bGlu
b3MuY24KLS0tCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgNyArKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMKaW5kZXggZjlkNTM0N2JhOTY2Li5lMTUxOWFiNDM1NmMgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYwpAQCAtMTk4Niw3ICsxOTg2LDEyIEBAIGludCBicGZfaml0X2VtaXRfaW5z
bihjb25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4
LAogCQllbHNlCiAJCQlyZXQgPSBlbWl0X2F0b21pY19ybXcocmQsIHJzLCBpbnNuLCBjdHgpOwog
Ci0JCXJldCA9IHJldCA/OiBhZGRfZXhjZXB0aW9uX2hhbmRsZXIoaW5zbiwgUkVHX0RPTlRfQ0xF
QVJfTUFSS0VSLCBjdHgpOworCQkvKiByZXQgY2FuIGJlIDEgKHNraXAtemV4dCk7IGV4dGFibGUg
ZW50cnkgc3RpbGwgbmVlZHMgdG8gYmUgYWRkZWQgKi8KKwkJaWYgKHJldCA+PSAwKQorCQkJcmV0
ID0gYWRkX2V4Y2VwdGlvbl9oYW5kbGVyKGluc24sCisJCQkJaW5zbi0+aW1tID09IEJQRl9MT0FE
X0FDUSA/IHJkIDogUkVHX0RPTlRfQ0xFQVJfTUFSS0VSLAorCQkJCWN0eCkgPzogcmV0OworCiAJ
CWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCQlicmVhazsKCi0tLQpiYXNlLWNvbW1pdDogYTEz
YzE0MGNjMjg5YzBiN2IzNzcwYmNlNWIzYWQ0MmFiMzUwNzRhYQpjaGFuZ2UtaWQ6IDIwMjYwNzE2
LWJwZi1yaXNjdi1maXgtZXh0YWJsZS0zOTk5NDdjYTc3OGQKCkJlc3QgcmVnYXJkcywKLS0gCkZl
bmcgSmlhbmcgPGppYW5nZmVuZ0BreWxpbm9zLmNuPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
