Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD2E77182
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/tx2OAGeBpO8dI8zbR6k4aY94w/dXPC0UraTLieNXg=; b=Q5mHPvo12UYW+5
	E3xnF/fhK6YRoNLOP8ogsPu2qHI/b+u5NB/ZXZfBc5uxkmAbAt6uQMIPVBv41kZK/IXRY5gctMRhv
	326DJL0FRyd3dO85pxOzIjVe9pa65tGCyqXR9E2+lpqxG7xkl/8W82xkI5qZfF2vpMKuTBrEKvA5J
	hsaOjs1cmgvNa6Vn3VwqYgsPCuMQ2skVkcRMd7tWVO7sKQ2JuhFlvzaFUkZGQKBziw0JEabGcmc98
	afrYAC9Rl4rsJExy3zbuod902Nb/oxd2cQFT6qSPdlcV578MKPjNkK9UfiFzCIVfVUnxOEI9PG1Pl
	tFVpMDUUP7WyCokNx+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGp-0000000GLA8-0ZHV;
	Wed, 11 Dec 2024 22:33:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFi-0000000GKKy-1RjD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52BD5A41DA2;
	Wed, 11 Dec 2024 22:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF6BC4CEE0;
	Wed, 11 Dec 2024 22:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956337;
	bh=DPm05kHltpEewW4iDgoVf8//KAwPkxNr3T75XSMhm5s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bEl/CjW12x/WoIvT0JWZgDNgZNOG4yAoYC8fL0DTwLdezKSKaxNahz4l0MkfpU6HI
	 4Z0awS0oUbkFLA5ytXctWKXdm3FkV96b+lGzdV4QrBP8Q9gi7rF+xoGEn1cqPjCTbD
	 4ixH9fVSOk9M8hjH27Bln24p7sFWBPpRCxEQJvBLtfDS9OGgON02gn+P8QQsc/x3cC
	 l97z+90OA+7W+njKtuF8JBUHW++MAr7TIeNMXwTJfnOiNHSVxqJRIaf0iDMRLSG+7q
	 u45yKS67+kWXugIhvUjZwdWZu0K6kYYq4nAhlRYOdXqYEcePS137K6ylmvKn1X1i0J
	 Keb6S45Y+tHPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF29380A965;
	Wed, 11 Dec 2024 22:32:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v2] tools: Override makefile ARCH variable if defined,
 but empty
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395635324.1729195.17131106959498810013.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:33 +0000
References: <20241127101748.165693-1-bjorn@kernel.org>
In-Reply-To: <20241127101748.165693-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, alexghiti@rivosinc.com, acme@redhat.com,
 jean-philippe@linaro.org, qmo@kernel.org, andrii.nakryiko@gmail.com,
 bjorn@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, davidlt@rivosinc.com,
 namhyung@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143218_473022_E2871F3F 
X-CRM114-Status: GOOD (  11.46  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+OgoKT24gV2VkLCAyNyBO
b3YgMjAyNCAxMToxNzo0NiArMDEwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IFRoZXJlIGFyZSBhIG51bWJlciBvZiB0b29scyAoYnBm
dG9vbCwgc2VsZnRlc3RzKSwgdGhhdCByZXF1aXJlIGEKPiAiYm9vdHN0cmFwIiBidWlsZC4gSGVy
ZSwgYSBib290c3RyYXAgYnVpbGQgaXMgYSBidWlsZCBob3N0IHZhcmlhbnQgb2YKPiBhIHRhcmdl
dC4gRS5nLiwgYXNzdW1lIHRoYXQgeW91J3JlIHBlcmZvcm1pbmcgYSBicGZ0b29sIGNyb3NzLWJ1
aWxkIG9uCj4geDg2IHRvIHJpc2N2LCBhIGJvb3RzdHJhcCBidWlsZCB3b3VsZCB0aGVuIGJlIGFu
IHg4NiB2YXJpYW50IG9mCj4gYnBmdG9vbC4gVGhlIHR5cGljYWwgd2F5IHRvIHBlcmZvcm0gdGhl
IGhvc3QgYnVpbGQgdmFyaWFudCwgaXMgdG8gcGFzcwo+ICJBUkNIPSIgaW4gYSBzdWItbWFrZS4g
SG93ZXZlciwgaWYgYSB2YXJpYWJsZSBoYXMgYmVlbiBzZXQgd2l0aCBhCj4gY29tbWFuZCBhcmd1
bWVudCwgdGhlbiBvcmRpbmFyeSBhc3NpZ25tZW50cyBpbiB0aGUgbWFrZWZpbGUgYXJlCj4gaWdu
b3JlZC4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW2Jw
Zix2Ml0gdG9vbHM6IE92ZXJyaWRlIG1ha2VmaWxlIEFSQ0ggdmFyaWFibGUgaWYgZGVmaW5lZCwg
YnV0IGVtcHR5CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvNTM3YTI1MjVlYWY3
CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
