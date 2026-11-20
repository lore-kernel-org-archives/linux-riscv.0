Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0E606A326
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 02:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TAeogIPr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyOZ1Gg9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pMuC3RQ8TFgLZVUDmQj7fdV0SvLdrOG6Qj6U+J2/l9A=; b=TAeogIPrWDfFXxKg15AuGwzZMT
	sfew43nkHkDtd6eSTb5GPfQkGltPd9I+vBM4r19z71E6PXqBkuPFMFI+Ilt8XrSHWyBKOmdKi7qBC
	ppTdwDD5NAAL0ChRbYOaTSyNBOy2RBpVibUpuloJDBlBMPlE0vFy+DUxRXFl5x+dpIrK1XB35pu7R
	3RRdb9HhC59yJxW5ArmgAmQCThPqmekK04s4YYdepQfxeyId9t7IX0KhXhmNxBKyHiGitzwz1KSBn
	i3xNvD/23FxfqebPO0FGkbhIHKY4ZxROts3l8fT3T9qIp7YSllXigA90z7Ujbju2D5dxe+IxyFJwD
	vx81xdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEXq-0000000DtvI-0buC;
	Fri, 20 Nov 2026 02:40:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEXo-0000000Dtv5-0FKS;
	Fri, 20 Nov 2026 02:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6944E42490;
	Fri, 20 Nov 2026 02:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4572C1F000C4;
	Fri, 20 Nov 2026 02:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795142407;
	bh=gttAyrJ+wMHr+Glcgouy7cx0rJKje8ChJMiYhq7/fZ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SyOZ1Gg9Bi5B0hlXjHgtJKD3pipKypaafZJWRX6z9RPhhaLrNC3K0s5CtSW5SI5GJ
	 QjXEXKdoQdXsroB1Y4DhGd3w93GCMQ9/rK8yJ3gK5mCktNhS7CusorMDYhqAc6AJaC
	 2Vy459uH56iFQsVVZp0sbFe6PeLubLRBLBrhC3xpRURbZJ9QZ83V2pHV77UyTpsbkt
	 53xPetogCbdr5PiCgD9HV+cAu76r1HtptgIxXszPEIqzO/2G3joApUxTcJl+uZ52nh
	 1Yt2LAcjMPQGWdT/pxQuU3oKRTaR6HhRWlZHsZG8qo3Z9iE6UKh8U1emQC9kr5ZNt3
	 74RLVDq+gmrfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A5B53808209;
	Fri, 20 Nov 2026 02:40:07 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf 0/2] bpf: Limit writable registers in uprobe context
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179514240603.3989712.15825286425363086604.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:40:06 +0000
References: <20261118084451.12590-1-jolsa@kernel.org>
In-Reply-To: <20261118084451.12590-1-jolsa@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 mhiramat@kernel.org, oleg@redhat.com, bpf@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, will@kernel.org,
 palmer@dabbelt.com, peterz@infradead.org, rtm@csail.mit.edu
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBicGYvYnBmLmdpdCAobWFzdGVyKQpi
eSBBbGV4ZWkgU3Rhcm92b2l0b3YgPGFzdEBrZXJuZWwub3JnPjoKCk9uIFdlZCwgMTggTm92IDIw
MjYgMDk6NDQ6NDggKzAxMDAgeW91IHdyb3RlOgo+IEhpLAo+IGEgdXByb2JlIEJQRiBwcm9ncmFt
IGNhbiBjdXJyZW50bHkgd3JpdGUgZmllbGRzIGluIHN0cnVjdCBwdF9yZWdzIHRoYXQKPiBhcmUg
bG9hZGVkIGRpcmVjdGx5IGJ5IHRoZSBhcmNoaXRlY3R1cmXigJlzIHJldHVybi10by11c2VyIHBh
dGguIFNvbWUgb2YKPiB0aGVzZSBmaWVsZHMgYXJlIHJlc3RyaWN0ZWQgYnkgcHRyYWNlLCBidXQg
dGhlIEJQRiB2ZXJpZmllciBkb2VzIG5vdAo+IGFwcGx5IHRoZSBzYW1lIHJlc3RyaWN0aW9ucy4K
PiAKPiBUaGlzIHNlcmllcyBsaW1pdHMgdXByb2JlIGNvbnRleHQgd3JpdGVzIHRvIHJlZ2lzdGVy
cyB0aGF0IHB0cmFjZSBjYW4KPiBzZXQgdG8gYXJiaXRyYXJ5IHZhbHVlcy4gSXQgYWRkcyBhcmNo
aXRlY3R1cmUtc3BlY2lmaWMgd3JpdGFibGUtcmVnaXN0ZXIKPiBjaGVja3MgZm9yIGFybTY0LCBy
aXNjdiwgYW5kIHg4Ni02NDsgb3RoZXIgYXJjaGl0ZWN0dXJlcyBkZWZhdWx0IHRvCj4gYWxsb3dp
bmcgbm8gd3JpdGVzLiBSZWFkcyBhcmUgdW5jaGFuZ2VkLgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRo
ZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbYnBmLDEvMl0gYnBmOiBSZXN0cmljdCB1cHJvYmUg
Y3R4IHdyaXRlcyB0byB0aGUgcmVnaXN0ZXJzIHB0cmFjZSBjYW4gc2V0CiAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2JwZi9icGYvYy9jYTQ0NzMxYTcwMDkKICAtIFticGYsMi8yXSBzZWxmdGVz
dHMvYnBmOiBUZXN0IHdoaWNoIGN0eCByZWdpc3RlcnMgYSB1cHJvYmUgcHJvZyBjYW4gd3JpdGUK
ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnBmL2JwZi9jL2MyMWIwZjgyY2E5NgoKWW91IGFy
ZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRw
czovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
