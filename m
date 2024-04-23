Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F483C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 07:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0cNX6W7rZSq+nZ8vGKGJ3+v3WD95xKoH7Bno2pjql4=; b=i/rGawB8jwFOMe
	IIRu6BTqrjtuN7kKC3c8NuoKH7rKXb/rDTfT2+x8KSGFpzWW5PNngfIGmz1pm5LOLx62lyWmfT81w
	gYjKOZHbT/tFET3AIMb/9QTEzmtWneZHwra5MzoHugeDudslmzAAvLcoLT/vSU7I3Hfyjxq59eTBa
	rPAfzp07ekNZIRL1FuwHhNjajqEIYmr4+RiiHJzaTOdzGRDhUIWw9tgUXYlAcKgmJHWDr6T7bCMNi
	HzLeiF33I/xujbUzgGvx/YswN6Np03ek8BXS5RS2yWXIgm75HiUOmeOVxa6ZuCxReGj7z+FUIuLHJ
	k5ot8eKvprHYfUAfQvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB1K-0000000GKr1-2ZT3;
	Tue, 23 Apr 2024 07:56:54 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzB0Z-0000000GKHz-2olH;
	Tue, 23 Apr 2024 07:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1713858962;
	bh=rorPfneHsH4rUwSDhKhni5qatzGJBaNeOV3jbM8lXHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dzsiMjXGUMnBeinztfZVIlnYV1FybTv3PVNga/7GNRmjq0tvokzKVmAqMxqZ4TZfu
	 3Mm9Xa73ByvDCbl+zSGzluYBcTMsPar3kyGR78xthILGtEnmvJBhKWCBZI5pDCg6C/
	 UHsAfQ2uBimCPXwCv8/f91yRU/qBVoZCnvSEXqbk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:38 +0200
Subject: [PATCH v3 03/11] hugetlb: constify ctl_table arguments of utility
 functions
MIME-Version: 1.0
Message-Id: <20240423-sysctl-const-handler-v3-3-e0beccb836e2@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=1138;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rorPfneHsH4rUwSDhKhni5qatzGJBaNeOV3jbM8lXHw=;
 b=uf+pHLZXXpo1yHHJ2Z13M1e5OT7jsu5lvkviloIZv10UAQiz7g1qEzlA2Tlm9z/kgvmk0wE7S
 t+OfiZGT2B0DcKcd55qz3Jc+6I9uA8iEvRoTSo4pFJmvocUaelGw1Ie
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_005608_193651_56C4D91F 
X-CRM114-Status: UNSURE (   8.49  )
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

SW4gYSBmdXR1cmUgY29tbWl0IHRoZSBwcm9jX2hhbmRsZXJzIHRoZW1zZWx2ZXMgd2lsbCBjaGFu
Z2UgdG8KImNvbnN0IHN0cnVjdCBjdGxfdGFibGUiLiBBcyBhIHByZXBhcmF0aW9uIGZvciB0aGF0
IGFkYXB0IHRoZSBpbnRlcm5hbApoZWxwZXJzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOf
c2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgotLS0KIG1tL2h1Z2V0bGIuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9tbS9odWdldGxiLmMgYi9tbS9odWdldGxiLmMKaW5kZXggM2I3ZDVkZGMzMmFkLi44ZDEy
Y2U2M2E0MzkgMTAwNjQ0Ci0tLSBhL21tL2h1Z2V0bGIuYworKysgYi9tbS9odWdldGxiLmMKQEAg
LTQ5MTEsNyArNDkxMSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgYWxsb3dlZF9tZW1zX25yKHN0
cnVjdCBoc3RhdGUgKmgpCiB9CiAKICNpZmRlZiBDT05GSUdfU1lTQ1RMCi1zdGF0aWMgaW50IHBy
b2NfaHVnZXRsYl9kb3Vsb25ndmVjX21pbm1heChzdHJ1Y3QgY3RsX3RhYmxlICp0YWJsZSwgaW50
IHdyaXRlLAorc3RhdGljIGludCBwcm9jX2h1Z2V0bGJfZG91bG9uZ3ZlY19taW5tYXgoY29uc3Qg
c3RydWN0IGN0bF90YWJsZSAqdGFibGUsIGludCB3cml0ZSwKIAkJCQkJICB2b2lkICpidWZmZXIs
IHNpemVfdCAqbGVuZ3RoLAogCQkJCQkgIGxvZmZfdCAqcHBvcywgdW5zaWduZWQgbG9uZyAqb3V0
KQogewpAQCAtNDkyOCw3ICs0OTI4LDcgQEAgc3RhdGljIGludCBwcm9jX2h1Z2V0bGJfZG91bG9u
Z3ZlY19taW5tYXgoc3RydWN0IGN0bF90YWJsZSAqdGFibGUsIGludCB3cml0ZSwKIH0KIAogc3Rh
dGljIGludCBodWdldGxiX3N5c2N0bF9oYW5kbGVyX2NvbW1vbihib29sIG9iZXlfbWVtcG9saWN5
LAotCQkJIHN0cnVjdCBjdGxfdGFibGUgKnRhYmxlLCBpbnQgd3JpdGUsCisJCQkgY29uc3Qgc3Ry
dWN0IGN0bF90YWJsZSAqdGFibGUsIGludCB3cml0ZSwKIAkJCSB2b2lkICpidWZmZXIsIHNpemVf
dCAqbGVuZ3RoLCBsb2ZmX3QgKnBwb3MpCiB7CiAJc3RydWN0IGhzdGF0ZSAqaCA9ICZkZWZhdWx0
X2hzdGF0ZTsKCi0tIAoyLjQ0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
