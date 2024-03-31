Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89669CD1284
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Mar 2024 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tidmNOroWI1CI5FNmq0/sTUt4fPxMbtfJpSepX68Z+k=; b=ySVXdWUjfZ+KN4
	YvBFMk4Ui5NnkFL1CtZiEJZ9M0m9O7F3iSME1FwQbbzgne7bDjWwInRnovf4bzOXbVYZ2us6YqutG
	i/n/A7wra9hlgKRp6Jmpc8dMJrNmXxxuCvjxBRXE6kYqyyqx4HbRQeZoOk32nwd/kg3TImTxjXKgs
	bck55x3NxUnyFoZXSA8CXYSsUrU4f3x77hU08UaWe4yTg79VFhx8PRcPq4K0eIDkR0TU7ULC9pEyV
	hyNHXAChkoZNNx+hcWplz3nKOVVBr1MepcUi3dECRl/FAeRGq4aYcvzaGuRYt0sJkGYstIA9HKzNv
	QpMN/WTwn+kF9WBIlLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqrP2-00000005AJT-3iyY;
	Sun, 31 Mar 2024 09:23:00 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqrOw-00000005AHI-2pMp
	for linux-riscv@lists.infradead.org;
	Sun, 31 Mar 2024 09:22:58 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4V6pZk1QJQz4f3jXf
	for <linux-riscv@lists.infradead.org>; Sun, 31 Mar 2024 17:22:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 9366B1A0568
	for <linux-riscv@lists.infradead.org>; Sun, 31 Mar 2024 17:22:44 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgCH2WtkKwlmesQWIw--.11467S2;
	Sun, 31 Mar 2024 17:22:44 +0800 (CST)
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
Subject: [PATCH bpf-next 0/2] Add 12-argument support for RV64 bpf trampoline
Date: Sun, 31 Mar 2024 09:24:03 +0000
Message-Id: <20240331092405.822571-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCH2WtkKwlmesQWIw--.11467S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1UWFy5Zw13CF4fJFy3XFb_yoWkuFcEkF
	4rJFyfJ3yDJFWFqa4jkr15ZrZ0grWSqry2kr1DWrZ293s8Wr9FyrsY9r9rt34rXrW3WFnx
	XFykXFyIyw1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
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
X-CRM114-CacheID: sfid-20240331_022254_933303_2BDA4F6E 
X-CRM114-Status: UNSURE (   5.42  )
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
YzI2NzhkNzFhMzA2MzIzYjYwZWIxM2IvcmlzY3YtYWJpLnBkZiBbMl0KClB1IExlaHVpICgyKToK
ICByaXNjdiwgYnBmOiBBZGQgMTItYXJndW1lbnQgc3VwcG9ydCBmb3IgUlY2NCBicGYgdHJhbXBv
bGluZQogIHNlbGZ0ZXN0cy9icGY6IEFkZCB0ZXN0Y2FzZSB3aGVyZSA3dGggYXJnbWVudCBpcyBz
dHJ1Y3QKCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jICAgICAgICAgICAgICAgfCA2
MyArKysrKysrKysrKysrLS0tLS0tCiAuLi4vc2VsZnRlc3RzL2JwZi9icGZfdGVzdG1vZC9icGZf
dGVzdG1vZC5jICAgfCAxOSArKysrKysKIC4uLi9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMvdHJh
Y2luZ19zdHJ1Y3QuYyB8IDEzICsrKysKIC4uLi9zZWxmdGVzdHMvYnBmL3Byb2dzL3RyYWNpbmdf
c3RydWN0LmMgICAgICB8IDM1ICsrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDExMSBpbnNl
cnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
