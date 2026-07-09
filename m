Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D257C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eo70BdfZQaTn6MvdvAfTcxTp3bdMui3pyCdfuM7zmSM=; b=i9EOAKWn6MUckw
	adqJr0S1f/f8A5v6iFYz+GtqCyqE2enP1nLwffkPvgJsjneQMvk+THKyCNo59QOUt8mggbiXGOtXJ
	E3wIQInvZ79kk+duBaFCs6XQAPUWcPsuyLbVnqS1vb2AlZoB/hDI6W5+Q48p7vt6BEivp3vsqDAus
	t2P9ilkAQHjZOhf2Uw4QflewQ7xdGwxlhFl8ykteddQZojBX5mqN6KbOn2VZ3jcbiwwEA6RRSTAKX
	YWLfl2QKtfnH4CXvnX/Ec6Ol18+LfziccDgVBXLhmX2Q5Zi9hOtrk+aUPpf+6HRnc2u7k1CAvMN/V
	qs1qxlFJofCe15ZZP3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtih-00000003IUz-3MIR;
	Thu, 09 Jul 2026 18:43:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtid-00000003INv-0p9c
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 18:43:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 48D6F4E40D22;
	Thu,  9 Jul 2026 18:43:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDA7660340;
	Thu,  9 Jul 2026 18:43:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D88511BD1CE5;
	Thu,  9 Jul 2026 20:43:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783622604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ECdrYG8dwHRiuDm3ZbmP7UJ+mDiYsTvFq8PM3WBfyoY=;
	b=AKawgpCgEk+Df6j++oOru7xDW23+JIAlGdyHfTneum87ziQRuF7HQ7QMGuAcanW6KrpJI5
	d88ofjfrG9tpP190XWn/JmIKz+VNuSbdBw2z3Ei471BMIY5y8lcUWyNZJECDDrzx4D6Yl9
	0AJdqYLeaR9rlf/ddhY7aKWLj5DNtz8DvdKeuXaiqLi4KbmP6ZHrt2IrB1waqJhn9HaETa
	uBaZ8H1obUg/r/gPDPYV+20z5IENaz0V9GhMpQHI4op2FDhFfY2/0psB96l6hVgM531zbN
	gBgIwO0OCnslFCJ16e5wtNSe/oQSCd7ufDIMhGRS9sxx/6c7e9/coTN4zhrQNQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Thu, 09 Jul 2026 20:42:59 +0200
Subject: [PATCH bpf-next] selftests/bpf: remove redundant config option
 from selftests fragments
MIME-Version: 1.0
Message-Id: <20260709-testing-fragments-v1-1-65244b0650ff@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMzQrCQAwGX6Xk7ELaQ/15FfHQbr9dIxjLJpVC6
 bu76nEYZjYyFIHRpdmo4C0mL63QHhqK90EzgkyVqeOu5yOfg8NcNIdUhvyEugVmRLTg/jQx1W4
 uSLL+nlca5xQUq9Ptb2wZH4j+XdK+fwBHM9n0fwAAAA==
X-Change-ID: 20260709-testing-fragments-00ece1e068d0
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Jakub Sitnicki <jakub@cloudflare.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114331_548675_7AE67F66 
X-CRM114-Status: UNSURE (   6.01  )
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

Q09ORklHX0lQVjZfU0VHNl9MV1RVTk5FTCBpcyBjdXJyZW50bHkgZW5hYmxlZCBpbiBlYWNoIGFy
Y2gtc3BlY2lmaWMKY29uZmlnIGZyYWdtZW50IGZvciB0aGUgQlBGIHNlbGZ0ZXN0cy4gQ29tbWl0
IDMzYTk3MWQ1NDlkOAooInNlbGZ0ZXN0cy9icGY6IEFkZCBMV1QgZW5jYXAgdGVzdHMgZm9yIHNr
YiBtZXRhZGF0YSIpIGhhcyBlbmFibGVkIHRoaXMKY29uZmlnIGluIHRoZSBnZW5lcmljIGNvbmZp
ZyBhcyB3ZWxsLCByZXN1bHRpbmcgaW4gYSBzbWFsbCB3YXJuaW5nIHdoZW4KY29uZmlndXJpbmcg
YSBrZXJuZWwgZm9yIHNlbGZ0ZXN0czoKCiAkIGNhdCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYve2NvbmZpZyxjb25maWcudm0sY29uZmlnLng4Nl82NH0+LmNvbmZpZwogJCBtYWtlIG9sZGRl
ZmNvbmZpZwogICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9jb25mLm8KICAgSE9TVENDICBzY3Jp
cHRzL2tjb25maWcvY29uZmRhdGEubwogICBIT1NUTEQgIHNjcmlwdHMva2NvbmZpZy9jb25mCiBj
b25maWc6MjY5Ondhcm5pbmc6IG92ZXJyaWRlOiByZWFzc2lnbmluZyB0byBzeW1ib2wgSVBWNl9T
RUc2X0xXVFVOTkVMCiAjCiAjIGNvbmZpZ3VyYXRpb24gd3JpdHRlbiB0byAuY29uZmlnCiAjCgpO
b3cgdGhhdCBJUFY2X1NFRzZfTFdUVU5ORUwgaXMgc2V0IGluIHRoZSBnZW5lcmFsIGNvbmZpZyBm
cmFnbWVudCwgZHJvcAppdCBmcm9tIHRoZSBhcmNoLXNwZWNpZmljIGZyYWdtZW50cy4KClNpZ25l
ZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhv
cmVAYm9vdGxpbi5jb20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL2NvbmZpZy5h
YXJjaDY0IHwgMSAtCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnLnBwYzY0ZWwg
fCAxIC0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9jb25maWcucmlzY3Y2NCB8IDEgLQog
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL2NvbmZpZy5zMzkweCAgIHwgMSAtCiB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnLng4Nl82NCAgfCAxIC0KIDUgZmlsZXMgY2hhbmdl
ZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYvY29uZmlnLmFhcmNoNjQgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnLmFh
cmNoNjQKaW5kZXggN2VmYWQzNmNlYjI2Li5mYzg1MjU3NzAxZGMgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9jb25maWcuYWFyY2g2NAorKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvY29uZmlnLmFhcmNoNjQKQEAgLTcxLDcgKzcxLDYgQEAgQ09ORklHX0lO
UFVUX0VWREVWPXkKIENPTkZJR19JUF9BRFZBTkNFRF9ST1VURVI9eQogQ09ORklHX0lQX01VTFRJ
Q0FTVD15CiBDT05GSUdfSVBfTVVMVElQTEVfVEFCTEVTPXkKLUNPTkZJR19JUFY2X1NFRzZfTFdU
VU5ORUw9eQogQ09ORklHX0lQVkxBTj15CiBDT05GSUdfSlVNUF9MQUJFTD15CiBDT05GSUdfS0VS
TkVMX1VOQ09NUFJFU1NFRD15CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYvY29uZmlnLnBwYzY0ZWwgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnLnBw
YzY0ZWwKaW5kZXggYjUzYWZiNWUwYjcxLi41Njg1ZmE0ZWU4MmIgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9jb25maWcucHBjNjRlbAorKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvY29uZmlnLnBwYzY0ZWwKQEAgLTM5LDcgKzM5LDYgQEAgQ09ORklHX0lO
RVQ9eQogQ09ORklHX0lQX0FEVkFOQ0VEX1JPVVRFUj15CiBDT05GSUdfSVBfTVVMVElDQVNUPXkK
IENPTkZJR19JUF9NVUxUSVBMRV9UQUJMRVM9eQotQ09ORklHX0lQVjZfU0VHNl9MV1RVTk5FTD15
CiBDT05GSUdfSlVNUF9MQUJFTD15CiBDT05GSUdfS0FMTFNZTVNfQUxMPXkKIENPTkZJR19LUFJP
QkVTPXkKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9jb25maWcucmlz
Y3Y2NCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9jb25maWcucmlzY3Y2NAppbmRleCA3
YmVlMjRhNzlhNzEuLjY1NWNiMDVhNzY4OSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvYnBmL2NvbmZpZy5yaXNjdjY0CisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi9jb25maWcucmlzY3Y2NApAQCAtMzAsNyArMzAsNiBAQCBDT05GSUdfSEFSRExPQ0tVUF9ERVRF
Q1RPUj15CiBDT05GSUdfSElHSF9SRVNfVElNRVJTPXkKIENPTkZJR19IVUdFVExCRlM9eQogQ09O
RklHX0lORVQ9eQotQ09ORklHX0lQVjZfU0VHNl9MV1RVTk5FTD15CiBDT05GSUdfSVBfQURWQU5D
RURfUk9VVEVSPXkKIENPTkZJR19JUF9NVUxUSUNBU1Q9eQogQ09ORklHX0lQX01VTFRJUExFX1RB
QkxFUz15CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnLnMz
OTB4IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL2NvbmZpZy5zMzkweAppbmRleCBkYjYx
ODc4MTQ4ZTQuLjc1NWQxY2ZjZDllMCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYnBmL2NvbmZpZy5zMzkweAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29u
ZmlnLnMzOTB4CkBAIC01Niw3ICs1Niw2IEBAIENPTkZJR19JTkVUPXkKIENPTkZJR19JUF9BRFZB
TkNFRF9ST1VURVI9eQogQ09ORklHX0lQX01VTFRJQ0FTVD15CiBDT05GSUdfSVBfTVVMVElQTEVf
VEFCTEVTPXkKLUNPTkZJR19JUFY2X1NFRzZfTFdUVU5ORUw9eQogQ09ORklHX0lQVkxBTj15CiBD
T05GSUdfSlVNUF9MQUJFTD15CiBDT05GSUdfS0VSTkVMX1VOQ09NUFJFU1NFRD15CmRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnLng4Nl82NCBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9jb25maWcueDg2XzY0CmluZGV4IDQyYWQ4MTdiMDBhZS4uNTIz
ZTBkMjliYmQ0IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmln
Lng4Nl82NAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnLng4Nl82NApA
QCAtMTE0LDcgKzExNCw2IEBAIENPTkZJR19JUF9ST1VURV9WRVJCT1NFPXkKIENPTkZJR19JUFY2
X01JUDY9eQogQ09ORklHX0lQVjZfUk9VVEVfSU5GTz15CiBDT05GSUdfSVBWNl9ST1VURVJfUFJF
Rj15Ci1DT05GSUdfSVBWNl9TRUc2X0xXVFVOTkVMPXkKIENPTkZJR19JUFY2X1NVQlRSRUVTPXkK
IENPTkZJR19JUlFfUE9MTD15CiBDT05GSUdfSlVNUF9MQUJFTD15CgotLS0KYmFzZS1jb21taXQ6
IGY0MmIwNzBhYzI4NWY1ZWYzMDZlNjBlNjVkZWJiNThiYTUxOTY1OWEKY2hhbmdlLWlkOiAyMDI2
MDcwOS10ZXN0aW5nLWZyYWdtZW50cy0wMGVjZTFlMDY4ZDAKCkJlc3QgcmVnYXJkcywKLS0gIApB
bGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4u
Y29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
