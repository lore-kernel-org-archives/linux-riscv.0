Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2131E75436
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTzJlhjsgp/vlp2kve7JFGf6lLH/WZzS4BCU14pT6Lc=; b=qR4BFtGFnQ/6VW
	AQZfJbRgqRJXxSMyS1bJ7WtrEtjpf+79CStzIPIRbYnDwkrtV6upSISRKcsufyKTLXVfbF8aIfnwd
	Kht1Co2+FTrYZT6ZyTtPcyqU+eSmMc0JHGUmiAETBjkEXrq7nsmnhVcddFohJKzKv3W+CNXUW0ECK
	gNBowKn90WoaKhyaACyf26KGTe2677C0NmUWSyZqloKgmZ0JaDGS65z4IiJ04FG2HHV34BY72tbfy
	klNQJHINqKdpwre2WKPePEFF1KHxGj0Vi7KbLFzj7piaGVL9hkkEEroAJ73kopCMp1xVoMl/GY9Iq
	v8N8kHadr7PPOm/g+D8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaxV-00EAQE-0E;
	Tue, 03 Oct 2023 08:40:49 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaxR-00EAPA-0z
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 08:40:47 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5056ca2b6d1so736201e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696322441; x=1696927241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISaU8pCB0Dja2oDURRBMOlVydgdpzjme5xVS75ei+yQ=;
        b=pvZSooRAyArrIOngwyH/4dqaHAx9JXpG1q7BysjFWJTKDAY2fkZdyyYO3dhJHP1cN4
         UMdaqBbA/Aa1/rZfnCLPSq2DktdMrq6otSz7cf0TL1ThTCp5kIhJIQ6dWKzdh4m/j4I0
         qH2+QT3HH487qZTR/KYpuKZ23sVAIYgyg1spOuE1R2C+kwpcpAAmpoiiwkBvO7DVYqRm
         EkUi6li5SIrw84Nfv6YZtKgw8snm+dIpwJY0P3j4F2+O5o8bvbJb3jggafdHHLY9ofzF
         NYVmP/KIQUUtqTerSHxwyYCNbQbEp+8/unzAA8F1QaaCtdns6R4FH+nWxplncNbR9n/O
         Ofvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696322441; x=1696927241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISaU8pCB0Dja2oDURRBMOlVydgdpzjme5xVS75ei+yQ=;
        b=xM2K1AzmHGODcqoYF5cerssMmnHZlSzekNaAP/vzVBasRLVYfCICkZqyrq+udDdD9X
         B8MJSoZgpKFqVkm5ZuhZeHbKXnGTvKSLvTH+WQmVaJSzMYWcgJekICUH8Uevl6HdCvbg
         hIVn8d3WLCUnDUSxb6og1eMYqhXREnWeEFoyln2rqfl+MUosYm/bb9mLhdUo7Lxi2PPe
         5840OkfLK8l2o5VWXiklSox01MA8Av95sFAYav4jd0EJxLV7JNJCr8GA59H2htU9t6xw
         4FdG5saHoqUJ56v1pwTL17goSmd/Ckc2GSSoiadh9ATu1wFEkcHrUTfr+pHbuFLJFVd0
         OV3g==
X-Gm-Message-State: AOJu0Yw25go/1WUjiBxbiofUJ+q8LY1NvzjPnyRWZrt99f8y7j5o1fNq
	vA3Yb9yvLyRWMW4bysrOdh03EGKypLnVrlhjRU7sl5YHpip9yi9JLNA=
X-Google-Smtp-Source: AGHT+IH8cKSCbVYvZlyiiuLFaoDBBxouUlEc58jqzFoCeuoq/H0aloztuf7u+xurYLsURNyerb+UY4so6TVEXP/waZg=
X-Received: by 2002:a05:6512:aca:b0:500:943f:11c9 with SMTP id
 n10-20020a0565120aca00b00500943f11c9mr1512437lfu.3.1696322441013; Tue, 03 Oct
 2023 01:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230926150316.1129648-1-cleger@rivosinc.com> <CALs-Hss+OK-vJy_ZKjVbGh7rTBZA+GditWcdM1XjDDskGF76Dw@mail.gmail.com>
 <10997d30-e6b7-4a24-a43e-e22679e8d450@rivosinc.com> <CALs-HssAAgbdUuoCyPEdjs+8yH+a8Gzz7jCpMre-6k21aE_sdQ@mail.gmail.com>
In-Reply-To: <CALs-HssAAgbdUuoCyPEdjs+8yH+a8Gzz7jCpMre-6k21aE_sdQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 3 Oct 2023 01:40:30 -0700
Message-ID: <CAHBxVyEOvJy8gBfqW9v96XwW6_XFoWb3RdrL=AqMHJLHS7n2ww@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: Evan Green <evan@rivosinc.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ron Minnich <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_014045_343640_19B58BCD 
X-CRM114-Status: GOOD (  39.35  )
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

T24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgOTo0OOKAr0FNIEV2YW4gR3JlZW4gPGV2YW5Acml2b3Np
bmMuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgU2VwIDI4LCAyMDIzIGF0IDEyOjQ54oCvQU0gQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4KPiA+
IE9uIDI2LzA5LzIwMjMgMjM6NDMsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgU2Vw
IDI2LCAyMDIzIGF0IDg6MDPigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IFNpbmNlIGNvbW1pdCA2MWNhZGI5ICgiUHJvdmlkZSBu
ZXcgZGVzY3JpcHRpb24gb2YgbWlzYWxpZ25lZCBsb2FkL3N0b3JlCj4gPiA+PiBiZWhhdmlvciBj
b21wYXRpYmxlIHdpdGggcHJpdmlsZWdlZCBhcmNoaXRlY3R1cmUuIikgaW4gdGhlIFJJU0MtViBJ
U0EKPiA+ID4+IG1hbnVhbCwgaXQgaXMgc3RhdGVkIHRoYXQgbWlzYWxpZ25lZCBsb2FkL3N0b3Jl
IG1pZ2h0IG5vdCBiZSBzdXBwb3J0ZWQuCj4gPiA+PiBIb3dldmVyLCB0aGUgUklTQy1WIGtlcm5l
bCB1QUJJIGRlc2NyaWJlcyB0aGF0IG1pc2FsaWduZWQgYWNjZXNzZXMgYXJlCj4gPiA+PiBzdXBw
b3J0ZWQuIEluIG9yZGVyIHRvIHN1cHBvcnQgdGhhdCwgdGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0
IGZvciBTLW1vZGUKPiA+ID4+IGhhbmRsaW5nIG9mIG1pc2FsaWduZWQgYWNjZXNzZXMgYXMgd2Vs
bCBzdXBwb3J0IGZvciBwcmN0bChQUl9VTkFMSUdOKS4KPiA+ID4+Cj4gPiA+PiBIYW5kbGluZyBt
aXNhbGlnbmVkIGFjY2VzcyBpbiBrZXJuZWwgYWxsb3dzIGZvciBhIGZpbmVyIGdyYWluIGNvbnRy
b2wKPiA+ID4+IG9mIHRoZSBtaXNhbGlnbmVkIGFjY2Vzc2VzIGJlaGF2aW9yLCBhbmQgdGhhbmtz
IHRvIHRoZSBwcmN0bCBjYWxsLCBjYW4KPiA+ID4+IGFsbG93IGRpc2FibGluZyBtaXNhbGlnbmVk
IGFjY2VzcyBlbXVsYXRpb24gdG8gZ2VuZXJhdGUgU0lHQlVTLiBVc2VyCj4gPiA+PiBzcGFjZSBj
YW4gdGhlbiBvcHRpbWl6ZSBpdHMgc29mdHdhcmUgYnkgcmVtb3Zpbmcgc3VjaCBhY2Nlc3MgYmFz
ZWQgb24KPiA+ID4+IFNJR0JVUyBnZW5lcmF0aW9uLgo+ID4gPj4KPiA+ID4+IEN1cnJlbnRseSwg
dGhpcyBzZXJpZXMgaXMgdXNlZnVsIGZvciBwZW9wbGUgdGhhdCB1c2VzIGEgU0JJIHRoYXQgZG9l
cwo+ID4gPj4gbm90IGhhbmRsZWQgbWlzYWxpZ25lZCB0cmFwcy4gSW4gYSBuZWFyIGZ1dHVyZSwg
dGhpcyBzZXJpZXMgd2lsbCBtYWtlCj4gPiA+PiB1c2UgYSBTQkkgZXh0ZW5zaW9uIFsxXSBhbGxv
d2luZyB0byByZXF1ZXN0IGRlbGVnYXRpb24gb2YgdGhlCj4gPiA+PiBtaXNhbGlnbmVkIGxvYWQv
c3RvcmUgdHJhcHMgdG8gdGhlIFMtbW9kZSBzb2Z0d2FyZS4gVGhpcyBleHRlbnNpb24gaGFzCj4g
PiA+PiBiZWVuIHN1Ym1pdHRlZCBmb3IgcmV2aWV3IHRvIHRoZSByaXNjdiB0ZWNoLXBycyBncm91
cC4gQW4gT3BlblNCSQo+ID4gPj4gaW1wbGVtZW50YXRpb24gZm9yIHRoaXMgc3BlYyBpcyBhdmFp
bGFibGUgYXQgWzJdLgo+ID4gPgo+ID4gPiBGb3IgbXkgb3duIGVkdWNhdGlvbiwgaG93IGRvZXMg
dGhlIG5ldyBTQkkgY2FsbCBiZWhhdmUgd2l0aCByZXNwZWN0IHRvCj4gPiA+IG11bHRpcGxlIGhh
cnRzPyBEb2VzIGEgY2FsbCB0byBjaGFuZ2UgYSBmZWF0dXJlIHBlcmZvcm0gdGhhdCBjaGFuZ2UK
PiA+ID4gYWNyb3NzIGFsbCBoYXJ0cywgb3IganVzdCB0aGUgaGFydCB0aGUgU0JJIGNhbGwgd2Fz
IG1hZGUgb24/IElmIHRoZQo+ID4gPiBhbnN3ZXIgaXMgImFsbCBoYXJ0cyIsIHdoYXQgaWYgbm90
IGFsbCBoYXJ0cyBhcmUgZXhhY3RseSB0aGUgc2FtZSwgYW5kCj4gPiA+IHNvbWUgY2FuIGVuYWJs
ZSB0aGUgZmVhdHVyZSBzd2l0Y2ggd2hpbGUgb3RoZXJzIGNhbm5vdD8gQWxzbyBpZiB0aGUKPiA+
ID4gYW5zd2VyIGlzICJhbGwgaGFydHMiLCBkb2VzIGl0IGFsc28gYXBwbHkgdG8gaG90cGx1Z2dl
ZCBjcHVzLCB3aGljaAo+ID4gPiBtYXkgbm90IGhhdmUgZXZlbiBleGlzdGVkIGF0IGJvb3QgdGlt
ZT8KPiA+Cj4gPiBEZXBlbmRpbmcgb24gdGhlIGZlYXR1cmUsIHRoZXkgY2FuIGJlIGVpdGhlciBn
bG9iYWwgKGFsbCBoYXJ0cykgb3IKPiA+IGxvY2FsIChjYWxsaW5nIGhhcnQpLiBUaGUgbWVkZWxl
ZyByZWdpc3RlciBpcyBwZXIgaGFydCBhbmQgdGh1cwo+ID4gbWlzYWxpZ25lZCBsb2FkL3N0b3Jl
IGRlbGVnYXRpb24gZm9yIFMtbW9kZSBpcyBhbHNvIHBlciBoYXJ0Lgo+Cj4gV2Ugc2hvdWxkIHBy
b2JhYmx5IHN0YXRlIHRoaXMgaW4gdGhlIHNwZWMgdXBkYXRlIHRoZW4sIGJvdGggZ2VuZXJhbGx5
Cj4gYW5kIGZvciBlYWNoIHNwZWNpZmljIGZlYXR1cmUgYWRkZWQuIE90aGVyd2lzZSBmaXJtd2Fy
ZSB3cml0ZXJzIGFyZQo+IGxlZnQgbm90IGtub3dpbmcgaWYgdGhleSdyZSBzdXBwb3NlZCB0byBz
cHJlYWQgYSBmZWF0dXJlIGFjcm9zcyB0byBhbGwKPiBjb3JlcyBvciBub3QuCj4KCklmIGEgZmVh
dHVyZSBpcyByZXF1aXJlZCB0byB1cGRhdGUgYW55IENTUiwgaXQgbXVzdCBiZSBwZXIgaGFydCBv
bmx5LgpUaGUgc3VwZXJ2aXNvciBzb2Z0d2FyZQppcyBhd2FyZSBvZiB0aGUgc3RhdGUgb2YgZWFj
aCBoYXJ0IGFuZCBpdCBzaG91bGQgaW52b2tlIGl0IGZyb20gYWxsCnRoZSBwcmVzZW50IGhhcnRz
LgoKRG9pbmcgaXQgaW4gTS1tb2RlIHdpbGwgcmVzdWx0IGluIE0tbW9kZSBJUElzIGFuZCBzZWVt
cyByYWN5IHdpdGggd2hhdAprZXJuZWwgbWlnaHQgYmUgZG9pbmcgYXQgdGhhdCB0aW1lLgoKPiA+
Cj4gPgo+ID4gPgo+ID4gPiBXaGF0IGhhcHBlbnMgaWYgYSBoYXJ0IGdvZXMgdGhyb3VnaCBhIGNv
bnRleHQgbG9zcyBldmVudCwgbGlrZQo+ID4gPiBzdXNwZW5kL3Jlc3VtZT8gSXMgdGhlIHNldHRp
bmcgZXhwZWN0ZWQgdG8gYmUgc3RpY2t5LCBvciBpcyB0aGUga2VybmVsCj4gPiA+IGV4cGVjdGVk
IHRvIHJlcGxheSB0aGVzZSBjYWxscz8KPiA+Cj4gPiBUaGF0IGlzIGEgZ29vZCBxdWVzdGlvbiB0
aGF0IHdlIGRpZCBub3QgYWN0dWFsbHkgY2xhcmlmaWVkIHlldC4gVGhhbmtzCj4gPiBmb3IgcmFp
c2luZyBpdCAhCj4KCklNTywgaXQgc2hvdWxkIGJlIHN0aWNreSB1bnRpbCBhIHJlc2V0LiBJIHdv
dWxkIGJlIGludGVyZXN0ZWQgdG8gaGVhcgpvdGhlciB0aG91Z2h0cyB0aG91Z2ggaWYgdGhlcmUg
aXMgYSBub24tc3RpY2t5CnVzZS1jYXNlLgoKCj4gTm8gcHJvYmxlbSEgVGhpcyBtYXkgYWxzbyBu
ZWVkIHRvIGJlIHNwZWNpZmllZCBwZXItZmVhdHVyZSBpbiB0aGUKPiBzcGVjLiBJIGhhdmUgYSB2
YWd1ZSBodW5jaCB0aGF0IGl0J3MgYmV0dGVyIHRvIGFzayB0aGUga2VybmVsIHRvIGRvIGl0Cj4g
b24gcmVzdW1lLCB0aG91Z2ggaWRlYWxseSB3ZSdkIGhhdmUgdGhlIHRlcm1pbm9sb2d5IChhbmQg
SSBkb24ndCB0aGluawo+IHdlIGRvPykgdG8gc3BlY2lmeSBleGFjdGx5IHdoaWNoIHBvaW50cyBj
b25zdGl0dXRlIGEgY29udGV4dCBsb3NzLgo+IE1vc3RseSBJJ20gcmVtZW1iZXJpbmcgdGhlIHg4
NiBhbmQgQVJNIHRyYW5zaXRpb24gZnJvbSBTMywgd2hlcmUgbG90cwo+IG9mIGZpcm13YXJlIGNv
ZGUgcmFuIGF0IHJlc3VtZSwgdG8gUzBpeC1saWtlIHBvd2VyIHN0YXRlcywgd2hlcmUKPiB0aGlu
Z3MgcmVzdW1lZCBkaXJlY3RseSBpbnRvIHRoZSBPUyBhbmQgdGhleSBoYWQgdG8gZmlndXJlIG91
dCBob3cgdG8KPiBkbyBpdCB3aXRob3V0IGZpcm13YXJlLiBUaGUgdmFndWUgaHVuY2ggaXMgdGhh
dCBrZWVwaW5nIHRoZSBsYXVuZHJ5Cj4gbGlzdCBvZiB0aGluZ3MgZmlybXdhcmUgbXVzdCBkbyBv
biByZXN1bWUgbG93IG1pZ2h0IGtlZXAgdXMgZnJvbQo+IGdldHRpbmcgaW4gUzBpeCdzIHdheSwg
YnV0IGl0J3MgYWxsIHNvIHNwZWN1bGF0aXZlIGl0J3MgaGFyZCB0byBrbm93Cj4gaWYgaXQncyBy
ZWFsbHkgYSB1c2VmdWwgaHVuY2ggb3Igbm90Lgo+Cj4gLUV2YW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
