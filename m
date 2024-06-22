Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885E5C2BB85
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 03:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RADzpqAuOZMV2PHQgc+iZ3zf/3o+JJQgQsJY6bF3FlQ=; b=AAR5LHcinvwjAr
	VXm9MA7NiAXbNceKoJGfL4vpZUIYZH3khWn6EfVt47uCl3E0x23tB4ljej1hi9hEhS1Bnva2w0ukq
	gSW5jobZumjUXR0fkmmPv9Zx6Lpaq+MmvT1m30SYznmQ38nZeS+vXG1gBhOermt6aTUEAdmlOeSdj
	wDvdxhqM7Pet93Bi4pCAWGPQJ0NIIRP9wqxCTD+d1auX7ulrtI0rNIPs3rsMZ70zA2P3HxhdO95el
	rLwfjw3pJQg9cQsVVkYM2RE001VHGsMSudtH5DaPegXbHY/wWyWRLOUEKkdlNgax47LbYV4Td1KfG
	YeLIaU81QF251KkdRZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKr26-0000000BFDQ-3jL0;
	Sat, 22 Jun 2024 03:03:18 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKr20-0000000BFA6-0taW
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 03:03:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4W5fDD4WLcz4f3jsm
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 11:02:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 349B41A0572
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 11:03:03 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgDXa63kPnZmMh5lAg--.15052S3;
	Sat, 22 Jun 2024 11:03:03 +0800 (CST)
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
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH RESEND bpf-next v2 1/3] bpf: Use precise image size for struct_ops trampoline
Date: Sat, 22 Jun 2024 03:04:35 +0000
Message-Id: <20240622030437.3973492-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622030437.3973492-1-pulehui@huaweicloud.com>
References: <20240622030437.3973492-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDXa63kPnZmMh5lAg--.15052S3
X-Coremail-Antispam: 1UD129KBjvJXoWrKFy5CF4kXF17trW8CFy5XFb_yoW8Jry5pa
	ykGw1Y9a18Xrn8CaykXa1jvFyfua4kX34UGFWUJrWrC3yYq34qgr1jgry5Z3yfKFnYkrs8
	AF1qvrWqya4UZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2mL9UUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_200312_644034_DA1DC736 
X-CRM114-Status: UNSURE (   9.58  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkZvciB0cmFtcG9saW5lIHVzaW5n
IGJwZl9wcm9nX3BhY2ssIHdlIG5lZWQgdG8gZ2VuZXJhdGUgYSByd19pbWFnZQpidWZmZXIgd2l0
aCBzaXplIG9mIChpbWFnZV9lbmQgLSBpbWFnZSkuIEZvciByZWd1bGFyIHRyYW1wb2xpbmUsIHdl
IHVzZQp0aGUgcHJlY2lzZSBpbWFnZSBzaXplIGdlbmVyYXRlZCBieSBhcmNoX2JwZl90cmFtcG9s
aW5lX3NpemUgdG8gYWxsb2NhdGUKcndfaW1hZ2UuIEJ1dCBmb3Igc3RydWN0X29wcyB0cmFtcG9s
aW5lLCB3ZSBhbGxvY2F0ZSByd19pbWFnZSBkaXJlY3RseQp1c2luZyBjbG9zZSB0byBQQUdFX1NJ
WkUgc2l6ZS4gV2UgZG8gbm90IG5lZWQgdG8gYWxsb2NhdGUgZm9yIHRoYXQgbXVjaCwKYXMgdGhl
IHBhdGNoIHNpemUgaXMgdXN1YWxseSBtdWNoIHNtYWxsZXIgdGhhbiBQQUdFX1NJWkUuIExldCdz
IHVzZQpwcmVjaXNlIGltYWdlIHNpemUgZm9yIGl0IHRvby4KClNpZ25lZC1vZmYtYnk6IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CkFja2VkLWJ5OiBTb25nIExpdSA8c29uZ0BrZXJuZWwu
b3JnPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4gI3Jpc2N2
Ci0tLQoga2VybmVsL2JwZi9icGZfc3RydWN0X29wcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi9i
cGZfc3RydWN0X29wcy5jIGIva2VybmVsL2JwZi9icGZfc3RydWN0X29wcy5jCmluZGV4IGEyY2Yz
MWIxNGJlNC4uMGQ1MTVlYzU3YWE1IDEwMDY0NAotLS0gYS9rZXJuZWwvYnBmL2JwZl9zdHJ1Y3Rf
b3BzLmMKKysrIGIva2VybmVsL2JwZi9icGZfc3RydWN0X29wcy5jCkBAIC01NzMsNyArNTczLDcg
QEAgaW50IGJwZl9zdHJ1Y3Rfb3BzX3ByZXBhcmVfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1w
X2xpbmtzICp0bGlua3MsCiAJfQogCiAJc2l6ZSA9IGFyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGlu
ZShOVUxMLCBpbWFnZSArIGltYWdlX29mZiwKLQkJCQkJICAgaW1hZ2UgKyBQQUdFX1NJWkUsCisJ
CQkJCSAgIGltYWdlICsgaW1hZ2Vfb2ZmICsgc2l6ZSwKIAkJCQkJICAgbW9kZWwsIGZsYWdzLCB0
bGlua3MsIHN0dWJfZnVuYyk7CiAJaWYgKHNpemUgPD0gMCkgewogCQlpZiAoaW1hZ2UgIT0gKl9p
bWFnZSkKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
