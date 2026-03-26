Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE49E106F2FC
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIlPmpBsddOXTPRSoXKTHeorNCl+AMIG3W5c64k76bw=; b=43QPpy4iX8CzxG
	s/G/b+w6TS84+QKvysOd1uWsrG1frpciwBiFlv5NKjCd0MZRZdwcLO3sKdVT4vv4LDXqQ9q8bdYEj
	bFsn7jtIjUG+Etx6ADcaYIcEoU7K1cox3NUSU3moFeRWqeI68G9OVLCpC1bKftwmcMZFYBPbFlbYR
	5Sbxup2gAyMs/E+0hBEq3SEJIFwzKksXjjwz5MM8nxYVeC5k9zQDUZAxxHqC3+WZGgia88PG0xpkv
	AjZZVKW9ZkhtOTNlXr0k8QBdwBwXdjGhtw7lGYh0F9cQkMJ1LNs9/xF+NWJM3k2unJ/8ry3CBFQHN
	iK7spG/DtNIquGWHUGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5g9J-0000000527g-2UIT;
	Thu, 26 Mar 2026 08:33:05 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5g9G-0000000527A-261s
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:33:03 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7d75ed779bfso543535a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 01:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774513978; cv=none;
        d=google.com; s=arc-20240605;
        b=hpRihBVWzqXk8UjL30U/P5tG04a61KW1ZElTkJ7iRs8Br2ToMavBys2JV2kyLj/9UD
         ntcnhDssqqqrWjPFWPuaMVt/umrJ78nKJgOsKEqRfnXhYEid0AcRedst5AVUA80/lQ60
         RtLreAqHn5jRozzMZcio9+l6TFvv0GgZIbnUCa0kivZUQ7txfD9tIx/SqQVh/4tltmla
         ryT9nfCGBh43RNvv2ge+OWDv3i+frYBlyr200D+v4sH3njhI3KKaNjVi9JoSN2af76bA
         2mou6selwp2UzXwfTLCdJ6Hed7fGqTF1bM/sCe5QGGKxUewelDUFTvMl9/aOgVszHiM8
         bDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mePLymdm4A/01lEY7TSspPJxPyHHrcq2b7WusiYGL2A=;
        fh=R1gecfrYkliSGmfC3gKXtLpmtjKBCfyBAlxrQ9ebY5Y=;
        b=LqZucmhdCHSW/WWQMDR4AimQj5mxB13CTfmCJ0g+HpMmZVf+jGdXbk3QhBPnV7iQZa
         /4K3zpsxD7+gCzXBi6Jfbwv3VCWP3JDhxgYVIQL4Hp3r4CbbDYZFlgCBnW5QSl4Z47SS
         FdKXIDP3wZ82qaqA3CMb+LnUD+0HawbExh8BCv/tSqq0hzJETE1gQupxlsF8SYY4aP0l
         eHciycfu3zt2nOo7UOD8A8fyck9liLdL9xxg59E2a4MhVK9I8aAJLIPZC4YCevDPQJwt
         6xgN/2SCSR7vBv13FgZ8Cq9qJ3eSH0p0sh2s+C1ASiVPiJ+blT25aWFToWhtpJvC/5pq
         uOoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774513978; x=1775118778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mePLymdm4A/01lEY7TSspPJxPyHHrcq2b7WusiYGL2A=;
        b=ViCt2flHbRlqhNn+eSzpZ9IgoUpgldKjBEnM6bWiNUP1gR4wBmtn78IrDek5xjQMq+
         Z/DEiydP3CFWxbeBCT60gyuW5vKySG6qDw4QUrMYZdeAKAT8N/nUA8bHtGJi+xheB0T+
         9oZMnuJzwRmxX6cnzyi5eCUggN6RyaAO1AKHkyzXspvK2OcDpPSrMhKurbCG+1ZriYxT
         jlZo9bGO0mnAITQiSjVIMiImV1bZ4sxZTD7f4+xYlMd0/DMFZSokUteL7GnjOu+lQUqc
         F5RxHW5awXB3q/AeBSNnQWHHvYC9sL3L/T3H65v/bZ2Hhlf1BHv0d9+PTdKsFOeCm6sM
         RGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513978; x=1775118778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mePLymdm4A/01lEY7TSspPJxPyHHrcq2b7WusiYGL2A=;
        b=M1w5SFaEx6Fy71Mw1zGTy0QC5mBkN0GHEKRfbp2l7b/XJsVqnnsPBoqQP7uIuAux2H
         frPEe+xX9lccmyJtWC5xpK28h7D0S2g44IOXyLkPKSQ5xNxFK7UJXYL4kFd48kOGUVQn
         QiuDeCjTBNnRMH+ouoNVBk4JkSOKJHBwiqj6cCNoB+18yWG7E2Eu3fCRzRN4wBtTern+
         MdMGoH42viOwAyzs0pfAsHC4g1JH6irajG2w49Qo5hAymsFoIGLHbrvPUbs9C3yfLdS7
         AgyR93KFsLOxTbQHpZTnQiQtNJsRAUKb1a5pygrfWFz6yK8IYvkWaoN5pAGzu/7SdQPW
         /YCA==
X-Forwarded-Encrypted: i=1; AJvYcCWKLF36gzhVs6c4nPy09J2rj9ViRJYkiZtvJoc8t27fkI9VRXDl3MdVTeEEGgkfkCBlBGeB9lpJhYrn5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZi0h8/hVB2ys8beoIglUgkuZ2HiHI48nQ3rkQYGAmU5xa/laL
	vyVwvdZ8YvsQ/cWY+IqK2bSt7jfLtenywwGT9xDIT+9f/LEAdKmZn91ldgWz/a/9PcIxsGvMxE3
	ZV+WDioMmvNNuU4JMjaBWSy5HTaJdSqm+qUdKS9a9TQ==
X-Gm-Gg: ATEYQzzgJkEAUCTYS4179i/DW5q7mM2nhn3QqHPBEWgxC1CnbrjiyB+QNxX4kAD4Nsi
	p3b2hMHUs+cNPMGM9Jf4JSwhSm54Ma7GbtLyyO/ffhoQHkpDKqmP1KmSFk4fD9D2rOfrbmh2rii
	uMIZFgBqpxwPNO8Kh7zEWh60xS2rt400TfMD5N20+E7Ezg+nZefU9a4scpFLZiiP6mLT6hfMWNE
	8kfIbLnsUY/hD0859Gtg4vqCB8BLJL4w0KDRVIB15JM6cDAJ5uhZareSXm1XW4/DCfgGk+pXAf8
	hnvl/w==
X-Received: by 2002:a05:6830:3988:b0:7d7:de7f:1216 with SMTP id
 46e09a7af769-7d9d6a2ee3fmr4210937a34.34.1774513978540; Thu, 26 Mar 2026
 01:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org> <CAEEQ3wmuAnHU1VBFDwbCBFb8j63ZcizJ3jEC2SiVWnoMPc4=SA@mail.gmail.com>
 <acOFef6f9og1hft2@gen8>
In-Reply-To: <acOFef6f9og1hft2@gen8>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 26 Mar 2026 16:32:47 +0800
X-Gm-Features: AQROBzDH3jYcjM2CiSfjVYp26hEHF6X2ANXFbNRUWifhxguxrWvAlswpTfv9uY4
Message-ID: <CAEEQ3w=zV1k+uea5D9tnO=O5X5LQUpyNVZi8V8TOANxXJQbg=w@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 06/17] RISC-V: QoS: define CBQRI resctrl
 resources and domains
To: Drew Fustini <fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_013302_554945_3E681878 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJld++8jAoKT24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMjo0OeKAr1BNIERyZXcgRnVzdGlu
aSA8ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWFyIDI1LCAyMDI2IGF0
IDEwOjMxOjM5QU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBEcmV3LAo+ID4KPiA+
IE9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IERlZmluZSBkYXRhIHN0cnVjdHVyZXMgdG8g
ZW5jYXBzdWxhdGUgdGhlIHJlc2N0cmwgcmVzb3VyY2UKPiA+ID4gYW5kIGRvbWFpbiBzdHJ1Y3R1
cmVzLgo+ID4gPgo+ID4gPiBDby1kZXZlbG9wZWQtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNj
aWFyZGlAYmF5bGlicmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRp
IDxhcmljY2lhcmRpQGJheWxpYnJlLmNvbT4KPiA+ID4gW2Z1c3Rpbmk6IHJlYmFzZWQgY3VycmVu
dCB1cHN0cmVhbV0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtl
cm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcW9zL2ludGVybmFs
LmggfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNyBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9xb3MvaW50ZXJuYWwuaCBiL2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9pbnRlcm5hbC5oCj4g
PiA+IGluZGV4IGZmMmM3ZWZmNTBiZS4uYzA0MDJkZDA2Y2ZhIDEwMDY0NAo+ID4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9xb3MvaW50ZXJuYWwuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9xb3MvaW50ZXJuYWwuaAo+ID4gPiBAQCAtNjUsNiArNjUsMTEgQEAKPiA+ID4gICNkZWZp
bmUgQ0JRUklfQkNfQUxMT0NfQ1RMX09QX1JFQURfTElNSVQgICAyCj4gPiA+ICAjZGVmaW5lIENC
UVJJX0JDX0FMTE9DX0NUTF9TVEFUVVNfU1VDQ0VTUyAgMQo+ID4gPgo+ID4gPiAraW50IHFvc19y
ZXNjdHJsX3NldHVwKHZvaWQpOwo+ID4gPiArdm9pZCBxb3NfcmVzY3RybF9leGl0KHZvaWQpOwo+
ID4gPiAraW50IHFvc19yZXNjdHJsX29ubGluZV9jcHUodW5zaWduZWQgaW50IGNwdSk7Cj4gPiA+
ICtpbnQgcW9zX3Jlc2N0cmxfb2ZmbGluZV9jcHUodW5zaWduZWQgaW50IGNwdSk7Cj4gPiA+ICsK
PiA+ID4gIC8qIENhcGFjaXR5IENvbnRyb2xsZXIgaGFyZHdhcmUgY2FwYWJpbGl0aWVzICovCj4g
PiA+ICBzdHJ1Y3QgcmlzY3ZfY2JxcmlfY2FwYWNpdHlfY2FwcyB7Cj4gPiA+ICAgICAgICAgdTE2
IG5jYmxrczsgLyogbnVtYmVyIG9mIGNhcGFjaXR5IGJsb2NrcyAqLwo+ID4gPiBAQCAtMTI1LDQg
KzEzMCwyNiBAQCBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlciB7Cj4gPiA+ICAgICAgICAgYm9vbCBt
b25fY2FwYWJsZTsKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICtzdHJ1Y3QgY2JxcmlfcmVzY3RybF9y
ZXMgewo+ID4gPiArICAgICAgIHN0cnVjdCByZHRfcmVzb3VyY2UgICAgIHJlc2N0cmxfcmVzOwo+
ID4gPiArICAgICAgIHN0cnVjdCBjYnFyaV9jb250cm9sbGVyIGNvbnRyb2xsZXI7Cj4gPiA+ICsg
ICAgICAgdTMyIG1heF9yY2lkOwo+ID4gPiArICAgICAgIHUzMiBtYXhfbWNpZDsKPiA+ID4gK307
Cj4gPiA+ICsKPiA+ID4gK3N0cnVjdCBjYnFyaV9yZXNjdHJsX2RvbSB7Cj4gPiA+ICsgICAgICAg
c3RydWN0IHJkdF9kb21haW5faGRyICAgICAgIHJlc2N0cmxfZG9tX2hkcjsKPiA+ID4gKyAgICAg
ICBzdHJ1Y3QgcmR0X2N0cmxfZG9tYWluICByZXNjdHJsX2N0cmxfZG9tOwo+ID4gPiArICAgICAg
IHN0cnVjdCByZHRfbW9uX2RvbWFpbiAgIHJlc2N0cmxfbW9uX2RvbTsKPiA+ID4gKyAgICAgICB1
NjQgY2JtOwo+ID4gPiArICAgICAgIHU2NCByYndiOwo+ID4gPiArICAgICAgIHU2NCAqY3RybF92
YWw7Cj4gPiA+ICsgICAgICAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKmh3X2N0cmw7Cj4gPiA+
ICt9Owo+ID4gPiArCj4gPgo+ID4gQ2FuIHdlIHRyaW0gZG93biBzb21lIGZpZWxkcz8gRm9yIGV4
YW1wbGU6Cj4gPiAgc3RydWN0IGNicXJpX3Jlc2N0cmxfcmVzIHsKPiA+ICAgICAgICAgc3RydWN0
IHJkdF9yZXNvdXJjZSAgICAgcmVzY3RybF9yZXM7Cj4gPiAtICAgICAgIHN0cnVjdCBjYnFyaV9j
b250cm9sbGVyIGNvbnRyb2xsZXI7Cj4gPiAgICAgICAgIHUzMiBtYXhfcmNpZDsKPiA+ICAgICAg
ICAgdTMyIG1heF9tY2lkOwo+ID4gIH07Cj4gPgo+ID4gIHN0cnVjdCBjYnFyaV9yZXNjdHJsX2Rv
bSB7Cj4gPiAtICAgICAgIHN0cnVjdCByZHRfZG9tYWluX2hkciAgICAgICByZXNjdHJsX2RvbV9o
ZHI7Cj4gPiAgICAgICAgIHN0cnVjdCByZHRfY3RybF9kb21haW4gIHJlc2N0cmxfY3RybF9kb207
Cj4gPiAgICAgICAgIHN0cnVjdCByZHRfbW9uX2RvbWFpbiAgIHJlc2N0cmxfbW9uX2RvbTsKPiA+
IC0gICAgICAgdTY0IGNibTsKPiA+IC0gICAgICAgdTY0IHJid2I7Cj4gPiAgICAgICAgIHU2NCAq
Y3RybF92YWw7Cj4gPiAgICAgICAgIHN0cnVjdCBjYnFyaV9jb250cm9sbGVyICpod19jdHJsOwo+
ID4gIH07Cj4KPiBDYW4geW91IGV4cGxhaW4gd2h5IHlvdSBkb24ndCB0aGluayB0aGVzZSBhcmUg
bmVlZGVkPz8KClRoZSBmdW5jdGlvbmFsaXR5IHdvcmtzIHdlbGwgd2l0aG91dCB0aG9zZSBmaWVs
ZHMsIGZlZWwgZnJlZSB0byB0cnkuCgpCdHcsIHdoZW4gZG8geW91IHBsYW4gdG8gc2VuZCB0aGUg
bmV4dCByZXZpc2lvbj8KCj4KPiBUaGFua3MsCj4gRHJldwo+CgpUaGFua3MsCll1bmh1aQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
