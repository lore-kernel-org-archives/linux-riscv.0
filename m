Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA557EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 05:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5whd0dEyMYiTm48wUUEwXcv8ATPbtBtYdPFE7F9Uko=; b=4wXcMrHjgw1Hac
	QpbgbDbIGwGp3Tkkn5BvZMwvThxS3Q/QxAzDRFqkiEEh9FFVBJiy8EOnf1jafZr8CZ/IAAiYI+nlh
	Ua8RkYuXhHDsXY5oA9B1ldoElmRSb2k8CV+OPkb6AtVOtdnnDI5Zeoc/vF+aCQzfcnc5uzTz3yDBU
	T+Vvvjue5AI6mFJZtc4zzMDt0qdVCKExAQAfLDaofhOyugeEWCEJAQ6fH8kiP/v5FaLrgMlBqzlZz
	WaWEvqta99/yE14ARei3iq435hSJQyn28nJymKpUfArxjr4GGccZgNVcSXzNPkR9xYu0HIQ9VyXSL
	IUN2cbSjwBx2tQrfMLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLGPo-002KII-23;
	Mon, 17 Jul 2023 05:04:56 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLGPl-002KFg-26
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 05:04:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-263253063f9so2890351a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 22:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689570292; x=1692162292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNYeV3LGJNDSjU9rdyxRY+kYnsL8oTpzciBaAdsXjdw=;
        b=pFVcZKLHHSwYguk1P8Z8buW6liFYqiBFAfnxThWwQEwsHbaT8LgTuKCtNtZZahMwtZ
         v2pGwXXr279uep/RwINe1yy0PZs6T802JwxpDAxffwb8lTJo1yMKrL9PBZ5J03FY95CR
         EO15JvfPlnoz0pmtYRqvGvdMi7j/9ZOPof8ew+B6b7KOAkTPvMR0IkzZV4jLfEVgiRXy
         EUvGml3Nsscs8Nk+cb7/G7BijJuMi+JW9Pny8vPSnFwqPta6oyyFpHCbYNZxr0P90IgD
         AnRorZ0BFonzaR9x867Ych8Hw8OHCRxCoVTVd4rVQIMA/Ks6SlJkcG0Gtr+0p7aFyk6Y
         9/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689570292; x=1692162292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNYeV3LGJNDSjU9rdyxRY+kYnsL8oTpzciBaAdsXjdw=;
        b=Q6jNrSJZpCKYzpB2fRAu+qR8QZat8DzBWi5UC9b/B0GrtpWvnCwjWPRsi3l6UPzEeY
         1KWxD/mqI5jb9x7V8JlHpKvPbvmePfwP0iEDlPnT8IB8TgpSPCZ7qQgk5r9abgT/LFau
         yYhCEkSugxFlBammD48+mQYJfcz8XIRglzxi2dsQtRbDF2C3qxpyDyZUhJN8s2gFxbMp
         XyW+2VFEEb6w0bhVpvnEr9R4jp1XEMLGvoZL4CAzNv04YHXv0tl6fpOHIuwf/hYzCkaI
         wLOOLq0tTpz1JPcUPaG47zi1M7J20X0IsJX0ez2NxiBcpT2PbZ/72rgKqpK+fPVxNJzF
         TXuw==
X-Gm-Message-State: ABy/qLZfpY0bZY3IbKnI9p7OBmoM1nF9ZXrQq7u0nEwpl74LFLUDaITb
	uQFAfwco694/Kb6i1x6p4f4mu2Riaa1CKwiCCzNW9A==
X-Google-Smtp-Source: APBJJlHblKksdgvAv0N83Z/xC4BvMT4Q7gyebPtrATeDzpArpZorrhwxdo3OYkO5C+L0q4QbzcrVAwRIUVdEpj7E+Vk=
X-Received: by 2002:a17:90a:4f81:b0:262:ece1:5fd9 with SMTP id
 q1-20020a17090a4f8100b00262ece15fd9mr10283082pjh.10.1689570291971; Sun, 16
 Jul 2023 22:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
 <20230710094321.1378351-2-apatel@ventanamicro.com> <20230711-3151a76400deb88b218e9f9b@orel>
In-Reply-To: <20230711-3151a76400deb88b218e9f9b@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 17 Jul 2023 10:34:40 +0530
Message-ID: <CAK9=C2XABXWauDNJwK21eJQsknbb2CNUHkuTsgVmgSVgChnVTg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] RISC-V: Add riscv_fw_parent_hartid() function
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_220453_718547_941C845A 
X-CRM114-Status: GOOD (  24.84  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgNjo1NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMDM6MTM6
MTNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFdlIGFkZCBjb21tb24gcmlzY3ZfZndf
cGFyZW50X2hhcnRpZCgpIHdoaWNoIGhlbHAgZGV2aWNlIGRyaXZlcnMKPiA+IHRvIGdldCBwYXJl
bnQgaGFydGlkIG9mIHRoZSBJTlRDIChpLmUuIGxvY2FsIGludGVycnVwdCBjb250cm9sbGVyKQo+
ID4gZndub2RlLiBUaGlzIHNob3VsZCB3b3JrIGZvciBib3RoIERUIGFuZCBBQ1BJLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4g
LS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICAzICsrKwo+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysr
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiBpbmRleCBjOTUwYThkOWVkZWYuLjM5ZGMyM2ExOGY4OCAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+IEBAIC04MSw2ICs4MSw5
IEBAIGludCByaXNjdl9vZl9wcm9jZXNzb3JfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSwgdW5zaWduZWQgbG9uZyAqaGFydGlkKTsKPiA+ICBpbnQgcmlzY3ZfZWFybHlfb2ZfcHJvY2Vz
c29yX2hhcnRpZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHVuc2lnbmVkIGxvbmcgKmhhcnRp
ZCk7Cj4gPiAgaW50IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpu
b2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpOwo+ID4KPiA+ICtzdHJ1Y3QgZndub2RlX2hhbmRs
ZTsKPiA+ICtpbnQgcmlzY3ZfZndfcGFyZW50X2hhcnRpZChzdHJ1Y3QgZndub2RlX2hhbmRsZSAq
bm9kZSwgdW5zaWduZWQgbG9uZyAqaGFydGlkKTsKPiA+ICsKPiA+ICBleHRlcm4gdm9pZCByaXNj
dl9maWxsX2h3Y2FwKHZvaWQpOwo+ID4gIGV4dGVybiBpbnQgYXJjaF9kdXBfdGFza19zdHJ1Y3Qo
c3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAqc3JjKTsKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHUuYwo+ID4gaW5kZXggYTJmYzk1MjMxOGU5Li45YmU5YjNiMWYzMzMgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1LmMKPiA+IEBAIC05Niw2ICs5NiwyMiBAQCBpbnQgcmlzY3Zfb2ZfcGFyZW50X2hhcnRpZChz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHVuc2lnbmVkIGxvbmcgKmhhcnRpZCkKPiA+ICAgICAg
IHJldHVybiAtMTsKPiA+ICB9Cj4gPgo+ID4gKy8qIEZpbmQgaGFydCBJRCBvZiB0aGUgQ1BVIGZ3
bm9kZSB1bmRlciB3aGljaCBnaXZlbiBmd25vZGUgZmFsbHMuICovCj4KPiBUaGlzIGNvbW1lbnQg
bWF0Y2hlcyB0aGUgY29tbWVudCBmb3IgcmlzY3Zfb2ZfcGFyZW50X2hhcnRpZCgpLCBidXQgSSBk
b24ndAo+IHRoaW5rIGl0IHdpbGwgYmUgY29ycmVjdCBmb3IgdGhlICFpc19vZl9ub2RlKG5vZGUp
IGNhc2Ugc2luY2UKPiBmd25vZGVfcHJvcGVydHlfcmVhZF91NjRfYXJyYXkoKSBpc24ndCBvYmxp
Z2VkIHRvIHdhbGsgdXAgaXRzIHRyZWUuCj4gTG9va2luZyBhaGVhZCBpdCBhcHBlYXJzIHJpc2N2
X2Z3X3BhcmVudF9oYXJ0aWQoKSBpcyBvbmx5IGNhbGxlZCB3aXRoIHRoZQo+IHBhcmVudCBub2Rl
LCBzbyB3ZSBjb3VsZCBqdXN0IGRyb3AgdGhpcyBmdW5jdGlvbiBhbmQgdXNlCj4gZndub2RlX3By
b3BlcnR5X3JlYWRfdTY0X2FycmF5KCkgZGlyZWN0bHkgYXQgdGhlIHR3byBjYWxsIHNpdGVzLgoK
SSB0aGluayB0aGUgZnVuY3Rpb24gbmFtZSByaXNjdl9md19wYXJlbnRfaGFydGlkKCkgaXMgbWlz
bGVhZGluZy4gSXQgc2hvdWxkCmJlIHJpc2N2X2dldF9pbnRjX2hhcnRpZCgpIGJlY2F1c2UgaXQg
aXMgcmV0cmlldmluZyBoYXJ0aWQgYmFzZWQgb24gSU5UQwpmd25vZGUuCgpDdXJyZW50bHksIHRo
aXMgZnVuY3Rpb24gaXMgdXNlZCBpbiBBUExJQyBhbmQgSU1TSUMgZHJpdmVycyBidXQgc29vbiBp
dAp3aWxsIGJlIGFsc28gdXNlZCBpbiBQTElDIGRyaXZlciB3aXRoIHRoZSB1cGNvbWluZyBQTElD
IEFDUEkgc3VwcG9ydC4KCkluIGZhY3QsIHRoaXMgcGF0Y2ggc2hvdWxkIGFsc28gcmVwbGFjZSBy
aXNjdl9vZl9wYXJlbnRfaGFydGlkKCkgd2l0aApyaXNjdl9nZXRfaW50Y19oYXJ0aWQoKSBpbiBJ
TlRDIGFuZCBQTElDLgoKUmVnYXJkcywKQW51cAoKPgo+IFRoYW5rcywKPiBkcmV3Cj4KPiA+ICtp
bnQgcmlzY3ZfZndfcGFyZW50X2hhcnRpZChzdHJ1Y3QgZndub2RlX2hhbmRsZSAqbm9kZSwgdW5z
aWduZWQgbG9uZyAqaGFydGlkKQo+ID4gK3sKPiA+ICsgICAgIGludCByYzsKPiA+ICsgICAgIHU2
NCB0ZW1wOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFpc19vZl9ub2RlKG5vZGUpKSB7Cj4gPiArICAg
ICAgICAgICAgIHJjID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTY0X2FycmF5KG5vZGUsICJoYXJ0
aWQiLCAmdGVtcCwgMSk7Cj4gPiArICAgICAgICAgICAgIGlmICghcmMpCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgKmhhcnRpZCA9IHRlbXA7Cj4gPiArICAgICB9IGVsc2UKPiA+ICsgICAgICAg
ICAgICAgcmMgPSByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHRvX29mX25vZGUobm9kZSksIGhhcnRp
ZCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gcmM7Cj4gPiArfQo+ID4gKwo+ID4gIERFRklORV9Q
RVJfQ1BVKHN0cnVjdCByaXNjdl9jcHVpbmZvLCByaXNjdl9jcHVpbmZvKTsKPiA+Cj4gPiAgdW5z
aWduZWQgbG9uZyByaXNjdl9jYWNoZWRfbXZlbmRvcmlkKHVuc2lnbmVkIGludCBjcHVfaWQpCj4g
PiAtLQo+ID4gMi4zNC4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
