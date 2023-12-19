Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A52C46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=isdYat2mauMEATUpnmpyNnKrVssvwbbrxL3D7I7XmJE=; b=XqePvVaGfWAwXioTSy7igMKrt+
	Sceo1W5gYT6GBK8KXPdc5T6yCebrtgjmn9mo9JLo41wxcn+87aJ0A2v1XaxCV8HFsyan5eVNhx+hy
	GSltzNmjyB/Ctd39rOuXkMLGADmT/OdoM+J/JqvutV/OYjMyaoy67pGIq3CGPw7YzE/IHEp4nuGFa
	4mGJ+j8bxKqFTkO6XBprGk2LoJEoTfbPmSV0N96R6wlnB90a7mq64RzL6EVbgbr/aC5ESu17Beei+
	diVpx77+1CPTRtxxhpMbYTqpMOrYVKA5nBb6TX6AsDAgvp+EUA10CKC0/Bwxj59AhkGKhGk3xJfKh
	1C+PAyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeUY-00F82c-19;
	Tue, 19 Dec 2023 18:06:54 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeUV-00F80R-0O
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 18:06:53 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-59067ccb090so3061605eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 10:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1703009209; x=1703614009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bFR3yte01HbYlDHRv97Ae0s+mmV5KMmIsjF09sLSAo=;
        b=Fz2W/pdQ9rhGWncpvBoU8n8YSzXFvPJ5kGfrphvFZVHlnH6nUEvqMgnY0W+6nIcqTw
         3LLxPYd7pNzC1y1yfnmfGiUzk+XjKVEXJfDirm5Y1zvgrgBGMf13b+MSRtF7F/QYFwXn
         kLI3HCT8KWVheW1J5Oo3JcCz80dV0pKNcIebWS5J7PbYdh3RHcSy+HuACmApNY6BcYXs
         TfGUexlk86YszTsFHIQioJjo2x725Un3iJriithGif3Tb1p1ecMwPwBo5O0QtTeZ03Dx
         dh20nmHp0hxgyNQjwzB/sM7ZTCU9wkchUGTyAx/BlL7o6kQXivnnZB1YE2v/RgYlb7qm
         9X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703009209; x=1703614009;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bFR3yte01HbYlDHRv97Ae0s+mmV5KMmIsjF09sLSAo=;
        b=NEKbYUdohKRVMjBFbipL+jwq8k1Qzw6aPDqBLsy8eMR/9p0QDop1+JOuWGrrDpc+YJ
         kJoyN5Tale0/lUgqgeAJ38DC0cpOc37esTdaKPcXwkTx04vRyShigxEPHrAvF8cS3/qW
         xjRf1JxZH34cl9ApUwVN7P8exfDPSBGxd6Ra+TWGdexXw5Mc075HHvVES3z8vDjYcoH0
         vAMfLt5jGqzJA/f/YLerb17X0ghQwAAFdkH5keZgLQaAGsdbZOSBZ5KsueXToVIf8sEk
         UDqo62XVvH+VxJ09HCE30f1pC6FbeOiDsbX06Q+qc+SX8y64YuUT1ZG7VJObfzDcAWq0
         Xntg==
X-Gm-Message-State: AOJu0YwQLChjdjMQq2YgPQfgg4/eJe8+11sqqkf9TSCrPoxNlxo2px/d
	SOlDpxRfz/uLtbcbuT0WQidndg==
X-Google-Smtp-Source: AGHT+IGvPerCtBqoYqOL8gM8DjEGEeInNA7fBUfyY5sV10T7iaCe0Q9SaOquZFFdB4wBcBusiAV1LQ==
X-Received: by 2002:a05:6359:4c22:b0:170:c91a:b466 with SMTP id kj34-20020a0563594c2200b00170c91ab466mr17943635rwc.23.1703009209277;
        Tue, 19 Dec 2023 10:06:49 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id a19-20020aa78653000000b006d698583881sm4850781pfo.141.2023.12.19.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 10:06:48 -0800 (PST)
Date: Tue, 19 Dec 2023 10:06:48 -0800 (PST)
X-Google-Original-Date: Tue, 19 Dec 2023 10:06:47 PST (-0800)
Subject: RE: [RFT 1/2] RISC-V: handle missing "no-map" properties for OpenSBI's PMP protected regions
In-Reply-To: <OSZPR01MB70195C6084CF2CDA5EE13D68AA97A@OSZPR01MB7019.jpnprd01.prod.outlook.com>
CC: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
  prabhakar.csengg@gmail.com, geert+renesas@glider.be, Atish Patra <atishp@rivosinc.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, apatel@ventanamicro.com, alexghiti@rivosinc.com,
  Bjorn Topel <bjorn@rivosinc.com>, suagrfillet@gmail.com, jeeheng.sia@starfivetech.com,
  petrtesarik@huaweicloud.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com
Message-ID: <mhng-378700ef-2f59-431a-bba6-2c70e0584738@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_100651_476388_EA2B408E 
X-CRM114-Status: GOOD (  36.40  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxOSBEZWMgMjAyMyAwOToyNzo0MiBQU1QgKC0wODAwKSwgcHJhYmhha2FyLm1haGFk
ZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tIHdyb3RlOgo+IEhpIENvbm9yLAo+IAo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+Cj4+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDE5LCAyMDIzIDU6MTggUE0KPj4gVG86IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+IENjOiBMYWQsIFByYWJo
YWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+OyBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPjsKPj4gZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU7IEF0aXNoIFBhdHJhIDxh
dGlzaHBAcml2b3NpbmMuY29tPjsgUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUu
Y29tPjsKPj4gYXBhdGVsQHZlbnRhbmFtaWNyby5jb207IGFsZXhnaGl0aUByaXZvc2luYy5jb207
IEJqb3JuIFRvcGVsIDxiam9ybkByaXZvc2luYy5jb20+Owo+PiBzdWFncmZpbGxldEBnbWFpbC5j
b207IGplZWhlbmcuc2lhQHN0YXJmaXZldGVjaC5jb207IHBldHJ0ZXNhcmlrQGh1YXdlaWNsb3Vk
LmNvbTsgbGludXgtCj4+IHJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc7IFByYWJoYWthciBNYWhhZGV2
IExhZAo+PiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+PiBTdWJq
ZWN0OiBSZTogW1JGVCAxLzJdIFJJU0MtVjogaGFuZGxlIG1pc3NpbmcgIm5vLW1hcCIgcHJvcGVy
dGllcyBmb3IgT3BlblNCSSdzIFBNUCBwcm90ZWN0ZWQgcmVnaW9ucwo+PiAKPj4gSGV5LAo+PiAK
Pj4gT24gVGh1LCBEZWMgMDcsIDIwMjMgYXQgMDE6MTE6MjNQTSArMDAwMCwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+PiA+IE9uIFRodSwgRGVjIDA3LCAyMDIzIGF0IDAxOjAyOjAwUE0gKzAwMDAsIExh
ZCwgUHJhYmhha2FyIHdyb3RlOgo+PiA+ID4gT24gV2VkLCBEZWMgNiwgMjAyMyBhdCAyOjI24oCv
UE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4gPiA+ID4gT24gV2Vk
LCBEZWMgMDYsIDIwMjMgYXQgMDQ6NTI6MTFBTSAtMDgwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6
Cj4+ID4gPiA+ID4gT24gVGh1LCAxMCBBdWcgMjAyMyAwMjowNzoxMCBQRFQgKC0wNzAwKSwgQ29u
b3IgRG9vbGV5IHdyb3RlOgo+PiA+Cj4+ID4gPiA+ID4gPiBJJ20gcGVyZmVjdGx5IGhhcHB5IHRv
IGRyb3AgdGhpcyBzZXJpZXMgdGhvdWdoLCBpZiBwZW9wbGUKPj4gPiA+ID4gPiA+IGdlbmVyYWxs
eSBhcmUgb2YgdGhlIG9waW5pb24gdGhhdCB0aGlzIHNvcnQgb2YgZmlybXdhcmUgd29ya2Fyb3Vu
ZCBpcyBpbGwtYWR2aXNlZC4KPj4gPiA+ID4gPiA+IFdlIGFyZSB1bmFmZmVjdGVkIGJ5IGl0LCBz
byBJIGNlcnRhaW5seSBoYXZlIG5vIHByZXNzdXJlIHRvCj4+ID4gPiA+ID4gPiBoYXZlIHNvbWV0
aGluZyB3b3JraW5nIGhlcmUuIEl0J3MgbXkgZGVzaXJlIG5vdCB0byBiZQo+PiA+ID4gPiA+ID4g
dXNlci1ob3N0aWxlIHRoYXQgbW90aXZhdGVkIHRoaXMgcGF0Y2guCj4+ID4gPiA+ID4KPj4gPiA+
ID4gPiBJSVVDIHlvdSBndXlzIGFuZCBSZW5lYXMgYXJlIHRoZSBvbmx5IG9uZXMgd2hvIGhhdmUg
aGFyZHdhcmUKPj4gPiA+ID4gPiB0aGF0IG1pZ2h0IGJlIGluIGEgc3BvdCB3aGVyZSB1c2VycyBh
cmVuJ3QgYWJsZSB0byB1cGRhdGUgdGhlCj4+ID4gPiA+ID4gZmlybXdhcmUgKGllLCBpdCdzIG91
dCBpbiBwcm9kdWN0aW9uIHNvbWV3aGVyZSkuCj4+ID4gPiA+Cj4+ID4gPiA+IEkgZHVubm8gaWYg
d2UgY2FuIHJlYWxseSBrZWVwIHRoaW5raW5nIGxpa2UgdGhhdCB0aG91Z2guIEluIHRlcm1zCj4+
ID4gPiA+IG9mIHBlb3BsZSB3aG8gaGF2ZSBkZXZpY2V0cmVlcyBpbiB0aGUga2VybmVsIGFuZCBz
dHVmZiBhdmFpbGFibGUKPj4gPiA+ID4gaW4gd2VzdGVybiBjYXRhbG9nIGRpc3RyaWJ1dGlvbiwg
c3VyZS4KPj4gPiA+ID4gSSBkb24ndCB0aGluayB3ZSBjYW4gYXNzdW1lIHRoYXQgdGhhdCBjb3Zl
cnMgYWxsIHVzZXJzIHRob3VnaCwKPj4gPiA+ID4gY2VydGFpbmx5IHRoZSBzeW50YWNvcmUgZm9s
a3MgcG9wIHVwIGV2ZXJ5IG5vdyBhbmQgdGhlbiwgYW5kIEkKPj4gPiA+ID4gc3VyZSBob3BlIHRo
YXQgQW5kZXMgZXRjIGhhdmUgbGFyZ2VyIGN1c3RvbWVyIGJhc2VzIHRoYW4gdGhlCj4+ID4gPiA+
IGluLWtlcm5lbCB1c2VycyB3b3VsZCBzdWdnZXN0Lgo+PiA+ID4gPgo+PiA+ID4gPiA+IFNvIEkn
bSBhZGRpbmcgR2VlcnQsIHRob3VnaCBoZSBwcm9iYWJseSBzYXcgdGhpcyBtb250aHMgYWdvLi4u
Cj4+ID4gPiA+Cj4+ID4gPiA+IFByYWJoYWthciBtaWdodCBiZSBhIGdvb2QgY2FsbCBvbiB0aGF0
IGZyb250LiBJJ20gbm90IHN1cmUgaWYgdGhlCj4+ID4gPiA+IFJlbmVzYXMgc3R1ZmYgd29ya3Mg
b24gYWZmZWN0ZWQgdmVyc2lvbnMgb2YgT3BlblNCSSB0aG91Z2gsIGd1ZXNzCj4+ID4gPiA+IGl0
IGRlcGVuZHMgb24gdGhlIHNlcXVlbmNpbmcgb2YgdGhlIHN1cHBvcnQgZm9yIHRoZSBub24tY29o
ZXJlbnQKPj4gPiA+ID4gc3R1ZmYgYW5kIHdoZW4gdGhpcyBidWcgd2FzIGZpeGVkLgo+PiA+ID4g
Pgo+PiA+ID4gQVRNLCBJIGRvbnQgdGhpbmsgdGhlcmUgYXJlIGFueSB1c2VycyB3aG8gYXJlIHVz
aW5nIHRoZSB1cHN0cmVhbQo+PiA+ID4ga2VybmVsICsgT3BlblNCSSAoYXBhcnQgZnJvbSBtZSBh
bmQgR2VlcnQhKS4gQ3VycmVudGx5IHRoZSBjdXN0b21lcnMKPj4gPiA+IGFyZSB1c2luZyB0aGUg
QlNQIHJlbGVhc2VzLgo+PiA+Cj4+ID4gVGhhdCBkb2Vzbid0IHJlYWxseSBhbnN3ZXIgd2hldGhl
ciBvciBub3QgeW91IChhbmQgeW91ciBjdXN0b21lcnMpIGFyZQo+PiA+IHVzaW5nIGFuIGFmZmVj
dGVkIHZlcnNpb24gb2YgdGhlIHZlbmRvciBPcGVuU0JJPwo+PiA+IFRoZSBhZmZlY3RlZCByYW5n
ZSBmb3IgT3BlblNCSSBpdHNlbGYgaXMgW3YwLjggdG8gdjEuMykuCj4+IAo+PiBEaWQgeW91IHBl
cmhhcHMgbWlzcyB0aGlzIG1haWwgUHJhYmhha2FyPwo+PiAKPiBPb3BzIHNvcnJ5IGZvciB0aGF0
Lgo+IAo+IEkgY2FuIGNvbmZpcm0gdGhlIEJTUCB2ZXJzaW9uIHVzZWQgYnkgdGhlIGN1c3RvbWVy
cyBpcyB2MS4wIFswXS4KPiAKPiBbMF0gaHR0cHM6Ly9naXRodWIuY29tL3JlbmVzYXMtcnovcnpf
b3BlbnNiaS9jb21taXRzL3dvcmsvT3BlblNCSS1QTUEvCgpPSywgc28gc291bmRzIGxpa2Ugd291
bGQgZW5kIHVwIHdpdGggYnJva2VuIHN5c3RlbXMgZnJvbSB0aGlzIGJ1ZywgdGhlbj8KCklJUkMg
d2Ugc3RpbGwgaGF2ZSB0aGUgUmVuZXNhcyBzeXN0ZW1zIGFzIE5PTlBPUlRBQkxFIGR1ZSB0byB0
aGF0IERNQSAKcG9vbCBLY29uZmlnIGNvbmZsaWN0LiAgU28gaWYgaXQncyByZWFsbHkgb25seSB0
aGVzZSBSZW5lc2FzIHN5c3RlbXMgCnRoYXQgaGF2ZSB0aGUgYnVnLCBtYXliZSB3ZSBjYW4gc3Rp
bGwgcmVtb3ZlIGhpYmVybmF0aW9uIGZyb20gCk5PTlBPUlRBQkxFIGFuZCBqdXN0IGFkZCBpbiBz
b21lIHNvcnQgb2YgS2NvbmZpZyB0byBkaXNhYmxlIHRoZSAKUmVuZXNhcytoaWJlcm5hdGlvbiBj
b21iaW5hdGlvbnMgdGhhdCB3b3VsZCBicmVhaz8KCj4gCj4gQ2hlZXJzLAo+IFByYWJoYWthcgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
