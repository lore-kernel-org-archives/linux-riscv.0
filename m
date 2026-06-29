Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F98CC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K2KDVbgJhDXn7xKLqdza1TRh/+DSpeiftUdlfZQjcWc=; b=N4oj3+8Vw4G544
	4iGVWjNfpPNFW6dejkjCCkUdvf/NBaN4vT3hgSlGyYbiJ5GWLfncFOfw/RAD04wjZuN2yo4RZ+p2M
	mNFe962hPgGbDnC36UxqIUWwQUfFikmUrCqubo/r4+1Xu/9Lhsi0xC2Xr2JJyN+w/6KN9WPh6GlWs
	DCFsNP2sVArmfTQqvF2tTYpqZVkUwl/cfe34VtOY29n/8ZZ4zxyFyGiiQG0T5zAPdtIJKUZu3JxnO
	G0Ypge0yRaAzOLc16DyGYewMWLAVTr0u/TjbUfjpZKz3VGTxIBDBAXlYNK2J0cfkyD+my5Xm/z8Le
	EaCL/k9w/oW9keU3lj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTk-0000000EnqP-4BMv;
	Mon, 29 Jun 2026 13:56:53 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTh-0000000EnnD-0MZh
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 13:56:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gpnrH1dGkzKHMd6
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id AD8B1407FB
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:37 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgCXBfOUeUJqDlQCAQ--.44260S2;
	Mon, 29 Jun 2026 21:56:37 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v4 0/6] Mixing bpf2bpf and tailcalls for RV64
Date: Mon, 29 Jun 2026 14:00:42 +0000
Message-Id: <20260629140048.733346-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCXBfOUeUJqDlQCAQ--.44260S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1kKFyrCF4DGF15ZFWrKrg_yoW8KF1Upa
	yfuF13Gryvgr1xAw4xta18Xa4rCF4S93W7Cr17tw1rAa1F9FyvgF1xKa1Fqas8AFZa934Y
	vr1YqF45C3y8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
	ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU0s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065649_503820_ADEFE949 
X-CRM114-Status: GOOD (  10.55  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkluIHRoZSBjdXJyZW50IFJWNjQg
SklULCBpZiB3ZSBqdXN0IGRvbid0IGluaXRpYWxpemUgdGhlIFRDQyBpbiBzdWJwcm9nLAp0aGUg
VENDIGNhbiBiZSBwcm9wYWdhdGVkIGZyb20gdGhlIHBhcmVudCBwcm9jZXNzIHRvIHRoZSBzdWJw
cm9jZXNzLCBidXQKdGhlIHVwZGF0ZWQgVENDIG9mIHRoZSBwYXJlbnQgcHJvY2VzcyBjYW5ub3Qg
YmUgcmVzdG9yZWQgd2hlbiB0aGUKc3VicHJvY2VzcyBleGl0cy4gU2luY2UgdGhlIFJWNjQgVEND
IGlzIGluaXRpYWxpemVkIGJlZm9yZSBzYXZpbmcgdGhlCmNhbGxlZSBzYXZlZCByZWdpc3RlcnMg
aW50byB0aGUgc3RhY2ssIHdlIGNhbm5vdCB1c2UgdGhlIGNhbGxlZSBzYXZlZApyZWdpc3RlciB0
byBwYXNzIHRoZSBUQ0MsIG90aGVyd2lzZSB0aGUgb3JpZ2luYWwgdmFsdWUgb2YgdGhlIGNhbGxl
ZQpzYXZlZCByZWdpc3RlciB3aWxsIGJlIGRlc3Ryb3llZC4gU28gd2UgaW1wbGVtZW50ZWQgbWl4
aW5nIGJwZjJicGYgYW5kCnRhaWxjYWxscyBzaW1pbGFyIHRvIHg4Nl82NCwgaS5lLiB1c2luZyBh
IG5vbi1jYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8KdHJhbnNmZXIgdGhlIFRDQyBiZXR3ZWVuIGZ1
bmN0aW9ucywgYW5kIHNhdmluZyB0aGF0IHJlZ2lzdGVyIHRvIHRoZQpzdGFjayB0byBwcm90ZWN0
IHRoZSBUQ0MgdmFsdWUuIEFzIGZvciB0aGUgdGFpbGNhbGwgaGllcmFyY2h5IGlzc3VlLAppbnNw
aXJlZCBieSB0aGUgczM5MCdzIGxvdy1vdmVyaGVhZCBhcHByb2FjaCwgd2Ugc3RvcmUgVENDIGZy
b20KUlZfUkVHX1RDQyBiYWNrIHRvIHN0YWNrIGFmdGVyIGNhbGxpbmcgYnBmMmJwZiBjYWxsIG9y
IGNhbGxpbmcgb3JpZyBicGYKZnVuYyBpbiBicGYgdHJhbXBvbGluZS4KCkluIGFkZGl0aW9uLCBz
b21lIGNvZGUgY2xlYW5zIGFyZSBhbHNvIGF0dGFjaGVkIHRvIHRoaXMgcGF0Y2hzZXQuCgpUZXN0
cyB0ZXN0X2JwZi5rbyBhbmQgdGVzdF92ZXJpZmllciBoYXZlIHBhc3NlZCwgYXMgd2VsbCBhcyB0
aGUgcmVsYXRpdmUKdGVzdGNhc2VzIG9mIHRlc3RfcHJvZ3MqLgoKdjQ6Ci0gRml4IHRhaWxjYWxs
IGhpZXJhcmNoeSBpc3N1ZS4KLSB1c2UgaXNfc3RydWN0X29wc190cmFtcCBoZWxwZXIgaW4gYnBm
IHRyYW1wb2xpbmUKCnYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNDAyMDEwODMz
NTEuOTQzMTIxLTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20KLSBSZW1vdmUgZHVwbGljYXRlIFJW
X1JFR19UQ0MgbG9hZCBpbiBlcGlsb2d1ZWkuIChCasO2cm4gVMO2cGVsKQoKdjI6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2JwZi8yMDI0MDEzMDA0MDk1OC4yMzA2NzMtMS1wdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbQotIEZpeCBlbWl0IHJlc3RvcmUgUlZfUkVHX1RDQyBkb3VibGUgdGltZXMgd2hl
biBgZmxhZ3MgJgogIEJQRl9UUkFNUF9GX0NBTExfT1JJR2AKLSBVc2UgYnBmX2lzX3N1YnByb2cg
aGVscGVyCgp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjMwOTE5MDM1NzExLjMy
OTcyNTYtMS1wdWxlaHVpQGh1YXdlaWNsb3VkLmNvbQoKUHUgTGVodWkgKDYpOgogIGJwZjogRXh0
cmFjdCB0aGUgaXNfc3RydWN0X29wc190cmFtcCBoZWxwZXIKICByaXNjdiwgYnBmOiBSZW1vdmUg
cmVkdW5kYW50IGN0eC0+b2Zmc2V0IGluaXRpYWxpemF0aW9uCiAgcmlzY3YsIGJwZjogVXNpbmcg
a3Z6YWxsb2Nfb2JqcyB0byBhbGxvY2F0ZSBjYWNoZSBidWZmZXIKICByaXNjdiwgYnBmOiBBZGQg
UlZfVEFJTENBTExfT0ZGU0VUIG1hY3JvIHRvIGZvcm1hdCB0YWlsY2FsbCBvZmZzZXQKICByaXNj
diwgYnBmOiBNaXhpbmcgYnBmMmJwZiBhbmQgdGFpbGNhbGxzCiAgc2VsZnRlc3RzL2JwZjogUmVt
b3ZlIHRhaWxjYWxscyB0ZXN0cyBmcm9tIERFTllMSVNULnJpc2N2NjQKCiBhcmNoL2FybTY0L25l
dC9icGZfaml0X2NvbXAuYyAgICAgICAgICAgICAgICB8ICAgNiAtCiBhcmNoL2xvb25nYXJjaC9u
ZXQvYnBmX2ppdC5jICAgICAgICAgICAgICAgICB8ICAgMiArLQogYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdC5oICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYyAgICAgICAgICAgICAgfCAxMjAgKysrKysrKysrLS0tLS0tLS0tLQogYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMgICAgICAgICAgICAgICAgfCAgIDkgKy0KIGluY2x1ZGUv
bGludXgvYnBmLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5yaXNjdjY0IHwgICAxIC0KIDcgZmlsZXMgY2hhbmdl
ZCwgNjggaW5zZXJ0aW9ucygrKSwgNzcgZGVsZXRpb25zKC0pCgotLSAKMi4zNC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
