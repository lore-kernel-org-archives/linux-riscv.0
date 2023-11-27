Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E46C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 12:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5uws5VCSvbh3oDZSrCE1HRi0IG+J+f1HDXnpU6CNaw=; b=b2WDyPSGcFDVaH
	jjP8WOKMHlOGxNDo5Jjvc1jCV4oBZTRQEZ4etUjyFetqIXx0hahshJb2u2LV3zQSXrZ7CzooLQish
	kaHX3saxBuQw/ggmPt25p5H4/oS3N0wsi9rxgqLZPfMd5obK1OC88FbAxqT9eYRvTDAwmn5PhMfc5
	/dt5rqntYXcQy13+zu+wtDBJcd68sYJf0x1M4aF7/sgfqu7NnF3zK7P24jgO6NlA+JPoEN2eKlNit
	nidFRlTE8lYrDZ8vOOvTgeLAnxcaWA2V22d1KmjWjBJan+OLSKrqXrc/t4LXZe2MwCjKqvVoEY6kB
	So77hkQARicJ+ibwZFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bCQ-002VCL-2u;
	Mon, 27 Nov 2023 12:58:54 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bCN-002VB3-35
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 12:58:53 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3020795a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 04:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1701089928; x=1701694728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb7LG4+VC86lAK3ACNOsqD4c+4Q3Zl+YX9v/JCc2Lsw=;
        b=K9MXHXGwSPW2DK4yZrPCryh/dXsSHLCqdv2ImvNmsukXAW/yQuJTx4/2BoJdEE0+lo
         TD9qL2I9tdZCag/s89Z8DT/55bIKlpJ32H3sIrMeV72NjSkcbP1v2kd9PFnJ+IT31yuX
         6Ihjk3ssVwD1BxRsnBBTMYQKjtDH2Lw4iqfcS24+rT9D2SLsdhBmB027OGOIQRQyLhMK
         lrZMsdZ+krggMBkTfWFyPsAYi6t3aCW7B52EriyjZXbQW+8+uLVng4KituwGZlnDLDT3
         U7XcsyKEQC/ozEnP0ffaek7DUz8H8iPx3TfZxfURuiTa+kkznTl21l3H0lLjr6VcPk7p
         5M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089928; x=1701694728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb7LG4+VC86lAK3ACNOsqD4c+4Q3Zl+YX9v/JCc2Lsw=;
        b=WfixJ1xhGpdGen3TII3ONeJVqMCKAZr1uhG8wo2JCWXMMw2HmAmytoJT58Oy6aapT0
         0OeBKfXSLlWMkY9BxgIoMfwPapZkhMOo1W9xQ0uxLSqVmW5Mfy/rhnwli4hQ8M3CFhlO
         ICplNm1W5y0aUmCtlPKvht52fQQ8PwMY68Y4Tgs6D4wwTbFAqjHy0aM2SvMo8Jmz7+6J
         IKzqyQIx3zXZmAmtM2I5aeKahZlx78BbKmzEyhwWR0wpXUn4Mjc02gceUAwuNNhOnhYz
         aR6cKvO61fFK2lSV9sStyNdu+VBCCdi5I4e4xmmNxce5t3Q/L5jQcUKoX+H+oBmtHmx4
         u0xA==
X-Gm-Message-State: AOJu0YxQ2nosAZMukeFAt11HyHNL8vDVy7SyYIYvOfpqbeLFG2PliMqg
	wW1MOAS9H1MWclrTZ+iVo+Lwbh7Rz9LOMEUzt1u8fA==
X-Google-Smtp-Source: AGHT+IED72gn7lrICwt9dspFALErw3zzL/Mo+GIDENL1lqLFyfYwPcVMIv337Xlw9EVnLjHJzGLwS8GX9uQZvPG71ps=
X-Received: by 2002:a17:90b:1a8d:b0:280:c9a1:861e with SMTP id
 ng13-20020a17090b1a8d00b00280c9a1861emr13211345pjb.13.1701089928629; Mon, 27
 Nov 2023 04:58:48 -0800 (PST)
MIME-Version: 1.0
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu> <20231127-process-dinginess-cea6dd652b99@wendy>
In-Reply-To: <20231127-process-dinginess-cea6dd652b99@wendy>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 27 Nov 2023 13:58:36 +0100
Message-ID: <CAEg0e7jjLCEL28exKqWBUAMSRj_M9bSBxmOM-1Bu-Fpfmd8hjQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <apatel@ventanamicro.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>, 
	Guo Ren <guoren@kernel.org>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>, 
	Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_045851_997866_4BA8A6E1 
X-CRM114-Status: GOOD (  30.98  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgMTE6MzfigK9BTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gRnJpLCBOb3YgMjQsIDIw
MjMgYXQgMDg6MjE6MzdBTSArMDEwMCwgQ2hyaXN0b3BoIE11ZWxsbmVyIHdyb3RlOgo+ID4gRnJv
bTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cj4gPgo+
ID4gVGhlIHVwY29taW5nIFJJU0MtViBTc2R0c28gc3BlY2lmaWNhdGlvbiBpbnRyb2R1Y2VzIGEg
Yml0IGluIHRoZSBzZW52Y2ZnCj4gPiBDU1IgdG8gc3dpdGNoIHRoZSBtZW1vcnkgY29uc2lzdGVu
Y3kgbW9kZWwgYXQgcnVuLXRpbWUgZnJvbSBSVldNTyB0byBUU08KPiA+IChhbmQgYmFjaykuIFRo
ZSBhY3RpdmUgY29uc2lzdGVuY3kgbW9kZWwgY2FuIHRoZXJlZm9yZSBiZSBzd2l0Y2hlZCBvbiBh
Cj4gPiBwZXItaGFydCBiYXNlIGFuZCBtYW5hZ2VkIGJ5IHRoZSBrZXJuZWwgb24gYSBwZXItcHJv
Y2Vzcy90aHJlYWQgYmFzZS4KPiA+Cj4gPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgYmFzaWMgU3Nk
dHNvIHN1cHBvcnQgYW5kIGFkZHMgYSBwcmN0bCBBUEkgb24gdG9wCj4gPiBzbyB0aGF0IHVzZXIt
c3BhY2UgcHJvY2Vzc2VzIGNhbiBzd2l0Y2ggdG8gYSBzdHJvbmdlciBtZW1vcnkgY29uc2lzdGVu
Y3kKPiA+IG1vZGVsICh0aGFuIHRoZSBrZXJuZWwgd2FzIHdyaXR0ZW4gZm9yKSBhdCBydW4tdGlt
ZS4KPiA+Cj4gPiBJIGFtIG5vdCBzdXJlIGlmIG90aGVyIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBz
d2l0Y2hpbmcgdGhlIG1lbW9yeQo+ID4gY29uc2lzdGVuY3kgbW9kZWwgYXQgcnVuLXRpbWUsIGJ1
dCBkZXNpZ25pbmcgdGhlIHByY3RsIEFQSSBpbiBhbgo+ID4gYXJjaC1pbmRlcGVuZGVudCB3YXkg
YWxsb3dzIHJldXNpbmcgaXQgaW4gdGhlIGZ1dHVyZS4KPiA+Cj4gPiBUaGUgcGF0Y2hzZXQgYWxz
byBjb21lcyB3aXRoIGEgc2hvcnQgZG9jdW1lbnRhdGlvbiBvZiB0aGUgcHJjdGwgQVBJLgo+ID4K
PiA+IFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBzZWNvbmQgZHJhZnQgb2YgdGhlIFNzZHRz
byBzcGVjaWZpY2F0aW9uCj4gPiB3aGljaCB3YXMgcHVibGlzaGVkIHJlY2VudGx5IG9uIGFuIFJW
SSBsaXN0Ogo+ID4gICBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtYXJjaC1yZXZpZXcv
bWVzc2FnZS8xODMKPiA+IE5vdGUsIHRoYXQgdGhlIFNzZHRzbyBzcGVjaWZpY2F0aW9uIGlzIGlu
IGRldmVsb3BtZW50IHN0YXRlCj4gPiAoaS5lLiwgbm90IGZyb3plbiBvciBldmVuIHJhdGlmaWVk
KSB3aGljaCBpcyBhbHNvIHRoZSByZWFzb24KPiA+IHdoeSBJIG1hcmtlZCB0aGUgc2VyaWVzIGFz
IFJGQy4KPiA+Cj4gPiBPbmUgYXNwZWN0IHRoYXQgaXMgbm90IGNvdmVyZWQgaW4gdGhpcyBwYXRj
aHNldCBpcyB2aXJ0dWFsaXphdGlvbi4KPiA+IEl0IGlzIHBsYW5uZWQgdG8gYWRkIHZpcnR1YWxp
emF0aW9uIHN1cHBvcnQgaW4gYSBsYXRlciB2ZXJzaW9uLgo+ID4gSGludHMvc3VnZ2VzdGlvbnMg
b24gaG93IHRvIGltcGxlbWVudCB0aGlzIHBhcnQgYXJlIHZlcnkgbXVjaAo+ID4gYXBwcmVjaWF0
ZWQuCj4gPgo+ID4gQ2hyaXN0b3BoIE3DvGxsbmVyICg1KToKPgo+IEkga25vdyB0aGlzIGlzIGFu
IFJGQywgYnV0IGl0IGNvdWxkIHByb2JhYmx5IGRvIHdpdGggYSBiaXQgbW9yZSBjb21waWxlCj4g
dGVzdGluZywgYXM6Cj4KPiA+ICAgUklTQy1WOiBBZGQgYmFzaWMgU3NkdHNvIHN1cHBvcnQKPgo+
IFRoaXMgcGF0Y2ggZG9lc24ndCBidWlsZCBmb3IgcnY2NCBhbGxtb2Rjb25maWcKPgo+ID4gICBS
SVNDLVY6IEV4cG9zZSBTc2R0c28gdmlhIGh3cHJvYmUgQVBJCj4KPiBUaGlzIG9uZSBzZWVtcyB0
byBidWlsZCBmaW5lCj4KPiA+ICAgdWFwaTogcHJjdGw6IEFkZCBuZXcgcHJjdGwgY2FsbCB0byBz
ZXQvZ2V0IHRoZSBtZW1vcnkgY29uc2lzdGVuY3kKPiA+ICAgICBtb2RlbAo+ID4gICBSSVNDLVY6
IEltcGxlbWVudCBwcmN0bCBjYWxsIHRvIHNldC9nZXQgdGhlIG1lbW9yeSBjb25zaXN0ZW5jeSBt
b2RlbAo+ID4gICBSSVNDLVY6IHNlbGZ0ZXN0czogQWRkIERUU08gdGVzdHMKPgo+IFRoZXNlIGRv
bid0IGJ1aWxkIGZvcjoKPiBydjMyIGRlZmNvbmZpZwo+IHJ2NjQgYWxsbW9kY29uZmlnCj4gcnY2
NCBub21tdQoKVGhhbmtzIGZvciByZXBvcnRpbmcgdGhpcy4gWW91IGFyZSBhYnNvbHV0ZWx5IHJp
Z2h0LgpJbiBteSBkZWZlbnNlLCB0aGlzIHBhdGNoc2V0IHdhcyBjb21waWxlLXRlc3RlZCBhbmQg
Z290IHNvbWUgbGltaXRlZApydW4tdGltZSB0ZXN0aW5nIGluIFFFTVUuCkJ1dCBhZnRlciB0aGF0
LCBJIHdyb3RlIHRoZSBkb2N1bWVudGF0aW9uLCB3aGljaCB0cmlnZ2VyZWQgYSByZW5hbWluZwpv
ZiBzZXZlcmFsIGZ1bmN0aW9uL21hY3JvIG5hbWVzLAphbmQgdGhlc2UgY2hhbmdlcyBkaWQgbm90
IHNlZSBhZGVxdWF0ZSB0ZXN0aW5nLiBJIGFtIHNvcnJ5IGZvciB0aGF0LgoKSSd2ZSBhbHJlYWR5
IGZpeGVkIHRoZSBwYXRjaGVzIChhZGRyZXNzaW5nIHRoZSBpc3N1ZXMgeW91IGhhdmUKcmVwb3J0
ZWQsIHBsdXMgb3RoZXIgc21hbGwgaXNzdWVzKS4KVG8gbm90IGRpc3RyYWN0IHRoZSBvbmdvaW5n
IGRpc2N1c3Npb24sIEkgd2lsbCBub3Qgc2VuZCBhbiB1cGRhdGVkCnBhdGNoc2V0IHJpZ2h0IG5v
dy4KSW4gY2FzZSB5b3UgYXJlIGludGVyZXN0ZWQsIHlvdSBjYW4gZmluZCB0aGUgbGF0ZXN0IGNo
YW5nZXMgKHJlYmFzZWQKb24gdXBzdHJlYW0vbWFzdGVyKSBoZXJlOgogIGh0dHBzOi8vZ2l0aHVi
LmNvbS9jbXVlbGxuZXIvbGludXgvdHJlZS9zc2R0c28KSSd2ZSBhbHNvIGV4dGVuZGVkIG15IGxv
Y2FsIGNvbXBpbGUtdGVzdCBzY3JpcHQgdG8gaW5jbHVkZSBhbGwKbWVudGlvbmVkIGNvbmZpZ3Mu
CgpJbiBjYXNlIHlvdSB3YW50IHRvIHBsYXkgYSBiaXQgd2l0aCB0aGVzZSBjaGFuZ2VzLCB5b3Ug
Y2FuIGFsc28gaGF2ZSBhCmxvb2sgYXQgdGhlIFFFTVUKcGF0Y2hzZXQsIHdoaWNoIGFsc28gZ290
IHN1cHBvcnQgZm9yIHRoZSBwcmN0bCAod2hpY2ggaXMgbm90IHBhcnQgb2YKdGhlIHB1Ymxpc2hl
ZCBtYWlscGF0Y2gpOgogIGh0dHBzOi8vZ2l0aHViLmNvbS9jbXVlbGxuZXIvcWVtdS90cmVlL3Nz
ZHRzbwpXaXRoIHRoZXNlIGNoYW5nZXMsIHlvdSBjYW4gcnVuIHRoZSBrZXJuZWwgc2VsZi10ZXN0
IGJpbmFyeSBpbgp1c2VyLW1vZGUgZW11bGF0aW9uLgoKQlIKQ2hyaXN0b3BoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
