Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB00D35151
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI0E8x6P+uTpGG71pIAuqleC+d2J3j/unj+x0p0ps8A=; b=nD9O4dRlBz0OC1
	eeOAp135QZX2RhkJNqn4GNqqfqJsaAfIiKwJjsEcOdG8882dRaaCaGvkNrS6zFZCeNz+3E8MdTYo9
	a+v/DXq/Plltip2jjHvhEN5DwnquzRwJFgblcPe6OM86Kgdeqow+64XaArxkdn0tGNsCFnh/mjLVU
	48UQ+uDPvoIFA+o7pgvtmSEMENKuT7ImzS8wnaMmiZBN6PC307WUyaOn9IxLxuNSy+Mh1rX8JWh4h
	epKJyxCYTvrSsY/0RPcfGR7FGOLWDl3fpio9N4iIS02VlMTP7YpZ5R9u98Eyx6Hcvm11OPPaqkGlP
	VuHUI1DY36Gd07pgVzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rKN-0000000ELjG-1K8i;
	Wed, 01 Apr 2026 08:53:31 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rKK-0000000ELiM-3Ced
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 08:53:29 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-64eaf8aa893so8759202d50.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 01:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775033607; cv=none;
        d=google.com; s=arc-20240605;
        b=XMbHUeWxEl6sawlhn5EYwnxKB2YlDlXCRtLy5Vt3cGFVImMzc8hMkvyGP/gdqfsEgA
         OwQOS3P6rtNIO8cwtjO/9DFlauketR4S0BavkVsORY/idRDuu+ovTiZQ6mTG0vp/AuQX
         SHg85FC01k7QesXU4+TAobJ1fW41q02QzXAD9mllPwKOxSoFYKnW4TxzTVqg0r6mPcem
         Zl3f3LUo4ax6ba15IwK4fT+/M2Z8YCThife6AIYIPGRDPI+GUZGbuY8zF7lrJySvpPma
         S7o3R1M9NS9k6IAbZpcB51UXABj/ScwfrtDlR850DnuWRNLxlGuJQVAUmWl0yDzsvF6P
         0wOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        fh=gHG9i3m5kmBeIUa3VUA5MfkkFGA62bp1UwHqWnFG4lM=;
        b=awCThC8NRAzQH1ADnRGQINBuSLSVnkEsFOITPtuwGMI/bZ6gJIXLS59GcZylLT4knD
         piSm2PdpVMVRENUpgVYLeYHwj3+IEOB5y5jdCp6E99E2xpHOpLhvXG7n7yhe4Ff9KbAM
         gel1C50HThqE6+5OAeh+QT+G38ve1L1JGsrNIUakn0HGE86IeKWKESCZgJrUP2PPVvMF
         KqMnZz5KbWRKsQ0HTo1BD1aHpCPPoeObGDTdFJcTYo5fSinH5k3PlnxG/PmQR1CSklI2
         B52NbRTQvUp0e/JX6s3n9vIT9x32+NDS6W46kth0VnSzwvU+DXcCr0+hMTYDwfC7mS8h
         XWUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775033607; x=1775638407; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        b=MW0CCNy6Ejqfs7LIrjCxJSobK+BT4Igp+Q81hdcOOmDDPAiza4cBP/rlZlhfO8Nqp4
         FMEcckQ6T8DIPmBKaD83d9TYijcJYFYCjE1hr6zAsC3FGOYFIYwubE1bl2NAhFYHbrUv
         Kj0XPbOiA782exUjExU6eoa3UjLX6SNBLPJ8FcBeh6tiYKX176g70hVQlom0xpYaHwkN
         Q1lOW9qemOGE4DWjSqC9iRuGzoRewE/1J01OXQMLojYQb6ZUcqTWEmutJq8jnQeecO9B
         JAwAkjbefg5eHYTnTbpZEODQKmPWwMmcfqVuF9fuNtfP736CnCGiKeBu/9yNy+SsYPqL
         ruZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033607; x=1775638407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENRki6GE3XavXQugQXE3GjN1Vl6hypf25Ont7yDJwJM=;
        b=iLhZzuGnSESYzUthhrzw5OY2FhTdrXC53Q0pWGslmr0LY8935TmzCLSbW9OLwk0x2Q
         uY6nYY6KJK/LIr0ntfPkQnCwK/2lQ8oRBMgulXzNFn7U3AB1tBNPL6GpOP+RhZ2Df+Pw
         zC5ONfuISU2KcuNOtyAj31qf8gcjiXwveI+XQICn6J3lrMqUJQA2RlgzW0OuOxbqua47
         9ryYUBs95r+ypAnA6jnhkbQ9mefpxM8Qhia4DqUnL30aYNszVadniDHRji6R8I9gDk8U
         M0Fs7KV7bWD9z6plJncLubHR+nSdDNyf+dGzl625BVE7zKj+s2G4YTGfjnFekcjlL0Kz
         /IBg==
X-Forwarded-Encrypted: i=1; AJvYcCUHzIJf8G+CD1324yWeFOR05y2ZxHjQ1Ptl36I4Aux91KhTu5RqhFMtfwNkq36nZ2/5ZmUFZbGZI5/iQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1yPM3DsxFpnmNPVvXKmLb/2iQrlBySBNhao7M+HJpOpx2HLW6
	EQj5kKJl2EmnE9vreH24tQLUxiZV9vCSFj/SQUGdRJDG3Tq7UewX9pRh0K5yPhQnfGyumVR+lE4
	AfVXjz5n1BtU1mCoESSDlSI6p/zh+SBo=
X-Gm-Gg: ATEYQzyqqRWssi8t2XTKqdLFjwwDtPAyvEI4vmtLPf1nHbuJcZarsb2tDEIogcjKk2M
	VYdToA3/5sNwmNm+BYzVXVttWlagwkiZUHOTIPCW/g54Ge+TTWh0yB61dsNK+FHigAhGe1BuBCQ
	PO/Ss+TpXTIrYOTyWh1O7MJHax2uY5GFZTVOsosWWki+MOZBxKZnUpZxdPlCzpE5fB/DL6YSXjJ
	RA+5OHILGlby9CTdDBxqmIDbKbRUJN9isS5YbJGf2G6sXi4artCM4Qc9EtWEsIfYIZdv+DYW/lj
	m62PGw==
X-Received: by 2002:a05:690c:389:b0:79b:ced2:fa39 with SMTP id
 00721157ae682-7a2133f6f60mr28605447b3.57.1775033607174; Wed, 01 Apr 2026
 01:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com> <aco9oLumPh4OZtIo@kernel.org>
In-Reply-To: <aco9oLumPh4OZtIo@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 1 Apr 2026 10:53:16 +0200
X-Gm-Features: AQROBzCe0V-3QMHTJmNMWmbyBErt61jt6_tzSI47AYboyyBlMnKTU6WQsgJn7cM
Message-ID: <CABdCQ=MFcDPnzcYUEkbQyu_0qZt=aDD04p1kyxCMuVt7Av_P1Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_015328_813536_FE4CCF0D 
X-CRM114-Status: GOOD (  18.73  )
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

RWwgbHVuLCAzMCBtYXIgMjAyNiBhIGxhcyAxMTowOCwgVHJveSBNaXRjaGVsbAooPHRyb3kubWl0
Y2hlbGxAbGludXguZGV2PikgZXNjcmliacOzOgo+Cj4gT24gTW9uLCBNYXIgMzAsIDIwMjYgYXQg
MTY6Mzg6MDYgQ1NULCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4gPiBBZGQgU0QgY2FyZCBjb250cm9s
bGVyIGluZnJhc3RydWN0dXJlIGZvciBTcGFjZW1pVCBLMSBTb0Mgd2l0aCBjb21wbGV0ZQo+ID4g
cGluY3RybCBzdXBwb3J0IGZvciBib3RoIHN0YW5kYXJkIGFuZCBVSFMgbW9kZXMuCj4gPgo+ID4g
LSBBZGQgc2RoY2kwIGNvbnRyb2xsZXIgZGVmaW5pdGlvbiB3aXRoIGNsb2NrcywgcmVzZXRzIGFu
ZCBpbnRlcnJ1cHRzCj4gPiAtIEFkZCBtbWMxX2NmZyBwaW5jdHJsIGZvciAzLjNWIHN0YW5kYXJk
IFNEIG9wZXJhdGlvbgo+ID4gLSBBZGQgbW1jMV91aHNfY2ZnIHBpbmN0cmwgZm9yIDEuOFYgVUhT
IGhpZ2gtc3BlZWQgb3BlcmF0aW9uCj4gPiAtIENvbmZpZ3VyZSBhcHByb3ByaWF0ZSBkcml2ZSBz
dHJlbmd0aCBhbmQgcG93ZXItc291cmNlIHByb3BlcnRpZXMKPiA+Cj4gPiBUaGlzIHByb3ZpZGVz
IGNvbXBsZXRlIFNEIGNhcmQgaW5mcmFzdHJ1Y3R1cmUgdGhhdCBLMS1iYXNlZCBib2FyZHMgY2Fu
Cj4gPiBlbmFibGUuCj4gPgo+ID4gVGVzdGVkLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBn
bWFpbC5jb20+Cj4gPiBUZXN0ZWQtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJa2VyIFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0
cmwuZHRzaSB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgICAgICAgICB8IDEzICsrKysrKysrKwo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaSBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4gPiBpbmRleCBiMTNkY2IxMGY0ZDY2MDIy
ZDI3MzA3ZGU3M2E2ZWEzMjg3ZTk3NDQxLi44ZDgyMDExZjFhZjY2NmZiNzhjMjgyYTJhYmNjMGNi
ODhmOTYyMDUzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS1waW5jdHJsLmR0c2kKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEt
cGluY3RybC5kdHNpCj4gPiBAQCAtNTcwLDQgKzU3MCw0NCBAQCBwd20xNC0xLXBpbnMgewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoID0gPDMyPjsKPiA+ICAgICAgICAg
ICAgICAgfTsKPiA+ICAgICAgIH07Cj4gPiArCj4gPiArICAgICBtbWMxX2NmZzogbW1jMS1jZmcg
ewo+ID4gKyAgICAgICAgICAgICBtbWMxLWRhdGEtY21kLXBpbnMgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHBpbm11eCA9IDxLMV9QQURDT05GKDEwNCwgMCk+LCAgIC8qIG1tYzFfZDMgKi8K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8SzFfUEFEQ09ORigxMDUsIDApPiwg
ICAvKiBtbWMxX2QyICovCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEsxX1BB
RENPTkYoMTA2LCAwKT4sICAgLyogbW1jMV9kMSAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDxLMV9QQURDT05GKDEwNywgMCk+LCAgIC8qIG1tYzFfZDAgKi8KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8SzFfUEFEQ09ORigxMDgsIDApPjsgICAvKiBtbWMx
X2NtZCAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJpYXMtcHVsbC11cCA9IDwxPjsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0aCA9IDw3PjsKPiBJJ20gYSBiaXQg
Y29uY2VybmVkIGFib3V0IHRoaXMgdmFsdWUuIExvb2tpbmcgYXQgdGhlIGRvd25zdHJlYW0gNi42
IGNvZGUsIDMuM1YgdXNlcyBEUzQsCj4gd2hpY2ggZXF1YWxzIDEzbUEuIFNpbmNlIDdtQSBtYXBz
IHRvIERTMCwgd2hhdCdzIHRoZSByZWFzb25pbmcgZm9yIHVzaW5nIGl0IGhlcmU/Cj4gRG8gd2Ug
aGF2ZSBhbnkgZG9jdW1lbnRhdGlvbiBvciBtZWFzdXJlbWVudCB0byBiYWNrIHRoaXMgdXA/CgpU
aGFuayB5b3UgZm9yIGNhdGNoaW5nIHRoaXMhIFlvdSdyZSBhYnNvbHV0ZWx5IHJpZ2h0IHRvIHF1
ZXN0aW9uIHRoZXNlCmRyaXZlIHN0cmVuZ3RoIHZhbHVlcy4KCkxvb2tpbmcgYmFjayBhdCBteSBk
ZXZlbG9wbWVudCBwcm9jZXNzLCBJIHJlbWVtYmVyIGhpdHRpbmcgc2lnbmFsCmludGVncml0eSBp
c3N1ZXMgaW4gdGhlIGVhcmx5IHN0YWdlcyBvZiB0aGlzIGRyaXZlciBkZXZlbG9wbWVudC4gQXMg
YQpxdWljayBzb2x1dGlvbiwgSSBsb3dlcmVkIHRoZSBkcml2ZSBzdHJlbmd0aCB2YWx1ZXMsIHdo
aWNoIHNlZW1lZCB0bwpyZXNvbHZlIHRoZSBpbW1lZGlhdGUgcHJvYmxlbXMsIGFuZCBJIG1vdmVk
IG9uIHdpdGhvdXQgcmV2aXNpdGluZyB0aGUKZWxlY3RyaWNhbCBjaGFyYWN0ZXJpc3RpY3MuCgpB
ZnRlciB5b3VyIGZlZWRiYWNrLCBJIGludmVzdGlnYXRlZCB0aGlzIHByb3Blcmx5IGJ5IGNvbXBh
cmluZyB3aXRoCnRoZSB2ZW5kb3Iga2VybmVsLiBJdCB1c2VzOgotIDMuM1YgbW9kZTogUEFEXzNW
X0RTNCAoMTltQSkKLSAxLjhWIFVIUyBtb2RlOiBQQURfMVY4X0RTMyAoNDJtQSkKCk15IG9yaWdp
bmFsIHZhbHVlcyB3ZXJlIGluZGVlZCBiYWNrd2FyZHMgZnJvbSBib3RoIGVsZWN0cmljYWwgdGhl
b3J5CmFuZCBwcm92ZW4gdmVuZG9yIGltcGxlbWVudGF0aW9uLiBUZXN0aW5nIHdpdGggdGhlIGNv
cnJlY3RlZCB2YWx1ZXMKKDE5bUEvNDJtQSkgY29uZmlybXMgU0QgY2FyZCBpcyB3b3JraW5nLgoK
SSdsbCBzZW5kIHY2IHdpdGggdGhlIGNvcnJlY3RlZCBkcml2ZSBzdHJlbmd0aCB2YWx1ZXM6IGRy
aXZlLXN0cmVuZ3RoCj0gPDE5PiBmb3IgMy4zViBhbmQgZHJpdmUtc3RyZW5ndGggPSA8NDI+IGZv
ciAxLjhWIFVIUyBtb2Rlcy4KCj4gPiArICAgICAgICAgICAgICAgICAgICAgcG93ZXItc291cmNl
ID0gPDMzMDA+Owo+ID4gKyAgICAgICAgICAgICB9Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICBt
bWMxLWNsay1waW5zIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8SzFfUEFE
Q09ORigxMDksIDApPjsgICAvKiBtbWMxX2NsayAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGJpYXMtcHVsbC1kb3duID0gPDE+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRyaXZlLXN0
cmVuZ3RoID0gPDc+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHBvd2VyLXNvdXJjZSA9IDwz
MzAwPjsKPiA+ICsgICAgICAgICAgICAgfTsKPiA+ICsgICAgIH07Cj4gPiArCj4gPiArICAgICBt
bWMxX3Voc19jZmc6IG1tYzEtdWhzLWNmZyB7Cj4gPiArICAgICAgICAgICAgIG1tYzEtZGF0YS1j
bWQtcGlucyB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPEsxX1BBRENPTkYo
MTA0LCAwKT4sICAgLyogbW1jMV9kMyAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDxLMV9QQURDT05GKDEwNSwgMCk+LCAgIC8qIG1tYzFfZDIgKi8KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8SzFfUEFEQ09ORigxMDYsIDApPiwgICAvKiBtbWMxX2QxICov
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEsxX1BBRENPTkYoMTA3LCAwKT4s
ICAgLyogbW1jMV9kMCAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxLMV9Q
QURDT05GKDEwOCwgMCk+OyAgIC8qIG1tYzFfY21kICovCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgYmlhcy1wdWxsLXVwID0gPDE+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRyaXZlLXN0
cmVuZ3RoID0gPDEzPjsKPiBTZWUgYWJvdmUuCj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0gVHJveQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
