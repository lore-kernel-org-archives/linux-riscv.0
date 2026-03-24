Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C20AF532DE
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0RMyNyK1+Vgs6opDUUpFAdw8BhtNCf65f44nBVaybg=; b=1crJeATWPjDlHu
	NT1UervtNmS5NHb4AJZZGNukwv4ThhWPO1Kp4UT4ZHlJCGdmSRuhh8fvoqMC/GOyWeRMKcGAO5+qF
	rVsyIxm7Nd7HPo9G6td6Td3TnfBMNN7urnxZ9SDeGTvyVSNeyJchw4df+SqQZhgCJRqHX0+f8VvtC
	Iw7wi+d1lm6xVaGGcALR67VO/MfySOYvFnHnE3nFzFzvHA6pqb9c5+oJTeH9V5RftOzT7U8BHwv0m
	8ak4nAp7EO731AnQlJkTH9e1NtDeNWJ6meg6QJttpQhTBURgh9yK7hhiCQCOwwYc0iOlZVqxAGSAA
	EHuoEAku7+5jjmUpvkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvl-00000000ddI-2BUi;
	Tue, 24 Mar 2026 06:07:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvg-00000000dVY-2KCx;
	Tue, 24 Mar 2026 06:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBAAD60103;
	Tue, 24 Mar 2026 06:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE5CC19424;
	Tue, 24 Mar 2026 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332471;
	bh=YORPjLn1SNWGXCVk9I6tBDAbeqhs9CT1QTCVC1Ub4mo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aes8ZaBFdbKKcRRKQ9zNoBKT2Kr/K5sZimTlu6ZoDL/qMv9cU2Igdl66Np79qb6cF
	 Y0PgVocdm0KPCSUDQ4zY/FWCcXDq39bOVjh6Go9xpLthEBRkRPrjAxu6l4FFhE40hk
	 1dI5r0G3qvhFJy8CEPfPNSsV2tmzhRhoIL00cNFmtfUlLcFnpR01R74LKUwsrZqMeO
	 tY6vrjtL2ye3FczovFRHaJV88dh3khU9HisnL701oD5rGNiUTfr1L0ZgmyrWH0wGmr
	 RuhUshSDPxVeOQnAEX+VmaLoaW6Y5k7I9g7CbsjEdmv2iz5kFDHz/cWGfm/RU8pMlE
	 ti67GWoViYHkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D403808200;
	Tue, 24 Mar 2026 06:07:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: fix off-by-one array access in SBI PMU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433245979.469836.14855063551962927308.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:39 +0000
References: <20260227134617.23378-1-radim.krcmar@oss.qualcomm.com>
In-Reply-To: <20260227134617.23378-1-radim.krcmar@oss.qualcomm.com>
To: =?utf-8?b?UmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 lukas.gerlach@cispa.de, anup@brainfault.org, atish.patra@linux.dev,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 ajones@ventanamicro.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+OgoKT24gRnJpLCAyNyBGZWIg
MjAyNiAxMzo0NjoxNiArMDAwMCB5b3Ugd3JvdGU6Cj4gVGhlIGluZGV4ZWQgYXJyYXkgb25seSBo
YXMgUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyBlbGVtZW50cy4KPiBUaGUgb3V0LW9mLWJvdW5kIGFj
Y2VzcyBjb3VsZCBoYXZlIGJlZW4gcGVyZm9ybWVkIGJ5IGEgZ3Vlc3QsIGJ1dCBpdAo+IGNvdWxk
IG9ubHkgYWNjZXNzIGFub3RoZXIgZ3Vlc3QgYWNjZXNzaWJsZSBkYXRhLgo+IAo+IEZpeGVzOiA4
ZjAxNTNlY2QzYmYgKCJSSVNDLVY6IEtWTTogQWRkIHNrZWxldG9uIHN1cHBvcnQgZm9yIHBlcmYi
KQo+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFs
Y29tbS5jb20+Cj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAt
IFJJU0MtVjogS1ZNOiBmaXggb2ZmLWJ5LW9uZSBhcnJheSBhY2Nlc3MgaW4gU0JJIFBNVQogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzVjMWJiMDc4NzExMQoKWW91IGFyZSBhd2Vz
b21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tv
cmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
