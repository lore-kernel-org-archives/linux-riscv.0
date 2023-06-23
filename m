Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C3EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prl4ZUA+m58ifaKfHiLCgc9Jn7Z7rq1azQeYAg384Cg=; b=P/rXq7MHvjpFML
	5sHvQS4x/s0DXeaYLb7eeGM/v42ITQ64oj0O88euPmIs40oJOA8nvr/3su6/NfGeVpG3YwKTY0Uw+
	syUBUM4wJzMEtmxx1XYbIXPIfWRjedFndUMbQV90V5P/VIlybMQTBC6h7AA335mBW51TorlhUJT+T
	f5Di1AYe47iJdNRKVmJNJrQp+l62vRXZOXQVvh1AFMfZTMoo5adyTgNC+D3ytSbGgkkvNFRZg3kAM
	X0uYXIywSrfe7oOzbispv/orvamuXfSf9xk3pnRF7tItLcOHoLDyRDh0Gk83+KB2xQRPj5kx9TStG
	8CMQqGW9TMiMj1lOmZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcEC-002vsy-2T;
	Fri, 23 Jun 2023 08:33:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcE9-002vrM-0l
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 08:33:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-311367a3e12so458967f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 01:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687509187; x=1690101187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKQLqzJpGFVYRDo5Vr6CozDDTDNgiseuOdVj/pwVfV8=;
        b=AddP9aW7AEbqndqwe1COoa1xwBCdAhuUqIV4D8voaogXPxJWXDDSrlT26ibX8/6O39
         GYiDhX8/Ci0Dd2A1JTA9ikD1C/RX8NCjXT1jETZbNX2mqEym9PsMWCcn8jfpR+5Jph7C
         QLKLihc6oBdjM/2XN2yi1OBxhUchwcQBV3QRodNvZaaJhX/deW0LBrDwlHmRyWe2jaZc
         PU/inDp4CJMC23GRQ1Pn2BiKnO/QeyksqkeClbFjG4SZpo22fE6H/I4O4A4ZWCw/BvRk
         rx6wBX7EdMGt1K2OxUXZcH0tEdzJis4cRzYoAxZ4iGuUX08GolnYnNGgHI7+ZrXKkZQR
         oVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687509187; x=1690101187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKQLqzJpGFVYRDo5Vr6CozDDTDNgiseuOdVj/pwVfV8=;
        b=JfhG54fM2B4CgWW2FA0gIrIT5YuYe+0wOI0N90p+D3nhunqenNI42yjTUu0RljkaSa
         XXicgcxaQ26xMvESQBRib8WtKiimtSxIgCGiVLqxoMYRjYJ7YSQBBS67yo42mHqzXOAM
         26NbNZuVFmOhSNajlVdt+fMT2QacZT0+tl85FDxht5xgkQuQw/X2H+6+ZTLntOLvs5Az
         8Fcrsa+p2dGvMkmig+JgpGhKOGMD3o9whZJcwDBZ1AkE9Rz5v4NXj2hblKxgxFBYPq68
         cMoApJo1WpifszBGhmtw4DSJ0X0W1AU3ROea5b4RR0Pgpc4BQqJVY6twkMeYXVUKC4ur
         uLNA==
X-Gm-Message-State: AC+VfDzXLXIbNcYDByBGzsApgxe9VsLrHbx4zl4t10+Sm4m+BHWd/wbn
	QiskWXI58HbOgIO96l55SxjQTRcGGKWdwjDyU5mN6A==
X-Google-Smtp-Source: ACHHUZ4WGdBKq4UxGZuZxTybdXrRMaFiJZBAcDlnLcCtF3LnRXSu1s3keBL1C4sworZTbVFtLRsjJ/tTe+wazDAS4uY=
X-Received: by 2002:a5d:45c4:0:b0:311:822:9c51 with SMTP id
 b4-20020a5d45c4000000b0031108229c51mr17887775wrs.43.1687509187023; Fri, 23
 Jun 2023 01:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230621072234.9900-1-alexghiti@rivosinc.com> <20230621072234.9900-2-alexghiti@rivosinc.com>
 <20230621-d6da578719f8af903d6746ef@orel> <20230622-4af59422f118ea634836d351@orel>
 <CAHVXubgJQhShbOfaQeOTxM61g_tUnLBxa-0JK+WE+YQRGkYRQA@mail.gmail.com> <20230622-clone-overfed-21ec0886e904@spud>
In-Reply-To: <20230622-clone-overfed-21ec0886e904@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 23 Jun 2023 10:32:56 +0200
Message-ID: <CAHVXubi786NBEg=Wp=7uy5gAA7zkmMTofX4XPdgWRzWJpq6opg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_013309_517463_7EDB0238 
X-CRM114-Status: GOOD (  22.85  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Song Shuai <songshuaishuai@tinylab.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgNzo0MeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAyMiwgMjAyMyBhdCAwNzozMjoyM1BNICsw
MjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAyMiwgMjAyMyBhdCA3
OjI04oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIFdlZCwgSnVuIDIxLCAyMDIzIGF0IDAyOjE5OjUwUE0gKzAyMDAsIEFuZHJl
dyBKb25lcyB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCAwOToyMjozM0FN
ICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+IC4uLgo+ID4gPiA+ID4gK0hhcmR3
YXJlIGRlc2NyaXB0aW9uCj4gPiA+ID4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICtUaGUgZmlybXdhcmUgY2FuIHBhc3MgZWl0aGVyIGEgZGV2aWNldHJlZSBv
ciBBQ1BJIHRhYmxlcyB0byB0aGUgUklTQy1WIGtlcm5lbC4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICtUaGUgZGV2aWNldHJlZSBpcyBlaXRoZXIgcGFzc2VkIGRpcmVjdGx5IHRvIHRoZSBrZXJuZWwg
ZnJvbSB0aGUgcHJldmlvdXMgc3RhZ2UKPiA+ID4gPiA+ICt1c2luZyB0aGUgYCRhMWAgcmVnaXN0
ZXIsIG9yIHdoZW4gYm9vdGluZyB3aXRoIFVFRkksIGl0IGNhbiBiZSBwYXNzZWQgdXNpbmcgdGhl
Cj4gPiA+ID4gPiArRUZJIGNvbmZpZ3VyYXRpb24gdGFibGUuCj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArVGhlIEFDUEkgdGFibGVzIGFyZSBwYXNzZWQgdG8gdGhlIGtlcm5lbCB1c2luZyB0aGUgRUZJ
IGNvbmZpZ3VyYXRpb24gdGFibGUuIEluCj4gPiA+ID4gPiArdGhpcyBjYXNlLCBhIHRpbnkgZGV2
aWNldHJlZSBpcyBzdGlsbCBjcmVhdGVkIGJ5IHRoZSBFRkkgc3R1Yi4gUGxlYXNlIHJlZmVyIHRv
Cj4gPiA+ID4gPiArIkVGSSBzdHViIGFuZCBkZXZpY2V0cmVlIiB0cmVlIHNlY3Rpb24gYmVsb3cg
Zm9yIGRldGFpbHMgYWJvdXQgdGhpcyBkZXZpY2V0cmVlLgo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXiByZWR1bmRhbnQgJ3RyZWUnIGhlcmUKPiA+ID4gPgo+ID4gPgo+ID4g
PiBDYW4gd2hvZXZlciBhcHBsaWVzIHRoaXMgZHJvcCB0aGlzICd0cmVlJyBJIHBvaW50ZWQgd2hp
bGUgYXBwbHlpbmc/Cj4gPgo+ID4gWWVzLCBzb3JyeTogQENvbm9yIERvb2xleSBnaXZlIG1lIHRo
ZSBvdmVybHkgbG9uZyBsaW5lcyB5b3Ugd2FudGVkIG1lCj4gPiB0byBicmVhayBhbmQgSSdsbCBz
ZW5kIGEgdjMsIGl0IHdvbid0IHRha2UgbXVjaCB0aW1lIGFuZCBJJ2xsIGZpeCB0aGlzCj4gPiB0
b28hCj4KPiBMb29rLCBJIHNhaWQgaXQgd2FzIHB1cmUgcGVkYW50cnkgb24gbXkgcGFydCwgYW5k
IG5vdCBzb21ldGhpbmcgdGhhdAo+IGhlbHBzIHdpdGggdW5kZXJzdGFuZGluZy4gWW91J3ZlIGJl
ZW4gd2FybmVkIQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QucnN0Cj4gaW5kZXggMDE5ZWU4MTg2ODZkLi5hNTI3
OTNmZDlmNmMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5yc3QKPiBAQCAtMTQzLDExICsxNDMsMTIgQEAg
YmUgY2FyZWZ1bGx5IGV4YW1pbmVkLgo+ICBEZXZpY2UtdHJlZSBtYXBwaW5nIHZpYSBmaXhtYXAK
PiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiAtVGhlIFJJU0MtViBrZXJuZWwg
dXNlcyB0aGUgZml4bWFwIHJlZ2lvbiB0byBtYXAgdGhlIGRldmljZXRyZWUgYmVjYXVzZSB0aGUK
PiAtZGV2aWNldHJlZSB2aXJ0dWFsIG1hcHBpbmcgbXVzdCByZW1haW4gdGhlIHNhbWUgYmV0d2Vl
biA6YzpmdW5jOmBzZXR1cF92bWAgYW5kCj4gLTpjOmZ1bmM6YHNldHVwX3ZtX2ZpbmFsYCBjYWxs
cyBzaW5jZSB0aGUgOmM6dmFyOmByZXNlcnZlZF9tZW1gIGFycmF5IGlzCj4gLWluaXRpYWxpemVk
IHdpdGggdmlydHVhbCBhZGRyZXNzZXMgZXN0YWJsaXNoZWQgYnkgOmM6ZnVuYzpgc2V0dXBfdm1g
IGFuZCB1c2VkCj4gLXdpdGggdGhlIG1hcHBpbmcgZXN0YWJsaXNoZWQgYnkgOmM6ZnVuYzpgc2V0
dXBfdm1fZmluYWxgLgo+ICsKPiArQXMgdGhlIDpjOnZhcjpgcmVzZXJ2ZWRfbWVtYCBhcnJheSBp
cyBpbml0aWFsaXplZCB3aXRoIHZpcnR1YWwgYWRkcmVzc2VzCj4gK2VzdGFibGlzaGVkIGJ5IDpj
OmZ1bmM6YHNldHVwX3ZtYCwgYW5kIHVzZWQgd2l0aCB0aGUgbWFwcGluZyBlc3RhYmxpc2hlZCBi
eQo+ICs6YzpmdW5jOmBzZXR1cF92bV9maW5hbGAsIHRoZSBSSVNDLVYga2VybmVsIHVzZXMgdGhl
IGZpeG1hcCByZWdpb24gdG8gbWFwIHRoZQo+ICtkZXZpY2V0cmVlLiBUaGlzIGVuc3VyZXMgdGhh
dCB0aGUgc2FtZSB2aXJ0dWFsIG1hcHBpbmcgaXMgdXNlZCBieSBib3RoCj4gK2Z1bmN0aW9ucy4K
PgoKT2ggbXksIHNvIHBlZGFudGljLi4uOikgSSBkb24ndCBsaWtlIHRoZSBsYXN0IHNlbnRlbmNl
IHRob3VnaCwgSSdsbApjaGFuZ2UgaXQgZm9yOgoKIlRoaXMgZW5zdXJlcyB0aGF0IHRoZSBkZXZp
Y2V0cmVlIHJlbWFpbnMgYWNjZXNzaWJsZSBieSBib3RoIHZpcnR1YWwgbWFwcGluZ3MuIgoKVGhh
bmtzIQoKPiAgUHJlLU1NVSBleGVjdXRpb24KPiAgLS0tLS0tLS0tLS0tLS0tLS0KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
