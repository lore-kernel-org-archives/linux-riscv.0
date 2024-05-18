Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73DDC25B74
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 04:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/4ncVncrMpcZuc/8y+4+68PO/aGD/8X/pTe7jTZQeJE=; b=H3AZWZ9si5wM+u
	D5w1vC2O87VwbikEKzi0qV8+j+UukobHk2Eo5VQkRTrUr2BSnz8oLS13nQD3FafbtvDtDb2iDfvSD
	v/hnTvj2UykPnLs8IfoE9ocBgwyI5Z3j1C71ra+1YBRoP5p9H7vPKHOKYWmz6dPZQ2p5EbsOyVh7+
	+SATSD/tHbdS+EX8KB9ONT3gqaOM5LMTclweMCYuFueRG1be+sYSmYdSdVcgqV5HUKnCk+lKJPjLq
	OXR9tJRiPjMD29VxyUTsBLv7TrvDu21qe4/ybBPg6w6TIZj+8hDH0PwSkCmjx6mp14raKaj8cL389
	LzN/hHA3bGYt/RNf8Dig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8BkV-00000009YC2-0Rvn;
	Sat, 18 May 2024 04:32:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8AkC-00000009UYo-3cgd
	for linux-riscv@bombadil.infradead.org;
	Sat, 18 May 2024 03:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2Hw1fM3aG2gnWcL+4DPF0hWjNaNHA30aeACVnovODec=; b=Cx5Uem6au8F9KZHsEejggu6DB2
	GEFPTVJFj/qxry0lhuX2qP8fCIvFB21bLDSdxfgTVUKQX0cB48qDc3WeQeeGUP1UcQihLCx9GP3C3
	n/5oQ5gEMOtGJkkopXPC8nwrKXt14GQsJxoUJbVO7U6HUt/xHp+DN9Ao1GBg7aQhYKFDRvt4pGIqb
	ROSNh3clZlEahGZCGjVkUNod2jRlqtN5Ev/R/AieSvMr2QjGpK2xJNqFw0LEejYuvh6/581pPOEWL
	RuugIjNrum3Chz7pOAJBWlfNTGE7nQswgkG7zJJy6Kt55WEZuqhh5KJlDnxuXJ5eqUSggckgVoKl8
	4/WclmpQ==;
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8Ak1-00000005sD4-3f5H
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 03:28:19 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Vh8R5302pz4f3l22
	for <linux-riscv@lists.infradead.org>; Sat, 18 May 2024 11:27:45 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id B39371A01D2
	for <linux-riscv@lists.infradead.org>; Sat, 18 May 2024 11:27:55 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgC3Gf05IEhmkYcnNQ--.13474S2;
	Sat, 18 May 2024 11:27:53 +0800 (CST)
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
	Menglong Dong <imagedong@tencent.com>,
	Pu Lehui <pulehui@gmail.com>
Subject: [PATCH bpf-next v4 0/3] Add 12-argument support for RV64 bpf trampoline
Date: Sat, 18 May 2024 03:28:53 +0000
Message-Id: <20240518032856.2721688-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgC3Gf05IEhmkYcnNQ--.13474S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF45KF1xuF4fXryktF4fXwb_yoW8Kr17pa
	1Ig3Wa9F1rKF42q34xJa1Uuryrtr4rZw15Cr4xJ34F9ayDtry5Jr1I9w4Yy345Wr93u3yS
	y3sI9Fy5WF1DZ3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IY
	c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
	vE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbG2NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_042814_794557_A3D4F443 
X-CRM114-Status: UNSURE (   7.48  )
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
YzI2NzhkNzFhMzA2MzIzYjYwZWIxM2IvcmlzY3YtYWJpLnBkZiBbMl0KCnY0OgotIFNlcGFyYXRl
IG1hbnkgYXJncyB0ZXN0IGxvZ2ljIGZyb20gdHJhY2luZ19zdHJ1Y3QuIChEYW5pZWwpCgp2Mzog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDAzMDcyODE4LjE0NjI4MTEtMS1wdWxl
aHVpQGh1YXdlaWNsb3VkLmNvbS8KLSBWYXJpYWJsZSBhbmQgbWFjcm8gbmFtZSBhbGlnbm1lbnQ6
CiAgbnJfcmVnX2FyZ3M6IG51bWJlciBvZiBhcmdzIGluIHJlZwogIG5yX3N0YWNrX2FyZ3M6IG51
bWJlciBvZiBhcmdzIG9uIHN0YWNrCiAgUlZfTUFYX1JFR19BUkdTOiBtYWNybyBmb3IgcmlzY3Yg
bWF4IGFyZ3MgaW4gcmVnCgp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDAz
MDQxNzEwLjE0MTYzNjktMS1wdWxlaHVpQGh1YXdlaWNsb3VkLmNvbS8KLSBBZGQgdHJhY2luZ19z
dHJ1Y3QgdG8gREVOWUxJU1QuYWFyY2g2NCB3aGlsZSBhYXJjaDY0IGRvZXMgbm90IHlldCBzdXBw
b3J0CiAgYnBmIHRyYW1wb2xpbmUgd2l0aCBtb3JlIHRoYW4gOCBhcmdzLgotIENoYW5nZSB0aGUg
bWFjcm8gUlZfTUFYX0FSR19SRUdTIHRvIFJWX01BWF9BUkdTX1JFRyB0byBzeW5jaHJvbml6ZSB3
aXRoCiAgdGhlIHZhcmlhYmxlIGRlZmluaXRpb24gYmVsb3cuCi0gQWRkIHNvbWUgY29tbWVudHMg
Zm9yIHN0a19hcmdfb2ZmIGFuZCBtYWdpYyBudW1iZXIgb2Ygc2tpcCBzbG90cyBmb3IgbG9hZGlu
ZwogIGFyZ3Mgb24gc3RhY2suCgp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQw
MzMxMDkyNDA1LjgyMjU3MS0xLXB1bGVodWlAaHVhd2VpY2xvdWQuY29tLwoKUHUgTGVodWkgKDMp
OgogIHJpc2N2LCBicGY6IEFkZCAxMi1hcmd1bWVudCBzdXBwb3J0IGZvciBSVjY0IGJwZiB0cmFt
cG9saW5lCiAgc2VsZnRlc3RzL2JwZjogRmFjdG9yIG91dCBtYW55IGFyZ3MgdGVzdHMgZnJvbSB0
cmFjaW5nX3N0cnVjdAogIHNlbGZ0ZXN0cy9icGY6IEFkZCB0ZXN0Y2FzZSB3aGVyZSA3dGggYXJn
bWVudCBpcyBzdHJ1Y3QKCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jICAgICAgICAg
ICAgICAgfCA2NiArKysrKysrKystLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvREVO
WUxJU1QuYWFyY2g2NCAgfCAgMSArCiAuLi4vc2VsZnRlc3RzL2JwZi9icGZfdGVzdG1vZC9icGZf
dGVzdG1vZC5jICAgfCAxOSArKysrCiAuLi4vc2VsZnRlc3RzL2JwZi9wcm9nX3Rlc3RzL3RyYWNp
bmdfc3RydWN0LmMgfCA0NiArKysrKysrKy0KIC4uLi9zZWxmdGVzdHMvYnBmL3Byb2dzL3RyYWNp
bmdfc3RydWN0LmMgICAgICB8IDU0IC0tLS0tLS0tLS0tCiAuLi4vYnBmL3Byb2dzL3RyYWNpbmdf
c3RydWN0X21hbnlfYXJncy5jICAgICAgfCA5NyArKysrKysrKysrKysrKysrKysrCiA2IGZpbGVz
IGNoYW5nZWQsIDIwNiBpbnNlcnRpb25zKCspLCA3NyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdHJhY2luZ19zdHJ1Y3Rf
bWFueV9hcmdzLmMKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
