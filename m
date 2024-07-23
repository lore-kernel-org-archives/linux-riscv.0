Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797F2C3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzDwOGfeF0N8tfLsW6QD1vF1W0XXddD5lKsQmmbzkrY=; b=qq4UFm1Meqi2D+
	ZbOC07GeW6/IfOoFiXLehmz9U863rYtVci+u94jN9VaA4MKEZMtINUmejD0h7Gby7NOBubjz8G/cV
	/2pKGYz2E/IKdGP2b1ljUD2tQ+y7OGVgbI3zaISMxTIjlTGchjATeBS5wyWPa0wK861sEicRQcHXM
	k9uPtt1M85ulfM3UHxVHEw14UAiGp2k87TR/9r3g95YHf5SPspvh7BjDVyUrxwGBY7UB6q2iWXx/L
	huZsP7WKXiKWMdBpbEerdViWBAPKexrcNzlEfW4VvDqWCUBFo/Hquk4txa0vDe+t4cgZNYF6Nc5WF
	L8eFYf+ZDt0v4ZMEOTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWGuU-0000000Cnit-3XRi;
	Tue, 23 Jul 2024 14:54:38 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWGu6-0000000CndV-1iQV;
	Tue, 23 Jul 2024 14:54:16 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52f04150796so3140348e87.3;
        Tue, 23 Jul 2024 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721746452; x=1722351252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgTGl7/iLwA8lXOdx8/6BLZrlAts/9/eNlLEa+P/MyA=;
        b=Y/xXt2CGSyw2CSQiRlokJzO31G7JfWt3Lu08sc8jwuNjVvoQTSU3EKWUJaC//6n7rx
         FPCyYEJeXae/YXtztF9b8IHAfDK0lprQfH2x6z725oq9hiAUe3jySVVbM51demGTP5BA
         Dd8amSLajc9I5Pm6lq/WZvtjl5eC2F0crNufYC+W5aFeUunxmb8YSkjcUQgxUwxB95Lj
         6cN+zMEz93RA8bNDvpf3JaXKqWkKm0THtLdBb7knAjjCRguBJqKAk4vVFTRS3RF7nTU4
         FiD3DHyRzg9m2C/4/8srAA9rT9kP6mqLLzYXJ295u0s/C7PVYFeEoW+KBRR6E/DchaJq
         MSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721746452; x=1722351252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgTGl7/iLwA8lXOdx8/6BLZrlAts/9/eNlLEa+P/MyA=;
        b=bkm1XLDmMEDbX6cTfb09SRjkjd4dhzgPNDpxgQHuOwTrdbHsLZCOHjt5KCV8I3rOIn
         r2ZSZPasJR9W9kQ8e9qO0wMIO9f0/ZQx1lqVi7CG2HyIq0xIUyKeaWgHPXvBKmKKcPFJ
         MZvkHNBklQQvJxH5bBR5elR+2rAXqulApbgsIWHdyvHwQ6ONTXY5qqhfVwysUJSpgZNi
         P7+J59gJXGTzVJUmP5AD1GhZ7s9ORL1yOM4AN9+SG85RrVDa1MJcwXlWXuDask21EtOB
         5aakdP41yyWu5iJUEk3roynGecnHHbjCQOWWn8a+gktarl1eK3SZwjZglpP5TwyoQkTi
         bJog==
X-Forwarded-Encrypted: i=1; AJvYcCXk+YbuB1kGEjIrZ2EAooq/iRsp8m97tiKjH8APCNRnvIP7fFI75jCtzJUSx7uM+fF1rXnF5s52Mk2lYYxrAj6AaaWsBPn616jHh3HHxVz//5NZq+oQkGjLTcP6qDqoKkTV9eVh0PheWi30Ofy5msEuXGFC3V4=
X-Gm-Message-State: AOJu0YyeTb5W2+1tGlfiZmqYkYf4OOskLe9wXMSepSwqgzYfde4v1Ifp
	RL9bbw7ObbwbM6GzNHRHDv+H2uwXDY+yy4PV6+pmEy8KwUknr/VA+fXpSMafjfVDfu+me3PO9+W
	//g3IETf5GMoBFr0C+f1TyyMnqw4=
X-Google-Smtp-Source: AGHT+IFYMOiLDzvDOKK6+vBAVn/8k5uVYxbcIexSwHx+d+SAZWWHPZMdYHFed1xA+jHc+tweeg7UVxoQuNuIAfPIUzM=
X-Received: by 2002:a05:6512:33d3:b0:52c:d904:d26e with SMTP id
 2adb3069b0e04-52fc40446d9mr2549501e87.21.1721746451484; Tue, 23 Jul 2024
 07:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <65dbad1fda08a32922c44886e4581e49b4a2fecc.1718268003.git.haibo1.xu@intel.com>
 <20240723-23811cc47f7863d12b6a78e8@orel> <CAJve8omO0DwQEO+KEjhJFn=uYNAyZNYsnQieETocRzwb0RTGiA@mail.gmail.com>
 <CAK9=C2Xt2JPaUOTfN9CyyeVQiS9KKYWaH4RUTwYQ6UGjq3VnHQ@mail.gmail.com>
In-Reply-To: <CAK9=C2Xt2JPaUOTfN9CyyeVQiS9KKYWaH4RUTwYQ6UGjq3VnHQ@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 23 Jul 2024 22:53:59 +0800
Message-ID: <CAJve8o=MK1huJ7x7NFhsmT2YiwtrDuKaVMnjK=bb3HhZBJprOw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] ACPI: RISCV: Add NUMA support based on SRAT and SLIT
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_075414_474747_5EDB7D61 
X-CRM114-Status: GOOD (  35.62  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Zong Li <zong.li@sifive.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Robert Richter <rrichter@amd.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgMTA6NTDigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAyMywgMjAyNCBhdCA3OjUx4oCv
UE0gSGFpYm8gWHUgPHhpYW9ibzU1eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwg
SnVsIDIzLCAyMDI0IGF0IDk6MzDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgMDQ6NTQ6
MzNQTSBHTVQsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiA+IEFkZCBhY3BpX251bWEuYyBmaWxlIHRv
IGVuYWJsZSBwYXJzZSBOVU1BIGluZm9ybWF0aW9uIGZyb20KPiA+ID4gPiBBQ1BJIFNSQVQgYW5k
IFNMSVQgdGFibGVzLiBTUkFUIHRhYmxlIHByb3ZpZGUgQ1BVcyhIYXJ0KSBhbmQKPiA+ID4gPiBt
ZW1vcnkgbm9kZXMgdG8gcHJveGltaXR5IGRvbWFpbiBtYXBwaW5nLCB3aGlsZSBTTElUIHRhYmxl
Cj4gPiA+ID4gcHJvdmlkZSB0aGUgZGlzdGFuY2UgbWV0cmljcyBiZXR3ZWVuIHByb3hpbWl0eSBk
b21haW5zLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54
dUBpbnRlbC5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2FjcGkuaCB8ICAxNSArKystCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAg
IHwgICAxICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jICAgICAgfCAgIDUgLS0K
PiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaV9udW1hLmMgfCAxMzEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5j
ICAgICB8ICAgNCArLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgICB8ICAg
MiAtCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvYWNwaS5oICAgICAgICAgIHwgICA2ICsrCj4gPiA+
ID4gIDcgZmlsZXMgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+
ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaV9udW1hLmMK
PiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGku
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oCj4gPiA+ID4gaW5kZXggN2RhZDBjZjlk
NzAxLi5lMGExZjg0NDA0ZjMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hY3BpLmgKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaAo+
ID4gPiA+IEBAIC02MSwxMSArNjEsMTQgQEAgc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZml4X3Bo
eXNfcGFja2FnZV9pZChpbnQgbnVtLCB1MzIgc2xvdCkgeyB9Cj4gPiA+ID4KPiA+ID4gPiAgdm9p
ZCBhY3BpX2luaXRfcmludGNfbWFwKHZvaWQpOwo+ID4gPiA+ICBzdHJ1Y3QgYWNwaV9tYWR0X3Jp
bnRjICphY3BpX2NwdV9nZXRfbWFkdF9yaW50YyhpbnQgY3B1KTsKPiA+ID4gPiAtdTMyIGdldF9h
Y3BpX2lkX2Zvcl9jcHUoaW50IGNwdSk7Cj4gPiA+ID4gK3N0YXRpYyBpbmxpbmUgdTMyIGdldF9h
Y3BpX2lkX2Zvcl9jcHUoaW50IGNwdSkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgIHJldHVybiBh
Y3BpX2NwdV9nZXRfbWFkdF9yaW50YyhjcHUpLT51aWQ7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4g
PiA+ID4gIGludCBhY3BpX2dldF9yaXNjdl9pc2Eoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0
YWJsZSwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY3B1LCBjb25z
dCBjaGFyICoqaXNhKTsKPiA+ID4gPgo+ID4gPiA+IC1zdGF0aWMgaW5saW5lIGludCBhY3BpX251
bWFfZ2V0X25pZCh1bnNpZ25lZCBpbnQgY3B1KSB7IHJldHVybiBOVU1BX05PX05PREU7IH0KPiA+
ID4gPiAgdm9pZCBhY3BpX2dldF9jYm9fYmxvY2tfc2l6ZShzdHJ1Y3QgYWNwaV90YWJsZV9oZWFk
ZXIgKnRhYmxlLCB1MzIgKmNib21fc2l6ZSwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1MzIgKmNib3pfc2l6ZSwgdTMyICpjYm9wX3NpemUpOwo+ID4gPiA+ICAjZWxzZQo+ID4g
PiA+IEBAIC04Nyw0ICs5MCwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYWNwaV9nZXRfY2JvX2Js
b2NrX3NpemUoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZSwKPiA+ID4gPgo+ID4gPiA+
ICAjZW5kaWYgLyogQ09ORklHX0FDUEkgKi8KPiA+ID4gPgo+ID4gPiA+ICsjaWZkZWYgQ09ORklH
X0FDUElfTlVNQQo+ID4gPiA+ICtpbnQgYWNwaV9udW1hX2dldF9uaWQodW5zaWduZWQgaW50IGNw
dSk7Cj4gPiA+ID4gK3ZvaWQgYWNwaV9tYXBfY3B1c190b19ub2Rlcyh2b2lkKTsKPiA+ID4gPiAr
I2Vsc2UKPiA+ID4gPiArc3RhdGljIGlubGluZSBpbnQgYWNwaV9udW1hX2dldF9uaWQodW5zaWdu
ZWQgaW50IGNwdSkgeyByZXR1cm4gTlVNQV9OT19OT0RFOyB9Cj4gPiA+ID4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBhY3BpX21hcF9jcHVzX3RvX25vZGVzKHZvaWQpIHsgfQo+ID4gPiA+ICsjZW5kaWYg
LyogQ09ORklHX0FDUElfTlVNQSAqLwo+ID4gPiA+ICsKPiA+ID4gPiAgI2VuZGlmIC8qX0FTTV9B
Q1BJX0gqLwo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBi
L2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gPiA+ID4gaW5kZXggNWIyNDNkNDZmNGIxLi4x
ZTJhZmVjMTQxYjUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZp
bGUKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+ID4gPiA+IEBAIC0x
MTAsMyArMTEwLDQgQEAgb2JqLSQoQ09ORklHX0NPTVBBVCkgICAgICAgICAgICAgICs9IGNvbXBh
dF92ZHNvLwo+ID4gPiA+Cj4gPiA+ID4gIG9iai0kKENPTkZJR182NEJJVCkgICAgICAgICAgKz0g
cGkvCj4gPiA+ID4gIG9iai0kKENPTkZJR19BQ1BJKSAgICAgICAgICAgKz0gYWNwaS5vCj4gPiA+
ID4gK29iai0kKENPTkZJR19BQ1BJX05VTUEpICAgICAgKz0gYWNwaV9udW1hLm8KPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
YWNwaS5jCj4gPiA+ID4gaW5kZXggZTYxOWVkYzhiMGNjLi4wNDBiZGJmZWEyYjQgMTAwNjQ0Cj4g
PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jCj4gPiA+ID4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvYWNwaS5jCj4gPiA+ID4gQEAgLTE5MSwxMSArMTkxLDYgQEAgc3RydWN0IGFj
cGlfbWFkdF9yaW50YyAqYWNwaV9jcHVfZ2V0X21hZHRfcmludGMoaW50IGNwdSkKPiA+ID4gPiAg
ICAgICByZXR1cm4gJmNwdV9tYWR0X3JpbnRjW2NwdV07Cj4gPiA+ID4gIH0KPiA+ID4gPgo+ID4g
PiA+IC11MzIgZ2V0X2FjcGlfaWRfZm9yX2NwdShpbnQgY3B1KQo+ID4gPiA+IC17Cj4gPiA+ID4g
LSAgICAgcmV0dXJuIGFjcGlfY3B1X2dldF9tYWR0X3JpbnRjKGNwdSktPnVpZDsKPiA+ID4gPiAt
fQo+ID4gPiA+IC0KPiA+ID4gPiAgLyoKPiA+ID4gPiAgICogX19hY3BpX21hcF90YWJsZSgpIHdp
bGwgYmUgY2FsbGVkIGJlZm9yZSBwYWdpbmdfaW5pdCgpLCBzbyBlYXJseV9pb3JlbWFwKCkKPiA+
ID4gPiAgICogb3IgZWFybHlfbWVtcmVtYXAoKSBzaG91bGQgYmUgY2FsbGVkIGhlcmUgdG8gZm9y
IEFDUEkgdGFibGUgbWFwcGluZy4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvYWNwaV9udW1hLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpX251bWEuYwo+ID4gPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMjMxNDgyZDY5
NDYKPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
YWNwaV9udW1hLmMKPiA+ID4gPiBAQCAtMCwwICsxLDEzMSBAQAo+ID4gPiA+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gPiA+ICsvKgo+ID4gPiA+ICsgKiBBQ1BJIDYu
NiBiYXNlZCBOVU1BIHNldHVwIGZvciBSSVNDVgo+ID4gPiA+ICsgKiBMb3RzIG9mIGNvZGUgd2Fz
IGJvcnJvd2VkIGZyb20gYXJjaC9hcm02NC9rZXJuZWwvYWNwaV9udW1hLmMKPiA+ID4gPiArICoK
PiA+ID4gPiArICogQ29weXJpZ2h0IDIwMDQgQW5kaSBLbGVlbiwgU3VTRSBMYWJzLgo+ID4gPiA+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTMtMjAxNiwgTGluYXJvIEx0ZC4KPiA+ID4gPiArICogICAg
ICAgICAgIEF1dGhvcjogSGFuanVuIEd1byA8aGFuanVuLmd1b0BsaW5hcm8ub3JnPgo+ID4gPiA+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24uCj4gPiA+ID4gKyAqCj4g
PiA+ID4gKyAqIFJlYWRzIHRoZSBBQ1BJIFNSQVQgdGFibGUgdG8gZmlndXJlIG91dCB3aGF0IG1l
bW9yeSBiZWxvbmdzIHRvIHdoaWNoIENQVXMuCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIENhbGxl
ZCBmcm9tIGFjcGlfbnVtYV9pbml0IHdoaWxlIHJlYWRpbmcgdGhlIFNSQVQgYW5kIFNMSVQgdGFi
bGVzLgo+ID4gPiA+ICsgKiBBc3N1bWVzIGFsbCBtZW1vcnkgcmVnaW9ucyBiZWxvbmdpbmcgdG8g
YSBzaW5nbGUgcHJveGltaXR5IGRvbWFpbgo+ID4gPiA+ICsgKiBhcmUgaW4gb25lIGNodW5rLiBI
b2xlcyBiZXR3ZWVuIHRoZW0gd2lsbCBiZSBpbmNsdWRlZCBpbiB0aGUgbm9kZS4KPiA+ID4gPiAr
ICovCj4gPiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIHByX2ZtdChmbXQpICJBQ1BJOiBOVU1BOiAi
IGZtdAo+ID4gPiA+ICsKPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+ID4gPiAr
I2luY2x1ZGUgPGxpbnV4L2JpdG1hcC5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9tbS5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGlu
dXgvbWVtYmxvY2suaD4KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L21tem9uZS5oPgo+ID4gPiA+
ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC90b3Bv
bG9neS5oPgo+ID4gPiA+ICsKPiA+ID4gPiArI2luY2x1ZGUgPGFzbS9udW1hLmg+Cj4gPiA+ID4g
Kwo+ID4gPiA+ICtzdGF0aWMgaW50IGFjcGlfZWFybHlfbm9kZV9tYXBbTlJfQ1BVU10gX19pbml0
ZGF0YSA9IHsgTlVNQV9OT19OT0RFIH07Cj4gPiA+Cj4gPiA+IFRoaXMgb25seSBzZXRzIGFjcGlf
ZWFybHlfbm9kZV9tYXBbMF0gdG8gTlVNQV9OT19OT0RFLiBBc3N1bWluZyB3ZSB3YW50Cj4gPiA+
IHRvIGVuc3VyZSBhbGwgb2YgdGhlbSBhcmUgaW5pdGlhbGl6ZWQgdG8gTlVNQV9OT19OT0RFLCB0
aGVuIHdlIG5lZWQKPiA+ID4KPiA+ID4gc3RhdGljIGludCBhY3BpX2Vhcmx5X25vZGVfbWFwW05S
X0NQVVNdIF9faW5pdGRhdGEgPSB7IFswIC4uLiBOUl9DUFVTIC0gMV0gPSBOVU1BX05PX05PREUg
fTsKPiA+ID4KPiA+Cj4gPiBHb29kIGNhdGNoISBUaGFua3MhCj4gPgo+ID4gQFBhbG1lciBEYWJi
ZWx0Cj4gPiBJIG5vdGljZWQgdGhpcyBzZXJpZXMgaGFkIGJlZW4gbWVyZ2VkIHRvIHJpc2N2L2xp
bnV4LmdpdCAoZm9yLW5leHQpLAo+ID4gY291bGQgeW91IGhlbHAgaW5jbHVkZSB0aGUgYWJvdmUg
Y2hhbmdlIGZyb20gRHJldz8KPiA+IE9yIHNoYWxsIEkgc2VuZCBvdXQgYSBuZXcgc2VyaWVzPwo+
Cj4gU2luY2UgaXQncyBhbHJlYWR5IGluIGZvci1uZXh0LCBJIHN1Z2dlc3QgaGF2aW5nIGEgRml4
ZXMKPiBwYXRjaCBhbmQgYWRkIHRoYXQgdG8gZm9yLW5leHQgYmVjYXVzZSBmb3ItbmV4dCBpcyBz
dXBwb3NlZAo+IHRvIGhhdmUgYSBzdGFibGUgY29tbWl0IGhpc3RvcnkuCj4KCk9rLCBJIHdpbGwg
c2VuZCBvdXQgdGhlIGZpeCBzb29uISBUaGFua3MhCgo+IFJlZ2FyZHMsCj4gQW51cAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
