Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF904CD1283
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHyHWSkisJ+5pREizEFxJ6K7RyjaWVbDQNvjqko4iG8=; b=geaGVKBxQvIEXw
	OeOlP+cbmvNwQcsBW7db88XrKYv2qaKiRuFmM/PqFU+qWr30ykKFE7z4hw8X0NgeQtKjNjbSeCYi6
	QHJ3/I0XXJ8O9H24g+owvpNdSyKc8ZiFq3oJiZPQGxd9ihxkowPQL4sYMHi0DxpiVQF6sQ65A2QDC
	W5SjtCDeHau5ybRcdPQ2XdKjNj4MZJ9OFPRDZXCmh+axnC0z4Bwv1pG5in1U8PwkoRSYoqphLfvrj
	b5qHjNX3lETCkn3YjcVwfj3iVXU60MfW0cy/cBy9hh5hKs8rDiYEi+l5PeILD4P4Ok4foDC0a+UqH
	JGcPCHW0NKOi87/+6+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDNa-00000006LHW-0jD9;
	Tue, 26 Mar 2024 20:26:42 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDMI-00000006KU3-19fW
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 20:25:28 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7e057fb0b69so1771172241.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711484719; x=1712089519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lrTejwUO7gSf4EEEECNjtBUVn0RqW8Izhk85EDEe30=;
        b=Nq0rvqdu+rVVfb+ghkgrzn0MCt6gs0zsgRCa1k4AFsQOLLsASiSea5SecEiMTYqZwW
         dIBqzLnbWBkP1AFuCeveue+PhRuaoFw+/f9MumH7T/YRvyiDmK4n8dhrdMgdTSSAMN4Q
         31mQt+xbW4cBuzcKj3JfqICNeACCYYz7BDYAxGuHOwkboGZCDSZRiwg6boiWY1WGpazP
         C9bSppWaN5zflKT7yQ4pfi9660FhFcfbCG8hHpErMlAtKn2zKHhoRrPGb25uJU+LN73B
         Tf/VouRcu5en65pZ35WZb98dXALwYMXaxEwYsyVBRLkt+v3CJToNw/qgxnB6BLkWnykT
         2Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484719; x=1712089519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lrTejwUO7gSf4EEEECNjtBUVn0RqW8Izhk85EDEe30=;
        b=U/amZqdIPpdV5Ut158BgOVBsP4ECJpNgCChvRjaWDqZWaSm7rEUrH+LB62xYYfXkPn
         flDSJqTfIJwG2iinShaG9FHc/yoHr9IL3gkaAl/ixhI9Yw6VRTxB1asGsD9DdOaYQqtv
         KDwhu/P7okqiG2kQ+I5j15mCxFpQfV9uQ3UGSU0UIltTYDbWIvXoRj3zJd3YNMX5ccNw
         x7KdkjuX6AMwuhMrVPSWZqXCRvsjuIW96firPeflIw/5iz9/BggEvZWOILOCfkRpPl2I
         EGr5E+jW4kAu9xNhWjEFqVoNVWmJDzg6M0VS35P8boXj+NJfQsLzoaFCgFoOJ0q7o5tU
         kU2A==
X-Forwarded-Encrypted: i=1; AJvYcCUvCrzt0sQ7mdkL8qgZ7xBNh9lHipEeS1TIyFfvs9bHj5wEjDvYYszYXxtG+B7lZaFIJA0KWqNz68TbUuo/Dh4Q1ScfospVBX8WEEoMHTPS
X-Gm-Message-State: AOJu0YwkkXe6gKU5z+XjwoP4XQCGJTCVGK4cs+NZ/krU3OrvIPcBPo+D
	EEjKdKIBpw7QOIQ/q0BXx1igCICUNXKWYaQdS6/iXLG8XvpYhODYetsOR9o/HEDs8OUelvuh3wO
	CXy/syZiaQ2lXgzRH/XKSIvHpJcY=
X-Google-Smtp-Source: AGHT+IGIHS+kBqSr20euVi3Yv8PWhLs+WmpCLWNT5DyowQ3IxTEGgzyjDhr+4ON8nLie8Gz5xQE5hNOKE/BqaIUONIQ=
X-Received: by 2002:a67:b602:0:b0:476:d9f2:f9aa with SMTP id
 d2-20020a67b602000000b00476d9f2f9aamr1057538vsm.0.1711484719349; Tue, 26 Mar
 2024 13:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <a49546e8-6749-4458-98da-67fd37b7df18@rivosinc.com>
 <mhng-a3b495e6-aca6-4137-a3c1-8fcacafd8596@palmer-ri-x1c9a>
 <ZfLxip96o5MVjHAF@xhacker> <ZfL1buKdDI-p5b9X@xhacker> <ZgGteKG_a3KGn5wV@xhacker>
In-Reply-To: <ZgGteKG_a3KGn5wV@xhacker>
From: Charles Lohr <lohr85@gmail.com>
Date: Tue, 26 Mar 2024 13:25:08 -0700
Message-ID: <CAGu26P_tUpSvXqdSz3pOdPNHbe6MyEYJ2XCHo8pD8jeE5pT+_Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, cleger@rivosinc.com, 
	Conor Dooley <conor@kernel.org>, samuel.holland@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com, dlemoal@kernel.org, 
	Bjorn Topel <bjorn@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_132522_753996_A26B8F7C 
X-CRM114-Status: GOOD (  55.56  )
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

SmlzaGVuZywgYXJlIHlvdSB1c2luZyBtdXNsIG9yIHVjbGliYz8gSSd2ZSBiZWVuIGhhdmluZyBk
aWZmaWN1bHR5CmdldHRpbmcgbmV3IHZlcnNpb25zIG9mIGVhY2ggd29ya2luZyB3aXRoIHRoZSBu
ZXdlciBrZXJuZWxzIHdpdGgKc3lzdGVtIGNhbGxzIG5vdCBsaW5pbmcgdXAuCgpBbHNvLCBpcyB0
aGVyZSBhIGJldHRlciBwbGFjZSB0byBhc2sgcXVlc3Rpb25zIGFib3V0IHRoZSBtb3JlCnVzZXIt
c3BhY3kgc3R1ZmY/ICBUaGF0J3MgcmVhbGx5IHdoZXJlIEkndmUgYmVlbiBzdHJ1Z2dsaW5nIHRv
Cm1haW50YWluIHRoaW5ncywga2VlcGluZyBidWlsZHJvb3Qgd29ya2luZyB3aGVuIHRhcmdldGlu
ZyBSVjMyIE5PTU1VLgpUaGFua2Z1bGx5IGEgbG90IG9mIHRoZSBzdGlja2llc3QgcHJvYmxlbXMg
aGF2ZSBhbGwgYmVlbiB1cHN0cmVhbWVkLgoKQ2hhcmxlcwoKT24gTW9uLCBNYXIgMjUsIDIwMjQg
YXQgMTA6MTLigK9BTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gT24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgMDk6MDI6NDNQTSArMDgwMCwgSmlzaGVuZyBaaGFu
ZyB3cm90ZToKPiA+IE9uIFRodSwgTWFyIDE0LCAyMDI0IGF0IDA4OjQ2OjIxUE0gKzA4MDAsIEpp
c2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDA4OjM4OjUw
QU0gLTA4MDAsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgMjcgRmViIDIw
MjQgMDE6MTE6NDEgUFNUICgtMDgwMCksIGNsZWdlckByaXZvc2luYy5jb20gd3JvdGU6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIDI2LzAyLzIwMjQgMjA6MDAsIENoYXJsZXMgTG9o
ciB3cm90ZToKPiA+ID4gPiA+ID4gV09BSCEgUGxlYXNlIERPIE5PVCBkZXByZWNhdGUgTk9NTVUu
IEkgdXNlIHRoZSBOT01NVSBidWlsZCBjb25zdGFudGx5Cj4gPiA+ID4gPiA+IGFuZCBOT01NVSBM
aW51eCBvbiBSSVNDLVYgaXMgdGhlIGF2ZW51ZSB1c2VkIGJ5IG1hbnkgRlBHQSBzb2Z0IGNvcmVz
Cj4gPiA+ID4gPiA+IGZvciBMaW51eCwgYXMgd2VsbCBhcyBzb21lIGxpbWl0ZWQgc3lzdGVtcy4K
PiA+ID4gPgo+ID4gPiA+IE9LLgo+ID4gPiA+Cj4gPiA+ID4gSSBqdXN0IGJ1aWxkIHRlc3QgdGhp
cyBzdHVmZiwgYXMgSSBkb24ndCByZWFsbHkgaGF2ZSBhIHVzZSBmb3IgaXQKPiA+ID4gPiBwZXJz
b25hbGx5LiAgSSBmaWd1cmVkIGlmIG5vYm9keSdzIHJlcG9ydGluZyBidWdzIHRoZW4gcHJvYmFi
bHkgaXQncyBicm9rZW4KPiA+ID4gPiBhbmQgbm9ib2R5J3Mgbm90aWNlZCBiZWNhdXNlIG5vYm9k
eSdzIHVzaW5nIGl0Lgo+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgZ2V0IG5ldyBjb3BpZXMgb2YgdGhl
IGtlcm5lbCB3aGVuIHRoZXJlIGFyZSByZWxlYXNlcyBhbmQgdGVzdCB0aGVtCj4gPiA+ID4gPiA+
IGZyZXF1ZW50bHkgdG8gbWFrZSBzdXJlIGV2ZXJ5dGhpbmcgaXMgc3RpbGwgd29ya2luZyBhcyBl
eHBlY3RlZC4KPiA+ID4gPgo+ID4gPiA+IEknZCBhY3R1YWxseSBleHBlY3RlZCBpdCB0byBiZSBi
cm9rZW4sIGJ1dCBJIGd1ZXNzIHdlIG1hbmFnZWQgdG8gYXZvaWQKPiA+ID4gPiBzY3Jld2luZyB0
aGluZ3MgdXAgOykKPiA+ID4gPgo+ID4gPiA+ID4gPiBGb3IgdXMgd2UganVzdCBkb24ndCBjYXJl
IGFib3V0IFhJUC4gSSBtZWFuIGlmIHNvbWVvbmUgZGlkIHB1c2ggaXQKPiA+ID4KPiA+ID4gSSBk
b24ndCBjYXJlIFhJUCBlaXRoZXIsIGFuZCBJTUhPIHRoZSBYSVAncyBtYWludGVuYW5jZSBlZmZv
cnQgaXMgbXVjaAo+ID4gPiBiaWdnZXIgdGhhbiBOT01NVShqdXN0IGNoZWNrIHRoZSB2YXJpb3Vz
IFhJUF9GSVhVUCogb3IgQ09ORklHX1hJUF9LRVJORUwKPiA+ID4gbWFjcm9zIGFyb3VuZCBsb3ds
ZXZlbCBwZ3RhYmxlLmgsIHBhZ2UuaCkuIElmIHdlIGNhbiByZW1vdmUgWElQLCB0aGUKPiA+ID4g
Y29kZSByZWFkYWJpbGl0eSB3aWxsIGJlIG11Y2ggYmV0dGVyLgo+ID4gPgo+ID4gPiBPciBzZW5k
aW5nIG91dCBhIHNpbWlsYXIgWElQIGRlcHJlY2F0aW9uIHBhdGNoIHRvIHNlZSB3aGV0aGVyIHRo
ZXJlJ3MKPiA+ID4gYW55IGNvbXBsYWluID8gOykKPiA+ID4KPiA+ID4gPiA+ID4gdGhyb3VnaCB0
byBmcnVpdGlvbiwgSSdkIGFsc28gdGVzdCBhbmQgdXNlIGl0LCBidXQgSSB1cmdlIHlvdSBwbGVh
c2UKPiA+ID4gPiA+ID4gZG8gbm90IGRlcHJlY2F0ZSB0aGlzLiAgV2hpbGUgaXQncyBzb21ldGlt
ZXMgbmVlZGVkIGEgYml0IG9mIGEKPiA+ID4KPiA+ID4gKzEgZm9yIHVyZ2UgdGhlIHVwc3RyZWFt
IHBsZWFzZSBkbyBub3QgZGVwcmVjYXRlIE5PTU1VLgo+ID4gPgo+ID4gPiBCZXNpZGVzIHRoZSBz
b2Z0KEZQR0EpIGNvcmUgbWVudGlvbmVkIGJ5IENoYXJsZXMsIGhlcmUgaXMgYW5vdGhlciByZWFs
Cj4gPgo+ID4gQW5kIEknZCBsaWtlIHRvIHdyaXRlIG1vcmUgYWJvdXQgc29mdCBjb3JlOiByaXNj
diBpcyBhIGZyZWUgYW5kIG9wZW4KPiA+IElTQSwgdGhpcyBtYWtlIGl0IHJlYWxseSBnb29kIGZv
ciBlZHVjYXRpb24sIGZvciBzaW1wbGUgcmlzY3YKPiA+IGltcGxlbWVudGF0aW9uIG9yIGVtdWxh
dG9yLiBPbmNlIHJpc2N2IElNQSBpcyBpbXBsZW1lbnRlZChldmVuIGlmIE1NVSwKPiA+IGNhY2hl
LCBUTEIgc3R1ZmYgZG9uJ3QgZXhpc3QpLCBpdCdzIG5vdCBmYXIgYXdheSBmcm9tIG1ha2luZyBs
aW51eAo+ID4gcnVubmluZyBvbiB0aGUgRlBHQSBvciBlbXVsYXRvci4gSWYgdGhlIGdhaW4gaXMg
bGFyZ2VyIHRoYW4gdGhlIG1haW50ZW5hbmNlCj4gPiBlZmZvcnQsIEknZCBsaWtlIHRvIHVyZ2Ug
a2VlcGluZyB0aGUgTk9NTVUgc3VwcG9ydC4KPiA+Cj4gPiBUaGFua3MgYSBsb3QKPiA+Cj4gPiA+
IHVzYWdlIGNhc2U6IEFzIGlzIGtub3duLCBTb3BoZ28gQ1YxODAwQiBwbGF0Zm9ybXMgc3VjaCBh
cyBNaWxrIER1bwo+ID4gPiBjb250YWlucyB0d28gQzkwNiBjb3JlLCBvbmUoYS5rLmEgYmlnIGNv
cmUpIHdpdGggTU1VIGFub3RoZXIoYS5rLmEgc21hbGwKPiA+ID4gY29yZSl3L28gTU1VLiBUaGUg
dmVuZG9yIHNkayBydW5zIGZyZWVydG9zIG9uIHRoZSBzbWFsbCBjb3JlLCBidXQgaXQKPiA+ID4g
ZG9lc24ndCBwcmV2ZW50IHVzZXJzIHRvIHJ1biBvdGhlciBPUyBzdWNoIGFzIHRocmVhZHgsIHpl
cGh5ciBvciBub21tdQo+ID4gPiBsaW51eCBvbiB0aGUgc21hbGwgY29yZS4gSW4gZmFjdCwgSSBz
dWNlc3NmdWxseSBicm91Z2h0IHVwIG5vbW11IGxpbnV4Cj4gPiA+IG9uIHRoZSBzbWFsbCBjb3Jl
LiBJIGRpZG4ndCBqdXN0IHNlbmQgb3V0IHRoZSBwYXRjaGVzIGluIHRpbWUgZHVyaW5nIHRoaXMK
PiA+ID4gZGV2IHdpbmRvdyBkdW8gdG8gbXkgcGVyc29uYWwgY2FyZWVyIHJlYXNvbihJIHNwZW50
IHRoZSB0aW1lIG9uIGh1bnRpbmcKPiA+ID4gZm9yIGEgbmV3IGpvYikKPiA+ID4KPiA+ID4gSSBw
bGFuIHRvIHNlbmQgb3V0IE5PTU1VIHJlbGF0ZWQgcGF0Y2hlcyBvbmNlIDYuOS1yYzEgaXMgb3V0
Lgo+Cj4gQXMgaXMgcHJvbWlzZWQsIHRoZSBOT01NVSBpbXByb3ZlbWVudCBwYXRjaGVzIGFyZSBz
ZW50IG91dAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwMzI1MTY0
MDIxLjMyMjktMS1qc3poYW5nQGtlcm5lbC5vcmcvVC8jdAo+Cj4gVGhhbmtzCj4KPiA+ID4KPiA+
ID4gPiA+ID4gY3JlYXRpdmUgYnVpbGQgdG8gZ2V0IGV2ZXJ5dGhpbmcgd29ya2luZywgSSd2ZSBu
ZXZlciBuZWVkZWQgdG8gcGF0Y2gKPiA+ID4gPiA+ID4gYW55dGhpbmcgaW4gdGhlIGtlcm5lbCBi
ZXlvbmQgcGF0Y2hpbmcgaW4gYSBjdXN0b20gY29uc29sZSBmb3Igc2VyaWFsCj4gPiA+ID4gPiA+
IG91dHB1dC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBIZXkgQ2hhcmxlcywKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBObyB3b3JyaWVzLCB3ZSBhY3R1YWxseSBkaWQgbm90IGV4cGVjdGVk
IE5PTU1VIHRvIGhhdmUgKnNvIG1hbnkqIHVzZXJzLgo+ID4gPiA+ID4gSSBndWVzcyBkZXByZWNh
dGluZyBzdHVmZiBpcyBhIGdvb2Qgd2F5IHRvIGhhdmUgaW1tZWRpYXRlIGZlZWRiYWNrIDspLgo+
ID4gPiA+ID4gSGF2aW5nIEZEUElDIHBzQUJJIHRvIGJlIG1lcmdlZCB1cHN0cmVhbSBjb3VsZCBh
bHNvIHByb2JhYmx5IGJlIGEKPiA+ID4gPiA+IHBvc2l0aXZlIHBvaW50IHRvd2FyZCBhIGJldHRl
ciBOT01NVSBzdXBwb3J0Lgo+ID4gPiA+Cj4gPiA+ID4gWWEsIHRoYXQncyBwcm9iYWJseSB0aGUg
cmlnaHQgd2F5IHRvIGRvIGl0LiAgVG91Y2hpbmcgYW55dGhpbmcgaW4gdGhlIHBzQUJJCj4gPiA+
ID4gaXMgcHJldHR5IG1pc2VyYWJsZSwgdGhvdWdoLCBzbyBJIGRvbid0IHJlYWxseSB3YW50IHRv
IGZvcmNlIHBlb3BsZSB0byBkbwo+ID4gPiA+IGl0Li4uCj4gPiA+ID4KPiA+ID4gPiA+ID4gSSBh
bSBoYXBweSB0byBkaXNjdXNzIHRoZSBwb3NzaWJpbGl0eSBvZiBtZSBhbmQgb3Igb25lIG9mIHRo
ZSBvdGhlcgo+ID4gPiA+ID4gPiBSSVNDLVYgc29mdCAoRlBHQSkgY29yZSBwZW9wbGUgc3RlcHBp
bmcgdXAgdG8gdHJ5IHRvIGJlIG1vcmUgYWN0aXZlLAo+ID4gPiA+ID4gPiBidXQgc28gZmFyIHdl
J3ZlIGp1c3QgYmVlbiB2ZXJ5IHdlbGwgc2VydmljZWQgYnkgdGhlIGN1cnJlbnQgTk9NTVUKPiA+
ID4gPiA+ID4gTGludXggc2V0dXAuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSXQgY291bGQgcHJvYmFi
bHkgYmUgbmljZSB0byBoYXZlIHNvbWUgZmVlZGJhY2svVGVzdGVkLWJ5OiBmcm9tIE5PTU1VCj4g
PiA+ID4gPiB1c2VycyBmb3IgbmV3IHJlbGVhc2VzIHRoZW4uCj4gPiA+ID4KPiA+ID4gPiBIYXZp
bmcgbW9yZSB1cHN0cmVhbSBpbnRlcmFjdGlvbiBmcm9tIHVzZXJzIGlzIGFsd2F5cyBhcHByZWNp
YXRlZCwgdGhhdCdzCj4gPiA+ID4gdGhlIGJlc3Qgd2F5IHRvIHByb3ZlIHBlb3BsZSBhcmUgdXNp
bmcgdGhlIGNvZGUuICBJZiB5b3UgZ3V5cyBoYXZlIHRoZSB0aW1lCj4gPiA+ID4gaXQnZCBiZSBn
cmVhdCB0byBnZXQgdGhpcyBpbnRvIHNvbWUgc29ydCBvZiBDSSwgaWRlYWxseSBydW5uaW5nIG9u
IHNvbWUgcmVhbAo+ID4gPiA+IHBsYXRmb3JtLgo+ID4gPgo+ID4gPiBBcyBhYm92ZSwgSSdkIGFs
c28gbGlrZSB0byBzdGVwIHVwIG9uIHRoZSBOT01NVSBzdHVmZiwgYXQgbGVhc3QgdGVzdAo+ID4g
PiBub21tdSBvbiBtaWxrdiBkdW8ncyBzbWFsbCBjb3JlLiBBbmQgY2FuIGJlIHNlZW4gZnJvbSBt
eSBnaXQgY29tbWl0Cj4gPiA+IGhpc3RvdHJ5LCBJIHdhcyBhY3RpdmUsIGFuZCBJIGJlbGl2ZSBJ
IHdpbGwgc3RpbGwgYmUgYWN0aXZlIG9uIHJpc2N2IGxpbnV4Cj4gPiA+IGtlcm5lbCBkZXZlbG9w
bWVudC4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+ID4KPiA+ID4gPiA+
IENsw6ltZW50Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBDaGFybGVzCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIE1vbiwgRmViIDI2LCAyMDI0IGF0IDg6
MDPigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gT24gTW9uLCBGZWIgMjYsIDIwMjQgYXQgMDQ6MjU6MjRQTSArMDEw
MCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gSSBndWVzcyBJIGNvdWxk
IGFsc28gbWFyayBYSVAgYXMgZGVwcmVjYXRlZC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IEknbSBub3Qgc28gc3VyZSwgcGVvcGxlIHJlY2VudGx5IGFkZGVkIFhJUCBzdXBwb3J0IHRvIFFF
TVUgKGFuZCBzZW50Cj4gPiA+ID4gPiA+ID4ga2VybmVsIGZpeGVzIGluIERlY2VtYmVyKS4gWElQ
IGlzIGFsc28gbm90IG5lYXJseSBhcyBtdWNoIG9mIGEgcHJvYmxlbQo+ID4gPiA+ID4gPiA+IHRv
IHN1cHBvcnQsIHRoZXJlJ3MgZmFyIGxlc3MgdGhhdCBpdCBkb2VzIGRpZmZlcmVudGx5LCB0aGUg
bWFpbiBiYXJyaWVyCj4gPiA+ID4gPiA+ID4gd2FzIHRoZSBpbmFiaWxpdHkgdG8gdGVzdCBpdCB3
aGljaCBpcyBubyBsb25nZXIgdGhlIGNhc2UuCj4gPiA+ID4gPiA+ID4gVGhhdCBzYWlkLCBYSVAg
aXMgZ29ubmEga2lsbCBpdHNlbGYgb2ZmIEkgZmVlbCBhcyBpdCBkb2VzIG5vdCBzdXBwb3J0Cj4g
PiA+ID4gPiA+ID4gcnVudGltZSBwYXRjaGluZyBhbmQgdGhlcmVmb3JlIGlzIGV4dHJlbWVseSBs
aW1pdGVkIG9uIGV4dGVuc2lvbnMsIGdpdmVuCj4gPiA+ID4gPiA+ID4gd2UgdXNlIGFsdGVybmF0
aXZlcyBmb3IgYWxsIG9mIHRoYXQgKGFsdGhvdWdoIEkgc3VwcG9zZSBpZiBzb21lb25lIGhhcyBh
Cj4gPiA+ID4gPiA+ID4gdXNlY2FzZSB0aGV5IGNvdWxkIG1ha2UgbmFzdHkgbWFjcm9zIHdvcnNl
IGFuZCBpbXBsZW1lbnQgYSBjb21waWxldGltZQo+ID4gPiA+ID4gPiA+IHN3aXRjaCBpbiB0aGUg
YWx0ZXJuYXRpdmVzIHRvbykuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBDaGVlcnMsCj4g
PiA+ID4gPiA+ID4gQ29ub3IuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+ID4gPiA+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gPiA+ID4gPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiA+ID4gPiA+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPiA+ID4KPiA+ID4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+ID4gPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
