Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2ECC6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DhkOO77Gw9NGvYqa5CfKdjp0eZYnC9IRQgjLxYCkkLY=; b=1IvYi2FM/KkXtc
	kl2rQWZ4ACsoCct20CIS2AbcHY+X0VAEImG2T98ehKb/9o4T+EL/rrCoZpwY24UShnQgv5MxjXuWU
	5eNM6DF155PI99jxmlvtBPlOQBrYILYssh2HrDEvuQ+Mf7VggtzwFmreOE1bRWxShGVaws5sbUvph
	o0kEHbEHzdcIl8/0g/aQR4k/JyQpCAEeojcfNGgvKPaLpYBZVJu5AdadENSLhMBLWIzfNg2tO37IV
	RcwIMd0x+7INEcOe8e1KkbNuJo8Mpc9zBeq3MS34bhZ+1tyJzyEf475rBkQ/HPwwEuRyrl4NBgjPc
	OkYPlliTjI1CHJIRWk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIAp-0066jb-CJ; Wed, 15 Feb 2023 13:50:15 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIAi-0066ZM-5l
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 13:50:09 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4PGzwC0ZVZz4f3jqq
	for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 21:49:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP1 (Coremail) with SMTP id cCh0CgDnUSz64uxjC3LEDQ--.36740S2;
	Wed, 15 Feb 2023 21:49:47 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v1 0/4] Support bpf trampoline for RV64
Date: Wed, 15 Feb 2023 21:52:01 +0800
Message-Id: <20230215135205.1411105-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDnUSz64uxjC3LEDQ--.36740S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw17GrWfJw4xAr4fGF13twb_yoW8Wryfpa
	yjkry3AryDu3W3JwnIya18ZryrKayvgw13Gw13t3yfJa1Yqry7ZrnYgayYyw15AF9xur1j
	yrn0qryj9FyDAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
	UQvtAUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_055008_590751_83163B99 
X-CRM114-Status: UNSURE (   7.46  )
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

QlBGIHRyYW1wb2xpbmUgaXMgdGhlIGNyaXRpY2FsIGluZnJhc3RydWN0dXJlIG9mIHRoZSBicGYK
c3Vic3lzdGVtLCBhY3RpbmcgYXMgYSBtZWRpYXRvciBiZXR3ZWVuIGtlcm5lbCBmdW5jdGlvbnMK
YW5kIEJQRiBwcm9ncmFtcy4gTnVtZXJvdXMgaW1wb3J0YW50IGZlYXR1cmVzLCBzdWNoIGFzCnVz
aW5nIGVicGYgcHJvZ3JhbSBmb3IgemVybyBvdmVyaGVhZCBrZXJuZWwgaW50cm9zcGVjdGlvbiwK
cmVseSBvbiB0aGlzIGtleSBjb21wb25lbnQuIFdlIGNhbid0IHdhaXQgdG8gc3VwcG9ydCBicGYK
dHJhbXBvbGluZSBvbiBSVjY0LiBTaW5jZSBSVjY0IGRvZXMgbm90IHN1cHBvcnQgZnRyYWNlCmRp
cmVjdCBjYWxsIHlldCwgdGhlIGN1cnJlbnQgUlY2NCBicGYgdHJhbXBvbGluZSBpcyBvbmx5CnVz
ZWQgaW4gYnBmIGNvbnRleHQuCgpBcyBtb3N0IG9mIHJpc2N2IGNwdSBzdXBwb3J0IHVuYWxpZ25l
ZCBtZW1vcnkgYWNjZXNzZXMsCndlIHRlbXBvcmFyaWx5IHVzZSBwYXRjaCBbMV0gdG8gZmFjaWxp
dGF0ZSB0ZXN0aW5nLiBUaGUKdGVzdCByZXN1bHRzIGFyZSBhcyBmb2xsb3csIGFuZCB0ZXN0X3Zl
cmlmaWVyIHdpdGggbm8KbmV3IGZhaWx1cmUgY2VzZXMuCgotIGZleGl0X2JwZjJicGY6T0sKLSBk
dW1teV9zdF9vcHM6T0sKLSB4ZHBfYnBmMmJwZjpPSwoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjEwOTE2MTMwODU1LjQwNTQ5MjYtMi1jaGVuaHVhbmc1QGh1YXdl
aS5jb20vCgp2MToKLSBSZW1vdmUgdGhlIGxvZ2ljIG9mIGJwZl9hcmNoX3RleHRfcG9rZSBzdXBw
b3J0ZWQgZm9yCiAga2VybmVsIGZ1bmN0aW9ucy4gKEt1b2hhaSBhbmQgQmrDtnJuKQotIEV4dGVu
ZCBwYXRjaF90ZXh0IGZvciBtdWx0aXBsZSBpbnN0cnVjdGlvbnMuIChCasO2cm4pCi0gRml4IE9P
QiBpc3N1ZSB3aGVuIGltYWdlIHRvbyBiaWcuIChCasO2cm4pCgpSRkM6Cmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2JwZi8yMDIzMDEwMzA5MDc1Ni4xOTkzODIwLTEtcHVsZWh1aUBodWF3ZWljbG91
ZC5jb20vCgpQdSBMZWh1aSAoNCk6CiAgcmlzY3Y6IEV4dGVuZCBwYXRjaF90ZXh0IGZvciBtdWx0
aXBsZSBpbnN0cnVjdGlvbnMKICByaXNjdiwgYnBmOiBGYWN0b3Igb3V0IGVtaXRfY2FsbCBmb3Ig
a2VybmVsIGFuZCBicGYgY29udGV4dAogIHJpc2N2LCBicGY6IEFkZCBicGZfYXJjaF90ZXh0X3Bv
a2Ugc3VwcG9ydCBmb3IgUlY2NAogIHJpc2N2LCBicGY6IEFkZCBicGYgdHJhbXBvbGluZSBzdXBw
b3J0IGZvciBSVjY0CgogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oICAgICB8ICAgMiAr
LQogYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyAgICAgICAgICB8ICAxOSArLQogYXJjaC9yaXNj
di9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyB8ICAxNSArLQogYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dC5oICAgICAgICAgICB8ICAgNSArCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jICAg
IHwgNDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDQ0
NCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
