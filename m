Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EEEF513E9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 02:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSwphW5M20BHZCM9cLc74Aurv/DEJkqAzsLYgdLtK/Q=; b=GVtpjaO4k9e0Xz
	E0lTcqwGvD/KWVw43c/xGCBHoYypzDErO+ME5mARrOh523JbEOZcJIHmBMX0PhLLmgX+7mm7Bltbh
	D7leMjEz3UTZvaAacJYv/VSnSaLd+2t35lXH+V56JXS2C3jDBGQz5i58TLdHhrQOFbgNJfSM527Ng
	sjqCVtjxP+cV/cxs+s8iUp2GPndv/xgZgm8Ohf9SE6OWLv26GeYPMLJAp6Qsu5LAwvfEgaVLsUJDB
	t6eLIYAKoHv8APx9iVhpcGT7M52KmzwMzFWTGnaJUJ5pXFrNx34mwuAAhyLyI9IV/N92y88zdFRKT
	O/21FC3lxi+suGYqcmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKkx-00000002sND-2Zso;
	Fri, 06 Mar 2026 02:17:35 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKku-00000002sM4-1e3m
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 02:17:34 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-64c31ca77b4so8670311d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 18:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772763451; cv=none;
        d=google.com; s=arc-20240605;
        b=hvP5FbLm4GVvuWMirRILjJ3VBiLHor4Q/9y3YNn6UR/trqp8sFg7bZ81aSv6te1Ins
         s0tP1/xjeEEcipOXdm7q17fOlQ7ZOYm5FtlKZifU3vBV3R4G7ZFbhm65USZu3RD/SJT4
         te/0EcWtt3yKWYYc2q5PPl1RvRjcS3yWF1bonF3epXQuWI4tzPzVusaVwGmimOoZynaq
         2CKPv0Mmm5oR6oH7rKl5HWeTdGobJGnHFQv1kaMDukJKJzQThmZKspHtIFtNV1lcWap8
         FfI8z7qgd543JJkPHv/lKOb2i0OCQcEseuMTU31nLozaIptPNVA/PJgRxGQFPjIM47Av
         jmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jVjReVr0KkO/5t+3khOfOajGUJKcPNdW8XTPsxdsTk=;
        fh=9NAz7fxnAshdlbizx1/8VA5npLncYt2vE4UT87IVbNw=;
        b=JCSNi8fimwbGf2PbYuCcHVxCSBhJnhQtass0CVTBv9GQbC6H6yIDSbDkx9D/da6qmc
         7uWbsOLTCd4Dj06gh6OftNx7dejR0bQrfbliXL/ECnq+gchFIgKc1p83KawOrcMLPGP8
         kNUTSTaAU2D/2Wd9lmHf2fuHu6QDm66wmi8eanLhsP9Bd+PrlhIYRJIfP9e+g+GxZ8sX
         R4pkyv5VxiAUjKeJUZss6ERsIarnUcHkqti/X2R7oSECyig+PqoCZdUMQJeEgMsAWJ4n
         GS4VRwIH6qJgOu7rZ5Mrn9Lt1/DMIOplLSZycV152DBisv//XTurAdT/GeAUtT+0Vp7+
         GudQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1772763451; x=1773368251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jVjReVr0KkO/5t+3khOfOajGUJKcPNdW8XTPsxdsTk=;
        b=W56iX5GJPwIiey1UdgOqMAW5ibqlcL0lVFxg5lyVjiJqJITxLnyJGiBh11muarak4n
         pI24iRA8u00HnnoSZJS0ODTmOGQifM0FzALDEX/0wnn8W3vbkSlTccmTF9oridVjVo2F
         bPXFe8EcDqvH8kL6Fc7woQPQ3ohxaez0nW0O0daM7AgPzGf7LCrIVyouRqdj7rVZXrti
         WqI+zZ2oEoFHzAtUP1uMsQXfvCZ1JSVdTPupCeYW9o4r20qiP77npeJz/u++uYVphmii
         PL144NZ8W0m/Pcy2V/gBI5hdBKTBw+dgo/rKt//RTQvOOANsiRUg2ZOh1FLUVBk8avqv
         rBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772763451; x=1773368251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jVjReVr0KkO/5t+3khOfOajGUJKcPNdW8XTPsxdsTk=;
        b=Yr0RRrEwujrBLizdipzABJ04hLZTIBeUQJDMSExqFjM94jIPhlxizdzi21zzG8y6pQ
         iTWrKXVyV8DcpTavV3/biBSF+zQ1gn5O40fvFGJFN/Mewzd9AWH6hryfLymX9EcvtrTc
         p3y3VJpY+Yk9u8qTqGiieCaAS6l/hwuXdNY4NpowQG5LrbWoHg6HNe/TuUjS89KfqyQr
         4Qk5P5bjV159hMRO6OXBvL/5Y+fhyOb4dEvVrFkwTs9sNILfDTUuoZq99WYbbxa8PeCa
         odUg1tpLqag/zXd3OUXEKeNevdhE4KHGI27ZQ4Iq/ErebcxKorSU+wuD3f8uGOTdv/xX
         76pg==
X-Forwarded-Encrypted: i=1; AJvYcCXa/2c0jDUVvfjK7KYUdQ/Lq82z3FdwEBnEJdvpMwc8zU+wiGjVbvDun2xO4ArXpWjKx6NNqghRL2pZmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YybdAOV8uHEtGx7jMR4PfXb2Byk9qnFGCOd2oxkywQ6Lz+5HsA8
	ZlUYdZjVo/yiFSrveWnLGRuuaxmjw7HIxrsCBi1j4XwmzbaTaHuUOPMMA8z/lsLMLUa3P7ooCQr
	hAZYFRse6mXfKXAOx2LZ8iVpi77GNVoAALQljEejeew==
X-Gm-Gg: ATEYQzyt7wZiC+VJ+tORcTiv5pyXhLpKAUtA2HcVM/RdMLBKmbF2BoeyFlzNbTRZnG8
	U8Z0nt02kTsbdxuNqvXzqYvLURhWjfTOouAGPyf9boFUB4CbS3HcT3pItyVKn223eUJasXhb6Q5
	2/17jOj0IYCbFb2tmrrM1ZJo4DwoIHIBNL4IuL+3+Bh0WZ/fuouajQsO1zVlC+ctAGQODDcOScA
	a9qtMXF6ldFC2SRzjRkdyMiDbB6IG0TiGWF+70uXxEypDJaB6qEOyC7iBpu/LNEyTNli/QTuElc
	1bvmlq7LjZ3EQGxg5jwAkh8IOG4jYGfmFMQdAYUmIdiLYq7aXcBaGC7pntBls+DT4JI=
X-Received: by 2002:a05:690e:1206:b0:64a:f177:ef39 with SMTP id
 956f58d0204a3-64d14061df0mr624811d50.18.1772763450751; Thu, 05 Mar 2026
 18:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-5-andrew.jones@oss.qualcomm.com> <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
 <wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t>
In-Reply-To: <wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 6 Mar 2026 10:17:19 +0800
X-Gm-Features: AaiRm53HRw4QbPQUetgtrKkgMZEuh8ITbKVJrr5uKjxM4tKW-qSTt5Ouxcjq058
Message-ID: <CAH1PCMaAEyZVioQmyJh7oFisnFnrxhnc_exJh5=vbZSvNcieJw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_181732_722483_9B163C81 
X-CRM114-Status: GOOD (  37.02  )
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

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgNzowNeKAr0FNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBGZWIgMjEsIDIwMjYgYXQg
MDY6NDk6MThQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEhpLCBEcmV3Cj4gPgo+ID4g
T24gRnJpLCBGZWIgNiwgMjAyNiBhdCA4OjI04oCvQU0gQW5kcmV3IEpvbmVzCj4gPiA8YW5kcmV3
LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBBZGQgQiB0byBod2Nh
cCBhbmQgZW5zdXJlIHdoZW4gQiBpcyBwcmVzZW50IHRoYXQgWmJhLCBaYmIsIGFuZCBaYnMKPiA+
ID4gYXJlIGFsbCBzZXQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8
YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgfCAxICsKPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od2NhcC5oIHwgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgICAgICB8IDggKysrKysrKysKPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IEkgc2F3IHlvdSBjaG9zZSBub3QgdG8gYWRkIEIgdG8gaHdwcm9iZSBp
biB0aGlzIHNlcmllcywgcGVyCj4gPiB5b3VyIHJldmlldyBvZiBteSBwYXRjaCBbMV0uIEkgaGF2
ZSBhIGRpZmZlcmVudCBvcGluaW9uLgo+ID4KPiA+IEFzIHlvdSBzYWlkLCBGRCwgQywgYW5kIFYg
YXJlIGFsbCBleHBvcnRlZCB0aHJvdWdoIGJvdGggaHdjYXAKPiA+IGFuZCBod3Byb2JlLiBBZGRp
bmcgQiB0byBod3Byb2JlIHRvbyBrZWVwcyB0aGluZ3MgY29uc2lzdGVudCwKPiA+IHVzZXJzIGNh
biBxdWVyeSBhbGwgdGhlIHNpbmdsZS1sZXR0ZXIgZXh0ZW5zaW9ucyBmcm9tIG9uZQo+ID4gaW50
ZXJmYWNlIHdpdGhvdXQgbmVlZGluZyB0byBrbm93IHRoYXQgQiBpcyBtaXNzaW5nIGluIGh3cHJv
YmUKPiA+IGFuZCB0aGF0IHRoZXknZCBoYXZlIHRvIGNoZWNrIFpiYS9aYmIvWmJzIHRvIGluZmVy
IEIgc3VwcG9ydC4KPiA+Cj4gPiBSZWx5aW5nIG9uIHRoZSBydmEyM3U2NCBiYXNlIGJpdCB0byBp
bXBseSBCIGFsc28gZG9lc24ndCBjb3Zlcgo+ID4gY2hpcHMgdGhhdCBpbXBsZW1lbnQgQiB3aXRo
b3V0IGJlaW5nIHJ2YTIzdTY0IGNvbXBsaWFudC4gRWcuIG15Cj4gPiBwYXRjaHNldCBbMl0gYWRk
cyBzdXBwb3J0IGZvciBleGlzdGluZyAobm9uLXJ2YTIzdTY0KSBTb0NzLgo+ID4KPgo+IEkgdGhp
bmsgd2UgbmVlZCB0byBjb21lIHVwIHdpdGggc29tZSBzb3J0IG9mIHBvbGljeSBhcyB0byB3aGF0
IGdvZXMgdG8KPiBod3Byb2JlIGFuZCB3aGF0IGRvZXNuJ3QuIElNTywgaHdjYXAgaXMgZWFzeS4g
SWYgUklTQy1WIGRlZmluZXMgYSBzaW5nbGUKPiBsZXR0ZXIgZXh0ZW5zaW9uLCBzdWNoIGFzIFYg
b3IgQiwgdGhlbiB3ZSBzaG91bGQgYWRkIGl0IHRvIGh3Y2FwLiBIb3dldmVyLAoKV2hlbiB3ZSBl
eHBvcnQgYW4gZXh0ZW5zaW9uIHRocm91Z2ggaHdjYXAgYnV0IGl0IGNhbm5vdApiZSBxdWVyaWVk
IHRocm91Z2ggaHdwcm9iZSwgd2UgY3JlYXRlIGFuIGluY29uc2lzdGVuY3k6CnRoZSBzYW1lIGV4
dGVuc2lvbiBpcyBkaXNjb3ZlcmFibGUgdGhyb3VnaCBvbmUgaW50ZXJmYWNlCmJ1dCBub3QgdGhl
IG90aGVyLgoKVGhlIGN1cnJlbnQga2VybmVsIGFscmVhZHkgZXhwb3NlcyBvdGhlciBzaW5nbGUt
bGV0dGVyCmV4dGVuc2lvbnMgdGhyb3VnaCBib3RoIGludGVyZmFjZXM6CgogIEYrRDogUklTQ1Zf
SFdQUk9CRV9JTUFfRkQgKyBDT01QQVRfSFdDQVBfSVNBX0YvX0QKICBDOiAgIFJJU0NWX0hXUFJP
QkVfSU1BX0MgICsgQ09NUEFUX0hXQ0FQX0lTQV9DCiAgVjogICBSSVNDVl9IV1BST0JFX0lNQV9W
ICArIENPTVBBVF9IV0NBUF9JU0FfVgoKKEkvTS9BIGFyZSBmb2xkZWQgaW50byBSSVNDVl9IV1BS
T0JFX0JBU0VfQkVIQVZJT1JfSU1BLApzbyB0aGV5IGFyZSBhIHNlcGFyYXRlIGNhc2UuKQoKRiwg
RCwgQywgYW5kIFYgYXJlIGNvbnNpc3RlbnQgYmV0d2VlbiBod2NhcCBhbmQgaHdwcm9iZS4KV2h5
IHNob3VsZCBCIGJlIGRpZmZlcmVudD8KCj4gZm9yIGh3cHJvYmUsIHdlIGNhbiBnbyB0d28gd2F5
czoKPgo+ICAxLiBBZGQgZXZlcnkgZXh0ZW5zaW9uLCBpbmNsdWRpbmcgJ2J1bmRsZScgZXh0ZW5z
aW9ucywgd2hpY2ggYXJlIG5vdGhpbmcKPiAgbW9yZSB0aGFuIGFuIGFsaWFzIGZvciBhIGNvbGxl
Y3Rpb24gb2YgZXh0ZW5zaW9ucy4gVGhpcyBpbmNsdWRlcyBzaW5nbGUKPiAgbGV0dGVyIGJ1bmRs
ZSBleHRlbnNpb25zIGxpa2UgQi4KPgo+ICAyLiBBZGQgb25seSB1bmlxdWUgZXh0ZW5zaW9ucywg
aS5lLiBubyBwdXJlbHkgYnVuZGxlIGV4dGVuc2lvbnMgZ2V0Cj4gIGFkZGVkLgo+Cj4gSWYgd2Ug
Z28gd2l0aCAoMiksIHRoZW4gdXNlcnNwYWNlIHdpbGwgbmVlZCB0byB1c2UgdGhlIGJhc2UgYmVo
YXZpb3JzCj4gKHByb2ZpbGVzKSBpbiBvcmRlciB0byBnZXQgYW55IHNvcnQgb2YgYnVuZGxpbmcs
IGJ1dCBJIHRoaW5rIG1vc3QgcGVvcGxlCj4gYWdyZWUgdGhhdCB1c2Vyc3BhY2Ugd2lsbCB0YXJn
ZXQgcHJvZmlsZXMsIHNvICgyKSBzZWVtcyBzdWZmaWNpZW50LiBJJ20KCgpMb29raW5nIGF0IGV4
aXN0aW5nIGNvZGUsIGNwdWZlYXR1cmUuYyBmb2xsb3dzIG9wdGlvbiAoMikKZm9yIGJ1bmRsZSBl
eHRlbnNpb25zLiBaayBoYXMgbm8gaHdwcm9iZSBiaXQuIFRoZQpjb21tdW5pdHkgc2V0dGxlZCBv
biB0aGlzIGluIDIwMjMgWzFdLCBhbmQgSSByZXNwZWN0CnRoYXQgZGVjaXNpb24uCgpUaGUga2Vy
bmVsIGhhcyB0d28gZmFtaWxpZXMgb2YgYnVuZGxlcyB0b2RheTogdGhlIFprCnNlcmllcyAoWmss
IFprbiwgWmtzKSBhbmQgdGhlIFp2ayBzZXJpZXMgKFp2a24sIFp2a25jLApadmtuZywgWnZrcywg
WnZrc2MsIFp2a3NnKS4gQWxsIHVzZQpfX1JJU0NWX0lTQV9FWFRfQlVORExFKCkuIFR3byB0aGlu
Z3MgdG8gbm90ZToKCjEpIFRoZXkgYXJlIGFsbCBtdWx0aS1sZXR0ZXIgZXh0ZW5zaW9ucy4KMikg
QnVuZGxlIGV4dGVuc2lvbnMgaGF2ZSBubyB2YWxpZCBleHQgaWQsIHNvIHVzZXJzcGFjZQpjYW5u
b3QgcXVlcnkgdGhlbSB0aHJvdWdoIGh3cHJvYmUuIFRvIGRldGVybWluZQoiWmsiIHN1cHBvcnQs
IGEgdXNlciBtdXN0IGNoZWNrIGFsbCA4IHN1Yi1leHRlbnNpb25zCmluZGl2aWR1YWxseS4KCkIg
aXMgZGlmZmVyZW50LgoKSW4geW91ciBwYXRjaCBhbmQgbWluZSwgd2UgYm90aCBkZWZpbmUgQiBh
cyBhIHN1cGVyc2V0LApub3QgYSBidW5kbGU6CgorIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChi
LCBSSVNDVl9JU0FfRVhUX0IsCnJpc2N2X2JfZXh0cyksCgpGcm9tIGEgc3BlYyBwZXJzcGVjdGl2
ZSwgQiBhZGRzIG5vIG5ldyBmdW5jdGlvbmFsaXR5CmJleW9uZCBaYmEgKyBaYmIgKyBaYnMuIFRo
ZSBvbmx5IHRoaW5nIEIgYWRkcyBpcyBhIG1pc2EKYml0IChtLW1vZGUgQ1NSIDB4MzAxLCBub3Qg
dmlzaWJsZSB0byBTLW1vZGUgb3IgVS1tb2RlKS4KU28gZnVuY3Rpb25hbGx5IGl0IGxvb2tzIGxp
a2UgYSBidW5kbGUuCgpCdXQgY2FuIHdlIGNoYW5nZSBCIHRvIF9fUklTQ1ZfSVNBX0VYVF9CVU5E
TEUoKT8gSSBkbwpub3QgdGhpbmsgc28uIEEgYnVuZGxlIGhhcyBpZCA9IFJJU0NWX0lTQV9FWFRf
SU5WQUxJRCwKd2hpY2ggbWVhbnMgbm8gYml0IGluIHRoZSBJU0EgYml0bWFwLiBUaGUgaXNhMmh3
Y2FwW10KbWFwcGluZyBpbiByaXNjdl9maWxsX2h3Y2FwKCkgcmVxdWlyZXMgYSB2YWxpZCBleHQg
aWQKdG8gc2V0IENPTVBBVF9IV0NBUF9JU0FfQiBpbnRvIGVsZl9od2NhcC4gV2l0aG91dCBpdCwK
QVRfSFdDQVAgc3VwcG9ydCBmb3IgQiBicmVha3MsIGFuZCB3ZSB3b3VsZCBuZWVkIGEKc3BlY2lh
bCBoYWNrLiBUaGF0IGlzIHVubmVjZXNzYXJ5IGNvbXBsZXhpdHkuCgpUaGUgZXhpc3RpbmcgWmsv
WnZrIGJ1bmRsZXMgd29yayBhcyBidW5kbGVzIGJlY2F1c2UgdGhleQphcmUgbXVsdGktbGV0dGVy
IGV4dGVuc2lvbnMgd2l0aCBubyBBVF9IV0NBUCBwcmVzZW5jZS4KQiBsaXZlcyBpbiBib3RoIHdv
cmxkcy4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzEwMTItZGFya25lc3Mt
bmV1dHJvbi1mYzE4NDNmZjA1ZmZAc3B1ZC8KCj4gbm90IHN1cmUgYWJvdXQgYXBwbGljYXRpb25z
IHRoYXQgd29uJ3QgdGFyZ2V0IHByb2ZpbGVzIGJ1dCB3aWxsIHdhbnQgdG8KPiBjaGVjayBmb3Ig
YnVuZGxlIGV4dGVuc2lvbnMgcmF0aGVyIHRoYW4gaW5kaXZpZHVhbCBleHRlbnNpb25zLiBTaG91
bGQgd2UKPiB0YWtlIG9uIHRoZSBtYWludGVuYW5jZSBidXJkZW4gb2YgYWRkaW5nIGVhY2ggYnVu
ZGxlIGV4dGVuc2lvbiB0byBod3Byb2JlCj4gZm9yIHRob3NlPyBJbiBwYXJ0aWN1bGFyLCBJJ20g
bm90IHN1cmUgYWJvdXQgQiwgYmVjYXVzZSBpdCdzIGFscmVhZHkKPiBhdmFpbGFibGUgaW5kZXBl
bmRlbnRseSBvZiBhIGJhc2UgYmVoYXZpb3IgKHByb2ZpbGUpIHRocm91Z2ggaHdjYXAuCj4KCklu
IHN1bW1hcnksIG15IGNvbW1lbnRzIGFyZToKCjEuIEYsIEQsIEMsIGFuZCBWIGFyZSBkZXRlY3Rh
YmxlIGZyb20gYm90aCBod2NhcCBhbmQKICAgaHdwcm9iZS4gQiBzaG91bGQgZm9sbG93IHRoZSBz
YW1lIHBhdHRlcm4uIERyb3BwaW5nCiAgIEIgZnJvbSBod3Byb2JlIHdoaWxlIGtlZXBpbmcgaXQg
aW4gaHdjYXAgY3JlYXRlcyBhCiAgIGdhcCB0aGF0IHdpbGwgY29uZnVzZSB1c2Vycy4KCjIuIEIg
aXMgZnVuY3Rpb25hbGx5IGEgYnVuZGxlICh0aGUgbWlzYSBCIGJpdCBhdCAweDMwMQogICBpcyBt
LW1vZGUgb25seSwgbm90IHZpc2libGUgdG8gUy1tb2RlIG9yIFUtbW9kZSksCiAgIHlldCB3ZSBk
ZWNsYXJlIGl0IGFzIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCgpCiAgIGJlY2F1c2UgaXQgbmVl
ZHMgYSB2YWxpZCBleHQgaWQgZm9yIEFUX0hXQ0FQLiBJCiAgIHN1Z2dlc3Qgd2UgZG9jdW1lbnQg
dGhpcyB3aXRoIGEgY29tbWVudCBpbgogICBjcHVmZWF0dXJlLmM6CgorIC8qCisgICogQiBpcyBm
dW5jdGlvbmFsbHkgYSBidW5kbGUgKFpiYSArIFpiYiArIFpicywKKyAgKiBubyBhZGRpdGlvbmFs
IGluc3RydWN0aW9ucykuIFdlIHVzZSBTVVBFUlNFVAorICAqIGluc3RlYWQgb2YgQlVORExFIGJl
Y2F1c2UgQiBuZWVkcyBhIHZhbGlkIGV4dAorICAqIGlkIGZvciBpc2EyaHdjYXBbXSB0byBzZXQg
Q09NUEFUX0hXQ0FQX0lTQV9CLgorICAqLworICAgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKGIs
IFJJU0NWX0lTQV9FWFRfQiwgcmlzY3ZfYl9leHRzKSwKCjMuIFNob3VsZCB3ZSBhbHNvIGRvY3Vt
ZW50IGluIC5yc3Qgb3IgKGluIGNwdWZlYXR1cmUuYykgYWJvdXQgd2hlbiB0byB1c2UKX0JVTkRM
RSgpIGFuZCB3aGVuIHRvIHVzZSBfU1VQRVJTRVQoKSwgYW5kIHdoYXQncyB0aGUgaW1wbGljYXRp
b24gd2hlbgp1c2luZyB0aGVtLCB0byBlY2hvIHdoYXQgeW91IHN0YXRlZCBhYm92ZSAiLi4uIEFk
ZCBvbmx5IHVuaXF1ZQpleHRlbnNpb25zLCBpLmUuIG5vIHB1cmVseSBidW5kbGUgZXh0ZW5zaW9u
cyBnZXRhZGRlZC4iCgpCUiwKR3VvZG9uZwoKPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
