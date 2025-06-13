Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D486C61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lGs0pFzaHPpdZQkFRpCaTF9jks/S20pPLqzTI7EBPew=; b=K68WAzuZK05xhv
	BtsSDbC5HAjIXTM0dOrXA1wNINvuFOESEnu9KBzGz/imPgDLlye69CAG2G2X3tnojq/xQSOpZGnhn
	PWHTd3KsPJEIdMWfmmOAE56dfTLhPo4hYDHc8iUUBqfU0I1O1jEBsKgG+hs2h1ktuS/4Bkb4hw8dX
	tB71oK2z6L+6+C8SWe47aHT3wWCO0BpMcsR5XnUQxzIlpg6FPp0ldMSiYT7WZcdRnGtsOmzpTfdvD
	oCSo6PBnUCwQ9Fu1SGUx2ab5Mos9BRwqIuhrXETYPiAjTlwo19i0DRQEawpQcQQHnYNJ5zzPUSE3D
	KsXzx6I6saVxm3oYFAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzAC-0000000FfmR-3Bid;
	Fri, 13 Jun 2025 07:49:24 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyyi-0000000FcMH-0iUC;
	Fri, 13 Jun 2025 07:37:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86F1944503;
	Fri, 13 Jun 2025 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=beEBVGnU6qU0wggmtWKWRNXrz1xxl7Gdx9jeDS6+tJk=;
	b=kbxOkqLBWMYw2LKAd/IW2RyGj/nP5qTDA3nQe30746ZNf401cfIfLbPiuY4UCGLIThgg52
	3SDjkKUlcjrkpsB7uie+NFd+q+khw4Qzg1V7FhH7kqzzDUETsK2pGbu4SLKi+3xHGZA5Px
	K8dourdAUK5hDgryw11qFf0uNWCLOjes5mH1frWPNr1onGZSx9hzPoBxJ8F4ePD6fSr9AO
	tPte1M9ivmGyxjku7Xi4XGOT8+ifFHjA0HhTgsLAKFka6UJZWMMHXlJDmbcy5ef57nUIR7
	33LybB/oSKZ4GDWXEWCuppTs2482C4hbZA/bJ1nk+is7e8e0Di4ud3snPwKt0Q==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Subject: [PATCH bpf 0/7] bpf: deny trampoline attachment if args can not be
 located exactly on stack
Date: Fri, 13 Jun 2025 09:37:09 +0200
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACXVS2gC/x2NQQrCMBAAv1L2bCANtKJfEQnJZquLugnZKErp3
 xu8zVxmVlCqTArnYYVKH1bO0mU8DID3IDcynLqDs26ysz2ZRPLzrYZXyU8W8trqG5v6LB0DPsw
 UIx4jOpvSCD1TKi38/S8uEMsC123bAYJUNa93AAAA
X-Change-ID: 20250609-deny_trampoline_structs_on_stack-5bbc7bc20dd1
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Menglong Dong <imagedong@tencent.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: ebpf@linuxfoundation.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeuuefggeeiuedutdeghffhtefguefffeelledttdfgjeejueeggeeugfdugfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepheekpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrghhorhguvggvvheslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvhesl
 hhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehmhihkohhlrghlsehfsgdrtghomhdprhgtphhtthhopehsvhgvnhhssehlihhnuhigrdhisghmrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_003732_350547_F3B930F2 
X-CRM114-Status: GOOD (  12.10  )
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

SGVsbG8sCnRoaXMgc2VyaWVzIGZvbGxvd3Mgc29tZSBkaXNjdXNzaW9ucyBzdGFydGVkIGluIFsx
XSBhcm91bmQgYnBmCnRyYW1wb2xpbmVzIGxpbWl0YXRpb25zIG9uIHNwZWNpZmljIGNhc2VzLiBX
aGVuIGEgdHJhbXBvbGluZSBpcwpnZW5lcmF0ZWQgZm9yIGEgdGFyZ2V0IGZ1bmN0aW9uIGludm9s
dmluZyBtYW55IGFyZ3VtZW50cywgaXQgaGFzIHRvCnByb3Blcmx5IGZpbmQgYW5kIHNhdmUgdGhl
IGFyZ3VtZW50cyB0aGF0IGhhcyBiZWVuIHBhc3NlZCB0aHJvdWdoIHN0YWNrLgpXaGlsZSB0aGlz
IGlzIGRvYWJsZSB3aXRoIGJhc2ljIHR5cGVzIChlZzogc2NhbGFycyksIGl0IGJyaW5ncyBtb3Jl
CnVuY2VydGFpbnR5IHdoZW4gZGVhbGluZyB3aXRoIHNwZWNpZmljIHR5cGVzIGxpa2Ugc3RydWN0
cyAobWFueSBBQklzCmFsbG93IHRvIHBhc3Mgc3RydWN0dXJlcyBieSB2YWx1ZSBpZiB0aGV5IGZp
dCBpbiBhIHJlZ2lzdGVyIG9yIGEgcGFpciBvZgpyZWdpc3RlcnMpLiBUaGUgaXNzdWUgaXMgdGhh
dCB0aG9zZSBzdHJ1Y3R1cmVzIGxheW91dCBhbmQgbG9jYXRpb24gb24KdGhlIHN0YWNrIGNhbiBi
ZSBhbHRlcmVkIChpZSB3aXRoIGF0dHJpYnV0ZXMsIGxpa2UgcGFja2VkIG9yCmFsaWduZWQoeCkp
LCBhbmQgdGhpcyBraW5kIG9mIGFsdGVyYXRpb24gaXMgbm90IGVuY29kZWQgaW4gZHdhcmYgb3Ig
QlRGLAptYWtpbmcgdGhlIHRyYW1wb2xpbmVzIGNsdWVsZXNzIGFib3V0IHRoZSBuZWVkZWQgYWRq
dXN0bWVudHMuIFJhdGhlcgp0aGFuIHRyeWluZyB0byBzdXBwb3J0IHRoaXMgc3BlY2lmaWMgY2Fz
ZSwgYXMgYWdyZWVkIGluIFsyXSwgdGhpcyBzZXJpZXMKYWltcyB0byBwcm9wZXJseSBkZW55IGl0
LgoKSXQgdGFyZ2V0cyBhbGwgdGhlIGFyY2hpdGVjdHVyZXMgY3VycmVudGx5IGltcGxlbWVudGlu
ZwphcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUgKGV4Y2VwdCBhYXJjaDY0LCBzaW5jZSBpdCBo
YXMgYmVlbiBoYW5kbGVkCndoaWxlIGFkZGluZyB0aGUgc3VwcG9ydCBmb3IgbWFueSBhcmdzKToK
LSB4ODYKLSBzMzkwCi0gcmlzY3YKLSBwb3dlcnBjCgpBIHNtYWxsIHZhbGlkYXRpb24gZnVuY3Rp
b24gaXMgYWRkZWQgaW4gdGhlIEpJVCBjb21waWxlciBmb3IgZWFjaCBvZgp0aG9zZSBhcmNoaXRl
Y3R1cmVzLCBlbnN1cmluZyB0aGF0IG5vIGFyZ3VtZW50IHBhc3NlZCBvbiBzdGFjayBpcyBhCnN0
cnVjdC4gSWYgc28sIHRoZSB0cmFtcG9saW5lIGNyZWF0aW9uIGlzIGNhbmNlbGxlZC4gQW55IGNo
ZWNrIG9uIGFyZ3MKYWxyZWFkeSBpbXBsZW1lbnRlZCBpbiBhIEpJVCBjb21wIGhhcyBiZWVuIG1v
dmVkIGluIHRoaXMgbmV3IGZ1bmN0aW9uLgpPbiB0b3Agb2YgdGhhdCwgaXQgdXBkYXRlcyB0aGUg
dHJhY2luZ19zdHJ1Y3RfbWFueV9hcmdzIHRlc3QsIHdoaWNoCm5vdyBtZXJlbHkgY2hlY2tzIHRo
YXQgdGhpcyBjYXNlIGlzIGluZGVlZCBkZW5pZWQuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnBmLzIwMjUwNDExLW1hbnlfYXJnc19hcm02NC12MS0wLTBhMzJmZTcyMzM5ZUBib290bGlu
LmNvbS8KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi9DQUFEblZRS3IzZnROdDF1UVZy
WEJFMGEybzM3WllSbzJQSHFDb0hVbnc2UEU1VDJMb0FAbWFpbC5nbWFpbC5jb20vCgpTaWduZWQt
b2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3Jl
QGJvb3RsaW4uY29tPgotLS0KQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pICg3KToK
ICAgICAgYnBmL3g4NjogdXNlIGRlZmluZSBmb3IgbWF4IHJlZ3MgY291bnQgdXNlZCBmb3IgYXJn
dW1lbnRzCiAgICAgIGJwZi94ODY6IHByZXZlbnQgdHJhbXBvbGluZSBhdHRhY2htZW50IHdoZW4g
YXJncyBsb2NhdGlvbiBvbiBzdGFjayBpcyB1bmNlcnRhaW4KICAgICAgYnBmL3Jpc2N2OiBwcmV2
ZW50IHRyYW1wb2xpbmUgYXR0YWNobWVudCB3aGVuIGFyZ3MgbG9jYXRpb24gb24gc3RhY2sgaXMg
dW5jZXJ0YWluCiAgICAgIGJwZi9zMzkwOiBwcmV2ZW50IHRyYW1wb2xpbmUgYXR0YWNobWVudCB3
aGVuIGFyZ3MgbG9jYXRpb24gb24gc3RhY2sgaXMgdW5jZXJ0YWluCiAgICAgIGJwZi9wb3dlcnBj
NjQ6IHVzZSBkZWZpbmUgZm9yIG1heCByZWdzIGNvdW50IHVzZWQgZm9yIGFyZ3VtZW50cwogICAg
ICBicGYvcG93ZXJwYzY0OiBwcmV2ZW50IHRyYW1wb2xpbmUgYXR0YWNobWVudCB3aGVuIGFyZ3Mg
bG9jYXRpb24gb24gc3RhY2sgaXMgdW5jZXJ0YWluCiAgICAgIHNlbGZ0ZXN0cy9icGY6IGVuc3Vy
ZSB0aGF0IGZ1bmN0aW9ucyBwYXNzaW5nIHN0cnVjdHMgb24gc3RhY2sgY2FuIG5vdCBiZSBob29r
ZWQKCiBhcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jICAgICAgICAgICAgICAgICAgICB8
IDM4ICsrKysrKysrKystLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgICAg
ICAgICAgICAgICAgfCAyNiArKysrKysrLQogYXJjaC9zMzkwL25ldC9icGZfaml0X2NvbXAuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAzMyArKysrKysrKy0tCiBhcmNoL3g4Ni9uZXQvYnBmX2pp
dF9jb21wLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDUwICsrKysrKysrKysrKy0tLS0KIC4u
Li9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMvdHJhY2luZ19zdHJ1Y3QuYyAgICAgIHwgMzcgKy0t
LS0tLS0tLS0tCiAuLi4vc2VsZnRlc3RzL2JwZi9wcm9ncy90cmFjaW5nX3N0cnVjdF9tYW55X2Fy
Z3MuYyB8IDcwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jIHwgNDMgKystLS0tLS0tLS0tLQogNyBmaWxlcyBj
aGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKSwgMTY4IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21t
aXQ6IGM0ZjRmOGRhNzAwNDRkOGIyOGZjY2Y3MzAxNmI0MTE5ZjNlMmZkNTAKY2hhbmdlLWlkOiAy
MDI1MDYwOS1kZW55X3RyYW1wb2xpbmVfc3RydWN0c19vbl9zdGFjay01YmJjN2JjMjBkZDEKCkJl
c3QgcmVnYXJkcywKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
