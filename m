Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2F0C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1cE1dYTDKglVSErBPU7jhrrecUVVFkGogwpDGmbDBY=; b=RpNTsdAwrk7Lra
	bwp6fe4ByVRs8mxAU4GkzhFh08yUyGsHDCD/2JJYzMQOsySiDltPW7DYlcYTr8tkeTjyz4JNbqW2v
	fnJCw7AyrLzxF+9+XgqdFoBOqM7B8XYz+gwIg0Zg3nhjzfBisrYQdPqlnjZtz0ErS5hyOSFb1deBm
	AW9rUFFz3LKo/emtk7cHktusgzeXKoGbmSAzyiM+KlhVWlDzCZnolEjltJLgz/wkxTXrRWLXk3ROL
	iJwd/pHREoyBQrCCeXWN33rS21MV6Z5EVCdmMGtFNhC7O65ut/1/b0dCRhq/Rc0nHBvNWNe32cum4
	vNpl42sqsopGtD0Ou6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKhg-00000009Sgq-2VdF;
	Wed, 13 Mar 2024 09:15:16 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKhd-00000009SgM-44d6
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 09:15:15 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-609fd5fbe50so8995477b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710321312; x=1710926112; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqotXijGBK/xxL+I0CUWXKiI+5VaRnDECfuNpqhLd60=;
        b=W9Rv3K2TlMew7pPy/c5BAZS9Wf3xlrY6cx2u3I3iD+R5DH75cniIJeeKWNNLyW0LFy
         YHUKNK9jp1MzvAP8GvYBc30K7bM6SaZPgSbzt2pROEz0mVbPqNrmHFRIRopMwgI5AJCE
         jA1EWpYiLydVGQif/PDdZHzeND4a2gFHD2S+e9Lz+o63EJq53Dc75AEQUSlnXSzC038r
         /ORXOlGjmJtJxP26oqZhGKCIocV/kwMxiEiydx4jBk4B84W9Qk9wD2KEDfGegPx3+woL
         6C9iuGlUKotpqAzltrXBqtPuqCfGbk/v7bvc1mhegXMJ/2iks21zCfa1v7Dd/LhyLheM
         0zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710321312; x=1710926112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqotXijGBK/xxL+I0CUWXKiI+5VaRnDECfuNpqhLd60=;
        b=WGmmi3n1FeI/KWDzUvoighks3cEkx8/G3585hnegBM5QGPPVk/uHnkxhZoDAIZBnBd
         /xC3+Zr9NNfmsfqqzhKI23d4ua1FSPdugIgmJIGdFItFyyCzzzoi7UqnpaXTSHNtdWjh
         vARXH96YdZ8O1B/rDTpd+5ax+PCOOJfYDEAc9PLT5D5Z/IzR+Lad8cUjJbrvjGPa4Pb/
         KGWMh8Vp3gzBy0OZNnLgZX0PacIivtbrUedzODOnUOKiBhFtHMsLligmde7bq8+icr0Y
         53W5ZBi9km3X4oAice07L1j4dqE8RouE5SHsPSMyWoTtaZUzfTXXpC+VQi4pSGwvr+O4
         5qdw==
X-Gm-Message-State: AOJu0YzqYNcoHl6qouVmSbrpWTUEkRUSGVzItZLtIXWSqzKkC2GNJhvt
	9z2Ncs9aaCd3gySGUouFU2D7nK4gv/GdnAb5yqchEZThre4fHLh+KywCL9AtNe7pbg5Q1E6gwlQ
	86e2zaalhTreh7DOOdcgPW2kfzXJWnZnSno1qHbLXmLkIkrFxuLA=
X-Google-Smtp-Source: AGHT+IHCtWc9LtHxu+a2pcvNAj5TRt+o6pHAEtFnx7T9d/rKbNDLBN2hxEqETqNEoRRH6LO6m0Evm4DC0pufZHYC9Bw=
X-Received: by 2002:a81:6e8a:0:b0:607:f09a:d298 with SMTP id
 j132-20020a816e8a000000b00607f09ad298mr1848423ywc.42.1710321312526; Wed, 13
 Mar 2024 02:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240312123627.9285-1-andy.chiu@sifive.com> <7f968290-2ca3-49c9-b76a-04849abb637e@app.fastmail.com>
In-Reply-To: <7f968290-2ca3-49c9-b76a-04849abb637e@app.fastmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 13 Mar 2024 17:15:00 +0800
Message-ID: <CABgGipX75Tg0fROPJgQea0ijmMq8dkbxEqFh4=nv-mRRpO45dw@mail.gmail.com>
Subject: Re: [v1, 0/6] Support Zve32[xf] and Zve64[xfd] Vector subextensions
To: "Stefan O'Rear" <sorear@fastmail.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_021514_099175_D2F2C12D 
X-CRM114-Status: GOOD (  30.17  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOToxN+KAr1BNIFN0ZWZhbiBPJ1JlYXIgPHNvcmVhckBm
YXN0bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXIgMTIsIDIwMjQsIGF0IDg6MzYgQU0s
IEFuZHkgQ2hpdSB3cm90ZToKPiA+IFRoZSBzZXJpZXMgY29tcG9zZXMgb2YgdHdvIHBhcnRzLiBU
aGUgZmlyc3QgcGFydCBwcm92aWRlcyBhIHF1aWNrIGZpeCBmb3IKPiA+IHRoZSBpc3N1ZSBvbiBh
IHJlY2VudCB0aHJlYWRbMV0uIFRoZSBpc3N1ZSBoYXBwZW5zIHdoZW4gYSBwbGF0Zm9ybSBoYXMK
PiA+IHVudW5pZmllZCB2ZWN0b3IgcmVnaXN0ZXIgbGVuZ3RoIGFjcm9zcyBtdWx0aXBsZSBjb3Jl
cy4gU3BlY2lmaWNhbGx5LAo+ID4gcGF0Y2ggMSBhZGRzIGEgY29tbWVudCBhdCBhIGNhbGxzaXRl
IG9mIHJpc2N2X3NldHVwX3ZzaXplIHRvIGNsYXJpZnkgaG93Cj4gPiB2bGVuYiBpcyBvYnNlcnZl
ZCBieSB0aGUgc3lzdGVtLiBQYXRjaCAyIGZpeGVzIHRoZSBpc3N1ZSBieSBmYWlsaW5nIHRoZQo+
ID4gYm9vdCBwcm9jZXNzIG9mIGEgc2Vjb25kYXJ5IGNvcmUgaWYgdmxlbmIgbWlzbWF0Y2hlcy4K
PiA+Cj4gPiBUaGUgc2Vjb25kIHBhcnQgb2YgdGhlIHNlcmllcyBwcm92aWRlIGEgZmluZXIgZ3Jh
aW4gdmlldyBvZiB0aGUgVmVjdG9yCj4gPiBleHRlbnNpb24uIFBhdGNoIDMgZ2l2ZSB0aGUgb2Jz
b2xldGUgSVNBIHBhcnNlciB0aGUgYWJpbGl0eSB0byBleHBhbmQKPiA+IElTQSBleHRlbnNpb25z
IGZvciBzaWdsZSBsZXR0ZXIgZXh0ZW5zaW9ucy4gUGF0Y2ggMywgNCBpbnRyb2R1Y2VzIFp2ZTMy
eCwKPiA+IFp2ZTMyZiwgWnZlNjR4LCBadmU2NGYsIFp2ZTY0ZCBmb3IgaXNhIHBhcnNpbmcgYW5k
IGh3cHJvYmUuIFBhdGNoIDUKPiA+IHVwZGF0ZXMgYWxsIGNhbGxzaXRlcyBzdWNoIHRoYXQgVmVj
dG9yIHN1YmV4dGVuc2lvbnMgYXJlIG1heGltdW1seQo+ID4gc3VwcG9ydGVkIGJ5IHRoZSBrZXJu
ZWwuCj4KPiBXaGF0IGlzIHRoZSBlbmQgdXNlciBwcm9ncmFtbWluZyBpbnRlcmZhY2UgZm9yIHRo
aXMgaW50ZW5kZWQgdG8gYmU/IHByY3RsCj4gY2FsbCB1c2luZyBpbmxpbmUgYXNtIGVjYWxsIGlu
IHRoZSBpZnVuYyByZXNvbHZlciwgcG9zc2libHkgYXV0b21hdGVkIHVzaW5nCj4gZnVuY3Rpb24g
bXVsdGktdmVyc2lvbmluZz8gQ2FuIHdlIGRvIGJldHRlciB3aXRoIGEgZGlmZmVyZW50IGludGVy
ZmFjZT8KCklmIGEgcGxhdGZvcm0gc3VwcG9ydHMgZnVsbCBWLCB0aGVuIHRoZSB1c2VyIHNpbXBs
eSBnZXRzIGl0IGJ5IHJlYWRpbmcKRUxGX0hXQ0FQLiBFTEZfSFdDQVAgaGFzIHRoZSAndicgYml0
IHNldCB3aGVuIGFsbCBmb2xsb3dpbmcgY29uZGl0aW9ucwphcmUgbWV0OgogMS4gVGhlIHNpbmds
ZS1sZXR0ZXIgJ3YnIGV4dGVuc2lvbiBpcyBwcmVzZW50ZWQgb24gcGxhdGZvcm0KIDIuIFRoZSBr
ZXJuZWwgaGFzIENPTkZJR19SSVNDVl9JU0FfVgogMy4gVGhlIFZlY3RvciBlbmFibGVtZW50IHN0
YXR1c1sxXSBmb3IgdGhlIHVzZXIgcHJvY2VzcyBpcyBzZXQgdG8KICAgICBQUl9SSVNDVl9WX1ZT
VEFURV9DVFJMX09OLiBUaGlzIGlzIHRydWUgYnkgZGVmYXVsdCBidXQgY2FuIGJlCiAgICAgY2hh
bmdlZCBpbiBLY29uZmlnIG9yIHRoZSBzeXNjdGwga25vYi4KCklmIGEgcGxhdGZvcm0gb25seSBz
dXBwb3J0cyBzb21lIG9mIFp2ZSogYnV0IG5vdCBWLCB0aGVuIEVMRl9IV0NBUApjYW5ub3QgaGVs
cC4gVGhlIHVzZXIgd291bGQgZW5kIHVwIGhhdmluZyB0byBtYWtlIGEgcHJjdGwgY2FsbCB0byBz
ZWUKaWYgY3VycmVudCdzIFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfT04gaXMgdHJ1ZS4gSSBhZ3Jl
ZSB3ZSBuZWVkIGEKYmV0dGVyIHdheSBmb3IgWnZlKiBjYXNlcy4gSSBhbSBjb25zaWRlcmluZyBp
ZiB3ZSBjb3VsZCBkdXBsaWNhdGUgdGhlCmluZm9ybWF0aW9uIG9mIGN1cnJlbnQgdmVjdG9yIGVu
YWJsZW1lbnQgc3RhdHVzIGZyb20gcHJjdGwgdG8gaHdwcm9iZS4KTm90IHZlcnkgc3VyZSBpZiB0
aGlzIGR1cGxpY2F0aW9uIGlzIGEgZ29vZCBpZGVhIHRob3VnaC4KClsxXTogaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvaHRtbC9uZXh0L3Jpc2N2L3ZlY3Rvci5odG1sCgpUaGFua3MsCkFuZHkK
CgoKCgo+Cj4gLXMKPgo+ID4gVHdvIHBhcnRzIG9mIHRoZSBzZXJpZXMgYXJlIHNlbnQgdG9nZXRo
ZXIgdG8gZWFzZSB0aGUgZWZmb3J0IG9mIHBpY2tpbmcKPiA+IGRlcGVuZGVuY3kgcGF0Y2hlcy4g
VGhlIGZpcnN0IHBhcnQgY2FuIGJlIG1lcmdlZCBpbmRlcGVuZGVudCBvZiB0aGUKPiA+IHNlY29u
ZCBvbmUgaWYgbmVjZXNzYXJ5Lgo+ID4KPiA+IFRoZSBzZXJpZXMgaXMgdGVzdGVkIG9uIGEgUUVN
VSBhbmQgdmVyaWZpZWQgdGhhdCBib290aW5nLCBWZWN0b3IKPiA+IHByb2dyYW1zIGNvbnRleHQt
c3dpdGNoLCBzaWduYWwsIHB0cmFjZSwgcHJjdGwoc3lzY3RsIGtub2IpIGludGVyZmFjZXMKPiA+
IHdvcmtzIHdoZW4gd2Ugb25seSByZXBvcnQgcGFydGlhbCBWIGZyb20gdGhlIElTQS4KPiA+Cj4g
PiBUaGlzIHBhdGNoIHNob3VsZCBiZSBhYmxlIHRvIGFwcGx5IG9uIHJpc2MtdiBmb3ItbmV4dCBi
cmFuY2ggb24gdG9wIG9mCj4gPiB0aGUgY29tbWl0IDg4NjUxNmZhZTJiNyAoIlJJU0MtVjogZml4
IGNoZWNrIGZvciB6dmtiIHdpdGggdGlwLW9mLXRyZWUgY2xhbmciKQo+ID4KPiA+IFsxXToKPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDIyOC12aWNpbml0eS1jb3Juc3RhbGst
NGI4ZWI1ZmU1NzMwQHNwdWQvVC8jdQo+ID4KPiA+IEFuZHkgQ2hpdSAoNik6Cj4gPiAgIHJpc2N2
OiB2ZWN0b3I6IGFkZCBhIGNvbW1lbnQgd2hlbiBjYWxsaW5nIHJpc2N2X3NldHVwX3ZzaXplKCkK
PiA+ICAgcmlzY3Y6IHNtcDogZmFpbCBib290aW5nIHVwIHNtcCBpZiBpbmNvbnNpc3RlbnQgdmxl
biBpcyBkZXRlY3RlZAo+ID4gICByaXNjdjogY3B1ZmVhdHVyZTogY2FsbCBtYXRjaF9pc2FfZXh0
KCkgZm9yIHNpbmdsZS1sZXR0ZXIgZXh0ZW5zaW9ucwo+ID4gICByaXNjdjogY3B1ZmVhdHVyZTog
YWRkIHp2ZTMyW3hmXSBhbmQgenZlNjRbeGZkXSBpc2EgZGV0ZWN0aW9uCj4gPiAgIHJpc2N2OiBo
d3Byb2JlOiBhZGQgenZlIFZlY3RvciBzdWJleHRlc25pb25zIGludG8gaHdwcm9iZSBpbnRlcmZh
Y2UKPiA+ICAgcmlzY3Y6IHZlY3RvcjogYWRqdXN0IG1pbmltdW0gVmVjdG9yIHJlcXVpcmVtZW50
IHRvIFpWRTMyWAo+ID4KPiA+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3Qg
ICB8IDE1ICsrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAg
ICB8ICA1ICsrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggICAgIHwg
IDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAgICB8IDIxICsr
KysrKy0tLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3hvci5oICAgICAgICAgICB8ICAy
ICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCAgfCAgNSArKysK
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICB8IDU3ICsrKysrKysr
KysrKysrKysrKysrKysrLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgICAgICAg
ICAgICAgfCAxNCArKystLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVj
dG9yLmMgfCAgNCArLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAg
IHwgIDQgKy0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyAgICAgICAgICAgICB8ICA2
ICstLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyAgICAgICAgICAgIHwgMTQgKysr
Ky0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgIHwgMTIgKysr
Ky0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICAgICAgfCAxNSArKysr
LS0tCj4gPiAgYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TICAgICAgICAgICAgICAgfCAgMiArLQo+
ID4gIDE1IGZpbGVzIGNoYW5nZWQsIDEzNSBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkK
PiA+Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
