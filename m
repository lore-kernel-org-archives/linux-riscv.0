Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944ECD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 04:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DGNikBcVilHjLHe+XdCbgcR/2l7C3QjaA4/4HnY1B44=; b=DKLwOWISuP1bSq
	QzDlxf4Cizr9eR8/5Ze2/P/L1zly5sdj1B3tNQuTztccM+Bfu9oSdSMizz2HjxFcGd873awbzJuk/
	TrElLq1guwkZqnaukfhRxTDcp8+vTaxCsBMVQ+LF8KS7XvsLwzHAjzLjX2sehdEgpR5pNW4SjCNmc
	dHHuFINGKWWg9CzM8vHOKvqK8QHqGxd2lYMg0IBgL6ncB9hrRl+byGWmSHcXp4fUn+vwtZ3f+F572
	dFBLtA1eDLvJEG/dao/KTY5As4HfwU53NWmsEKY3Ka8QAlxPYQ/FoLaXMZhKhJnRTUdvXrEH5XpyT
	FIbUlMByaPBGiCEKakoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrs2f-0000000Dufp-1KKj;
	Wed, 03 Apr 2024 04:16:05 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrs2Y-0000000Duc1-3A6P
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 04:16:01 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4V8WdB4JL4z4f3kKV
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 12:15:42 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id CF1981A0176
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 12:15:46 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgB3lA3y1wxmBsSZIw--.36823S2;
	Wed, 03 Apr 2024 12:15:46 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2 0/2] Add 12-argument support for RV64 bpf trampoline
Date: Wed,  3 Apr 2024 04:17:08 +0000
Message-Id: <20240403041710.1416369-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgB3lA3y1wxmBsSZIw--.36823S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF45KF1xuF4fXryktF4fXwb_yoW8WFyfpa
	1xWr1fuFnYgF4aqry7Ja1UWryFqrWru345Ca17G34F9ayDtrW5AF1I9a4Yy345Wrn5u3y0
	v343Kry5GF1DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF0
	eHDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_211559_214162_5D7DC5AA 
X-CRM114-Status: UNSURE (   7.12  )
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

VGhpcyBwYXRjaCBhZGRzIDEyIGZ1bmN0aW9uIGFyZ3VtZW50cyBzdXBwb3J0IGZvciByaXNjdjY0
IGJwZgp0cmFtcG9saW5lLiBUaGUgY3VycmVudCBicGYgdHJhbXBvbGluZSBzdXBwb3J0cyA8PSBz
aXplb2YodTY0KSBieXRlcwpzY2FsYXIgYXJndW1lbnRzIFswXSBhbmQgPD0gMTYgYnl0ZXMgc3Ry
dWN0IGFyZ3VtZW50cyBbMV0uIFRoZXJlZm9yZSwgd2UKZm9jdXMgb24gdGhlIHNpdHVhdGlvbiB3
aGVyZSBzY2FsYXJzIGFyZSBhdCBtb3N0IFhMRU4gYml0cyBhbmQKYWdncmVnYXRlcyB3aG9zZSB0
b3RhbCBzaXplIGRvZXMgbm90IGV4Y2VlZCAyw5dYTEVOIGJpdHMgaW4gdGhlIHJpc2N2CmNhbGxp
bmcgY29udmVudGlvbiBbMl0uCgpMaW5rOiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni44L3NvdXJjZS9rZXJuZWwvYnBmL2J0Zi5jI0w2MTg0IFswXQpMaW5rOiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ni44L3NvdXJjZS9rZXJuZWwvYnBmL2J0Zi5jI0w2NzY5
IFsxXQpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1lbGYtcHNh
YmktZG9jL3JlbGVhc2VzL2Rvd25sb2FkL2RyYWZ0LTIwMjMwOTI5LWU1YzgwMGU2NjFhNTNlZmUz
YzI2NzhkNzFhMzA2MzIzYjYwZWIxM2IvcmlzY3YtYWJpLnBkZiBbMl0KCnYyOgotIEFkZCB0cmFj
aW5nX3N0cnVjdCB0byBERU5ZTElTVC5hYXJjaDY0IHdoaWxlIGFhcmNoNjQgZG9lcyBub3QgeWV0
IHN1cHBvcnQKICBicGYgdHJhbXBvbGluZSB3aXRoIG1vcmUgdGhhbiA4IGFyZ3MuCi0gQ2hhbmdl
IHRoZSBtYWNybyBSVl9NQVhfQVJHX1JFR1MgdG8gUlZfTUFYX0FSR1NfUkVHIHRvIHN5bmNocm9u
aXplIHdpdGgKICB0aGUgdmFyaWFibGUgZGVmaW5pdGlvbiBiZWxvdy4KLSBBZGQgc29tZSBjb21t
ZW50cyBmb3Igc3RrX2FyZ19vZmYgYW5kIG1hZ2ljIG51bWJlciBvZiBza2lwIHNsb3RzIGZvciBs
b2FkaW5nCiAgYXJncyBvbiBzdGFjay4KCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNDAzMzEwOTI0MDUuODIyNTcxLTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20vCgpQdSBMZWh1
aSAoMik6CiAgcmlzY3YsIGJwZjogQWRkIDEyLWFyZ3VtZW50IHN1cHBvcnQgZm9yIFJWNjQgYnBm
IHRyYW1wb2xpbmUKICBzZWxmdGVzdHMvYnBmOiBBZGQgdGVzdGNhc2Ugd2hlcmUgN3RoIGFyZ21l
bnQgaXMgc3RydWN0CgogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgICAgICAg
ICAgIHwgNjUgKysrKysrKysrKysrKy0tLS0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBm
L0RFTllMSVNULmFhcmNoNjQgIHwgIDEgKwogLi4uL3NlbGZ0ZXN0cy9icGYvYnBmX3Rlc3Rtb2Qv
YnBmX3Rlc3Rtb2QuYyAgIHwgMTkgKysrKysrCiAuLi4vc2VsZnRlc3RzL2JwZi9wcm9nX3Rlc3Rz
L3RyYWNpbmdfc3RydWN0LmMgfCAxMyArKysrCiAuLi4vc2VsZnRlc3RzL2JwZi9wcm9ncy90cmFj
aW5nX3N0cnVjdC5jICAgICAgfCAzNSArKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDExNCBp
bnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
