Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464D0C7619A
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 02:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1ajrMqLN/RWQ0R/a0zyhOEzOsfFBHRXQdZSp9GBOHY=; b=FiP2WNUj3WZW2G
	EEl8J0tBrXrzEZ55AHEmaDrHhwH0x76D1kIw5nhaZ92ugb1UORAy80c7p7yOtitMs0K6JwaxaU4hU
	l2+o7YzlM94nQqZzsgVymthPJC1zbmk6UR6ye7p9bfiskuSpJZb6x2P5q5Lxn9Pw0khaiqqlOkSLh
	ysGfw8PsRZzM62vzHCWpn0CFCVB7lErq2MG6z2bZ3Z9bfDSus8GDmPOV4zQELLhudYyHrGVRnAt+K
	xZBp8F4fIZI/0lC8vX4Dscvl8C85nZx+Z70z34yNnpEnnL9icPfesLBfbjFswcvJeNIWO1XLkgV52
	oiwd1E7VFfZHJCfYijnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkFd0-006Ao6-0C;
	Thu, 06 Apr 2023 02:45:34 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkFcw-006Ame-06
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 02:45:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id nh20-20020a17090b365400b0024496d637e1so224566pjb.5
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 19:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680749128; x=1683341128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdNJO4mfN64m2Db82GYHXGm3NSR4lZ1G8dlNVBocSIQ=;
        b=ll2bMfcK89gAizgPPSIn5T8e949Q/JnqEcpbsQeH1VY1J/1iiYgC9aALL2CEf2+ES4
         ZEfM5usiEug7lR0+bioA+yXiHLk0FoNBuiyQPCe6cp18ck+MXIAA4O6uAZP7vSNm18fI
         6XQu02i5KwSFYotIxb6lE9G70vRd285inqAelYvMppyeO4qHqhrDZnvLg4p3Z/StW5ry
         sZ1TjWivLeTE7tQ1e5vH6hFsdArzA7VVTxqGGiztJjaGJ0qw2i24+Kd+nnRCEkjj/vTb
         Jem7EpjPp+9NRxyKrKOVITzJ3bMS+uYgyJ6VqhKZhh5SwSEbk4Ct3Lo7TzFbAznDeiQk
         OEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680749128; x=1683341128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdNJO4mfN64m2Db82GYHXGm3NSR4lZ1G8dlNVBocSIQ=;
        b=ydOgu9jKZm3JxBzXFaWQYu+WkbLamwbUitWZiVnxUeh7YnUnennZga6ZalLB+blkcE
         NOcEozrgoVbivApDZwL+9OlcF/CMuDzI5D2j977Xh8644zMXLmhvOIowv3VpaugLPwph
         Wx8RK9AOb6Af97w7FxJas2FddpO8hlPgJfMLDrad9WIyiFKBXDvxpOcwYfmkOb9PRU25
         +D9L/k5+vjek/cwCT02r7T4I6aShw6CT8vY5TdjvYYQRpZvlFlzEOnwv7MCVAMUvsoPA
         nQfKPZT4HrgPQ3w7V0PW7mEFvbYyi9EGCiqNwGa24djjIFgndnI9R1hAhJ8uCWAma5PA
         Gd9Q==
X-Gm-Message-State: AAQBX9fq8Tjgij+yilJpuuSu3twhMVKtRYFsYMxcOP5Vk+/3U4ccqLdq
	aF9KM0p0wXlY275HVt5gkhYD7La8dXI1e+HwTag82A==
X-Google-Smtp-Source: AKy350YjCKHwdcmt1MAwwhk34guKHZvpB05RdPBqo7FPZRGnCR0kw248IBXLZjoyZJA7B5VFYot4iQ1xdvgYwcXR1cE=
X-Received: by 2002:a17:903:248:b0:19f:3b0f:4d8d with SMTP id
 j8-20020a170903024800b0019f3b0f4d8dmr3546362plh.7.1680749127966; Wed, 05 Apr
 2023 19:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud> <ZAbGSA6F0kfv9YYw@sunil-laptop>
 <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org> <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
 <ZAfeaO52pnYhiyLN@sunil-laptop> <CAFiDJ58bRo6R1qOFaSSNgAdbQJZ3xDY6Wth-t8M8XKRFbig2hA@mail.gmail.com>
 <ZCvJpnNZYzrIcfPe@sunil-laptop>
In-Reply-To: <ZCvJpnNZYzrIcfPe@sunil-laptop>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 6 Apr 2023 08:15:16 +0530
Message-ID: <CAHBxVyHA8ZouSUnqHaZTa=uMQxx61RqZuSBHx15Hg8+AVYLXZg@mail.gmail.com>
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Ley Foon Tan <lftan@kernel.org>, Conor Dooley <conor@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-acpi@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_194530_286227_01AACEF0 
X-CRM114-Status: GOOD (  38.01  )
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

T24gVHVlLCBBcHIgNCwgMjAyMyBhdCAxMjoyNOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDA0LCAyMDIzIGF0IDAyOjM1OjE5
UE0gKzA4MDAsIExleSBGb29uIFRhbiB3cm90ZToKPiA+IE9uIFdlZCwgTWFyIDgsIDIwMjMgYXQg
OTowOOKAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gVHVlLCBNYXIgMDcsIDIwMjMgYXQgMDY6NDQ6MzVQTSArMDAwMCwgQ29ub3Ig
RG9vbGV5IHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgTWFyIDA3LCAyMDIzIGF0IDA2OjEzOjIyQU0g
KzAwMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
T24gNyBNYXJjaCAyMDIzIDA1OjA2OjE2IEdNVCwgU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFt
aWNyby5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPk9uIE1vbiwgTWFyIDA2LCAyMDIzIGF0IDA5OjUx
OjA5UE0gKzAwMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gPiA+ID4+IEhleSBTdW5pbCwK
PiA+ID4gPiA+ID4+Cj4gPiA+ID4gPiA+PiBPbiBGcmksIE1hciAwMywgMjAyMyBhdCAwNzowNjoy
N1BNICswNTMwLCBTdW5pbCBWIEwgd3JvdGU6Cj4gPiA+ID4gPiA+PiA+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGVuYWJsZXMgdGhlIGJhc2ljIEFDUEkgaW5mcmFzdHJ1Y3R1cmUgZm9yIFJJU0MtVi4KPiA+
ID4gPiA+ID4+ID4gU3VwcG9ydGluZyBleHRlcm5hbCBpbnRlcnJ1cHQgY29udHJvbGxlcnMgaXMg
aW4gcHJvZ3Jlc3MgYW5kIGhlbmNlIGl0IGlzCj4gPiA+ID4gPiA+PiA+IHRlc3RlZCB1c2luZyBw
b2xsIGJhc2VkIEhWQyBTQkkgY29uc29sZSBhbmQgUkFNIGRpc2suCj4gPiA+ID4gPiA+PiA+Cj4g
PiA+ID4gPiA+PiA+IFRoZSBmaXJzdCBwYXRjaCBpbiB0aGlzIHNlcmllcyBpcyBvbmUgb2YgdGhl
IHBhdGNoIGZyb20gSmlzaGVuZydzCj4gPiA+ID4gPiA+PiA+IHNlcmllcyBbMV0gd2hpY2ggaXMg
bm90IG1lcmdlZCB5ZXQuIFRoaXMgcGF0Y2ggaXMgcmVxdWlyZWQgdG8gc3VwcG9ydAo+ID4gPiA+
ID4gPj4gPiBBQ1BJIHNpbmNlIGVmaV9pbml0KCkgd2hpY2ggZ2V0cyBjYWxsZWQgYmVmb3JlIHNi
aV9pbml0KCkgY2FuIGVuYWJsZQo+ID4gPiA+ID4gPj4gPiBzdGF0aWMgYnJhbmNoZXMgYW5kIGhp
dHMgYSBwYW5pYy4KPiA+ID4gPiA+ID4+ID4KPiA+ID4gPiA+ID4+ID4gUGF0Y2ggMiBhbmQgMyBh
cmUgQUNQSUNBIHBhdGNoZXMgd2hpY2ggYXJlIG5vdCBtZXJnZWQgaW50byBhY3BpY2EgeWV0Cj4g
PiA+ID4gPiA+PiA+IGJ1dCBhIFBSIGlzIHJhaXNlZCBhbHJlYWR5Lgo+ID4gPiA+ID4gPj4gPgo+
ID4gPiA+ID4gPj4gPiBCZWxvdyBhcmUgdHdvIEVDUnMgYXBwcm92ZWQgYnkgQVNXRy4KPiA+ID4g
PiA+ID4+ID4gUklOVEMgLSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFSNms0TXNo
aE4zV1RULWh3cUFxdXU1blg2eFNFcUsybC92aWV3Cj4gPiA+ID4gPiA+PiA+IFJIQ1QgLSBodHRw
czovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFuUDNuRmlINGprUE1wNkNPT3hQNjEyM0RDWktS
LXRpYS92aWV3Cj4gPiA+ID4gPiA+PiA+Cj4gPiA+ID4gPiA+PiA+IFRoZSBzZXJpZXMgZGVwZW5k
cyBvbiBBbnVwJ3MgSVBJIGltcHJvdmVtZW50IHNlcmllcyBbMl0uCj4gPiA+ID4gPiA+PiA+Cj4g
PiA+ID4gPiA+PiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA4MjExNDA5
MTguMzYxMy0xLWpzemhhbmdAa2VybmVsLm9yZy8KPiA+ID4gPiA+ID4+ID4gWzJdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAxMDMxNDEyMjEuNzcyMjYxLTctYXBhdGVsQHZlbnRh
bmFtaWNyby5jb20vVC8KPiA+ID4gPiA+ID4+Cj4gPiA+ID4gPiA+PiBCdWlsZGluZyBhIGNsYW5n
LTE1IGFsbG1vZGNvbmZpZyAoSSBkaWRuJ3QgdHJ5IGdjYykgd2l0aCB0aGlzIHNlcmllcywgYW5k
Cj4gPiA+ID4gPiA+PiBBbnVwJ3MgSVBJIGJpdHMsIHJlc3VsdHMgaW4gYSBicm9rZW4gYnVpbGQs
IGR1ZSB0byBmYWlsaW5ncyBpbiBjbXB4Y2hnOgo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+IC9z
dHVmZi9saW51eC9kcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9jb250cm9sbGVy
LmM6NjE6MjU6IGVycm9yOiBjYWxsIHRvIF9fY29tcGlsZXRpbWVfYXNzZXJ0XzMzNSBkZWNsYXJl
ZCB3aXRoICdlcnJvcicgYXR0cmlidXRlOiBCVUlMRF9CVUcgZmFpbGVkCj4gPiA+ID4gPiA+PiAg
ICAgICAgIHdoaWxlICh1bmxpa2VseSgocmV0ID0gY21weGNoZygmYy0+dmFsdWUsIG9sZCwgbmV3
KSkgIT0gb2xkKSkgewo+ID4gPiA+ID4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4KPiA+ID4gPgo+ID4gPiA+ID4gPiBJIGFtIGFibGUgdG8gYnVpbGQgd2l0aG91dCBhbnkgb2Yg
dGhlc2UgaXNzdWVzIHVzaW5nIGNsYW5nLTE1LiBJIGFtCj4gPiA+ID4gPiA+IHdvbmRlcmluZyB3
aGV0aGVyIHRoZSBiYXNlIGlzIHByb3Blci4gSSBoYWQgcmViYXNlZCBvbiB0b3Agb2YgdGhlIG1h
c3Rlcgo+ID4gPiA+ID4gPiBhbmQgY291cGxlIG9mIHBhdGNoZXMgZnJvbSBJUEkgc2VyaWVzIHdl
cmUgYWxyZWFkeSBtZXJnZWQgaW4gdGhlIG1hc3Rlci4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
RG8geW91IG1pbmQgdmVyaWZ5aW5nIHdpdGggbXkgYnJhbmNoCj4gPiA+ID4gPiA+IGh0dHBzOi8v
Z2l0aHViLmNvbS92bHN1bmlsL2xpbnV4L2NvbW1pdHMvYWNwaV9iMV91c19yZXZpZXdfaXBpMTdf
VjM/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBjYW4gY2hlY2sgdGhhdCBsYXRlciBJIHN1cHBvc2Uu
Cj4gPiA+ID4KPiA+ID4gPiBUaGF0J3MgYnJva2VuIHRvby4KPiA+ID4gPgo+ID4gPiA+ID4gPiBP
ciBpZiB5b3UgY291bGQgcHJvdmlkZSBtZSB5b3VyIGJyYW5jaCBkZXRhaWxzLCBJIGNhbiBsb29r
IGZ1cnRoZXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gNi4zLXJjMSwgd2l0aCBib3RoIHNlcmllcyBh
cHBsaWVkLCBzYW5zIEFudXBzIGFwcGxpZWQgcGF0Y2hlcy4KPiA+ID4gPgo+ID4gPiA+IEkndmUg
cHVzaGVkIG15IHN0dWZmIGhlcmUsIGJ1dCB1bmxpa2VseSB0aGF0IGl0IG1ha2VzIGFueSBvZGRz
IHNpbmNlCj4gPiA+ID4geW91ciBicmFuY2ggZXhwZXJpZW5jZXMgdGhlIHNhbWUgYnVpbGQgaXNz
dWUuCj4gPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvY29ub3IvbGludXguZ2l0LyBib3JrZWQtYWNwaS1zdXJmYWNlCj4gPiA+ID4KPiA+ID4gPiBN
eSBidWlsZCBjb21tYW5kcyBhcmUgd3JhcHBlZCBpbiBhIHNjcmlwdCwgYnV0IGl0J3MgYW4gTExW
TT0xCj4gPiA+ID4gYWxsbW9kY29uZmlnIHJ1biB3LyBjbGFuZy0xNSguMC43KSBldGMuCj4gPiA+
ID4KPiA+ID4gQWhoIGFsbG1vZGNvbmZpZy4gVGhhbmsgeW91IHZlcnkgbXVjaCEuIEkgY2FuIHJl
cHJvZHVjZSB0aGUgZmFpbHVyZS4gTGV0Cj4gPiA+IG1lIGxvb2sgZnVydGhlciBhbmQgZml4IGlu
IG5leHQgcmV2aXNpb24uCj4gPiA+Cj4gPiA+IFRoYW5rcyEKPiA+ID4gU3VuaWwKPiA+Cj4gPiBI
aSBTdW5pbAo+ID4KPiA+IE9uZSBxdWVzdGlvbiByZWdhcmRpbmcgUE1VIGluIEFDUEkgZmxvdy4K
PiA+Cj4gPiBXZSB1c2UgRFQgdG8gZGVjb2RlIHRoZSBzdXBwb3J0ZWQgSFBNIGNvdW50ZXJzL2V2
ZW50cyBmb3IgdGhlCj4gPiBkaWZmZXJlbnQgcGxhdGZvcm1zIG5vdy4KPiA+IEhvdyBkbyB3ZSBl
bmFibGUgUE1VIChkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jKSB3aGVuIHVzaW5nIEFDUEkg
bWV0aG9kPwo+ID4gTm90ZSwgdGhpcyBtaWdodCBiZSBpbiBzZXBhcmF0ZSBwYXRjaCBzZXJpZXMu
Cj4gPgo+IEhpIExheSBGb29uLAo+Cj4gVGhpcyBkcml2ZXIgdXNlcyBTQkkgY2FsbHMgYW5kIGhl
bmNlIHNob3VsZCB3b3JrIGluIGNhc2Ugb2YgQUNQSSBhbHNvLgo+Cj4gVGhlcmUgaXMgb25lIG1p
bm9yIGNoYW5nZSByZXF1aXJlZCBpbiB0aGlzIGRyaXZlciBmb3Igb3ZlcmZsb3cKPiBpbnRlcnJ1
cHQuIEkgaGF2ZSBhIHBhdGNoIGZvciB0aGF0IGluIGZ1dHVyZSBzZXJpZXMuCgpKdXN0IHRvIGFk
ZCBmdXJ0aGVyIGNsYXJpZmljYXRpb246IE9wZW5TQkkgd2lsbCBjb250aW51ZSB0byB1c2UgdGhl
CmRldmljZSB0cmVlIHNvIHRoYXQKdGhlIGZpcm13YXJlIHdpbGwgaGF2ZSBhY2Nlc3MgdG8gYWxs
IHRoZSBQTVUgZGV0YWlscy4KCj4KPiBUaGFua3MsCj4gU3VuaWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
