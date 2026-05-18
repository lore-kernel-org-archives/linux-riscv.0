Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF9DCD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 04:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGFsmBDvUBuglMiBSEo5lc5DDZagfWLgA1BQFjNJ9jo=; b=L72Uc4mzR25RKN
	mm2RhkDzXQ82aveLpXxhaEvjPY/G3yFPTsCKUG5xBzbcgNjFNTXoBv7r2mudeyKwJShlKPABdINN0
	EYIqH7Ad4KNG4fTDHz0mcEvEk78LMhPNF6ODuX+OOrQZHOnEL7p9M+vCyGXlGnRmeWYwx70tAC0Oq
	c4iifHzQfYc+fG8odCId/CaXkYct7wq+woqkqbHXfxPpvMQP342aXhI99zbX8AxLpZ6hj8Sddm4OG
	w7PZfHOHv0TX74tmlsbbs1E5TqupWcLU7m/QHQgom9HnWH7DIUb9nXnhjkQt1cwfX57wBC0ur8xra
	mvZCjsEP6Ln4TWG5kQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpdn-0000000EAQN-2k5B;
	Mon, 18 May 2026 04:31:43 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpdk-0000000EAPA-45pZ
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 04:31:42 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-69498319ee7so846765eaf.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 21:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779078700; cv=none;
        d=google.com; s=arc-20240605;
        b=bKPp1BiIa6OIcFaifvyUzl3t++yWAw4pVevqfW48SmiCQ1RfPV60ElSax2pMB78v8q
         yfRTDvPnTRCCDBpub0CzF+zeduwVBGCHkS/3fyvd6Vsq7U+HCSWizU8E5nBAJaW/lrzX
         9r/+zdYfJhAP3lwjHXABw+0yFR91i06jLwOyREyi59q9uhjqgJtwxv+m7Dyt329EV31f
         zh4N7K479iTNIZKgCKyaLMaebdoV7cGRqopU0arD4RWzMDb1wvWzgZ+9AmGsF/Eu1AUY
         f+v5Q4mJZugQXJFlRwokZNMy/ufa7HEA17UyvsDGWs+xx/D3P8noudTv5z/40pqR1cA6
         MASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJx3vYf89AmEPHzQLSho6/Q8/zMEPeXT+dUHRoNgkVk=;
        fh=qSw7J9xN0m1+qhjsWU1Q/jmGepYxYi3oCO6I6TbfutM=;
        b=SuN2YBM+CS6cyx4U2a76+yXpB4Yci0/V8T5CdWiyqOmrwZmmOvtOGASiriP///v+8b
         eZ4cZMFo42Av/7bj9XbvVvltxHWXc6ki+sYvtpTYM5ILJei0s0EgmFAd/2HAFKufDRV6
         XwwafJkdhaEQtf230p5Z+pirG42R7RV7BmY0A2EVHmRuT89AUJwqcRAGXeCTlisXXmL8
         HdzcG/3B7IU02LKZTKNPOnbVxM41itezaq+UerE9Txk9OZWWisCzEH+AvsCoJA7G0brV
         +V9Q18/843x1ut7R1m+3lfVI8EGkFb8+tomyfYep00xUs3EmL1ekg1ZeXsqqra+uFOlS
         QoAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779078700; x=1779683500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJx3vYf89AmEPHzQLSho6/Q8/zMEPeXT+dUHRoNgkVk=;
        b=cqaoxWIFcUgpG9qrWCP99UTAbBNSRRJGTbwz9X3aHG+BxJOwd1n6OpMRWwzyJ+cODP
         RenD0bj996DR0Y96NtdfkB4lBw8f3QxRqqev5fo3NG4vlWyib6MaSJKoSxTgBTg9yp9m
         DpNk130NRSuTdZAjvkh8aLw/mhOxm1+ZR0UubxOm2LHRbMHBTBnyZwl7DAGbF+MWb8rd
         Xvj11iJsC7MY8UtmQEqqCYKD3LOQ3DX2X5/Lf+Uguj3tcJxCPpW8latP3KISe/FEpbKi
         WiJv24XYITypLWM1UMMi7GFXqwIE0QgQEjvVeYOuhJ68Kiz+82lgNnZt3orkR2oKCgGr
         72wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779078700; x=1779683500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GJx3vYf89AmEPHzQLSho6/Q8/zMEPeXT+dUHRoNgkVk=;
        b=JZBWjD/oh7WZHfOTPwVZRl65xfzcVS9uT+/PKryt3C4TaLTr7ZFrrdrhpJa1Ln0ab0
         mbteHALpNS/eevn9glu7kJmMEyMBtCYWHmxjEI8aKhOv0kx/wwvVd2Fyb4WZTY+DN2qq
         h+d4iolRB+dMn/wE1jNiF6WLP2UNbwbEcJnmzdBO2uiD6F0fx9sy31xVwaVr2kDaY1b3
         oqXmS7rTidZvDgHzNcEzbp3y+gh/fFa79wTGw0Y5pclPFu69z8e7w3taNfJ5ES9M07HQ
         G5HrDKvjjhRn/Hupi9hQnjUrWpYIUGMYjFZkSXSqghmyspRsU6deLf51q+dYiPk48uG/
         V0og==
X-Forwarded-Encrypted: i=1; AFNElJ9YurkTiaeb+7FH+ThefN3xgQ6fFmjVaIXasLR+7fucSrx8qmce4Z2OckVuiCTQi3w05D7pcBeBoifqrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Apb10EzpfAMxdrLDUiRdx4Tb0v1QWox9/z1WlPPpMZ0y0UP2
	0YRP9dNJ3uldZGq47+UYibyjuPhbiGDDLKK9POKXfqrNoqi99UPRf7elBOMeI+mRVxNfEX2xh23
	8PN++DKrEPcMAmAppJtn8XJUbtfWN1PQKrtgys4z/CA==
X-Gm-Gg: Acq92OHsPk6XhHcH6xL/wd2BFtSMeok1aMW8Tg5ZMPnBZkl7JN9sBZL2wtg+nG9o8Fb
	Un/s7xirNFfrH3X080Xpx9N+ZdRSS4Rrgx631Q9GsYz7Fop3gFthy/A5Yw1eUibZftO7JFw0BcK
	DP2vLorG6VUgmZamj2l9um9AMF3c3Ge6tnijh8Dq518B5l4cE+szNHcrdByYXJWThjecNxz2884
	Xf/m8d0bqF/zbckgm8XCUCnabvOo8yGK/bGYq7J0OXO+CZSlwSvMsWaFOhuDfstmmKu7YgNGoCw
	vNJl+Iby7Ds3UlSHYY2oHF/FdSjdUe1XKbQFzLS5tUIoNl5OdZ5caEaO3a4rG8tZD8P7fL2s59r
	Dx9Sf1TwKDoR4rAn+lskJm0jUKg==
X-Received: by 2002:a05:6820:1c02:b0:69b:85ba:bd4f with SMTP id
 006d021491bc7-69b884ac83amr8443261eaf.33.1779078699723; Sun, 17 May 2026
 21:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260514081752.472987-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260514081752.472987-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 May 2026 10:01:28 +0530
X-Gm-Features: AVHnY4KrYwepB5OiXTY2dv7ZHi-ani2vKZrt4RfWbnSXlOx_ga651Ne910vtQ3U
Message-ID: <CAAhSdy2z_2OUyzA_MK+V6z_5ucwKN6A6f4j6hNaVH7c904SBQw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix sign extension for MMIO loads
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_213141_272824_68C56D2A 
X-CRM114-Status: GOOD (  20.55  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTo0N+KAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBrdm1fcmlzY3ZfdmNwdV9tbWlvX3JldHVybigp
IGZ1bmN0aW9uIGhhbmRsZXMgTU1JTyByZWFkIHJlc3VsdHMKPiBieSB3cml0aW5nIHRoZSBkYXRh
IGJhY2sgdG8gdGhlIGd1ZXN0IHJlZ2lzdGVyLiBGb3Igc2lnbmVkIGxvYWQKPiBpbnN0cnVjdGlv
bnMgKExCLCBMSCwgTFcgb24gUlY2NCksIHRoZSB2YWx1ZSBuZWVkcyBzaWduLWV4dGVuc2lvbgo+
IGZyb20gYSBzbWFsbGVyIGludGVnZXIgdG8gdW5zaWduZWQgbG9uZy4KPgo+IFRoZSBjdXJyZW50
IGNvZGUgdXNlczoKPiAgICAgKHVsb25nKWRhdGEgPDwgc2hpZnQgPj4gc2hpZnQKPiBidXQgKHVs
b25nKSBtYWtlcyB0aGUgcmlnaHQgc2hpZnQgYSBsb2dpY2FsIHNoaWZ0ICh6ZXJvLWV4dGVuZCkK
PiByYXRoZXIgdGhhbiBhbiBhcml0aG1ldGljIHNoaWZ0IChzaWduLWV4dGVuZCksIGNhdXNpbmcg
aW5jb3JyZWN0Cj4gcmVzdWx0cyB3aGVuIHRoZSBNTUlPIGRldmljZSByZXR1cm5zIGEgbmVnYXRp
dmUgdmFsdWUuIEZvciBleGFtcGxlLAo+IExCIHJlYWRpbmcgMHg4MCB3b3VsZCByZXR1cm4gMTI4
IGluc3RlYWQgb2YgLTEyOC4KPgo+IEZpeCB0aGlzIGJ5IGNhc3RpbmcgdG8gKGxvbmcpIGFmdGVy
IHRoZSBsZWZ0IHNoaWZ0IHNvIHRoYXQgdGhlCj4gc3Vic2VxdWVudCByaWdodCBzaGlmdCBpcyBh
cml0aG1ldGljIGFuZCBjb3JyZWN0bHkgcHJvcGFnYXRlcwo+IHRoZSBzaWduIGJpdDoKPiAgICAg
KGxvbmcpKCh1bG9uZylkYXRhIDw8IHNoaWZ0KSA+PiBzaGlmdAo+Cj4gQWRkaXRpb25hbGx5LCBy
ZW1vdmUgdGhlIHVubmVjZXNzYXJ5IHNoaWZ0IGFzc2lnbm1lbnQgZm9yIExCVQo+ICh1bnNpZ25l
ZCBieXRlIGxvYWQpIHNpbmNlIGl0IGRvZXMgbm90IG5lZWQgc2lnbiBleHRlbnNpb24uCj4gVGhp
cyBtYWtlcyBMQlUgY29uc2lzdGVudCB3aXRoIExIVSBhbmQgTFdVIHdoaWNoIGFscmVhZHkga2Vl
cAo+IHNoaWZ0ID0gMC4KPgo+IEZpeGVzOiBiOTFmMGU0Y2I4YTMgKCJSSVNDLVY6IEtWTTogRmFj
dG9yLW91dCBpbnN0cnVjdGlvbiBlbXVsYXRpb24gaW50byBzZXBhcmF0ZSBzb3VyY2VzIikKPiBT
aWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIwMjVAaXNjYXMuYWMuY24+Cj4gQXNzaXN0ZWQt
Ynk6IE9wZW5DbGF3OkRlZXBTZWVrLVYzLjIKCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGZpeCBmb3IgTGlu
dXgtNy4xLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2lu
c24uYyB8IDkgKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IGluZGV4IDRkODliOTQxMjhhZWEuLmYwOWY5
MjUxZDFmMGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IEBAIC00MTUsNyArNDE1LDYgQEAgaW50IGt2
bV9yaXNjdl92Y3B1X21taW9fbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
cnVuICpydW4sCj4gICAgICAgICAgICAgICAgIHNoaWZ0ID0gOCAqIChzaXplb2YodWxvbmcpIC0g
bGVuKTsKPiAgICAgICAgIH0gZWxzZSBpZiAoKGluc24gJiBJTlNOX01BU0tfTEJVKSA9PSBJTlNO
X01BVENIX0xCVSkgewo+ICAgICAgICAgICAgICAgICBsZW4gPSAxOwo+IC0gICAgICAgICAgICAg
ICBzaGlmdCA9IDggKiAoc2l6ZW9mKHVsb25nKSAtIGxlbik7Cj4gICNpZmRlZiBDT05GSUdfNjRC
SVQKPiAgICAgICAgIH0gZWxzZSBpZiAoKGluc24gJiBJTlNOX01BU0tfTEQpID09IElOU05fTUFU
Q0hfTEQpIHsKPiAgICAgICAgICAgICAgICAgbGVuID0gODsKPiBAQCAtNjQ5LDIyICs2NDgsMjIg
QEAgaW50IGt2bV9yaXNjdl92Y3B1X21taW9fcmV0dXJuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0IGt2bV9ydW4gKnJ1bikKPiAgICAgICAgIGNhc2UgMToKPiAgICAgICAgICAgICAgICAg
ZGF0YTggPSAqKCh1OCAqKXJ1bi0+bW1pby5kYXRhKTsKPiAgICAgICAgICAgICAgICAgU0VUX1JE
KGluc24sICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgKHVsb25nKWRhdGE4IDw8IHNoaWZ0ID4+IHNoaWZ0KTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAobG9uZykoKHVsb25nKWRhdGE4IDw8IHNoaWZ0KSA+PiBzaGlmdCk7Cj4gICAgICAgICAg
ICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSAyOgo+ICAgICAgICAgICAgICAgICBkYXRhMTYg
PSAqKCh1MTYgKilydW4tPm1taW8uZGF0YSk7Cj4gICAgICAgICAgICAgICAgIFNFVF9SRChpbnNu
LCAmdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICh1
bG9uZylkYXRhMTYgPDwgc2hpZnQgPj4gc2hpZnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IChsb25nKSgodWxvbmcpZGF0YTE2IDw8IHNoaWZ0KSA+PiBzaGlmdCk7Cj4gICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSA0Ogo+ICAgICAgICAgICAgICAgICBkYXRhMzIgPSAq
KCh1MzIgKilydW4tPm1taW8uZGF0YSk7Cj4gICAgICAgICAgICAgICAgIFNFVF9SRChpbnNuLCAm
dmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICh1bG9u
ZylkYXRhMzIgPDwgc2hpZnQgPj4gc2hpZnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIChs
b25nKSgodWxvbmcpZGF0YTMyIDw8IHNoaWZ0KSA+PiBzaGlmdCk7Cj4gICAgICAgICAgICAgICAg
IGJyZWFrOwo+ICAgICAgICAgY2FzZSA4Ogo+ICAgICAgICAgICAgICAgICBkYXRhNjQgPSAqKCh1
NjQgKilydW4tPm1taW8uZGF0YSk7Cj4gICAgICAgICAgICAgICAgIFNFVF9SRChpbnNuLCAmdmNw
dS0+YXJjaC5ndWVzdF9jb250ZXh0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICh1bG9uZylk
YXRhNjQgPDwgc2hpZnQgPj4gc2hpZnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIChsb25n
KSgodWxvbmcpZGF0YTY0IDw8IHNoaWZ0KSA+PiBzaGlmdCk7Cj4gICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RT
VVBQOwo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
