Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB01DC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IU3nCy9au+UkFYWDVSdyp5k9fCozjDnKqQyojgifQ54=; b=qHw94TPnF0jZwf
	GvYcL1KaO7w1oKGAuKi6NQC0qhDGczMTyse0PmSw2Roq7qKaMXXPaQ6KAkf83lFXX7OxCO/Nf2cYf
	YA7XyPUoh428tREJznxMnubV6PSMppVbf3Z0BSvQ6ZMM2tZi2VFXmssNbh6jYpihTpIfwPtk+hqFC
	5Vnp7kzsB8k8VsynrUp7hIzDyHtOZRVwtz+O7ZcCzEW7rRKSKsYt+PEdlM9cuy6B3AblafJnP9Niv
	TIKg+WlFOxU+JyzL1vJY34XS9x1c5TjEblk67Nl2nM4CBwyGhrY2yaRzxRcD69pQXA7OOv9YTr1wE
	7f/k8k0k3u14zgxNB3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUrJ-00000007SFw-0pj9;
	Wed, 26 Jun 2024 15:46:57 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUrE-00000007SF2-0bTQ
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 15:46:55 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso82169011fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719416807; x=1720021607; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3GZB2PNyOQWwOJr8RHkCwHzcgvUDbBdBBHSJgysLpk=;
        b=YUEDgl3fjuxCv/j6N7aLsyPvzRFJOW6yxXzHElHyIdrfyRRM6IL/wjcgowWJVCDsfT
         +d8DtOciCJ8v68plEJ6yPBH9R60CIGNarzfltCs6YldRh59CJlpPX72h6R7UEtGdkJj0
         kOtfNIpd4FLbZ1ZyoLQAQPAuUsnc3TMqDhtrOWmotXSIZAoMPOIGcZLzLkSbDK3a9B5J
         1GC+m4qcJTW9EIjNu9U3VkjPJm4E8xIRIXLtbwnZQL8mm+11c7iOQY9wRIeq9fLNEgpz
         n3X+tSWUUll04N3yLGMQ9rZNDgF/PgU4f1LeC3EEJj8937hEtgpM/8Zkk/r9drKW/SG3
         LyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416807; x=1720021607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3GZB2PNyOQWwOJr8RHkCwHzcgvUDbBdBBHSJgysLpk=;
        b=IxQXFS3U5c/gMwE34447nXKUJGsuKeOAfWelVN2/DlitCROPmVzwwoBc4j/5TWWr2q
         38r8sGRlZM6au2dSXwcJuw7nNnN2xDkOwj1ehT9fqxa2/p4AMNOqO5dQbSpQq2uDbEX9
         u4bRvYMJoZsWlG9E9u9P4mp2xMC8buyz0nu7HyRW7peCWudvPTGggkHhpkpHH6sKT5Iv
         vimMXKT9U289EAChP3ZhnO65ByLL2lc5jlrRxkJVDEz/RDsVF9VM3KAZoSrEOxZpGEsF
         iZ1rgv8fbQ2zh2HyPJYohpicSRu+KlGkuXE0xdDRu2BIX6OsLQuFBS1QrG6gwDnSSRp2
         xh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0NPWtr/meuPvScf9Y6jdbimwYOjGDe+bSWtyY83eWXKMXTZ8ZlYX+RnvPuDqTezypRhs/cx2nk13xqP8SZFSJUttObGQ560b5zBQKZ5rq
X-Gm-Message-State: AOJu0YyUn2TY2XBECHkg4ZZbWXwzcXnuozFyDGaWVNWtSBYNPyWZeTHF
	Xr6WyEl6SCIN03/EWZfcIbrHXlMPHGmqTt93qakdviuIIGIY8el9EzMMpODNt/I0ao9tKYhaB9B
	GQfauq8jmVfpuhbHyb+075DLEF4k=
X-Google-Smtp-Source: AGHT+IEA4U+AsI1w4tA1Jntk18qJO5tcfEMx08rAjlw5ebhqt1OA+eUryqWgIpQKUlTA1ExragVqtE7l7E4XyJmefa8=
X-Received: by 2002:ac2:5ec1:0:b0:52c:d9f8:b033 with SMTP id
 2adb3069b0e04-52ce063e78amr7232087e87.3.1719416806775; Wed, 26 Jun 2024
 08:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJve8onakqwyXNcwtNOLTGah+=pbWzdNBwM64U0htyDJyY3nwQ@mail.gmail.com>
 <mhng-dc33bf67-dbfe-4eb5-b5f6-6c83770dcc3c@palmer-ri-x1c9>
In-Reply-To: <mhng-dc33bf67-dbfe-4eb5-b5f6-6c83770dcc3c@palmer-ri-x1c9>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 26 Jun 2024 23:46:34 +0800
Message-ID: <CAJve8okGNbswDt=G=5VbJszDT-W+_7sLHzk3j22b5AdBDeVQvA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dmi: Add SMBIOS/DMI support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atishp@rivosinc.com>, haibo1.xu@intel.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>, 
	Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_084652_232573_CA46FE0F 
X-CRM114-Status: GOOD (  38.18  )
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

T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgMTE6MDPigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgMjYgTWF5IDIwMjQgMDI6MTc6NDAgUERU
ICgtMDcwMCksIHhpYW9ibzU1eEBnbWFpbC5jb20gd3JvdGU6Cj4gPiBraW5kbHkgcGluZyEKPiA+
Cj4gPiBBbnkgbW9yZSBjb21tZW50cyBvbiB0aGlzIHBhdGNoPwo+Cj4gU29ycnkgSSBkcm9wcGVk
IHRoZSBiYWxsIG9uIHRoaXMgb25lLCBpdCdzIHF1ZXVlZCB1cCBmb3Igc3RhZ2luZyBhbmQKPiBz
aG91bGQgc2hvdyB1cCBvbiBmb3ItbmV4dCBhc3N1bWluZyBpdCBwYXNzZXMgdGhlIHRlc3RzLgo+
CgpUaGFua3MhCgo+ID4KPiA+IFRoYW5rcywKPiA+IEhhaWJvCj4gPgo+ID4gT24gTW9uLCBBcHIg
MjksIDIwMjQgYXQgMTA6MjLigK9QTSBIYWlibyBYdSA8eGlhb2JvNTV4QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPj4KPiA+PiBIaSBAUGFsbWVyLAo+ID4+Cj4gPj4gQ291bGQgeW91IHBsZWFzZSBsZXQg
bWUga25vdyB3aGV0aGVyIHRoaXMgcGF0Y2ggd2FzIE9LIGZvciB0aGUgbmV4dCBSSVNDLVYgUFVM
TD8KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiBIYWlibwo+ID4+Cj4gPj4gT24gV2VkLCBNYXIgMjAs
IDIwMjQgYXQgMzo0NuKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90
ZToKPiA+PiA+Cj4gPj4gPiBPbiAzLzE3LzI0IDE5OjA5LCBIYWlibyBYdSB3cm90ZToKPiA+PiA+
ID4gRW5hYmxlIHRoZSBkbWkgZHJpdmVyIGZvciByaXNjdiB3aGljaCB3b3VsZCBhbGxvdyBhY2Nl
c3MgdGhlCj4gPj4gPiA+IFNNQklPUyBpbmZvIHRocm91Z2ggc29tZSB1c2Vyc3BhY2UgZmlsZSgv
c3lzL2Zpcm13YXJlL2RtaS8qKS4KPiA+PiA+ID4KPiA+PiA+ID4gVGhlIGNoYW5nZSB3YXMgYmFz
ZWQgb24gdGhhdCBvZiBhcm02NCBhbmQgaGFzIGJlZW4gdmVyaWZpZWQKPiA+PiA+ID4gYnkgZG1p
ZGVjb2RlIHRvb2wuCj4gPj4gPiA+Cj4gPj4gPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxo
YWlibzEueHVAaW50ZWwuY29tPgo+ID4+ID4gPiAtLS0KPiA+PiA+ID4gQ2hhbmdlcyBzaW5jZSB2
MQo+ID4+ID4gPiAgICAtIENoYW5nZSB0byB1c2UgbWVtcmVtYXAvbWVtdW5tYXAgZm9yIGRtaV8o
ZWFybHkpX3JlbWFwL3VubWFwCj4gPj4gPiA+ICAgICAgZGVmaW5pdGlvbihzdWdnZXN0ZWQgYnkg
QXJkKQo+ID4+ID4gPiAgICAtIE1pbm9yIGNsZWFuIHVwIGZvciBjb21tZW50cyAoQXJkKQo+ID4+
ID4gPiAtLS0KPiA+PiA+ID4gICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
fCAxMSArKysrKysrKysrKwo+ID4+ID4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZG1pLmgg
ICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+ID4gPiAgIGRyaXZlcnMv
ZmlybXdhcmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYyB8IDEzICsrKysrKysrKysrKysKPiA+PiA+ID4g
ICAzIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKPiA+PiA+ID4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWkuaAo+ID4+ID4gPgo+ID4+ID4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPj4g
PiA+IGluZGV4IDhlYmFmZTMzN2VhYy4uMzYzOTE1MWNiNGVmIDEwMDY0NAo+ID4+ID4gPiAtLS0g
YS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4g
Pj4gPiA+IEBAIC05NTIsNiArOTUyLDE3IEBAIGNvbmZpZyBFRkkKPiA+PiA+ID4gICAgICAgICBh
bGxvdyB0aGUga2VybmVsIHRvIGJlIGJvb3RlZCBhcyBhbiBFRkkgYXBwbGljYXRpb24uIFRoaXMK
PiA+PiA+ID4gICAgICAgICBpcyBvbmx5IHVzZWZ1bCBvbiBzeXN0ZW1zIHRoYXQgaGF2ZSBVRUZJ
IGZpcm13YXJlLgo+ID4+ID4gPgo+ID4+ID4gPiArY29uZmlnIERNSQo+ID4+ID4gPiArICAgICBi
b29sICJFbmFibGUgc3VwcG9ydCBmb3IgU01CSU9TIChETUkpIHRhYmxlcyIKPiA+PiA+ID4gKyAg
ICAgZGVwZW5kcyBvbiBFRkkKPiA+PiA+ID4gKyAgICAgZGVmYXVsdCB5Cj4gPj4gPiA+ICsgICAg
IGhlbHAKPiA+PiA+ID4gKyAgICAgICBUaGlzIGVuYWJsZXMgU01CSU9TL0RNSSBmZWF0dXJlIGZv
ciBzeXN0ZW1zLgo+ID4+ID4gPiArCj4gPj4gPiA+ICsgICAgICAgVGhpcyBvcHRpb24gaXMgb25s
eSB1c2VmdWwgb24gc3lzdGVtcyB0aGF0IGhhdmUgVUVGSSBmaXJtd2FyZS4KPiA+PiA+ID4gKyAg
ICAgICBIb3dldmVyLCBldmVuIHdpdGggdGhpcyBvcHRpb24sIHRoZSByZXN1bHRhbnQga2VybmVs
IHNob3VsZAo+ID4+ID4gPiArICAgICAgIGNvbnRpbnVlIHRvIGJvb3Qgb24gZXhpc3Rpbmcgbm9u
LVVFRkkgcGxhdGZvcm1zLgo+ID4+ID4gPiArCj4gPj4gPiA+ICAgY29uZmlnIENDX0hBVkVfU1RB
Q0tQUk9URUNUT1JfVExTCj4gPj4gPiA+ICAgICAgIGRlZl9ib29sICQoY2Mtb3B0aW9uLC1tc3Rh
Y2stcHJvdGVjdG9yLWd1YXJkPXRscyAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1yZWc9dHAgLW1z
dGFjay1wcm90ZWN0b3ItZ3VhcmQtb2Zmc2V0PTApCj4gPj4gPiA+Cj4gPj4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2RtaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9kbWkuaAo+ID4+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+ID4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLmNhN2NjZTU1N2VmNwo+ID4+ID4gPiAtLS0gL2Rldi9udWxsCj4gPj4gPiA+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZG1pLmgKPiA+PiA+ID4gQEAgLTAsMCArMSwyNCBA
QAo+ID4+ID4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+PiA+
ID4gKy8qCj4gPj4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24K
PiA+PiA+ID4gKyAqCj4gPj4gPiA+ICsgKiBiYXNlZCBvbiBhcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2RtaS5oCj4gPj4gPiA+ICsgKgo+ID4+ID4gPiArICogVGhpcyBmaWxlIGlzIHN1YmplY3QgdG8g
dGhlIHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPiA+PiA+
ID4gKyAqIExpY2Vuc2UuICBTZWUgdGhlIGZpbGUgIkNPUFlJTkciIGluIHRoZSBtYWluIGRpcmVj
dG9yeSBvZiB0aGlzIGFyY2hpdmUKPiA+PiA+ID4gKyAqIGZvciBtb3JlIGRldGFpbHMuCj4gPj4g
PiA+ICsgKi8KPiA+PiA+ID4gKwo+ID4+ID4gPiArI2lmbmRlZiBfX0FTTV9ETUlfSAo+ID4+ID4g
PiArI2RlZmluZSBfX0FTTV9ETUlfSAo+ID4+ID4gPiArCj4gPj4gPiA+ICsjaW5jbHVkZSA8bGlu
dXgvaW8uaD4KPiA+PiA+ID4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPj4gPiA+ICsKPiA+
PiA+ID4gKyNkZWZpbmUgZG1pX2Vhcmx5X3JlbWFwKHgsIGwpICAgICAgICAgICAgICAgIG1lbXJl
bWFwKHgsIGwsIE1FTVJFTUFQX1dCKQo+ID4+ID4gPiArI2RlZmluZSBkbWlfZWFybHlfdW5tYXAo
eCwgbCkgICAgICAgICAgICAgICAgbWVtdW5tYXAoeCkKPiA+PiA+ID4gKyNkZWZpbmUgZG1pX3Jl
bWFwKHgsIGwpICAgICAgICAgICAgICAgICAgICAgIG1lbXJlbWFwKHgsIGwsIE1FTVJFTUFQX1dC
KQo+ID4+ID4gPiArI2RlZmluZSBkbWlfdW5tYXAoeCkgICAgICAgICAgICAgICAgIG1lbXVubWFw
KHgpCj4gPj4gPiA+ICsjZGVmaW5lIGRtaV9hbGxvYyhsKSAgICAgICAgICAgICAgICAga3phbGxv
YyhsLCBHRlBfS0VSTkVMKQo+ID4+ID4gPiArCj4gPj4gPiA+ICsjZW5kaWYKPiA+PiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYyBiL2RyaXZlcnMv
ZmlybXdhcmUvZWZpL3Jpc2N2LXJ1bnRpbWUuYwo+ID4+ID4gPiBpbmRleCAwOTUyNWZiNWMyNDAu
LmMzYmZiOWU3N2UwMiAxMDA2NDQKPiA+PiA+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkv
cmlzY3YtcnVudGltZS5jCj4gPj4gPiA+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL3Jpc2N2
LXJ1bnRpbWUuYwo+ID4+ID4gPiBAQCAtMTUyLDMgKzE1MiwxNiBAQCB2b2lkIGFyY2hfZWZpX2Nh
bGxfdmlydF90ZWFyZG93bih2b2lkKQo+ID4+ID4gPiAgIHsKPiA+PiA+ID4gICAgICAgZWZpX3Zp
cnRtYXBfdW5sb2FkKCk7Cj4gPj4gPiA+ICAgfQo+ID4+ID4gPiArCj4gPj4gPiA+ICtzdGF0aWMg
aW50IF9faW5pdCByaXNjdl9kbWlfaW5pdCh2b2lkKQo+ID4+ID4gPiArewo+ID4+ID4gPiArICAg
ICAvKgo+ID4+ID4gPiArICAgICAgKiBPbiByaXNjdiwgRE1JIGRlcGVuZHMgb24gVUVGSSwgYW5k
IGRtaV9zZXR1cCgpIG5lZWRzIHRvCj4gPj4gPiA+ICsgICAgICAqIGJlIGNhbGxlZCBlYXJseSBi
ZWNhdXNlIGRtaV9pZF9pbml0KCksIHdoaWNoIGlzIGFuIGFyY2hfaW5pdGNhbGwKPiA+PiA+ID4g
KyAgICAgICogaXRzZWxmLCBkZXBlbmRzIG9uIGRtaV9zY2FuX21hY2hpbmUoKSBoYXZpbmcgYmVl
biBjYWxsZWQgYWxyZWFkeS4KPiA+PiA+ID4gKyAgICAgICovCj4gPj4gPiA+ICsgICAgIGRtaV9z
ZXR1cCgpOwo+ID4+ID4gPiArCj4gPj4gPiA+ICsgICAgIHJldHVybiAwOwo+ID4+ID4gPiArfQo+
ID4+ID4gPiArY29yZV9pbml0Y2FsbChyaXNjdl9kbWlfaW5pdCk7Cj4gPj4gPgo+ID4+ID4gUmV2
aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
