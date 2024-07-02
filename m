Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E91C3065C
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gIVczsxKJBA/ju9xcMBXMlKHXKJUFj2VnWwLjLHUf0g=; b=LV6zmU2ZRMc4IB
	w9+Rw4pQ3o2mOo5gfMENt/CRO1XBGzHXybStSKVZpEicRDGSgwpOV2NlDJsn1/KyUh1J0oNQod5oP
	s/D0Xx3G8Tp/y6j4X2JeW6Q20Wbtyld1GwUiMwj51Kzc7tPEcTUTdNqbwNRyC/+1obbPEAQhBdSpV
	u+I/4afFR2DNFkbZagEiF6qWWuOdnrMhDD9uflfZIf4TJvBqPtzM1GzZAakWQNHIAPrrE1cSIAMQg
	Z7Gc1fMxGILcyful0uTBJ8QTZJU3bIX3X4eK0Mgl6lzY4VxZcLxlmWbfceZjRZN702QQLThf+NbzN
	g57juHLa12mNnvaX6ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcSd-00000006e6d-1M0x;
	Tue, 02 Jul 2024 12:18:15 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcSX-00000006e36-45Pn
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 12:18:13 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WD23x5Jcjz4f3kF7
	for <linux-riscv@lists.infradead.org>; Tue,  2 Jul 2024 20:17:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id E38F61A0181
	for <linux-riscv@lists.infradead.org>; Tue,  2 Jul 2024 20:18:00 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgBHvnr174NmXMK6Aw--.13394S2;
	Tue, 02 Jul 2024 20:17:58 +0800 (CST)
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
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v6 0/3] Add 12-argument support for RV64 bpf trampoline
Date: Tue,  2 Jul 2024 12:19:41 +0000
Message-Id: <20240702121944.1091530-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBHvnr174NmXMK6Aw--.13394S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4xtw4fKFWDtr4kZF1UWrg_yoW5GF4fpa
	1Ig3Wa9FnYgr4Iq34xGa1Uuryrtr4rXw15Cr4xJ34F9ayqyryYyr1I9a1Yv345Wr93W34S
	yr9IvF98GF4DZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
	IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_051810_409901_69D4BD1F 
X-CRM114-Status: UNSURE (   8.25  )
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
YzI2NzhkNzFhMzA2MzIzYjYwZWIxM2IvcmlzY3YtYWJpLnBkZiBbMl0KCnY2OgotIFJlbW92ZSB1
bm5lY2Vzc2FyeSBza2VsIGRldGFjaCBvcHMgYXMgaXQgd2lsbCBiZSBjb3ZlcmVkIGJ5IHNrZWwg
ZGVzdHJveSBvcHMuCgp2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNzAyMDEz
NzMwLjEwODIyODUtMS1wdWxlaHVpQGh1YXdlaWNsb3VkLmNvbS8KLSBSZW1vdmUgdW5uZWNlc3Nh
cnkgY29weXJpZ2h0LgoKdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDYyMjAy
MjEyOS4zODQ0NDczLTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20vCi0gU2VwYXJhdGUgbWFueSBh
cmdzIHRlc3QgbG9naWMgZnJvbSB0cmFjaW5nX3N0cnVjdC4gKERhbmllbCkKCnYzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MDMwNzI4MTguMTQ2MjgxMS0xLXB1bGVodWlAaHVh
d2VpY2xvdWQuY29tLwotIFZhcmlhYmxlIGFuZCBtYWNybyBuYW1lIGFsaWdubWVudDoKICBucl9y
ZWdfYXJnczogbnVtYmVyIG9mIGFyZ3MgaW4gcmVnCiAgbnJfc3RhY2tfYXJnczogbnVtYmVyIG9m
IGFyZ3Mgb24gc3RhY2sKICBSVl9NQVhfUkVHX0FSR1M6IG1hY3JvIGZvciByaXNjdiBtYXggYXJn
cyBpbiByZWcKCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MDMwNDE3MTAu
MTQxNjM2OS0xLXB1bGVodWlAaHVhd2VpY2xvdWQuY29tLwotIEFkZCB0cmFjaW5nX3N0cnVjdCB0
byBERU5ZTElTVC5hYXJjaDY0IHdoaWxlIGFhcmNoNjQgZG9lcyBub3QgeWV0IHN1cHBvcnQKICBi
cGYgdHJhbXBvbGluZSB3aXRoIG1vcmUgdGhhbiA4IGFyZ3MuCi0gQ2hhbmdlIHRoZSBtYWNybyBS
Vl9NQVhfQVJHX1JFR1MgdG8gUlZfTUFYX0FSR1NfUkVHIHRvIHN5bmNocm9uaXplIHdpdGgKICB0
aGUgdmFyaWFibGUgZGVmaW5pdGlvbiBiZWxvdy4KLSBBZGQgc29tZSBjb21tZW50cyBmb3Igc3Rr
X2FyZ19vZmYgYW5kIG1hZ2ljIG51bWJlciBvZiBza2lwIHNsb3RzIGZvciBsb2FkaW5nCiAgYXJn
cyBvbiBzdGFjay4KCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAzMzEwOTI0
MDUuODIyNTcxLTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20vCgpQdSBMZWh1aSAoMyk6CiAgcmlz
Y3YsIGJwZjogQWRkIDEyLWFyZ3VtZW50IHN1cHBvcnQgZm9yIFJWNjQgYnBmIHRyYW1wb2xpbmUK
ICBzZWxmdGVzdHMvYnBmOiBGYWN0b3Igb3V0IG1hbnkgYXJncyB0ZXN0cyBmcm9tIHRyYWNpbmdf
c3RydWN0CiAgc2VsZnRlc3RzL2JwZjogQWRkIHRlc3RjYXNlIHdoZXJlIDd0aCBhcmdtZW50IGlz
IHN0cnVjdAoKIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgICAgICAgICAgICAgICB8
IDY2ICsrKysrKysrKy0tLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5h
YXJjaDY0ICB8ICAxICsKIC4uLi9zZWxmdGVzdHMvYnBmL2JwZl90ZXN0bW9kL2JwZl90ZXN0bW9k
LmMgICB8IDE5ICsrKysKIC4uLi9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMvdHJhY2luZ19zdHJ1
Y3QuYyB8IDQ0ICsrKysrKysrLQogLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdHJhY2luZ19zdHJ1
Y3QuYyAgICAgIHwgNTQgLS0tLS0tLS0tLS0KIC4uLi9icGYvcHJvZ3MvdHJhY2luZ19zdHJ1Y3Rf
bWFueV9hcmdzLmMgICAgICB8IDk1ICsrKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdl
ZCwgMjAyIGluc2VydGlvbnMoKyksIDc3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy90cmFjaW5nX3N0cnVjdF9tYW55X2Fy
Z3MuYwoKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
