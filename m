Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D30BC1746D
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 07:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtSolNa6O2GuxzapsSbqDM+lzq0TDygvHsnpH4fZhCE=; b=QFmDyAvpz4cc+E
	RbpFHNg/d5dRtEZX2WpsavS+lfP3ehfkowtOSOYOsyAmtgqRTGBNsoxlOarASIAXlHdQKFQEpjFx1
	CQwUYxJJIv6iJtH5Q5SdLFqzuV5atfpSJovhfHnNRGvNRhSumSONM6UDABFjIvFhhKIVoozIaZkop
	GgaZZ+TjN7In1uEsaAtmstM+Wt7aVJrUIOG6xeunomgzqYOgrwBdmDw+MYr1CGPSD0ZCdOFcT+eXG
	tyDJfRFG88c3qEaONR1R2WzOqF13F4CwbyZ/i41I6K1pApg7XB44c0MLgj4EzZeQ0eEupwgMphXqZ
	xnMIdwCADiXoePmaH97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB0m-0000000GKTR-3gb4;
	Tue, 23 Apr 2024 07:56:21 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB0Z-0000000GKI0-2f13;
	Tue, 23 Apr 2024 07:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1713858962;
	bh=1pR6m5Wi5iIO9mWeE7uFEYPdE/xPU01dcPav6FtcGgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qrpXb4E7M7hSiZ8Cf2INubIQwovOxf8rtiST2nTdYG56P/i02vaGe83f+9bvQprvq
	 VgpcOsvaoWCndC7LXwkbN21msJ81t9jqvLggR4K6+dWl6vt6tbFaQ5B1IFnTi+I3Mw
	 H0IMGkDPx1RTLLHkm4qk51fTBM34bIyN02uPPn08=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:37 +0200
Subject: [PATCH v3 02/11] cgroup: bpf: constify ctl_table arguments and
 fields
MIME-Version: 1.0
Message-Id: <20240423-sysctl-const-handler-v3-2-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
Cc: Eric Dumazet <edumazet@google.com>, Dave Chinner <david@fromorbit.com>, 
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-xfs@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, kexec@lists.infradead.org, 
 linux-hardening@vger.kernel.org, bridge@lists.linux.dev, 
 lvs-devel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 rds-devel@oss.oracle.com, linux-sctp@vger.kernel.org, 
 linux-nfs@vger.kernel.org, apparmor@lists.ubuntu.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=686;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=1pR6m5Wi5iIO9mWeE7uFEYPdE/xPU01dcPav6FtcGgk=;
 b=pcm/jJjouDKJ7dKkXuplkCwgN4lakaTVY5yViah+TEyJb0kgB/5JxKSM28vhTdxT/a0KzPrgc
 T5MafpuEka/DMwunsovOVuekoxGTF4FJjqwg/mb6qFtEZR2YOr2vquk
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_005608_184648_267F2DD5 
X-CRM114-Status: UNSURE (   8.58  )
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

SW4gYSBmdXR1cmUgY29tbWl0IHRoZSBzeXNjdGwgY29yZSB3aWxsIG9ubHkgdXNlCiJjb25zdCBz
dHJ1Y3QgY3RsX3RhYmxlIi4gQXMgYSBwcmVwYXJhdGlvbiBmb3IgdGhhdCBhZGFwdCB0aGUgY2dy
b3VwLWJwZgpjb2RlLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdl
aXNzc2NodWgubmV0PgotLS0KIGluY2x1ZGUvbGludXgvZmlsdGVyLmggfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2ZpbHRlci5oIGIvaW5jbHVkZS9saW51eC9maWx0ZXIuaAppbmRleCA3YTI3ZjE5
YmY0NGQuLjRlYWRhNTVhMmRmOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9maWx0ZXIuaAor
KysgYi9pbmNsdWRlL2xpbnV4L2ZpbHRlci5oCkBAIC0xNDA0LDcgKzE0MDQsNyBAQCBzdHJ1Y3Qg
YnBmX3NvY2tfb3BzX2tlcm4gewogCiBzdHJ1Y3QgYnBmX3N5c2N0bF9rZXJuIHsKIAlzdHJ1Y3Qg
Y3RsX3RhYmxlX2hlYWRlciAqaGVhZDsKLQlzdHJ1Y3QgY3RsX3RhYmxlICp0YWJsZTsKKwljb25z
dCBzdHJ1Y3QgY3RsX3RhYmxlICp0YWJsZTsKIAl2b2lkICpjdXJfdmFsOwogCXNpemVfdCBjdXJf
bGVuOwogCXZvaWQgKm5ld192YWw7CgotLSAKMi40NC4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
