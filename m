Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F013BC43602
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=STmkzR42DNASBfqXf1aI/56dxDaNmd3ZGvcv4GLFZVg=; b=e8zh/TyZPzNDOm
	D5wdYg0GY8pG39TYArXQHIrxZyNWGbWk6bWDpfY+SYapWxdT/o9DdPyIqDIZgH+pDCzNbXwrWyKZ1
	BE3X0fwzYf5B+iWOWTz0gL/a3rKpi8uRXK9b8wRr2MSmBRvRlTrWgddRJMnsOYKP3i50dAIZt98Pi
	2oMh+xOYNeX8z/LuGipgIfuDW6AZ4nCCkW/+OnUeP+dcHQS09uUPKxdwOELBDLCGtKeDuCEsyFa+N
	IyXgpMwVnoGLHkLD3eChTlupevwgo3pttRBc74QRJqPiLAFxngxLlQwIY95ypJ2yKyh5eOskepvmd
	MSd7N+jrmWuySxZHNsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6cu-0000000F8F3-37Oj;
	Tue, 07 Jul 2026 14:18:20 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6cr-0000000F8BC-0vB2
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 14:18:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gvjx14mZczKHLyr
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 22:17:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 22ABA40593
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 22:18:01 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgBnd3OXCk1qwUWNAQ--.43005S2;
	Tue, 07 Jul 2026 22:18:00 +0800 (CST)
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
Subject: [PATCH bpf-next v5 0/6] Mixing bpf2bpf and tailcalls for RV64
Date: Tue,  7 Jul 2026 14:22:13 +0000
Message-Id: <20260707142219.2871758-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnd3OXCk1qwUWNAQ--.43005S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4fCFW3WrWUAr45Zw17trb_yoW5Ar1Upa
	yfuw13Wryvgr42yanrGa18Xa4rGFsY93W3Cr17Jr1rAa1Y9FyvgF1xKFWFvas8AFZag34Y
	vr1qvFn5Cay8Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
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
X-CRM114-CacheID: sfid-20260707_071817_614425_EB59C900 
X-CRM114-Status: GOOD (  11.72  )
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
aGUgcmVsYXRpdmUKdGVzdGNhc2VzIG9mIHRlc3RfcHJvZ3MqLgoKdjU6Ci0gRml4IFRDQyB2YWx1
ZSB3YXMgbm90IHJlc3RvcmVkIHRvIFJWX1JFR19UQ0MgdXBvbiB0cmFtcG9saW5lIGV4aXQsCiAg
cmVzdWx0aW5nIGluIGFuIGluZmluaXRlIHRhaWwgY2FsbC4gKFNhc2hpa28pCi0gRml4IGVwaWxv
Z3VlIG5vdCByZXN0b3JlZCBUQ0MgdmFsdWUgdG8gUlZfUkVHX1RDQywgcmVzdWx0aW5nIGluCiAg
bGVhZiB0YWlsY2FsbCBjYWxsZWUgbWF5IGNsb2JiZXJlZCBSVl9SRUdfVENDLiAoU2FzaGlrbykK
LSBSZW1vdmUgcGF0Y2ggb2YgYFJlbW92ZSBjdHgtPm9mZnNldCBpbml0aWFsaXphdGlvbmAgYXMg
aXQgd291bGQgaGl0CiAgc29tZSBjb3JuZXIgY2FzZS4gKFNhc2hpa28pCi0gRml4IGRvdWJsZS1j
b3VudCBrY2ZpIGluc24gd2hlbiB0YWlsY2FsbCB0byB0YXJnZXQuIChTYXNoaWtvKQotIEFkZCBk
ZXRhaWwgZm9yIHNlbGZ0ZXN0IGNvbW1pdCBtZXNzYWdlLiAoQlBGIEJPVCkKCnY0OiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA2MjkxNDAwNDguNzMzMzQ2LTEtcHVsZWh1aUBodWF3
ZWljbG91ZC5jb20KLSBGaXggdGFpbGNhbGwgaGllcmFyY2h5IGlzc3VlLgotIHVzZSBpc19zdHJ1
Y3Rfb3BzX3RyYW1wIGhlbHBlciBpbiBicGYgdHJhbXBvbGluZQoKdjM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2JwZi8yMDI0MDIwMTA4MzM1MS45NDMxMjEtMS1wdWxlaHVpQGh1YXdlaWNsb3Vk
LmNvbQotIFJlbW92ZSBkdXBsaWNhdGUgUlZfUkVHX1RDQyBsb2FkIGluIGVwaWxvZ3VlaS4gKEJq
w7ZybiBUw7ZwZWwpCgp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjQwMTMwMDQw
OTU4LjIzMDY3My0xLXB1bGVodWlAaHVhd2VpY2xvdWQuY29tCi0gRml4IGVtaXQgcmVzdG9yZSBS
Vl9SRUdfVENDIGRvdWJsZSB0aW1lcyB3aGVuIGBmbGFncyAmCiAgQlBGX1RSQU1QX0ZfQ0FMTF9P
UklHYAotIFVzZSBicGZfaXNfc3VicHJvZyBoZWxwZXIKCnYxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9icGYvMjAyMzA5MTkwMzU3MTEuMzI5NzI1Ni0xLXB1bGVodWlAaHVhd2VpY2xvdWQuY29t
CgpQdSBMZWh1aSAoNik6CiAgYnBmOiBFeHRyYWN0IHRoZSBpc19zdHJ1Y3Rfb3BzX3RyYW1wIGhl
bHBlcgogIHJpc2N2LCBicGY6IFVzaW5nIGt2emFsbG9jX29ianMgdG8gYWxsb2NhdGUgY2FjaGUg
YnVmZmVyCiAgcmlzY3YsIGJwZjogRml4IGtlcm5lbCBzdGFjayBjb3JydXB0aW9uIGluIHRhaWxj
YWxsIHdpdGggQ0ZJCiAgcmlzY3YsIGJwZjogQWRkIFJWX1RBSUxDQUxMX09GRlNFVCBtYWNybyB0
byBmb3JtYXQgdGFpbGNhbGwgb2Zmc2V0CiAgcmlzY3YsIGJwZjogTWl4aW5nIGJwZjJicGYgYW5k
IHRhaWxjYWxscwogIHNlbGZ0ZXN0cy9icGY6IFJlbW92ZSB0YWlsY2FsbHMgdGVzdHMgZnJvbSBE
RU5ZTElTVC5yaXNjdjY0CgogYXJjaC9hcm02NC9uZXQvYnBmX2ppdF9jb21wLmMgICAgICAgICAg
ICAgICAgfCAgIDYgLQogYXJjaC9sb29uZ2FyY2gvbmV0L2JwZl9qaXQuYyAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsKIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgICAgICAgICAgICAgIHwg
MTI1ICsrKysrKysrKy0tLS0tLS0tLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jICAg
ICAgICAgICAgICAgIHwgICA0ICstCiBpbmNsdWRlL2xpbnV4L2JwZi5oICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNiArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJU1Qu
cmlzY3Y2NCB8ICAgMSAtCiA3IGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDczIGRl
bGV0aW9ucygtKQoKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
