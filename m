Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073D0CFA450
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHly+E3Ph5esk3+turWSnErHneeXQT8uR3E2q6I+lVo=; b=j1rdEnpnkCE+K6
	6zkvM6puuNiLGAfMOG4N+/M6VU819XayCj8/prq3vWif+dw8OwjpG2sDA33LVcNRt6ByZ99l3PJPS
	ojib3yg8rH7UIgcawulf2LFWuOxARv4qAqJyhnVe0NBFGZbBzA5owz0VJLLXLqxS0gbtsWNi4OA7Z
	odpdP8ukz+xJqGxWHQxgniPUmdJGkIJy5z/94xPx2WvG47XA3SaDRsdDniSI/UhHunuCDfKqpzPAm
	85EEaDRSxXg3QvY2SDCmkotmGKbzaqp1Z4cskk43U9xHLyxWLvECp3t8qnpnTFd6DOAijErjU9cxM
	SqPkzF0MD4KoX3ji+lWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7A-0000000F7Ub-3e93;
	Wed, 23 Oct 2024 16:21:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dSd-0000000Ezdm-46eb
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 15:39:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94E385C5BA9;
	Wed, 23 Oct 2024 15:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66695C4CEC6;
	Wed, 23 Oct 2024 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729697986;
	bh=ewTQi8vvMjY2tDN+rwCGUkIKwCDc2H1+fYWUrCoOJYU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dh8ceyXz5u5QQMbCEoEHeP0xSKZ4uIoXgtgkuhEcUSkOpfAJulmJKqh8W2RKuXr2+
	 Ov+Q7/pZkE0RHW0c7Dpi9oB606f339GA7ThVoZwFRwdb/sOC8OVslxR1M191apFcXR
	 ojf/hrt4/LJsITLt6m+YAfEV0nixevr7h1CxjyHlNzqZF7toRZNmk3K0/pzcx3KA4Q
	 lwRFG+sVi//FCVdqm9NHW/5CbbfX5jL+dbvMm7qtz7ocOp+TvhK3Me5dNoOxCboDou
	 heffJRjCKzh04XNttacz9V7HVSiQZ0ZWcNmgMBqJ6B4Rr4cIgz90BZiEvfm2zkaPbX
	 s1+SWPD7ICZmw==
From: Puranjay Mohan <puranjay@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Hao Luo <haoluo@google.com>,
	Helge Deller <deller@gmx.de>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Mykola Lysenko <mykolal@fb.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [PATCH bpf-next v2 1/4] net: checksum: move from32to16() to generic header
Date: Wed, 23 Oct 2024 15:39:19 +0000
Message-Id: <20241023153922.86909-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241023153922.86909-1-puranjay@kernel.org>
References: <20241023153922.86909-1-puranjay@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_083948_139481_D912A4B1 
X-CRM114-Status: GOOD (  11.66  )
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

ZnJvbTMydG8xNigpIGlzIHVzZWQgYnkgbGliL2NoZWNrc3VtLmMgYW5kIGFsc28gYnkKYXJjaC9w
YXJpc2MvbGliL2NoZWNrc3VtLmMuIFRoZSBuZXh0IHBhdGNoIHdpbGwgdXNlIGl0IGluIHRoZQpi
cGZfY3N1bV9kaWZmIGhlbHBlci4KCk1vdmUgZnJvbTMydG8xNigpIHRvIHRoZSBpbmNsdWRlL25l
dC9jaGVja3N1bS5oIGFzIGNzdW1fZnJvbTMydG8xNigpIGFuZApyZW1vdmUgb3RoZXIgaW1wbGVt
ZW50YXRpb25zLgoKU2lnbmVkLW9mZi1ieTogUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5l
bC5vcmc+CkFja2VkLWJ5OiBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PgpS
ZXZpZXdlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+Ci0t
LQogYXJjaC9wYXJpc2MvbGliL2NoZWNrc3VtLmMgfCAxMyArKy0tLS0tLS0tLS0tCiBpbmNsdWRl
L25ldC9jaGVja3N1bS5oICAgICB8ICA2ICsrKysrKwogbGliL2NoZWNrc3VtLmMgICAgICAgICAg
ICAgfCAxMSArLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2xpYi9jaGVja3N1bS5jIGIv
YXJjaC9wYXJpc2MvbGliL2NoZWNrc3VtLmMKaW5kZXggNDgxOGYzZGI4NGE1Yy4uNTlkOGMxNWQ4
MWJkMCAxMDA2NDQKLS0tIGEvYXJjaC9wYXJpc2MvbGliL2NoZWNrc3VtLmMKKysrIGIvYXJjaC9w
YXJpc2MvbGliL2NoZWNrc3VtLmMKQEAgLTI1LDE1ICsyNSw2IEBACiAJOiAiPXIiKF90KSAgICAg
ICAgICAgICAgICAgICAgICBcCiAJOiAiciIoX3IpLCAiMCIoX3QpKTsKIAotc3RhdGljIGlubGlu
ZSB1bnNpZ25lZCBzaG9ydCBmcm9tMzJ0bzE2KHVuc2lnbmVkIGludCB4KQotewotCS8qIDMyIGJp
dHMgLS0+IDE2IGJpdHMgKyBjYXJyeSAqLwotCXggPSAoeCAmIDB4ZmZmZikgKyAoeCA+PiAxNik7
Ci0JLyogMTYgYml0cyArIGNhcnJ5IC0tPiAxNiBiaXRzIGluY2x1ZGluZyBjYXJyeSAqLwotCXgg
PSAoeCAmIDB4ZmZmZikgKyAoeCA+PiAxNik7Ci0JcmV0dXJuICh1bnNpZ25lZCBzaG9ydCl4Owot
fQotCiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBkb19jc3VtKGNvbnN0IHVuc2lnbmVkIGNo
YXIgKiBidWZmLCBpbnQgbGVuKQogewogCWludCBvZGQsIGNvdW50OwpAQCAtODUsNyArNzYsNyBA
QCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBkb19jc3VtKGNvbnN0IHVuc2lnbmVkIGNoYXIg
KiBidWZmLCBpbnQgbGVuKQogCX0KIAlpZiAobGVuICYgMSkKIAkJcmVzdWx0ICs9IGxlMTZfdG9f
Y3B1KCpidWZmKTsKLQlyZXN1bHQgPSBmcm9tMzJ0bzE2KHJlc3VsdCk7CisJcmVzdWx0ID0gY3N1
bV9mcm9tMzJ0bzE2KHJlc3VsdCk7CiAJaWYgKG9kZCkKIAkJcmVzdWx0ID0gc3dhYjE2KHJlc3Vs
dCk7CiBvdXQ6CkBAIC0xMDIsNyArOTMsNyBAQCBfX3dzdW0gY3N1bV9wYXJ0aWFsKGNvbnN0IHZv
aWQgKmJ1ZmYsIGludCBsZW4sIF9fd3N1bSBzdW0pCiB7CiAJdW5zaWduZWQgaW50IHJlc3VsdCA9
IGRvX2NzdW0oYnVmZiwgbGVuKTsKIAlhZGRjKHJlc3VsdCwgc3VtKTsKLQlyZXR1cm4gKF9fZm9y
Y2UgX193c3VtKWZyb20zMnRvMTYocmVzdWx0KTsKKwlyZXR1cm4gKF9fZm9yY2UgX193c3VtKWNz
dW1fZnJvbTMydG8xNihyZXN1bHQpOwogfQogCiBFWFBPUlRfU1lNQk9MKGNzdW1fcGFydGlhbCk7
CmRpZmYgLS1naXQgYS9pbmNsdWRlL25ldC9jaGVja3N1bS5oIGIvaW5jbHVkZS9uZXQvY2hlY2tz
dW0uaAppbmRleCAxMzM4Y2I5MmM4ZTcyLi4yNDNmOTcyMjY3YjhkIDEwMDY0NAotLS0gYS9pbmNs
dWRlL25ldC9jaGVja3N1bS5oCisrKyBiL2luY2x1ZGUvbmV0L2NoZWNrc3VtLmgKQEAgLTE1MSw2
ICsxNTEsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIGNzdW1fcmVwbGFjZShfX3dzdW0gKmNzdW0s
IF9fd3N1bSBvbGQsIF9fd3N1bSBuZXcpCiAJKmNzdW0gPSBjc3VtX2FkZChjc3VtX3N1YigqY3N1
bSwgb2xkKSwgbmV3KTsKIH0KIAorc3RhdGljIGlubGluZSB1bnNpZ25lZCBzaG9ydCBjc3VtX2Zy
b20zMnRvMTYodW5zaWduZWQgaW50IHN1bSkKK3sKKwlzdW0gKz0gKHN1bSA+PiAxNikgfCAoc3Vt
IDw8IDE2KTsKKwlyZXR1cm4gKHVuc2lnbmVkIHNob3J0KShzdW0gPj4gMTYpOworfQorCiBzdHJ1
Y3Qgc2tfYnVmZjsKIHZvaWQgaW5ldF9wcm90b19jc3VtX3JlcGxhY2U0KF9fc3VtMTYgKnN1bSwg
c3RydWN0IHNrX2J1ZmYgKnNrYiwKIAkJCSAgICAgIF9fYmUzMiBmcm9tLCBfX2JlMzIgdG8sIGJv
b2wgcHNldWRvaGRyKTsKZGlmZiAtLWdpdCBhL2xpYi9jaGVja3N1bS5jIGIvbGliL2NoZWNrc3Vt
LmMKaW5kZXggNjg2MGQ2YjA1YTE3MS4uMDI1YmE1NDZlMWVjNiAxMDA2NDQKLS0tIGEvbGliL2No
ZWNrc3VtLmMKKysrIGIvbGliL2NoZWNrc3VtLmMKQEAgLTM0LDE1ICszNCw2IEBACiAjaW5jbHVk
ZSA8YXNtL2J5dGVvcmRlci5oPgogCiAjaWZuZGVmIGRvX2NzdW0KLXN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgc2hvcnQgZnJvbTMydG8xNih1bnNpZ25lZCBpbnQgeCkKLXsKLQkvKiBhZGQgdXAgMTYt
Yml0IGFuZCAxNi1iaXQgZm9yIDE2K2MgYml0ICovCi0JeCA9ICh4ICYgMHhmZmZmKSArICh4ID4+
IDE2KTsKLQkvKiBhZGQgdXAgY2FycnkuLiAqLwotCXggPSAoeCAmIDB4ZmZmZikgKyAoeCA+PiAx
Nik7Ci0JcmV0dXJuIHg7Ci19Ci0KIHN0YXRpYyB1bnNpZ25lZCBpbnQgZG9fY3N1bShjb25zdCB1
bnNpZ25lZCBjaGFyICpidWZmLCBpbnQgbGVuKQogewogCWludCBvZGQ7CkBAIC05MCw3ICs4MSw3
IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgZG9fY3N1bShjb25zdCB1bnNpZ25lZCBjaGFyICpidWZm
LCBpbnQgbGVuKQogI2Vsc2UKIAkJcmVzdWx0ICs9ICgqYnVmZiA8PCA4KTsKICNlbmRpZgotCXJl
c3VsdCA9IGZyb20zMnRvMTYocmVzdWx0KTsKKwlyZXN1bHQgPSBjc3VtX2Zyb20zMnRvMTYocmVz
dWx0KTsKIAlpZiAob2RkKQogCQlyZXN1bHQgPSAoKHJlc3VsdCA+PiA4KSAmIDB4ZmYpIHwgKChy
ZXN1bHQgJiAweGZmKSA8PCA4KTsKIG91dDoKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
