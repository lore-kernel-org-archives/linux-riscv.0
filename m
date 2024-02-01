Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B11C47DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PiL/Gxw0S6NXHA6Fc/fuUwUS916Mlk710y097QtEPmE=; b=HoCsxDRMfCzm55
	vC/R6Ru/CGDfg0gXea2PDYWr3HkMjFOhRAbifBBZ494a5BIEKW70OVX4VrySRWxzx7MjhLyXe0SXs
	lkHCTJUmD58kIiigtpuM+klwAcb73pUNp7htwdG5n+39Bw82b7ihpXcTC2TM9ldVkh1nk4aEqsB3o
	mRqVozZKkgDH2JxQPfd243LaxxsbXn1dKKJk3+zXPpTcdq7pXxAyipT8R0bI/owo02ztLI5Pa8N5U
	vzAyukKZ1kTMtAoldj94SbsWwIZsxmD0AEoepT53KA4qBP83HYAEHIftPUMjAYUpmwqN8xtXNXxhu
	SRD5m00D6OgpFBXV+ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSVU-0000000759W-2z0t;
	Thu, 01 Feb 2024 08:33:12 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSVQ-00000007575-2tMK
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 08:33:10 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TQXGY6xjvz4f3mHV
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 16:32:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 7E82D1A0175
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 16:33:00 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgA3PnA8V7tlRXylCg--.9426S2;
	Thu, 01 Feb 2024 16:33:00 +0800 (CST)
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
	Luke Nelson <luke.r.nels@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v3 0/4] Mixing bpf2bpf and tailcalls for RV64
Date: Thu,  1 Feb 2024 08:33:47 +0000
Message-Id: <20240201083351.943121-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgA3PnA8V7tlRXylCg--.9426S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr48AFWUJrWkGw4xXw47urg_yoW8AryDpa
	y3ur13Gr4vqryxCw42ya18Ja4rGF4fZ3W3Cr13tw1Fya1UCFyqgF1xGFWFqFyUZFZa934j
	vr4YqFs8CayUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1
	22NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_003309_112939_87CE2C0B 
X-CRM114-Status: UNSURE (   8.97  )
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

SW4gdGhlIGN1cnJlbnQgUlY2NCBKSVQsIGlmIHdlIGp1c3QgZG9uJ3QgaW5pdGlhbGl6ZSB0aGUg
VENDIGluIHN1YnByb2csCnRoZSBUQ0MgY2FuIGJlIHByb3BhZ2F0ZWQgZnJvbSB0aGUgcGFyZW50
IHByb2Nlc3MgdG8gdGhlIHN1YnByb2Nlc3MsIGJ1dAp0aGUgVENDIG9mIHRoZSBwYXJlbnQgcHJv
Y2VzcyBjYW5ub3QgYmUgcmVzdG9yZWQgd2hlbiB0aGUgc3VicHJvY2VzcwpleGl0cy4gU2luY2Ug
dGhlIFJWNjQgVENDIGlzIGluaXRpYWxpemVkIGJlZm9yZSBzYXZpbmcgdGhlIGNhbGxlZSBzYXZl
ZApyZWdpc3RlcnMgaW50byB0aGUgc3RhY2ssIHdlIGNhbm5vdCB1c2UgdGhlIGNhbGxlZSBzYXZl
ZCByZWdpc3RlciB0bwpwYXNzIHRoZSBUQ0MsIG90aGVyd2lzZSB0aGUgb3JpZ2luYWwgdmFsdWUg
b2YgdGhlIGNhbGxlZSBzYXZlZCByZWdpc3Rlcgp3aWxsIGJlIGRlc3Ryb3llZC4gU28gd2UgaW1w
bGVtZW50ZWQgbWl4aW5nIGJwZjJicGYgYW5kIHRhaWxjYWxscwpzaW1pbGFyIHRvIHg4Nl82NCwg
aS5lLiB1c2luZyBhIG5vbi1jYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8gdHJhbnNmZXIKdGhlIFRD
QyBiZXR3ZWVuIGZ1bmN0aW9ucywgYW5kIHNhdmluZyB0aGF0IHJlZ2lzdGVyIHRvIHRoZSBzdGFj
ayB0bwpwcm90ZWN0IHRoZSBUQ0MgdmFsdWUuIEF0IHRoZSBzYW1lIHRpbWUsIHdlIGFsc28gY29u
c2lkZXIgdGhlIHNjZW5hcmlvCm9mIG1peGluZyB0cmFtcG9saW5lLgoKSW4gYWRkaXRpb24sIHNv
bWUgY29kZSBjbGVhbnMgYXJlIGFsc28gYXR0YWNoZWQgdG8gdGhpcyBwYXRjaHNldC4KClRlc3Rz
IHRlc3RfYnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFzc2VkLCBhcyB3ZWxsIGFzIHRo
ZSByZWxhdGl2ZQp0ZXN0Y2FzZXMgb2YgdGVzdF9wcm9ncyouCgp2MzoKLSBSZW1vdmUgZHVwbGlj
YXRlIFJWX1JFR19UQ0MgbG9hZCBpbiBlcGlsb2d1ZWkuIChCasO2cm4gVMO2cGVsKQoKdjI6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI0MDEzMDA0MDk1OC4yMzA2NzMtMS1wdWxlaHVp
QGh1YXdlaWNsb3VkLmNvbQotIEZpeCBlbWl0IHJlc3RvcmUgUlZfUkVHX1RDQyBkb3VibGUgdGlt
ZXMgd2hlbiBgZmxhZ3MgJiBCUEZfVFJBTVBfRl9DQUxMX09SSUdgCi0gVXNlIGJwZl9pc19zdWJw
cm9nIGhlbHBlcgoKdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDIzMDkxOTAzNTcx
MS4zMjk3MjU2LTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20KClB1IExlaHVpICg0KToKICByaXNj
diwgYnBmOiBSZW1vdmUgcmVkdW5kYW50IGN0eC0+b2Zmc2V0IGluaXRpYWxpemF0aW9uCiAgcmlz
Y3YsIGJwZjogVXNpbmcga3ZjYWxsb2MgdG8gYWxsb2NhdGUgY2FjaGUgYnVmZmVyCiAgcmlzY3Ys
IGJwZjogQWRkIFJWX1RBSUxDQUxMX09GRlNFVCBtYWNybyB0byBmb3JtYXQgdGFpbGNhbGwgb2Zm
c2V0CiAgcmlzY3YsIGJwZjogTWl4aW5nIGJwZjJicGYgYW5kIHRhaWxjYWxscwoKIGFyY2gvcmlz
Y3YvbmV0L2JwZl9qaXQuaCAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYyB8IDEwMSArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb3JlLmMgICB8ICAgOSArLS0KIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pCgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
