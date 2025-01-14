Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A9CC02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 20:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3Jg2ovBupT+AAq+B5pIhqBQ4huPbgD1dFJomP0YtKo=; b=xRuOG40JJGJ880
	F6lj9AXQl88DEwtxtXe8h53kOSxoFLkej7st7vfaQjcXS/DoIbQl3Cv+5yjxyeBtAfxYJit/A99V+
	9TuTR2qQte7cW20f7r34K2plAcy2Ykhcd41RQ9qwSTf31a8iI+moXXf3R0ceyf+qpwzftl3XllfDn
	t7Lx4CpIvgrPbmXXIcQxZw+g5QwSbqIEJgaywUsbQFmGK2xbqMKmKM8rNlJ/ZFpdKxlbOG96+UPOh
	sBEMTr70kXzwnnPXicmr8jecUUA8QEM7LnHkqSPW0e6Pis8TsD/0NS6ii6EgpFdWYFNct2PSxYhc3
	GR8QrAvIGww6CS+kZ1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnTp-00000009fAx-2V6D;
	Tue, 14 Jan 2025 20:25:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnTo-00000009f9v-04Y1
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 20:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WfiGYnphGqvudtD6RXFjAbGTohKPfJnsfNrRsHzlEL4=; b=LYVeUOW+kTtSHiDBIlaQqvKsDk
	NvyegwOm5Bc5ikhOzUNe8/sj3EJZyxxPOEC0YAObo/RQvO6XKvNsEcdtRGDCPTWi4ILHNYMNlX4zV
	p+9TtmlHa5DIIr0KIg70J+ISd4r3iIxL4xVU0gj4KxZbqP7xeo7XVGKE4g1GwNufUFsHgsU6BTuvS
	6Fc7F9Gsh+F830zycUmEHuMEouGJhTXFX+nDyhxs9o7pPq+euLDrJ5JK0PKi7fML+fDuOxuFamKwV
	8tupfsSAg81dkluviJqj0e0Z8xO+pDUzeCii/I1Y/JsoHPPHERIPdIuzrX/9bnVXt90Pwt1e/PyWP
	+aprvrug==;
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnTf-0000000AblD-2zzn
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 20:25:37 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailflow.stl.internal (Postfix) with ESMTP id 6CA841D40BEE;
	Tue, 14 Jan 2025 15:25:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 14 Jan 2025 15:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736886326; x=1736893526; bh=WfiGYnphGq
	vudtD6RXFjAbGTohKPfJnsfNrRsHzlEL4=; b=FmrjpT07YapVSFaY1sGnvFnz1X
	V3Wm4K9jF/8ZFsbjNyEHtlB+iE5FhcNl8xWf+/4OldWNfafM0TAwhl8aCBlTofh8
	UqTU7IIEtFUcVJedu8CbGfZ3RYegTh+OlhwwmbCv1bmiELDc1Zyyw0v/k3xAcPTg
	+cpw3JxrMj3tksGRxA86I2rOXftWQdLa+sao9gXpV0Uki+oqmlXv3j8xhLtYM4kQ
	yD20dABste7apThlgQ9Sa1qTW9r6YOkPuj4CBEkdlrxFXeAE+XNTIJsDjPBlogSh
	mLtlzIKSZN94apzID/Y1LN1G1aob8JOf3aMvbvqZN1DyuwhAZiy4+X5v9HEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736886326; x=
	1736893526; bh=WfiGYnphGqvudtD6RXFjAbGTohKPfJnsfNrRsHzlEL4=; b=D
	kS5xN+SrokCOeuGkeA0Rdl4Iche77/VAi327Qoasu9ZzmyB87bixfvKkTIMLX3vB
	nkNc/BinfuUlHmTOzlZZ7hU2L3r+KJ6lmyualOmSRHNVQXzJMqZeG+8PwDRKgS5B
	gXY9oklDQ4114W1eADDOTQp9U4hqLc6pTWRtdKALxkl7gYqE3Px3P1WbPI8hoyAm
	vhL0t/blkS+migWR31gbiU+VTYyCWoQ5aPseWYq3+gag/tE1yErRRAUUBxBUlEah
	DWXimM6yNxZ9eBda4zxRJ8AVZFN832dvhooTghHnOm3qvGXxysl3WpwyGUtJubxl
	lNn3yDn3jX0LoOJB+limg==
X-ME-Sender: <xms:NciGZ_LAYEY89IPy9tZNkEECacWIUsVz6LhZUbWymAxu9EzEvLTb1w>
    <xme:NciGZzKvmee4bRhjDWOXnbbyr6nfBbenRZf0QHN7JXM1YbRALlmbosNptsoajVPGn
    WBkvr3G42_OCElHQnc>
X-ME-Received: <xmr:NciGZ3vcToVEMPiNKXM0DImFLeWH-OfXFVcjOLRh24oD94bXxzIvdBmonIi5Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredt
    jeenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthh
    hushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeeuiefgudffleffgeeiffeffeefieel
    veejgfehhfejffeutedvffeiudevtdelgeenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuhif
    uhestghovghlrggtrghnthhhuhhsrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtg
    homhdprhgtphhtthhopehfvghlihigohhnmhgrrhhssegrrhgthhhlihhnuhigrdhorhhg
    pdhrtghpthhtoheplhguvhesshhtrhgrtggvrdhiohdprhgtphhtthhopehtghhlgieslh
    hinhhuthhrohhnihigrdguvgdprhgtphhtthhopehufihusegtohgvlhgrtggrnhhthhhu
    shdrnhgrmhgvpdhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopeiihhhouhhquhgrnhes
    ihhstggrshdrrggtrdgtnh
X-ME-Proxy: <xmx:NciGZ4bO8cwhk4-uRV0eZfRV6hSiI_tEdmWZabv9LRTHHgYg6V6WOA>
    <xmx:NciGZ2YXTVYXTZ_yCzfIYqYalplE8HdGiIDiBJiwtNGNK4IiBfDmHg>
    <xmx:NciGZ8A2x4hjK9eakMRBxIjgRkjryQHr9Bqoz02iLvDu9upqIyM82Q>
    <xmx:NciGZ0ZhoKMWvlMfnTFAraZ7egopmUFY98diACn4Gi09PxqwjsJpCA>
    <xmx:NsiGZyKYvMmwzYyeJFReKdwFq0HtBTp0o00acWOEI0hWn_ki4C_s1Izn>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 15:25:24 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 04:24:58 +0800
Subject: [PATCH v5 1/2] riscv/ptrace: add new regset to access original a0
 register
MIME-Version: 1.0
Message-Id: <20250115-riscv-new-regset-v5-1-d0e6ec031a23@coelacanthus.name>
References: <20250115-riscv-new-regset-v5-0-d0e6ec031a23@coelacanthus.name>
In-Reply-To: <20250115-riscv-new-regset-v5-0-d0e6ec031a23@coelacanthus.name>
To: Oleg Nesterov <oleg@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>, 
 Andrea Bolognani <abologna@redhat.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
 Guo Ren <guoren@kernel.org>, Yao Zi <ziyao@disroot.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 Celeste Liu <uwu@coelacanthus.name>, stable@vger.kernel.org, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3197; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=Bd0I0lIMKMC4KxEOjUIKWSGVerkNEic9IL2ALFZ+R48=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9LYTahxei2+ZK7gL31/p1LKEL+S0u9TWg2pWopNOn
 ch+9jLbmr2jlIVBjItBVkyRJa+E5SfnpbPdezu2d8HMYWUCGcLAxSkAE1nRz8jQulbWYqJDmdS9
 yH0Xd0ZtaImSZtoiOvOPRm3rh46tD2JXMjJMt7t61ztq0xrZnQ+9mjfNvhsjKVJToZO/aUXVeeO
 /8z/yAADK3kiB
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_202535_024768_4D8B272D 
X-CRM114-Status: GOOD (  11.78  )
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

VGhlIG9yaWdfYTAgaXMgbWlzc2luZyBpbiBzdHJ1Y3QgdXNlcl9yZWdzX3N0cnVjdCBvZiByaXNj
diwgYW5kIHRoZXJlIGlzCm5vIHdheSB0byBhZGQgaXQgd2l0aG91dCBicmVha2luZyBVQVBJLiAo
U2VlIExpbmsgdGFnIGJlbG93KQoKTGlrZSBOVF9BUk1fU1lTVEVNX0NBTEwgZG8sIHdlIGFkZCBh
IG5ldyByZWdzZXQgbmFtZSBOVF9SSVNDVl9PUklHX0EwIHRvCmFjY2VzcyBvcmlnaW5hbCBhMCBy
ZWdpc3RlciBmcm9tIHVzZXJzcGFjZSB2aWEgcHRyYWNlIEFQSS4KCkZpeGVzOiBlMmMwY2RmYmE3
ZjYgKCJSSVNDLVY6IFVzZXItZmFjaW5nIEFQSSIpCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC81OTUwNTQ2NC1jODRhLTQwM2QtOTcyZi1kNGIyMDU1ZWVhYWNAZ21haWwuY29tLwpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBDZWxlc3RlIExpdSA8dXd1QGNvZWxhY2Fu
dGh1cy5uYW1lPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIHwgMzIgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9lbGYuaCAgIHwgIDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvcHRyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwppbmRleCBl
YTY3ZTlmYjdhNTgzNjgzYjkyMmZlMmMwMTdlYTYxZjNiYzg0OGRiLi5lZjlhYjc0Yzg1NzVhNWM0
NDAxNTU5NzNiMWM2MjVjMDZhODY3Yzk3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
dHJhY2UuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwpAQCAtMzEsNiArMzEsNyBA
QCBlbnVtIHJpc2N2X3JlZ3NldCB7CiAjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9TVVBNCiAJUkVH
U0VUX1RBR0dFRF9BRERSX0NUUkwsCiAjZW5kaWYKKwlSRUdTRVRfT1JJR19BMCwKIH07CiAKIHN0
YXRpYyBpbnQgcmlzY3ZfZ3ByX2dldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdldCwKQEAgLTE4
NCw2ICsxODUsMjkgQEAgc3RhdGljIGludCB0YWdnZWRfYWRkcl9jdHJsX3NldChzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnRhcmdldCwKIH0KICNlbmRpZgogCitzdGF0aWMgaW50IHJpc2N2X29yaWdfYTBf
Z2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAorCQkJICAgICBjb25zdCBzdHJ1Y3QgdXNl
cl9yZWdzZXQgKnJlZ3NldCwKKwkJCSAgICAgc3RydWN0IG1lbWJ1ZiB0bykKK3sKKwlyZXR1cm4g
bWVtYnVmX3N0b3JlKCZ0bywgdGFza19wdF9yZWdzKHRhcmdldCktPm9yaWdfYTApOworfQorCitz
dGF0aWMgaW50IHJpc2N2X29yaWdfYTBfc2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAor
CQkJICAgICBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXQgKnJlZ3NldCwKKwkJCSAgICAgdW5zaWdu
ZWQgaW50IHBvcywgdW5zaWduZWQgaW50IGNvdW50LAorCQkJICAgICBjb25zdCB2b2lkICprYnVm
LCBjb25zdCB2b2lkIF9fdXNlciAqdWJ1ZikKK3sKKwl1bnNpZ25lZCBsb25nIG9yaWdfYTAgPSB0
YXNrX3B0X3JlZ3ModGFyZ2V0KS0+b3JpZ19hMDsKKwlpbnQgcmV0OworCisJcmV0ID0gdXNlcl9y
ZWdzZXRfY29weWluKCZwb3MsICZjb3VudCwgJmtidWYsICZ1YnVmLCAmb3JpZ19hMCwgMCwgLTEp
OworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwl0YXNrX3B0X3JlZ3ModGFyZ2V0KS0+b3Jp
Z19hMCA9IG9yaWdfYTA7CisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNl
cl9yZWdzZXQgcmlzY3ZfdXNlcl9yZWdzZXRbXSA9IHsKIAlbUkVHU0VUX1hdID0gewogCQkuY29y
ZV9ub3RlX3R5cGUgPSBOVF9QUlNUQVRVUywKQEAgLTIyNCw2ICsyNDgsMTQgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB1c2VyX3JlZ3NldCByaXNjdl91c2VyX3JlZ3NldFtdID0gewogCQkuc2V0ID0g
dGFnZ2VkX2FkZHJfY3RybF9zZXQsCiAJfSwKICNlbmRpZgorCVtSRUdTRVRfT1JJR19BMF0gPSB7
CisJCS5jb3JlX25vdGVfdHlwZSA9IE5UX1JJU0NWX09SSUdfQTAsCisJCS5uID0gMSwKKwkJLnNp
emUgPSBzaXplb2YoZWxmX2dyZWdfdCksCisJCS5hbGlnbiA9IHNpemVvZihlbGZfZ3JlZ190KSwK
KwkJLnJlZ3NldF9nZXQgPSByaXNjdl9vcmlnX2EwX2dldCwKKwkJLnNldCA9IHJpc2N2X29yaWdf
YTBfc2V0LAorCX0sCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHVzZXJfcmVnc2V0X3ZpZXcg
cmlzY3ZfdXNlcl9uYXRpdmVfdmlldyA9IHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC9lbGYuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYuaAppbmRleCBiNDQwNjlkMjljZWNjMGY5
ZGU5MGVlNjZiZmZmZDIxMzdmNDI3NWE4Li4zOTAwNjAyMjk2MDE2MzFkYTJmYjI3MDMwZDlmYTIx
NDJlNjc2YzE0IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLmgKKysrIGIvaW5j
bHVkZS91YXBpL2xpbnV4L2VsZi5oCkBAIC00NTIsNiArNDUyLDcgQEAgdHlwZWRlZiBzdHJ1Y3Qg
ZWxmNjRfc2hkciB7CiAjZGVmaW5lIE5UX1JJU0NWX0NTUgkweDkwMAkJLyogUklTQy1WIENvbnRy
b2wgYW5kIFN0YXR1cyBSZWdpc3RlcnMgKi8KICNkZWZpbmUgTlRfUklTQ1ZfVkVDVE9SCTB4OTAx
CQkvKiBSSVNDLVYgdmVjdG9yIHJlZ2lzdGVycyAqLwogI2RlZmluZSBOVF9SSVNDVl9UQUdHRURf
QUREUl9DVFJMIDB4OTAyCS8qIFJJU0MtViB0YWdnZWQgYWRkcmVzcyBjb250cm9sIChwcmN0bCgp
KSAqLworI2RlZmluZSBOVF9SSVNDVl9PUklHX0EwCSAgMHg5MDMJLyogUklTQy1WIG9yaWdpbmFs
IGEwIHJlZ2lzdGVyICovCiAjZGVmaW5lIE5UX0xPT05HQVJDSF9DUFVDRkcJMHhhMDAJLyogTG9v
bmdBcmNoIENQVSBjb25maWcgcmVnaXN0ZXJzICovCiAjZGVmaW5lIE5UX0xPT05HQVJDSF9DU1IJ
MHhhMDEJLyogTG9vbmdBcmNoIGNvbnRyb2wgYW5kIHN0YXR1cyByZWdpc3RlcnMgKi8KICNkZWZp
bmUgTlRfTE9PTkdBUkNIX0xTWAkweGEwMgkvKiBMb29uZ0FyY2ggTG9vbmdzb24gU0lNRCBFeHRl
bnNpb24gcmVnaXN0ZXJzICovCgotLSAKMi40OC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
