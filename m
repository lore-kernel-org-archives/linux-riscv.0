Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB17C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vS8C9BQu32R9nrkrnB9ZEg9ukdtstflLUqihEFcNFM4=; b=oiZSMjQKmze7e7
	oAY67pUzyGOxAx6PV82iFCKjbTeFqgZZGUZ95SCzBfPU7MyeS6NTBbHEi+TKgYyc1o0LNJOpRC/ep
	qsTpoxKn0958xRGRT17IfoviukH91h9Ss53WNFI23/MbN0Rqkpys5EhSOY+VGR9O2J2cELOJ7IIEM
	HYNnGI3q4lbD1owP3sYg9Q1+7PtG6bpPDcrFPwjplS4EKbgFdxt4IudV8IuLykMqMM2qKLWrI/Q6B
	i01eirSXcb5VKYhwLYcVuKlSC2soJvALCkcOGv4aCqM8oc6LxIOhSyAmUtvdzXZcYndBFU8uc3N7R
	5PQDg9lF5BL/XskE1VTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeDN-00000006ytM-3khZ;
	Tue, 02 Jul 2024 14:10:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeDI-00000006ys3-395u
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 14:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15714CE1E01;
	Tue,  2 Jul 2024 14:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A8A9C2BD10;
	Tue,  2 Jul 2024 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719929430;
	bh=Hq/HJfHRr/8W72EqDAYRS9KUhjRi1sXTi3WnkwLCKRk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Zs0cKKTIcSl5MVvzU1Gfbq1dsrCbl080cBjBnQA//Q1VlWTCmlQulm6UtU7kRZl1p
	 v3MRXFxbB4GZeGlscjJwpQdTPmWVp85fkfdZIFNLTtooCz4ZCBRGFa2rnt9ksOFyb7
	 adQyCd7Ys5TFANxNXhjNtTeszJwPifQP0X1sIs3w1b5fhAhBY5PRasYpH3txilFpnp
	 eYJhjRIy5bHKUYTMGh2W/AItfHR6/UzaX76Domt2zKrcNHe5TbS1QUeMeMx7QDQaLj
	 SI5Rp6r+XBViuBBMH4Xu6W8QFtIe54eXL7b/QIkcb1Yj7MFjORrOQ3nHO8O28XgLWl
	 VXIfwwLITkGTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2BFB4D2D0E2;
	Tue,  2 Jul 2024 14:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v6 0/3] Add 12-argument support for RV64 bpf
 trampoline
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171992943017.14973.8310193579957590981.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jul 2024 14:10:30 +0000
References: <20240702121944.1091530-1-pulehui@huaweicloud.com>
In-Reply-To: <20240702121944.1091530-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org, palmer@dabbelt.com,
 pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_071032_985267_7C9FAD45 
X-CRM114-Status: UNSURE (   8.34  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBicGYvYnBmLW5leHQuZ2l0IChtYXN0
ZXIpCmJ5IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+OgoKT24gVHVlLCAg
MiBKdWwgMjAyNCAxMjoxOTo0MSArMDAwMCB5b3Ugd3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIDEy
IGZ1bmN0aW9uIGFyZ3VtZW50cyBzdXBwb3J0IGZvciByaXNjdjY0IGJwZgo+IHRyYW1wb2xpbmUu
IFRoZSBjdXJyZW50IGJwZiB0cmFtcG9saW5lIHN1cHBvcnRzIDw9IHNpemVvZih1NjQpIGJ5dGVz
Cj4gc2NhbGFyIGFyZ3VtZW50cyBbMF0gYW5kIDw9IDE2IGJ5dGVzIHN0cnVjdCBhcmd1bWVudHMg
WzFdLiBUaGVyZWZvcmUsIHdlCj4gZm9jdXMgb24gdGhlIHNpdHVhdGlvbiB3aGVyZSBzY2FsYXJz
IGFyZSBhdCBtb3N0IFhMRU4gYml0cyBhbmQKPiBhZ2dyZWdhdGVzIHdob3NlIHRvdGFsIHNpemUg
ZG9lcyBub3QgZXhjZWVkIDLDl1hMRU4gYml0cyBpbiB0aGUgcmlzY3YKPiBjYWxsaW5nIGNvbnZl
bnRpb24gWzJdLgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAg
LSBbYnBmLW5leHQsdjYsMS8zXSByaXNjdiwgYnBmOiBBZGQgMTItYXJndW1lbnQgc3VwcG9ydCBm
b3IgUlY2NCBicGYgdHJhbXBvbGluZQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBm
LW5leHQvYy82ODAxYjBhZWY3OWQKICAtIFticGYtbmV4dCx2NiwyLzNdIHNlbGZ0ZXN0cy9icGY6
IEZhY3RvciBvdXQgbWFueSBhcmdzIHRlc3RzIGZyb20gdHJhY2luZ19zdHJ1Y3QKICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvYnBmL2JwZi1uZXh0L2MvNWQ1MmFkMzY2ODNhCiAgLSBbYnBmLW5l
eHQsdjYsMy8zXSBzZWxmdGVzdHMvYnBmOiBBZGQgdGVzdGNhc2Ugd2hlcmUgN3RoIGFyZ21lbnQg
aXMgc3RydWN0CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jLzk0NzRm
NzJjZDY1NwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJ
IGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5o
dG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
