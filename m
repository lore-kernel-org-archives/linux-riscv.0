Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7309C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 21:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jws5mqug/zdjGq0c3EF79YeowWyEjDjyCbulwKS0aU=; b=szwTA8hDJd1mwy
	DXTx3irrqksMozeMIhotjrs/Byow6Tk9l/cB2tXxDsBS+nzrTjTZsrlAB94WVEVNU3g2Juu1j4jIr
	yGQsBRBpBCVH9KRYnLoEnADI+I91AdFEBsV+0rsFZgMRQ6tCCJtQs0hDFYX/g1Ch0dbg/7XFOhJas
	Q/Qurq8Ex2JfGdSTnrvk3z2qwMhGDPd7saQWt1NWpUGwyLErLXGJuIWspBDDEX6Jy3210o05/PWXa
	shP6e5I0zFSXdX4ICG0SAZyxssOFGPUjEcMFmA6/6ENxyO+G6g5Toc+c0eaSjZrXwpl304Qk3wA9K
	Y3GDDvmyRvinva+FiyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni0OS-002K6B-FP; Fri, 22 Apr 2022 21:00:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni0OP-002K5n-P3
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 21:00:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A99261E29;
 Fri, 22 Apr 2022 21:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68019C385AA;
 Fri, 22 Apr 2022 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650661240;
 bh=FwJU4+do9xfssxQ9LD+FcTKxdvYIPYbMbEWSNrxzoCQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TpXs8qW598EiNpBkDknHFjG01azSgBEoX+nXuSBbk4UkYHgtT8TPLGfAhNi85vgoz
 O8A9vbhwyk/g+R93j2ALW3/yXv5LwK9q+cUUvM7unwPp3RBNX3y68BP4+lnyB32nlV
 bqSYq47B6/vtsHWq1UWZDhfcZwyHOqiSr5y0P9rLXzgrM2qyeLKUtHTMV8Rs5Z841w
 +DWMvlWagHbq74ruhtxxcXYEEMgeO2JA/Pw0tQ4P9GEAovT1BDlmLbSUie/upmZk0r
 GS1a5hvuEN25rwEPHN55MsOBs0/KgL3ppb8Op3WLO18Vsz6MKlMDgY/rVGIQPXszzk
 ah1c/jLZ9Gyhw==
MIME-Version: 1.0
In-Reply-To: <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
References: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
 <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org, krzk+dt@kernel.org,
 daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, conor.dooley@microchip.com
To: Conor Dooley <mail@conchuod.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 atulkhare@rivosinc.com
Date: Fri, 22 Apr 2022 14:00:38 -0700
User-Agent: alot/0.10
Message-Id: <20220422210040.68019C385AA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_140041_893542_EEB3B8BB 
X-CRM114-Status: GOOD (  10.26  )
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

UXVvdGluZyBDb25vciBEb29sZXkgKDIwMjItMDQtMjIgMTI6NTk6MDkpCj4gT24gMjIvMDQvMjAy
MiAyMDozOSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gPiAKPiA+IFRoYW5rcy7CoCBUaGVzZSBn
ZW5lcmFsbHkgbG9vayBnb29kIHRvIG1lLCBidXQgSSBkb24ndCBzZWUgYWNrcyBmcm9tIGV2ZXJ5
b25lLsKgIEknbSBwZXJmZWN0bHkgZmluZSB0cmVhdGluZyB0aGVzZSBhcyBmaXhlcyBhbmQgdGFr
aW5nIHRoZW0gdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUsIGJ1dCBsb29rcyBsaWtlIGl0J3MgbW9z
dGx5IGNsayBzdHVmZiBzbwo+ID4gCj4gPiBBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1l
ckByaXZvc2luYy5jb20+Cj4gCj4gWWUsIGhvcGVmdWxseSB0aGV5IGdvIHZpYSBjbGsuIFN0ZXBo
ZW4gcmVwbGllZCB0byB2MSBvciAyIHNvCj4gSSBmaWd1cmUgdGhleSdyZSBpbiBoaXMgcXVldWUg
OikKCkl0IGhlbHBzIHRvIGJlIGV4cGxpY2l0IGluIHRoZSBjb3ZlciBsZXR0ZXIuIEl0J3MgaW4g
bXkgcXVldWUgYnV0IEkgcHV0Cml0IG9uIGhvbGQgYmVjYXVzZSB0aGUgY292ZXIgbGV0dGVyIGRp
ZG4ndCBjbGFyaWZ5IHdoYXQgdHJlZSBpdCB3YXMKaW50ZW5kZWQgZm9yIG5vciB0aGUgcHJpb3Jp
dHkgb2Ygd2hhdCBpcyBiZWluZyBmaXhlZC4KCklzIGJvb3QgYnJva2VuPyBEbyBJIG5lZWQgdG8g
c2VuZCB0aGVzZSB1cCB0byBMaW51cyBuZXh0IHdlZWsgYXMgcGFydCBvZgpmaXhlcyBmb3IgdGhp
cyBtZXJnZSB3aW5kb3c/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
