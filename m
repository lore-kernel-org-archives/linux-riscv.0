Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7920EE9D831
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 04:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BiB7bvY4lbRnkYsUhF1/f6tS35RkiO5YxBnItuBPI4=; b=x3ahSKztyLCbgK
	kw86qexTNPSWqvmUrmNFRPMpsvpAAYZy+M3eXfb2BIWx/+nYP6CZEYe7rBs2wHregs6SNHd6ZzmRb
	PrGwWKIrZY6IUD/OWb7HuSrzxtap331DL7L8uyRkRWPERsTFodn3naC/SnqF8voKVOYZQ037NbBKZ
	VC/f5qwWrgeooXAL3oPFbG+P63MAU/3pYceU49mXKkZgqRixH/oVWb3oVVlT4ZHXJR/tNBxoNsLSu
	oRumcQp+BehpEij3aEqLew7Yjfi+SBfz/4h4zOccn03M755v13VgC3uOROUL9O6DiZ1lagHnpKlh/
	VOgTDcO5cL75SEec0/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9bXV-00000004lTI-1apu;
	Mon, 06 Apr 2026 04:26:17 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9bXQ-00000004lRY-1DpT
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 04:26:15 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6825009f4f5so973241eaf.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 21:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775449570; cv=none;
        d=google.com; s=arc-20240605;
        b=XWU8xTVl5WXLggUPGTjnVSLagsv1DP5YZS0fbrHEprSf1JoQMMnfdih9nem87rgxJx
         U+ylPxdPIl+ERoLlLdzzXOCOw8nCuf3dDA3x8kprbz0+1RBngVfpwwUASi5QJ2lPDdxV
         WXU3HHZ6Gpg6rlZ/Xb5y6LleiCtK3pT9RaXgQ7k0iQZpA6G8DAqUT0SC3s1+bQVJR4Bv
         pJSy4Ao5S673fUApAKScErKzDNH/5fEgzgs8YIQNRXZkYynlgmddnKslJAn8/BbH3FoF
         0FT12dVsEyWdPUEJlYJLQ5dNbOqIMcoW+dNqSKFdg2AlW3W4Jvz6FBNgWV/zlCMMb3rz
         D+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2Eqcpz26fbgpoHxUOQO5t6bHgkVihQ+ivm0vWcl2To=;
        fh=byEb/VCQ28MmZkNPNOtxQ5XognDXWils5yn6Gk+Pj+k=;
        b=UeZBf00hO2grYILX7jdPtwChzwVQOiIeBoN0nfH8mpV6HAkVv0hWs/wasqz/xIO+3F
         t+tXpfGni1BkGEE3v3s0cK7SNq2K3Lu2CCkNAqRD/viGpyjWvWH4BUpwu6sCUT7m7kZ0
         A/DT22+hSEwZqZtjKavYYxMoLwW3q660wyK3YfqyzzjwUNRTMdJ208y7nPTDRAC6/aZH
         4OcEUa3Hik20ySw433EN6nsOWeX9fRNM1JuxT6ndgtDbVtpoMT7HtKXrm3qMHKgaXhMX
         a4mc7MPjiH6aSUEd543jimZAnSrQWuZvW2z6Be2TNqZlol1KNOJL3CKD/+LzLnFVzYLy
         D5ag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775449570; x=1776054370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2Eqcpz26fbgpoHxUOQO5t6bHgkVihQ+ivm0vWcl2To=;
        b=hsBhM+XuPwDwoSyiKl2v2+dB/lSeotSJB5pja7iEOpT8ipeEezbKwLiFZS5iqmtMom
         8LES5mGpKI21PxYM8ntuxnnSbTj1/8y9X75LgToldLSMAeXhYfNCCul5ZkohzHkm3QMC
         vkYZ7n66Q6YZYRV621cSju0kVx5g2otlZmXDuQ3k2T+Y7SjKek9Uw3VeL5VzcSFO5XRe
         8g5KE1q0mR2Lsx3yZMKwlc33+RvCdT+a+0Yk38decmeb0spGtvgxGQMdcRRVB7NSHm3p
         r2fU1D1oKegSw1YE2U0ZN3iOihAs+mSHLe9XYhzK9WyMwhOSZniQ/pC6Reo0y6ylKSYv
         lC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775449570; x=1776054370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2Eqcpz26fbgpoHxUOQO5t6bHgkVihQ+ivm0vWcl2To=;
        b=Qjj//EY74L95pfLw2DSBTCkLOqijX0xhpJyHFycUA5/OMaRNtyor/3T/M71H6mwLmh
         Rn1NbE9NZHi5BURM1JZRBubHVeF7CeOB47iggoBm0ngoIQp/SX/sR4wycuIcFFv33/c8
         iwAp8FkBXFYiqGbImqBbkK5V2UkPYb4ZB3bCVlHC2scar9Wj9V/AfN/X0BYcnlYdXpTT
         ZX9E922vwjOoCP/74wAUl0TgF7MPevc3S1+hp7to0lfHbuXbM+k8u3d+rhq2oIkBngPc
         pB5dyZiLYENknTeV1QUxYLRyBDhLl1xtSMBF8JHNg+LE3njdbhOVbgBXWj0JA1aUOoEY
         VfnA==
X-Forwarded-Encrypted: i=1; AJvYcCWrhlC9edDNLIaKidXhUctfJuAuQ1wYiOWax/lfaOi+D94KR2AzUQcwnsRCSYXz8EvWsGS41u1kCZE9xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YypvZFDTAhn7lrAr5Lt384PRWXCKgZTePjjBDokTk0T3KTQ9vk0
	jMrnImR873906eseY8TJR9fN0mCzU7HNkAeExVjFdSrJoLrVL3WI1CZTZwbzRPlBqvWQ27xzu7f
	5V1pSml8RHBOVevf32muG1LulajSB1y4Y2AXR+/niHg==
X-Gm-Gg: AeBDievg/ZFVGyziSoZG42wn6f/9QPPMq2xLNcPhC6qVEul26OmP1P3vr6DhIfZqZUp
	Wp417AAjOmhwA7ACRyejQJ/sprj+KEjDiiBmRE4+WC5fUUjAwIuluNdaI9nipQWXOlLbjC6BU/x
	beTTjNCnYnKdbOPfLORMwG9nD2Al2bFsoeyGWnb84/WoRA9i8hrL4piTOrSfu1V7jEum7jDd/i9
	rmB+owKW0XI3B3FRxe92tqAuf6gUeBb6OwEzv5yIX1plylS/Zd+gVg1BkX5khTA+6UPStNvYBi4
	Emn9XX9bP1OB5AJXQUHn/s2RKqWTzOZMNboGP7xzJkPragLU3bPt9Nqaz2pswyo2tYR7z4HmC2P
	8suyQqxiK/4TLJzgp3yfApp8wFw==
X-Received: by 2002:a05:6820:169f:b0:67e:1063:37ff with SMTP id
 006d021491bc7-68220b4a1e7mr5624387eaf.36.1775449570255; Sun, 05 Apr 2026
 21:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Apr 2026 09:55:59 +0530
X-Gm-Features: AQROBzDGT78x3zHvCoTNFnS1VnkRVlKe4WFUmhyAI0q8NrLRsHtw1tX_S_VT1YI
Message-ID: <CAAhSdy353CV6FYe7BzVFvvo6drhY5hHGcv4HnJDYo+3bfB4n5Q@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix shift-out-of-bounds in make_xfence_request()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_212612_588100_BBA93634 
X-CRM114-Status: GOOD (  18.33  )
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

T24gU2F0LCBBcHIgNCwgMjAyNiBhdCA0OjUw4oCvQU0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIG1ha2VfeGZlbmNlX3JlcXVlc3QoKSBmdW5jdGlv
biB1c2VzIGEgc2hpZnQgb3BlcmF0aW9uIHRvIGNoZWNrIGlmIGEKPiB2Q1BVIGlzIGluIHRoZSBo
YXJ0IG1hc2s6Cj4KPiAgIGlmICghKGhtYXNrICYgKDFVTCA8PCAodmNwdS0+dmNwdV9pZCAtIGhi
YXNlKSkpKQo+Cj4gSG93ZXZlciwgd2hlbiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHZjcHVfaWQg
YW5kIGhiYXNlCj4gaXMgPj0gQklUU19QRVJfTE9ORywgdGhlIHNoaWZ0IG9wZXJhdGlvbiBjYXVz
ZXMgdW5kZWZpbmVkIGJlaGF2aW9yLgo+Cj4gVGhpcyB3YXMgZGV0ZWN0ZWQgYnkgVUJTQU46Cj4g
ICBVQlNBTjogc2hpZnQtb3V0LW9mLWJvdW5kcyBpbiBhcmNoL3Jpc2N2L2t2bS90bGIuYzozNDM6
MjMKPiAgIHNoaWZ0IGV4cG9uZW50IDI1NiBpcyB0b28gbGFyZ2UgZm9yIDY0LWJpdCB0eXBlICds
b25nIHVuc2lnbmVkIGludCcKPgo+IEZpeCB0aGlzIGJ5IGFkZGluZyBhIGJvdW5kcyBjaGVjayBi
ZWZvcmUgdGhlIHNoaWZ0IG9wZXJhdGlvbi4KPgo+IFRoaXMgYnVnIHdhcyBmb3VuZCBieSBmdXp6
aW5nIHRoZSBLVk0gUklTQy1WIGludGVyZmFjZS4KPgo+IEZpeGVzOiAxM2FjZmVjMmRiY2MgKCJS
SVNDLVY6IEtWTTogQWRkIHJlbW90ZSBIRkVOQ0UgZnVuY3Rpb25zIGJhc2VkIG9uIFZDUFUgcmVx
dWVzdHMiKQo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8amlha2FpUGVhbnV0QGdtYWlsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5hYy5jbj4K
ClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjEKClRoYW5rcywKQW51cAoKPiAtLS0KPiBW
MSAtPiBWMjoKPiAtIERyb3BwZWQgJ2lkeCcgdmFyaWFibGUgYW5kIGNvbXBhcmVkIHZjcHVfaWQg
YWdhaW5zdCBoYmFzZSBkaXJlY3RseSwKPiAgIGFzIHN1Z2dlc3RlZCBieSBBbmRyZXcgSm9uZXMu
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3RsYi5jIGIvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiBpbmRleCBmZjFhZWFjNGViOGVi
Li40MzljMjBjMjc3NWFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3RsYi5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiBAQCAtMzM4LDcgKzMzOCw4IEBAIHN0YXRpYyB2b2lk
IG1ha2VfeGZlbmNlX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgYml0bWFwX3pl
cm8odmNwdV9tYXNrLCBLVk1fTUFYX1ZDUFVTKTsKPiAgICAgICAgIGt2bV9mb3JfZWFjaF92Y3B1
KGksIHZjcHUsIGt2bSkgewo+ICAgICAgICAgICAgICAgICBpZiAoaGJhc2UgIT0gLTFVTCkgewo+
IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICh2Y3B1LT52Y3B1X2lkIDwgaGJhc2UpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHZjcHUtPnZjcHVfaWQgPCBoYmFzZSB8fAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdmNwdS0+dmNwdV9pZCA+PSBoYmFzZSArIEJJVFNf
UEVSX0xPTkcpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIShobWFzayAmICgxVUwgPDwgKHZjcHUtPnZjcHVf
aWQgLSBoYmFzZSkpKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
