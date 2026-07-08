Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B572C44503
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xRUBOcWsM8jmmNpEnp5PylkDpglvik4laDTUtgB5Nek=; b=iLo4IicChspGB9
	POGx+bavOxANwvnnZaUj0/2AHHZMm6Eqso7Cnqg92mtcZ287rNuDmMuCMRke6LVsLdYMGhWqJB/Nq
	HrrZMJKNjomTHccfu7CAEqOddzaed6EWwjk647oFy3GPZO8zGL+a4zbTVRF4NiQ39V8q/m2CETC0Y
	mhInVRWjfSZ9sY/TkhZLMOpn7GobsZaIHT7r3QUrqE9AKs12bzxAwSnK67EFJ2r2k5GgzrpDX/XUo
	R8WbWHy5xyIfW6zw+eteKIcmCsdXuDmdT3cq93IlYvRz4eHJoHIJ1eHcQ2Nqo+xstsmQcK+abroqM
	YUGeAbLRxbJezfXDD71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLxR-0000000GPyk-0H6N;
	Wed, 08 Jul 2026 06:40:33 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLxJ-0000000GPvL-3cNS
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 06:40:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gw7kh0vGzzYQtkT
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jul 2026 14:40:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id AF20C40570
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jul 2026 14:40:16 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgD32yfQ8E1qblLgAQ--.30661S2;
	Wed, 08 Jul 2026 14:40:16 +0800 (CST)
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
Subject: [PATCH bpf-next v6 0/7] Mixing bpf2bpf and tailcalls for RV64
Date: Wed,  8 Jul 2026 06:44:29 +0000
Message-Id: <20260708064436.2971933-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgD32yfQ8E1qblLgAQ--.30661S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWDuFyUZr1fCFyktF1rXrb_yoW5Cr1rpa
	yfuw13Wryvgr40yan7Ga18Ja4rJan5u3W5Cr17Jw1rAa15uFyqgF1xGFWFva45AFZag34Y
	vr1qqF15C3y8Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x02
	62kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07j7l19UUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_234026_351790_CD19F71D 
X-CRM114-Status: GOOD (  12.30  )
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

SW4gdGhlIGN1cnJlbnQgUlY2NCBKSVQsIGlmIHdlIGp1c3QgZG9uJ3QgaW5pdGlhbGl6ZSB0aGUg
VENDIGluIHN1YnByb2csCnRoZSBUQ0MgY2FuIGJlIHByb3BhZ2F0ZWQgZnJvbSB0aGUgcGFyZW50
IHByb2Nlc3MgdG8gdGhlIHN1YnByb2Nlc3MsIGJ1dAp0aGUgdXBkYXRlZCBUQ0Mgb2YgdGhlIHBh
cmVudCBwcm9jZXNzIGNhbm5vdCBiZSByZXN0b3JlZCB3aGVuIHRoZQpzdWJwcm9jZXNzIGV4aXRz
LiBTaW5jZSB0aGUgUlY2NCBUQ0MgaXMgaW5pdGlhbGl6ZWQgYmVmb3JlIHNhdmluZyB0aGUKY2Fs
bGVlIHNhdmVkIHJlZ2lzdGVycyBpbnRvIHRoZSBzdGFjaywgd2UgY2Fubm90IHVzZSB0aGUgY2Fs
bGVlIHNhdmVkCnJlZ2lzdGVyIHRvIHBhc3MgdGhlIFRDQywgb3RoZXJ3aXNlIHRoZSBvcmlnaW5h
bCB2YWx1ZSBvZiB0aGUgY2FsbGVlCnNhdmVkIHJlZ2lzdGVyIHdpbGwgYmUgZGVzdHJveWVkLiBT
byB3ZSBpbXBsZW1lbnRlZCBtaXhpbmcgYnBmMmJwZiBhbmQKdGFpbGNhbGxzIHNpbWlsYXIgdG8g
eDg2XzY0LCBpLmUuIHVzaW5nIGEgbm9uLWNhbGxlZSBzYXZlZCByZWdpc3RlciB0bwp0cmFuc2Zl
ciB0aGUgVENDIGJldHdlZW4gZnVuY3Rpb25zLCBhbmQgc2F2aW5nIHRoYXQgcmVnaXN0ZXIgdG8g
dGhlCnN0YWNrIHRvIHByb3RlY3QgdGhlIFRDQyB2YWx1ZS4gQXMgZm9yIHRoZSB0YWlsY2FsbCBo
aWVyYXJjaHkgaXNzdWUsCmluc3BpcmVkIGJ5IHRoZSBzMzkwJ3MgbG93LW92ZXJoZWFkIGFwcHJv
YWNoLCB3ZSBzdG9yZSBUQ0MgZnJvbQpSVl9SRUdfVENDIGJhY2sgdG8gc3RhY2sgYWZ0ZXIgY2Fs
bGluZyBicGYyYnBmIGNhbGwgb3IgY2FsbGluZyBvcmlnIGJwZgpmdW5jIGluIGJwZiB0cmFtcG9s
aW5lLgoKSW4gYWRkaXRpb24sIHNvbWUgY29kZSBjbGVhbnMgYXJlIGFsc28gYXR0YWNoZWQgdG8g
dGhpcyBwYXRjaHNldC4KClRlc3RzIHRlc3RfYnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUg
cGFzc2VkLCBhcyB3ZWxsIGFzIHRoZSByZWxhdGl2ZQp0ZXN0Y2FzZXMgb2YgdGVzdF9wcm9ncyou
Cgp2NjoKLSBBZGQgbmV3IHBhdGNoIHRvIGZpeCBtZW1vcnkgbGVhayBpbiBicGZfaml0X2ZyZWUu
IChTYXNoaWtvKQoKdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI2MDcwNzE0MjIx
OS4yODcxNzU4LTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20KLSBGaXggVENDIHZhbHVlIHdhcyBu
b3QgcmVzdG9yZWQgdG8gUlZfUkVHX1RDQyB1cG9uIHRyYW1wb2xpbmUgZXhpdCwKICByZXN1bHRp
bmcgaW4gYW4gaW5maW5pdGUgdGFpbCBjYWxsLiAoU2FzaGlrbykKLSBGaXggZXBpbG9ndWUgbm90
IHJlc3RvcmVkIFRDQyB2YWx1ZSB0byBSVl9SRUdfVENDLCByZXN1bHRpbmcgaW4KICBsZWFmIHRh
aWxjYWxsIGNhbGxlZSBtYXkgY2xvYmJlcmVkIFJWX1JFR19UQ0MuIChTYXNoaWtvKQotIFJlbW92
ZSBwYXRjaCBvZiBgUmVtb3ZlIGN0eC0+b2Zmc2V0IGluaXRpYWxpemF0aW9uYCBhcyBpdCB3b3Vs
ZCBoaXQKICBzb21lIGNvcm5lciBjYXNlLiAoU2FzaGlrbykKLSBGaXggZG91YmxlLWNvdW50IGtj
ZmkgaW5zbiB3aGVuIHRhaWxjYWxsIHRvIHRhcmdldC4gKFNhc2hpa28pCi0gQWRkIGRldGFpbCBm
b3Igc2VsZnRlc3QgY29tbWl0IG1lc3NhZ2UuIChCUEYgQk9UKQoKdjQ6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2JwZi8yMDI2MDYyOTE0MDA0OC43MzMzNDYtMS1wdWxlaHVpQGh1YXdlaWNsb3Vk
LmNvbQotIEZpeCB0YWlsY2FsbCBoaWVyYXJjaHkgaXNzdWUuCi0gdXNlIGlzX3N0cnVjdF9vcHNf
dHJhbXAgaGVscGVyIGluIGJwZiB0cmFtcG9saW5lCgp2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnBmLzIwMjQwMjAxMDgzMzUxLjk0MzEyMS0xLXB1bGVodWlAaHVhd2VpY2xvdWQuY29tCi0g
UmVtb3ZlIGR1cGxpY2F0ZSBSVl9SRUdfVENDIGxvYWQgaW4gZXBpbG9ndWVpLiAoQmrDtnJuIFTD
tnBlbCkKCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNDAxMzAwNDA5NTguMjMw
NjczLTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20KLSBGaXggZW1pdCByZXN0b3JlIFJWX1JFR19U
Q0MgZG91YmxlIHRpbWVzIHdoZW4gYGZsYWdzICYKICBCUEZfVFJBTVBfRl9DQUxMX09SSUdgCi0g
VXNlIGJwZl9pc19zdWJwcm9nIGhlbHBlcgoKdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Jw
Zi8yMDIzMDkxOTAzNTcxMS4zMjk3MjU2LTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20KClB1IExl
aHVpICg3KToKICBicGY6IEV4dHJhY3QgdGhlIGlzX3N0cnVjdF9vcHNfdHJhbXAgaGVscGVyCiAg
cmlzY3YsIGJwZjogRml4IG1lbW9yeSBsZWFrIGluIGJwZl9qaXRfZnJlZQogIHJpc2N2LCBicGY6
IFVzaW5nIGt2emFsbG9jX29ianMgdG8gYWxsb2NhdGUgY2FjaGUgYnVmZmVyCiAgcmlzY3YsIGJw
ZjogRml4IGtlcm5lbCBzdGFjayBjb3JydXB0aW9uIGluIHRhaWxjYWxsIHdpdGggQ0ZJCiAgcmlz
Y3YsIGJwZjogQWRkIFJWX1RBSUxDQUxMX09GRlNFVCBtYWNybyB0byBmb3JtYXQgdGFpbGNhbGwg
b2Zmc2V0CiAgcmlzY3YsIGJwZjogTWl4aW5nIGJwZjJicGYgYW5kIHRhaWxjYWxscwogIHNlbGZ0
ZXN0cy9icGY6IFJlbW92ZSB0YWlsY2FsbHMgdGVzdHMgZnJvbSBERU5ZTElTVC5yaXNjdjY0Cgog
YXJjaC9hcm02NC9uZXQvYnBmX2ppdF9jb21wLmMgICAgICAgICAgICAgICAgfCAgIDYgLQogYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdC5oICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgICAgICAgICAgfCAxMjUgKysrKysrKysrLS0t
LS0tLS0tLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMgICAgICAgICAgICAgICAgfCAg
IDUgKy0KIGluY2x1ZGUvbGludXgvYnBmLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2
ICsKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5yaXNjdjY0IHwgICAxIC0K
IDYgZmlsZXMgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgNzIgZGVsZXRpb25zKC0pCgotLSAK
Mi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
