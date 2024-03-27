Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4273C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+kf/M2U/KjQCpQMZyARdncFDEEoNRRZs8mNldZszL4=; b=OrdLIob+8pfOpo
	g30kTcTs1pq2x2bKaTyTg4PWv957GnHhKS5z31+gLExz4dbAhFcc0qJOqLBNWkWMcHVYglJHmFIdy
	Pgs3WR1L8OpN4SFNrXAT2BNBsbYzpm4K/1Zj5NGKWs6FIAvIB9XMwfawJB5dt9R/i+cwGuVqzmrXk
	rFWnIAssUND4+SfRYDpjuk+k+dz/0iveHY2du9yMGduHjJhm4a0C9U0rsJkelmWeDyZINihxLdMaG
	gFz/HkfN51v0iildS5VZewj4sGs2VhiaRrgURAAspwvTShn96sL85skncTvhoamxm2+zeFCpLEYwx
	9FLrGZ26wbO6h9UyAjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSXc-00000008vdg-3UNb;
	Wed, 27 Mar 2024 12:38:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSXZ-00000008vb4-41dF
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:38:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-515b69e8f38so2050470e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711543078; x=1712147878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0po7APVfo9kM+XbLWx6GEab2u7wM60kpsN8Mny+gdt4=;
        b=UcJhrDLA/9IhnofDykReCroBynmwOOTkav4IKxkb2ZRkqVUMUnMjIrkOSNKAGcLu15
         WkCiXZaYH4f1x7ob6cXw6pGK9FgvMGvdJBWT+0cKLhXEgseqks+zwdAL/C53KnmLG4jN
         bEi3KPuNPZFr+gM9r66DN1QqCYlAbSQIZYoyJR7nJ1HwPwHLb92JbhdnSF80xBR4ruoZ
         f1gJDWHF3/0TTiqxt4SY/vSIU+nDiTj4rM0qXT4/ihYz9E+dNtN4hNsBzmMZUIIAAhqI
         7NeWhO+4uoKnL+ptM4cd8EAvT7Cis5wtu1mmKmkftcfZBO305CHdUOgFrGLNef2/+wSA
         hGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543078; x=1712147878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0po7APVfo9kM+XbLWx6GEab2u7wM60kpsN8Mny+gdt4=;
        b=hmOBsL/o//9tNg9AlpA05A6YkzaYpSk2hRbXirxhgxD1KuGRk3694TIUBVQ4JZkst6
         oSGKameNuHN25gSKWQuu/AVXf+GAPqKYLbAqCUOOHv03O/OoOKC2BG8EYN5/VU51NEH1
         GbsIKCG4sUmFznaZT844s3Tj2dgDXadsZBzCz1af2OU93S0b+i7QwF/AcVJG9MWyzQjs
         b/NZ7Inx73RM/xuBoNzvMMGtHn7Znp0lxmgzjm6D/5Nk1XOusExhmAd8znRb+5jhpIE5
         5sODhCxzXKyPE2UMjBLu6sFCbVWMM8z6Js/gNSDcGbFwfteKLo5/S2Myk7uXq+oaiNMg
         hWJA==
X-Forwarded-Encrypted: i=1; AJvYcCWY9hJYi+W3ELaILmV3ZkxCy/oWyllvLOighiewTeU3c3rv8/eZDZffqzH9DD13rQQmoPXrye+nC+lBpWfPFOjvUXyOqy74NoODOiUrycZr
X-Gm-Message-State: AOJu0Yy3ozojpSmRPdE3//CEKoLOrEpWQHkQyDe5BVdgs8W6680DIBD+
	Ca0Bp+Y3nCZB8HQ39M2qU1u3WZPp6KSetKRnDbWIzbBF4pRQM41h152IzhhAitmgodMKG8ZqlSr
	rWDQX/B0RwOyTPSfr5AwHEdRjyU0=
X-Google-Smtp-Source: AGHT+IHIxVrFBKdjortdCaXll+rW/cxfYre9UbgLvzS6HpqyTBrl0+F2wyXvbhXRUqf/MzeIE2guDffkK63zJwVnRHA=
X-Received: by 2002:a19:910f:0:b0:515:bf75:1b99 with SMTP id
 t15-20020a19910f000000b00515bf751b99mr784393lfd.40.1711543077124; Wed, 27 Mar
 2024 05:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1709780590.git.haibo1.xu@intel.com>
In-Reply-To: <cover.1709780590.git.haibo1.xu@intel.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 27 Mar 2024 20:37:45 +0800
Message-ID: <CAJve8onUQTL2C5m4WQqkvFcANEiv+gzMBfmmJnRA1REE5XFgbw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Add ACPI NUMA support for RISC-V
To: Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_053802_078126_340C7B77 
X-CRM114-Status: GOOD (  23.79  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, Jisheng Zhang <jszhang@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Dan Williams <dan.j.williams@intel.com>, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQFN1bmlsIFYgTCwKCkNvdWxkIHlvdSBwbGVhc2UgaGF2ZSBhIHJldmlldyBvbiB0aGlzIHBh
dGNoIHNldD8KClRoYW5rcywKSGFpYm8KCk9uIFRodSwgTWFyIDcsIDIwMjQgYXQgNDozNOKAr1BN
IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGVuYWJsZSBSSVNDLVYgQUNQSSBOVU1BIHN1cHBvcnQgd2hpY2ggd2FzIGJhc2VkIG9uCj4g
dGhlIHJlY2VudGx5IGFwcHJvdmVkIEFDUEkgRUNSWzFdLgo+Cj4gUGF0Y2ggMS82IGlzIGdlbmVy
YXRlZCBmcm9tIHRoZSBhY3BpY2EgUFJbMl0gYW5kIHNob3VsZCBiZSBtZXJnZWQgdGhyb3VnaAo+
IHRoZSBhY3BpY2EgcHJvamVjdC4gRHVlIHRvIHRoaXMgZGVwZW5kZW5jeSwgb3RoZXIgNSBwYXRj
aGVzIGNhbiBvbmx5IGJlCj4gbWVyZ2VkIGFmdGVyIHRoZSBjb3JyZXNwb25kaW5nIEFDUElDQSBw
YXRjaCB3YXMgcHVsbGVkIGludG8gbGludXguCj4KPiBQYXRjaCAyLzYgYWRkIFJJU0MtViBzcGVj
aWZpYyBhY3BpX251bWEuYyBmaWxlIHRvIHBhcnNlIE5VTUEgaW5mb3JtYXRpb24KPiBmcm9tIFNS
QVQgYW5kIFNMSVQgQUNQSSB0YWJsZXMuCj4gUGF0Y2ggMy82IGFkZCB0aGUgY29tbW9uIFNSQVQg
UklOVEMgYWZmaW5pdHkgc3RydWN0dXJlIGhhbmRsZXIuCj4gUGF0Y2ggNC82IHJlbW92ZSB0aGUg
JyNpZiBkZWZpbmVkKENPTkZJR19BUkNIKScgY29uZGl0aW9uIHRvIG1ha2Ugc29tZSBOVU1BCj4g
cmVsYXRlZCBwYXJzZSBmdW5jdGlvbnMgY29tbW9uIGZvciBhbGwgY3VycmVudCBhcmNoaXRlY3R1
cmVzIHRoYXQgc3VwcG9ydAo+IEFDUElfTlVNQQo+IFBhdGNoIDUvNiByZW1vdmUgQVJDSCBkZXBl
bmRzIG9wdGlvbiBpbiBBQ1BJX05VTUEgS2NvbmZpZyB3aGljaCB3YXMgbm8KPiBsb25nZXIgbmVl
ZGVkIHNpbmNlIGFsbCB0aGUgY3VycmVudCBhcmNoaXRlY3R1cmVzIHRoYXQgc3VwcG9ydCBBQ1BJ
IHdvdWxkCj4gc2VsZWN0IEFDUElfTlVNQSBieSBkZWZhdWx0Lgo+IFBhdGNoIDYvNiBhZGQgY29y
cmVzcG9uZGluZyBBQ1BJX05VTUEgY29uZmlnIGZvciBSSVNDLVYgS2NvbmZpZy4KPgo+IEJhc2Vk
LW9uOiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtcmlzY3YvbGludXgtcmlzY3YvdHJlZS9mb3It
bmV4dAo+Cj4gWzFdIGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVlUZER4MklQbTVJ
ZVpqQVc5MzJFWVUtdFV0Z1MwOHRYL3ZpZXc/dXNwPXNoYXJpbmcKPiBbMl0gaHR0cHM6Ly9naXRo
dWIuY29tL2FjcGljYS9hY3BpY2EvcHVsbC85MjYKPgo+IFRlc3Rpbmc6Cj4gU2luY2UgdGhlIEFD
UEkgQUlBL1BMSUMgc3VwcG9ydCBwYXRjaCBzZXQgaXMgc3RpbGwgdW5kZXIgdXBzdHJlYW0gcmV2
aWV3LAo+IGhlbmNlIGl0IGlzIHRlc3RlZCB1c2luZyB0aGUgcG9sbCBiYXNlZCBIVkMgU0JJIGNv
bnNvbGUgYW5kIFJBTSBkaXNrLgo+IDEpIEJ1aWxkIGxhdGVzdCBRZW11IHdpdGggdGhlIGZvbGxv
d2luZyBwYXRjaCBiYWNrcG9ydGVkCj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjQwMTI5MDk0MjAwLjM1ODEwMzctMS1oYWlibzEueHVAaW50ZWwuY29tLwo+ICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS92bHN1bmlsL3FlbXUvY29tbWl0LzQyYmQ0ZWVlZmQ1ZDQ0MTBhNjhmMDJkNTRm
ZWU0MDZkOGExMjY5YjAKPgo+IDIpIEJ1aWxkIGxhdGVzdCBFREstSUkKPiAgICBodHRwczovL2dp
dGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvYmxvYi9tYXN0ZXIvT3ZtZlBrZy9SaXNjVlZpcnQvUkVB
RE1FLm1kCj4KPiAzKSBCdWlsZCBMaW51eCB3aXRoIHRoZSBmb2xsb3dpbmcgY29uZmlncyBlbmFi
bGVkCj4gICAgQ09ORklHX1JJU0NWX1NCSV9WMDE9eQo+ICAgIENPTkZJR19TRVJJQUxfRUFSTFlD
T05fUklTQ1ZfU0JJPXkKPiAgICBDT05GSUdfSFZDX1JJU0NWX1NCST15Cj4gICAgQ09ORklHX05V
TUE9eQo+ICAgIENPTkZJR19BQ1BJX05VTUE9eQo+Cj4gNCkgQnVpbGQgYnVpbGRyb290IHJvb3Rm
cy5jcGlvCj4KPiA1KSBMYXVuY2ggdGhlIFFlbXUgbWFjaGluZQo+ICAgIHFlbXUtc3lzdGVtLXJp
c2N2NjQgLW5vZ3JhcGhpYyBcCj4gICAgLW1hY2hpbmUgdmlydCxwZmxhc2gwPXBmbGFzaDAscGZs
YXNoMT1wZmxhc2gxIC1zbXAgNCAtbSA4RyBcCj4gICAgLWJsb2NrZGV2IG5vZGUtbmFtZT1wZmxh
c2gwLGRyaXZlcj1maWxlLHJlYWQtb25seT1vbixmaWxlbmFtZT1SSVNDVl9WSVJUX0NPREUuZmQg
XAo+ICAgIC1ibG9ja2RldiBub2RlLW5hbWU9cGZsYXNoMSxkcml2ZXI9ZmlsZSxmaWxlbmFtZT1S
SVNDVl9WSVJUX1ZBUlMuZmQgXAo+ICAgIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtcmFtLHNpemU9
NEcsaWQ9bTAgXAo+ICAgIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtcmFtLHNpemU9NEcsaWQ9bTEg
XAo+ICAgIC1udW1hIG5vZGUsbWVtZGV2PW0wLGNwdXM9MC0xLG5vZGVpZD0wIFwKPiAgICAtbnVt
YSBub2RlLG1lbWRldj1tMSxjcHVzPTItMyxub2RlaWQ9MSBcCj4gICAgLW51bWEgZGlzdCxzcmM9
MCxkc3Q9MSx2YWw9MzAgXAo+ICAgIC1rZXJuZWwgbGludXgvYXJjaC9yaXNjdi9ib290L0ltYWdl
IFwKPiAgICAtaW5pdHJkIGJ1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5jcGlvIFwKPiAg
ICAtYXBwZW5kICJyb290PS9kZXYvcmFtIHJvIGNvbnNvbGU9aHZjMCBlYXJseWNvbj1zYmkiCj4K
PiBbICAgIDAuMDAwMDAwXSBBQ1BJOiBTUkFUOiBOb2RlIDAgUFhNIDAgW21lbSAweDgwMDAwMDAw
LTB4MTdmZmZmZmZmXQo+IFsgICAgMC4wMDAwMDBdIEFDUEk6IFNSQVQ6IE5vZGUgMSBQWE0gMSBb
bWVtIDB4MTgwMDAwMDAwLTB4MjdmZmZmZmZmXQo+IFsgICAgMC4wMDAwMDBdIE5VTUE6IE5PREVf
REFUQSBbbWVtIDB4MTdmZTNiYzQwLTB4MTdmZTNjZmZmXQo+IFsgICAgMC4wMDAwMDBdIE5VTUE6
IE5PREVfREFUQSBbbWVtIDB4MjdmZmY0YzQwLTB4MjdmZmY1ZmZmXQo+IC4uLgo+IFsgICAgMC4w
MDAwMDBdIEFDUEk6IE5VTUE6IFNSQVQ6IFBYTSAwIC0+IEhBUlRJRCAweDAgLT4gTm9kZSAwCj4g
WyAgICAwLjAwMDAwMF0gQUNQSTogTlVNQTogU1JBVDogUFhNIDAgLT4gSEFSVElEIDB4MSAtPiBO
b2RlIDAKPiBbICAgIDAuMDAwMDAwXSBBQ1BJOiBOVU1BOiBTUkFUOiBQWE0gMSAtPiBIQVJUSUQg
MHgyIC0+IE5vZGUgMQo+IFsgICAgMC4wMDAwMDBdIEFDUEk6IE5VTUE6IFNSQVQ6IFBYTSAxIC0+
IEhBUlRJRCAweDMgLT4gTm9kZSAxCj4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxCj4gICAtIFN3
aXRjaCB0aGUgb3JkZXIgb2YgcGF0Y2ggMi80IGFuZCAzLzQgLSBQZXIgU3VuaWwncyBzdWdnZXN0
aW9uCj4gICAtIEFkZCBhIG5ldyBwYXRjaCA0LzYgdG8gbWFrZSBzb21lIE5VTUEgcmVsYXRlZCBw
YXJzZSBmdW5jdGlvbnMgY29tbW9uCj4gICAgIGZvciBhbGwgdGhlIGFyY2hpdGVjdHVyZXMgdGhh
dCBzdXBwb3J0IEFDUEkgTlVNQSAtIFBlciBTdW5pbCdzIHN1Z2dlc3Rpb24KPiAgIC0gQWRkIGEg
bmV3IHBhdGNoIDUvNiB0byByZW1vdmUgQVJDSCBkZXBlbmRzIG9wdGlvbiBpbiBBQ1BJX05VTUEK
PiAgICAgS2NvbmZpZyBzaW5jZSBhbGwgdGhlIGN1cnJlbnQgYXJjaGl0ZWN0dXJlcyB0aGF0IHN1
cHBvcnQgQUNQSQo+ICAgICB3b3VsZCBzZWxlY3QgQUNQSV9OVU1BIGJ5IGRlZmF1bHQgLSBQZXIg
QXJuZCBhbmQgU3VuaWwncyBzdWdnZXN0aW9uCj4gICAtIE90aGVyIG1pbm9yIGZpeCBmb3IgY29k
ZSBmb3JtYXQgLSBQZXIgU3VuaWwncyBjb21tZW50cwo+Cj4gSGFpYm8gWHUgKDYpOgo+ICAgQUNQ
SUNBOiBTUkFUOiBBZGQgUklTQy1WIFJJTlRDIGFmZmluaXR5IHN0cnVjdHVyZQo+ICAgQUNQSTog
UklTQ1Y6IEFkZCBOVU1BIHN1cHBvcnQgYmFzZWQgb24gU1JBVCBhbmQgU0xJVAo+ICAgQUNQSTog
TlVNQTogQWRkIGhhbmRsZXIgZm9yIFNSQVQgUklOVEMgYWZmaW5pdHkgc3RydWN0dXJlCj4gICBB
Q1BJOiBOVU1BOiBNYWtlIHNvbWUgTlVNQSByZWxhdGVkIHBhcnNlIGZ1bmN0aW9ucyBjb21tb24K
PiAgIEFDUEk6IE5VTUE6IFJlbW92ZSBBUkNIIGRlcGVuZHMgb3B0aW9uIGluIEFDUElfTlVNQSBL
Y29uZmlnCj4gICBBQ1BJOiBSSVNDVjogRW5hYmxlIEFDUEkgYmFzZWQgTlVNQQo+Cj4gIGFyY2gv
cmlzY3YvS2NvbmZpZyAgICAgICAgICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hY3BpLmggfCAgMTUgKysrLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICB8ICAg
MSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyAgICAgIHwgICA1IC0tCj4gIGFyY2gvcmlz
Y3Yva2VybmVsL2FjcGlfbnVtYS5jIHwgMTMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAgICAgfCAgIDQgKy0KPiAgYXJjaC9y
aXNjdi9rZXJuZWwvc21wYm9vdC5jICAgfCAgIDIgLQo+ICBkcml2ZXJzL2FjcGkvbnVtYS9LY29u
ZmlnICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvYWNwaS9udW1hL3NyYXQuYyAgICAgIHwgIDQwICsr
KysrKysrLS0tCj4gIGluY2x1ZGUvYWNwaS9hY3RibDMuaCAgICAgICAgIHwgIDE4ICsrKystCj4g
IGluY2x1ZGUvbGludXgvYWNwaS5oICAgICAgICAgIHwgICA2ICsrCj4gIDExIGZpbGVzIGNoYW5n
ZWQsIDIwMyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3Yva2VybmVsL2FjcGlfbnVtYS5jCj4KPiAtLQo+IDIuMzQuMQo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
