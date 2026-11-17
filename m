Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28601606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwxKU8Yb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=l0eyfPLC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x/Fl/s/VNO0uL6zFiVRiF8sxkbcCTpcaHOdUxxI+P0g=; b=nwxKU8Yban/X1l3arRonAlGe5a
	mHl2pKX3gBTjnrO6GRsa782XjeEa1ZLMtLajxYhftttPYpqujWgO17/j/tFq+e2mbP5hzYWSHVqX2
	I7o+SshB0PC99QiYrvQwroWQ2e+G608nsIfPeQwc1F1AqQtXkg7SaARHvUagI5HK4PoiFK71ktLUS
	iRFZ1wkJGggNz6kaqt4Zl4YZtZYwP0RAzbv4EM0/spACEerH0IN+RqXnDhsefeS4zaKqqRLrebWd1
	Jox5m8DKujgjoZR6Ih09UEVdr4ZIVp291iWkC0nXlZjurWCNbhay4FoD5unbsWnJJqOuONyv6vTcv
	iCbczE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT89R-00000004KTg-2Q6U;
	Tue, 17 Nov 2026 01:38:25 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT89P-00000004KTF-07MY
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 01:38:24 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so6500890a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 17:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794879501; cv=none;
        d=google.com; s=arc-20260327;
        b=V6nhouyZtOCJ+SDxcnHe+wV7LLzqFPrhrVECLMk2xS2HMugzV6/Xv2I+de9VV0WP4s
         N2GznWGyCyQR8+13VUu5mP0SFLbnxUDgFJqy/G4dUmbmBN84p26ZAqvrtuybbm7d9Exj
         41jBTSli6V2hBE1cilrsgCTVPrWxWxymw0GQx2icHIWFXbxCC6Aviz+MaWs1QjC+76xU
         wrTzEeC0aafwdUEppVl1orzxbaOIp0zB5zqMPTyI9pfl0bJQjmCJczqVShBRzaoKIZva
         N1FNVmyaTRV3IEvUuXWQNBHFe2ZiE8Y15WpzlgKuyDYjhC47H8g9sKP/+hYnAnoZ8oyk
         bdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vWuVGtbUvc3uHiwRjOkpDlCbQglip6he3IdzYkVcH6c=;
        fh=4eJVrK3vAK1ZYukdzG0kuX1m2uqXZsYWbN8iCek1yQM=;
        b=AIyO7pxJljG6dCoL0irFe9/DMDpVL1FRPIMwQllYjHD1U4OxpcFelfV8F3/NCGpT7B
         PEEWb+RiIqtApAqHwvLiZ30F4jcSHXv7xyTQ3Y4Ndh/9W5Yq43lx0bzVJMmBkTpLcifw
         QqGGYFnezj9HRUl5N1oMvPUu6W5o0OX7ngehC6vcfMqn+gsbmtTaOzL2JpILM54tA4UH
         5CNl5b4R8vVq8eOnmK1USk4FTelzql6WfNohFrjRElM32fLFcamfzlyRYEd1FUziXsF3
         e+h4wwBOZQdMW1DlLoEKKgLUX4GFQ4MQkrH/F0NCPcY06jW3q6704UNJWAnbuYsmY2pc
         pblQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794879501; x=1795484301; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vWuVGtbUvc3uHiwRjOkpDlCbQglip6he3IdzYkVcH6c=;
        b=l0eyfPLCWeomYq6VydGKlyBl788d3fXKn6lSJTMXk3CDyPNDOKP95vLQe302FWoN2p
         MdJvJb8FqLCAF0as4Ihc9TBHLZTyQAWFAW4rOl87RLdPJcQZmdVO/jjcCDf1UrY9IqiL
         vUr/y27NDKWvxptFS/STf2vWq/nbA6L35hUSAq8oMu6rjLOLzmyNwcl/AfuywEALOHbv
         Xcizj1C4P/0/NRAcjRiAj2Ojnk/ExGf8uyMOGOj9BTMfCi/9X4jY2GaVHDJukBtpK/NK
         fdF4J1fqd40AdG3MoWtM7wVrSww9RstYXe0rFnReFxA1jI8cgDan51YNepM9IjbC1i6h
         b9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794879501; x=1795484301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWuVGtbUvc3uHiwRjOkpDlCbQglip6he3IdzYkVcH6c=;
        b=xJ2hpQAkPOz407N7gv9im6XyaQ8e4PWhvo5xrRRf3F+PWyoNh/iXiLWTMHSf7urFQx
         tc3F1MReuqtqGuihZJG8lKm2Loi5cvPUjDWdK7/NQTS2UKa/zKVLsaKWySXnnIn4dYPX
         DEpoMXZlbx6F9r/jwjDbEGit0grdyQwZBSS01zuHPrY4ShTeMdgLj6e4jzJEFeJvG6hk
         32WF88Tw7Jc2Hmc/AOjpe7IwiZSwegxJL8htfiDnWt31GMYd9sv99E11pfIACW0jrjgX
         ZB4OPAABuIHqwtcKTxQJWdoiEsaqmmrsLs2dlWa1b8HQZLqwnYQekrIQyv6Ku9HPAFa+
         N3aA==
X-Forwarded-Encrypted: i=1; AL+hErGqTDvyGwR36yiNHZUWXV1jGdeE3KKpNWtyCGp+rmTXLIVcLghHARRwfLz8S4ydRaWWEIrIEYMn8lUhCw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9k8IkpIsYiyTTOy9s9BSn3jzxkAxK6DzH3labQnXZUApY5qNN8
	dy35FmICf0pyZtxaIdxx8YSn71PzZBjqWpiWdYHsrF6J8HAATepMkw6/Bp4VMjTc/E/F8nj1wGs
	yt5aspaoHhXhLM/a8ZesEAHmoj3cCeZ5xl+4fF6N5sg==
X-Gm-Gg: AYBFou3QplHu6sFFdqaEzZpSWqEvatKQSfIfgiOH2fhA987ykSID7Mo+BWfFxp61FLI
	YdlfrTlkUxy4EEhOyK8pY6Y+Ggx40srjuiosvf/DyR5J89DbwyYluI2VpK01yax6xOXLw9CAP5z
	x+nmJGqot7vlvrsuHZVKBbpKfdjZQESjp09j0NfzzggFlOjYjVTXrAeSolFnE5o/zWioP7Twhax
	AgLB7u2RtMjv66Lp/5HLz7QwubJGi24b1eid+6llZuMxlTL5db6/VNWPKV+Kq3T5DlPJU6kyPzp
	QwXk+Au0L0ADY+jeiiiZZUExzvPeCcF71oFaHIeDeJIoVP/8ms+iXOoiP2/n5rXiwCMMLcP/p3G
	M9JFEZyGoEh9sCp7RCupYQLjkGOvaUmlZh/ml6Ic=
X-Received: by 2002:a05:6402:a6ca:20b0:6b4:5a9c:4e44 with SMTP id
 4fb4d7f45d1cf-6b7c0ce8d7cmr6473180a12.37.1794879500747; Mon, 16 Nov 2026
 17:38:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116032558.130928-1-zong.li@sifive.com> <avrwLtiPQWedXpY_@xhacker>
In-Reply-To: <avrwLtiPQWedXpY_@xhacker>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 17 Nov 2026 09:38:10 +0800
X-Gm-Features: AclHuK9yBmULwVXZtlSgZp0r9jbpNOgjaKqPlZntGAUIz5bi6JHwDornmBn_XXE
Message-ID: <CANXhq0r1TcyD2KHyKMLc97+PGgPD2Nkx0eR623SRQXYBVAn8mg@mail.gmail.com>
Subject: Re: [PATCH] riscv: usercfi: Don't inherit parent shadow stack for
 user workers
To: Jisheng Zhang <jszhang@kernel.org>
Cc: ivanrwcm25@gmail.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com, 
	samuel.holland@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_173823_134339_1C85C64E 
X-CRM114-Status: GOOD (  24.26  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMTYsIDIwMjYgYXQgODoxOeKAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIE5vdiAxNSwgMjAyNiBhdCAwNzoyNTo1OFBN
IC0wODAwLCBab25nIExpIHdyb3RlOgo+ID4gVXNlci1zcGFjZSBiYWNrZ3JvdW5kIHdvcmtlcnMg
Y3JlYXRlZCB0aHJvdWdoIHRoZSBjb3B5X3RocmVhZCgpIGFyZ3MtPmZuCj4gPiBwYXRoIChzdWNo
IGFzIGlvX3VyaW5nIGlvLXdxL1NRUE9MTCB0aHJlYWRzIGFuZCB2aG9zdCB3b3JrZXJzKSBzaGFy
ZSB0aGUKPiA+IHBhcmVudCdzIG1lbW9yeSBzcGFjZSAoQ0xPTkVfVk0pIGJ1dCBuZXZlciByZXR1
cm4gdG8gdXNlcnNwYWNlLgo+ID4KPiA+IEN1cnJlbnRseSwgdGhlc2Ugd29ya2VycyBpbmhlcml0
IHRoZSBwYXJlbnQncyB1c2VyX2NmaV9zdGF0ZSBib29ra2VlcGluZwo+ID4gdmlhIGR1cF90YXNr
X3N0cnVjdCgpIChlLmcuLCBlbmFibGluZyBzaGFkb3cgc3RhY2sgYW5kIHBvaW50aW5nIHRvIHRo
ZQo+ID4gcGFyZW50J3MgbGl2ZSBzaGFkb3cgc3RhY2sgYmFzZSkuIFdoZW4gc3VjaCBhIHdvcmtl
ciBleGl0cywgbW1fcmVsZWFzZSgpCj4gPiBpbnZva2VzIHNoc3RrX3JlbGVhc2UoKSwgd2hpY2gg
aW5jb3JyZWN0bHkgZXhlY3V0ZXMgdm1fbXVubWFwKCkgb24gdGhlCj4gPiBwYXJlbnQncyBhY3Rp
dmUgdXNlciBzaGFkb3cgc3RhY2suIFRoaXMgdHJpZ2dlcnMgYSBmYXRhbCBTSUdTRUdWCj4gPiAo
U0VHVl9NQVBFUlIgZm9sbG93ZWQgYnkgU0lfS0VSTkVMKSBpbiB0aGUgcGFyZW50IHByb2Nlc3Mg
ZHVyaW5nIGl0cyBuZXh0Cj4gPiBmdW5jdGlvbiByZXR1cm4gY2hlY2sgKHNzcG9wY2hrKS4KPiA+
Cj4gPiBGaXggdGhpcyBieSBleHBsaWNpdGx5IGNsZWFyaW5nIHRoZSBpbmhlcml0ZWQgc2hhZG93
IHN0YWNrIGJvb2trZWVwaW5nCj4gPiAoc2V0dGluZyBiYXNlIGFuZCBhY3RpdmUgc3RhdGUgdG8g
MCkgaW4gdGhlIHVzZXIgd29ya2VyIGJyYW5jaCBvZgo+ID4gY29weV90aHJlYWQoKS4KPgo+ICsg
SXZhbiwKPgo+IEkgdGhpbmsgSXZhbiBoYXMgZml4ZWQgdGhpcyBpc3N1ZSBpbgo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYxMDI4MTU0MzE1LjEyNzI3MDUtMy1pdmFu
cndjbTI1QGdtYWlsLmNvbS8KPgo+IEJlc2lkZXMgdGhlIGlzc3VlLCBoZSBhbHNvIGZpeGVkIGFu
b3RoZXIgYnVnIGluIHJpc2N2LiBUaGUgb25seQo+IGRpZmZlcmVuY2UgaXMgd2hldGhlciBzZXRf
YWN0aXZlX3Noc3RrKHAsIDApIGlzIG5lZWRlZCBvciBub3QuCj4KPiBBbmQgaW4gdGhlIHNhbWUg
c2VyaWVzLCBhIHNlbGZ0ZXN0IGlzIGFsc28gYWRkZWQuIFNvIElNSE8sIHdlJ2QgYmV0dGVyCj4g
dGFrZSBJdmFuJ3MgdmVyc2lvbi4KPiBKdXN0IEZZSSwgYXJtNjQgaGFzIG1lcmdlZCB0aGUgZml4
ZXMgaW50byBsaW51eC03LjQtcmMzCgpUaGFuayB5b3UgZm9yIHRoZSByZW1pbmRlci4gSSBkaWRu
J3Qgbm90aWNlIHRoYXQgcGF0Y2guIEkgd2lsbCBkcm9wIG15CnBhdGNoLiBUaGFuayB5b3Ugc28g
bXVjaAoKPgo+ID4KPiA+IEZpeGVzOiA2MWEwMjAwMjExZDMgKCJyaXNjdjogSW1wbGVtZW50IGFy
Y2gtYWdub3N0aWMgc2hhZG93IHN0YWNrIHByY3RscyIpCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yv
a2VybmVsL3Byb2Nlc3MuYyB8IDkgKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNz
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPiA+IGluZGV4IDM0YzFkNDk4ZDFjYS4u
NGJjOTVhY2M1NDYyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5j
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPiA+IEBAIC0yNjEsNiArMjYx
LDE1IEBAIGludCBjb3B5X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIGNvbnN0IHN0cnVj
dCBrZXJuZWxfY2xvbmVfYXJncyAqYXJncykKPiA+ICAgICAgICAgICAgICAgcC0+dGhyZWFkLnNb
MF0gPSAodW5zaWduZWQgbG9uZylhcmdzLT5mbjsKPiA+ICAgICAgICAgICAgICAgcC0+dGhyZWFk
LnNbMV0gPSAodW5zaWduZWQgbG9uZylhcmdzLT5mbl9hcmc7Cj4gPiAgICAgICAgICAgICAgIHAt
PnRocmVhZC5yYSA9ICh1bnNpZ25lZCBsb25nKXJldF9mcm9tX2Zvcmtfa2VybmVsX2FzbTsKPiA+
ICsKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICogVXNlciB3b3JrZXJz
IChpb191cmluZyBpby13cS9TUVBPTEwsIHZob3N0KSBzaGFyZSB0aGUgcGFyZW50J3MgbW0KPiA+
ICsgICAgICAgICAgICAgICogYnV0IG5ldmVyIHJldHVybiB0byB1c2Vyc3BhY2UuIERvbid0IGlu
aGVyaXQgdGhlIHBhcmVudCdzIHNoYWRvdwo+ID4gKyAgICAgICAgICAgICAgKiBzdGFjayBib29r
a2VlcGluZywgb3RoZXJ3aXNlIHNoc3RrX3JlbGVhc2UoKSBvbiB0aGVpciBleGl0IHdvdWxkCj4g
PiArICAgICAgICAgICAgICAqIHZtX211bm1hcCgpIHRoZSBwYXJlbnQncyBsaXZlIHNoYWRvdyBz
dGFjay4KPiA+ICsgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgIHNldF9zaHN0a19i
YXNlKHAsIDAsIDApOwo+ID4gKyAgICAgICAgICAgICBzZXRfYWN0aXZlX3Noc3RrKHAsIDApOwo+
ID4gICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgLyogYWxsb2NhdGUgbmV3IHNoYWRv
dyBzdGFjayBpZiBuZWVkZWQuIEluIGNhc2Ugb2YgQ0xPTkVfVk0gd2UgaGF2ZSB0byAqLwo+ID4g
ICAgICAgICAgICAgICBzc3AgPSBzaHN0a19hbGxvY190aHJlYWRfc3RhY2socCwgYXJncyk7Cj4g
PiAtLQo+ID4gMi40My43Cj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
