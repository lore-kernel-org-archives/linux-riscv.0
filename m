Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA497CA0EC4
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRMFQTUZvqAPArspDzyVRXGivlyVvx65+3Y/vZnpZXM=; b=P3ZQ66Uu6DkXah
	vnVisTrQxSAWI/FKck5MXRuZdoML08YLdP8TmdMDby12f0HX4vlvVNSlG8gyZFYGKMZU2qkGyvzKY
	Bx1Cffxbe6XT5BYfs6Zdot1ZGFilidkTzyJ+OM07D9CLRUdOqxTALxv9DyIHDGWbxOB6/mLbj2NQR
	RxG2NMw3WZJvTOXPdqYEwzOSe1ziS1z87PnB//NKmMLgfvXTb0JaFBaABNGdGPxKwbgWtMH5jVtdR
	9NxzH5b3YZho4tS4ZiS+zq6ONAq1KnA4MjLiRjdMjA0vMLkUId8rjvZxlSYqS9WlzUuhBU8/RS9tc
	fNKrUsBYSP7g8PIKeTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDNR-000000060L7-2lRA;
	Sun, 10 Aug 2025 21:14:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKq-00000005zWf-0lLM
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 21:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60941A56763;
	Sun, 10 Aug 2025 21:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A99C4CEEB;
	Sun, 10 Aug 2025 21:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860327;
	bh=29Jkt6E+Z/r91Gjka8wTSIyCZDKG/PFRHm4REKs81+A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UIjaG7bH7wfZATr/m9gGkNg8qtUzFyU3q54CX3clwzy1T8HGH1Pyqm0RwMSf/Fajx
	 L82wKsg1dgZJr1ykakZYkN2r4mj1gEbExCXwtjPNCDn53twh/tEQcK0pKR3oc2S+Y7
	 Ibb6c2BY9oTzYZYgOAO/0REmx74l3VUpF+s9eSP+wleUw6ZlwRVMcnuF09OHlk2sBB
	 1naQUUjNg5chf2Vh5Sk0smFtSB31SjUe5Pe4odzKLzgt+4+DovMs61dNTAiShoF6zC
	 ZzJkmo2GAfV8VsMVKCYLygCYNkRWsQcpyVZwRu8Z8qv4jbQAaF7QXiGGeR0yqbr6nf
	 Oy8w+ysN6WXkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE0C39D0C2B;
	Sun, 10 Aug 2025 21:12:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/9] add Voyager board support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486033949.1221929.12633096724273159685.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:19 +0000
References: <20250711133025.2192404-1-ben717@andestech.com>
In-Reply-To: <20250711133025.2192404-1-ben717@andestech.com>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
 daniel.lezcano@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 soc@lists.linux.dev, tim609@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141208_294456_86C1829A 
X-CRM114-Status: GOOD (  10.91  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZpeGVz
KQpieSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjoKCk9uIEZyaSwgMTEgSnVsIDIwMjUg
MjE6MzA6MTYgKzA4MDAgeW91IHdyb3RlOgo+IFRoZSBWb3lhZ2VyIGlzIGEgOS424oCdIHggOS42
4oCdIE1pY3JvIEFUWCBmb3JtIGZhY3RvciBkZXZlbG9wbWVudCBib2FyZAo+IGluY2x1ZGluZyBB
bmRlcyBRaUxhaSBTb0MuIFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgbWluaW1hbCBkZXZpY2UgdHJl
ZQo+IGZpbGVzIGZvciB0aGUgUWlMYWkgU29DIGFuZCB0aGUgVm95YWdlciBib2FyZCBbMV0uCj4g
Cj4gTm93IG9ubHkgc3VwcG9ydCBiYXNpYyB1YXJ0IGRyaXZlcnMgdG8gYm9vdCB1cCBpbnRvIGEg
YmFzaWMgY29uc29sZS4gT3RoZXIKPiBmZWF0dXJlcyB3aWxsIGJlIGFkZGVkIGxhdGVyLgo+IAo+
IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjIsMS85XSByaXNj
djogYWRkIEFuZGVzIFNvQyBmYW1pbHkgS2NvbmZpZyBzdXBwb3J0CiAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3Jpc2N2L2MvMDBkYmExOWFhMDA1CiAgLSBbdjIsMi85XSBkdC1iaW5kaW5nczog
cmlzY3Y6IGFkZCBBbmRlcyBRaUxhaSBTb0MgYW5kIHRoZSBWb3lhZ2VyIGJvYXJkIGJpbmRpbmdz
CiAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQogIC0gW3YyLDMvOV0gZHQtYmluZGluZ3M6IGludGVy
cnVwdC1jb250cm9sbGVyOiBhZGQgQW5kZXMgUWlMYWkgUExJQwogICAgKG5vIG1hdGNoaW5nIGNv
bW1pdCkKICAtIFt2Miw0LzldIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogYWRk
IEFuZGVzIG1hY2hpbmUtbGV2ZWwgc29mdHdhcmUgaW50ZXJydXB0IGNvbnRyb2xsZXIKICAgIChu
byBtYXRjaGluZyBjb21taXQpCiAgLSBbdjIsNS85XSBkdC1iaW5kaW5nczogdGltZXI6IGFkZCBB
bmRlcyBtYWNoaW5lIHRpbWVyCiAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQogIC0gW3YyLDYvOV0g
cmlzY3Y6IGR0czogYW5kZXM6IGFkZCBRaUxhaSBTb0MgZGV2aWNlIHRyZWUKICAgIChubyBtYXRj
aGluZyBjb21taXQpCiAgLSBbdjIsNy85XSByaXNjdjogZHRzOiBhbmRlczogYWRkIFZveWFnZXIg
Ym9hcmQgZGV2aWNlIHRyZWUKICAgIChubyBtYXRjaGluZyBjb21taXQpCiAgLSBbdjIsOC85XSBy
aXNjdjogZGVmY29uZmlnOiBlbmFibGUgQW5kZXMgU29DCiAgICAobm8gbWF0Y2hpbmcgY29tbWl0
KQogIC0gW3YyLDkvOV0gTUFJTlRBSU5FUlM6IEFkZCBlbnRyeSBmb3IgQW5kZXMgU29DCiAgICAo
bm8gbWF0Y2hpbmcgY29tbWl0KQoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0
LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNo
d29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
