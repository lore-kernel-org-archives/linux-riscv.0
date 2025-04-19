Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE3EC369BD
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKFz8X719QcHyfDUjfo+NuEiby6jBh/ekKbcahByQx8=; b=O/fN3HgjLQ9urc
	mk42NpxolGrSxuVk5RpWRdDSvvVL9lTQKtUtuS+2ARZLXmnhNxgIyQnZ2N1yUuG+7JFbhgDxLnDPt
	+ROSwbSpGrLBXvo3Bxk9VBHHYyBKh1ohDsBiyN/JNe7d63SCM7kEq1zoh4sbFYKyICOhnZ6sicn7B
	BANOZ5a4Sd7tWibe6eyU2IepkVjow2cFVQPEmx5v6gKPfWmJKRI7v4i2BVD/F7p121pmEQHW8pu14
	E4v8fTICGHbCNP1zV8jRd1ACNnIyTXaYe8OnuVjfNI2x03SOO2svc4zNw8QqDhvbpPzaToDOEG1gX
	as7Ao7tHOsI1RdVg3zbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u669N-00000001E3H-0AQB;
	Sat, 19 Apr 2025 11:14:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u669L-00000001E2v-1Q0N
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 11:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE96D61139;
	Sat, 19 Apr 2025 11:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AA9C4CEED;
	Sat, 19 Apr 2025 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745061258;
	bh=APWc4grnPuA6kcsjMvSMPXOhVagQmv1VtrP1a4NmFOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f6+48xzPBxS9tQTp55oCDih3fLT7Uzh+QubZ3dAoAgEG3NVEgoDU6ZrGxuwvzBzqr
	 veQvPDcvxip++K0KyH4xhF7gDBGFbQ2r4FKqtCNZh1DqUasydvaHk0zskRDb5wiRJX
	 nuOBb0dGORn8oWS0hai5ZHUhy/rPtCAZz68FfsHM4hXTmez8ANH7DshJa5n1Kw+Bug
	 UMD2BucwqFzKl/90mxruIZ7MsWDej2QiY1n3o1AHdrYFjueGJBUz44r66sT/MZ2mxR
	 7vPwDaD29cMVEGLjzDvbGvgX23U953+GpezVRb09h65fZXh+DLOkOYT7d3PlWN1Yd4
	 YLKlervkiJXnw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH fixes v2 2/2] riscv: uprobes: Add missing fence.i after building the XOL buffer
Date: Sat, 19 Apr 2025 13:14:00 +0200
Message-ID: <20250419111402.1660267-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250419111402.1660267-1-bjorn@kernel.org>
References: <20250419111402.1660267-1-bjorn@kernel.org>
MIME-Version: 1.0
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFhPTCAoZXhlY3V0
ZSBvdXQtb2YtbGluZSkgYnVmZmVyIGlzIHVzZWQgdG8gc2luZ2xlLXN0ZXAgdGhlCnJlcGxhY2Vk
IGluc3RydWN0aW9uKHMpIGZvciB1cHJvYmVzLiBUaGUgUklTQy1WIHBvcnQgd2FzIG1pc3Npbmcg
YQpwcm9wZXIgZmVuY2UuaSAoaSQgZmx1c2hpbmcpIGFmdGVyIGNvbnN0cnVjdGluZyB0aGUgWE9M
IGJ1ZmZlciwgd2hpY2gKY2FuIHJlc3VsdCBpbiBpbmNvcnJlY3QgZXhlY3V0aW9uIG9mIHN0YWxl
L2Jyb2tlbiBpbnN0cnVjdGlvbnMuCgpUaGlzIHdhcyBmb3VuZCBydW5uaW5nIHRoZSBCUEYgc2Vs
ZnRlc3RzICJ0ZXN0X3Byb2dzOgp1cHJvYmVfYXV0b2F0dGFjaCwgYXR0YWNoX3Byb2JlIiBvbiB0
aGUgU3BhY2VtaXQgSzEvWDYwLCB3aGVyZSB0aGUKdXByb2JlcyB0ZXN0cyByYW5kb21seSBibGV3
IHVwLgoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpGaXhlczogNzQ3
ODQwODFhYWM4ICgicmlzY3Y6IEFkZCB1cHJvYmVzIHN1cHBvcnRlZCIpClNpZ25lZC1vZmYtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCnYyOiBDb3JyZWN0IGZsdXNo
IHJhbmdlIChTYW11ZWwpCi0tLQogYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyB8
IDEwICsrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMKaW5kZXggNGIzZGM4YmVhZjc3Li5j
YzE1ZjdjYTZjYzEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVz
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYwpAQCAtMTY3LDYgKzE2
Nyw3IEBAIHZvaWQgYXJjaF91cHJvYmVfY29weV9peG9sKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNp
Z25lZCBsb25nIHZhZGRyLAogCS8qIEluaXRpYWxpemUgdGhlIHNsb3QgKi8KIAl2b2lkICprYWRk
ciA9IGttYXBfYXRvbWljKHBhZ2UpOwogCXZvaWQgKmRzdCA9IGthZGRyICsgKHZhZGRyICYgflBB
R0VfTUFTSyk7CisJdW5zaWduZWQgbG9uZyBzdGFydCA9ICh1bnNpZ25lZCBsb25nKWRzdDsKIAog
CW1lbWNweShkc3QsIHNyYywgbGVuKTsKIApAQCAtMTc2LDEzICsxNzcsNiBAQCB2b2lkIGFyY2hf
dXByb2JlX2NvcHlfaXhvbChzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyB2YWRkciwK
IAkJKih1cHJvYmVfb3Bjb2RlX3QgKilkc3QgPSBfX0JVR19JTlNOXzMyOwogCX0KIAorCWZsdXNo
X2ljYWNoZV9yYW5nZShzdGFydCwgc3RhcnQgKyBsZW4pOwogCWt1bm1hcF9hdG9taWMoa2FkZHIp
OwotCi0JLyoKLQkgKiBXZSBwcm9iYWJseSBuZWVkIGZsdXNoX2ljYWNoZV91c2VyX3BhZ2UoKSBi
dXQgaXQgbmVlZHMgdm1hLgotCSAqIFRoaXMgc2hvdWxkIHdvcmsgb24gbW9zdCBvZiBhcmNoaXRl
Y3R1cmVzIGJ5IGRlZmF1bHQuIElmCi0JICogYXJjaGl0ZWN0dXJlIG5lZWRzIHRvIGRvIHNvbWV0
aGluZyBkaWZmZXJlbnQgaXQgY2FuIGRlZmluZQotCSAqIGl0cyBvd24gdmVyc2lvbiBvZiB0aGUg
ZnVuY3Rpb24uCi0JICovCi0JZmx1c2hfZGNhY2hlX3BhZ2UocGFnZSk7CiB9Ci0tIAoyLjQ1LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
