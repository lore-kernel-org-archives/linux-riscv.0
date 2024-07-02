Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973E6C30653
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 01:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pObjLpi0jvpXYn04HCUgf1VwyuTNgp6QYSIfV9sHDE=; b=wOd6PI7wkofty8
	xwqwsZ9RjqqcKUl3oEIpTBhtXa+GZKU3164NU1ul2CYyEbtZzjnBv1qNmu24t95sfxhitvGbI9lI7
	Efnb3ab/3LHn3HvzAXp/ARE2npCPaPWWRC+OKL1gcrlTOpBF9j65n6KxA4RB85UCr1B6577zuOG9b
	we/e+gyvhyGGtVq13Ikrx5Y93H55MfdWwCV1SGp2JutRtxF1cTiih+MHSmKV+Au7z3Xq+1X4t6hzc
	P/5vFtdAnL280im+UziQ0HNjLCRVEqZkNPhiKNQf/hQt8X0442bDkOZN7p+48gDz5zy0Qj/+LEivq
	fP1QT677JHzZQfd24FCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSRB-00000005HSV-33PO;
	Tue, 02 Jul 2024 01:36:05 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSR6-00000005HPs-3djK
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 01:36:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WClpv3YHMz4f3kvJ
	for <linux-riscv@lists.infradead.org>; Tue,  2 Jul 2024 09:35:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id E863E1A058E
	for <linux-riscv@lists.infradead.org>; Tue,  2 Jul 2024 09:35:47 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgCXwX1vWYNm+0GRAw--.62272S2;
	Tue, 02 Jul 2024 09:35:45 +0800 (CST)
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
Subject: [PATCH bpf-next v5 0/3] Add 12-argument support for RV64 bpf trampoline
Date: Tue,  2 Jul 2024 01:37:27 +0000
Message-Id: <20240702013730.1082285-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgCXwX1vWYNm+0GRAw--.62272S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF45WF13tr4kGFW5tF13Jwb_yoW5JF17pa
	1Ig3W3u3WFgr4Iq34xJa1Uuryrtr4rXw15Cr4xJ34F9ayDtryYyr1I9w4Yv345Wr93W3yS
	y3sIvF98W3WDZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20240701_183601_256383_3067C885 
X-CRM114-Status: UNSURE (   8.12  )
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
MTNiL3Jpc2N2LWFiaS5wZGYgWzJdCgp2NToKLSBSZW1vdmUgdW5uZWNlc3NhcnkgY29weXJpZ2h0
LgoKdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDYyMjAyMjEyOS4zODQ0NDcz
LTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20vCi0gU2VwYXJhdGUgbWFueSBhcmdzIHRlc3QgbG9n
aWMgZnJvbSB0cmFjaW5nX3N0cnVjdC4gKERhbmllbCkKCnYzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNDA0MDMwNzI4MTguMTQ2MjgxMS0xLXB1bGVodWlAaHVhd2VpY2xvdWQuY29t
LwotIFZhcmlhYmxlIGFuZCBtYWNybyBuYW1lIGFsaWdubWVudDoKICBucl9yZWdfYXJnczogbnVt
YmVyIG9mIGFyZ3MgaW4gcmVnCiAgbnJfc3RhY2tfYXJnczogbnVtYmVyIG9mIGFyZ3Mgb24gc3Rh
Y2sKICBSVl9NQVhfUkVHX0FSR1M6IG1hY3JvIGZvciByaXNjdiBtYXggYXJncyBpbiByZWcKCnYy
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MDMwNDE3MTAuMTQxNjM2OS0xLXB1
bGVodWlAaHVhd2VpY2xvdWQuY29tLwotIEFkZCB0cmFjaW5nX3N0cnVjdCB0byBERU5ZTElTVC5h
YXJjaDY0IHdoaWxlIGFhcmNoNjQgZG9lcyBub3QgeWV0IHN1cHBvcnQKICBicGYgdHJhbXBvbGlu
ZSB3aXRoIG1vcmUgdGhhbiA4IGFyZ3MuCi0gQ2hhbmdlIHRoZSBtYWNybyBSVl9NQVhfQVJHX1JF
R1MgdG8gUlZfTUFYX0FSR1NfUkVHIHRvIHN5bmNocm9uaXplIHdpdGgKICB0aGUgdmFyaWFibGUg
ZGVmaW5pdGlvbiBiZWxvdy4KLSBBZGQgc29tZSBjb21tZW50cyBmb3Igc3RrX2FyZ19vZmYgYW5k
IG1hZ2ljIG51bWJlciBvZiBza2lwIHNsb3RzIGZvciBsb2FkaW5nCiAgYXJncyBvbiBzdGFjay4K
CnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAzMzEwOTI0MDUuODIyNTcxLTEt
cHVsZWh1aUBodWF3ZWljbG91ZC5jb20vCgpQdSBMZWh1aSAoMyk6CiAgcmlzY3YsIGJwZjogQWRk
IDEyLWFyZ3VtZW50IHN1cHBvcnQgZm9yIFJWNjQgYnBmIHRyYW1wb2xpbmUKICBzZWxmdGVzdHMv
YnBmOiBGYWN0b3Igb3V0IG1hbnkgYXJncyB0ZXN0cyBmcm9tIHRyYWNpbmdfc3RydWN0CiAgc2Vs
ZnRlc3RzL2JwZjogQWRkIHRlc3RjYXNlIHdoZXJlIDd0aCBhcmdtZW50IGlzIHN0cnVjdAoKIGFy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgICAgICAgICAgICAgICB8IDY2ICsrKysrKysr
Ky0tLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0ICB8ICAx
ICsKIC4uLi9zZWxmdGVzdHMvYnBmL2JwZl90ZXN0bW9kL2JwZl90ZXN0bW9kLmMgICB8IDE5ICsr
KysKIC4uLi9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMvdHJhY2luZ19zdHJ1Y3QuYyB8IDQ2ICsr
KysrKysrLQogLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdHJhY2luZ19zdHJ1Y3QuYyAgICAgIHwg
NTQgLS0tLS0tLS0tLS0KIC4uLi9icGYvcHJvZ3MvdHJhY2luZ19zdHJ1Y3RfbWFueV9hcmdzLmMg
ICAgICB8IDk1ICsrKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgMjA0IGluc2Vy
dGlvbnMoKyksIDc3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9wcm9ncy90cmFjaW5nX3N0cnVjdF9tYW55X2FyZ3MuYwoKLS0gCjIu
MzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
