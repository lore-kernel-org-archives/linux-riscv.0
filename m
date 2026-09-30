Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D63CA5FBA
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NNCvP82JDjX7xSU8YjcaIYfKqbVTm6LrDyabC8BVnyA=; b=unYDNpv6dh9Q9R
	f9vRwszzn8xj60MVTHANIEfk0pyZZjOVlkpNi6gFJY494Ud2IEVKB28Jdnpg00eA1kICDPy3tN8/1
	LbClgp9smsSM9MSlZ23Pi5DumH+px+Epst7fZAmUbD6vmRsEJXwd7Ib0+aCOMjM28lJANukOXgh3q
	jXBkEdVLGb7AMHoA00iv+6pL7rMFTCcKGbmAt4Cnolt3pEewc8neK2SsB9zh4U1VHPHqSrz6e16AZ
	vqQCQ9rSxT0RyoSkK9xT84HXklJbjSIzKFKzOYmWmdlo2P71QbSUCYCLKz4YtUoBt/DJgHeqFDkyv
	gvyeoJCoJf3mW++wgJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrmI-00000005mey-0ADy;
	Wed, 30 Sep 2026 10:43:10 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrmE-00000005mdo-1tpd
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 10:43:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hvs7B628KzKHMgc
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 18:42:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 0DAA240574
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 18:42:52 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgBHZCeq57xqgX_xCA--.57102S2;
	Wed, 30 Sep 2026 18:42:51 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>
Cc: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf] MAINTAINERS: Add myself as co-maintainer of riscv bpf
Date: Wed, 30 Sep 2026 10:46:59 +0000
Message-Id: <20260930104659.1919027-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBHZCeq57xqgX_xCA--.57102S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWrAr17XF1fKr1rXr48Crg_yoW8AF43pa
	15Gw15C34kWr1xAr4rGF1jqayrA3WkG3y5CrZrW3s8AFn3Kw10gr10ka1Uua109FWrur4S
	yry3Xr1vyaykAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_034306_829090_7BAF9719 
X-CRM114-Status: GOOD (  10.37  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCk92ZXIgdGhlIHllYXJzLCBJIGhh
dmUgYmVlbiBhY3RpdmVseSBpbnZvbHZlZCBpbiB0aGUgZGV2ZWxvcG1lbnQgYW5kCmhhdmUgcHJv
YWN0aXZlbHkgdGFrZW4gb24gbWFpbnRlbmFuY2UgcmVzcG9uc2liaWxpdGllcyBmb3IgdGhlIFJW
NjQgSklULApjb3ZlcmluZyB0aGUgcmVsYXRlZCBicGYgY29yZSwgcmlzY3YgYXJjaGl0ZWN0dXJl
LCBhbmQgc2VsZnRlc3RzL0NJCmluZnJhc3RydWN0dXJlLiBXaXRoIHRoZSBjb250aW51b3VzIGdy
b3d0aCBvZiByaXNjdiBicGYgZmVhdHVyZXMgYW5kCnRlc3Rpbmcgd29ya2xvYWQsIGFkZGluZyBh
IGNvLW1haW50YWluZXIgaGVscHMgc2hhcmUgdGhlIHJldmlldyBidXJkZW4KYW5kIGVuc3VyZSB0
aW1lbHkgcGF0Y2ggaGFuZGxpbmcuCgpBcyBmb3IgdGhlIFJWMzIgSklULCB0aGVyZSBoYXMgYmVl
biBhIGxhY2sgb2YgYWN0aXZlIG1haW50YWluZXIgcmVzcG9uc2UKZm9yIHNldmVyYWwgeWVhcnMs
IGxlYXZpbmcgaW5jb21pbmcgcGF0Y2hlcyBvY2Nhc2lvbmFsbHkgc3RhbGxlZC4gQWN0aXZlCm1h
aW50ZW5hbmNlIGlzIG5lZWRlZCB0byByZXZpZXcgaW5jb21pbmcgcGF0Y2hlcyBhbmQgZW5zdXJl
IGlzc3VlcyBhcmUKYWRkcmVzc2VkIGluIGEgdGltZWx5IG1hbm5lci4KClRoZXJlZm9yZSwgSSB3
b3VsZCBsaWtlIHRvIHJlcXVlc3QgdGFraW5nIG9uIHRoZSBjby1tYWludGFpbmVyIHJvbGUgZm9y
CmJvdGggdGhlIFJWNjQgYW5kIFJWMzIgSklUcy4gRm9yIG1lLCBiZWluZyBhIG1haW50YWluZXIg
aXMgYm90aCBhbiBob25vcgphbmQgYSByZXNwb25zaWJpbGl0eSwgYW5kIGl0IGFsc28gbWFrZXMg
aXQgZWFzaWVyIGZvciBtZSB0byBwYXJ0aWNpcGF0ZQppbiByaXNjdiBicGYgd29yaywgd2hlcmUg
SSBsb29rIGZvcndhcmQgdG8gZGVkaWNhdGluZyBtb3JlIHRpbWUgYW5kCmVmZm9ydC4KClNpZ25l
ZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Ci0tLQogTUFJTlRBSU5FUlMg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggMTQwZWFmY2JiZDc4
Li5jMjcxMTk1MDAxNTIgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJT
CkBAIC00ODcyLDYgKzQ4NzIsNyBAQCBGOglhcmNoL3Bvd2VycGMvbmV0LwogQlBGIEpJVCBmb3Ig
UklTQy1WICgzMi1iaXQpCiBNOglMdWtlIE5lbHNvbiA8bHVrZS5yLm5lbHNAZ21haWwuY29tPgog
TToJWGkgV2FuZyA8eGkud2FuZ0BnbWFpbC5jb20+CitNOglQdSBMZWh1aSA8cHVsZWh1aUBodWF3
ZWkuY29tPgogTDoJYnBmQHZnZXIua2VybmVsLm9yZwogUzoJTWFpbnRhaW5lZAogRjoJYXJjaC9y
aXNjdi9uZXQvCkBAIC00ODc5LDcgKzQ4ODAsNyBAQCBYOglhcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jCiAKIEJQRiBKSVQgZm9yIFJJU0MtViAoNjQtYml0KQogTToJQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4KLVI6CVB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CitN
OglQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgogUjoJUHVyYW5qYXkgTW9oYW4gPHB1cmFu
amF5QGtlcm5lbC5vcmc+CiBMOglicGZAdmdlci5rZXJuZWwub3JnCiBTOglNYWludGFpbmVkCi0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
