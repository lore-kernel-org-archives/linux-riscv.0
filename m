Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632FBCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 07:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aO39JGvfsQUze1r+se1ySDlSgsVY6I42kbPILtWflhM=; b=swif4IIPjLqO8/
	07lZRse7ebiKlNTdvdLlWpLY3Y3Z0v/zrFrUllauOwvRXiQZJM0+LiAK7wBc/vNKqHJfgx4LpCi77
	el29y++eCpfdMLDH4LTDpEH71/RERzcOfaFj6oRICFHuFVRn4lnxgtWGwaS9hJM8AU5kTbcVMjE0M
	26JGlmsi9JRrI4w9jmnGhlCH7k9SCBMX9dPzk35HGzfaxPE5o1vvEG3V4vbtuhIPZ59BVVRqMaftr
	q+VfNc2SAS9MjezHLlZ8cvGKrCHxUJhNz99+M9LAtmcqG/YMZTniHGFMVsrv7+6kzrUK7h8oA0G/2
	ZjeH6tVei76b/jWPRIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrv1b-0000000EVg6-2LBc;
	Wed, 03 Apr 2024 07:27:11 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrv1W-0000000EVdd-2EBj
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 07:27:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4V8bsq4Yltz4f3n6d
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 15:26:55 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 0486C1A058D
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 15:27:04 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgDnVQm9BA1mGuZmJA--.61978S2;
	Wed, 03 Apr 2024 15:26:54 +0800 (CST)
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
Subject: [PATCH bpf-next v3 0/2] Add 12-argument support for RV64 bpf trampoline
Date: Wed,  3 Apr 2024 07:28:16 +0000
Message-Id: <20240403072818.1462811-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgDnVQm9BA1mGuZmJA--.61978S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF45KF1xuF4fXryktF4fXwb_yoW8Cw18pa
	1xWw13uFn5KF42q347Ja1UuryFqr4rW345ur47J34FkayDtryYyr1I9ayYvw15Wr1ru3yI
	y34a9F98uF1DZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
	QVy7UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_002706_969801_E051C057 
X-CRM114-Status: UNSURE (   7.13  )
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
YzI2NzhkNzFhMzA2MzIzYjYwZWIxM2IvcmlzY3YtYWJpLnBkZiBbMl0KCnYzOgotIFZhcmlhYmxl
IGFuZCBtYWNybyBuYW1lIGFsaWdubWVudDoKICBucl9yZWdfYXJnczogbnVtYmVyIG9mIGFyZ3Mg
aW4gcmVnCiAgbnJfc3RhY2tfYXJnczogbnVtYmVyIG9mIGFyZ3Mgb24gc3RhY2sKICBSVl9NQVhf
UkVHX0FSR1M6IG1hY3JvIGZvciByaXNjdiBtYXggYXJncyBpbiByZWcKCnYyOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MDMwNDE3MTAuMTQxNjM2OS0xLXB1bGVodWlAaHVhd2Vp
Y2xvdWQuY29tLwotIEFkZCB0cmFjaW5nX3N0cnVjdCB0byBERU5ZTElTVC5hYXJjaDY0IHdoaWxl
IGFhcmNoNjQgZG9lcyBub3QgeWV0IHN1cHBvcnQKICBicGYgdHJhbXBvbGluZSB3aXRoIG1vcmUg
dGhhbiA4IGFyZ3MuCi0gQ2hhbmdlIHRoZSBtYWNybyBSVl9NQVhfQVJHX1JFR1MgdG8gUlZfTUFY
X0FSR1NfUkVHIHRvIHN5bmNocm9uaXplIHdpdGgKICB0aGUgdmFyaWFibGUgZGVmaW5pdGlvbiBi
ZWxvdy4KLSBBZGQgc29tZSBjb21tZW50cyBmb3Igc3RrX2FyZ19vZmYgYW5kIG1hZ2ljIG51bWJl
ciBvZiBza2lwIHNsb3RzIGZvciBsb2FkaW5nCiAgYXJncyBvbiBzdGFjay4KCnYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAzMzEwOTI0MDUuODIyNTcxLTEtcHVsZWh1aUBodWF3
ZWljbG91ZC5jb20vCgpQdSBMZWh1aSAoMik6CiAgcmlzY3YsIGJwZjogQWRkIDEyLWFyZ3VtZW50
IHN1cHBvcnQgZm9yIFJWNjQgYnBmIHRyYW1wb2xpbmUKICBzZWxmdGVzdHMvYnBmOiBBZGQgdGVz
dGNhc2Ugd2hlcmUgN3RoIGFyZ21lbnQgaXMgc3RydWN0CgogYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYyAgICAgICAgICAgICAgIHwgNjUgKysrKysrKysrKysrKy0tLS0tLQogdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULmFhcmNoNjQgIHwgIDEgKwogLi4uL3NlbGZ0
ZXN0cy9icGYvYnBmX3Rlc3Rtb2QvYnBmX3Rlc3Rtb2QuYyAgIHwgMTkgKysrKysrCiAuLi4vc2Vs
ZnRlc3RzL2JwZi9wcm9nX3Rlc3RzL3RyYWNpbmdfc3RydWN0LmMgfCAxMyArKysrCiAuLi4vc2Vs
ZnRlc3RzL2JwZi9wcm9ncy90cmFjaW5nX3N0cnVjdC5jICAgICAgfCAzNSArKysrKysrKysrCiA1
IGZpbGVzIGNoYW5nZWQsIDExNCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
