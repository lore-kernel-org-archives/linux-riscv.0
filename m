Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E609C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDoCTWG9ltiu1AMFpHZMJOarGRoVvtG//zotWrqS2Nw=; b=Eq2RThAY0G8GIf
	/HJ2WV6wPqDVDJekiDDwiRXQ1c5+UKPwtPHPEyCcbkVYqWYUY2jkBY+PgiBi30i70Gg04DRt55y3E
	uzaORvi4tzOxRHKhiMC4kUr/Z3kW9LAFEmxyMgve/XcuxKfwrOFhklzXwl97sn2BqbXrUpd3As3kn
	5YlehnUbjtbgPFz5CJGsaYtlrcJ4XOOaAmYHsY8gTWDBL+KCNrgayoAzomaVkbPO2Ixo0AnuWpXiK
	mmNOJTeMizfzIbMaxyKi8DrSH6kuQP/2JtUWSrjsYdjnkHN7YleQ82gl/Yag6yKTLxDnEp9z++hlp
	fCy3Rzjuf8eI4whvd+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQ8-00000009Bhh-47bx;
	Wed, 11 Jun 2025 08:02:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2r-000000097qy-11MU
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hcFlZXIPovISI3A0GF02Ptjj0W/JPNuTnnrkTLv4Ues=; b=UYtFEcvb8lH6e776+l9AiUGcC2
	SDvDd8iahAbHS6skibKoQiXy7GCxArnkSvippMepFBOIgAk7OIda5WgBDYALmIPvS9P/y02k8H+5O
	Nlbu/TOXRr1NYdC3obg9vauNuM4/cHqzdKPn9ygNxMslxj3uFZeHTV4KxRrx87p6penSFl1xIV6K9
	nUteCbmKpNkZOu0a/hgRG/OLa3wisfuNYRRcrQIw76/UXRcbqE6//DYP4t2cAgZyYOpZl/1no12QV
	8vuK6LfPd7tiTXuE5qAUqgWD/QwZkzw+4WhZ+oqyX2uIKPOhWSjIyiUUrA/OnYNgZU/SU+g7MfAo+
	nmXz5y3A==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2o-00000002A5t-0a3F
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcFlZXIPovISI3A0GF02Ptjj0W/JPNuTnnrkTLv4Ues=;
	b=UR9NDson0GcUp9w/XqKsBHuKAcL28/I2N/FmV0wSvcAQlfgDX0kAP5e2Y8bXDsSJBCOX3/
	hAdR9Bp1v+B6HqdzL5DFGwtBV5Fkj9sDGCauNoFzr6CRO4Lr7xUYqsFsqVpZReu6wHiMd0
	T+9FXetbBwxakxr1W3bGJ3lTRW1Zpg2moNCF3zkKgHvmhR4V5c6e041ERx3EWjqXY88cG8
	XIKOwDtiGz0v9BxDWIdQL4O/pSqDk+smRuEqwqU6zl+b1yQFUM3m+AHdFX4Q5uiVN+hZC+
	YpjtOOkqJpX0kUFylEla+mygxgQs+6MWmUjpb2PNUxxFJLRu0jsVwT5QigyhIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcFlZXIPovISI3A0GF02Ptjj0W/JPNuTnnrkTLv4Ues=;
	b=lPpp0yDPR/ocLggWrZd9PXrFmK0KcWsQfHggDzf1NnD9xoU+99dENQNApPI5E6ZJqyrmVM
	AAxin48bL8+sv/Cg==
Date: Wed, 11 Jun 2025 09:38:09 +0200
Subject: [PATCH v3 03/16] init: re-add CONFIG_CC_CAN_LINK_STATIC
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-3-55e3d148cbc6@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=1194;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Ig7VKamiq+jWT99/vdaegByHHqWOv/1lyFWjxVw9lxo=;
 b=AYcuC+jTyGyu/gvw30+W29owm0QbmOqI2QX2qDN5aSROokvjbuctKzldX5zq8F8/qfXOSlkAB
 uvYR7vYCLITCZZ/j7GNVi1mHnUKBop13J7YE/s9VxXI2p5wq0UHRRFn
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083846_339693_6023F697 
X-CRM114-Status: UNSURE (   5.99  )
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

Rm9yIHRoZSBrdW5pdCBVQVBJIGZ1bmN0aW9uYWxpdHkgdGhpcyBmZWF0dXJlIGlzIG5lZWRlZC4K
ClRoaXMgcmV2ZXJ0cyBjb21taXQgZDFiOTljZGYyMmUwICgiaW5pdDogcmVtb3ZlIHVudXNlZCBD
T05GSUdfQ0NfQ0FOX0xJTktfU1RBVElDIikKClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3Nj
aHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGluaXQvS2NvbmZpZyB8
IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9p
bml0L0tjb25maWcgYi9pbml0L0tjb25maWcKaW5kZXggYWY0YzJmMDg1NDU1NGJiY2RmMTkzODUy
Y2Y1YzFkMmMyYWNjYzY0Zi4uMjZjYWZiYWQ0ZjE1NjBmYjU2YjRiZWYzMWFlMjliYWY1NDE3NTY2
MSAxMDA2NDQKLS0tIGEvaW5pdC9LY29uZmlnCisrKyBiL2luaXQvS2NvbmZpZwpAQCAtODcsNiAr
ODcsMTEgQEAgY29uZmlnIENDX0NBTl9MSU5LCiAJZGVmYXVsdCAkKHN1Y2Nlc3MsJChzcmN0cmVl
KS9zY3JpcHRzL2NjLWNhbi1saW5rLnNoICQoQ0MpICQoQ0xBTkdfRkxBR1MpICQoVVNFUkNGTEFH
UykgJChVU0VSTERGTEFHUykgJChtNjQtZmxhZykpIGlmIDY0QklUCiAJZGVmYXVsdCAkKHN1Y2Nl
c3MsJChzcmN0cmVlKS9zY3JpcHRzL2NjLWNhbi1saW5rLnNoICQoQ0MpICQoQ0xBTkdfRkxBR1Mp
ICQoVVNFUkNGTEFHUykgJChVU0VSTERGTEFHUykgJChtMzItZmxhZykpCiAKK2NvbmZpZyBDQ19D
QU5fTElOS19TVEFUSUMKKwlib29sCisJZGVmYXVsdCAkKHN1Y2Nlc3MsJChzcmN0cmVlKS9zY3Jp
cHRzL2NjLWNhbi1saW5rLnNoICQoQ0MpICQoQ0xBTkdfRkxBR1MpICQoVVNFUkNGTEFHUykgJChV
U0VSTERGTEFHUykgJChtNjQtZmxhZykgLXN0YXRpYykgaWYgNjRCSVQKKwlkZWZhdWx0ICQoc3Vj
Y2VzcywkKHNyY3RyZWUpL3NjcmlwdHMvY2MtY2FuLWxpbmsuc2ggJChDQykgJChDTEFOR19GTEFH
UykgJChVU0VSQ0ZMQUdTKSAkKFVTRVJMREZMQUdTKSAkKG0zMi1mbGFnKSAtc3RhdGljKQorCiAj
IEZpeGVkIGluIEdDQyAxNCwgMTMuMywgMTIuNCBhbmQgMTEuNQogIyBodHRwczovL2djYy5nbnUu
b3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMTM5MjEKIGNvbmZpZyBHQ0NfQVNNX0dPVE9f
T1VUUFVUX0JST0tFTgoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
