Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF0DC46CCD
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 01:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hifMisdbjrtTYF9lE9esJUxNS+ZX/Wx7a1h8+JIQbw=; b=uxESN4DkNcri0V
	DIKdsQqG7dv0aV87v8ZL6EMKUmpsa+E0Q6zu48fG3t9aLIHXA6L3xVU5LrLjeMnMYmQ2t982vsoHG
	r+IUbnBnm0O1Z6V7kH6DCaDEs2jnlrh44GwWot3tWMHlgKAloWXZPBybEndb/gr0drpR7OFCbtKyq
	v2u8uYOHgy7MN3Z5KEX0dDdpXmmKvuYYqGr1c+hc+crx4n7zfGDKQD7WDy3noP5nnqoWaLX/ErkSp
	eVH7a3G2YspJ/kP1yVd0PDzHDBuDNypQGF5R0NUL1EC84SLGO7cgD5OzcAbL9NtPPIujOZy4LaXOU
	ebWR/gQ3IyAAvnqFERAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFPEu-00CWka-1l;
	Tue, 19 Dec 2023 01:49:44 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFPEq-00CWjx-1w
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 01:49:42 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50e0d1f9fe6so4792428e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 17:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1702950579; x=1703555379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXupCfZjlayUGqvnZ/pHvI3Hd0Fi7PKTAe8bvJZrq+g=;
        b=lP889ewDOGfK89mxeIs+6fLxVi4n7ScXUAhwGMsoerGyCkoIsICcyobiV7KZxtu3GU
         HTD/PHTFlNLZyxEWJ4HeoBkAWNAF4jyuHfpt8VDj+SmwEALTO/D+0vwKAVMXRnkMzMkD
         /ryHiioK8X/P8QmH39p44g1sQSbZom0A36sZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702950579; x=1703555379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXupCfZjlayUGqvnZ/pHvI3Hd0Fi7PKTAe8bvJZrq+g=;
        b=iKGCdqTUqFHq2IIkHKtHauf0sRMESot1UiGaba14dwXkZLxgag7dOQyPC3YMevdL7E
         nxCz/QCXiA511+vqfZIrbP7Clf83WinltfpJHfwS2UpJAB3b8QtKpcajsyZwsVdELePf
         LLoqB7ZmgVv/8uvetLQJ75sEsyrXwIUV5YIMhSQ2r29y6GkdGuc8pAC33dtKOtG9RlzE
         ReKA7TPORWVd8EjOwmQdZ5C8S7kLpMZTD0N3AwqBLSDTGaRBy2VuLYP/7/lxEqa03qhv
         9LYGAFmxPqExy+BG6WCIsKOv6EBYXMzDQbjZFpDVvqViHCAu4cAhfZHEAHzYhm1OM7B6
         94EA==
X-Gm-Message-State: AOJu0Yzs66K/eNF9MOuFXI05xEoyQhcNhcMuxti8Q95w4v5jT1r2Rt+J
	D7/RbVb8aZ6GDghjgx+A7qdDW+2P0PQsLy5AYi/eXmJIxvUxktI=
X-Google-Smtp-Source: AGHT+IFv/S++K/NorCWyXa4ngqbfiuzNecqNa+IousyaO9WQD3cwMU0REyzIMxqLFKI8EuOug0JRkdHZexu+dE5RMWw=
X-Received: by 2002:ac2:4e0f:0:b0:50e:1eae:a980 with SMTP id
 e15-20020ac24e0f000000b0050e1eaea980mr3172901lfr.118.1702950579045; Mon, 18
 Dec 2023 17:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20231217204019.36492-15-ajones@ventanamicro.com> <20231217204019.36492-21-ajones@ventanamicro.com>
In-Reply-To: <20231217204019.36492-21-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 18 Dec 2023 17:49:27 -0800
Message-ID: <CAOnJCU+6MBadxbry5TeoWxYXDrCQRqSdqMNgQxFYzZXjM-=YRg@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_174941_040366_835CD079 
X-CRM114-Status: GOOD (  20.17  )
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

T24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEtWTSdzIGltcGxlbWVudGF0aW9uIG9mIFNCSSBT
VEEgbmVlZHMgdG8gdHJhY2sgdGhlIGFkZHJlc3Mgb2YgZWFjaAo+IFZDUFUncyBzdGVhbC10aW1l
IHNoYXJlZCBtZW1vcnkgcmVnaW9uIGFzIHdlbGwgYXMgdGhlIGFtb3VudCBvZgo+IHN0b2xlbiB0
aW1lLiBBZGQgYSBzdHJ1Y3R1cmUgdG8gdmNwdV9hcmNoIHRvIGNvbnRhaW4gdGhpcyBzdGF0ZQo+
IGFuZCBtYWtlIHN1cmUgdGhhdCB0aGUgYWRkcmVzcyBpcyBhbHdheXMgc2V0IHRvIElOVkFMSURf
R1BBIG9uCj4gdmNwdSByZXNldC4gQW5kLCBvZiBjb3Vyc2UsIGVuc3VyZSBLVk0gd29uJ3QgdHJ5
IHRvIHVwZGF0ZSBzdGVhbC0KPiB0aW1lIHdoZW4gdGhlIHNoYXJlZCBtZW1vcnkgYWRkcmVzcyBp
cyBpbnZhbGlkLgo+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDcgKysrKysr
Kwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCAgMiArKwo+ICBhcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9zdGEuYyAgICAgfCAxMCArKysrKysrKysrCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IGlu
ZGV4IDIzMGI4MmMzMTE4ZC4uNTI1Y2JhNjNlMGM1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaAo+IEBAIC0yNjMsNiArMjYzLDEyIEBAIHN0cnVjdCBrdm1fdmNwdV9hcmNoIHsKPgo+
ICAgICAgICAgLyogJ3N0YXRpYycgY29uZmlndXJhdGlvbnMgd2hpY2ggYXJlIHNldCBvbmx5IG9u
Y2UgKi8KPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9jb25maWcgY2ZnOwo+ICsKPiArICAgICAg
IC8qIFNCSSBzdGVhbC10aW1lIGFjY291bnRpbmcgKi8KPiArICAgICAgIHN0cnVjdCB7Cj4gKyAg
ICAgICAgICAgICAgIGdwYV90IHNobWVtOwo+ICsgICAgICAgICAgICAgICB1NjQgbGFzdF9zdGVh
bDsKPiArICAgICAgIH0gc3RhOwo+ICB9Owo+Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJj
aF9zeW5jX2V2ZW50cyhzdHJ1Y3Qga3ZtICprdm0pIHt9Cj4gQEAgLTM3Myw2ICszNzksNyBAQCBi
b29sIGt2bV9yaXNjdl92Y3B1X2hhc19pbnRlcnJ1cHRzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
dTY0IG1hc2spOwo+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X3Bvd2VyX29mZihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpOwo+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X3Bvd2VyX29uKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7Cj4KPiArdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSk7Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPgo+ICAjZW5kaWYgLyogX19SSVNDVl9LVk1fSE9TVF9I
X18gKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jCj4gaW5kZXggNjk5NWI4YjY0MWU0Li5iNWNhOWYyZTk4YWMgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4g
QEAgLTgzLDYgKzgzLDggQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3Jlc2V0X3ZjcHUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgdmNwdS0+YXJjaC5oZmVuY2VfdGFpbCA9IDA7Cj4g
ICAgICAgICBtZW1zZXQodmNwdS0+YXJjaC5oZmVuY2VfcXVldWUsIDAsIHNpemVvZih2Y3B1LT5h
cmNoLmhmZW5jZV9xdWV1ZSkpOwo+Cj4gKyAgICAgICBrdm1fcmlzY3ZfdmNwdV9zYmlfc3RhX3Jl
c2V0KHZjcHUpOwo+ICsKPiAgICAgICAgIC8qIFJlc2V0IHRoZSBndWVzdCBDU1JzIGZvciBob3Rw
bHVnIHVzZWNhc2UgKi8KPiAgICAgICAgIGlmIChsb2FkZWQpCj4gICAgICAgICAgICAgICAgIGt2
bV9hcmNoX3ZjcHVfbG9hZCh2Y3B1LCBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X3N0YS5jCj4gaW5kZXggZTI4MzUxYzk0ODhiLi42NTkyZDI4N2ZjNGUgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9zdGEuYwo+IEBAIC04LDggKzgsMTggQEAKPiAgI2luY2x1ZGUgPGFzbS9rdm1fdmNwdV9z
YmkuaD4KPiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPgo+ICt2b2lkIGt2bV9yaXNjdl92Y3B1X3Ni
aV9zdGFfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKyAgICAgICB2Y3B1LT5h
cmNoLnN0YS5zaG1lbSA9IElOVkFMSURfR1BBOwo+ICsgICAgICAgdmNwdS0+YXJjaC5zdGEubGFz
dF9zdGVhbCA9IDA7Cj4gK30KPiArCj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFs
X3RpbWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gKyAgICAgICBncGFfdCBzaG1lbSA9
IHZjcHUtPmFyY2guc3RhLnNobWVtOwo+ICsKPiArICAgICAgIGlmIChzaG1lbSA9PSBJTlZBTElE
X0dQQSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICB9Cj4KPiAgc3RhdGljIGludCBrdm1f
c2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1lbShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gLS0K
PiAyLjQzLjAKPgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
PgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
