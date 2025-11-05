Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B0ECCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnX9qzmRp3E1hYy6rpR5qAUdfiU61IDVbZajaAXKp6g=; b=3Rf1tSMrvRK+oN
	kdgp+AsH3zWD1vM/UFTohApYmkHD3JDvUe5VDxIs3LMjoYCFALG4uL7JjjnTfeNhQpgmz+as20Fko
	aqy19+0xkBNVtvBb/20NhK4MhPN3Ox6VdyekFLtC6pjDIvkI+Xo7whY3TzkNg9U1+Ayzsaz/CBnZc
	4b0G9p1JtyqodMUwVpRS1/sHu0jTWWKWqs4V0bQypmGW/j0cb7wJzvxZq2Ash6ZZMLEFINiZxv6e+
	qoz78MmBmf4hm/7d8NbZnnfArLyxuNQltBsC9JaKrAZlbgXFbaddcTg90JPTw2gL5VDIrIE6ucuJ6
	oawxCg+onhovmkmbLFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZvn-0000000DOc5-3dSz;
	Wed, 05 Nov 2025 09:35:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZvk-0000000DObT-434M
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 09:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F173D43F96;
	Wed,  5 Nov 2025 09:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBF6C116B1;
	Wed,  5 Nov 2025 09:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762335351;
	bh=81UYSPD+0lOjQIr/2Q9pkdoxwrWEaQRmME5VjTnZv+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lneLXE3TvYXMOEdybO5TxbXeH7g1cXCIeTOspbt+mpAsiBjd6V0LIKA0ybfSlEmix
	 IcmJ27k9kDU2PbiZA3JeP65eoxei3zskUXzh2eqVjXmqsvnhthLowHCRH+nF3y3Dq0
	 vsWnqAMUWfBo3mhKIsFAaODLrlrOl4r31EDxQnpWMJoAXgB89aQQsQz/f4TGIc0yeQ
	 8wHX4haZKZkIgIyb9RVodns1ZFlrsLaCpOue6ovqs/JdWAciIPFjZUUBNoBykFkBQl
	 +L9na4f67XIFe48qYUQhooNmmt6fMIJfktdvpO9RWT/RxS3p2jgq9ZyMUwqZAGe/8O
	 TD+aDeqp3fO5w==
Date: Wed, 5 Nov 2025 09:35:44 +0000
From: Lee Jones <lee@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <20251105093544.GE8064@google.com>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_013553_024929_20CF2BC3 
X-CRM114-Status: GOOD (  12.16  )
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

T24gVHVlLCAwNCBOb3YgMjAyNSwgVHJveSBNaXRjaGVsbCB3cm90ZToKCj4gT24gTW9uLCBOb3Yg
MDMsIDIwMjUgYXQgMDE6NDg6MzNBTSArMDEwMCwgU2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6Cj4g
PiAKPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUgMDA6MDE6NTggKzAxMDAsIEF1cmVsaWVuIEphcm5v
IHdyb3RlOgo+ID4gPiBUaGlzIGFkZHMgcG93ZXJvZmYvcmVib290IHN1cHBvcnQgZm9yIHRoZSBT
cGFjZW1pVCBQMSBQTUlDIGNoaXAsIHdoaWNoIGlzCj4gPiA+IGNvbW1vbmx5IHBhaXJlZCB3aXRo
IHRoZSBTcGFjZW1pVCBLMSBTb0MuCj4gPiA+IAo+ID4gPiBOb3RlOiBGb3IgcmVsaWFibGUgb3Bl
cmF0aW9uLCB0aGlzIGRyaXZlciBkZXBlbmRzIG9uIGEgdGhpcyBwYXRjaCB0aGF0IGFkZHMKPiA+
ID4gYXRvbWljIHRyYW5zZmVyIHN1cHBvcnQgdG8gdGhlIFNwYWNlbWlUIEkyQyBjb250cm9sbGVy
IGRyaXZlcjoKPiA+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9zcGFjZW1pdC8yMDI1MTAw
OS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5MzY3ODcwMjg2QGxpbnV4LnNwYWNlbWl0LmNvbS8KPiA+
ID4gCj4gPiA+IFsuLi5dCj4gPiAKPiA+IEFwcGxpZWQsIHRoYW5rcyEKPiA+IAo+ID4gWzEvMl0g
ZHJpdmVyOiByZXNldDogc3BhY2VtaXQtcDE6IGFkZCBkcml2ZXIgZm9yIHBvd2Vyb2ZmL3JlYm9v
dAo+ID4gICAgICAgY29tbWl0OiAyODEyNGNjMGZiOGM3ZGMwMWE2ODM0ZDIyNzM1MWUyNWQ5YTky
YzU4Cj4gU2hvdWxkIHdlIGFwcGx5IGl0IG5vdz8gVGhlIGRlcGVuZGVuY3kgcGF0Y2ggaGFzbuKA
mXQgYmVlbiBtZXJnZWQgeWV0Li4uCgpBbmQgd2hhdCBpczogXltAa2VybmVsLm9yZyBpbiB5b3Vy
IHJlY2lwaWVudHMgbGlzdD8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
