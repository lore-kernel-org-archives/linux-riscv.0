Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72380C2BB85
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pdND7/cmtVfPEaxWfNWYrh0GPtKhZN6IWbnqlMcjloQ=; b=YvgnVuddneHzvK
	U0NgTRR25/RIlzqd0AuhKcyLmLDzMwipG+DCe9pXWnWuxwfw4edYGVcG/NWLzKUynrDoSs8j3xfDM
	6Z1b5n51NdoAGBA/eVHrQHjvpRbAJiYwdzoXjberNxsDt/jIA6DzElnTl+xU3oDftInbN21YNrZYD
	Fdh3mRCfwxUdnVGEdFUkGOnemY5ePtvgnZwukm3cQ736ThZvSa/0XVQvreXJ5HqiSvMaFpCpmBl9s
	uPgrue0pXhbZf9JGpgmEUP7uFwUy8GrhtdQvciu70mqrDQpWq9sjs36Rb6ZnuFICw3wjE1pEQisoz
	WtcysST5Db/iFS5hnTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKqMP-0000000BBCy-2EOF;
	Sat, 22 Jun 2024 02:20:13 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKqML-0000000BBAf-2WRl
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 02:20:11 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4W5dGS3gBXz4f3kw0
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 10:19:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 70A1D1A0187
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 10:19:56 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgCnPK7INHZmmlBiAg--.22370S2;
	Sat, 22 Jun 2024 10:19:53 +0800 (CST)
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
Subject: [PATCH RESEND bpf-next v4 0/3] Add 12-argument support for RV64 bpf trampoline
Date: Sat, 22 Jun 2024 02:21:26 +0000
Message-Id: <20240622022129.3844473-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgCnPK7INHZmmlBiAg--.22370S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF45WF13tr4kGFW5tF13Jwb_yoW8KrW3pa
	1Ig3Wa93WFgF42q34xJa1Uuryrtr4rXw15Cr4xJ34F9ayDtry5tr1I9w4Yy345Wr93u3yS
	y34a9Fy5W3WDZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
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
X-CRM114-CacheID: sfid-20240621_192010_149295_EF7DD9D8 
X-CRM114-Status: UNSURE (   7.04  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyAxMiBm
dW5jdGlvbiBhcmd1bWVudHMgc3VwcG9ydCBmb3IgcmlzY3Y2NCBicGYKdHJhbXBvbGluZS4gVGhl
IGN1cnJlbnQgYnBmIHRyYW1wb2xpbmUgc3VwcG9ydHMgPD0gc2l6ZW9mKHU2NCkgYnl0ZXMKc2Nh
bGFyIGFyZ3VtZW50cyBbMF0gYW5kIDw9IDE2IGJ5dGVzIHN0cnVjdCBhcmd1bWVudHMgWzFdLiBU
aGVyZWZvcmUsIHdlCmZvY3VzIG9uIHRoZSBzaXR1YXRpb24gd2hlcmUgc2NhbGFycyBhcmUgYXQg
bW9zdCBYTEVOIGJpdHMgYW5kCmFnZ3JlZ2F0ZXMgd2hvc2UgdG90YWwgc2l6ZSBkb2VzIG5vdCBl
eGNlZWQgMsOXWExFTiBiaXRzIGluIHRoZSByaXNjdgpjYWxsaW5nIGNvbnZlbnRpb24gWzJdLgoK
TGluazogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC9zb3VyY2Uva2VybmVs
L2JwZi9idGYuYyNMNjE4NCBbMF0KTGluazogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjYuOC9zb3VyY2Uva2VybmVsL2JwZi9idGYuYyNMNjc2OSBbMV0KTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtZWxmLXBzYWJpLWRvYy9yZWxlYXNlcy9kb3du
bG9hZC9kcmFmdC0yMDIzMDkyOS1lNWM4MDBlNjYxYTUzZWZlM2MyNjc4ZDcxYTMwNjMyM2I2MGVi
MTNiL3Jpc2N2LWFiaS5wZGYgWzJdCgp2NDoKLSBTZXBhcmF0ZSBtYW55IGFyZ3MgdGVzdCBsb2dp
YyBmcm9tIHRyYWNpbmdfc3RydWN0LiAoRGFuaWVsKQoKdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI0MDQwMzA3MjgxOC4xNDYyODExLTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20v
Ci0gVmFyaWFibGUgYW5kIG1hY3JvIG5hbWUgYWxpZ25tZW50OgogIG5yX3JlZ19hcmdzOiBudW1i
ZXIgb2YgYXJncyBpbiByZWcKICBucl9zdGFja19hcmdzOiBudW1iZXIgb2YgYXJncyBvbiBzdGFj
awogIFJWX01BWF9SRUdfQVJHUzogbWFjcm8gZm9yIHJpc2N2IG1heCBhcmdzIGluIHJlZwoKdjI6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDQwMzA0MTcxMC4xNDE2MzY5LTEtcHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20vCi0gQWRkIHRyYWNpbmdfc3RydWN0IHRvIERFTllMSVNULmFh
cmNoNjQgd2hpbGUgYWFyY2g2NCBkb2VzIG5vdCB5ZXQgc3VwcG9ydAogIGJwZiB0cmFtcG9saW5l
IHdpdGggbW9yZSB0aGFuIDggYXJncy4KLSBDaGFuZ2UgdGhlIG1hY3JvIFJWX01BWF9BUkdfUkVH
UyB0byBSVl9NQVhfQVJHU19SRUcgdG8gc3luY2hyb25pemUgd2l0aAogIHRoZSB2YXJpYWJsZSBk
ZWZpbml0aW9uIGJlbG93LgotIEFkZCBzb21lIGNvbW1lbnRzIGZvciBzdGtfYXJnX29mZiBhbmQg
bWFnaWMgbnVtYmVyIG9mIHNraXAgc2xvdHMgZm9yIGxvYWRpbmcKICBhcmdzIG9uIHN0YWNrLgoK
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMzMTA5MjQwNS44MjI1NzEtMS1w
dWxlaHVpQGh1YXdlaWNsb3VkLmNvbS8KClB1IExlaHVpICgzKToKICByaXNjdiwgYnBmOiBBZGQg
MTItYXJndW1lbnQgc3VwcG9ydCBmb3IgUlY2NCBicGYgdHJhbXBvbGluZQogIHNlbGZ0ZXN0cy9i
cGY6IEZhY3RvciBvdXQgbWFueSBhcmdzIHRlc3RzIGZyb20gdHJhY2luZ19zdHJ1Y3QKICBzZWxm
dGVzdHMvYnBmOiBBZGQgdGVzdGNhc2Ugd2hlcmUgN3RoIGFyZ21lbnQgaXMgc3RydWN0CgogYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgICAgICAgICAgIHwgNjYgKysrKysrKysr
LS0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULmFhcmNoNjQgIHwgIDEg
KwogLi4uL3NlbGZ0ZXN0cy9icGYvYnBmX3Rlc3Rtb2QvYnBmX3Rlc3Rtb2QuYyAgIHwgMTkgKysr
KwogLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy90cmFjaW5nX3N0cnVjdC5jIHwgNDYgKysr
KysrKystCiAuLi4vc2VsZnRlc3RzL2JwZi9wcm9ncy90cmFjaW5nX3N0cnVjdC5jICAgICAgfCA1
NCAtLS0tLS0tLS0tLQogLi4uL2JwZi9wcm9ncy90cmFjaW5nX3N0cnVjdF9tYW55X2FyZ3MuYyAg
ICAgIHwgOTcgKysrKysrKysrKysrKysrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCAyMDYgaW5zZXJ0
aW9ucygrKSwgNzcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYnBmL3Byb2dzL3RyYWNpbmdfc3RydWN0X21hbnlfYXJncy5jCgotLSAKMi4z
NC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
