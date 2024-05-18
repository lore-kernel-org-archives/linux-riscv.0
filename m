Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EA3C25B74
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hhxho8VG8rhzHm5m3Mg/W9ShTDSoxmmLxW0EDaKnsIA=; b=F/tCuSOm3AviBl
	p5vnBrnNuNuQmKHq9SbwJgQ0LXl0znwpqMAsIkhfql/MrIdYIffmNrN7PAVaE/pjiA0C7YA732269
	MXcvhu2K/ZDElNBDuj/NOatYaDUMx21Z17VaZzqFTuOowdkK4kWnYrnQ3sMoM4fxTvXYfwYDOUVnO
	nc5IlvvPvQ7/ITau2ZE3cdZtG5n0opiQvbJIY36xvZsikK1pO/gojqUy/Wk693Fv3F7i/O/YJuIRq
	YHwTQuxXmVYz6RKBYCAkV8U2WfvVSXFPUk29aOguIq1JEmfsYgCMVh+k6GQr95g9GlkPAO8r1O4Pj
	Rz3bUx1SWPpBc7HI/lJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8GMn-00000009pn3-2YmD;
	Sat, 18 May 2024 09:28:37 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8GMg-00000009piJ-2VGX
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 09:28:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4VhJQs5mnGz4f3jcn
	for <linux-riscv@lists.infradead.org>; Sat, 18 May 2024 17:28:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 9A0741A01D2
	for <linux-riscv@lists.infradead.org>; Sat, 18 May 2024 17:28:14 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgBnwvWtdEhmbxE_NQ--.58131S3;
	Sat, 18 May 2024 17:28:14 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
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
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@gmail.com>
Subject: [PATCH bpf-next v2 1/3] bpf: Use precise image size for struct_ops trampoline
Date: Sat, 18 May 2024 09:29:15 +0000
Message-Id: <20240518092917.2771703-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240518092917.2771703-1-pulehui@huaweicloud.com>
References: <20240518092917.2771703-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgBnwvWtdEhmbxE_NQ--.58131S3
X-Coremail-Antispam: 1UD129KBjvJXoWrKFy5CF4kXF17trW8CFy5XFb_yoW8Jry5pa
	ykGw1Y9w4UXr98CrWkXa1jvF1fu3WkX34UGFWUJrWrK34Yq34qgr1jgry5Z3yfKF4Fkrn8
	AF1q9rZ0ya4UZ3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8niSPUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_022831_331823_80F41EE1 
X-CRM114-Status: UNSURE (   9.88  )
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
cGZfc3RydWN0X29wcy5jIGIva2VybmVsL2JwZi9icGZfc3RydWN0X29wcy5jCmluZGV4IDg2Yzc4
ODRhYmFmOC4uOGFlZTE4NDYyMmFmIDEwMDY0NAotLS0gYS9rZXJuZWwvYnBmL2JwZl9zdHJ1Y3Rf
b3BzLmMKKysrIGIva2VybmVsL2JwZi9icGZfc3RydWN0X29wcy5jCkBAIC01NzEsNyArNTcxLDcg
QEAgaW50IGJwZl9zdHJ1Y3Rfb3BzX3ByZXBhcmVfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1w
X2xpbmtzICp0bGlua3MsCiAJfQogCiAJc2l6ZSA9IGFyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGlu
ZShOVUxMLCBpbWFnZSArIGltYWdlX29mZiwKLQkJCQkJICAgaW1hZ2UgKyBQQUdFX1NJWkUsCisJ
CQkJCSAgIGltYWdlICsgaW1hZ2Vfb2ZmICsgc2l6ZSwKIAkJCQkJICAgbW9kZWwsIGZsYWdzLCB0
bGlua3MsIHN0dWJfZnVuYyk7CiAJaWYgKHNpemUgPD0gMCkgewogCQlpZiAoaW1hZ2UgIT0gKl9p
bWFnZSkKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
